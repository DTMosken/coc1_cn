package classes.scenes.npcs
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.items.undergarments.NobleShirt;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class ArianScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public function ArianScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function youLikeGirlsNotSickLizardDudes() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他你更喜欢女性……阿瑞安满怀期待地看着你。[say: 那……如果我是女孩子……你就不介意了？]");
         outputText("[pg]你若有所思地挠了挠下巴，告诉他如果他是女孩子，你当然一点也不介意。[say: 好吧……我……我会做的！]");
         outputText("[pg]你挑起眉毛。他打算做什么？");
         outputText("[pg]阿瑞安站起身，脱下长袍，把自己完全暴露出来，然后慢慢走到工作桌前，拉开一个抽屉。他伸手进去，拿出一个神秘的瓶子，瓶身上贴着粉色蛋形的标签。他转头看向你，拔掉瓶塞，接着把整瓶都喝了下去。");
         outputText("[pg]药效几乎一瞬间就开始发作。他刚把瓶子放回抽屉，就瘫倒在旁边的椅子上。一开始你还考虑要不要叫人帮忙，但当你看见阿瑞安的肉棒正以肉眼可见的速度缩小，很快没入生殖裂隙深处时，这个念头立刻从脑海里消失了。他的肉棒一消失，生殖裂隙便合拢起来，皮肤连在一起，胯间只剩下光滑的" + (get_noFur() ? "皮肤" : "鳞片") + "；而更下方，在他的——或者现在该说她的？——双腿之间，另一道裂缝打开了，很快向两侧张开，一颗勃起的小阴蒂从湿润的褶皱中探了出来。淫液渗出，打湿了木椅；雌性发情的气味充满了小小的卧室，你感觉血液正涌向你的[cocks]。");
         outputText("[pg]不过变身还没有结束；一声从喉间溢出的女性娇吟之后，一对小巧挺翘的乳房隆起，上面还有敏感的小乳头。你恍惚地看着变化完成：阿瑞安的脸变得更柔和、更圆润，也更像女孩子；她的身体也同样变化着，髋部变宽，屁股也变大，变得更加丰满迷人，赋予她一副纤细却美丽的身材。");
         outputText("[pg]她带着紧张的笑容问道，[say: 那、那么？我现在看起来怎么样……？]");
         outputText("[pg]你懒得回答；你走到她身边扶她起来，然后一边开始脱衣服，一边轻轻把她推向床。阿瑞安笑了笑，躺了下来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,944,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,940,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,941,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,938,0);
         menu();
         addButton(0,"下一步",penetrateArian);
      }
      
      public function youDontMindBeingGayForArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他，你对男性没意见，只要够可爱就行。你冲他笑了笑。[say: 你……你真的觉得我可爱吗？]");
         outputText("[pg]你点点头，毕竟不是每天都能看到一个成年男人表现得像个无可救药的处男。一提到“处男”这个词，阿瑞安就往后一缩……你对这个反应有些惊讶，便问他是不是真的还是处男。");
         outputText("[pg]阿瑞安又把脸藏进被子里，低声说，[say: 是的……]");
         outputText("[pg]好吧，那看来我们得解决一下这个问题了。你把被子从他脸上拉开。从他的床上下来后，你开始脱下自己的[armor]。阿瑞安也害羞地照做了，脱掉身上的长袍，直到他一丝不挂地躺在床上。[pg]");
         menu();
         if(get_player().hasCockThatFits(50))
         {
            addButton(0,"插入",giveArianAnal);
         }
         else
         {
            addButtonDisabled(0,"插入","此场景需要你拥有合适的阴茎。");
         }
         addButton(1,"被插入",getButtWreckedByArian);
      }
      
      public function yesYouButtslutIllFuckYou() : void
      {
         clearOutput();
         arianSprite();
         outputText("你怎么可能拒绝这样的请求？你让[Arian em]脱光，做好准备。");
         outputText("[pg]阿瑞安立刻照做，兴奋地脱掉衣服，躺到床上，一边来回摆动[Arian eir]尾巴，一边等着你也照做。");
         menu();
         addButton(0,"继续",giveArianAnal);
      }
      
      public function yesPlotSexArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你走向那个笨拙地向你示爱的蜥蜴人，伸手环住[Arian eir]脖子。你凑近[Arian eir]耳边，轻声告诉[Arian em]，[Arian ey]只要开口问就好了。");
         arianSexMenu(false);
      }
      
      public function yesArianShouldMagicTeach() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉[Arian em]，这听起来很有意思。你很想学会像[Arian ey]那样施放法术，也很感谢[Arian ey]愿意收你当学徒。尤其是[Arian ey]明明已经有那么多学生要忙。阿瑞安挠了挠[Arian eir]后颈。[say: 抱歉，[name]。但我其实没法教你像我这样施放法术……那得花上好几年才能学会，更别说还非常危险；我是说，看看它把我变成什么样了……] [Arian Ey]对你微笑。[say: 不过，我还是可以教你一些关于魔法的通识——比如如何施放更多法术，如何让法术更强大，每个法术背后的原理……基本上，就是一些或许能帮助你进行魔法研究的理论。我整个童年都埋在书堆里，所以我相信自己总能帮上你一点忙。]");
         outputText("[pg]你坏笑着指出，这基本上就是你的意思，不过无论如何你都肯定还是很感兴趣。阿瑞安开心地点点头。[say: 好，那就从哪里开始呢……]");
         menu();
         addButton(0,"继续",arianMagicLessons);
      }
      
      public function wakeUpAfterArianSleep() : void
      {
         arianSprite();
         clearOutput();
         if(get_player().hasCock())
         {
            if(arianMF("m","f") == "f")
            {
               get_images().showImage("arianfemale-camp-dreamingArian");
            }
            else
            {
               get_images().showImage("arianmale-camp-dreamingArian");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
            {
               outputText("你睁开眼睛，突然意识到自己刚才做的那些梦……已经全都消散了。你注意到身旁仍在熟睡的蜥蜴人，回想起昨晚发生的事。你不禁好奇，阿瑞安会不会记得那些……");
               outputText("[pg]你从床上起身，开始舒展肌肉，活动关节，让自己彻底清醒过来。就在你这么做的时候，那个蜥蜴人也大声打了个哈欠，慢慢醒了过来。阿瑞安揉着[Arian eir]的眼睛，开口说道：[say: 早啊，[name]。睡得好吗？][Arian ey]转头看向你，随即猛地把[Arian emself]藏进了被子里。");
               outputText("[pg]你对[Arian em]咧嘴一笑，也向[Arian em]问了同样的话，并向[Arian em]保证你确实睡得很好。哎呀，[Arian ey]怎么这么害羞？你们俩早就过了会因为在彼此面前赤身裸体而害臊的阶段了。");
               outputText("[pg]阿瑞安的脑袋从被子下面探了出来。[say: 我想你说得对……不过那东西看起来还是很壮观，][Arian ey]指着你勃起的肉棒说道");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("。");
               outputText("[pg]好吧，阿瑞安确实给了你一个让它长出来的充分理由。你告诉[Arian em]，就算在睡梦中，[Arian ey]也是个撩人的高手。");
               outputText("[pg]阿瑞安露出歉意的笑容。[say: 抱歉……我不是故意要挑逗你什么的，[name]。你想让我帮你处理一下吗？]");
               outputText("[pg][say: 嗯，如果你这么愿意的话，]你告诉[Arian em]。不过你脸上的笑意已经明摆着说明，你很欢迎这位蜥蜴人玩伴给你一点照顾。");
               outputText("[pg][say: 好吧！坐下，][Arian ey]说着站起身，朝[Arian eir]的床示意。");
               outputText("[pg]你很快就明白了这个蜥蜴人在打什么主意，于是笑着照做，露出胯间，好让[Arian em]能更方便地靠近。");
               outputText("[pg]阿瑞安立刻用鼻尖蹭上你的[cocks]，用[Arian eir]的脸在");
               if(get_player().cockTotal() == 1)
               {
                  outputText("它");
               }
               else
               {
                  outputText("它们");
               }
               outputText("上毫不害臊地蹭来蹭去，直到你的[cock biggest]顶端渗出一滴前液。[say: [name]？]你刻意发出一声呻吟，把自己有多享受表现得更明显，好让阿瑞安看个明白，同时朝[Arian em]笑了笑。[say: 谢谢你的早餐，][Arian ey]笑着说道，随后便把你的整根[cock]含过[Arian eir]的嘴唇，送进[Arian eir]的喉咙深处。你忍不住轻笑起来，拍了拍[Arian em]的脑袋。");
               outputText("[pg]蜥蜴人法师一边在你的肉棒上上下吞吐，一边尽可能抬眼看向你，试图判断你的反应，确认[Arian ey]给你口交得够不够好。你笑着让[Arian em]清楚知道你很享受，随后发出一声低沉的呻吟；你的晨勃随着一股不小的精液爆发而软了下来，尽数射进蜥蜴人吮吸着的嘴里。");
               outputText("[pg]阿瑞安惊讶地瞪大了眼睛，[Arian ey]开始认真吞咽起来，还愉悦地呻吟着——事实证明这可不是什么好主意……一声格外绵长的呻吟刚过，[Arian ey]试着吞下去，结果却呛住了。一些精液经由[Arian eir]鼻子从[Arian em]体内呛了出来，[Arian ey]连忙退开，咳嗽不止。对[Arian em]来说不幸的是，你还在射；结果就是，即便[Arian ey]一边干呕一边咳呛，你依旧不断把精液喷满[Arian eir]的脸，直到彻底射空。你松了口气，随后带着一丝歉意，问阿瑞安[Arian ey]还好吗？");
               outputText("[pg][Arian ey]抹掉[Arian eir]眼睛上的你的精液，说道：[say: 我没事……是我该更小心一点……至于颜射也别担心，我只需要一点时间把自己弄干净。][Arian ey]站起身，走向[Arian ey]放在附近的一只装满水的壶。");
               outputText("[pg]你安静地起身，穿好衣服，准备迎接又一个作为勇者的忙碌日子。离开时，你忍不住注意到，你的蜥蜴人恋人正舔掉[Arian eir]脸上的精液，再用水送下去，而不是把[Arian em]自己洗干净。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
            {
               outputText("你大大打了个哈欠，睁开眼，意识到突如其来的清醒已经把梦境驱散了。阿瑞安似乎还在睡；你花了片刻贴近蜷成一团的蜥蜴人，把自己勃起的肉棒沿着[Arian eir]的臀缝蹭上去。尽管先前你已经软下来，并从蜥蜴人温暖的体内滑了出来，但现在仍不得不应付晨勃……于是你尽职尽责地在蜥蜴人的臀瓣之间蹭动起来，用凸起的肉棒顶着[Arian eir]尾巴根部。");
               outputText("[pg][say: 嗯，我已经醒了，别再戳我了，]阿瑞安抗议道，一边揉着[Arian eir]惺忪的眼睛，一边转过头越过[Arian eir]肩膀看向你。[say: 早啊，[name]。你不用一直在我尾巴下面戳来戳去叫我起床，][Arian ey]有些不高兴地说道。随后[Arian ey]意识到你的双手还忙着抱住[Arian em]，所以顶着[Arian em]的东西是……[say: 哦！抱歉，[name]！我还以为你想要什么……我是说，也许你确实想要点什么？][Arian ey]紧张地朝你笑了笑。");
               outputText("[pg]你故意抿起嘴。你觉得，问题也许在于阿瑞安想不想做点什么？毕竟，[Arian ey]昨晚给你的信号可相当暧昧不明……");
               outputText("[pg][say: 暧昧不明的信号？我晚上做了什么吗！？][Arian ey]担心地问道。");
               outputText("[pg]嗯，你告诉[Arian em]，一开始[Arian ey]表现得好像真的、真的很想让你狠狠干[Arian eir]的屁股。然后，就在你被撩得热血上头、准备开干的时候，[Arian ey]却突然停下了。所以你只能在硬得发胀的情况下努力重新入睡。你告诉[Arian em]，这实在挺恼人的。");
               outputText("[pg][say: 哦……呃……抱歉。我大概是在说梦话。这种事不太常发生，不过……抱歉，我不是有意白白把你撩得欲火焚身的。]");
               outputText("[pg]你告诉[Arian em]，这算是个好的开始。不过，你觉得阿瑞安也许想和你一起解决这根晨勃，嗯？如果你把[Arian em]紧紧抱住，然后狠狠干[Arian eir]的屁股一顿，[Arian ey]会喜欢吗？");
               outputText("[pg]阿瑞安挠了挠[Arian eir]下巴，紧张地笑了笑。[say: 嗯，如果你想的话，我倒是不反对。]");
               outputText("[pg]你立刻把这个蜥蜴人紧紧搂住，脸上带着笑，已经把你的[cock smallest]朝着" + arianMF("他顽皮的小男穴","她的尾穴") + "引过去。你故意逗弄般地自言自语：刚才是谁说过你会给[Arian em]拒绝的选择来着？");
               outputText("[pg]阿瑞安被你突然抓住，稍稍吓了一跳，但[Arian ey]并没有反抗，反而调整好[Arian emself]的姿势，好让你能轻松进入[Arian eir]的菊蕾。[say: 糟了！我还以为把你撩得这么兴奋之后，自己还能逃过惩罚呢，]阿瑞安笑着回答。");
               outputText("[pg]你不再浪费时间，坚定地挤进那个让你如此着迷的穴口。这个蜥蜴人紧致的肌肉美妙地夹住、挤压着你，而你也在不真正弄疼[Arian em]的前提下，尽可能又快又狠地来回抽插。");
               outputText("[pg][say: 啊……[name]，你真的很会弄我的屁股，对吧？嗯……要是以前有人告诉我肛交会这么舒服，我肯定会说他们疯了，可是——哦！……你这根美妙的肉棒真的好舒服。]阿瑞安叹息着，开始迎合你的动作向后顶来。[say: 没有什么比这样和你做爱，更适合迎接接下来一整天了，][Arian ey]梦呓般说道。");
               outputText("[pg]你一边挺动，一边呻吟、低吼，沉溺在与这位喜爱被肛交的爬行类恋人的性爱快感中。最终，该来的还是来了；伴随着最后一声喊叫，你把滚烫的精液射进了阿瑞安的尾穴深处。");
               outputText("[pg][say: 哈啊……我能感觉到你的种子把我填满了，用你美妙的白浆冲刷着我的屁股！啊，[name]……我爱你。我们以后应该多来几次！]当你又挺了几下，把[Arian eir]的屁股灌满精液时，阿瑞安愉悦地说道。");
               outputText("[pg]你告诉阿瑞安，也许你们确实该多来几次。你们两人又相拥了一会儿，享受着这个清晨的余韵，直到阿瑞安打破沉默。[say: 也许我们该准备迎接今天了？虽然我也不介意一整天都这样待着。]");
               outputText("[pg]你表示同意，然后带着一片狼藉从这个蜥蜴人紧致的屁股里抽身出来，从恋人背上起身，舒展僵硬的肌肉。阿瑞安也照做，同时小心地把[Arian eir]的屁股尽量夹紧，免得你先前留下的东西流出来。[say: 喂，[name]。你现在穿衣服的话，衣服会被弄脏的。所以，不如先把那东西清理干净？]这位蜥蜴人法师指着你沾满精液的肉棒说道。");
               outputText("[pg]你同意这个蜥蜴人的说法，开始四处寻找方便擦拭自己的布巾。但还没等你找到，你就感觉一张熟悉的蜥蜴人的嘴含住了你的肉棒，并认真地吸吮起来，确保把你的肉棒清理得干干净净，哪怕你又开始勃起。伴随着一声湿滑的吸吮声，阿瑞安松开了你的肉棒，让它在清晨微凉的空气中晃动，而[Arian ey]则对你咧嘴一笑，用[Arian eir]的手背擦了擦嘴。[say: 好了。我帮你清理干净了。][Arian Ey]咧嘴笑道。");
               outputText("[pg]你轻笑着，点了点这个狡猾的小蜥蜴的[Arian eir]鼻子，指出[Arian ey]确实是这么做了，可现在[Arian ey]又把你弄硬了。所以你这样该怎么办？虽然听起来很诱人，但你总不能整天都埋在[Arian eir]紧致的小屁股里。为了强调这一点，你在这个蜥蜴人最近的那瓣屁股上狠狠拍了一下，让一团精液从[Arian eir]被用过的尾穴里淌了出来。");
               outputText("[pg]阿瑞安叫了一声，赶紧把[Arian eir]双手移到身后堵住那里。[Arian ey]看着你，有些紧张地笑了笑。[say: 对不起，[name]。我没忍住。它看起来太美味了，][Arian ey]还特意舔了舔[Arian eir]的嘴唇。");
               outputText("[pg]你笑着轻哼了一声；作为一位受人尊敬的法师，阿瑞安居然还有这么变态的一面，而你也这样告诉了[Arian em]。看着[Arian ey]露出尴尬的神情，你叹了口气，宣布自己也只能忍受了，然后开始重新穿衣服。");
               outputText("[pg][say: 抱歉啦。如果你愿意的话，我之后会补偿你的，][Arian ey]一边提议，一边走向一个小衣柜去拿毛巾。你告诉[Arian em]，你可会记住[Arian em]这句话，然后穿好衣服，出门开始新的一天。");
            }
            else
            {
               outputText("你突然有股想要挺动的冲动，并因此醒了过来，却发现自己仍然深深埋在这个贪婪蜥蜴人放荡的菊蕾里。回想起昨晚，以及夜里那次小小的快餐，你笑了笑。难怪你今天早上觉得格外神清气爽。[Arian Eir]贪婪的屁股就和夜里一样黏人……不肯放松，更不肯让你的肉棒离开。");
               outputText("[pg]好吧，既然[Arian ey]真的那么渴望被干屁股……你用双臂环住这位爬行类恋人的腰，既是亲昵，也是为了稳住自己的位置，然后开始挺动腰胯，把你的晨勃一下一下送进恋人那被你纵容出来、永不满足的屁眼里。");
               outputText("[pg]阿瑞安呻吟起来，也开始向后迎合；接着，在你抽插了几下后，[Arian ey]睁开了[Arian eir]的眼睛。[say: 哦……[name]？哦！这感觉好舒服……你、你在做什么？]");
               outputText("[pg]只是给[Arian em]明显很想要的东西而已，你心不在焉地回答；你正渐渐进入舒服的节奏，可不想就这么断掉。");
               outputText("[pg]阿瑞安呻吟着，开始急切地向后顶来。[say: 哦……这个姿势你可能会更舒服。][Arian Ey]在床上翻了个身，直到[Arian ey]脸朝下埋进[Arian eir]的枕头里，而[Arian eir]的屁股和尾巴高高翘起，让你能完全占有[Arian eir]那急切的屁股。");
               outputText("[pg]如果你不是已经埋在[Arian em]体内了，你肯定会直接扑进[Arian eir]的屁股里。于是你加倍用力，细细品味你这个小屁股荡货后穴里美妙的内壁，以及[Arian eir]如今有意榨取你肉棒精液的动作。");
               outputText("[pg][say: 嗯……更用力……更快，]阿瑞安在愉悦的呻吟间央求道。你觉得没有理由拒绝[Arian em]，于是加快节奏，拼尽全力粗暴地顶撞[Arian em]。");
               outputText("[pg]伴随着一声呻吟，你感觉[Arian eir]的括约肌收缩，把你拉得更深。低头一看，你发现");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText(arianMF("他的","她的") + "小穴正把[Arian eir]的淫液喷得你下半身到处都是");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
                  {
                     outputText("，而");
                  }
                  else
                  {
                     outputText("；");
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
               {
                  outputText(arianMF("他那","她那") + "");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
                  {
                     outputText("两根肉棒正");
                  }
                  else
                  {
                     outputText("肉棒正");
                  }
                  outputText("将一道道白色的蜥蜴人精液射得床单上到处都是；");
               }
               outputText("真是个淘气的小蜥蜴人。");
               outputText("[pg]你忍不住开玩笑地逗阿瑞安，说[Arian ey]真是个离不开屁股的小骚货。");
               if(!get_player().hasVagina())
               {
                  outputText("难道[Arian ey]一直都知道[Arian ey]想让男人压在上面干[Arian em]，还是说这是[Arian em]最近才觉醒的？");
               }
               else
               {
                  outputText("被一个有着[Arian eir]自己鸡巴的女孩，把[Arian em]当成女孩子一样干，[Arian ey]真的会爽到吗，嗯？");
               }
               outputText("[pg][say: 没有……但我就是喜欢！请用你的种子填满我吧！] 阿瑞安恳求着，呻吟着，急切等待你的倾注。");
               outputText("[pg]你又顶进[Arian em]体内三次，接着发出一声低吼，尽可能把所有精液都释放出来，满足你可爱的小屁股骚货的渴求。而这一次，你也终于能好好专注于射精了。");
               if(get_player().cumQ() <= 200)
               {
                  outputText("[pg]今天的第一股精液从你的顶端喷涌而出，涂满了那急切的蜥蜴人体内。[say: 啊……就是这样，] 阿瑞安说道，舌头因快感垂在外面，而你的肉棒也在[Arian em]体内完成了跳动和喷射。");
               }
               else if(get_player().cumQ() <= 750)
               {
                  outputText("[pg]一股接一股的精液从你的家伙里射出，把蜥蜴人的肠道染成白色，作为你们清晨纵情的成果，甚至让[Arian eir]的肚子微微鼓起。[say: 噢，太棒了……早餐……哈，] 阿瑞安说道，舌头因快感垂在外面，用后穴吞下你积攒的精液。");
               }
               else
               {
                  outputText("[pg]一场真正的喷发从你肉棒深处爆开，自顶端倾泻而出，用[Arian ey]渴望的成果灌满了这个爱被肛的蜥蜴人。[say: 太棒了！最棒的……早晨……] [Arian ey]说道，彻底沉浸在极乐之中，舌头垂在外面；你那多得惊人的精液把[Arian em]像气球一样撑了起来。");
               }
               outputText("[pg][say: 嗯……[name]，我喜欢这样醒来。今晚再和我一起睡怎么样？] 阿瑞安建议道，在余韵中微笑着。");
               outputText("[pg]你沉默片刻，只专心把肉棒从蜥蜴人的屁股里拔出来。等你抽身出来，便玩闹似的拍了拍[Arian em]的屁股，告诉[Arian em]你会考虑的。");
               outputText("[pg][say: 嗯……请一定要考虑……] 阿瑞安张大嘴打了个哈欠。[say: 还是有点困。如果你不介意的话，我想现在小睡一会儿。]");
               outputText("[pg]你轻笑一声，说阿瑞安真是条懒洋洋的小蜥蜴，一边亲昵地抚摸[Arian eir]的头，然后穿好衣服，离开这里开始新的一天。");
            }
            get_player().orgasm("Dick");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("你打着哈欠醒来，仍依偎在你那鳞片覆身的睡伴身边。你轻手轻脚地下了床，好好伸了个懒腰，享受着这份感觉，同时尽量不吵醒阿瑞安。没过多久，蜥蜴人也张开满是牙齿的大嘴，打了个大大的哈欠。[Arian ey]揉去眼里的睡意，四下张望，直到看见你。[say: 早上好，[name]！][Arian ey]开心地说道，也起身懒洋洋地伸了个懒腰。[say: 睡得好吗？]");
            outputText("[pg]你告诉[Arian em]你睡得很好，又问[Arian ey]是否也喜欢让你睡在[Arian eir]床上。[say: 喜欢！我真的很高兴你能陪我过夜。][Arian Ey]咧嘴一笑，灵活的尾巴在身后懒懒地摆动着。");
            outputText("[pg]你回答说，既然如此，你说不定会考虑更常和[Arian em]一起睡。说这话时你冲[Arian em]眨了眨眼，有点希望[Arian ey]会脸红——那模样看起来实在很有意思。阿瑞安没有让你失望，[Arian eir]脸颊微微泛起玫瑰色，身体也有些坐立不安。[say: 我希望你能常来，][Arian ey]回答道，脸上依旧带着笑。[say: 也许我们该准备开始今天了？]");
            outputText("[pg]你告诉[Arian em]这是个好主意，然后开始摸索着找自己的东西。然而，和[Arian eir]刚才的提议完全相反，你忽然感觉到一双手搭上了你的腰，温热的呼吸拂在你的腰背下方。你有些惊讶，但并不抗拒，于是把臀部向后送进[Arian em]怀里，随即听见[Arian em]感激地呻吟了一声。");
            outputText("[pg]看来，在处理掉这个问题之前，你这一天是没法开始了。于是[if (hasvagina) {，你转过身，用[arms]环住|你的[hands]向后伸向}] [Arian eir]的头，把这个蜥蜴人拉近。阿瑞安发出一声小小的惊叫，但很快就适应过来，把[Arian eir]的[if (nofur){鼻子|吻部}]贴上你的胯间。你倒吸一口气，不过也很快适应了那[if (nofur){皮肤|鳞片}]贴着你[if (nofur){[if (hasplainskin) {自己的|[skindesc]}]|[if (hasscales) {自己的|[skindesc]}]}]的感觉。");
            outputText("[pg]然而，就在你刚掌握住局面时，你感觉到某个湿滑的东西蹭过你的[if (hasvagina){小缝|褶口}]，你几乎只能勉强保持[if (singleleg){直立|站稳}]。幸好阿瑞安体贴又温柔，所以[Arian ey]一开始只是沿着你的入口缓慢而长久地舔舐。当[Arian eir]灵巧的舌头终于分开你的肉唇滑入其中时，你已经觉得自己被充分挑逗开了。");
            outputText("[pg]这位欲火中烧的法师兴致勃勃地投入其中，急切地吮吸着你的[if (hasvagina){淫液|后穴}]，脸上露出陶醉的神情。每隔一会儿，[Arian eir]的舌头就会抽出来，爱抚你的[if (hasvagina){[clit]|会阴}]，而每一次都让你颤抖得厉害，几乎让[Arian ey]抓不稳你。但[Arian ey]的本事可不止如此，你意识到，[Arian eir]娴熟的服侍正慢慢将你哄入一阵欣快的恍惚之中。");
            outputText("[pg]高潮来得太快，可你没有任何理由忍耐，于是彻底放开[if (hasvagina) {，任由你的阴液[if (issquirter){喷涌|流淌}]进[Arian eir]口中|把你的[hips]向后顶向[Arian eir]的脸}]。快感冲刷全身，你几乎要弯下腰去，而阿瑞安光溜溜的头抵在你的腹部，让这份感觉变得更加强烈。整个过程中，蜥蜴人的舌头从未停下，仍从内侧不断抚弄着你抽搐的褶皱。");
            outputText("[pg][Arian Eir]稳稳的双臂支撑着你，让你在[Arian em]上方摇晃呻吟时不至于倒下，这场高潮在无法衡量的极乐中持续着。终于，最后一波余韵掠过你绷到发麻的神经，你几乎当场瘫倒。不过，阿瑞安尽力帮你撑过这一切，温柔地抚摸你的四肢，直到你的呼吸平稳下来。直到这时，你才得以重新收拾自己的东西，为接下来的一天做好准备。");
            outputText("[pg]等你们都穿戴整齐后，阿瑞安对你微微一笑。[say: [name]，祝你今天过得愉快……也请尽快来看我。]你答应[Arian em]一定会来，然后开始往外走。");
            outputText("[pg][say: 等等！在你走之前，你能不能……算了……]蜥蜴人有些坐立不安地转过身，朝[Arian eir]的工作桌走去。你脸上带着会心的坏笑，走回去抓住[Arian em]的肩膀，强硬地把[Arian em]转过来，吻得[Arian em]晕头转向。你停顿片刻，欣赏着爱人脸上那副幸福得发怔、呆乎乎的表情，然后转身离开，开始又一天的生活。");
            get_player().orgasm("Generic");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("你打着哈欠醒来，仍依偎在你那鳞片覆身的睡伴身边。你轻手轻脚地下了床，好好伸了个懒腰，享受着这份感觉，同时尽量不吵醒阿瑞安。没过多久，蜥蜴人也张开满是牙齿的大嘴，打了个大大的哈欠。[Arian ey]揉去眼里的睡意，四下张望，直到看见你。[say: 早上好，[name]！][Arian ey]开心地说道，也起身懒洋洋地伸了个懒腰。[say: 睡得好吗？]");
            outputText("[pg]你说睡得很好，又问[Arian ey]是不是也睡得不错。蜥蜴人没有回答，而是咬住[Arian eir]下唇，开始局促不安，看起来像是有些害羞。你问[Arian em]怎么了，而你的表情清楚地表明，在[Arian ey]说出来之前，你哪儿也不会去。");
            outputText("[pg][say: 嗯，我确实睡得很好。只是我还做了个最奇怪的……梦。][Arian Ey]咽了口唾沫，声音清晰可闻。哦？那是个什么样的梦？你用玩笑般的语气问道，但你觉得自己已经大概猜到了……");
            outputText("[pg][say: 呃……就是，我当时……然后……我……被人……做了些事……][Arian ey]紧张地解释道。");
            outputText("[pg]你摇摇头，告诉[Arian em]你一个字都没听懂。蜥蜴人局促地重新整理了一下思绪，又开始解释。[say: 我、我梦见自己是……嗯……一个松饼，然后……呃……我需要馅料，可那个面包师一直拿错针来逗我，把它们放进我的……下面……而且……嗯……没有奶油……所以……呃……]蜥蜴人羞得无以复加，终于不再说话，只是摆弄着[Arian eir]的手指，白皙的脸颊染上了害羞时特有的玫瑰粉色。");
            outputText("[pg]你笑了笑，忍不住用手指抚过蜥蜴人依旧赤裸的屁股，捏了捏[Arian eir]圆润饱满的臀肉，又摩挲着[Arian eir]那淫荡的臀缝，只为了看看[Arian ey]\'ll]会有什么反应。阿瑞安呜咽一声，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText(arianMF("他那","她那") + "");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) >= 3)
               {
                  outputText("裸露的");
               }
               outputText("球根状的肉茎");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("开始");
               }
               else
               {
                  outputText("开始");
               }
               outputText("勃起起来");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) < 3)
               {
                  outputText("，让");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 1)
                  {
                     outputText("它的顶端");
                  }
                  else
                  {
                     outputText("它们的顶端");
                  }
                  outputText("从阿瑞安的生殖裂缝中探出来");
               }
               outputText("。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("和[Arian eir]湿润的小穴之间，开始汇成一股淫液，沿着阿瑞安大腿内侧缓缓流下；但由于这个蜥蜴人此刻体温升高，还没滴到地板上就蒸发了。");
            }
            outputText("[Arian Ey]喘息着，眼神迷离。[say:呃啊……[name]……]");
            if(get_player().hasVagina())
            {
               outputText("[pg]你没有回答，而是俯身贴近这个喘不过气的蜥蜴人。[Arian Ey]睁大眼睛仰望着你，依然相当慌乱，不过没关系，你很乐意来主导。反正也不用脱衣服，你只是把身体压到[Arian eirs]身上，感受着[Arian eir]的热度，直到一阵颤抖催促你继续下去。");
               outputText("[pg]一开始，你只是用自己的[skindesc]在[Arian em]身上磨蹭，同时慢慢调整你的[legs]，好让真正的目标更方便贴上去。还没等阿瑞安意识到你想做什么，你就把自己的穴口抵在" + arianMF("他的阴茎","她的私处") + "上，令一阵冲击同时掠过你们两人的身体。");
               outputText("[pg]你先一步回过神，于是开始动起来。你流出的淫液与这个蜥蜴人的体液混在一起，形成了充足的润滑，让你想怎么挺动都可以。而你也确实这么做了，从你的恋人口中逼出一声声呻吟；与此同时，[Arian eir]" + arianMF("充血胀大的肉棒","泛红的阴唇") + "也开始在你身下跳动。[Arian ey]如此投入的样子实在令人愉悦，几乎——但还差一点——能比得上你自己身体里奔涌的快感。");
               outputText("[pg]但这还不够。你更用力地压下身子，" + arianMF("用自己的阴唇包住他的阴茎","给这个颤抖的蜥蜴人一个淫荡至极的吻") + "。姿势的改变让你现在可以直接用阴蒂摩擦[Arian em]，你自然不会放过这个机会。尽管如此，你也没有忽略伴侣的快感，一边爱抚着[Arian eir]的胸口，一边让[Arian eir]的呻吟声充满这片暧昧的空气。");
               outputText("[pg]一阵游走于你核心的颤栗表明你快到了，但你仍然希望这能持续得更久一点。然而，阿瑞安突然给了你一个惊喜，[Arian eir]自己也开始扭动臀部，与你完美地配合着向上挺送。你对此毫无准备，这让你完全无法抗拒，你很快就高潮了，当你双手落在[Arian eir]" + arianChest() + "上时，你全身都在颤抖。");
               outputText("[pg]你在恋人身上扭动着、呻吟着，继续贴着[Arian em]挺动，直到[Arian ey]也带着一声呜咽迎来高潮。你们一同沉浸在这阵快感之中，彼此的身体完全契合，细小的酥麻感掠过四肢末梢。最终，你再也没有力气支撑身体，向前软倒在阿瑞安身上，而这位法师也温柔地张开双臂接住了你。");
               outputText("[pg]接下来的几分钟里，你只是躺在那里，享受着高潮后的余韵。能独自拥有这样的时刻固然不错，但能和阿瑞安这样的人一起分享，只会更加美好。等你觉得足够放松之后，你才从[Arian eir][if (norfur){皮肤|鳞片}]上撑起身子，站了起来。");
               get_player().orgasm("Vaginal");
            }
            else
            {
               dynStats(DynStat.Lust(10));
            }
            outputText("[pg]你温柔地对[Arian em]微笑并后退一步，穿上衣服，在[Arian eir]脸颊上印下温柔的一吻，然后拍了拍[Arian eir]屁股，出发开始新的一天。[say: [name]。快来看我……好吗？]你离开时听到阿瑞安说，[Arian ey]因为兴奋仍然气喘吁吁，满脸通红。");
         }
         else
         {
            outputText("你安静地打了个哈欠，发现自己又在新的一天醒来。你注意到自己的手并没有像预想中那样僵硬；事实上，看来你的小屁眼骚货一定是在你重新睡着后的某个时候松开了你的手指。你轻轻叹了口气，拍了拍阿瑞安的背；一个念头滑进你的脑海——也许如果你再长出一根新的鸡巴，[Arian ey]会更喜欢，这样你就能按[Arian ey]显然最享受的方式狠狠干[Arian em]的屁眼了……");
            outputText("[pg]阿瑞安大大地打了个哈欠，舔了舔[Arian eir]嘴唇，侧过身来，带着困倦的笑容向你打招呼。[say:早安，[name]，][Arian ey]一边说，一边揉去[Arian eir]眼中的睡意；[Arian eir]尾巴慢慢爬上你的腹部。[say:睡得好吗？]");
            outputText("[pg]你告诉[Arian em]睡得不错，只是半夜出了点小问题。说这话时，你脸上带着会心的坏笑。阿瑞安有些担心地问道：[say:发生什么了？]");
            outputText("[pg]哦，没什么，大概只要你重新长出一根肉棒就能解决，你开玩笑道。阿瑞安露出困惑的表情。[say:你这是什么意思？]");
            if(get_player().hasVagina())
            {
               outputText("[pg]你摆出的温柔微笑掩盖了真正的意图，朝斜躺着的蜥蜴人靠近，而[Arian ey]似乎完全没有察觉到任何不对。不过很快，当[Arian ey]感觉到你重重拍在[Arian eir]屁股上的那一下时，情况就变了。阿瑞安的脸上顿时泛起深深的红晕，[Arian ey]惊讶地看着你。你告诉阿瑞安，要是[Arian ey]不记得昨晚发生了什么，那你就只好帮[Arian em]回忆一下了。");
               outputText("[pg][say:哦、哦，是那个，呃……]");
               outputText("[pg]你没有回答，而是让手指慢慢靠近，滑过[Arian eir]屁股上苍白的[if (nofur){皮肤|鳞片}]，直到将它整个托在掌中。[Arian Ey]在这里轻轻叹了口气，但你还没打算停下。于是，你毫无预警地悄悄伸进一根手指，戳向[Arian eir]的褶皱入口。");
               outputText("[pg][say:我想我大概能猜到——]");
               outputText("[pg]你猛地插了进去，蜥蜴人原本想说的话被随之响起的叫声彻底打断。你在床上的位置正好能直视[Arian eir]的双眼，这让[Arian em]脸红着别开视线，但没关系——[Arian em]躲不开你的疼爱。阿瑞安的穴口很快接纳了你的侵入，而你也热情地接受了这份好意，用手指尽可能深入地探索着。");
               outputText("[pg]你温柔而不间断的抚弄让阿瑞安彻底失控，[Arian eir] " + arianMF("cock","entrance") + "就在不远处一阵抽动。直接扑上去确实很诱人，但那不是你此刻的重点，于是你重新把注意力放回[Arian eir]的屁股上。那里柔韧却并不松弛，紧致得恰到好处，正适合[Arian em]这样的小屁股骚货。你挑逗并把玩着[Arian eir]的内里，享受着[Arian ey]每一声沙哑的呻吟在[Arian eir]身体中回荡的感觉。");
               outputText("[pg]很快，你感觉到伴侣的手指也向后探来作为回应，沿着你的入口轻轻游走，却发现你早已准备得相当充分。随后，那些手指带着不输给你的热切钻了进来，抚弄、爱抚着你的内壁，直到你发出的声音几乎和阿瑞安一样多。你们彼此推动着对方继续下去，贪婪地吻在一起，四只手也急切而默契地同时动作。[Arian Ey]对你的身体已经足够熟悉，让你很难不屈服于[Arian eir]温柔的服侍，但你还是尽力忍耐，并加倍努力想先让[Arian em]到达顶点。");
               outputText("[pg]终于，[Arian ey]在你指间猛然收紧，[Arian eir]双腿抽动着踢在[if (haslegs){你的双腿|你的身体}]上，[Arian ey]在快感中痉挛起来。[Arian Eir]同样抽搐的手指让你也轻易跟着[Arian em]坠过边缘，于是你欣然放开自己，将身体紧紧贴向[Arian eirs]，只为尽可能多地感受你的爱人。狂喜彻底填满了你，你唯一能做的就是拼命维持意识，不让高潮将你完全吞没。你不确定自己做得有多成功，因为接下来的几秒——也许是几分钟——都在快感的朦胧中流逝，你的脑海仍被高潮震得一片恍惚。");
               outputText("[pg]你们两个躺在那里，大口喘着气。也许一大早就做这么费力的事并不是个好主意，但你不得不承认，当你从床上起身时，自己已经完全清醒了。不过，当你回头看去时，却发现阿瑞安仍在用渴望的目光看着你，尽管至少在你看来，刚才已经相当满足了。");
               get_player().orgasm("Vaginal");
            }
            else
            {
               outputText("[pg]你只是对[Arian em]笑了笑，告诉[Arian em]别让[Arian eir]漂亮的小脑袋瓜担心，也别让[Arian eir]可爱的小屁股担心。你玩笑似的拍了拍[Arian em]的屁股，然后把你的[legs]甩下床，站起身来，准备开始穿衣服。阿瑞安看起来仍有些困惑，但也决定下床开始穿衣。整个过程中，[Arian ey]一直不断用渴望的目光瞟向你。");
               dynStats(DynStat.Lust(10));
            }
            outputText("[pg]你穿好衣服，无法抑制自己的好奇心，问你的小蜥蜴情人为什么[Arian ey]一直那样看着你？");
            outputText("[pg]阿瑞安摆弄着[Arian eir]手指。[say:就是你之前说的那件事。我……如果你能长出一根漂亮、粗大、结实、装满精液的肉棒，我真的会很开心……]阿瑞安的声音渐渐低了下去，梦幻般舔了舔[Arian eir]嘴唇，身体也微微扭动起来。");
            outputText("[pg]你调侃地问[Arian ey]是不是已经这么习惯你那样捅[Arian eir]的屁股了——怎么说呢，你还以为[Arian ey]会更希望你停手呢。阿瑞安移开[Arian eir]视线，咬住[Arian eir]下唇。[say:不，我是说……一开始我也没有……多喜欢。但我想，那种感觉慢慢就有点习惯了，而且……嗯……最近我总觉得那里好空。][Arian Ey]明显地咽了咽口水。[say:我想说的是……对，我喜欢你捅我后面。][Arian Ey]羞得把脸藏了起来，尽管[Arian ey]那种扭动的样子，你已经认得出是[Arian ey]被挑起情欲的表现。你忍不住笑了笑，然后走过去握住这个仍旧赤裸的蜥蜴人的屁股，手指绕到后面，轻轻挑逗[Arian eir]那调教有素的后穴入口；那里一张一缩，试图引诱你的手指进入。你说你会考虑把肉棒重新长回来，用刚才还在挑逗[Arian em]的那几根手指点了点[Arian eir]鼻尖，然后离开，开始新的一天。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,951,0);
         doNext(playerMenu);
      }
      
      public function visitThePark() : void
      {
         clearOutput();
         arianSprite();
         get_images().showImage("arian-park");
         outputText("你走进残破不堪的公园遗迹，看见病恹恹的蜥蜴人阿瑞安正坐在他常坐的长椅上，便向他打了声招呼。[say:哦，你好啊，[name]。很高兴见到你。]他懒洋洋地挥了挥手。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) == 1)
         {
            outputText("[pg]你感到");
            if(get_player().cor < 50)
            {
               outputText("好奇");
            }
            else
            {
               outputText("无聊");
            }
            outputText("，于是决定问问他的经历。");
            outputText("[pg]他带着歉意对你笑了笑。[say:我想我应该从头讲起；不过这故事有点长，不如你先坐下吧？]他示意你坐到他身旁。");
            outputText("[pg]你照他说的坐了下来。");
            outputText("[pg][say:其实我是个法师；从小我就在学习魔法技艺。如果你在奇怪我为什么有这种白色鳞片，那是因为我生来就患有一种叫白化病的东西，好像是某种遗传病……我也不是很确定，不过这不是重点。我年轻时大多待在室内，困在家里，钻研白魔法。人们总说我很有魔法天赋，有些人甚至叫我天才。天才？呵。没有别人帮忙，我连几条街都走不了。]他说完便咳嗽起来，仿佛是在为这句话作强调。");
            outputText("[pg]你问他是不是真的法师——你还以为特尔阿德雷的法师都与普通民众隔离开来，负责维持那些保护城市免受恶魔侵袭的法术。");
            outputText("[pg][say:哦，是的，我确实是法师。但我不属于守护这座城镇的盟约会……你看，我不适合那份职责。除此之外，以我的魔法……那会要了我的命……]");
            outputText("[pg]为什么会这样？");
            if(get_player().hasSpells())
            {
               outputText("你原以为施法只会消耗体力，还需要合适的心境，而不是消耗生命力。你把这个想法告诉了这名蜥蜴人。");
            }
            outputText("[pg][say:啊……这就说到我为什么会变成这副惨样了。你看，我找到了一种使用白魔法的新方法；它能施展出强大得多的法术；问题是，它对施法者的身体非常有害。] [Arian Ey]虚弱地对你笑了笑。[say:为了达到完全专注的状态，我会停止自己所有的身体机能。我的心脏停止跳动，我不再呼吸，把自己的全部存在都投入到想要施展的法术之中。这非常危险，但也正因如此，我才能达到其他法师都无法企及的专注程度。]他观察着你的反应。[say:所以你觉得呢？厉害？鲁莽？还是愚蠢？]");
            outputText("[pg]你承认，能做到这一点确实很了不起……不过，他就不能用普通方式施法吗？如果他的技巧比传统方式消耗更大、对身体负担也更重，那样不是对他更好吗？");
            outputText("[pg][say:是的，朋友，你说得没错。虽然我现在确实是用传统方式施法，但当时我根本没有这种选择。]他咳嗽了几声。[say:不过那就是另一个故事了。我想今天已经耽搁你够久了。]他闭上眼睛，向后靠去。");
            outputText("[pg]你告辞离开，回到了营地。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) == 2)
         {
            outputText("[pg]你坐舒服后，提议让他继续讲他的故事。他一开始有些惊讶地看着你，但很快便笑了起来。[say:好吧，我说到哪儿了？]他若有所思地摸了摸下巴。[say:啊，对了。]");
            outputText("[pg]他清了清嗓子。[say:我必须用我的力量去帮助我的朋友。你看，我们的学院被恶魔攻陷了，我试着与它们战斗。可是……当然了，我并没有强大到能击败它们所有，或是救下每一个人。我能做的，只有保护我的学生们和我自己。]他咳嗽了几声，但仍然带着笑意。");
            outputText("[pg]这么说，他原本并不是来自特尔阿德雷？你建议他讲得详细些，告诉你关于他那所学院的事。");
            outputText("[pg]阿瑞安微微一笑。[say: 好吧。那所学院是个求学之地，各类法师都会聚集在那里。它以藏书丰富而闻名，也是学习白魔法的顶尖学院之一。那里离这座城市相当远，不过既然恶魔发动了袭击，我也不指望它现在还会完好无损。在我和我的学生们逃出来之前，情况已经变得相当糟糕了。]");
            outputText("[pg]你表示自己明白了，让他继续说下去。");
            outputText("[pg][say: 恶魔们打了我们一个措手不及——他们潜入了学院，并从内部传播黑魔法。一些最优秀、最强大的法师都被变成了毫无理智的性玩具。要不是我当时在一间设有结界的练习室里，恐怕也会落得同样的下场。] 他说完这句话，忽然咳嗽了一阵。稍微缓过来后，他继续说道：[say: 他们太多了……我的学生们当时在自己的房间里，等我一路杀过去时，他们差点就被两个梦魔带走了。黑魔法让他们根本无力反抗，不过幸好我还保有足够的心智来施法，才得以救下他们。]");
            outputText("[pg]你表示自己还在认真听，于是他继续说了下去。");
            outputText("[pg][say: 救下他们之后，我很快就明白，我们根本不可能击退那些恶魔，所以我们只能尽可能快、尽可能远地逃走。等我们终于逃到足够安全、让我能松口气的地方时，我已经消耗了太多魔力；结果……嗯……你现在看到的就是了。] 他咳嗽了一声，像是在强调这点。");
            outputText("[pg]你告诉他，这次你已经听得够多了，所以他最好还是保存体力，就先到这里。[say: 好吧。那就回头见了，[name]。] 他向你挥手道别。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) == 3)
         {
            outputText("[pg]你提起上次和阿瑞安的谈话，问他那些学徒后来怎么样了。");
            outputText("[pg]他笑了笑。[say: 你知道吗……我的学徒们其实现在就是我的助手。他们发誓要以助手的身份侍奉我一生。] 所以，他一直是在躲着自己的学徒？");
            outputText("[pg][say: 他们总是担心我。也许有点太担心了……我不是不感激他们的关心，但有时候我会觉得被管得喘不过气。别误会，我像爱家人一样爱他们，可我偶尔也想出来走走。] 你点了点头，觉得这大概就是他想看到的反应。");
            outputText("[pg][say: 总之，我的故事也没剩多少了。我们逃了出来，在沙漠里四处流浪，直到找到了特尔阿德雷。他们好心收留了我们，所以我们就待在了这里。] 他朝你们周围的区域示意了一下。");
            outputText("[pg][say: 那么，[name]？] 你看向他作为回应。[say: 你有兴趣看一场魔法演示吗？] 你给出了肯定的答复。");
            outputText("[pg]他将双手分开，掌心相对。[say: 这就是通常能用白魔法做到的事。] 他闭上眼睛，集中精神。你看着一道道电能弧光从他一只手跃向另一只手，就像细小的闪电电流，闪烁着噼啪作响。你评论说这场面确实挺壮观");
            if(get_player().cor > 66)
            {
               outputText("，同时心里却暗自想着这看起来也太没用了——如果这就是他们的最大能耐，也难怪他们打不过恶魔");
            }
            outputText("。");
            outputText("[pg][say: 现在让我给你看看，我用自己的技法能做到什么。] 他再次闭上眼睛，集中精神。随着他的力量增强，他白色的鳞片开始发光；你倒吸一口气，只见能量几乎在他的双手之间爆裂开来，一片闪耀的雷电在他掌间奔涌翻腾，那股狂暴仿佛足以吞噬落入其间的一切。他身体一颤、开始咳嗽时，才停了下来。你不得不承认，这下可就厉害多了。");
            outputText("[pg][say: 看来我好像有点做过头了。] 他冲你傻乎乎地笑了笑，接着又咳嗽一声，显然是想掩饰尴尬。[say: 谢谢你陪我，我真的很喜欢和你聊天，[name]。你对我来说是个很棒的朋友。] 你接受了他的夸奖，并告诉他这没什么");
            if(get_player().cor >= 66)
            {
               outputText("，同时把自己愿意理会他的真正原因藏在心里");
            }
            outputText("。");
            outputText("[pg][say: 不过，我还能再麻烦你一次吗？] 阿瑞安有些害羞地问道。[say: 你介意扶我回家吗？我的助手们这会儿大概已经在缠着守卫，让他们出来找我了，而且我觉得暂时也已经吸够新鲜空气了。]");
            outputText("[pg]你觉得这也不算太麻烦，便告诉阿瑞安你会扶他回家。");
            outputText("[pg]阿瑞安领着你来到他家门前。他把搭在你肩上的手臂放下，又用[Arian eir]的双手握住你的手，对你露出微笑。[say: 谢谢你帮我，也谢谢你愿意听我讲这些。]接着，他满怀期待地看着你的眼睛，问道：[say: 听我说，[name]。如果你能偶尔来看看我，我会很高兴的。这里有时真的很寂寞，虽然我的助手们总是在我身边，但有些事我实在没法和他们谈。所以……你能抽空来探望一下这个体弱多病的法师吗？]");
            outputText("[pg]你向他保证会考虑的；现在他该进去好好休息了。[say: 谢谢，那我就等你来看我了。]他松开你的手，慢慢走进屋里，门才刚打开，就有两双手臂抓住他，把他拖了进去，随即关上了门。你耸耸肩，转身朝营地走去；这段小插曲挺不错，但你还有别的事要做。");
            outputText("[pg][b:（公园已从特尔阿德雷的菜单中移除。阿瑞安的家已添加到住所子菜单中。）]");
            arianHealth(5);
         }
         arianHealth(1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,934,FlagDict_Impl_.arrayReadInt(_loc1_,934) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function visitAriansHouse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         clearOutput();
         arianSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 29 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) == 1)
         {
            arianHealth(1);
         }
         if(arianFollower())
         {
            if(arianMF("m","f") == "f")
            {
               get_images().showImage("arianfemale-tent");
            }
            else
            {
               get_images().showImage("arianmale-tent");
            }
            outputText("你走近那顶附魔帐篷，轻松地推门而入，来到奢华的内部空间。");
            _loc1_ = Utils.rand(10);
            if(_loc1_ == 0)
            {
               outputText("不过，阿瑞安现在并不在这里，于是你先在沙发上坐下，让自己舒服些。几分钟后，阿瑞安[Arian emself]从入口走了进来。[say: 哦，[name]。我不知道你在这里……你等很久了吗？][Arian ey]问道。你告诉[Arian em]并没有等太久。[say: 那就好。那么，你找我有什么事吗？][Arian ey]微笑着问。");
            }
            else if(_loc1_ == 1)
            {
               outputText("帐篷里，那个蜥蜴人正坐在桌旁，一边专心喝着杯里某种热饮，一边埋头研读一本看起来很奥术的书。你礼貌地咳了一声，引起[Arian eir]的注意，[Arian ey]抬头看向你，露出微笑。[say: 你好，[name]。我刚才只是在补习功课。要来杯茶吗，或者想喝点别的？][Arian ey]问道。");
            }
            else if(_loc1_ <= 2)
            {
               outputText("你找到[Arian em]时，那个蜥蜴人正忙着摆弄一些看起来像神秘学道具的器具。你礼貌地咳了一声，想引起[Arian eir]的注意，可[Arian ey]完全没理会，于是你又咳了一次。直到第三次，[Arian ey]才从[Arian eir]的工作中抬起头，带着歉意看向你。[say: 啊，[name]；抱歉，我刚才太专注了。][Arian ey]用歉然的语气说道，同时示意了一下[Arian eir]书桌上的一片狼藉。[say: 你有什么事吗？][Arian ey]问。");
            }
            else if(_loc1_ <= 4)
            {
               outputText("空气中弥漫着刚做好的饭菜香味，你看到阿瑞安正高高兴兴地坐在[Arian eir]的沙发上，手里端着一盘刚出锅的食物。[say: 哦，[name]；我正准备吃饭，要来一份吗？或者如果你想做点别的，也可以先放一放，]蜥蜴人微笑着对你说。");
            }
            else if(_loc1_ <= 6)
            {
               outputText("你不用怎么找就看到了阿瑞安；[Arian ey]现在正蜷在沙发上睡觉。你正考虑要不要叫醒[Arian em]时，[Arian ey]忽然动了动，舒展开[Arian em]self，又伸了个大大的懒腰、打了个哈欠，让你把[Arian eir]嘴里每一颗针尖般的牙齿都看得清清楚楚。随后[Arian ey]看见了你，对你露出微笑。[say: 啊，[name]；我刚才只是小睡了一会儿。有什么事吗？]");
            }
            else if(_loc1_ <= 8)
            {
               outputText("你一走进帐篷，就闻到一股奇怪的气味；过了片刻你才辨认出来，同时耳朵一竖，听见阿瑞安发出几声你再熟悉不过的释放呻吟。你带着坏笑悄悄靠近，俯身越过沙发，直直看进阿瑞安的眼睛里；[Arian eir]的手指上仍亮晶晶地沾着");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
                  {
                     outputText("混合的性液");
                  }
                  else
                  {
                     outputText("精液");
                  }
               }
               else
               {
                  outputText("淫液");
               }
               outputText("，而且确实还停在[Arian eir]的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
                  {
                     outputText("成对性裂");
                  }
                  else
                  {
                     outputText("肉棒");
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
                     {
                        outputText("");
                     }
                  }
               }
               else
               {
                  outputText("小穴");
               }
               outputText("上方。很长一段时间里，[Arian ey]只是呆呆地回望着你；如果蜥蜴人也会脸红，你敢肯定[Arian ey]现在一定红得像甜菜根一样。[say: [name]！我刚才——我只是……哦，这也太尴尬了，][Arian ey]低声嘟囔着，低头看着[Arian eir]的脚。");
               outputText("[pg]你朝这位慌乱的蜥蜴人露出一个心照不宣的笑容，告诉[Arian em]不用担心；[Arian eir]袍子底下有什么，你早就见识过了。阿瑞安浑身一颤，那反应已经足以说明[Arian eir]有多尴尬。你问[Arian ey]，或许需要你先到外面去，等[Arian ey]把[Arian emself]收拾体面些？当然，你其实并不介意这幅景色……");
               outputText("[pg][say: 拜、拜托了。]阿瑞安结结巴巴地说，依然不敢与你对视。你轻轻点了点[Arian em]的鼻尖，然后走到外面。过了一小会儿，你听见[Arian em]喊道：[say: 进、进来吧！]");
               outputText("[pg]你脸上的坏笑怎么也收不住。等你回来时，发现阿瑞安确实已经穿戴整齐，而且[Arian ey]先前弄出的那片狼藉似乎也完全不见了。你走到这位依然满脸窘迫的蜥蜴人面前，告诉[Arian em]，如果[Arian ey]还憋得慌，你很乐意帮[Arian em]处理一下。");
               outputText("[pg][say: 不、不用了……所以，呃，[name]，你是有什么事吗？][Arian Ey]问道，拼命想把话题岔开。");
            }
            arianHomeMenu();
         }
         else
         {
            if(arianMF("m","f") == "f")
            {
               get_images().showImage("arianfemale-tent");
            }
            else
            {
               get_images().showImage("arianmale-tent");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,934) == 4)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,934,FlagDict_Impl_.arrayReadInt(_loc2_,934) + 1);
               outputText("决定去探望体弱多病的蜥蜴人法师阿瑞安后，你立刻动身出发。那栋房子相当大，至少有两层高，但看起来十分普通；它和附近其他建筑相比，并没有什么特别显眼之处。唯有门上一块小小的黄铜牌写着[say: 阿瑞安，魔导师]，才让人看出这里住着一位巫师。前门上有一个结实的黄铜门环，造型狰狞又怪异，于是你握住把手，重重敲响大门，宣告自己的到来。");
               outputText("[pg][say: 请稍等！]你听见屋里传来一个女性的喊声。门闩咔哒一响后，门缓缓打开，出现在你面前的是一位" + (get_noFur() ? "长着雪貂尾巴的女子" : "棕褐色毛皮的雌性雪貂人") + "，正用戴着眼镜的棕色眼睛看着你；她个子不高，身上穿着宽松舒适的长袍，把曲线遮得严严实实。她扶了扶眼镜，问道：[say: 请问有什么能帮您的吗，[sir]？]");
               outputText("[pg]你解释说自己是巫师阿瑞安的熟人，是来探望他的。雪貂人微微一笑，侧身让开。[say: 请进。]你很快走进屋内，第一次看清阿瑞安的家。这里的外观和内部倒是很一致；屋里看起来也非常普通。除了几只漂亮的花瓶和几盆盆栽之外，并没有什么特别引人注目的东西。");
               outputText("[pg]雪貂姑娘在你身后慢慢关上门，扣好门闩后，拍了拍自己的长袍，转身面向你。[say: 恐怕我们还没有正式介绍过，[sir]。我叫莱卡，是阿瑞安大人的助手之一。]她微笑着行了个屈膝礼，又补充道：[say: 很高兴见到您……呃……]你笑着告诉她你的名字。她闭上眼睛点点头。[say: 啊，是的，[name]……]突然，她猛地睁大眼睛。[say: 等一下……[name]！？]她拿着一把木勺逼近你，像是在威胁你。[say: 是你！就是你帮阿瑞安大人溜出去的！]她皱着眉大喊，还用勺子戳着你的[chest]。");
               outputText("[pg]你问她这真有那么严重吗；他只不过是想去公园坐坐而已。莱卡伸手指着你，正要说些什么，却被一个男性的声音打断了。[say: 老姐！怎么回事？]随后，另一个" + (get_noFur() ? "雪貂男人" : "棕褐色毛皮的雪貂人") + "从附近的走廊里慢慢走出来，身上穿着和他姐姐差不多的长袍。要是莱卡摘掉眼镜，他们看上去简直就像一对双胞胎。");
               outputText("[pg][say: 布恩，这就是那个……]布恩举起双手，打断了莱卡的话。[say: 是，姐姐。现在半条街的人都知道了。]他走到姐姐身边，慢慢把她往厨房的方向推。[say: 交给我吧，姐。你先把碗洗完，冷静一下。我已经把自己的杂活做完了，可以来招待我们的客人。]");
               outputText("[pg]莱卡瞪了你和她弟弟一眼，但还是照做了。布恩叹了口气，转向你。[say: 你好，[name]。我是布恩，莱卡的弟弟，也是阿瑞安大人的学徒。还请你原谅我姐姐，她在我们大人的事情上总是有点……太上心了……不过她说得也有道理。要是阿瑞安大人突然晕倒了怎么办？要是他需要吃药呢？]");
               outputText("[pg]你还没来得及反驳，他就拦住了你。[say: 算了，这不重要。就算你不在，他也总能找到办法溜出去。所以，谢谢你陪着他。]你以一贯从容的风度接受了他的道谢，然后");
               if(get_player().cor < 33)
               {
                  outputText("好奇地");
               }
               else if(get_player().cor < 66)
               {
                  outputText("随口");
               }
               else
               {
                  outputText("漠不关心地");
               }
               outputText("问他为什么要谢你。");
               outputText("[pg]布恩笑了笑，示意你跟上，然后带你上楼。[say: 是这样的……阿瑞安大人以前并不总喜欢出门长时间散步……我也不知道他为什么突然喜欢上了在城里到处走，但他的身体状况根本不允许这样，而他又太固执，不肯承认。所以我们多少得管着他一点，不然他迟早会在城里某个不太安全的地方晕倒。]布恩一边解释，一边拐进一条走廊。[say: 不过，大人回来时看起来真的很开心。我很庆幸他遇到的是你这样不错的人，而不是什么抢劫犯或小偷。]布恩对你笑了笑。");
               outputText("[pg]他在一扇木门前停下，转动门把手。[say: 果然！]门一打开，你便看到了一幕令人意外的景象。布恩一巴掌拍在自己额头上，发出一声呻吟。阿瑞安正站在床上，半个身子都探出了窗外，苍白的脸上写满了惊讶。");
               outputText("[pg][say: 阿瑞安大人……我现在会把门关上，并假装没有刚抓到你又想逃跑。我希望等我再打开这扇门时，能看见你已经回到床上，否则我就让莱卡来对付你。]一听到莱卡的名字，阿瑞安便打了个寒颤。你只是站在布恩身后，看着这一幕发生。布恩关上门，等了片刻后又重新打开，并示意你进去。[say: 阿瑞安大人，您有访客。]");
               outputText("[pg]你顺着雪貂人的手势走进房间，心里想着阿瑞安到底有没有乖乖留下来。令你欣慰的是，他正坐在床上，有些闹别扭似的缩在被子里。你告诉他，自己是想来探望一下，如果打扰了什么重要的事，那就抱歉了。");
               outputText("[pg]阿瑞安对你微微一笑。[say: 一点也不打扰。布恩，你现在可以先出去了。]布恩鞠了一躬，转身离开，并随手关上了门。阿瑞安叹了口气，掀开被子，在床上端正坐起，又朝旁边一把椅子示意。[say: 随便坐吧；你能来看我，我真的很高兴。我还在想，不知道还能不能再见到你呢。]");
               outputText("[pg]你告诉他，你实在忍不住想来看看他，同时你");
               if(!get_player().isTaur())
               {
                  outputText("拉过一把椅子");
               }
               else
               {
                  outputText("让你的半人马身躯在地板上坐下");
               }
               outputText("。你绞尽脑汁想找些礼貌的话题，最后问起自从上次见面后，他过得怎么样。");
               outputText("[pg][say: 嗯，上次在公园闹了那么一出之后，我不得不多吃了些药。不过除此之外，我过得还不错。]阿瑞安笑了笑。[say: 那你呢，我的朋友？你最近怎么样？从上次见面到现在，有没有遇到什么有趣的事？我不太能出门，所以不管你能告诉我多少外面的世界，我都很想听。]阿瑞安满怀期待地等着你的回答。");
               outputText("[pg]你绞尽脑汁地想：能跟他说些什么呢？最后，你耸耸肩，开始讲起自己在特尔阿德雷之外的荒野旅行。看到他对探索如此兴奋，你便特意详细描述了自己见过的许多不同地方，也讲到恶魔似乎在大地各处造成了奇怪的[say: 变移]，让人很难预料自己会遇上什么，还讲了你旅途中碰到的那些满脑子都是性的怪物。");
               outputText("[pg]阿瑞安专心地听着，就像个听故事的孩子。等你说完，阿瑞安对你露出笑容。[say: 哇，你一定真的很忙。可你还是抽出时间来陪一个病恹恹的法师。谢谢你能来，这对我来说真的很重要。]阿瑞安用双手握住你的手。尽管你有些不好意思，但他对你表现出的关注还是让你心中涌起一阵自豪；你轻轻捏了捏他的手，并向他保证，如果他每次都能当这么专心的听众，你一定会再来的。有人愿意听你的故事，感觉确实不错。");
               outputText("[pg]你们又继续闲聊了一会儿，但最终你觉得自己该离开了。阿瑞安看起来明显有些失望，但还是对你微笑。[say: 好吧，希望很快能再见到你，[name]。]阿瑞安清了清嗓子，喊道：[say: 布恩！]仅仅片刻之后，布恩便打开了门。[say: 是，阿瑞安主人？]");
               outputText("[pg][say: 布恩，能请你送[name]出去吗？]布恩点点头，微笑道：[say: 当然可以，主人。请跟我来，[name]。]你向那位微笑着的蜥蜴人作了最后的告别，然后开始往屋外走去。到了门阶处，布恩叫住了你。[say: 嘿，[name]。你是冒险者，对吧？]");
               outputText("[pg]你确认说，是的，你确实是。布恩握住你的手，向你鞠了一躬。[say: 拜托了！如果你找到了什么药水、草药，或者任何可能有帮助的药物，请把它带给我们的主人！我们已经把特尔阿德雷都找遍了，可还是没找到什么有效的东西。所以拜托你！如果你找到了什么，请一定带给我们！]");
               outputText("[pg]你答应会留意一下。随后你回去查看自己的营地。");
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,944) == 1)
               {
                  outputText("你觉得阿瑞安应该会喜欢你的陪伴，于是信心十足地穿过通往那位蜥蜴人住所的街道。没过多久，你便站在了那座气派的宅邸前，[Arian ey]和[Arian eir]的雪貂同伴们就住在里面。你用力敲响门环，宣告自己的到来。");
                  outputText("[pg][say: 来了！]你听见莱卡喊道。没过多久，那位雪貂姑娘打开了门。她一看见是你，连招呼都懒得打，直接把你拽了进去，然后在你身后砰的一声关上了门。");
                  outputText("[pg][say: 你！你对阿瑞安主人做了什么！？]她拿着一把鸡毛掸子威胁你。布恩一边用布擦着湿漉漉的手，一边急匆匆跑来查看骚动。[say: 姐，发生什……么……]他看着眼前的场面，叹了口气。");
                  outputText("[pg][say: 这个……这个……变态居然还有脸在那之后回来……]布恩抬起双手，试图让姐姐安静下来，甚至没打算让她把话说完。[say: 是，是，我知道。但那是主……呃……阿瑞安女主人的决定，姐姐。她亲口告诉我们的。]");
                  outputText("[pg]莱卡愤怒的目光转向了她弟弟。[say: 布恩！我真不敢相信你居然觉得这没问题！我发誓我真该……]布恩瞪了莱卡一眼，显然摆出了哥哥的架势。[say: 姐，我们已经跟阿瑞安女主……女主人谈过这件事了。她喜欢[name]，喜欢到愿意完成她的……呃……转变。除此之外，自从[name]开始来探望以后，阿瑞安女主人的身体只变得越来越好了，这一点你也不能否认，姐姐。]");
                  outputText("[pg]莱卡又把愤怒的目光转回你身上。[say: 你……这次算你走运！]她气冲冲地离开了玄关。");
                  outputText("[pg]布恩满怀歉意地看着你。[say: 抱歉啊，[name]。不过别担心，我相信我姐姐迟早会接受的；给她一点时间就好。]他对你笑了笑。[say: 如果你不介意的话，我还有些家务要做；你能自己去阿瑞安女主人的房间吗？]");
                  outputText("[pg]你默默看完了这一幕，便友善地朝他笑了笑，并向他保证自己没问题。[say: 太好了！待会儿见。]他转身离开了你。");
                  outputText("[pg]你还记得上次来时阿瑞安房间的位置，便径直朝那里走去，发现房门一如既往地关着。你慢慢用指节敲了敲紧闭的房门，既想让里面知道你来了，又不想显得太打扰。");
               }
               else
               {
                  outputText("你觉得阿瑞安应该会喜欢你的陪伴，便信心十足地穿过通往这位蜥蜴人住处的街道。没过多久，你就站在了那栋气派的宅邸前，阿瑞安和他的雪貂伙伴们就住在这里。你用力敲响门环，宣告自己的到来。");
                  outputText("[pg][say: 来啦！]你听见莱卡喊道。没过多久，雪貂女孩打开门，向你打了个招呼。[say: 你好，[name]。是来拜访阿瑞安" + arianMF("主人","女主人") + "的吗？请进！]她示意你进屋。你向她礼貌的邀请道了谢，迈过门槛走了进去。附近厨房里传来洗碗的声音，引起了你的注意，你看到布恩正认真地刷着一口锅。他抬起头，用沾满肥皂泡的手向你挥了挥。你也向他挥手回应。");
                  outputText("[pg][say: 抱歉要把你晾在这儿，[name]，不过我们现在有点忙；你能自己去阿瑞安" + arianMF("主人","女主人") + "的房间吗？]莱卡问道。");
                  outputText("[pg]你向这对雪貂姐弟保证没关系，也理解他们有多忙。你还记得上次来时阿瑞安房间的位置，便径直朝那里走去，发现房门一如既往地关着。你慢慢用指节敲了敲紧闭的房门，既想让里面知道你来了，又不想显得太打扰。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,944) == 1)
               {
                  outputText("[pg]你还没来得及说话，就听见莱卡那很有辨识度的喊声。看来布恩和莱卡仍在激烈争吵。阿瑞安皱了皱脸，立刻向你道歉。");
                  outputText("[pg][say: 抱歉，[name]。我想，我应该多考虑一下，突然变成这样会给他们带来多大的冲击。]");
                  outputText("[pg]你什么也没说，只是听着布恩和莱卡停止争吵。阿瑞安对你笑了笑。[say: 他们是会吵架，但都是好人。通常只要一会儿，他们就能把分歧说开。]");
                  outputText("[pg]你倒也同意，毕竟你不常见到关系这么好的兄弟姐妹。不过有件事一直让你有些在意……你问阿瑞安，她是否后悔改变了自己。");
                  outputText("[pg]阿瑞安倒吸一口气，连忙补充道。[say: 不！当然不是！确实，现在一切感觉都不一样了……而且我发现自己有了一些以前没有的冲动和欲望。]");
                  outputText("[pg]出于好奇，你问她是什么样的冲动。");
                  outputText("[pg]这位跨性别蜥蜴人尴尬地红了脸。[say: 嗯……最近，我总是在想下蛋的事，]阿瑞安紧张地说道。");
                  outputText("[pg]你笑了起来，嗯，这确实是她还是男性时不会去想的事。");
                  outputText("[pg]不过阿瑞安很快换了个话题。[say: 那么……你今天想做什么？]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,944,FlagDict_Impl_.arrayReadInt(_loc2_,944) + 1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 10)
               {
                  outputText("[pg]你听见门后传来一声轻微的咳嗽。[say: 进来吧。]你听见一个疲惫的声音说道。你轻轻握住门把手，慢慢打开门，小心不去惊扰这位虚弱的蜥蜴人。");
                  outputText("[pg]你进门时，阿瑞安对你笑了笑。[say: 哦，你好，[name]。我很高兴你来了。]他慢慢坐起身，示意了一下旁边的椅子。[say: 别拘束。]");
                  outputText("[pg]你拉过他示意的椅子，在他的床边坐下，对[Arian em]微微一笑。");
                  outputText("[pg][say: 那么，有什么你想做的吗？也许聊聊天？]阿瑞安问道。你回答说聊天就好。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20)
               {
                  outputText("[pg]你听见门后传来一声明显的伸懒腰呻吟。[say: 进来吧，]你听见一个疲惫的声音说道。你安静而从容地打开门，轻轻走了进去。");
                  outputText("[pg]你进门时，阿瑞安正坐在床上，对你笑了笑。[say: 你好，[name]。很高兴见到你。]他示意了一下附近的椅子。[say: 请别拘束。]");
                  outputText("[pg]你拉过旁边的椅子，在他的床边坐下。你微笑着问他身体怎么样。");
                  outputText("[pg][say: 我很好，谢谢。那么……今天是什么风把你吹来了？]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 30)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 2)
                  {
                     outputText("[pg]你听见一声轻微的呻吟。[say: 哦……[name]。]");
                     outputText("[pg]他该不会是……不，不可能吧。阿瑞安的身体还这么虚弱，不至于会有那种兴致……对吧？你犹豫着要不要偷看一下他，或者贴在钥匙孔上听听？不过话说回来，你也可以直接闯进去——如果他真的在玩弄自己，说不定还会想要你帮忙呢？");
                     menu();
                     addButton(0,"偷听",eavesDropOnArian);
                     addButton(1,"偷窥",peepOnArian);
                     addButton(2,"闯进去",bargeInOnArian);
                     addButton(3,"离开",leaveFappingArian);
                     return;
                  }
                  outputText("[pg][say: 进来吧！]你听见阿瑞安说道，能察觉到[Arian eir]声音里多了几分精神。你走进屋里，关上身后的门，对阿瑞安微微一笑。[Arian Ey]也朝你回以微笑，并示意你坐到旁边的椅子上。");
                  if(!get_player().isTaur())
                  {
                     outputText("[pg]你拉过椅子，在[Arian eir]床边坐下。");
                  }
                  else
                  {
                     outputText("[pg]你只是坐在[Arian eir]床边。");
                  }
                  outputText("[pg]阿瑞安对你微笑着问道：[say: 那么……你今天想做什么？]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 50)
               {
                  outputText("[pg]你听见抽屉被拉开、又被用力关上的声音。[say: 请、请进！]你听见阿瑞安喊道。你有些好奇[Arian ey]在做什么，便打开门走了进去，只见阿瑞安正坐在[Arian eir]的书桌前。[Arian Ey]坐在转椅上慢慢转过身，微笑着看向你。[say: 你好，[name]！][Arian Ey]示意你坐到旁边的椅子上。[say: 我刚才只是在做个小项目，没什么重要的。来，别客气，就当自己家一样！][Arian Ey]开心地对你笑着。");
                  outputText("[pg]你走进房间，心里猜着[Arian ey]刚才可能在做什么，但又觉得大概不是什么要紧事。你注意到，自从你第一次遇见[Arian em]以来，[Arian ey]的健康状况已经有了很大改善。");
                  outputText("[pg]你拉过椅子，在[Arian em]身边坐下，问[Arian ey]为什么要谢你；你告诉[Arian em]，真正努力的是[Arian Ey]，也是[Arian Ey]让[Arian emself]好起来的，你只是给了[Arian em]一个尝试的动力而已。[say: 你给我的远不止这些，所以我才要谢谢你。]");
                  outputText("[pg]你停下来想了想，琢磨着既然已经和这位蜥蜴人在一起了，接下来该做些什么。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 75)
               {
                  outputText("[pg][say: [name]，是你吗？进来吧！]你听见阿瑞安开心地说道。你打开门走进去，发现阿瑞安正坐在[Arian eir]桌边，桌上摊着一本书，[Arian eir]手里还端着一杯茶。[Arian Ey]一边啜饮着[Arian eir]的茶，一边示意你坐到旁边的椅子上。[say: 拉把椅子坐吧。要来点茶吗？]");
                  outputText("[pg]你礼貌地谢绝了茶，然后");
                  if(!get_player().isTaur())
                  {
                     outputText("坐上那把给你准备的椅子");
                  }
                  else
                  {
                     outputText("那把给你准备的椅子");
                  }
                  outputText("。");
                  outputText("[pg]阿瑞安放下[Arian eir]马克杯，朝你微笑。[say:那么，今天是什么风把你吹来了？]");
               }
               else
               {
                  outputText("[pg]阿瑞安打开门，灿烂地朝你一笑。[say:你好，[name]！快进来！][Arian Ey]说着，退后一步为你扶着门。你走进去，阿瑞安在你身后关上门，友好地抱了抱你。你也回抱住[Arian eir]。");
                  outputText("[pg]松开拥抱后，阿瑞安领你来到[Arian eir]桌边");
                  if(!get_player().isTaur())
                  {
                     outputText("并把旁边的椅子让给你");
                  }
                  outputText("。又给[Arian em]自己拉了一把。[say:我喜欢你来看我，[name]。那么，我们今天要做什么呢？][Arian ey]满怀期待地问道。");
               }
               arianHomeMenu();
            }
         }
      }
      
      public function useReductoOnAriansBreasts() : void
      {
         var _loc1_:int = 0;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().REDUCTO);
         outputText("你指了指阿瑞安的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1)
         {
            outputText("小巧的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
         {
            outputText("丰满的");
         }
         else
         {
            outputText("柔软如枕的");
         }
         outputText("乳房。[say: 好吧……我想这里减轻点重量，也能让我的背轻松些。]阿瑞安笑了笑，打开缩形膏的管子，又解开[Arian eir]长袍；接着把里面的膏体挤到[Arian eir]手上。");
         outputText("[pg]阿瑞安揉捏着[Arian eir]乳房，把膏体涂满[Arian eir]整个胸部。你忍不住觉得这一幕还挺性感的。阿瑞安的乳房在房间的光线下微微发亮。等[Arian ey]涂完后，[Arian ey]用旁边的一块布擦干净[Arian eir]双手，等待缩形膏起效。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) > 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1 && Utils.rand(6) == 0)
         {
            outputText("[pg]阿瑞安倒吸一口气，你们两个看着[Arian eir]乳房慢慢缩小，变成了更小的尺寸。你伸手摸了摸[Arian eir]乳房；现在它们握在你手里合适多了。");
            outputText("[pg]阿瑞安叹了口气。[say: 那……现在好些了吗？]你点头回应。[say: 太好了！你还想做点别的吗？]");
            _loc1_ = 941;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         else
         {
            outputText("你们两个盯着阿瑞安的乳房看，但似乎什么变化都没有。你伸手摸了摸，确实一点也没有缩小。");
            outputText("[pg][say: 嗯……我……]阿瑞安还没来得及继续说，你就告诉[Arian em]没关系，你只能另找办法去掉[Arian eir]的乳房了。[say: 好吧。那你还想做点别的吗？]");
         }
         menu();
         addButton(0,"下一步",giveArianAnItem);
      }
      
      public function useReductoOnAriansAsshole() : void
      {
         var _loc1_:* = null as IMap;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().REDUCTO);
         outputText("你让阿瑞安把那管缩小剂交还给你，告诉[Arian em]你想在从后面干[Arian em]的时候，让[Arian em]那里稍微紧一点。这名蜥蜴-");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 0)
            {
               outputText("男人");
            }
            else
            {
               outputText("双性");
            }
         }
         else
         {
            outputText("女人");
         }
         outputText("照你的要求做了，任你在手指上厚厚抹上一层缩小乳膏；与此同时，[Arian ey]预料到了你的下一步要求，脱下[Arian eir]的衣服，随后趴下，屁股高高翘起，尾巴缓缓来回摆动，[Arian eir]的肛门暴露出来，等着你动手。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) <= 1)
         {
            outputText("[pg][say:我不知道还能不能比现在更紧，不过……来吧，]阿瑞安对你露出紧张的笑容。");
            outputText("[pg]你轻柔却不依不饶地在阿瑞安的屁股上探弄按压，但最后也不得不承认事实：你几乎连一根手指都塞不进[Arian eir]紧窄的肛门；就算真能伸进去，你也不觉得这样会有多大用处。");
            outputText("[pg][say:看来终究还是没用，]阿瑞安轻笑道。[say:我想就算你真能涂上去，也会把我的屁股弄没吧。那可就太奇怪了。]");
            outputText("[pg]你也同意，[Arian Ey]说得没错。不过，既然刚才没成，[Arian ey]也许想做点别的？阿瑞安点点头。[say: 当然可以。你想做什么？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg][say: 我想后面那里还是挺紧的，不过如果你想让我更紧，就来吧，]阿瑞安对你说，神情有些紧张地笑了笑。");
            outputText("[pg]你轻轻把手指按在那个洞口上；正如阿瑞安所说，那里很紧，抗拒着你的动作，但你还是费了些力气，先后把一根、再一根手指滑了进去，开始用缩形膏涂抹内壁。随着动作，你能感觉到那里的肉壁逐渐绷紧——事实上，它很快就几乎带着痛意在你手指周围收缩下来，你不得不花上跟刚才插进去时一样大的力气，才勉强把手指拔出来。");
            outputText("[pg]你终于设法抽出手指时，阿瑞安呻吟了一声。[say: 等你再决定插进后面时，我想感觉也不会差太多，不过我还是希望你会觉得舒服。只是答应我，你会温柔一点，好吗？]");
            outputText("[pg]你向[Arian em]保证会好好照顾[Arian em]。[say: 那么，还有什么你想做的吗？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,936,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,936,FlagDict_Impl_.arrayReadInt(_loc1_,936) - 33);
            outputText("[pg][say: 说实话，我其实有点习惯那种感觉了……算是吧。后面变回那么紧会有点疼，但如果你喜欢的话，就来吧，]阿瑞安对你说，朝你笑了笑。");
            outputText("[pg]你轻松地将两根手指滑进[Arian eir]被撑开的后穴，用那神奇的缩形膏揉抹[Arian eir]肛门内侧。为了更方便涂抹，你最后又加了一根手指；[Arian ey]确实松到足以容纳它了。随着动作，你能感觉到它在你手指周围收缩，不过把手指滑出来依然没费多少力气。");
            outputText("[pg]你抽出手指时，阿瑞安呻吟起来。[say: 我才刚刚习惯从后面被干呢。不知道为什么，我总觉得以后不会像之前那么舒服了，不过能为你做点小小的牺牲，我还是很高兴。][Arian Ey]对你笑了笑。");
            outputText("[pg]你也回以微笑，感谢[Arian em]迁就你的愿望，尽管[Arian ey]其实不必这么做。阿瑞安冲你咧嘴一笑。[say: 别在意。我想让你舒服……]你抚摸着[Arian eir]裸露的屁股，告诉[Arian em]你很感激[Arian eir]的努力，并承诺也会让[Arian em]同样舒服。阿瑞安微笑起来。[say: 好啊，一言为定。那么，还有什么你想做的吗？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) <= 100)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,936,FlagDict_Impl_.arrayReadInt(_loc1_,936) - 33);
            outputText("[pg][say: 我只知道如果你把我的屁股缩紧，后面肯定不会那么舒服了，不过也许这样才是最好的？或许我真的有点被那种感觉冲昏头了。也许我确实变得太像个屁眼骚货了……]阿瑞安低下[Arian eir]头。");
            outputText("[pg]你忍不住拍了拍这个蜥蜴人的头，安慰[Arian em]说，没错，一涉及[Arian eir]的屁股，[Arian ey]确实是个骚货，但[Arian ey]当骚货的样子说实话还挺可爱。你只是想看看，既然[Arian ey]已经有了爱上一场绝妙肛交的经验，把[Arian em]重新缩紧会不会让事情变得更好。");
            outputText("[pg]你挤进阿瑞安的屁股，几乎发现自己的整只手都滑进了[Arian eir]那训练有素的“男骚货小穴”里，这让这个爱肛交的蜥蜴人发出淫荡的呻吟");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("，[Arian eir]的阴茎");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("突然从各自的鞘中挺出");
               }
               else
               {
                  outputText("突然从鞘中挺出");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText("，而");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 0)
               {
                  outputText("，");
               }
               outputText("[Arian eir]小穴也因刺激而湿润起来");
            }
            outputText("。你玩笑似的摇摇头，拍了一下[Arian em]的屁股，然后扶着它保持平衡，开始把你的拳头在里面进进出出，厚厚地抹开药膏，把[Arian eir]那曾经处子般的肛门紧致找回一些。最后，药膏全都用完了，[Arian eir]的屁股也确实感觉更紧了，于是你决定抽出来。");
            outputText("[pg]阿瑞安呜咽了一声。[say: 现在感觉没那么敏感了，不过我相信等你从后面干我的时候，还是会很舒服的。]阿瑞安微笑起来。[say: 还有什么你想做的吗？]");
         }
         menu();
         addButton(0,"下一步",giveArianAnItem);
      }
      
      public function useReductoOnArianCocks() : void
      {
         var _loc1_:int = 0;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().REDUCTO);
         outputText("你指了指[Arian eir]胯间，提到你想让[Arian em]那里变小一点。");
         outputText("[pg][say:哦，好吧。]阿瑞安敞开[Arian eir]长袍，把缩形膏从管子里挤到摊开的手掌上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
         {
            _loc1_ = 938;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            outputText("[pg]随后，[Arian ey]慢慢挑逗[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("露在外面的一对蜥蜴阴茎");
            }
            else
            {
               outputText("露在外面的蜥蜴阴茎");
            }
            outputText("，直到其完全勃起。最后[Arian ey]开始涂抹药膏。");
            outputText("[pg]变化几乎立刻开始；阿瑞安呻吟着，看着[Arian eir]尺寸过大的阴茎");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("慢慢缩小");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
            {
               outputText("");
            }
            outputText("到更容易应付的大小。变化完成后，阿瑞安试着将[Arian eir]阴茎完全收回");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("到它们的");
            }
            else
            {
               outputText("到它的");
            }
            outputText("藏身处；虽然有点挤，但还是塞得进去。");
            outputText("[pg][say:呼。不能说我不喜欢那么大的尺寸，但现在不用露在外面到处走，感觉自然、舒服多了。]你赞同地点点头。[say:那么，你还有别的想做的吗？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 2)
         {
            _loc1_ = 938;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            outputText("[pg]随后，[Arian ey]慢慢挑逗[Arian eir]缝隙，引诱[Arian eir]蛇形肉茎");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("从它们狭紧的藏身处探出");
            }
            else
            {
               outputText("从它狭紧的藏身处探出");
            }
            outputText("，直至完全勃起。最后[Arian ey]开始涂抹缩形膏。");
            outputText("[pg]变化只用了片刻便发生；阿瑞安因轻微不适而呻吟着，看着[Arian eir]阴茎");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("恢复到它们的");
            }
            else
            {
               outputText("恢复到");
            }
            outputText("原本的大小。变化完成后，[Arian ey]将");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("收回[Arian eir]的生殖裂缝里。");
            outputText("[pg][say:嗯，看来我又变回普通尺寸了，]阿瑞安带着一丝失望说道。你告诉[Arian em]，普通尺寸也挺好的，事实上你正好就喜欢普通的。这个蜥蜴人立刻振作起来，对你露出笑容。[say:谢谢，[name]。现在你还想做点别的吗？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("接着，[Arian ey]将[Arian eir]那对爬虫般的阴茎从藏身处引出来。最后，[Arian ey]依次把药膏涂到两根肉棒上。");
            outputText("[pg]过了一小会儿才有反应，但变化开始时，阿瑞安发出一声闷哼。[say:有、有什么感觉不一样了。呃，这感觉好怪。]你们俩看着[Arian eir]的两根肉棒慢慢缩小，随后出乎你意料地融合到一起，形成了一根普通尺寸的阴茎，和阿瑞安以前那根很像。");
            outputText("[pg][say:我想我又变回一个只有一根阴茎的蜥蜴人了，]阿瑞安带着一丝遗憾说道。你安慰[Arian em]说你更喜欢这样，再说，只有一根阴茎真的有那么糟吗？阿瑞安对你笑了笑。[say:我想也没那么糟，只是对我的种族来说有点少见。不过既然你喜欢我这样，那我也没问题。]你点点头，轻轻拍了拍[Arian em]的脑袋。[say:所以……你还想做点别的吗？]");
         }
         else
         {
            outputText("[pg]接着，[Arian ey]将[Arian eir]的蛇形阴茎从藏身处引出来。最后，[Arian ey]把药膏涂在[Arian eir]的阴茎上，耐心等待变化开始。");
            outputText("[pg]你们俩等了一会儿，但迟迟没有任何变化，阿瑞安开口说道：[say:我想……什么都没变？]你也觉得是这样，照理说早该有反应了。不过这也没关系，你们只好试试别的。[say:好吧……那你还想做点别的吗？]");
         }
         menu();
         addButton(0,"下一步",giveArianAnItem);
      }
      
      public function treatCorruption() : void
      {
         var _loc1_:* = null as IMap;
         arianSprite();
         clearOutput();
         outputText("你问阿瑞安，[Arian ey]觉得自己能不能帮你减少一些侵蚀你灵魂的污染。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,949) == 1)
         {
            outputText("[pg]阿瑞安郑重地摇了摇[Arian eir]的头。[say: 抱歉，[name]。但我今天已经为你治疗过一次了，如果再来一次，可能会对你造成危险……抱歉。]");
            outputText("[pg]你向[Arian em]道歉。你忘了那会让[Arian em]消耗多大，你明天会再回来接受后续治疗。不过，还有别的事[Arian ey]可以帮你……");
            arianHomeMenu();
         }
         else
         {
            outputText("[pg]阿瑞安点点头。[say: 当然！握住我的手就好。][Arian Ey]伸出[Arian eir]的手，等你摆好姿势。");
            outputText("[pg]你用自己的手握住[Arian eir]那双鳞片光滑的手，耐心等待[Arian em]开始。");
            outputText("[pg][say: 现在，闭上眼睛，专注于呼吸……深而平稳地呼吸。你应该会感觉到一种奇怪的电流感，但尽量放松。]");
            outputText("[pg]你点点头，闭上眼睛，开始缓慢而有节奏地吸气、呼气，按照[Arian eir]的指示让自己平静下来。");
            outputText("[pg]过了一会儿，你终于开始感觉到阿瑞安所说的那种奇怪感觉。它沿着你的手臂流淌，并扩散到你的全身。片刻之后，你觉得身体被那种感觉弄得发麻，也就在这时，你察觉到了别的东西……有那么一瞬间，你感觉自己像是被一个幽灵紧紧抱住。它仿佛既存在，又不存在。看不见的手在你身上游走，而你慢慢觉得，自己的一部分正被取走。这感觉并不糟，也绝对不疼，只是……不太舒服。");
            outputText("[pg][say: 够了。现在可以睁开眼睛了，]阿瑞安说道。与此同时，在你体内流窜的所有奇异感觉都戛然而止。你松开这位蜥蜴人法师带爪的手，才发现自己正在喘气……就好像刚刚进行过某种体力活动一样。");
            outputText("[pg]注意到你的担忧，阿瑞安笑了笑。[say: 别担心，[name]。花一点时间把气喘匀，你就会感觉好些的。]");
            outputText("[pg]你照[Arian eir]说的做了，并注意到，一旦感觉好些之后，你确实是实实在在地感觉更好了；你的思绪不再像之前那样被腐化蒙蔽");
            dynStats(DynStat.Cor(-1));
            get_player().changeFatigue(20);
            if(get_player().cor == 0)
            {
               outputText("——事实上，你很确信阿瑞安已经把你完全净化了");
            }
            outputText("。你感谢这位蜥蜴人为你施展的魔法治疗。");
            outputText("[pg][say: 不用谢，][Arian ey]微笑着回答。[say: 只要记住，我们每天只能做一次。再多的话，对我们两个都会有危险。]");
            outputText("[pg]你表示明白[Arian ey]的意思，承诺以后会尽量更加小心，再次向[Arian em]道谢，然后告辞离开。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,949,FlagDict_Impl_.arrayReadInt(_loc1_,949) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,955) > 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,955,FlagDict_Impl_.arrayReadInt(_loc1_,955) + 1);
         }
         if(get_game().time.hours > 23)
         {
            if(get_arianScene().arianFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,953,FlagDict_Impl_.arrayReadInt(_loc1_,953) + 1);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,946,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,949,0);
         }
         return false;
      }
      
      public function talkToArianChoices() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉阿瑞安，你想和[Arian em]聊聊。阿瑞安一想到能和你聊天就笑了起来。[say:我喜欢和你聊天；所以你想聊什么？]");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) > 0)
         {
            addButton(0,"聊点涩的",arianSexingTalk);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) >= 3)
         {
            addButton(1,"学习魔法",arianMagicLessons);
         }
         if(!arianFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) >= 6)
         {
            addButton(4,"邀入营地",inviteArianToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) < 3)
         {
            outputText("[pg]<b>阿瑞安现在没什么可聊的。也许你该时不时去看看阿瑞安，或者找件能帮[Arian em]对抗[Arian eir]病症的物品。</b>");
         }
         addButton(14,"返回",arianHomeMenu);
      }
      
      public function takeYerLizardHomePartII() : void
      {
         clearOutput();
         arianSprite();
         outputText("抵达营地后，阿瑞安首先注意到的就是那道闪烁的传送门。[say: 这就是……你来的地方吗？] 阿瑞安问道。");
         outputText("[pg]你点点头，确认没错，这就是你从自己的世界进入玛瑞斯的入口。");
         outputText("[pg][say: 我听说过，有时会有其他世界的人通过传送门误入玛瑞斯，但我以前从没这么近距离地见过。] 阿瑞安深深凝视着传送门。[say: 真美……也很危险。] [Arian Ey]从出神中回过神来，在离你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
         {
            outputText("小屋不远的一块空地上停下。[say: 你这小屋真不错，] 阿瑞安说。你谢过他的夸奖。");
         }
         else
         {
            outputText("帐篷不远的一块空地上停下。");
         }
         outputText("[pg][Arian Ey]放下[Arian eir]那个塞得满满当当的包，问道：[say: 我可以待在这里吗？]");
         outputText("[pg]你告诉这位蜥蜴人法师，这应该没问题。不过，就算[Arian eir]有一身鳞片，也总不能露天睡在光秃秃的地上吧？");
         outputText("[pg]阿瑞安笑了起来。[say: 当然不会啦，傻瓜。我要在这里搭自己的帐篷。]");
         outputText("[pg]帐篷？你重复了一遍。你告诉[Arian em]，你可从没见[Arian em]带帐篷过来。");
         outputText("[pg][say: 哦，我明白了……那你最好往后退一步，] 阿瑞安带着狡黠的笑容提醒你。");
         outputText("[pg]你不知道这个古怪的法师打算做什么，但还是照[Arian ey]说的做了；你还没蠢到会无视这种警告。");
         outputText("[pg]阿瑞安打了个响指，那个塞得满满的包顿时像爆炸一样迸出一大团布料。你惊讶地看着一顶相当朴素却结实的帐篷在没有任何帮助的情况下自行搭了起来。只过了大约一分钟，帐篷就稳稳地立在了合适的位置，入口处还垂着一小块篷布。");
         outputText("[pg][say: 以防你忘了，[name]，我可是个大法师，] 阿瑞安骄傲地笑着说道。");
         outputText("[pg]你看着这顶突然出现的帐篷，摇了摇头。说真的，你当然没忘……只是你不知道魔法还能用在这种日常小事上。[Arian Ey]这次确实让你大吃一惊。");
         outputText("[pg]阿瑞安慢慢走向入口，替你掀起篷布。[say: 想不想进去看看？]你点点头，跟着这位蜥蜴人走进帐篷。");
         outputText("[pg]走进去时，你忍不住惊讶地倒吸一口气……显然你低估了这位蜥蜴人。帐篷里面比外面看起来大得多，而且你能看到在荒野中相对舒适地生活所需的各种工具和设施。");
         outputText("[pg]在一个角落里，你看到一处像是小厨房的地方，各种厨具一应俱全。对面的角落里则摆着一张工作桌，很像阿瑞安曾在[Arian eir]家里布置的那张。房间中央放着一张看起来很舒服的长沙发，前面还有一张小桌子。再往里，你看到一张舒适的床，旁边立着几排书架和一个小衣柜。柔软的地毯铺满了帐篷的地面；你抬头望去，又看到一盏像是小魔法灯的东西，照亮了整座帐篷。你清楚地看出，阿瑞安住在这里会有多舒服；相比之下，你");
         if(get_camp().followersCount() > 1)
         {
            outputText("和你的其他同伴");
         }
         outputText("。");
         outputText("[pg][say: 那么，你觉得怎么样？够舒适吗？]阿瑞安问道。");
         outputText("[pg]你告诉[Arian em]，这里确实看起来非常舒适。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) <= 0)
         {
            outputText("事实上，你还开玩笑说，自己说不定会把睡铺搬进来，和这位蜥蜴人一起睡，而不是睡在自己的帐篷里。阿瑞安移开[Arian eir]目光，然后有些紧张地对你笑了笑。[saystart]其、其实你不用带睡袋过来……");
         }
         else
         {
            outputText("[saystart]");
         }
         outputText("如果你想留在这里，我很乐意和你分享我的床。[sayend]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) <= 0)
         {
            outputText("[pg]你告诉这位蜥蜴人，刚才只是个玩笑……不过，你拖长了语调说，你会记在心上的。");
         }
         outputText("也许某个晚上你真的会过来。");
         outputText("[pg]阿瑞安点点头。[say: 只要你愿意，这里随时欢迎你。]");
         outputText("[pg]你礼貌地告辞，说你该让这位蜥蜴人在[Arian eir]新家里好好安顿一下，然后走回外面。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,933,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckAriansDick() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-home-suckariandick");
         }
         else
         {
            get_images().showImage("arianmale-home-suckariandick");
         }
         outputText("你故意淫荡地舔了舔嘴唇，问阿瑞安[Arian ey]愿不愿意让你尝一点蜥蜴人的精华……？");
         outputText("[pg][say:你确定吗？要是你想的话，我也可以为你做点什么，]阿瑞安提议道。");
         outputText("[pg]你坚决地摇了摇头；你告诉这位爬行动物恋人，这次你想为[Arian em]做点什么。");
         outputText("[pg][say:好吧……如果你真的想这么做的话。那……我该怎么做？]这位蜥蜴人法师问道，难掩兴奋地扭动着身体，满怀期待地轻敲着[Arian eir]的手指。");
         outputText("[pg]你吩咐[Arian em]只要上床就好；你很确定剩下的事自己能处理。");
         outputText("[pg][say:好吧，]阿瑞安紧张地回答，[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("裸露在外的几根阴茎完全勃起");
            }
            else
            {
               outputText("裸露在外的阴茎完全勃起");
            }
         }
         else
         {
            outputText("肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("从它们的");
            }
            else
            {
               outputText("从它的");
            }
            outputText("藏身处探出，已经完全勃起");
            outputText("。");
         }
         outputText("[pg]你走近[Arian em]，在[Arian em]面前摆好姿势，思索着该怎么开始。你伸出一只手，开始抚弄[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("最上方的");
         }
         outputText("阴茎，对它凹凸不平、疙疙瘩瘩、球茎般表面的奇异触感惊叹不已。它摸起来实在奇特，你便兴致勃勃地继续抚弄。");
         outputText("[pg]阿瑞安只能在你的抚弄下呻吟起来，急切地挺胯蹭着你的手，渴求你的触碰。[say:哦，我的……这……被别人的手这样摸……感觉太舒服了……][Arian Eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("双生的");
         }
         outputText("每一根肉棒的顶端");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("颤抖着");
         }
         else
         {
            outputText("颤抖着");
         }
         outputText("、悸动着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
         {
            outputText("");
         }
         outputText("贴着你的手；顶端很快渗出前液");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，又沿着阿瑞安蜥蜴人肉棒的球茎状表面缓缓滑落");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("。你继续让手掌沿着越来越湿滑的表面上下滑动，还玩笑似地问[Arian em]，你的手真的有那么舒服吗？");
         outputText("[pg][say:是——的……啊！你要是继续这样，我会撑不了多久的。]阿瑞安喘息着，每一下抚弄都让[Arian eir]三趾的脚蜷起，双手紧紧攥住床单。");
         outputText("[pg]你带着一脸与眼下所作所为格格不入的无辜表情，对[Arian em]微微一笑，然后俯身凑近，舔上[Arian eir]的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，长长地、爱怜地、湿漉漉地舔了一口。味道出乎意料，像是带着糖味的辛香，而不是其他生物常有的咸味。其实还挺不错的，你发现自己像舔某种糖棒一样，沿着[Arian eir]的肉棒上下舔动，热切地吮吸、弄得满是口水，从那形状奇特的顶端哄出更多[Arian eir]美味的黏液。");
         outputText("[pg]阿瑞安在你每一次爱怜的舔舐下都扭动着身体，愉悦地低哼呻吟。[say: [name]，我要射了！] [Arian Ey]提醒你；看[Arian eir]肉棒一阵阵跳动的样子，[Arian ey]显然已经快到极限了。");
         outputText("[pg]换作别的时候，你大概会拿[Arian em]这么不持久来逗[Arian em]，但看这势头，你反而把嘴用在了更该用的地方，含住[Arian eir]的肉棒，像婴儿吮乳头一样吸吮啜舔。更多那种奇异的辛甜精液稳定地流进你的嘴里。");
         outputText("[pg]阿瑞安再也忍不住，双手紧紧揪住床单，与此同时，[Arian eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("双根肉棒又猛地抽动了");
         }
         else
         {
            outputText("肉棒又猛地抽动了");
         }
         outputText("最后一下，随即喷发进你早已等候着的嘴里");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("和下巴上");
         }
         outputText("。[Arian Eir]双腿夹住你的后背，几乎不让你退开太远，直到[Arian ey]把[Arian eir]的精液全都交给你。");
         outputText("[pg]你只是顺着[Arian ey]的意思，专心把每一滴都吞下去；即使一口接一口咽下那浓稠的精液，你也仍继续舔弄挑逗");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("，兴奋之下甚至没注意到另一根肉棒正把精液喷得你的[chest]上到处都是");
         }
         outputText("。");
         get_player().refillHunger(15);
         outputText("等[Arian ey]终于射完后，你又继续舔舐吮吸了几分钟，确保自己把最后一滴都舔得干干净净。直到这时，你才抬起头，挑逗地舔了舔嘴唇，逗弄这个已经射空的蜥蜴人。");
         outputText("[pg]阿瑞安张着嘴看着你，喘息不止。[say: 那……那真是太棒了！] [Arian ey]开心地喊道。[say: 希望我的味道没有太糟。我是说，我听说有些食物能让味道变好，可是……嗯……] [Arian Ey]紧张地笑了笑。");
         outputText("[pg]你坦白说，老实讲，那味道确实有点特别，但绝不难吃。所以，你的小蜥蜴喜欢你舔着[Arian eir]的棒棒糖、一直舔到里面奶油夹心的感觉吗？你打趣道。");
         outputText("[pg][say: 是的，我非常喜欢！不过我也希望你能让我回报你……不管用什么办法。] [Arian Ey]说道，松开[Arian eir]的双腿，把你从腿间放出来；同时[Arian eir]的尾巴懒洋洋地卷过来，温柔地按摩你的脖子，像是在表达亲昵。");
         if(!get_player().hasCock())
         {
            outputText("[pg]你告诉[Arian ey]，你会想出某种办法让[Arian ey]回报你的，");
         }
         else
         {
            outputText("[pg]嗯，正好你自己也有一根带着奶油夹心的棒棒糖可以让[Arian ey]舔，你调侃道，");
         }
         outputText("舒服地转了转脖子，任由[Arian ey]用[Arian eir]那条爬行动物般的尾巴摩擦着它。");
         outputText("[pg]阿瑞安咬着[Arian eir]的嘴唇，手指不安地缠在一起。[say:嗯，我希望很快能为你做点什么……什么都行……我真的很喜欢和你待在一起，[name]。] [Arian Ey]对你笑了笑。");
         outputText("[pg]你苦笑着开玩笑，对这位蜥蜴人法师说，[Arian ey]之所以喜欢和你待在一起，只是因为[Arian ey]能享受到这么多性爱。阿瑞安倒吸一口气，立刻脱口而出：[say:不是！当然不是！就算我们什么都不做，我也很喜欢和你待在一起！] 当[Arian ey]意识到[Arian ey]又勃起时，[Arian Ey]再次惊呼一声，羞愧地捂住[Arian eir]的脸。[say:对、对不起！我忍不住！] [Arian ey]手忙脚乱地试着遮住[Arian emself]。");
         outputText("[pg]你只是笑了笑，拍拍[Arian em]的脸颊，告诉[Arian em]，[Arian ey]脸红的时候可爱极了。你握住[Arian eir]刚硬起来的肉棒，用力撸了一把");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("，又用一根手指逗弄[Arian eir]的小穴");
         }
         outputText("以示强调，然后轻轻吻了吻[Arian em]的鼻尖，接着把衣服收拾好，准备穿上后再次出门。");
         outputText("[pg][say:呃……很快再见？]");
         outputText("[pg]你回头冲[Arian em]狡黠一笑，故意对着[Arian eir]扭了扭你的[ass]，然后走了出去。");
         dynStats(DynStat.Lust(10 + get_player().lib / 5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function succubiMilkForArian() : void
      {
         var _loc1_:* = null as IMap;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().P_S_MLK);
         outputText("你掏出那瓶净化恶魔乳，问阿瑞安愿不愿意");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("进一步");
         }
         outputText("接触一下[Arian eir]女性化的一面。为了你？");
         outputText("[pg]阿瑞安咬住[Arian eir]下唇。[say: 为了你？我当然不介意。] 你把瓶子递过去，看着[Arian ey]拔掉软木塞，将里面的东西喝了下去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,940,FlagDict_Impl_.arrayReadInt(_loc1_,940) + 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,941,FlagDict_Impl_.arrayReadInt(_loc1_,941) + 1);
            }
            outputText("[pg]阿瑞安倒抽一口气，发出一声喉间滚出的、少女般的呻吟。[Arian Ey]拉开[Arian eir]长袍，看着变化席卷[Arian eir]全身。首先" + (get_noFur() ? "" : "[Arian eir]胸前光滑的鳞片开始剥落，为一对挺立的乳头让出位置；随着这对乳头长出，") + "[Arian eir]原本平坦的胸膛开始鼓起，长成一对挺翘的" + (get_noFur() ? "" : "覆鳞") + "乳房。下方，阿瑞安感觉一股热意在[Arian eir]双腿间汇聚；等[Arian ey]分开双腿，[Arian ey]顿时倒抽一口气。一道裂缝出现了，" + (get_noFur() ? "" : "周围的鳞片变得更小、更柔软，") + "形成了一个看上去紧致的小穴。阿瑞安新生的阴唇鼓胀起来，湿润的甬道里淫液开始不断流出，与此同时，阿瑞安小小的快感肉珠似乎将[Arian eir]阴唇微微撑开，分明是在邀请你探索它的深处。");
            outputText("[pg]你把视线从阿瑞安新生的小穴上移开，看向这名刚变成双性的蜥蜴人的眼睛，问[Arian ey]感觉还好吗。阿瑞安喘着气，探寻般的双手游移到[Arian eir]乳房上，轻轻揉捏起来。[say: 好热……好热……]阿瑞安的阴茎完全从藏身处垂了出来，硬得像石头，还在一跳一跳地搏动。");
            outputText("[pg]你告诉[Arian em]你去给[Arian em]拿点冷饮，说着便转身朝门口走去。[say: 快、快点，拜托了！]你不需要更多催促，立刻冲向厨房，从冷藏箱里抓起一罐水，又尽可能快地跑了回来。");
            outputText("[pg]你刚走进阿瑞安的房间，[Arian ey]就一把从你手里抢过水罐，开始仰头猛灌。你惊讶地看着阿瑞安把整罐水喝得一滴不剩，几滴溅出的水珠落在[Arian eir]裸露的" + (get_noFur() ? "皮肤" : "鳞片") + "上，汇成细小的水流，沿着阿瑞安越发女性化的曲线滑落。喝完后，阿瑞安松了口气，安静地把水罐递还给你，并用前臂擦了擦[Arian eir]嘴唇。[say: 谢谢你，[name]。我真的太需要这个了。]阿瑞安对你笑了笑，已经不再热得像要沸腾一样。[Arian Eir]先前勃起的阴茎");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("已经软了下来，并缩回");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
            {
               outputText("尽可能地");
            }
            outputText("保护性的裂缝里。");
            outputText("[pg]你小心地问阿瑞安感觉还好吗；[Arian ey]刚刚经历了相当剧烈的变化。阿瑞安低头打量自己，双手抚过[Arian eir]新近女性化的身体。[say: 我想我没事。至少，我现在感觉确实不错。]");
            outputText("[pg]你忍不住指出，[Arian ey]看起来也相当不错。听到你的评价，阿瑞安脸红了。[say: 呃……谢谢。]阿瑞安探寻般的一只手摸到[Arian eir]新生的裂缝，[Arian ey]用带爪的手指绕着[Arian eir]柔软的阴唇打转，快感让[Arian ey]倒抽一口气，并把一些[Arian eir]淫液抹到了[Arian eir]手指上。[Arian Ey]把那根手指举到[Arian eir]面前，看着水润的液体从[Arian eir]指尖滴落；接着，[Arian ey]几乎不假思索地将手指含进[Arian eir]嘴里，开始轻轻吮吸起来。");
            outputText("[pg]你故意咳了一声，告诉[Arian em]，如果[Arian ey]想试试[Arian eir]的新身体，你倒不一定介意，不过[Arian ey]真的想在你面前表演吗？还是更希望你先离开？阿瑞安猛地从恍惚中回过神来，羞得满脸通红。[say: 啊！对不起！]阿瑞安试图用[Arian eir]双臂遮住[Arian eir]乳房和胯间。[Arian Ey]有些局促地动了动，然后紧张地朝你笑了笑。[say: 呃，也许……你愿意帮我适应一下这具新身体吗？]阿瑞安移开[Arian eir]视线，为自己刚才说出的话羞得满脸通红。");
            outputText("[pg]你向前一步，轻轻把手抚上[Arian eir]新生的乳房。好吧，如果[Arian ey]现在有这个兴致，你当然乐意奉陪。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) < 3)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,941,FlagDict_Impl_.arrayReadInt(_loc1_,941) + 1);
            outputText("[pg]暖意席卷阿瑞安的身体，引得[Arian ey]倒抽一口气，又发出一声呻吟。很快，那股暖意聚集到阿瑞安的胸脯上，[Arian ey]拉开[Arian eir]长袍，凝视着正在发生的变化。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
            {
               outputText("[pg]阿瑞安挺翘的乳房胀大成一对完美又看似柔软的圆丘。阿瑞安试探着揉捏[Arian eir]新近变大的乳房，那份柔软与敏感让[Arian ey]舒服地倒抽一口气。[say: 感觉真舒服。]阿瑞安红着脸看向你，问道：[say: 你想摸摸它们吗？]");
               outputText("[pg]你找不到拒绝这个机会的理由，于是伸出手，轻轻握住它们，让那份重量在掌心里滚动。" + (get_noFur() ? "" : "你还特意对阿瑞安感叹，说自己完全没想到覆着鳞片的胸部竟然也能这么柔软、这么挺翘。"));
               outputText("[pg]你轻轻按摩[Arian eir]乳房时，阿瑞安倒抽着气，发出一声叹息。[say: [name]……这样好舒服。]");
               outputText("[pg]你表示自己也觉得手感相当不错。不过，阿瑞安是不是想让亲密程度再升一级？阿瑞安脸红了。[say: 我可不会抱怨。][Arian Ey]开始局促地动了动");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) >= 3)
               {
                  outputText("，而[Arian eir]裸露在外的阴茎也开始变硬");
               }
               outputText("。");
            }
            else
            {
               outputText("[pg]阿瑞安丰满的胸脯再度膨胀起来。阿瑞安快感涌上，倒抽一口气，而乳房的成长也进一步增强了这名蜥蜴人的敏感度。等扩张终于结束，阿瑞安惊叹地托起那对巨大的圆球。[say: 好、好大……也好重。][Arian Ey]用双手托动着乳房，轻轻触碰[Arian eir]柔软的" + (get_noFur() ? "皮肤" : "鳞片") + "和敏感的乳头，在快感中倒抽着气、喘息不止。");
               outputText("[pg]你说它们看起来也相当大；这么说来，[Arian ey]肯定是你见过胸部最丰满的蜥蜴人了。阿瑞安红着脸，咬住[Arian eir]下唇。[say:你喜欢它们吗？]你面无表情地看了[Arian em]一眼，伸手抚上那对乳房。要是你不喜欢大胸，那又为什么要让[Arian em]把它们变得这么大呢？不过，[Arian ey]对它们现在这个样子还适应吗？");
               outputText("[pg]阿瑞安在你的触碰下颤抖起来。[say:它们是有点重，不过如果你真的喜欢，我不介意就这样保持下去。]阿瑞安有些紧张地对你笑了笑。[say:我希望你会帮我托着它们？][Arian Ey]局促地扭动着身子");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
               {
                  outputText("而你看见[Arian eir]裸露的肉棒正缓缓挺起，指向你");
               }
               outputText("。");
               outputText("[pg]你用双手捧住那对丰盈的" + (get_noFur() ? "" : "覆鳞") + "胸脯，告诉[Arian em]这事你非常乐意帮忙。不过，也许[Arian ey]更想……先把这份重量从[Arian eir]脚上卸下来，嗯？你说完，凑上前去，俏皮地舔过[Arian eir]" + (get_noFur() ? "鼻子" : "吻部") + "的尖端，让你的暗示变得更加明显。");
               outputText("[pg]阿瑞安脸红得厉害，却还是对你笑了。[say:我……我很愿意。]");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 1 && !get_hyper())
         {
            outputText("[pg]暖意流遍阿瑞安全身，[Arian ey]明显愉悦地呻吟起来。接着，[Arian ey]敞开[Arian eir]长袍，看向[Arian eir]那根坚硬如铁、末端鼓胀的肉棒。它一阵抽动，仿佛正逼近一场猛烈的高潮，但令阿瑞安惊讶的是，它开始缩小，直到最后软垂下来，藏进了保护性的缝隙里。[say:我……没想到会这样，]阿瑞安说道。");
            outputText("[pg]你指出这并不算太意外；那瓶药剂本来就是雌化药，所以它一定是在消去[Arian eir]身上仅存的阳刚痕迹——[Arian eir]的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("。[say:哦……这很好，对吧？]阿瑞安紧张地看着你。你仔细想了想，坦白说，虽然你对女人比对男人更有兴趣，但如果[Arian ey]不愿意，你不会强迫阿瑞安变成完全的女性。");
            outputText("[pg]阿瑞安为你的体贴露出笑容。[say:谢谢你，[name]，不过如果你更希望我是个女孩……呃……完全的女性，我也不会反对。怎样都可以。]阿瑞安咧嘴一笑。");
            outputText("[pg]于是你问，既然阿瑞安对[Arian eir]女性化的一面这么适应，也许[Arian ey]想试试[Arian eir]那些更女性化的部位？阿瑞安红着脸移开视线，轻轻点了点头。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) >= 1 && !get_hyper())
         {
            outputText("[pg]暖意流遍阿瑞安全身，[Arian ey]明显愉悦地呻吟起来。接着，[Arian ey]敞开[Arian eir]长袍，看向[Arian eir]那一对坚硬如铁、末端鼓胀的肉棒。它们一阵抽动，仿佛正逼近一场猛烈的高潮，但令阿瑞安惊讶的是，它们开始融合，直到只剩下一根爬虫般的阴茎；最后它软垂下来，缩回了藏身之处。[say:它们融合成一根了，]阿瑞安说道。");
            outputText("[pg]你猜，也许是因为那奶正赋予[Arian em]越来越强的女性特质？");
            outputText("[pg][say:也许吧……这很好，对吧？]阿瑞安问道。你只是平静地迎上[Arian eir]的目光，告诉[Arian em]，如果[Arian ey]希望这是好事，那它就是好事；如果[Arian ey]对你在[Arian em]身上做的事感到不舒服，[Arian ey]就必须告诉你，你保证会停下来。");
            outputText("[pg][say:不！我没事！]阿瑞安坚持道。[say:我只是还不习惯，呃……像这样重塑自己的身体。不过如果你觉得我这样更好看，那我很乐意照做。]阿瑞安笑了。");
            outputText("[pg]你告诉[Arian em]，不管怎么说，你确实觉得[Arian ey]很美，然后对[Arian em]露出一个充满欲望的笑容，问[Arian ey]想不想让你亲自证明[Arian ey]到底有多美？");
            outputText("[pg]阿瑞安红着脸。[say:我……给我看看……]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,939,0);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 1 && !get_hyper())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,938,0);
            outputText("[pg]暖意流遍阿瑞安全身，[Arian ey]明显愉悦地呻吟起来。接着，[Arian ey]敞开[Arian eir]长袍，看向[Arian eir]那根坚硬如铁、末端鼓胀的肉棒。它一阵抽动，缓缓缩回了藏身之处。一股像是不甘似的精液射向空中，溅落在[Arian eir]腹部；包裹着[Arian eir]最后男性特征的缝隙终于闭合，只留下光滑的" + (get_noFur() ? "皮肤" : "鳞片") + "。阿瑞安喘息着说：[say:看来我现在彻底变成女性了。]");
            outputText("[pg]你同意[Arian eir]的总结，接着指出[Arian ey]对此接受得相当平静。毕竟，光是长出小穴、还一直产卵就已经够让人震惊了，可现在[Arian ey]甚至连[Arian eir]的肉棒都没有了。");
            outputText("[pg]阿瑞安看着你，脸红了。[say: 你觉得我漂亮吗？]");
            outputText("[pg]你告诉[Arian eir]，是的，[Arian ey]是个非常漂亮的女孩。");
            outputText("[pg]阿瑞安有些坐立不安。[say: 那我就别无所求了。][Arian Ey]对你露出微笑。");
            outputText("[pg]你只是定定地看着[Arian em]；[Arian ey]真的确定这样就够了吗？这是你把[Arian eir]变成这样的，你当然也可以给[Arian em]弄点能逆转变化的东西，哪怕只能逆转一部分也好，不是吗？");
            outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say: 我没事的，[name]。真的。如果我不想要，或者有什么不能接受的，我早就说了。所以我说没事，你就相信我吧。再说，这感觉也不算坏，而且我还能拥有你。][Arian Ey]脸红了。");
            outputText("[pg][say: 拥有你……或者说，]你咧嘴一笑，[say: 更该问的是怎么拥有，对吧？]");
            outputText("[pg]阿瑞安咬住[Arian eir]下唇。[say: 嗯，我想我们可以做点什么。如果你愿意的话？]阿瑞安有些坐立不安。");
         }
         else
         {
            outputText("[pg]暖意流遍阿瑞安全身，[Arian ey]显然愉悦地呻吟起来。但突然间，那股暖意消失了，阿瑞安拉开[Arian eir]长袍，查看身上的变化。似乎什么都没变。[say: 我想都已经是真正的女孩了，也不可能再变得更女孩子了，]阿瑞安说道。");
            outputText("[pg]你指出这显然是个限制。不过，你提议说，如果[Arian ey]至少想把[Arian eir]的阴茎长回来，你肯定能给[Arian em]找点东西；[Arian ey]显然对你很忠诚，你想，给点小小的善意也不会让你吃亏。");
            outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say: 不，我这样就好。除非你想让我有阴茎？]");
            outputText("[pg]你告诉[Arian em]你会考虑的；现在，你想试试这个焕然一新、完完全全变成女孩的[Arian em]……当然，前提是[Arian ey]愿意让你试？");
            outputText("[pg]阿瑞安微笑着，有些坐立不安。[say: 我可以让你试试……]");
         }
         arianSexMenu(false);
      }
      
      public function sleepWithArian(param1:Boolean = false) : void
      {
         arianSprite();
         if(param1)
         {
            clearOutput();
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Arian");
         outputText("冒险了一整天后，你感到疲惫不堪，决定休息一下，睡上一觉。回想今天发生的事时，你想起阿瑞安曾提过，可以让你住进[Arian eir]帐篷，和[Arian em]一起睡在[Arian eir]床上。你疲惫的身体今天确实很需要一张柔软的床，或许也需要某个蜥蜴人陪在身边。想到这里，你朝[Arian eir]帐篷走去。");
         outputText("[pg]进到里面，你看见那位" + arianMF("male","girly") + "蜥蜴人正赤裸地站在[Arian eir]床前，尽可能舒展开[Arian eir]手臂和尾巴，关节啪嗒作响时还满足地低吟着。显然[Arian ey]还没注意到你进来，只是一边哼着小调，一边忙着整理[Arian eir]床上的被褥，弯下腰时正好让你把[Arian eir]可爱的屁股看了个清楚。你欣赏了几秒这番景色，然后轻轻咳了一声，提醒[Arian em]你来了。");
         outputText("[pg]阿瑞安吓了一跳，慌忙尽力遮住[Arian eir]私处，这才注意到你就站在帐篷里。[say: 啊，你好，[name]。抱、抱歉，我现在不太方便……我正准备睡了。你找我有事吗？]");
         outputText("[pg]你朝[Arian em]笑了笑，问今晚一起睡的邀请还算不算数。你解释说，今晚实在不太想一个人睡。");
         outputText("[pg]阿瑞安热切地点点头。[say: 当然！让我先穿件舒服的长袍。平时我都是裸睡的，不过既然你来了……]");
         outputText("[pg]你立刻打断[Arian em]，说如果[Arian ey]平时就是这么睡的，那也没必要为了你改变。事实上，如果这样能让[Arian em]更自在，你也可以陪[Arian em]一起裸睡。");
         outputText("[pg][say: 真的吗？嗯……那个，听说肌肤相贴更容易共享体温，所以……]阿瑞安一边绞着[Arian eir]手指，声音渐渐低了下去，也不再费心遮掩[Arian emself]了。");
         outputText("[pg]你毫不掩饰自己对眼前景色的欣赏，告诉[Arian em]这画面确实很养眼，然后开始脱下衣物，还特意为你的蜥蜴人爱人小小地表演了一番。");
         outputText("[pg]阿瑞安坐立不安，却又看得入了迷，目不转睛地望着你一件件脱下[armor]。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("你清楚地看见[Arian eir]裸露在外的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("一看到这场面便硬了起来。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("你能看出[Arian ey]被这场小表演撩动了，尽管[Arian eir]身体已经很擅长把反应藏起来。");
         }
         outputText("你只是任由[Arian em]在那里局促不安，假装没看见[Arian eir]的反应，随后指了指床，问你们两个谁先进去。");
         outputText("[pg]阿瑞安往旁边让开，示意你先上床。[say: 别担心，我最近刚洗过床单，所以应该没问题……如果你在意的话。]");
         outputText("[pg]担心？你坏笑着问自己有什么好担心的，同时慢悠悠地走过去，滑进床上。你笑着惬意地扭了扭身子，告诉阿瑞安，在坚硬地面上的睡袋里睡了这么久之后，[Arian eir]床单和柔软的床垫感觉简直棒极了。");
         outputText("[pg]阿瑞安对你笑了笑。[say: 你觉得舒服就好。你要知道，我的被窝里永远都会给你留个位置。]哦？这是在邀请你睡前做点……轻松运动吗，嗯？你逗着这位蜥蜴人。阿瑞安移开[Arian eir]目光，咬着[Arian eir]下唇，急忙脱口而出。[say: 不是！我是说……我也不介意……可是我，嗯……如果你不介意的话，我就先钻进被子里了。]你轻笑一声，示意[Arian em]过来。");
         outputText("[pg]阿瑞安在你身边躺下，又往你这边挪了挪，尽可能贴近你。你立刻伸手搂住[Arian eir]腰，又顺势用[legs]缠住[Arian em]，把自己贴在[Arian eir]光滑的鳞片上轻轻蹭着。");
         outputText("[pg]阿瑞安因这亲密的接触而幸福地叹了口气。[say: 你的[skinfurscales]贴着我的鳞片，感觉真好。好温暖……][Arian ey]依偎到你怀里，[Arian eir]尾巴搭在你的腰间，整个人沉进你的拥抱。你只是把[Arian em]又抱紧了一点，搂在怀里，除了低声说句好好睡之外什么也没说。[say: 晚安，[name]，][Arian ey]也轻声回道，随后朝照亮帐篷的球体伸出手，打了个响指，让光芒熄灭。");
         awardAchievement("我的帐篷比你的好（并不）",160,true,true);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg]一种奇怪的感觉，伴随着轻微的声响，把你从睡梦中唤醒。你意识到阿瑞安正在睡梦中动来动去，嘴里轻声自言自语，[Arian eir]尾巴也在被子下轻轻来回摆动，有时还会不小心用温暖的尾身蹭过你的[skinfurscales]。");
            outputText("[pg]一开始你还以为这个蜥蜴人真的醒了，但仔细一看，你才发现[Arian ey]只是在说梦话。你要偷听一下，还是继续睡？");
            menu();
            addButton(0,"偷听",listenToLowAnalXPArian);
            addButton(1,"睡觉",dontListenToLowAnalXPArian);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg]你被轻柔的呜咽声迷迷糊糊地吵醒了。你感觉到有一对臀部正一下又一下轻轻蹭着你的胯间，还有一条修长、光滑鳞片覆盖的尾巴从你的[chest]上扫过。看来阿瑞安正在做梦……而且多半还是个色情的梦。");
            outputText("[pg]你要偷听一下，顺便也许逗逗[Arian em]？还是继续睡？");
            menu();
            addButton(0,"偷听",listenToMediumAnalXPArian);
            addButton(1,"睡觉",dontListenToMediumAnalXPArian);
         }
         else
         {
            outputText("[pg]你醒了过来，一时有些茫然，不知道是什么搅了你的睡眠。醒来时，你差点以为阿瑞安也醒着；[Arian ey]正执拗地发出愉悦的呻吟，急切地用[Arian eir]屁股在你胯间磨蹭，尾巴也胡乱甩动着。好啊，这只调皮的小蜥蜴；[Arian ey]正在做春梦呢！");
            outputText("[pg]你要稍微逗逗[Arian em]吗？还是试着让[Arian em]安静下来，然后继续睡？");
            menu();
            addButton(0,"逗弄",TeaseHighAnalXPArian);
            addButton(1,"睡觉",dontTeaseHighAnalXPArian);
         }
      }
      
      public function sexTalkFinish(param1:Boolean = false) : void
      {
         arianSprite();
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("这番闲聊让你很满意，你拍了拍这个蜥蜴人的头，便告辞离开，回到了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function receiveLethiciteStaff() : void
      {
         clearOutput();
         outputText("一根附魔莱希石法杖听起来相当厉害。你把三块碎片和一根法杖交给阿瑞安，并告诉[Arian em]这就是你想要的。这名白化法师小心翼翼地把它们捧在[Arian eir]手里，仔细端详了好几分钟。你清了清嗓子，把这名蜥蜴人的注意力拉回到你身上，并问[Arian ey]在做什么。");
         outputText("[pg][say: 啊，抱歉。只是它太令人着迷了。能有机会处理莱希石可不常见，所以有点……让人分心。不过我现在就开始，[name]。应该不会花太久。]说完，你这位会附魔的恋人把材料带到一张桌前，开始[Arian eir]的工作。");
         outputText("[pg]你帮不上忙，便躺到阿瑞安的长沙发上放松，顺便看着[Arian em]忙碌起来。你偶尔看见[Arian eir]的桌边泛起光芒，偶尔听见几句咒骂，没过多久便闭上了眼睛。等你睁开眼时，惊讶地看到阿瑞安站在你面前，手里拿着一根顶端镶嵌着莱希石、十分漂亮的法杖。[say: 看，[name]！我成功了！这确实是一次全新的体验，也有点困难，不过我已经把莱希石妥善灌注进法杖里了。]你从长沙发上起身，伸了个懒腰，然后检查这件新打造的武器。它确实看起来很强大。你从阿瑞安手中接过法杖，立刻感觉到一股秘法能量涌来。你很容易就能感觉到，这根法杖确实在引导莱希石的魔力。你向这名蜥蜴人法师道谢，并感激地拍了拍[Arian em]的头。[Arian Ey][if (!nofur) {透过[Arian eir]白化的鳞片}]红了脸，随后给了你一个短暂的拥抱。[say: 我一直都很乐意帮你，[name]。而且说实话，能处理这么稀有的东西真的很有趣。我在别处可得不到这种机会。如果你以后还弄到什么少见的东西，想让我来处理的话，请尽管开口。]");
         outputText("[pg]你告诉[Arian em]你一定会的，并在离开这顶奢华帐篷时，手握新法杖，向[Arian em]道别并表达感谢。");
         get_player().destroyItems(get_useables().LETHITE,3);
         get_player().destroyItems(get_weapons().W_STAFF,1);
         get_inventory().takeItem(get_weapons().L_STAFF,get_camp().returnToCampUseOneHour);
      }
      
      public function pickAnEggArian(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "pink";
         }
         arianSprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,954,param1);
         outputText("你告诉阿瑞安，你想让[Arian em]给你做一枚" + Utils.cnName(param1) + "蛋。");
         outputText("[pg][say: 好的，]阿瑞安回答道，闭上[Arian eir]眼睛，开始集中[Arian eir]魔力。");
         outputText("[pg]你惊奇地看着一道" + Utils.cnName(param1) + "光芒似乎在阿瑞安的腹中汇聚，随后又慢慢淡去。这位蜥蜴人法师微笑着睁开[Arian eir]眼睛，尾巴在[Arian eir]身后开心地懒懒摆动着。[say: 完成了。我试着给所有蛋都注入了魔力，不过成功与否，得等它们生下来才知道。]");
         outputText("[pg]你感谢[Arian em]的努力，在[Arian eir]脸颊上轻轻亲了一下，然后劝[Arian em]好好休息。阿瑞安点点头。[say: 我明天应该就能产蛋了，所以别忘了来看我。]");
         outputText("[pg]你会意地点点头，离开[Arian eir]帐篷时向[Arian em]挥了挥手。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,955,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function penetrateArian() : void
      {
         arianSprite();
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,942,FlagDict_Impl_.arrayReadInt(_loc2_,942) + 1);
         arianHealth(3);
         get_images().showImage("arianfemale-home-penetrate");
         outputText("你欣赏着这位跨性别蜥蜴人的身体，从[Arian eir]女性化的五官，到[Arian eir]的[Arian chest]，再一路看到[Arian eir]匀称的大腿。你告诉阿瑞安，这样的变化很适合[Arian em]；很少有男孩在变成");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText(arianMF("扶他。","带屌女孩。"));
         }
         else
         {
            outputText("女孩。");
         }
         outputText("[pg]阿瑞安笑了笑，移开[Arian eir]目光，揉着自己的一只胳膊。[say: 你真的这么觉得？] [Arian Ey]紧张地咬住[Arian eir]下唇。");
         outputText("[pg]你点点头，坚称自己就是这么想的。你带着欲望低声呢喃，问[Arian ey]想怎样试试[Arian eir]女孩子的部位，也许可以看看在适当的……鼓励下，[Arian ey]能感觉到自己有多漂亮？");
         outputText("[pg][say: 当然！我很愿意。那我该做什么？] [Arian ey]问道，尾巴在[Arian eir]身后懒洋洋地摆动，等待着进一步的指示。[say: 我要先帮你准备好吗？] [Arian Ey]低头看向你的两腿之间，看到你半硬的鸡巴");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。[say: 呃……让它更准备好一点？] [Arian Ey]紧张地笑着问。");
         outputText("[pg]你笑了笑，告诉[Arian em]，既然这对[Arian em]来说还很新鲜，你会尽量让[Arian em]来主导。你扭着腰走到[Arian eir]的床边，仰面躺下，[eachCock]骄傲地挺向空中，然后告诉阿瑞安，你想让[Arian em]骑跨到你身上。");
         outputText("[pg]阿瑞安点点头，[Arian ey]跨坐到你身上时，[Arian eir]的淫液滴落在你的[legs]上");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
         {
            outputText("，[Arian eir]裸露的鸡巴");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("因即将要做的事而硬了起来");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("，[Arian eir]鼓胀的鸡巴");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("正从各自的");
            }
            else
            {
               outputText("正从它的");
            }
            outputText("藏身处探了出来，早已因期待而完全挺立");
         }
         outputText("。阿瑞安清晰地咽了口口水。[say: 接下来呢？] [Arian ey]问道，早已欲火中烧地喘息起来。");
         outputText("[pg]你轻轻伸手扶住这名蜥蜴人的臀部，告诉[Arian em]，首先你们得结合起来。你慢慢引导[Arian em]坐下，感受[Arian eir]那近乎人类女性的肉缝在你鸡巴顶端周围分开。");
         outputText("[pg]阿瑞安呻吟着，想把自己往[oneCock]上套得更深来加快节奏，可插入带来的快感让[Arian em]失去了平衡，[Arian ey]一头趴倒在你的[chest]上。[say: 啊！对、对不起！][Arian Ey]紧张地朝你笑了笑。");
         outputText("[pg]你冲[Arian em]笑了笑，轻轻拍了拍[Arian em]的脸颊，告诉[Arian em]放轻松，没必要急。你以近乎折磨人的耐心，继续轻柔地将自己送入这名");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 0)
         {
            outputText("女性");
         }
         else
         {
            outputText("双性");
         }
         outputText("蜥蜴人体内，直到你终于整根没入[Arian em]体内。");
         outputText("[pg]阿瑞安颤抖着，用[Arian eir]被撑开的穴唇在你的胯间蹭动。[say: 感觉太舒服了。我从来没想过自己有一天会有这种感觉。你的肉棒把我填得满满的，我好喜欢。我什么都能感觉到……每一下细微的抽动，每一条细小的血管，那种纹理……全部都能感觉到。]");
         outputText("[pg]你低声告诉[Arian em]，最棒的还在后头。随后你开始缓缓上下挺动腰胯，逐渐加快节奏；当你感到[Arian eir]湿滑的穴唇贪婪地回应着亲吻你的肉棒时，也忍不住愉悦地低吟起来。");
         outputText("[pg]阿瑞安喉间发出低沉的呻吟，用[Arian eir]的腰胯在你插入[Arian eir]体内的肉棒上扭动，直到[Arian ey]开始缓缓起伏，尽力跟上你的节奏。[say: 好湿……我湿透了，还有这些声音！我感觉自己好热……好性感……好像被人渴望着。哦，[name]，操我！占有我！][Arian ey]说道，双手撑在你头部两侧，半阖着因欲望而迷离的眼睛俯视着你，一边朝你灼热地喘息，一边用[Arian eir]的腰胯迎合你的挺刺。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("[Arian Eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("双肉棒");
            }
            else
            {
               outputText("每一根肉棒的顶端");
            }
            outputText("在你视野之外的边缘晃动着，前液流得你满肚子都是。");
         }
         outputText("[pg]你对这名蜥蜴人笑了笑；[Arian ey]显然正十分从容地适应[Arian eir]的新性别。随后你加快了节奏，试着配合[Arian eir]越来越快的起伏，尽可能让[Arian ey]享受其中。反正这也谈不上牺牲，尤其是[Arian eir]的小穴正那样饥渴地吸吮着你的肉棒；随着你越来越用力地挺入[Arian eir]体内，那层层收紧的肉壁也研磨得愈发剧烈。");
         outputText("[pg]阿瑞安低头对你笑着，舔了舔[Arian eir]的嘴唇。[say: [name]，拜托，][Arian ey]喉音低沉地呻吟着，一半是想表示[Arian ey]有在听，一半则是出于快感。[say: 我的胸……拜托？][Arian Ey]喘息着请求道，始终没有停止在你身上的起伏。");
         outputText("[pg]你不假思索地伸手捧住蜥蜴人[Arian chestAdj]的胸脯，抚弄着[Arian eir]樱桃般小巧的乳头凸起" + (get_noFur() ? "" : "，摩挲着覆盖其上的无比光滑的鳞片，那触感既异质又色情") + "。阿瑞安在你的持续揉捏中舒服地叹息。[say: 你喜欢它们吗？我的胸部？明明我是蜥蜴人，却有胸部，会不会感觉很奇怪？]你嗓音沙哑地低声告诉[Arian eir]，你很喜欢；虽然一开始确实有些奇怪，但这个世界上比这更怪的事情多得是，而你觉得这也是[Arian eir]天生魅力的一部分。");
         outputText("[pg]阿瑞安感激地呻吟着，用[Arian eir]的腰胯在你身上研磨。[say: 听你这么说我真的好开心；你真的很会让一个女孩觉得自己被珍惜。]你注意到，阿瑞安这么自然地把[say: 自己]称作女孩，听起来多少有些奇妙。阿瑞安不安地动了动，移开[Arian eir]的视线。[say: 我、我也没办法。你埋在我的小穴里的时候，我就是……觉得自己很有女孩味——很漂亮。]那也许是因为[Arian ey]真的非常漂亮吧，你忍不住这么说道，同时仍继续挺入[Arian eir]体内。[say: 哦，[name]……操、操我。让我觉得自己很美！让我高潮！我想要你尽全力狠狠操我。求你了……]");
         outputText("[pg]你答应[Arian em]会的，但[Arian eir]在上面时，你实在没法掌控太多。阿瑞安把[Arian eir]的尾巴连同身体一起甩向一侧，迅速翻过身来，期间始终没有分开，也没有停止迎合你的起伏；即便[Arian eir]的双腿在你身后合拢，[Arian ey]也将[Arian eir]的双臂环上你的脖子。[Arian Ey]半阖着眼喘息着仰望你，随后[Arian ey]笑了。[say: 现在呢？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("[Arian Eir]的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("们抽搐着，喷出");
            }
            else
            {
               outputText("抽搐着，喷出");
            }
            outputText("一小缕前液喷到[Arian eir]肚子上，预示着接下来要发生的事；[Arian ey]也绷紧身子，准备承受你即将给予[Arian em]的猛烈抽插。");
         }
         outputText("[pg]现在，你告诉[Arian em]，你才要真正开始；而你也尽力兑现承诺，在不至于弄伤[Arian em]的前提下，用尽可能又狠又快的节奏抽插[Arian em]。[say: 啊嗯……对……太舒服了。直接干我！啊！用你的热精把我的里面涂满！]");
         outputText("[pg]阿瑞安这张嘴可真够下流的，你一边使出全力抽插[Arian em]，一边还能挤出这句玩笑话。");
         outputText("[pg][say: 那是……啊！]阿瑞安的话卡在[Arian eir]喉咙里，最后只化作一声呻吟：[say: 快、快射吧！求你了！我需要它！]");
         outputText("[pg]唔，在一位" + arianMF("扶他","女士") + "之前射出来可不礼貌，所以你还不能放任自己，至少得等[Arian ey]先高潮；你勉强喘着气说道，尽管实际上你已经快憋不住了。[say: 啊！射！跟我一起射啊啊啊！]");
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("阿瑞安的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("双根肉棒又猛地抽动了");
            }
            else
            {
               outputText("肉棒又猛地抽动了");
            }
            outputText("，[Arian ey]把[Arian eir]自己的扶他蜥蜴人精液喷洒在[Arian eir][Arian chest]和脸上。");
         }
         outputText("[Arian Eir]内壁紧紧夹住你，几乎让人发疼；一股淫液洪流如海啸般冲击着你那" + get_player().cockDescript(_loc1_) + "前端的" + get_player().cockHead(_loc1_) + "，却又从[Arian em]敞开的下体周围溢出，顺着你的下身淌下。[Arian Eir]湿透的小穴拼命蠕动，竭力把你吞得越深越好，执意要把所有精液都从");
         if(get_player().balls == 0)
         {
            outputText("你");
         }
         else
         {
            outputText("你的[balls]");
         }
         outputText("。");
         outputText("[pg]终于兑现了承诺后，你把自己交给那不可避免的结局。");
         if(get_player().hasVagina())
         {
            outputText("你的小穴在高潮中痉挛，一股液体从那里沿着身体淌下，而");
         }
         else
         {
            outputText("你");
         }
         outputText("将你的精华直接释放进这蜥蜴人灼热的子宫深处。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]阿瑞安的小穴狠狠夹住你的肉棒，紧到你甚至能感觉到精液撑开尿道，汇聚到顶端，然后猛然喷发。收缩的内壁把种子送入更深处，直达那等待着它的子宫。你紧紧抱住颤抖的蜥蜴人，又朝[Arian em]顶了几下，送出最后几股精液，随后倒在[Arian em]身上。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你射出的分量实在太多，顺着包裹你肉棒的内壁涌过，硬生生撑开了阿瑞安湿漉漉的小穴。你想象着自己把这蜥蜴人的甬道涂成一片白色……一路直到[Arian eir]宫颈。那道薄弱的屏障几乎兜不住这庞大的量，被迫张开，让精液溅入并积存在[Arian eir]子宫里。[say: 啊……好满，]阿瑞安吐着舌头说道。你把[Arian em]紧紧搂在怀里，[Arian ey]也乐意回抱你；接着，你慢慢感觉到了。[Arian Eir]纤细的腹部渐渐隆起，里面晃荡着你刚刚灌进去的精液。等你终于释放殆尽，便瘫倒下来，长长地叹了口气。");
         }
         else
         {
            outputText("[pg]你射精的力道强得惊人，简直像是要把可怜的蜥蜴人直接从你的" + get_player().cockDescript(_loc1_) + "上冲飞出去。你把[Arian eir]体内冲刷得一塌糊涂，强劲的精液一股股喷出，让[Arian ey]根本不可能全都含住。你把[Arian em]拉近，阿瑞安呻吟着，也紧紧回抱住你。[say: 呃，我的肚子……好多……好舒服，][Arian ey]呻吟道，而你仍用这惊人的精液继续折磨着[Arian eir]身体。你们身下的床单早已被混杂的体液弄得湿成一团，也把你们下半身都弄得一片狼藉。直到你又往[Arian em]体内挺了几下，确认自己彻底射干之后，才倒在[Arian em]身上，身体还被你灌出来的、像怀孕般隆起的小腹稍稍撑着。");
         }
         outputText("[pg][say: 啊啊啊……]阿瑞安叹息道。[say: 做爱……感觉真好。][Arian ey]抚摸着你的后脑，轻轻把你拉过去，与你短暂地吻了一下。[say: 如果我们每次这样做都会这么舒服，那我一点也不后悔变成女孩子，][Arian ey]说道，一只手悄悄滑到你们之间，揉着[Arian eir]");
         if(get_player().cumQ() < 250)
         {
            outputText("纤瘦的");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("胀满的");
         }
         else
         {
            outputText("被撑得过满的");
         }
         outputText("小腹。[say: 像这样，再陪我待一会儿好吗？]阿瑞安问道。");
         outputText("[pg]你握住[Arian eir]空着的那只手，告诉[Arian em]，如果[Arian ey]希望的话，你至少还能再陪[Arian em]待一小会儿。[say: 我想这样……就一会儿。]阿瑞安尽力依偎着你。既然没有什么非走不可的理由，你也依偎回去，满足地躺在那里，享受着彼此事后的余韵。");
         outputText("[pg]不过最后，你还是说自己大概该走了。能和[Arian em]待在这里确实很舒服，但你还有事情要做。阿瑞安朝你微笑，在你唇上轻轻吻了一下。[say: 我明白，不过请你很快再来看我。]你答应[Arian em]一定会来，然后从这个黏人的蜥蜴人怀里抽身出来。你很快找到衣服穿好，随后离开了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function peepOnArian() : void
      {
         clearOutput();
         arianSprite();
         get_images().showImage("arian-fap");
         outputText("出于好奇，你决定从锁孔里偷偷看一眼；你尽量把身子贴过去，透过锁孔望向里面的卧室。正如你耳朵听到的那样，这个病弱的白化蜥蜴人身体已经好了不少，足以把注意力放到更……肉欲的事情上。他下半身赤裸，坐在床沿，胯间的裂缝里吐出一根大小普通的阴茎。大概有6英寸长，颜色鲜艳得近乎紫红，上面布满奇怪的凸起");
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) > 0)
         {
            outputText("，就像你的一样");
         }
         outputText("，不过这并不妨碍他兴致勃勃地抚弄自己。");
         outputText("[pg][say: 该死的病……该死的梦……哦，[name]……要是你知道就好了……]阿瑞安喘息呻吟着，你所在的位置也能清楚听见那阵撸动声。他轻轻呜咽，咬住嘴唇，显然已经快到临界点了。[say: 啊！你让我变成这样……我真希望你能对我做那些事……啊……]他低声呻吟着。");
         outputText("[pg]你思索着这个奇妙的发展。所以，这个爬虫对你动心了？他觉得你有吸引力？嗯，那么……你是该给他机会让他自己解决，还是现在进去，给他一个比手更好玩的东西？");
         dynStats(DynStat.Inte(1));
         menu();
         addButton(0,"闯进去",bargeInOnArian);
         addButton(1,"离开",leaveFappingArian);
      }
      
      public function noPlotSexNauArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你向这位蜥蜴人道歉，告诉[Arian em]你现在没什么心情……");
         outputText("[pg]阿瑞安看起来有些失望，但并没有继续追问。[say: 哦……好吧，不过……也许下次？][Arian ey]满怀希望地问道，尽管[Arian eir]很难为情，还是紧张地笑了笑……");
         outputText("[pg]你答应[Arian em]，也许下次吧。阿瑞安对你咧嘴一笑。[say: 好吧。那么，你还有什么想做的吗？]");
         arianHomeMenu();
      }
      
      public function noArianShouldntMagicTeach() : void
      {
         clearOutput();
         arianSprite();
         outputText("你想了片刻，然后告诉阿瑞安，虽然这个提议让你很受宠若惊，你也愿意考虑，但你现在还不能说自己想立刻开始学习魔法。你希望改天再谈这件事。");
         outputText("[pg]阿瑞安开心地点点头。[say: 当然，我很乐意帮上你的忙。那么……今天你有什么想做的吗？]");
         arianHomeMenu();
      }
      
      public function meetArian() : void
      {
         var never:Boolean;
         var _g1:ArianScene;
         var _g:ArianScene;
         clearOutput();
         outputText("你在特尔阿德雷的街道上闲逛时，经过了这座半空城市里随处可见的一条昏暗小巷；你听见一阵撕心裂肺、嘶哑难听的咳嗽声。循声望去，你看到一个兜帽人裹着一件遮住身形的斗篷，瘫靠在墙边，弯着腰大声咳嗽，喘息着想要呼吸。听起来[Arian eir]的状况真的很糟……不过反过来说，这也可能是强盗之类设下的圈套。也许你不该在这里逞什么好心……");
         menu();
         addButton(0,"帮忙",helpArianWhenYouMeetHim);
         _g = this;
         addButton(1,"不帮忙",function():void
         {
            _g.dontHelpArianWhenYouMeetHim();
         });
         _g1 = this;
         never = true;
         addButton(2,"永不帮忙",function():void
         {
            _g1.dontHelpArianWhenYouMeetHim(never);
         });
      }
      
      public function listenToMediumAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,951,1);
         outputText("你转过头，想听听阿瑞安到底在梦些什么。");
         outputText("[pg][say: 唔……不，别动我的松饼。]");
         outputText("[pg]……松饼？[Arian Ey]那样又踢又扭的……居然是在梦松饼？你一时起了坏心思，或许还有点被冒犯到，于是凑到[Arian eir]耳边低声说，你这儿有些非常特别的松饼给他。");
         outputText("[pg][say: 真的？什么口味的？]");
         outputText("[pg]你告诉[Arian em]，这是个惊喜。");
         outputText("[pg][say: 嗯，那好吧。塞进来。] 阿瑞安抬起[Arian eir]尾巴让开位置，扭着[Arian eir]的臀部往你身上蹭。");
         if(get_player().hasCock())
         {
            outputText("[pg]好吧，既然这是[Arian ey]想要的，你当然乐意奉陪。你的手滑进被子里，开始套弄自己的[cock smallest]，轻柔地诱导自己勃起。等你硬得差不多了，你便环住这个蜥蜴人的腰以保持平衡，开始把自己往里推进。");
            outputText("[pg]阿瑞安呻吟起来。[say: 好熟悉的味道。你为什么不告诉我你是[name]口味的？我喜欢松饼。我喜欢[name]松饼。]");
            outputText("[pg]你惊讶地眨了眨眼；你心想，阿瑞安真的睡着了吗？不，[Arian ey]肯定是醒着的，不然[Arian ey]怎么会意识到你其实正在操[Arian eir]的屁股？[say: 嗯……好吃……] 你俯身伏在这个蜥蜴人上方，");
            if(get_player().hasCock())
            {
               outputText("肉棒");
            }
            else
            {
               outputText("手指");
            }
            outputText("仍在往[Arian eir]诱人的屁股里钻，可[Arian ey]看起来确实睡得很沉。真怪。[say: 好多松饼……全都是[name]口味的……] [Arian ey]平静下来，开始轻轻打鼾。");
            outputText("[pg]难以置信……要是不明真相，你都要以为是阿瑞安在挑逗你了。不过……[Arian ey]现在睡得正熟，而你并不想趁[Arian eir]睡着时操[Arian em]");
            if(get_player().cor >= 66)
            {
               outputText("，尽管这个傻乎乎的蜥蜴人确实活该");
            }
            outputText("。不过作为回敬，[Arian ey]得让你留在里面一起睡，虽然这对[Arian em]来说似乎也不算什么问题……可惜你睡着时没法一直保持勃起，所以你知道自己迟早会滑出来……");
         }
         else
         {
            outputText("[pg]考虑到你在阴茎方面实在有些欠缺，你决定先用手指凑合；这不正是[Arian ey]想要的吗？你用唾液充分润滑中指，把它探进[Arian eir]柔软的臀瓣之间，开始轻轻顶入[Arian eir]紧窄的小屁眼。");
            outputText("[pg]阿瑞安呻吟起来。[say:这么熟悉的味道……你怎么不告诉我你是[name]味的？我喜欢松饼……我喜欢[name]松饼……]");
            outputText("[pg]你惊讶地眨了眨眼；阿瑞安真的睡着了吗？不，[Arian ey]肯定醒着，不然[Arian ey]怎么会意识到你正在操[Arian eir]的屁股？[say:嗯……好吃……]你俯身凑到这个蜥蜴人上方，手指仍在往[Arian eir]欠操的屁股里钻，可[Arian ey]看起来确实睡得很熟。真奇怪。[say:好多松饼……全都是[name]味的……][Arian Ey]安静下来，开始轻轻打起鼾。");
            outputText("[pg]难以置信……要是不明真相，你都要以为是阿瑞安在挑逗你了。不过……[Arian ey]现在睡得正熟，而你并不想趁[Arian eir]睡着时操[Arian em]");
            if(get_player().cor >= 66)
            {
               outputText("，尽管这个傻乎乎的蜥蜴人确实活该");
            }
            outputText("。");
         }
         dynStats(DynStat.Lust(15));
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
      
      public function listenToLowAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,951,1);
         outputText("你转过头，想听听阿瑞安到底在梦些什么。");
         outputText("[pg][say: 放进我屁股里？你确定吗？]");
         outputText("[pg]哎呀，看来阿瑞安可能是在梦到肛交。你琢磨着该怎么办……嗯，既然你被吵醒基本上也算是[Arian eir]的错，你觉得稍微报复一下也不过分。你凑到[Arian eir]耳边，低声告诉[Arian em]你很确定。");
         outputText("[pg][say:但是香肠应该夹在面包里，]阿瑞安呜咽着。[say:但是……如果你确定的话……好吧……]在被子底下，你感觉到阿瑞安正把[Arian eir]屁股贴着你扭动，[Arian eir]尾巴抬起，为[say:香肠]腾出空间。");
         if(get_player().hasCock())
         {
            outputText("[pg]你有那么一瞬间怀疑这样是不是公平，但既然[Arian ey]显然正热切地梦着这种事……你的手滑进被窝，开始抚弄自己的[cock smallest]，轻轻哄着自己硬起来。等你已经够硬了，你便环住这个蜥蜴人的腰稳住身体，开始把自己往里顶。");
         }
         else
         {
            outputText("[pg]考虑到你在阴茎方面实在有些欠缺，你决定用手指凑合一下；对像[Arian em]这样刚接触肛交的人来说，应该也差不多吧？你用唾液充分润湿自己的中指，把它挤进[Arian eir]柔软的臀瓣之间，开始轻轻往[Arian eir]紧窄的小肛口里推。");
         }
         outputText("[pg]你还没来得及推进一寸，阿瑞安就突然说道：[say: 不！等等！我还没准备好！你得再让我烤几分钟，才能把香肠放进去……还要多加点牛奶……]");
         outputText("[pg]……好吧，这情况已经怪到有点过头了。你不太确定自己还能不能保持兴致去操[Arian eir]的屁股。");
         outputText("[pg][say: [name]……就让我烤上一整晚吧。我明天就准备好了。晚安……] 说完这些，阿瑞安终于平静了下来。");
         outputText("[pg]你不禁怀疑，阿瑞安是不是一直梦想着当个面包师，而不是巫师……又或者[Arian ey]只是半夜突然馋糕点了。你轻轻叹了口气，强迫自己安顿下来，试着重新入睡。");
         dynStats(DynStat.Lust(15));
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
      
      public function leaveFappingArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你决定给阿瑞安留点私人空间，暂时离开……毕竟，这位蜥蜴人法师在闲暇时间做什么，确实不关你的事……");
         outputText("[pg]当你走回入口处时，布恩看见了你，问道：[say: 这就要走了吗？你平常都会和阿瑞安师父待上至少一个小时……发生什么事了？]");
         outputText("[pg]你告诉布恩，阿瑞安现在似乎有点忙，所以你晚些时候再来。");
         outputText("[pg][say: 忙吗？如果你愿意，我可以替你去叫他；阿瑞安师父不管什么时候都很高兴见到你。]布恩笑着，正要往阿瑞安的卧室走去。你连忙拦住他，解释说现在最好让阿瑞安有点私人空间。[say: 你确定吗，[name]？一点也不麻烦，我保证。]你坚持说他现在不该打扰阿瑞安。布恩耸了耸肩。[say: 既然你这么说……总之，之后一定要再来看看。自从你开始来探望阿瑞安师父之后，他叛逆少多了，更别说他看起来也越来越健康、越来越开心了。]");
         outputText("[pg]你答应之后还会再来，并向他告别。你走出屋外，朝自己的营地返回。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveEggs() : void
      {
         arianSprite();
         clearOutput();
         outputText("你告诉[Arian em]，这个月你不想要[Arian em]产任何带颜色的蛋。蜥蜴人点点头，觉得没必要特意说明这意味着[Arian ey]只会产下普通的蛋，然后在产完之后把它们当早餐吃掉。[say: 那，你是有什么事吗？][Arian ey]问道。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function inviteArianToCamp() : void
      {
         arianSprite();
         clearOutput();
         outputText("你问这个蜥蜴人，[Arian ey]是否真的还想离开[Arian eir]在城里舒适的家，跑到废土上你那小小的营地里和你一起生活？");
         outputText("[pg][say: 当然想！] 阿瑞安兴冲冲地说道。");
         outputText("[pg]好吧，如果[Arian ey]真的想这么做……虽然你完全想不明白[Arian ey]为什么会想这么做……那[Arian ey]可以搬来住。不过你提醒这个热情过头的蜥蜴-");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 0)
            {
               outputText("男人");
            }
            else
            {
               outputText("双性");
            }
         }
         else
         {
            outputText("女人");
         }
         outputText("。");
         outputText("[pg][say: 太好了！我收拾一下，我们马上就能走！] 阿瑞安开心地宣布道。");
         outputText("[pg]阿瑞安打开一个小衣柜，拿出一对小包。其中一个封得严严实实，看起来都快撑爆了，另一个则完全是空的。阿瑞安拿了几套叠得整整齐齐的备用衣服，轻轻放进[Arian eir]包里，然后转身走到[Arian eir]工作桌前，又拿起几件小玩意，把它们全都装了进去。");
         outputText("[pg]做完这些后，阿瑞安两手抓起那两个包，开心地宣布道：[say: 全都收拾好了！]");
         outputText("[pg]你怀疑地看着那些包，问这名蜥蜴人到底想跟你开什么玩笑。");
         outputText("[pg]阿瑞安困惑地看着你。[say: 玩笑？你说的玩笑是什么意思？]");
         outputText("[pg][Arian Ey]不会真以为你会相信[Arian ey]只打算带这些东西吧。");
         outputText("[pg]阿瑞安看了看[Arian eir]的包，耸了耸肩。[say: 我需要的东西都在这里了。我提前收拾了一些东西，再加上几件衣服，还有一些我最近在研究的小东西。真的就这些，相信我。] 阿瑞安微笑起来。");
         outputText("[pg]你轻轻叹了口气，心想大概一两天后还得回来取[Arian ey]忘带的东西。你让[Arian em]去跟[Arian eir]的学徒们道别；你们现在要走了。");
         outputText("[pg]阿瑞安点点头，跟着你下楼走向入口。[say: 布恩！莱卡！] 阿瑞安喊道。片刻之间，那对双胞胎雪貂便出现在你们面前。看到阿瑞安手里的包，布恩露出了笑容，莱卡则开始眼眶泛泪。");
         outputText("[pg]阿瑞安放下[Arian eir]的包，张开[Arian eir]双臂，邀请这对双胞胎来拥抱[Arian em]，他们也开心地抱了上去。");
         outputText("[pg][say: 我真为你高兴，" + arianMF("主人","女主人") + "，真的，] 布恩说道。");
         outputText("[pg][say: 一定要照顾好自己，" + arianMF("主人","女主人") + "。别忘了定期洗澡，好好吃饭……偶尔也要联系我们……节假日也要回来看看，] 莱卡抽着鼻子说道。");
         outputText("[pg]阿瑞安对[Arian eir]的学生们微笑。[say: 我已经不再是你们的" + arianMF("主人","女主人") + "了。从今往后，你们就是独当一面的法师了。记住你们学到的一切，我相信你们会没事的。]");
         outputText("[pg]布恩第一个松开拥抱，莱卡也很快跟着放开了手。随后这对双胞胎转向你。");
         outputText("[pg][say: 拜托你了，[name]，请好好照顾" + arianMF("mas","mis") + "……呃……阿瑞安。[Arian Ey]有时候可能会有点难照应，但[Arian ey]真的是个很好的人，] 布恩鞠了一躬说道。");
         outputText("[pg][say: 如果 " + arianMF("主人","女主人") + "……我是说……如果阿瑞安给你添了什么麻烦，就叫我们，我们会马上赶来好好教训[Arian em]一顿，] 莱卡鞠了一躬说道。");
         outputText("[pg][say: 拜托别让莱卡来收拾我！] 阿瑞安求饶道。");
         outputText("[pg]你看着他们三个，微微一笑，又轻声笑了出来；他们真的就像一家人，不是吗？你答应他们会好好照顾他们的老师，如果[Arian ey]需要被他们打屁股，你也会叫他们来的。");
         outputText("[pg][say: 喂，我没那么糟吧？] 阿瑞安抗议道。布恩和莱卡互相看了看，又看向你，脸上的表情和你如出一辙。最后，你们全都一起点了点头。阿瑞安叹了口气……");
         outputText("[pg]道别之后，你开始了漫长的回家之旅……带着一个新盟友（兼情人）同行。");
         menu();
         addButton(0,"下一步",takeYerLizardHomePartII);
      }
      
      public function imbueTalisman() : void
      {
         var spell4:String;
         var _g4:ArianScene;
         var spell3:String;
         var _g3:ArianScene;
         var spell2:String;
         var _g2:ArianScene;
         var spell1:String;
         var _g1:ArianScene;
         var spell:String;
         var _g:ArianScene;
         arianSprite();
         clearOutput();
         outputText("你告诉阿瑞安，如果不太麻烦的话，你想请[Arian em]");
         if(get_player().hasKeyItem("Arian\'s Talisman"))
         {
            outputText("把一道法术注入[Arian ey]为你制作的附魔护符中");
         }
         else
         {
            outputText("更换[Arian ey]为你制作的护符中的法术");
         }
         outputText("。");
         outputText("[pg][say: 当然。]阿瑞安走到[Arian eir]工作台前，取来一张小羊皮纸递给你。[say: 这里列着我能为你的护符灌注的所有法术，以及所需的材料。]");
         outputText("[pg]你开始查看这张羊皮纸，斟酌着该怎么选。那么，你要让[Arian em]把哪种法术放进护符里呢？");
         outputText("[pg]<b>驱散法术：</b>1x 白之书和1x 黑之书 - 解除当前影响玩家角色的所有魔法和炼金效果，无论有益与否。（不会解除恶魔欲望光环的效果。）");
         outputText("\n<b>治疗法术：</b>2x 黏液布和2x 活力茶 - 治疗使用者，不会失败。比标准治疗法术更强效。");
         outputText("\n<b>焚烧法术：</b>2x 地精麦酒和1x 粉色蛛丝 - 点燃你的对手，持续造成伤害。");
         outputText("\n<b>减欲法术：</b>2x 催情剂和1x 强效催情剂 - 降低玩家角色当前的欲望，不会失败。");
         outputText("\n<b>护盾法术：</b>2x 黑色甲壳和1x 坚韧丝绸 - 在战斗持续期间提高防御。");
         menu();
         if(get_player().hasItem(get_consumables().W__BOOK,1) && get_player().hasItem(get_consumables().B__BOOK,1))
         {
            _g = this;
            spell = "驱散法术";
            addButton(0,"驱散",function():void
            {
               _g.arianSpellPlace(spell);
            }).hint("解除当前影响玩家角色的所有魔法和炼金效果，无论有益与否。（不会解除恶魔欲望光环的效果。）");
         }
         else
         {
            addButtonDisabled(0,"驱散","你没有所需的材料。");
         }
         if(get_player().hasItem(get_consumables().SLIMYCL,2) && get_player().hasItem(get_consumables().VITAL_T,2))
         {
            _g1 = this;
            spell1 = "治疗法术";
            addButton(1,"治疗",function():void
            {
               _g1.arianSpellPlace(spell1);
            }).hint("治疗使用者，不会失败。比标准治疗法术更强效。");
         }
         else
         {
            addButtonDisabled(1,"治疗","你没有所需的材料。");
         }
         if(get_player().hasItem(get_consumables().GOB_ALE,2) && get_player().hasItem(get_consumables().S_GOSSR))
         {
            _g2 = this;
            spell2 = "焚烧法术";
            addButton(2,"焚烧",function():void
            {
               _g2.arianSpellPlace(spell2);
            }).hint("点燃你的对手，持续造成伤害。");
         }
         else
         {
            addButtonDisabled(2,"焚烧","你没有所需的材料。");
         }
         if(get_player().hasItem(get_consumables().L_DRAFT,2) && get_player().hasItem(get_consumables().F_DRAFT,1))
         {
            _g3 = this;
            spell3 = "减欲法术";
            addButton(3,"减欲",function():void
            {
               _g3.arianSpellPlace(spell3);
            }).hint("降低使用者当前的欲望，不会失败。","减欲");
         }
         else
         {
            addButtonDisabled(3,"减欲","你没有所需的材料。","减欲");
         }
         if(get_player().hasItem(get_useables().B_CHITN,2) && get_player().hasItem(get_useables().T_SSILK))
         {
            _g4 = this;
            spell4 = "护盾法术";
            addButton(4,"护盾",function():void
            {
               _g4.arianSpellPlace(spell4);
            }).hint("在战斗持续期间提高防御。");
         }
         else
         {
            addButtonDisabled(4,"护盾","你没有所需的材料。");
         }
         addButton(14,"返回",arianHomeMenu);
      }
      
      public function hermsLikeMaleArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他，你并不是那样；你并不介意他是个男人。事实上，你觉得他看起来很可爱，这让他露出了一个紧张的笑容。阿瑞安放松下来，任由你打量他的身体，决定接下来想做什么……");
         menu();
         if(get_player().hasCockThatFits(50))
         {
            addButton(0,"插入",giveArianAnal);
         }
         else
         {
            addButtonDisabled(0,"插入","此场景需要你拥有合适的阴茎。");
         }
         addButton(1,"被插入",getPenetratedByArianAndHisHitlerMustache);
      }
      
      public function hermsLikeFemaleArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他，虽然你偶尔也喜欢和男人玩一玩，但你更喜欢女孩子。");
         outputText("[pg][say: 所以……如果我是个女孩子，你会更喜欢……对吗？]");
         outputText("[pg]你摸着下巴思索起来，想象着他变成女孩子会是什么样子；接着你告诉他，如果他是个女孩子，你会很喜欢。[say: 好吧……我……我会做的！]");
         outputText("[pg]你惊讶地扬起眉毛。他打算做什么？");
         outputText("[pg]阿瑞安从床上起身下来，完全不在意自己正一丝不挂地暴露在外；接着慢慢走向自己的书桌，打开一个抽屉。他伸手进去，取出一只贴着粉色蛋形标签的神秘瓶子。他一边拔开瓶塞，一边转头看向你，随后将瓶中的液体一饮而尽。");
         outputText("[pg]药效几乎不到一秒就开始发作。他刚把瓶子放回抽屉，就瘫倒在旁边的椅子上。起初你还想着要不要呼救，但当你看到阿瑞安的阴茎正以肉眼可见的速度缩小，很快没入他生殖裂缝的凹陷里时，这个念头立刻从脑中消失了。他的阴茎一消失在里面，生殖裂缝便合拢起来，皮肤连接在一起，只在他的腹股沟处留下光滑的" + (get_noFur() ? "皮肤" : "鳞片") + "；更低一些，在他的——或者现在该说她的？——双腿之间，另一道裂缝张开了，很快向两侧分开，一颗小小勃起的阴蒂从湿润的褶皱中探了出来。淫液渗出，打湿了木椅；发情雌性的气味充满了这间小卧室，而你感觉血液正涌向你的[cocks]。");
         outputText("[pg]不过，变化还没有结束；一声低沉而女性化的呻吟过后，一对小巧挺翘的乳房浮现出来，上面还带着敏感的小乳头。你恍惚地看着变化完成，阿瑞安的脸庞变得更柔和、更圆润，也更像女孩子；她的身体也同样如此，臀部和屁股都变得更大，曲线更加丰满诱人，让她拥有了一副美丽而纤细的身材。");
         outputText("[pg]她带着紧张的笑容问道，[say: 那、那么？我现在看起来怎么样……？]");
         outputText("[pg]你没有费心回答，而是走上前，轻轻扶她站起来。然后你温柔地把她推向床边，开始脱下衣服。阿瑞安微笑着躺了下来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,944,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,940,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,938,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,941,1);
         menu();
         addButton(0,"下一步",penetrateArian);
      }
      
      public function helpArianWhenYouMeetHim() : void
      {
         clearOutput();
         arianSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,934,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,938,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,937,50);
         outputText("你小心翼翼地走近那个兜帽人，问[Arian eir]还好吗；这话说出来感觉有点傻，但你一时也想不到别的能说。");
         outputText("[pg][say: 扶……扶我起来，]一个男性的声音在咳嗽间请求道。");
         outputText("[pg]你俯身把肩膀递给这个陌生人，让[Arian eir]把手臂搭在你脖子上，然后站直身子，帮[Arian eir]站起来。兜帽人站稳后，兜帽从[Arian eir]的头上滑落，露出" + (get_noFur() ? "没有耳朵和头发的头部，取而代之的是蜥蜴般的鳞片，不过[Arian eir]的脸除此之外仍是人类模样，只是异常苍白" : "一张爬行动物般的吻部，一看就只可能属于某种蜥蜴") + "。他的鳞片白得近乎荒唐，他深深吸气，试图平息自己的咳嗽。");
         unlockCodexEntry(2046);
         outputText("[pg]等他似乎平静下来后，他看向你，你也望见他赤褐色的竖瞳。[say: 非常感谢你。]他礼貌地向你点了点头。[say: 不过，你介意再帮我一次吗？我正在躲一些人，如果你能帮我去附近的公园，我会非常感激。]");
         outputText("[pg]你先问他是不是遇到了什么麻烦。[say: 不，当然不是。只是我的侍从有点保护过度，仅此而已，]他坚持说道，又轻咳了几声。");
         outputText("[pg]你考虑了一下自己的选择，最后觉得带他过去也没什么坏处，于是把决定告诉了这个病恹恹的蜥蜴人。");
         outputText("[pg]没过多久，你们就来到一处看起来像是废弃小公园的地方；有些地方的草长得杂乱疯长，另一些地方却干枯萎黄。蜥蜴人指了指附近的一张长椅，你扶他坐下。他叹了口气，向后靠去，闭上眼睛，脸上露出微笑。");
         outputText("[pg][say: 非常感谢你帮我来到这里。要是再让我在床上多躺哪怕一秒，我发誓我真的会疯掉。]");
         outputText("[pg]待在床上？你注意到了他的咳嗽；他是得了什么病吗？");
         outputText("[pg][say: 呃，不完全是。我只是现在身体有些状况……]他的话音渐渐低了下去。你不禁猜想，这会不会和他鳞片的白色有关——那颜色白得实在不正常——但你没有追问。你转而问他是谁，以及为什么会出现在你发现他的那条小巷里。");
         outputText("[pg]蜥蜴人倒吸一口气，惊讶地捂住嘴。[say: 哦，请原谅我。真是失礼，我本该先自我介绍的。]他清了清嗓子，开口说道：[say: 我叫阿瑞安，正如你所见，我是个蜥蜴人。我只是想出去走一小会儿，可我的侍从们死活要把我留在床上；他们说我的身体还没好到能出门……但要我说，如果有谁最了解我的身体，那也该是我自己！而如果我想出去，诸神在上，我就是要出去！]他语气强硬地说完，这才意识到自己说得太多了。[say: 哦，请原谅我……这真的不是你的问题，抱歉给你添麻烦了，]他说着垂下了头。");
         outputText("[pg]你告诉他没关系。听起来，他似乎已经被侍从们关了很久。[say: 是啊，有时候我只是想呼吸一点新鲜空气，所以就会来这个公园。]他自顾自地笑了笑。[say: 不过我不该再耽误你了。谢谢你的帮助……呃？]你告诉了这名蜥蜴人你的名字。[say: 我现在会没事的，那么，我们以后再见。]他友好地朝你笑了笑。");
         outputText("[pg]你决定暂时先不打扰他，转身回到了营地。");
         outputText("[pg][b:（公园已添加至特尔阿德雷的菜单。）]");
         arianHealth(1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function goddamnitNoYouButtSlut() : void
      {
         clearOutput();
         arianSprite();
         outputText("你向[Arian em]道歉，但你现在真的不能那么做。阿瑞安看起来有点失望，但还是对你笑了笑。[say: 哦……好吧。那下次可以吗？]");
         outputText("[pg]你点了点头。");
         sexTalkFinish(false);
      }
      
      public function giveLethicite() : void
      {
         clearOutput();
         outputText("你从袋子里取出那颗珠光闪烁的宝石，满怀期待地递给阿瑞安。");
         outputText("[pg]这名通晓秘术的蜥蜴人愣了一下。[say: 莱希石？][Arian ey]问道。[say: 如果它真是我想的那东西，那我倒想知道你是怎么弄到手的。]");
         outputText("[pg]先不管它是怎么来的，照理说总该能拿它做点什么。要是费劲得到这么稀有的东西，结果发现它不过是恶魔的食物，那可太让人沮丧了。");
         outputText("[pg]阿瑞安很快兴奋起来。[say: 其实，当然可以！至少就它的大小和纯粹程度而言，我几乎想不到还有什么比它更适合用来附魔。][arian Ey]相当热切地谈起它的潜力，而你也不介意多弄几件附魔装备。[say: 当然，我应该能做出效果相当出色的东西，但如果只是把一个法术绑定到小饰品上，那就太浪费了。如果你有兴趣施展威力大幅提升的魔法，我建议给一根法杖附魔。]");
         menu();
         addButton(0,"法杖",receiveLethiciteStaff).hint("你需要3块莱希石碎片和一根基础巫师法杖。").disableIf(!get_player().hasItem(get_useables().LETHITE,3) || !get_player().hasItem(get_weapons().W_STAFF));
         addButton(1,"不用了",arianHomeMenu).hint("你会先把这块水晶留着。");
      }
      
      public function giveIncubusDraftToArian() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().P_DRAFT);
         outputText("你在口袋里摸索，手碰到了那瓶纯化梦魇药剂。你把它递给阿瑞安，问");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("[Arian ey]是否想让[Arian eir]的鸡巴变大些");
         }
         else
         {
            outputText("[Arian ey]是否想找回一点[Arian eir]过去的男性特征");
         }
         outputText("。");
         outputText("[pg]阿瑞安脸红了。[say:我不介意现在这样，但如果你想让我喝，我也愿意。]阿瑞安紧张地对你笑了笑。");
         outputText("[pg]你告诉[Arian em]，你的确希望[Arian em]喝下它，并更郑重地把药剂递到蜥蜴人面前。阿瑞安接过药剂，拔开瓶塞，一口气灌了下去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,938,FlagDict_Impl_.arrayReadInt(_loc1_,938) + 1);
            outputText("[pg]变化立刻开始了。一阵欲火袭来，阿瑞安浑身一颤，迅速拉开[Arian eir]长袍，惊愕地看着[Arian eir]湿润的女性小穴上方裂开一道缝隙。那里溢满了天然润滑液，有那么一瞬间，你还以为阿瑞安正在长出第二个阴道。但这个念头很快就被抛到脑后，因为你看见一根带有爬行动物特征、龟头鼓胀的紫色阴茎从那深处探出；它长到一般大小时，阿瑞安呻吟着射了出来，用[Arian eir]新获得的家伙喷了自己一身。");
            outputText("[pg]你故意露出坏笑，摇了摇头。哎呀，阿瑞安可真该练练[Arian eir]的控制力了，不是吗？竟然只是长出这么一根可爱的小鸡巴就射了。你伸出手抚摸这根双性器官，指尖轻轻划过它带有爬行动物特征的凸起和小疙瘩。你心底有一小部分因期待而微微战栗，想象着它深深插进你的");
            if(get_player().hasVagina())
            {
               outputText("[vagina]和");
            }
            outputText("[asshole]里。");
            outputText("[pg][say:等等！我还很敏——啊啊！] 阿瑞安的阴茎一阵抽动，又一股精液划过空中，正正射在[Arian em]的脸上。阿瑞安喘着气说：[say:我、我觉得我现在得休息一下了……] [Arian Ey]瘫倒在[Arian eir]床上，那条灵活的爬行动物尾巴愉快地来回摆动着。");
            outputText("[pg]你心里有点怀疑，也许[Arian ey]是在希望你跟[Arian em]一起上床；但你又仔细看了看，不得不承认[Arian ey]是真的累了。你亲昵地抚了抚[Arian eir]" + (get_noFur() ? "" : "覆鳞的") + "脸颊，然后礼貌地告辞，回到了营地。");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) < 3)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,938,FlagDict_Impl_.arrayReadInt(_loc1_,938) + 1);
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            outputText("[pg]变化立刻开始了。阿瑞安浑身一颤，一阵情欲袭上[Arian em]，于是迅速敞开[Arian eir]长袍，看着[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
            {
               outputText("阴茎从藏身处探出。它一跳一跳地胀大，逐渐适应了它的");
            }
            else
            {
               outputText("一对阴茎从藏身处探出。它们一跳一跳地胀大，逐渐适应了它们的");
            }
            outputText("新尺寸；阿瑞安一边呻吟，一边射得[Arian em]自己满身都是。");
            outputText("[pg]你轻轻弹开蜥蜴人肚子上的一缕精液。那么，[Arian ey]觉得这根全新升级的蜥蜴肉棒怎么样？阿瑞安咽了口唾沫，试着把[Arian eir]肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("到它们的");
            }
            else
            {
               outputText("到它的");
            }
            outputText("裂缝里。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 2)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,938,FlagDict_Impl_.arrayReadInt(_loc1_,938) + 1);
               dynStats(DynStat.Lust(10 + get_player().lib / 20));
               outputText("[pg][Arian Ey]总算把它塞了回去，不过你感觉自己只要稍微探进去一点，就能摸到它的顶端。");
               outputText("[pg][say:有点挤，但我想我还是能把它收在里面，] 阿瑞安舒服地叹了口气。[say:不过感觉确实很棒；谢谢你，[name]。]");
               outputText("[pg]你坏笑着告诉[Arian em]，也许之后你会让[Arian em]来一次近距离的私下示范，好让你看看那到底是什么感觉；不过现在，你会让[Arian em]先睡一会儿。阿瑞安红着脸点点头。[say:我会期待的。] [Arian Ey]有些紧张地冲你笑了笑。");
               outputText("[pg]你坏笑着拍了拍[Arian eir]的头，告诉[Arian em]等有机会你会回来取用它，然后礼貌地告辞离开。");
            }
            else
            {
               outputText("[pg][Arian Ey]总算把");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("它们");
               }
               else
               {
                  outputText("它");
               }
               outputText("收回去，直到三分之二都进去了；之后看起来[Arian ey]就再也收不进去了。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("[pg][say:哇、哇哦，它们太大了，我根本藏不住，] 阿瑞安喘息着，[Arian eir]几根肉棒的顶端软软地垂在外面，任谁都看得见。");
               }
               else
               {
                  outputText("[pg][say:哇、哇哦，它太大了，我根本藏不住，] 阿瑞安喘息着，[Arian eir]肉棒的顶端软软地垂在外面，任谁都看得见。");
               }
               outputText("[pg]你忍不住伸手下去，轻轻捏了捏那暴露在外的顶端。嗯……你的小" + arianMF("男宠","双性玩物") + "从今以后可要变成很坏的东西了，你打趣道，除非[Arian ey]打算开始穿兜裆布？");
               outputText("[pg]阿瑞安在你的触碰下浑身一颤。[say: 我、我得去问布恩借[Arian eir]的。我这里没有。]阿瑞安脸红了。");
               outputText("[pg]你俏皮地朝[Arian em]笑了笑，问[Arian ey]要不要你现在就去拿一条来？");
               outputText("[pg][say: 不、不行！要是布恩和莱卡发现我现在这副样子，我会受不了的，]阿瑞安说着，指向[Arian eir]暴露在外的肉棒");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("");
               }
               outputText("。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText("[pg]你忍不住挑起眉毛，问[Arian em]，这真的比暴露出[Arian ey]长出了装满卵的子宫，还有能配套使用的小穴更让人尴尬吗？[say: 呃，是啊！而且你让我做这种事，他们也会找你麻烦的，你知道吗？]阿瑞安抗议道。");
                  outputText("[pg]你笑着轻轻点了点[Arian em]的鼻子，指出你和[Arian em]的区别在于，你根本不在乎那两只保护欲过强的雪貂会怎么评价[Arian ey]的样子。你觉得[Arian ey]现在这样很性感。阿瑞安听了脸上一红。[say: 那……我就不穿兜裆布了？]你告诉[Arian em]，那样会很坏，不过你觉得也挺性感的。阿瑞安紧张地笑了笑，[say: 好吧，那我就这么做……等、等不及想用它了……][Arian Eir]顶端");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
                  {
                     outputText("");
                  }
                  outputText("开始变硬，再也无法把阿瑞安的兴奋藏在[Arian eir]护茎裂缝里。");
               }
               else
               {
                  outputText("[pg]你承认那大概确实会有点尴尬，特别是如果布恩现在比阿瑞安还大的话。阿瑞安脸红了。[say: 呃，[Arian ey]其实并没有。真要说的话，可能还会有点紧。我也许只能不穿了……]");
                  outputText("[pg]你挑起眉毛，问[Arian ey]是不是心里其实多少有点高兴？毕竟在这个满脑子都是性的世界里，大肉棒似乎很受崇拜。阿瑞安尴尬地移开视线，但还是笑了起来。[say: 它确实挺大的，对吧？我想也没那么糟。]");
                  outputText("[pg]你指出，如果你不觉得蜥蜴人的大肉棒很性感，就不会给[Arian em]弄得这么大。老实说，一想到[Arian ey]会让这根惊人的大家伙藏在[Arian eir]长袍底下到处晃，你还挺想知道的；这让人很有成就感。[say: 那、那我就不用了。]阿瑞安的肉棒又硬了几分。[say: 不过要藏住我的……冲动，可能会很难。]阿瑞安紧张地看着你。");
               }
               outputText("[pg]你在蜥蜴人的脸颊上亲了一下，问[Arian ey]是不是真的不想在你离开前试用一下。阿瑞安的肉棒硬了起来，指向你，并因这个念头而一跳一跳地悸动；就连[Arian eir]顶端也凝出了一小滴精液。阿瑞安手忙脚乱地想把[Arian eir]的兴奋藏起来。[say: 这、这还得花点时间适应……]");
               outputText("[pg]你道了歉，告诉这名蜥蜴人你已经逗[Arian em]逗得够久了；你会给[Arian em]一点时间冷静下来，然后礼貌地告辞，返回营地。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) > 1 && !get_hyper())
         {
            _loc2_ = 941;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            outputText("[pg]阿瑞安感觉变化席卷[Arian em]全身，不由得浑身一颤；但这一次，那股预示着变化的暖意并没有落在[Arian eir]巨大的蜥蜴人肉棒上，而是汇聚到了[Arian eir]的胸部。阿瑞安呻吟着揉捏[Arian eir]的隆起，看着它们缩小到较小的尺寸。");
            outputText("[pg][say: 好吧，至少我的胸口不会再觉得那么沉了。希望你没有失望？]阿瑞安喘息着问道。");
            outputText("[pg]你只是朝[Arian em]笑了笑，告诉[Arian em]你可以接受。阿瑞安叹了口气。[say: 那就好，不过它们感觉确实挺不错的。]你从[Arian eir]的声音里听出了一丝失落。");
            outputText("[pg]你有些困惑地说，阿瑞安可是作为男孩孵化出来的；你还以为[Arian ey]会更习惯那里平一点。阿瑞安脸红了。[say: 我——……你已经让我相信，那方面确实有些……好处。]阿瑞安咬住[Arian eir]的下唇。[say: 也不是说我怀念大胸。我的背也会感谢我的，不过它们摸起来确实很舒服，而且……]阿瑞安咯咯笑了起来。[say: 莱卡总会用特别好笑的眼神看我，因为她有点……平。]");
            outputText("[pg]你不禁怀疑莱卡那些眼神背后也许另有目的，不过还是把这个想法藏在心里。你问阿瑞安想不想做点什么，还是你该让[Arian em]继续去忙[Arian eir]的工作？阿瑞安期待地看着你。[say: 如果你想做点什么，我也不会拒绝。]说着，[Arian eir]的肉棒因你的提议而硬了起来。");
            arianSexMenu(false);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1 && !get_hyper())
         {
            outputText("[pg]阿瑞安感到变化席卷全身，不由得颤抖起来；然而，那股预示着变化的暖意并没有落在[Arian eir]巨大的蜥蜴人肉棒上，而是停在了[Arian eir]胸前。阿瑞安呻吟着揉捏[Arian eir]的胸部，直到它们逐渐缩小，最后彻底消失。" + (get_noFur() ? "" : " [Arian Eir]的乳头也随之消失，被光滑的鳞片取代。"));
            outputText("[pg]下身又发生了另一处变化，阿瑞安发出一声呻吟；[Arian ey]分开[Arian eir]双腿，惊奇地看着[Arian eir]湿润肉穴的穴唇合拢起来，同样变成了光滑的" + (get_noFur() ? "皮肤" : "鳞片") + "。又有几处细微的变化发生，阿瑞安的身体逐渐偏向男性，最终稳定下来。阿瑞安如释重负地叹了口气。");
            outputText("[pg][say: 我现在算是男性了吧？] 阿瑞安的声音听起来也更有男子气了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,941,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,940,0);
            outputText("[pg]你表示看起来确实如此。那么，[Arian ey]会怀念哪怕只有一半是女孩的感觉吗？阿瑞安揉了揉[Arian eir]下巴。[say: 嗯，那确实挺奇怪的，但也还挺不错。] [Arian Ey]看向你，紧张地笑了笑。[say: 早上我会花点时间照镜子。我想，我当女孩的时候大概也不算难看吧？]");
            outputText("[pg]你说[Arian ey]当时确实很漂亮，不过你觉得[Arian ey]现在也同样英俊。再说了，完全变成男人就意味着不用再处理蛋的事了，对吧？");
            outputText("[pg]阿瑞安脸红了，尴尬地移开[Arian eir]视线。[say: 也没那么糟……我是说，下蛋那件事。]");
            outputText("[pg]他还真说得出口？明明亲身经历过那种痛苦的产卵过程？因为，如果[Arian ey]真能这么说，那你觉得你得称阿瑞安为你在这个世界见过的最有男子气概的男人之一。");
            outputText("[pg]阿瑞安朝你笑了笑。[say: 其实没那么疼。]然后[Arian ey]脸红了。[say: 其实……感觉还挺舒服的。]");
            outputText("[pg]你只是摇摇头，拍了拍他的肩膀。好吧，既然[Arian ey]真的不太介意半个女孩的状态，也许你之后会把[Arian eir]的小穴还给他。不过现在，你觉得[Arian ey]应该先试着重新习惯完全作为男人的身体。");
            outputText("[pg]阿瑞安移开[Arian eir]视线。[say: 当然。如果你是这么想的话。]");
            outputText("[pg]你回答说你确实是这么想的。那么，[Arian ey]还有精力做点别的事吗，还是你该让他休息一下？");
            outputText("[pg]阿瑞安的肉棒开始变硬。[say: 嗯，我不介意再做点别的……如果你想的话。]");
         }
         else
         {
            outputText("[pg]阿瑞安发出呻吟，你能看出[Arian ey]已经被挑起了兴致——[Arian eir]外露肉棒的顶端正在变硬就是证明——但除此之外，你没有察觉到任何变化。");
            outputText("[pg][say: 看来这就是我的极限了？] 阿瑞安喘息着说。");
            outputText("[pg]你承认看来确实如此，又问[Arian ey]既然这次没成功，愿不愿意做点别的？[say: 呃……当然。你想做什么？]");
         }
         menu();
         addButton(0,"下一步",giveArianAnItem);
      }
      
      public function giveArianReptilum() : void
      {
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().REPTLUM);
         outputText("你把玩着那瓶鳞族药水，暗自一笑。你迅速把脸上的东西擦掉，然后吩咐阿瑞安闭上[Arian eir]眼睛、张开[Arian eir]嘴，因为你给[Arian em]准备了一个特别惊喜。");
         outputText("[pg]阿瑞安立刻照做。[say: 好吧，不过你至少能告诉我这是要做什么吗？][Arian ey]好奇地问。");
         outputText("[pg]你用失望的语气啧了一声，指出如果告诉[Arian em]那是什么，惊喜就不算惊喜了。");
         outputText("[pg][say: 噢，好吧，那希望这不是什么恶作剧……不是说我不信任你，[name]。][Arian Ey]紧张地笑了笑。");
         outputText("[pg]你向[Arian em]保证[Arian ey]会喜欢的，不过首先，为了确保[Arian ey]不会偷看……你抓起手边一条布带，绕在[Arian eir]脸上，遮住[Arian eirs]眼睛，临时做成一条眼罩。");
         outputText("[pg][say: 噢，拜托，你可以相信我的。我保证不偷看！]");
         outputText("[pg]你告诉[Arian em]这样更有趣，同时拔开鳞族药水的瓶塞，说完便把它倒进蜥蜴人毫无防备地张着的嘴里。");
         outputText("[pg][say: 我发四咕噜噗——]蜥蜴人的抗议被灌入[Arian eir]喉咙的清凉鳞族药水打断。[Arian Ey]呛了一下，但很快就适应过来，急切地喝了下去。等你把瓶子倒空并从[Arian eir]唇边拿开后，阿瑞安咳了几声，舔了舔[Arian eir]嘴唇。[say: 嗯……味道挺不错的，那是什么？]");
         outputText("[pg]你告诉[Arian em]，[Arian ey]只能等着自己发现了；你摘下[Arian eir]的眼罩，对[Arian em]坏笑了一下。[say: 呃……好吧……]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,948) == 0)
         {
            outputText("[pg]你们两个坐在那儿等着……可奇怪的是，什么都没发生。你问阿瑞安，[Arian ey]有没有感觉哪里不一样。");
            outputText("[pg][say: 没有。我感觉很好。]");
            outputText("[pg]这就怪了……难道失败了？");
         }
         else
         {
            outputText("[pg]你在心里偷笑，应该快了……");
         }
         outputText("[pg]阿瑞安突然摇了摇[Arian eir]头，眨着眼睛，像是在努力集中视线；然后[Arian ey]转头看向你，冲你傻傻一笑。[say: 嘿，[name]。你知道吗，你身上的光环特别漂亮？各种颜色都有。我想知道它尝起来是什么味道。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,948,FlagDict_Impl_.arrayReadInt(_loc1_,948) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,948) == 1)
         {
            outputText("[pg]你眨了眨眼；光环？这个蜥蜴人在说什么？又是什么让[Arian em]觉得颜色会好吃——甚至能吃？");
         }
         else
         {
            outputText("[pg]你笑了笑，告诉[Arian em]如果[Arian ey]这么好奇，就该试试看。");
         }
         outputText("[pg]阿瑞安突然站起来，在你脸颊上舔了一口。[say: 好吃……原来彩虹尝起来像云朵冰淇淋。][Arian Ey]开始不受控制地大笑。你擦掉脸颊上[Arian eir]的口水，惊讶地看着[Arian ey]毫无缘由地继续笑个不停。");
         outputText("[pg][say: 嘿，[name]，猫都很柔软，对吧？如果我能舔到自己的屁股，你觉得我会不会变成猫？我会变成一只性感小猫！]阿瑞安把[Arian eir]长袍脱下来到处乱扔，然后尽可能弯下身子，试图去舔[Arian eir]屁股。[say: 就、就差一点……帮帮我，[name]！我想变成猫，这样我们就能角色扮演了！我当小手套，你当鱼腥嘴！]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,948) == 1)
         {
            outputText("[pg]你有点紧张地问[Arian ey]是不是还好。[say: 还好？我棒极了！][Arian ey]咯咯笑个不停地回答。");
         }
         else
         {
            outputText("[pg]你其实有点等着看这一幕。[Arian Ey]自己或许不知道，但以非猫科生物来说，阿瑞安的柔韧性真的惊人。舌头只要再长几英寸，[Arian ey]居然真的能舔到[Arian eir]肚子！");
         }
         outputText("[pg]弯来弯去的蜥蜴人终于放弃了，仰面摔倒在地，随后又立刻爬起来，眼里闪着光地盯着你。[say:这主意太蠢了！我知道该怎么成功了！我可以改舔你的屁股！你觉得它会不会像你的彩虹光环一样，尝起来像云朵冰淇淋？]");
         outputText("[pg]你摇摇头，告诉[Arian em]你并不想让[Arian ey]舔你的屁股。不如你去给[Arian em]弄点糖果来？[say:糖果！？我爱糖果！你可以把巧克力抹在自己身上，然后我来舔干净！这样我们就能吃到带有[race]麝香味的巧克力云朵冰淇淋了！真是个好主意！快把内裤脱了，我要开始了！] [Arian Ey]朝你扑过来，干脆利落地扒掉你的内裤，露出你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
            if(get_player().hasVagina())
            {
               outputText("，而");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         if(!get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("无性别的胯间");
         }
         outputText("。[say:嗯，看起来其实比糖果好吃多了。] [Arian Ey]舔着你的");
         if(get_player().hasCock())
         {
            outputText("肉棒，从根部一路舔到顶端");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴，从后面一直舔到你的[clit]尖端");
         }
         else
         {
            outputText("汗津津的胯间");
         }
         outputText("。[say:好吃！我还想再来一份，不过角色扮演时间结束了；我们来……互相自慰吧！] [Arian Ey]开始抚弄[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-home-mutualmasturbation");
         }
         else
         {
            get_images().showImage("arianmale-home-mutualmasturbation");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 1)
         {
            outputText("迅速勃起的蜥蜴人肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("和[Arian eir]");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("淫液淋漓的小穴");
         }
         outputText("。");
         outputText("[pg]阿瑞安肯定是嗨过头了；平时[Arian ey]要稍微鼓励一下，才会愿意做出这种表演。不过，有你的蜥蜴人恋人白送上门的表演，你又有什么理由错过呢？");
         outputText("[pg]阿瑞安一边不受控制地笑着呻吟，一边说道：[say:哇，[name]，你的手摸起来真舒服！而且还有点熟悉！]");
         outputText("[pg][Arian Ey]显然已经迷糊到没意识到，其实是[Arian ey]自己在摸[Arian em]自己。不过这场面与其说吓人，不如说有趣，所以你也乐得旁观，让这出戏继续演下去。还挺让人兴奋的……");
         dynStats(DynStat.Lust(5 + get_player().lib / 10));
         var _loc2_:Boolean = false;
         outputText("[pg]阿瑞安的咯咯笑声突然停住，[Arian ey]终于达到了高潮，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("一股股浓稠的精液射向空中，又落在[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 0)
            {
               outputText("胸口上");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1)
            {
               outputText("挺翘的小乳房上");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
            {
               outputText("柔软的乳房上");
            }
            else
            {
               outputText("枕头般柔软的乳房上");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("，与此同时");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("[Arian eir]的阴道也拼命把[Arian eir]的床弄得满是蜥蜴人的雌性淫液");
         }
         outputText("。");
         outputText("[pg]阿瑞安晕乎乎地看着你，笑着说：[say: 真好玩，[name]。你的手真的太厉害了！]你忍住笑意；这实在太有意思了。你告诉阿瑞安，功劳该归谁就得归谁。至于你是在说自己才是那双厉害的手的主人，还是在鼓励[Arian em]意识到真正有一双巧手的是[Arian ey]自己，就留给这个迷迷糊糊的蜥蜴人慢慢想明白吧。");
         if(Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("[pg][say: 呃……感觉有点怪怪的……]阿瑞安低头看向[Arian eir]的胯间。你顺着[Arian eir]的视线看去，发现那里正长出第二根阴茎。它一直长到和阿瑞安原本的那根一样大，等变化结束后，阿瑞安突然控制不住地大笑起来。");
            outputText("[pg][say: 看啊，[name]！你把我干得太狠，我都看见重影了！][Arian Ey]伸手去摸[Arian eir]那两根敏感的阴茎。[say: 哇！感觉也变成双倍了！]笑声终于渐渐停下，蜥蜴人仰面倒下，很快就打起了小盹。");
            _loc2_ = true;
         }
         else
         {
            outputText("[pg]阿瑞安张大嘴打了个哈欠。[say: 嗯……该睡一小会儿了……][Arian Ey]仰面一倒，很快就打起了小盹。");
         }
         outputText("[pg]你低声偷笑起来。这结尾还真是够虎头蛇尾的。不过你还是忍不住轻轻抚摸阿瑞安的头；看起来[Arian ey]刚才确实把[Arian emself]弄得很开心。阿瑞安突然坐起身来揉着[Arian eir]的眼睛，你惊讶地把手收了回来。[say: 什……嘿，[name]。抱歉，我好像睡着了。]低头看了看[Arian emself]， [Arian ey]这才意识到[Arian ey]现在的状态。 [Arian ey]一时间显得有些困惑……但随后又笑了起来。[say: 我想我们最后还是做了，对吧？感觉好吗？抱歉，我还有点晕，记不太清到底发生了什么。]");
         outputText("[pg]你告诉[Arian em]，那绝对挺有意思的。你这个小惊喜似乎真的让[Arian Ey]兴奋得不行。");
         if(_loc2_)
         {
            outputText("[pg][say: 嗯……我还是觉得全身都很敏感……][Arian Eir]的手心不在焉地碰到了[Arian eir]那两根仍然半勃起的阴茎。[say: 啊？]低头看向[Arian eir]的胯间，阿瑞安这才终于意识到[Arian ey]有两根阴茎。");
            outputText("[pg][say: 两根……可是，我之前……是你做的吗，[name]？]");
            outputText("[pg]你微笑着点了点头；[Arian ey]喜欢它们吗？");
            outputText("[pg][say: 喜欢？我爱死它们了！你根本不知道我有多想……多想……真的像我大多数族人那样拥有两根阴茎。谢谢你给我这么棒的惊喜，[name]！][Arian Ey]开心地冲你咧嘴一笑。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,939,1);
         }
         else
         {
            outputText("[pg][say: 我想也是……][Arian Ey]疲惫地对你笑了笑。[say: 谢谢你给我这么棒的惊喜，[name]。]");
         }
         outputText("[pg]你轻轻笑了笑，告诉[Arian em]，该道谢的人其实是你。");
         outputText("[pg]蜥蜴人困惑地看着你，正要问些什么，却被一个哈欠打断了思路。[say: 好吧……不管我们刚才做了什么，很高兴你喜欢……我要去睡一会儿了。]");
         outputText("[pg]你轻轻把被子拉到疲惫的蜥蜴人身上，疼爱地摸了摸[Arian eir]的头，然后安静地离开了[Arian eir]的寝室。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveArianReducto() : void
      {
         arianSprite();
         clearOutput();
         outputText("你上下打量着阿瑞安，在自己的袋子里翻找出一管缩形膏。找到之后，你把它递给阿瑞安，并告诉[Arian em]，你想让[Arian em]帮你缩小点什么。");
         outputText("[pg][say: 嗯……好啊，哪个部位？]");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) > 0)
         {
            addButton(0,"乳房",useReductoOnAriansBreasts);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            addButton(1,"阴茎",useReductoOnArianCocks);
         }
         addButton(2,"肛门",useReductoOnAriansAsshole);
         setExitButton("返回",giveArianAnItem);
      }
      
      public function giveArianLactaid() : void
      {
         var _loc1_:* = null as IMap;
         arianSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().LACTAID);
         outputText("你的手握住那瓶名为催乳剂、能诱导泌乳的药水。你差点下意识地把它否决掉，但随后你停下来想了想。毕竟，这个世界上更离奇的事也有。你取出小瓶，问阿瑞安[Arian ey]是否愿意让你看看蜥蜴人的奶尝起来是什么味道。");
         outputText("[pg][say: 我不知道。蜥蜴人其实不会泌乳，因为我们是产蛋的，所以我也不清楚这个……]阿瑞安眯起[Arian eir]眼睛，看你手中小瓶上的标签。[say: ……催乳剂到底有没有用。不过如果你想试试，我想应该也不会有害……对吧？]阿瑞安紧张地笑了笑。");
         outputText("[pg]你向这位蜥蜴人保证，最坏的情况也不过是什么都不会发生，然后把那瓶催乳剂递给[Arian em]。[Arian Ey]接过你递来的瓶子，对你笑了笑。[say: 好吧。]");
         outputText("[pg]阿瑞安拔掉瓶塞，将浓稠的乳白色液体一饮而尽，然后把空瓶递还给你。[say: 味道还挺不错的……]");
         outputText("[pg]你们两人尴尬地沉默坐着，等着看会不会发生什么。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 0)
         {
            outputText("[pg]过了一会儿，阿瑞安叹了口气，拉开[Arian eir]长袍，揉了揉[Arian eir]胸口。[say: 我觉得它没起作用。至少……我没感觉有什么不同。]");
            outputText("[pg]你说这有点奇怪，并想知道是什么妨碍了它生效。你耸耸肩，猜测也许是因为阿瑞安原本就没有乳房？不过，反正也没造成什么坏处；阿瑞安或许想改做点别的事吗？");
            outputText("[pg]他耸耸肩，合上[Arian eir]长袍。[say: 抱歉，它没起作用，[name]。如果你想做点别的，尽管说就好。]阿瑞安对你微笑。");
            menu();
            addButton(0,"下一步",giveArianAnItem);
         }
         else
         {
            get_player().changeFatigue(-15);
            get_player().HPChange(get_player().maxHP() * 0.2,false);
            outputText("[pg]过了一会儿，阿瑞安开始喘息，随着[Arian eir]体温升高，[Arian ey]身上也冒出了汗。[say: 我觉得……好热。] 为了让体温降下来，阿瑞安脱下[Arian eir]长袍，躺到[Arian eir]床上，用[Arian eir]带爪的手给自己扇风。");
            outputText("[pg]你小心翼翼地靠近[Arian em]，问[Arian ey]还好吗。");
            outputText("[pg][say: 我的乳房感觉痒痒的。] 突然，阿瑞安愉悦地倒吸一口气");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
            {
               outputText("，[Arian eir]裸露的阴茎随着[Arian ey]因情欲而脸红，逐渐硬了起来");
            }
            outputText("。[Arian Eir]双手抓紧床单，你看着[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1)
            {
               outputText("挺翘的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
            {
               outputText("饱满诱人的");
            }
            else
            {
               outputText("柔软如枕的");
            }
            outputText("乳房在你眼前变大。[say: 我的乳房……做、做点什么，[name]！] 阿瑞安恳求道。你不确定自己该做什么，便抓住[Arian eir]乳房开始揉捏；它们在你手中不断变大，[Arian eir]挺立的乳头顶着你的掌心。[say: 啊……这样好舒服！别停！]");
            outputText("[pg]你忍不住打趣地问道，这该不会是阿瑞安为了让你给[Arian eir]按摩乳房而设下的计谋吧？因为如果[Arian ey]想要这个，真的没必要拐弯抹角。[Arian Eir]唯一的回应就是一声愉悦的呻吟。你轻笑着摇了摇头，继续按摩；就在这时，你注意到掌心渐渐变得湿润。你抬起手，亲眼确认后告诉阿瑞安：成功了，[Arian ey]正在产奶。难怪[Arian eir]乳房会变大，原来是为了给奶水腾出空间。");
            outputText("[pg][say: 太、太好了。所以，我想是成功了。接下来我们该怎么办？] 阿瑞安仍在喘息着问道。");
            outputText("[pg]这还用[Arian ey]问吗？你调侃道。你捏了捏[Arian eir]新近变得丰盈的乳房，俯下身亲吻[Arian eir]右侧乳头，轻轻将它含入口中吮吸。最初的几滴和你预想的不太一样；它出奇地温热，味道让人想起甜牛奶和草本茶，既美味又令人放松。你已经不需要更多理由，立刻认真吸吮起来，用舌头卷弄你这位爬虫恋人的乳头，诱出更多可口的蜥蜴人奶水。");
            outputText("[pg]阿瑞安呻吟着，开始抚摸你的后脑。[say: 嗯，这感觉好奇怪，但不是坏的那种奇怪。我从没想过自己有一天会长出乳房，更别说给别人喂奶了……还是用我自己的奶。味道怎么样？好喝吗？] 阿瑞安一边问，一边轻轻抚摸你的[hair]。");
            outputText("[pg]你没有开口回答，而是格外深地吸了一口，松开[Arian eir]乳头，将奶水含在嘴里，然后把惊讶的蜥蜴人拉入亲吻，让[Arian em]真正尝到[Arian eir]自己的东西——你把奶水从自己口中渡进" + arianMF("他嘴里","她嘴里") + "。阿瑞安惊得只能把送来的奶水咽下去。[Arian Ey]放下[Arian eir]双手，只顾着吞咽你渡来的奶。等你口中的奶水没了，你才结束这个吻，玩笑般舔去[Arian eir]嘴角一滴残留的奶水，然后重新把注意力放回[Arian eir]乳房上。这位蜥蜴人法师抱着你的头贴在[Arian eir]乳房上，仍然有些发愣。[say: 想、想喝多少都可以，] [Arian ey]恍惚地说道。");
            outputText("[pg]你不需要更多鼓励，开始如饥似渴地吸干阿瑞安能提供的所有奶水；这个蜥蜴人在你身下轻轻扭动，发出呻吟和叹息。最后，关于这瓶催乳剂的效果是否永久这个问题也有了答案：你已经把[Arian em]吸干了。你轻轻打了个嗝，从[Arian em]身上起来，有些小心地摸了摸自己被撑得发胀的肚子。");
            get_player().refillHunger(10 + 10 * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941));
            outputText("[pg]阿瑞安松了口气。[say: 感觉挺舒服的。也许以后我们还能再来一次？]");
            outputText("[pg]你告诉[Arian em]，如果[Arian ey]愿意，那当然可以，不过你得先再找一小瓶来。你觉得阿瑞安在那之前应该先休息一下。[Arian Ey]点点头，揉捏着[Arian eir]如今已经空掉的乳房。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) < 3)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,941,FlagDict_Impl_.arrayReadInt(_loc1_,941) + 1);
               outputText("[pg][say: 是我的错觉，还是……它们变大了？] 阿瑞安好奇地问道，看着你，同时托着[Arian eir]" + (get_noFur() ? "乳房" : "覆鳞圆乳") + "。");
               outputText("[pg]你也好奇地看了看它们，然后判断出——也告诉了[Arian em]——没错，它们确实变大了。大概是为了容纳并分泌[Arian ey]刚刚喂给你的奶水而扩张后的副作用吧。");
            }
            outputText("[pg]阿瑞安疲惫地笑了笑。[say: 我想我现在得休息一会儿了……也许你也该歇歇？][Arian Ey]指着你鼓胀的肚子建议道。");
            outputText("[pg]你点头同意，又问[Arian ey]，如果你自己出去的话，[Arian ey]会不会没事。阿瑞安点点头，打了个哈欠。[say: 那回头见，[name]。]");
            outputText("[pg]你让[Arian em]留下来睡一会儿，自己悄悄离开，打算去别处消化掉这顿大餐。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function giveArianAnal() : void
      {
         var _loc2_:* = null as IMap;
         arianSprite();
         var _loc1_:int = get_player().cockThatFits(50);
         clearOutput();
         arianHealth(3);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,936,FlagDict_Impl_.arrayReadInt(_loc2_,936) + 10);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) >= 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,936,100);
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,942,FlagDict_Impl_.arrayReadInt(_loc2_,942) + 1);
         if(arianMF("m","f") == "f")
         {
            get_images().showImage("arianfemale-home-giveArianAnal");
         }
         else
         {
            get_images().showImage("arianmale-home-giveArianAnal");
         }
         if(_loc1_ == -1)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你告诉阿瑞安，如果[Arian ey]愿意的话，你想从后面进入[Arian em]。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg][Arian Ey]不安地扭动着，咬住[Arian eir]下唇。[say:我……好吧。只——只要温柔点，好吗？我后面那里还很紧。]阿瑞安迟疑地翻过身，四肢着地跪好，把[Arian eir]的尾巴抬到一边，让你得以瞥见[Arian eir]那皱缩的穴口。");
            outputText("[pg]你向[Arian em]保证会温柔些，然后侧身爬上[Arian eir]的床，来到[Arian em]身后。你伸出一只手，抚摸[Arian eir]的尾巴根部，轻轻欣赏着那冰凉而光滑的触感，随后把手向下滑去，揉过[Arian eir]的臀瓣。嗯……[Arian ey]的屁股真不错，你一边告诉[Arian em]，一边揉捏[Arian em]那丰腴、饱满且出乎意料柔软的臀肉，以此表达你的欣赏。没错，对于一个天生为男性的人来说，[Arian ey]的屁股确实棒极了，饱满圆润又柔软，诱人得很。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) < 1)
            {
               outputText("[pg][say:我——我也没办法，我天生就是这样……这不是什么坏事吧？]阿瑞安问道，在你抚摸[Arian eir]身后时不安地扭动、颤抖。从[Arian eir]的语气听得出来，[Arian ey]既因你明显欣赏[Arian eir]的屁股而有些受宠若惊，又感到难为情。你没有回答[Arian eir]的问题，只是牢牢抓住[Arian eir]那" + (get_noFur() ? "光滑的" : "覆鳞的") + "臀瓣，惹得这个慌乱的蜥蜴人倒吸一口气。");
            }
            else
            {
               outputText("[pg][saystart]是——是啊……我天生就是这样……而且变成一个");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 0)
               {
                  outputText("女孩");
               }
               else
               {
                  outputText("双性");
               }
               outputText("也不会让它变小的。[sayend]阿瑞安在你抚摸[Arian eir]身后时不安地扭动、颤抖着。");
            }
            outputText("[pg]你告诉[Arian em]，你不知道[Arian ey]为什么天生就有那样的屁股，但你确实很欣赏。你游移的目光落到");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("[Arian eir]正滴着淫液的小穴上那饱胀的阴唇");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
               {
                  outputText("，而");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText(arianMF("他那","她那") + "正在勃起的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("一对爬虫般的阴茎");
               }
               else
               {
                  outputText("爬虫般的阴茎");
               }
            }
            outputText("。哦，看来有人对此很兴奋嘛。怎么说呢，你几乎都要以为[Arian eir]的屁股会像小穴一样开始滴水了；光是想到你要肏[Arian eir]的屁股，[Arian ey]显然就已经兴奋成这样。为了强调这一点，你将一根试探的手指轻轻钻进[Arian eir]那近乎处女般紧窄的肛门里。哇，[Arian ey]可真紧……");
            outputText("[pg][say: 啊！轻、轻点……拜托，]阿瑞安抗议道，但尽管如此，你还是感觉到[Arian em]正轻轻迎向你侵入的手指。你告诉[Arian em]你会尽量温柔，可[Arian ey]这样让你很难把持；[Arian ey]其实很想让你赶快肏[Arian eir]的屁股，对吧？[Arian ey]都这样求着要了，你实在很难控制自己。为了强调这一点，你将你的[cock]轻轻抵在[Arian eir]尾巴根下方，在[Arian eir]那女孩般的臀瓣之间磨蹭。");
            outputText("[pg][say: 我……是的……我、我也想要。肯定会疼，但我想要……我、我想让你这么做，]阿瑞安承认道，把[Arian eir]的脸埋进被褥里，试图藏住[Arian eir]这句毫不知羞的坦白。[Arian Ey]做好准备，用[Arian eir]带爪的双手紧紧抱住[Arian eir]的枕头，绷紧身体迎接下一步。");
            outputText("[pg]你开始套弄自己，用缓慢而谨慎的手法让前液从肉棒上滴落，再把它涂抹在棒身上，努力为你的蜥蜴人情人做好润滑。终于，你觉得自己已经足够湿滑，再也按捺不住行动的冲动，便扶住[Arian eir]的屁股作为支撑，开始将你的" + get_player().cockDescript(_loc1_) + "抵向[Arian eir]那未经人事的后门。阿瑞安发出一声女孩般的惊叫，[Arian eir]的括约肌猛地收紧，阻住了你的进入。你问[Arian em]怎么了。");
            outputText("[pg][say: 没、没什么……你只是吓了我一跳……就这样。]尽管[Arian ey]不肯承认，但你看得出阿瑞安非常紧张。你俯身靠向这名紧张的蜥蜴人，温柔地抱住[Arian em]，告诉[Arian em]没关系；你不会伤害[Arian em]，你会让[Arian em]感觉很舒服，但首先[Arian ey]必须放松下来，否则本不该疼的事就会变得很疼。");
            outputText("[pg]阿瑞安叹了口气，放松下来，让[Arian eir]的括约肌松开到足以让你更容易进入。你不敢再拖延，立刻而小心地滑入[Arian em]体内，免得[Arian ey]又紧张起来。该死，[Arian ey]后面也太紧了！你必须用力顶进才能前进一点点，还得格外小心，确保自己在挺进[Arian eir]肠道深处时不会弄伤这名蜥蜴人。[say: 啊！进来了！]阿瑞安颤抖着，在你耕入[Arian eir]深处时努力保持放松。终于，在又小心地抽送了几下之后，你感觉自己在颤抖的蜥蜴人情人体内顶到了最深处。");
            outputText("[pg]当阿瑞安终于感觉到你的[hips]紧贴在[Arian eir]身后时，[Arian ey]在疼痛与快感中颤抖呻吟。[Arian eir]那密不透风的小菊蕾正适应着你的粗度和长度，[Arian Ey]明显愉悦地喘息起来。[say: 感、感觉怎么样？舒、舒服吗？]");
            outputText("[pg]你告诉[Arian em]感觉好极了；[Arian ey]后面又紧又结实……老实说，[Arian ey]几乎紧过头了；每当[Arian eir]的肛壁不由自主地收缩时，你都仿佛能感觉到[Arian eir]的心跳，那感觉就像要把你的肉棒绞断再吞进去一样。阿瑞安轻笑起来。[say: 我不想骗你，[name]。是有点疼，但也很舒服。我想……也许你该开始动了？]");
            outputText("[pg]哦，突然之间[Arian ey]倒成这方面的专家了，是吧？你承认[Arian ey]说得有道理。你开始从[Arian em]体内退出，一路都在与那不断挤压的肉壁和强烈的吸力对抗，随后又费力地把自己推回去，一寸一寸钻入，直到你再次完全没入[Arian eir]深处，然后周而复始。阿瑞安随着你的每一下动作呻吟低喘。[say: 现在开始舒服起来了……真的很舒服。别停。]");
            outputText("[pg]你继续在阿瑞安紧致而美妙的小屁股里进进出出，时间也随之渐渐淡去。很快——快得太过分——那股清晰无比的高潮感开始从");
            if(get_player().balls == 0)
            {
               outputText("你的肉棒根部");
            }
            else
            {
               outputText("你的睾丸深处");
            }
            outputText("涌上来，你警告阿瑞安，如果继续下去，你就要射在[Arian em]里面了。阿瑞安在痛楚与快感中流着口水，有那么一瞬间，你甚至怀疑[Arian ey]到底有没有听见你说话。[say: 射。射在我里面。我想要……全部都要！啊！]");
            outputText("[pg]你呻吟着叫出声，立刻满足了[Arian eir]的请求。");
            if(get_player().cumQ() < 250)
            {
               outputText("[pg]尽管和玛瑞斯本土的其他生物相比，你的精量或许算不上什么，但你毫不怀疑，这已经足够把阿瑞安紧致的屁股灌满精液了。你用短促而克制的抽送，在[Arian em]体内释放出来。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("[pg]你开始将惊人的精液倾泻进这名心甘情愿的蜥蜴人情人体内。你射入[Arian eir]紧致屁股里的精液越多，[Arian eir]湿滑的肌肉痉挛起来就越是舒服，榨取着你更多、更多的精液——阿瑞安这皱缩的小菊穴可真淫荡。你叹息着，看见[Arian eir]的腹部渐渐鼓起，一些溢出的精液也开始从阿瑞安的小洞周围滴落。");
            }
            else
            {
               outputText("[pg]有那么一瞬间，你犹豫了……阿瑞安显然没什么经验，而你也知道自己的精量大得惊人；你担心这名经验不足的蜥蜴人能不能承受得住你，但你的担忧很快就被抛到脑后——现在再担心已经太迟了。你的精液像消防水管一样喷入呻吟的蜥蜴人体内，以那股巨大量的白浊浓稠精液浇熄你和[Arian eir]的欲火。阿瑞安的肚子像孕妇一样隆起——不，实际上甚至更宽，而这名蜥蜴人淫荡的小洞却仍不知疲倦地榨取着你，哪怕阿瑞安此刻早已被灌得满满当当——大量精液从你的" + get_player().cockDescript(_loc1_) + "周围漏出，[Arian eir]的屁股根本无法将它们全部含住。");
            }
            outputText("[pg]你的高潮也引发了蜥蜴人的高潮，[Arian ey]咬住枕头，销魂地呻吟着，自己也射了出来，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("[Arian eir]自己的精液大团大团喷涌而出");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("，而");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("用大量蜥蜴人的阴液弄湿了你和[Arian eir]的双腿");
            }
            outputText("。你颤抖着喘息，直到彻底释放一空，再也忍不住倒在阿瑞安身上，把[Arian em]压进床铺舒适的怀抱里。你躺在那里，慢慢从这场无比愉悦的消耗中恢复体力，一边轻轻挪动身体，好让这个蜥蜴人能好好依偎着你。");
            outputText("[pg]阿瑞安疲惫地喘着气。[say: [name]，我表现得好吗？][Arian ey]满怀期待地问道。");
            outputText("[pg]你告诉[Arian em]，[Arian ey]棒极了，不过你还是忍不住露出一丝揶揄的笑，补充说，作为新手来说，[Arian ey]确实很棒。只要再稍微练习一下的话，嗯……");
            outputText("[pg]阿瑞安转过[Arian eir]头，带着疲惫却幸福的笑容看着你。[say: 我很高兴你喜欢。是有点疼，之后大概也会酸痛……但这很值得。我也喜欢……]随后[Arian ey]笑了起来。[say: 如果我需要的只是练习，那我希望你会帮我，对吧？]");
            outputText("[pg]你笑着回答说你会考虑的，不过现在你已经相当满足了，谢谢。[say: 太好了……]阿瑞安张开大嘴，懒洋洋地打了个大大的哈欠。[say: 我想我现在要睡一会儿……]");
            outputText("[pg]你玩笑似的拍了拍这个蜥蜴人的脑袋，让[Arian em]好好休息。你看着[Arian ey]安顿下来，睡去以平复这场性爱后的余韵，随后小心地重新穿好衣服，留下[Arian em]休息。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg][Arian Ey]局促地动了动，紧张地对你笑着。[say: 好吧，但别太粗暴。我可能已经有点习惯了，可你还是能把我撑得很开。]阿瑞安翻身四肢着地，尾巴兴奋地摆动着，让你瞥见[Arian eir]被撑开的穴口。[Arian Ey]回头看着你，向你投来[Arian eir]最诱惑的眼神，还左右扭动着[Arian eir]的臀部。");
            outputText("[pg]你对[Arian em]笑了笑，轻轻抚摸[Arian eir]摇摆的尾巴。阿瑞安叹息一声，趴到床上，双手向后伸去，为你分开[Arian eir]的臀瓣；[Arian eir]的尾巴则亲昵地蹭着你的侧身。你的双手向下伸去，轻轻把[Arian eir]的手拨开，然后开始抚摸[Arian eir]丰润的屁股，同时告诉[Arian em]，[Arian ey]的后面非常性感，而你会非常、非常享受干[Arian eir]后穴的感觉。");
            outputText("[pg]阿瑞安抬起[Arian eir]的臀部，让你更方便进入，随后眼中闪着光看向你。[say: 我也会很享受的。]");
            outputText("[pg]你用唾液润湿手指，还故意用舌头啧啧舔弄着手指，尽可能弄得淫靡些，然后轻轻探向阿瑞安黑色的褶皱穴口，试着进入，以估量[Arian ey]被撑开到了什么程度。你的手指相当顺利地滑了进去，只有象征性的些许阻力，便缓缓侵入了阿瑞安的肠道。[pg][say: 啊……这感觉真好……][pg]你挑了挑眉，虽然知道[Arian ey]从这个姿势看不见你，还是问[Arian ey]是不是真的已经变成了这么彻底的小肛奴，连这样都能觉得舒服？");
            outputText("[pg]阿瑞安尽可能转过身来看你。[say: 蜥蜴人雌性的肛门和阴道一样敏感，这是为了适应伴侣的双阴茎。][Arian Ey]刚解释到一半，就因为你开始抚弄[Arian eir]的内里而愉悦地呻吟起来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) < 1)
            {
               outputText("[pg][say: 这本来不该适用于我，因为我是雄性。啊！但我想我后面也开始变得敏感了。真的很舒服……嗯……]");
               outputText("[pg]你笑了笑，评论说你一点也不意外；如果[Arian eir]的种族天生就喜欢从后面来，那么雄性很快也会喜欢上这种感觉就说得通了……尤其是在你们两个练习了这么多次之后……");
            }
            else
            {
               outputText("[pg][say: 这本来不适用于我，因为我原本是雄性。啊！不、不过我想，既然我现在是女孩子了，我后面也开始变得敏感了。真的很舒服……嗯……]");
               outputText("[pg]你笑了笑，评论说既然[Arian ey]现在是女孩子了，如果真是这样的话，[Arian eir]的屁股是不是默认就该获得敏感度提升？");
               outputText("[pg][say: 我不知道……也许是吧……不过话说回来，蜥蜴人雌性也没有这些，]阿瑞安回答道，从床垫上撑起身子，向你展示[Arian eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1)
               {
                  outputText("挺翘的");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
               {
                  outputText("圆润的");
               }
               else
               {
                  outputText("柔软如枕的");
               }
               outputText("乳丘。");
               outputText("[pg]你忍不住偷偷伸手，爱不释手地摸了一把这名蜥蜴人挺起的胸脯，还承认如果是用对肛交的喜好来换取乳房，那听起来倒也挺划算；不过你对阿瑞安的胸部也没什么可抱怨的。阿瑞安倒吸一口气，胸口朝下扑倒在床上。[say: 它们也很敏感。]阿瑞安有些紧张地朝你笑了笑。");
            }
            outputText("[pg]你偷偷把一只试探的手伸到阿瑞安两腿之间，从下往上摸去。哦嚯！你咧嘴一笑，因为");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("一");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("对滴着淫液的肉棒");
               }
               else
               {
                  outputText("根滴着淫液的肉棒");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText("和");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("一个湿透的小穴");
            }
            outputText("迎上了");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 0)
            {
               outputText("");
            }
            outputText("你的触碰。阿瑞安真是越来越像个小淫娃了；[Arian ey]已经迫不及待了，而且明明知道接下来要被干的是[Arian eir]的屁股！");
            outputText("[pg]阿瑞安喘息着呻吟起来。[say: [name]，求你了。别再逗我了。我想要你。][Arian Ey]回头望着你，眼里满是渴望。[Arian Ey]兴奋得显而易见，用屁股顶着你探入[Arian eir]后穴的手指磨蹭起来。");
            outputText("[pg]好吧，既然[Arian ey]这么急着开始……你玩闹似地在[Arian eir]屁股上拍了一巴掌，那一下让臀肉愉悦地荡起波纹，清脆的啪声在这名蜥蜴人的");
            if(arianFollower())
            {
               outputText("帐篷");
            }
            else
            {
               outputText("卧室");
            }
            outputText("里回响。你把手指陷进[Arian eir]屁股上光滑" + (get_noFur() ? "" : "带鳞") + "的皮肤里，随即将你的" + get_player().cockDescript(_loc1_) + "挺进[Arian eir]的后穴；你不再像对待还是肛交处子的阿瑞安时那样温柔，但也并不粗暴。这个蜥蜴人用[Arian eir]的屁股取悦你肉棒的练习成果显而易见——你几乎像是滑进润滑过的穴里一样进入了[Arian eir]，那一点点阻力也很快在你持续推进的压力下让了步。它不再像从前那样紧得发疼，松弛了些的后穴让你能更自如地动作，不必担心伤到你的爱人；但与此同时，它又像训练有素的小穴一样紧紧裹住你，把你夹得无比舒服，还急切地将你吸向更深处。");
            outputText("[pg]阿瑞安因你的进入而淫荡地呻吟起来。[say: 啊，我能感觉到你在我身体里。我喜欢这种感觉……好涨……你喜欢我的屁股吗，[name]？像这样使用我的时候，感觉舒服吗？]");
            outputText("[pg]是的，你嘶声说道，是的，感觉好极了……[Arian ey] 真的这么喜欢吗？你的抽送一刻不停，毫不留情地撞进 [Arian eir] 贪婪的小");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) < 1)
            {
               outputText("男穴");
            }
            else
            {
               outputText("下体小穴");
            }
            outputText("。[say: 是的——……哦，有时候会有点疼，可那种感觉、那种快感、那种疼痛……简直像上了天堂。]");
            outputText("[pg]你苦笑着俯身贴到阿瑞安背上，在 [Arian eir] 耳边低语，说既然 [Arian ey] 这么喜欢……那你只好更多地操 [Arian em] 了。说完，你加快了节奏，逼得你的蜥蜴人爱人发出一声愉悦又颤抖的呻吟。[say: 啊！[name]！你再这样下去，我就要——啊！] 要让 [Arian em] 怎么样？[say: 要、要高潮了～]");
            outputText("[pg]阿瑞安的屁股紧紧裹住你的 " + get_player().cockDescript(_loc1_) + "，与此同时 [Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
               {
                  outputText("肉棒喷出精液");
               }
               else
               {
                  outputText("双根肉棒喷出精液");
               }
               outputText("洒在床单上");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText("和[Arian eir]");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("收缩的小穴把蜥蜴人的淫液涂满你的下身");
            }
            outputText("。阿瑞安只能呻吟、颤抖，强烈的高潮把这个可怜的蜥蜴人震得浑身发颤。[Arian eir] 收缩的后穴变得格外紧，增加了对你 " + get_player().cockDescript(_loc1_) + " 的摩擦，把你一步步推向高潮。");
            outputText("[pg]既然没有必要再忍耐，你也放声喊了出来，任由高潮的感觉吞没自己；快感从");
            if(get_player().balls == 0)
            {
               outputText("你的脊椎根部");
            }
            else
            {
               outputText("你的睾丸深处");
            }
            outputText("一路撕扯着贯穿全身。彻底沉浸在快感中的阿瑞安软绵绵地趴在 [Arian eir] 床上，屁股被你紧握的双手托着。随着最后一次深深挺入，你终于越过了顶点。");
            if(get_player().cumQ() < 250)
            {
               outputText("[pg]你把尽可能多的精液灌进阿瑞安体内，用你的液态爱意填满 [Arian em]；蜥蜴人喘息、呻吟，扩张的括约肌紧紧夹住你。不过你很快就射空了，又抽动几下后，你感觉到蜥蜴人仍在收缩的菊蕾放松下来，让你得以从 [Arian eir] 深处抽出。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("[pg]阿瑞安的屁股舒服得让你忍不住把它染成白色。一股又一股滚烫的精液从你的 " + get_player().cockHead(_loc1_) + " 涌出，灌进蜥蜴人顺从的肠道里。即便阿瑞安扩张的括约肌拼命想把你夹在原处，你还是忍不住继续在 [Arian eir] 滑腻得令人沉醉的内壁中抽送。等你结束时，阿瑞安看起来就像怀孕三个月一样；最后又挺动了几下后，你确信自己暂时已经把能给的全都给了 [Arian em]，于是从蜥蜴人饥渴的后穴里抽了出来。");
            }
            else
            {
               outputText("[pg]你尽可能深地埋进蜥蜴人的后庭，抓住 [Arian eir] 的臀部稳住身体，第一股精液终于从你悸动的 " + get_player().cockDescript(_loc1_) + " 中喷涌而出。你能感觉到呻吟的蜥蜴人随着你射入 [Arian eir] 诱人深处的每一股精液而颤抖；一条条黏稠的白浊灌满 [Arian em]，直到 [Arian eir] 的肚子涨得像沙滩球一样大。阿瑞安收缩的括约肌竭力想留住你惊人的精量，却根本不可能全部容纳；很快，白色精液就从你肉棒堵住的缝隙间爆涌出来。你快感的痕迹顺着蜥蜴人的双腿流下，和蜥蜴人自己的体液一起浸湿床单。最后一股喷射把阿瑞安从你的肉棒上推了下去，你望着方才欢爱留下的狼藉成果。");
            }
            outputText("[pg]你欣赏了一会儿自己的杰作，但方才云雨后的疲惫很快追了上来。你倒在蜥蜴人身上，几乎和 [Arian ey] 一样沉浸在余韵之中……");
            outputText("[pg][say: 那……那真是最棒的一次，[name]。我从没想过做爱能舒服成这样，]阿瑞安喘息着说道。阿瑞安翻过身来，带着笑脸看着你，随后大大地打了个哈欠，向你露出[Arian eir]尖利的牙齿。[say: 好困……现在真想睡一会儿……]");
            outputText("[pg]你笑了笑，摸了摸这个蜥蜴人的头，告诉[Arian em]你真想不明白，一只会说话的蜥蜴怎么能这么可爱。你看着[Arian em]渐渐睡去，然后悄悄从[Arian eir]床上滑下，穿好衣服，离开了");
            if(!arianFollower())
            {
               outputText("房间");
            }
            else
            {
               outputText("帐篷");
            }
            outputText("。");
         }
         else
         {
            outputText("[pg][Arian Ey]不安地扭动着，发出低吟，迫不及待地翻身跪趴下来，抬起[Arian eir]尾巴挪到一边，又分开[Arian eir]臀瓣，让你瞥见[Arian eir]那抽动着的、松开的褶皱穴口。阿瑞安喘着气，兴奋地回头看向你。[say: 我都准备好了，[name]。来吧，把我填满。][Arian Ey]冲你咧嘴一笑。很明显，阿瑞安很喜欢被占有的念头，不过实在没必要急着开始……你更想慢慢品味这一刻，而且逗弄一下你这位急不可耐的蜥蜴人情人，总归是额外的乐趣。");
            outputText("[pg]你露出坏笑，故意逗[Arian em]说，眼前这个尾巴高高翘起、屁股撅着，像个渴望被当成动物一样干的屁眼荡货，真的是那个骄傲又独立的法师阿瑞安吗？阿瑞安回头望着你，眼神里带着哀求。[say: 哎呀，别逗我了。你看不出来我有多需要这个吗？]");
            outputText("[pg]你问[Arian em]到底有多需要？需要到像[Arian ey]这样的屁眼小荡货一样开口求你，嗯？你告诉[Arian em]，如果[Arian ey]能让你相信[Arian ey]真的想要到那个地步，你就会给[Arian em]。阿瑞安的尾巴缠上你的腰，把你拉向[Arian eir]颤抖的菊穴。[say: 来吧……把我填满。我热得像要烧起来了！求你，把我填满，好吗？]");
            outputText("[pg]你柔声哄道，[Arian ey]真是个坏透了的屁眼小荡货，同时在[Arian eir]屁股上玩闹似地拍了一下，接着捏住那丰满圆润的臀瓣，手指探进[Arian eir]股缝，试探着[Arian eir]的后穴。令你惊讶的是，你施加的那点轻微压力竟让[Arian eir]穴口一阵收缩起伏；[Arian ey]把[Arian eir]屁股训练得这么好，甚至能有意识地用那里夹住你、把你吸进去。");
            outputText("[pg]阿瑞安呻吟着，迎着你的手指挺动，急切地想让你进入得更深。[say: 啊……对……再多一点……][Arian Ey]低吟道。你往[Arian em]身下看去，可以看到[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("湿漉漉的小穴正不停淌出蜥蜴人的淫液");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("和[Arian eir]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("勃起的肉棒也已经像止不住一样流着前液");
            }
            outputText("。你简直不敢相信阿瑞安已经变成了这样；你问[Arian em]真的有那么舒服吗？[say: 比你能……啊……想象的还要舒服，现在快把我填满！][Arian ey]急切地要求道。");
            outputText("[pg]你觉得已经没有继续拖延的理由，而且估计[Arian ey]现在已经被训练得足够熟练，不需要你再温柔对待，于是你立刻从这个蜥蜴人贪婪的屁股里抽出手指，接着一记凶狠的挺送将肉棒直插到底，问[Arian ey]这是不是[Arian ey]想要的。");
            outputText("[pg]阿瑞安倒吸一口气，张开[Arian eir]大嘴，发出无声的尖叫。[Arian Eir]屁股收缩着，像在榨取你；");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("[Arian eir]小穴紧紧抽搐，涌出大量淫液；");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("，而");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("他的肉棒也一阵阵抽动，把一股又一股精液射到床单上");
            }
            outputText("。被你突如其来的侵入彻底压倒，阿瑞安向前瘫倒，把[Arian eir]脸埋进[Arian eir]枕头里，也把你拖倒在[Arian em]身上。[say: 啊……[name]，你的感觉太棒了。太不可思议了。我从没想过肛交能舒服成这样。]");
            outputText("[pg]你差点惊得眨了眨眼；你刚才把“后庭骚货”这个词挂在嘴边只是开个玩笑，没想到阿瑞安还真有点这样。不过眼下有更重要的事——比如用你的" + get_player().cockDescript(_loc1_) + "一路顶进阿瑞安那贪婪的小屁股深处！你捏住蜥蜴人" + (get_noFur() ? "" : "布满鳞片的") + "屁股，开始像野兽一样干[Arian em]，使出浑身兴致在[Arian eir]后穴里进进出出。");
            outputText("[pg]阿瑞安爽得尖叫起来，声音被[Arian eir]枕头闷住。[Arian Eir]屁股拼命想把你吸到最深处，不断收缩、榨取、紧紧夹住；即便阿瑞安才刚刚高潮过，你仍能看到[Arian eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("几根肉棒依旧硬得像石头，而且令人惊讶的是，还在一股股地流着精液");
               }
               else
               {
                  outputText("肉棒依旧硬得像石头，而且令人惊讶的是，还在一股股地流着精液");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
               {
                  outputText("，还有[Arian eir]");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("小穴随着你[hips]每一次颤抖的撞击，把淫液喷溅到你的[legs]上");
            }
            outputText("。[say: 啊！对！再来，再给我更多！更用力！更快！]阿瑞安哀求着，随后又在快感中咬住了[Arian eir]枕头。");
            outputText("[pg]既然[Arian ey]想要，你也没理由不给，于是继续挺动——不过想拔出来倒意外地困难，因为这蜥蜴人饥渴的下身还在顽固地试图把你留在里面。[Arian eir]内壁贪婪地起伏收紧，抚弄又挤压着你，想把你珍贵的种子榨出来。");
            outputText("[pg]你能感觉到[Arian eir]括约肌上的压力越来越强，猜到阿瑞安一定又快高潮了；你自己也差不了多少，如果[Arian ey]继续这样挤压、套弄你的" + get_player().cockDescript(_loc1_) + "，你觉得自己随时都会射出来。在终于坠入那不可避免的高潮深渊之前，你俯身压向[Arian em]，抱住[Arian eir]腰腹，好让自己能更用力地狠狠干[Arian em]。令人惊讶的是，阿瑞安似乎只感到快感；换作别人，被你这样粗暴对待早就痛得尖叫了，可阿瑞安却用尽[Arian eir]全力迎着你往后顶，想让你插得更深。你问[Arian em]是不是真的没事，哪怕一点都不疼吗？");
            outputText("[pg][say: 不！啊，对！射在我里面，[name]！我需要你的种子灌进我下流的屁股里。我需要感受你把我填满，像对待我这种后庭骚货一样使用我！我想和你一起高潮！]你挑了挑眉，在你认识的人里，阿瑞安绝对是最不可能说出这种话的人……要是[Arian eir]学徒们听见他们的" + arianMF("主人","女主人") + "这样央求别人使用[Arian em]，他们会怎么想？[say: 啊……我才不在乎，快用你又热又黏的精液把我灌满！]看来这位蜥蜴人法师已经爽到没法好好回答你了。等结束之后，你得和[Arian em]谈谈。");
            outputText("[pg]想到这里，你把自己交给爬虫情人的快感，以及[Arian eir]那下流的小屁股，任由积蓄已久的高潮终于攀上顶点，从你体内喷涌出一股股咸腥的精液。");
            if(get_player().cumQ() < 250)
            {
               outputText("[pg]你把自己的精液倾泻出来，深深射进阿瑞安的肠道里，[Arian eir]屁股拼命榨取，确保你体内连一滴种子都不剩。[say: 啊！我能感觉到！对！][Arian Ey]在极乐中尖叫。一团又一团精液顺着你的尿道涌出，灌进阿瑞安绽开的后穴里；当你终于射干、再也给不了[Arian em]更多时，你几乎都有些过意不去，尽管[Arian eir]屁股还在急切地榨着你。[say: ……哎呀。没了吗？][Arian ey]开玩笑道。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("[pg]你深深插进[Arian eir]屁股里，打定主意要把精液尽可能射到这蜥蜴人淫荡屁股的最深处。[say: 啊！你插得好舒服！给我！对——！][Arian ey]在极乐中尖叫。你能感觉到精液沿着尿道涌动，迫使阿瑞安的括约肌放松到足够让你终于像水管一样猛烈射进[Arian em]体内。你伸手揉着这个爽到失神的蜥蜴人腹部，感受它随着每一道强劲的喷射鼓起、膨胀。等你结束时，阿瑞安的小腹已经微微隆起。[say: 这就结束了？没了吗？][Arian Ey]打趣道。你苦笑着看了[Arian em]一眼，最后一次顶进[Arian em]体内，将最后一股精液射进[Arian eir]腹中。[say: 啊啊啊，对……]");
            }
            else
            {
               outputText("[pg]你毫不怀疑阿瑞安会喜欢你这惊人的精量，于是尽可能深地抵进[Arian eir]屁股里，确保[Arian ey]能把它们全都留在体内，然后终于让精液从你体内流出，灌进那饥渴于肉棒与精液的屁股里；它也急切地套弄着你的肉棒。[say: 我能感觉到！这次会很多！射出来！][Arian ey]在极乐中尖叫。你低吼一声，开始把淫靡得过分的大量种子灌进你的蜥蜴人情人体内。最初几股让[Arian eir]肚子微微鼓起，你立刻伸手过去，感受它随着后续每一次黏稠精液的喷发而继续膨胀。[say: 好多精液！好舒服……更多！]阿瑞安在你不断抽送的器官下爽得失神，却仍贪婪地索求。[Arian Eir]屁股始终没有停下对你" + get_player().cockDescript(_loc1_) + "的攻势，执意在你高潮时继续套弄你；即便你已经把阿瑞安灌得满溢，甚至有些精液开始从[Arian eir]屁股里倒流出来。[say: 嗯，对……好满……]你又往[Arian em]体内顶了几下，确保把最后一滴精液都射干净。");
            }
            outputText("[pg]满足而又舒爽的阿瑞安用[Arian eir]尾巴按住你不让你动，然后翻身仰躺过来，你的肉棒仍埋在[Arian em]体内。突如其来的摩擦让你倒吸一口气，顺势压倒在蜥蜴人身上，正好迎上你蜥蜴人情人的一吻。[Arian Ey]用[Arian eir]双手和双腿紧紧缠住你，随后终于在第二次高潮吞没[Arian em]时浑身震颤。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               outputText("[Arian Eir]小穴对着空气收紧，最后一次向你的胯间喷出一股湿液。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("[Arian Eir]跳动的肉棒一颤，向你的肚子射出最后一道蜥蜴人精液。");
            }
            outputText("[Arian Eir]屁股用力夹住你，形成一股吸力，最后才终于放松下来。[say: 那……那真是最棒的，]阿瑞安含糊地说着，随后终于瘫倒在[Arian eir]床上。");
            outputText("[pg]你发现自己也瘫倒在这个瘫软的蜥蜴人身上，在这场激烈的做爱之后喘着气恢复呼吸。最后，你终于攒够力气，从[Arian eir]屁股那心不在焉般的吮吸中抽身出来；随后它湿漉漉地咂合起来，把你的种子留在里面。[say: 你不在我里面的时候，我感觉好空，]阿瑞安疲惫地低声说道。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,945) == 0)
            {
               outputText("[pg]你难以置信地慢慢摇了摇头，告诉阿瑞安[Arian ey]真是太放纵自己了。阿瑞安尴尬地移开[Arian eir]目光。[say: 我……抱歉。只是那感觉太舒服了，我没法……对不起。][Arian Ey]别开脸，把[Arian eir]尾巴握到手里。你轻轻叹了口气，抚摸[Arian eir]布满鳞片的脸，告诉[Arian em]，享受其中并不是坏事，只是你没想到[Arian ey]会这么[say: 投入]。[Arian Ey]不需要为了你贬低[Arian emself]，这本来就应该让你们两个人都舒服。");
               outputText("[pg][say: 我……我并不是真的想作践自己。我想只是碰到肛交时，我会有点控制不住，因为那对我来说真的太舒服了。你不会因为我这样……因为我喜欢被人从后面干，就生气吧？]");
               outputText("[pg]你告诉[Arian em]，你当然没有生气；你只是想确认[Arian ey]是真的乐在其中，而不是误以为[Arian ey]必须这样表现，你才会对[Arian em]做这种事。阿瑞安松了口气。[say: 不，我……如果我那样让你不舒服了，对不起。我以为你也喜欢，毕竟你一直在逗我，但也许我该改一改？]");
               outputText("[pg]你摇了摇头；[Arian ey]就是[Arian ey]自己，而你对此相当自在。如果你真的不喜欢那样玩弄[Arian em]，那你早就不再干[Arian eir]的屁股了，不是吗？阿瑞安咬住[Arian eir]的下唇，紧张地对你笑了笑。[say: 所以，你喜欢我的屁股？]");
               outputText("[pg]是的。你当然喜欢，你如此宣告道。[say: 太好了，因为我也喜欢你进到我屁股里，所以我不用改变了？]");
               outputText("[pg]你还是得承认，像阿瑞安这样正经的人居然会如此热衷于肛交——而且还是被插的那一方——确实让你很震惊，但你并不希望[Arian em]只是为了你而改变。");
               outputText("[pg][say: 这一切对我来说都很新鲜。在你来之前，我从没和任何人在一起过，所以如果我表现得像……嗯，像刚才那样，也没关系吗？因为如果真的让你困扰，我可以改……]");
               outputText("[pg]不，[Arian eir]的行为没有什么是你想改变的");
               outputText("——这么说或许有点虚伪");
               outputText("……除此之外，你觉得[Arian ey]变成那样时还挺性感的。听到这话，阿瑞安一下子精神起来。[say: 真的吗？] 真的，你回答道。阿瑞安开心地对你笑了笑。[say: 那……你想再来一次吗？]");
               outputText("[pg]你轻笑了一声。现在可不行，你告诉[Arian em]；你们俩刚刚才来了一场相当激烈的，你需要一点时间恢复；除此之外，你还有别的事情要处理。阿瑞安失望地低下头，撅起嘴。好了好了，没必要这样，你们随时都可以改天再找点乐子。[say: 那好吧……回头见？] 你点了点头。[say: 好吧……我会等你的。]");
               outputText("[pg]你迅速收拾好衣服，悄悄动身");
               if(!arianFollower())
               {
                  outputText("返回特尔阿德雷的街道，再从那里回到营地。");
               }
               else
               {
                  outputText("离开[Arian eir]的帐篷。");
               }
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,945,FlagDict_Impl_.arrayReadInt(_loc2_,945) + 1);
            }
            else
            {
               outputText("[pg]你轻轻拍了拍阿瑞安的屁股，打趣地说[Arian ey]真是个毫不遮掩的屁股骚货，不是吗？不过，[Arian ey]的屁股里这会儿吃够鸡巴了吗？");
               outputText("[pg]阿瑞安对你苦笑了一下。[say: 我想现在这些够我满足一阵子了，不过再来一剂也不嫌多。]");
               outputText("[pg]好吧，你这只贪心的小蜥蜴就得等到你准备好了再说。不过如果[Arian ey]表现乖一点，也许你之后会再回来，你这样告诉[Arian em]，并玩笑般地轻点了一下[Arian em]的" + (get_noFur() ? "鼻子" : "吻部") + "以示强调。[say: 好，我会等着的。] [Arian Ey]开心地咧嘴笑了。");
               outputText("[pg]你也对[Arian em]回以微笑，收拾好衣服，悄悄动身");
               if(!arianFollower())
               {
                  outputText("返回特尔阿德雷的街道，再从那里回到营地。");
               }
               else
               {
                  outputText("离开[Arian eir]的帐篷。");
               }
            }
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveArianAnItem() : void
      {
         arianSprite();
         clearOutput();
         outputText("想到你身上带着的那些东西，你问阿瑞安愿不愿意替你服下点什么？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) < 1)
         {
            outputText("[pg][say:呃……还是不要了。我现在不太舒服，而且我觉得这时候喝什么东西不太明智，尤其是……奇怪的东西。]");
            outputText("[pg]你理解地点点头，换了个话题；如果你想把找到的药剂给阿瑞安，就得先把他照顾到恢复体力才行。");
            arianHomeMenu();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20)
         {
            outputText("[pg][say:你给我带来的是药吗？如果是的话，我很乐意喝；不然的话，我觉得还是等我好些再说吧，尤其是在你之前还那样训过我之后……]");
            if(!get_player().hasItem(get_consumables().VITAL_T))
            {
               outputText("[pg]你承认自己现在身上没有药，于是换了个话题。");
               arianHomeMenu();
               return;
            }
         }
         else
         {
            outputText("[pg][say:好吧，我想应该没问题。我觉得你不会给我任何有害的东西，而且如果你有什么能……呃……给性爱添点刺激的东西，我很乐意试试。]阿瑞安脸红了。");
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 0 && arianHealth() >= 10)
         {
            arianStoryDialogue1();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 1 && arianHealth() >= 20)
         {
            arianStoryDialogue2();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 2 && arianHealth() >= 30)
         {
            arianDialogue3();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 3 && arianHealth() >= 50)
         {
            arianImbue();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 4 && arianHealth() >= 75)
         {
            arianPlot4();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 5 && arianHealth() >= 100)
         {
            arianPlot5();
         }
         else
         {
            addButton(0,get_consumables().VITAL_T.get_shortName(),arianVitalityTincture).hint(get_consumables().VITAL_T.get_tooltipText(),get_consumables().VITAL_T.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().VITAL_T));
            addButton(1,get_consumables().P_DRAFT.get_shortName(),giveIncubusDraftToArian).hint(get_consumables().P_DRAFT.get_tooltipText(),get_consumables().P_DRAFT.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().P_DRAFT) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20);
            addButton(2,get_consumables().P_S_MLK.get_shortName(),succubiMilkForArian).hint(get_consumables().P_S_MLK.get_tooltipText(),get_consumables().P_S_MLK.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().P_S_MLK) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20);
            addButton(3,get_consumables().LACTAID.get_shortName(),giveArianLactaid).hint(get_consumables().LACTAID.get_tooltipText(),get_consumables().LACTAID.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().LACTAID) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20);
            addButton(4,get_consumables().REDUCTO.get_shortName(),giveArianReducto).hint(get_consumables().REDUCTO.get_tooltipText(),get_consumables().REDUCTO.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().REDUCTO) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20);
            addButton(5,get_consumables().REPTLUM.get_shortName(),giveArianReptilum).hint(get_consumables().REPTLUM.get_tooltipText(),get_consumables().REPTLUM.get_tooltipHeader()).disableIf(!get_player().hasItem(get_consumables().REPTLUM) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 20);
            addButton(14,"返回",arianHomeMenu);
         }
      }
      
      public function girlsLikeMaleArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他你更喜欢男人，而他绝对可爱得足以达到你的标准。尤其是他表现得像个没救的处男时。一听到“处男”这个词，阿瑞安缩了一下。你对这个情况感到惊讶，便问他是不是真的还是处男。阿瑞安又一次把脸埋进被子里，低声说道：[say: 是……] 你把被子从他脸上拉开，告诉他你们得解决一下这个问题。你从他的床上滑下来，开始脱下你的[armor]。阿瑞安也害羞地照做，脱下自己的长袍，直到他全身赤裸地躺在床上。");
         doNext(getPenetratedByArianAndHisHitlerMustache);
      }
      
      public function girlsLikeFemaleArian() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉他，虽然你非常喜欢他这个人，但你更喜欢女孩子。");
         outputText("[pg][say: 所以……如果我是个女人，你会更喜欢……对吗？] 你摸着下巴思索起来，想象着他变成女性会是什么样子。想到这里，你也不得不承认，如果他是个女孩子，你会很喜欢。[say: 好吧……我……我会做的！] 你惊讶地扬起眉毛。他打算做什么？阿瑞安从床上起身下来，似乎完全不在意自己正一丝不挂地暴露在外。接着，他慢慢走向自己的书桌，打开一个抽屉。他伸手进去，取出一只贴着粉色蛋形标签的神秘瓶子。他一边拔开瓶塞，一边转头看向你，随后将瓶中的液体一饮而尽。");
         outputText("[pg]药效几乎不到一秒就开始发作。他刚把瓶子放回抽屉，就瘫倒在旁边的椅子上。起初你还想着要不要呼救，但当你看到阿瑞安的阴茎正以肉眼可见的速度缩小，很快没入他生殖裂缝的凹陷里时，这个念头立刻从脑中消失了。他的阴茎一消失在里面，生殖裂缝便合拢起来，皮肤连接在一起，只在他的腹股沟处留下光滑的" + (get_noFur() ? "皮肤" : "鳞片") + "。更低一些，在他的——或者现在该说她的？——双腿之间，另一道裂缝张开了，很快向两侧分开，一颗小小勃起的阴蒂从湿润的褶皱中探了出来。淫液渗出，打湿了木椅；发情雌性的气味充满了这间小卧室，而你也感觉自己的两腿间逐渐发热、湿润。不过，变化还没有结束。一声低沉而女性化的呻吟过后，一对小巧挺翘的乳房浮现出来，上面还带着敏感的小乳头。你恍惚地看着变化完成，阿瑞安的脸庞变得更柔和、更圆润，也更像女孩子。她的身体也同样如此，臀部和屁股都变得更大，曲线更加丰满诱人，让她拥有了一副美丽而纤细的身材。");
         outputText("[pg]她露出紧张的笑容，问道：[say: 那、那么？我现在看起来怎么样……？] 你没有费心回答，而是走上前，轻轻扶她站起来。然后你温柔地把她推向床边，开始脱下衣服。阿瑞安微笑着躺了下来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,938,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,940,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,941,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,944,1);
         menu();
         addButton(0,"坐脸",arianFacesittingFirst);
         addButton(1,"假阳具玩乐",arianDildoFun).disableIf(!get_player().hasKeyItem("Dildo") && !get_player().hasKeyItem("Deluxe Dildo"),"需要一个豪华假阳具。");
      }
      
      public function getPenetratedByArianAndHisHitlerMustache() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-home-getpenetrated");
         }
         else
         {
            get_images().showImage("arianmale-home-getpenetrated");
         }
         outputText("你看向阿瑞安的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) < 3)
         {
            outputText("裂缝，想着里面藏着什么");
         }
         else
         {
            outputText("露在外面的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
         }
         outputText("；接着你转头看向阿瑞安，问[Arian em]，[Arian ey]愿不愿意让[Arian eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("两根肉棒");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("稍微活动一下？");
         outputText("[pg]阿瑞安清晰地咽了口唾沫。[say:你的意思是我们……然后我……把它插进去？] 你咧嘴一笑，点头确认，告诉[Arian em]没必要害羞……至少在你们的关系发展到现在这个地步之后，就不用了。");
         outputText("[pg][say:好吧……你想怎么做？] 你示意蜥蜴人站起来。阿瑞安立刻照做，从[Arian eir]的床上下来。你故意逗[Arian eir]似的占了[Arian eir]在床上的位置，抬头看着[Arian em]，一边");
         if(get_player().isBiped())
         {
            outputText("张开你的[legs]并");
         }
         outputText("把你的[vagina]展露在[Arian eir]眼前，任[Arian ey]欣赏。反应几乎是立竿见影的；阿瑞安的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) >= 3)
         {
            outputText("外露的");
         }
         else
         {
            outputText("隐藏着的");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("两根肉棒立刻");
         }
         else
         {
            outputText("肉棒立刻");
         }
         outputText("充血，完全勃起，展现出");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("它们的");
         }
         else
         {
            outputText("它的");
         }
         outputText("球状鼓胀、阵阵搏动的雄姿。");
         outputText("[pg]你微笑着告诉[Arian em]，虽然[Arian ey]一开始有些害羞，但[Arian eir]身体似乎很清楚该怎么做。阿瑞安只是紧张地笑了笑。你等了一会儿，最后才告诉[Arian em]，[Arian ey]该把[Arian emself]摆到你的入口");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，准备插进来；否则你们俩短时间内谁也别想舒服起来。");
         outputText("[pg]回过神来后，阿瑞安很快");
         outputText("跪到你的[legs]之间");
         outputText("，将顶端对准");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("每一个");
         }
         outputText(arianMF("他那","她那") + "");
         outputText("每一根肉棒的顶端");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("对准你的[vagina]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("和[asshole]");
         }
         outputText("。[Arian Ey]看着你，等你确认[Arian ey]确实该开始行动了。你微笑着点点头");
         if(get_player().hasLongTail())
         {
            outputText("，用尾巴缠住[Arian eir]的腰");
         }
         outputText("。");
         outputText("[pg]阿瑞安也对你报以微笑，终于开始慢慢把[Arian emself]送进你的身体。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("[pg]蜥蜴人有些犹豫地尝试把[Arian eir]两根肉棒同时塞进你的[vagina]和[asshole]里。异物进入让你轻轻叹了口气，你抬眼看向[Arian eir]的脸；[Arian eir]脸上满是极乐的神情，你甚至能看到这个蜥蜴人已经开始微微流口水了。阿瑞安那对肉棒的触感或许十分相似，但它们在你的后穴和小穴里带来的感觉却完全不同。");
            outputText("[pg]布满肉棒的球状凸起有点像一串珠子，不断撑开你的阻碍；每当其中一颗挤进来时，你都会呻吟出声，并绷紧身体迎接下一颗更大的凸起。阿瑞安温柔却执拗地向前挺进，显然很乐意尝试同时占有你的两个穴口。[say:没有弄疼你吧？][Arian ey]问道，显然仍然对你们之间的关系感到紧张。");
            outputText("[pg]你摇摇头，告诉[Arian em]你没事。[Arian Eir]的肉棒只是感觉……和你平时见过的东西不太一样。你还说，它们简直像是专门为了摩擦你后穴和小穴里最敏感的地方而生的。不过，要是[Arian ey]再不快点把你填满，你可能就得亲自动手了。让一个女孩等着可不是什么好事。");
            outputText("[pg]阿瑞安手忙脚乱起来，开始更起劲地插入你。[say:对、对不起，我只是不想弄疼你……]你叹了口气，告诉[Arian em]你又不是玻璃做的。[Arian Ey]可以稍微粗暴一点，当然如果[Arian ey]做过头了，你还是会让[Arian em]停下。不过，这点程度你完全承受得住！");
            outputText("[pg]你抓住[Arian eir]的双臂，把[Arian em]朝自己拉来，让这个蜥蜴人失去平衡，整根没入你的体内。");
            get_player().cuntChange(arianCockSize(),true,true,false);
            get_player().buttChange(arianCockSize(),true,true,false);
            outputText("[pg]蜥蜴人因这一下震惊地呻吟出声，仿佛[Arian ey]依旧不敢相信这一切真的发生了。[Arian Eir]的手指紧紧抓着你，但[Arian ey]没有再进一步动作——更可能的是，[Arian ey]还没办法让自己开始抽插，依然满是那种紧张的处子反应。");
         }
         else
         {
            outputText("[pg]阿瑞安紧张地开始把[Arian eir]那根奇特而凹凸不平的肉棒挺进你的阴户，只是怯生生地插入一两寸又退出来，仿佛还无法让[Arian em]self彻底贯穿你。");
            outputText("[pg]最初的进入让你呻吟出声，而[Arian ey]退出来时你又叹了口气。你被[Arian eir]这突如其来的挑逗弄得有些不耐烦，便问[Arian em]到底怎么了，为什么要退开？你明明已经准备得不能再充分了。");
            outputText("[pg][say:我、我很抱歉，只是……呃，我不习惯这种事，你知道的。]阿瑞安垂下眼睛，而你确信自己能看到[Arian eir]脸上泛起一抹淡淡的红色；[Arian eir]的白化让[Arian em]能够露出这种脸红的样子，而你不确定普通蜥蜴人是否也能如此。[say:终于能和女人在一起……这、这太让人招架不住了，更别说还是像你这样的女人。]");
            outputText("[pg]你对这个蜥蜴人的生涩叹了口气，温柔地握住[Arian eir]的手，引导它们环住你，告诉[Arian em]抱住你");
            if(get_player().hasLongTail())
            {
               outputText("，同时收紧缠在[Arian eir]腰上的尾巴，进一步鼓励[Arian em]这么做");
            }
            outputText("。这个蜥蜴人并不需要太多鼓励就顺从了，轻易地依偎到你身上，胸贴着胸，轻轻叹息。[say:对不起。有时候我真不明白，你为什么愿意和我这样的人做这种事，][Arian ey]说道，声音里带着一丝悲伤。");
            outputText("[pg]你回答说，你愿意这么做是因为阿瑞安很可爱，而你刚好喜欢[Arian em]。[Arian Ey]应该忘掉[Arian eir]那些不安，也该对[Arian emself]有点信心。不过，你现在欲火焚身，而且从顶在你[leg]上的触感来看，阿瑞安也是如此。你没有再多说什么，只是轻轻伸手往下，把[Arian eir]的肉棒对准你的[vagina]，然后捏住[Arian eir]的尾巴根部。");
            outputText("[pg]尾巴被捏的感觉让阿瑞安发出一声小小的惊叫，并本能地让[Arian em]向前一挺，把[Arian emself]整根埋进你的体内。");
            get_player().cuntChange(arianCockSize(),true,true,false);
            outputText("[pg]突如其来的进入让你愉悦地倒吸一口气；随后你把你的蜥蜴人情人抱得更紧，抚摸着[Arian eir]的背。你问[Arian em]，这有那么难吗？");
            outputText("[pg][say:不、不难，确实不难。但不管怎样，还是挺硬的，]阿瑞安回答。 [Arian ey]刚才是在开玩笑吗？");
         }
         outputText("[pg]你微笑着，轻轻点了点[Arian em]的鼻尖，告诉[Arian em]：除非[Arian ey]想让你把活儿全包了，不然要是[Arian ey]只是让[Arian eir]那话儿");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("待在你体内，你们两个可什么也做不成。");
         outputText("[pg]蜥蜴人立刻让[Arian em]自己忙活起来，笨拙地进进出出，生涩地抽送着，试图让你们两个都舒服起来。你很欣赏[Arian eir]的热情，但这么毫无章法地在你体内乱顶，并不能带给你渴望的快感。你让阿瑞安先停一下。");
         outputText("[pg]阿瑞安照做了，困惑地眨着眼看你。[say: 我弄疼你了吗？我是不是做错了什么？对不起！]蜥蜴人脱口而出。你笑着让[Arian em]冷静下来。[Arian Ey]没有做错什么，当然也没有弄疼你。[say: 那是哪里不对？]阿瑞安问道。随后[Arian Ey]像是明白了什么，噘起嘴来。[say: 我做得没那么差吧？]你揉着[Arian eir]的后背，告诉[Arian em]，只是毫无技巧地在你体内抽送，并不能让你舒服起来。");
         outputText("[pg][say: 对不起，][Arian ey]叹了口气。你告诉[Arian em]没关系，你只需要带着[Arian em]一步步来。你握住[Arian eir]尾巴的根部，开始引导这个缺乏经验的蜥蜴人，把[Arian eir]的尾巴当作操纵杆来用。");
         outputText("[pg]阿瑞安因快感而呻吟、颤抖，但这并不妨碍[Arian em]领会诀窍；事实上，[Arian ey]学得很快，甚至开始抢在你的“指示”前行动。[say: 我、我没法形容这有多棒，[name]。你里面又暖又湿，][Arian ey]在你耳边低声说道，完全沉浸在性爱的感觉里，并不是在刻意奉承你。");
         outputText("[pg]你与蜥蜴人爱人一同呻吟着，回应说[Arian ey]给你的感觉也一样美妙。[Arian Eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("那两根膨大的肉棒感觉");
         }
         else
         {
            outputText("那根膨大的肉棒感觉");
         }
         outputText("妙不可言，而且");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("它们的");
         }
         else
         {
            outputText("它的");
         }
         outputText("凸起摩擦着你的入口");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，带来无与伦比的刺激。你夸赞这个蜥蜴人学得很快，松开[Arian eir]的尾巴，转而抓住[Arian eir]覆着鳞片的肩膀，又指点了[Arian em]几句，好让[Arian ey]能顶到你最敏感的地方。");
         outputText("[pg]阿瑞安突然绷紧身体，倒抽一口气，连连呻吟着弓起[Arian eir]后背，随后[Arian ey]再也忍耐不住，在你体内高潮，将你的[cunt]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("和[ass]");
         }
         outputText("灌满[Arian eir]黏湿的精液。");
         outputText("[pg]当[Arian ey]用[Arian eir]的蜥蜴人精液填满你时，你发出呻吟；可当[Arian ey]立刻瘫倒在你身上，温柔地依偎着你时，你又忍不住失望地叹了口气。[say: 太棒了。嘿，怎么了？你为什么没有高潮？]阿瑞安好奇又满足地问。唔，你只是没来得及而已，不过没关系。你会自己想办法解决的，而且刚才那段时间确实很舒服。尽管因为没能高潮而有些懊恼，你还是拍了拍阿瑞安的头，对这个蜥蜴人笑了笑。");
         outputText("[pg][say: 你是说，我没让你……？不，不行，这可不能接受！] 阿瑞安低吼道。让你惊讶的是，你忽然感觉到[Arian eir]原本软下去的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("在你体内膨胀起来，蜥蜴人抓住你的双肩，又开始把[Arian em]自己一次次挺回你的体内。");
         outputText("[pg]你因惊讶与快感交织而呻吟出声，抵着阿瑞安稳住身体，而[Arian ey]又开始像一开始那样热情地抽插你。你确实很佩服，[Arian ey]的表现绝不是性爱新手能做到的。你决定用一个吻来感谢并赞扬这名蜥蜴人的投入。");
         outputText("[pg]阿瑞安立刻更加卖力，同时也试着回吻你，回应你的举动。你沉浸在这场亲密交合的快感之中，与[Arian em]一边交合，一边亲吻。慢慢地，你感到一股熟悉的压力在胯间积聚，你知道，自己渴望已久的高潮终于快要到来了。");
         outputText("[pg]阿瑞安[Arian emself]也如释重负地叫出声来；终于达成让你高潮的目标，意味着[Arian ey]也可以任由那些连");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) == 0)
         {
            outputText("[Arian ey]自己");
         }
         else
         {
            outputText("[Arian ey]");
         }
         outputText("都快承受不住的快感吞没，喷进你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
         {
            outputText("穴内");
         }
         else
         {
            outputText("几处穴内");
         }
         outputText("，又一次灌满蜥蜴人的精液，把[Arian eir]体内睾丸里剩下的最后一滴都挤了出来；随后[Arian ey]呻吟一声，瘫倒在你身上。阿瑞安的高潮也将你推过临界点，你感到自己的小穴");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("和肛门");
         }
         outputText("一阵阵收缩，拼命");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
         {
            outputText("它的");
         }
         else
         {
            outputText("它们的");
         }
         outputText("的全力去把可怜的蜥蜴人榨干，直到最后一次痉挛后，你瘫软下来，松开了那根蜥蜴人肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，仍深深埋在你体内；你们混合的体液有些顺着流下，沾湿了阿瑞安的床。");
         outputText("[pg][Arian Ey]躺在那儿，因耗尽力气而轻轻喘息，随后不知从哪儿挤出一点力气，露出一个虚弱却调皮的笑容。[say: 那么，我这次表现怎么样？] [Arian ey]问道。你喘着气告诉[Arian em]，[Arian ey]很棒。你没想到[Arian em]刚刚射过之后，居然还能这么快再次勃起。[say: 嗯，我在学院里从一些比较，呃，受限制的典籍里学过几招，这么说吧？还没厉害到能做什么大事，甚至也不值得拿去教人，但用来……做这种事还是够的……]");
         outputText("[pg]你对[Arian em]咧嘴一笑，问[Arian ey]为什么偏偏学了这么一个法术。阿瑞安又露出那种奇怪的、像是在脸红的表情。[say: 人总可以梦想有一天能遇到某个特别的人吧？]不管你怎么哄，[Arian ey]在这个话题上也只肯说到这里。");
         outputText("[pg]你决定暂时放下这个话题，告诉[Arian em]，虽然和[Arian em]待在一起很愉快，但你现在必须回去履行职责了。阿瑞安只是点点头，摆出[Arian eir]最努力的冷静表情。[say: 我明白……不过，拜托你，有空的时候一定要再来，好吗？]你笑着告诉[Arian em]你会的，一边抚摸[Arian eir]" + (get_noFur() ? "" : "覆鳞的") + "脸颊，随后又带着坏笑告诉[Arian em]，下次你至少还期待[Arian em]再来四场表演。听到你的提议，阿瑞安的眼睛都瞪大了，一半是害怕，一半是欲望。[say: 我……我不可能做到那种事！我是说，我没那么多精力，][Arian Ey]声明道，喉咙里清晰地咽了一下，移开了[Arian eir]视线。");
         outputText("[pg]你咧嘴一笑，把[Arian em]拉进最后一个吻里，告诉[Arian em]这只是给[Arian em]留个念想。说完，你迅速穿好衣服，告辞离开，只留下一个慌乱的蜥蜴人在那里休息。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getButtWreckedByArian() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-home-getArianAnal");
         }
         else
         {
            get_images().showImage("arianmale-home-getArianAnal");
         }
         outputText("你伸舌舔了舔嘴唇，问阿瑞安想不想在肛交里当插入的那一方？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg][say: 我不知道……不会很疼吗？你确定吗？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg][say: 我喜欢你用我的屁股，但如果你想让我用你的，我当然愿意照做。只要你真的确定想让我这么做……？]");
         }
         else
         {
            outputText("[pg][say: 我真的很喜欢被你填满，而且我自己也更喜欢那样做；不过如果你真的确定想让我来，我会试着让你也像我被你进入时一样舒服。]");
         }
         outputText("[pg]你妩媚地笑了笑，点头告诉[Arian em]，你很确定想让[Arian em]那样对你。");
         outputText("[pg][say: 好吧。那我们该怎么做？我不想做错什么，结果弄疼你……]");
         outputText("[pg]你坏笑着伸出手，抚摸着这个蜥蜴人的[Arian chest]，压低声音对[Arian em]说，[Arian ey]只需要躺到[Arian eir]床上，接下来就交给你……");
         outputText("[pg]阿瑞安咽了口唾沫，声音清晰可闻，但还是照做了。[Arian ey]慢慢向后倒在[Arian eir]床上，不安地扭动着，同时[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) >= 3)
         {
            outputText("露在外面的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("开始变硬");
            }
            else
            {
               outputText("开始变硬");
            }
            outputText("，完全挺立起来。");
         }
         else
         {
            outputText(arianMF("他的","她的") + "阴茎");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("们从各自的");
            }
            else
            {
               outputText("从它的");
            }
            outputText("藏身处探出，完全挺立起来。");
         }
         outputText("[pg]你摇曳着身姿走向趴倒在地的蜥蜴人，跨坐在[Arian eir]腿上，伸手握住[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("主");
         }
         outputText("阴茎。你开始缓慢而轻柔地抚弄它那奇特、凸节状的表面，你的手指让阿瑞安在你的触碰下颤抖着，发出呻吟和喘息。前液开始从这根爬虫般的阴茎顶端渗出，你有意将它抹遍[Arian eir]茎身，当作临时的润滑剂。");
         outputText("[pg][say: 噢嗯……这、这感觉太棒了，[name]，可、可是你再这样下去，我就忍不住了！]阿瑞安喘息着，[Arian eir]肉茎");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("在你手中搏动着。");
         outputText("[pg]唉，那可就太可惜了；虽然可能会有点粗暴，但你也只能用现有的东西凑合一下。想到这里，你停止了抚弄，开始沿着阿瑞安的身体往上挪，直到你的[ass]悬在[Arian eir]挺起的阴茎上方。你动作缓慢而刻意，慢慢让自己被它贯穿……");
         get_player().buttChange(arianCockSize(),true,true,false);
         outputText("[pg][say: 啊！这、这太刺激了！]阿瑞安发出一声愉悦的低吟，将[Arian eir]精液射进你的肠道里，润滑得足以让你轻松地滑坐到[Arian eir]茎身上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("与此同时，[Arian Eir]另一根肉茎也抽动起来，喷在你的");
            if(get_player().tail.type == 0)
            {
               outputText("背上");
            }
            else
            {
               outputText("尾巴上");
            }
            outputText("。");
         }
         outputText("[pg]你叹了口气，咂了咂舌；阿瑞安真的该好好锻炼一下[Arian eir]耐力了——[Arian ey]太容易让[Arian emself]沉溺在快感里，而你也温和地向[Arian em]指出了这一点。");
         outputText("[pg][say: 对、对不起……]看来也没办法。你只能改天再试了……[say: 不！等一下！]阿瑞安抓住你的臀部。[say: 我、我还能继续！]真的吗？因为你很确定自己此刻能感觉到[Arian em]正在变软……[say: 可、可以的……给我一点时间。]");
         outputText("[pg]阿瑞安抬头望着你，气喘吁吁；[Arian eir]双手开始在你身上游走，抚摸你的[hips]、你的[butt]、你的[chest]。有那么一瞬间，你确实感觉到[Arian eir]鼓胀的肉茎在你体内跳动，不过也许[Arian ey]需要一点刺激，才能让事情进展得更快？你露出一抹坏笑。");
         outputText("[pg]说着，你俯下身吻住[Arian em]，将舌头探入[Arian eir]口中，与[Arian eir]那条灵活的长舌纠缠在一起。你退开后，一只手向下伸到[Arian eir]两腿之间，捏住[Arian eir]屁股，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("抚弄着[Arian eir]另一根肉棒，并让它在你的臀瓣之间滑动，");
         }
         outputText("爱抚着[Arian eir]的尾根。你露出坏笑，开始轻柔却执拗地把手指探进[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) > 66)
         {
            outputText("急不可耐的");
         }
         outputText("后穴，摸索着寻找[Arian eir]的前列腺……");
         outputText("[pg]反应几乎是立刻就来了；阿瑞安在你的吻中呻吟起来，你感觉到[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("一对蜥蜴人肉棒几乎猛地弹起");
         }
         else
         {
            outputText("蜥蜴人肉棒几乎猛地弹起");
         }
         outputText("，重新挺得笔直，阿瑞安的急切甚至让你都有些惊讶。");
         outputText("[pg]你咧嘴一笑，心里带着几分调笑地想着，也许阿瑞安射得快，但[Arian ey]恢复的速度正好能弥补这一点。");
         outputText("[pg]阿瑞安紧张地咬住[Arian eir]下唇。[say:你要是一直这样摸我，我会忍不住的。][Arian Ey]闭上[Arian eir]眼睛，把头偏向一边，[Arian eir]双手紧紧抓着你的[hips]，脚趾在你身后蜷起。你忍不住轻轻拍了拍[Arian eir]的头，告诉[Arian em]，[Arian ey]像个害羞雏儿一样的时候真的很可爱，尤其是明明已经射在你里面之后。阿瑞安只是转过头，对你露出一个紧张的微笑。[say:我……我们可以……现在开始动了吗？]");
         outputText("[pg]当然，当然可以，你这样告诉[Arian em]。为了强调这一点，你开始上下起伏，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("让[Arian eir]那根被冷落的阴茎在你的臀缝间滑动，");
         }
         outputText("同时收紧内壁，夹住并感受[Arian eir]在你体内那种奇异又刺激的凹凸鼓胀质感。你呻吟着喘息，告诉[Arian em]，[Arian ey]的感觉如此独特，却又能把你刺激得这么舒服。");
         outputText("[pg]这位蜥蜴人法师几乎按捺不住[Arian emself]，在[Arian eir]的床上辗转扭动，因你的挑逗而喘息呻吟。你舔了舔嘴唇，继续骑在[Arian em]身上，");
         if(get_player().hasVagina())
         {
            outputText("小穴因情欲而滴着淫液");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("，而");
         }
         if(get_player().hasCock())
         {
            outputText("肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("把前液滴到[Arian eir]的肚子上");
         }
         outputText("。你已经快到了，你能感觉得到。你告诉阿瑞安你要高潮了，并央求[Arian em]和你一起射出来。");
         outputText("[pg]像是算准了时机一般，阿瑞安倒抽一口气，[Arian eir]肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("抽搐起来");
         }
         else
         {
            outputText("抽搐起来");
         }
         outputText("，预示着[Arian eir]高潮即将到来。[Arian Ey]抓紧[Arian eir]床上的床单，脚趾也蜷缩起来。[say: ……[name]！]一股又一股蜥蜴人的精液射出，把你的肠道染成一片白色");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("，连你的屁股也被弄得到处都是");
         }
         outputText("，随着阿瑞安达到高潮");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("，[Arian eir]自己的小穴也一阵阵收缩，淫液淅淅沥沥地滴在你们身下凌乱的床单上。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]你欢喜地叫出声来，随之迎来高潮，将自己完全交给这场欢爱的快感。你后穴紧紧夹住那根闯入你肠道的粗大肉棒，仿佛想把其中美味的浓精全都榨出来。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]一阵阵抽搐，接连射出一股又一股精液，把阿瑞安的[Arian chest]染成白色，也溅满了那呻吟着的蜥蜴人的脸。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[pussy]虽然无人照料，也加入了这场淫乱的表演，大量淫液流淌在趴伏着的蜥蜴人身上。");
         }
         outputText("[pg][say: 啊啊啊……]阿瑞安叹息着，浑身无力地倒在[Arian eir]床上。你很快也跟着倒下，趴在[Arian em]身上，抱住[Arian em]，而[Arian ey]也同样拥住了你。[say: [name]，你太棒了。]");
         outputText("[pg]你满足地咧嘴一笑，告诉[Arian em]，[Arian ey]自己也不赖。那么，[Arian ey]觉得当进攻方的感觉怎么样？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg][say: 哇，感觉真的好舒服。你也觉得舒服吗，[name]？希望你也喜欢……哇，]阿瑞安喘息着说。");
            outputText("[pg]你微笑着拍拍恋人的脑袋，向[Arian em]保证你也很舒服。");
            outputText("[pg][say: 那就好，][Arian ey]回答道，亲昵地用脸蹭着你。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg][say: 你的屁股夹着我的肉棒感觉太舒服了，[name]。我只希望你进入我身体里的时候，也能有这么舒服。不过说实话，我觉得我还是更喜欢我们的角色反过来。]");
            outputText("[pg]你坚持说确实会那么舒服，不过还是忍不住笑着提醒阿瑞安，[Arian ey]在这种事上是不是太沉迷于当承受方了。");
            outputText("[pg][say: 你从后面干我的时候实在太舒服了，不过干你也很舒服。][Arian Ey]微笑着说。");
         }
         else
         {
            outputText("[pg][say: 刚才真棒！现在你为什么不回报我一下，换你来用我呢？看着你那样坐在我的肉棒上，我也想被干了。][Arian Ey]咬住[Arian eir]下唇，尾巴在你们身下尽力摆动着。");
            outputText("[pg]你笑了起来：阿瑞安，你可真是个贪心的小骚屁股，对吧？你就这么对他说。");
            outputText("[pg][Arian ey]紧张地笑着说道：[say:我也没办法嘛。感觉真的很舒服。再说了，是你把我变成这样的，所以你也得负点责任。]然后[Arian ey]咽了咽口水。[say:不过我不是说我不喜欢……也不是那个意思。]");
            outputText("[pg]那要是你有时候也想当接球手呢，嗯？[Arian Ey]有这么棒的阴茎，[Arian ey]怎么能拒绝让你享受被它插进屁股的快感？你告诉他，[Arian Ey]可真贪心，还打趣地轻轻点了点他的鼻子。[Arian Ey]呜咽了一声。[say:好吧，我也喜欢当投手，可你现在能来弄我吗？拜托？][Arian Ey]一边急切地扭着[Arian eir]的臀部，一边问道。");
            outputText("[pg]你考虑了一下……");
            if(get_player().hasCock())
            {
               get_player().orgasm("Dick");
               dynStats(DynStat.Sens(2));
               get_player().slimeFeed();
               menu();
               if(get_player().hasCockThatFits(50))
               {
                  addButton(0,"是",giveArianAnal);
               }
               else
               {
                  outputText("。不过你太大了，塞不进阿瑞安的屁股里。");
               }
               addButton(1,"否",get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("[pg]你被[Arian eir]急切的样子逗笑了，但你指出自己眼下没有合适的条件帮[Arian em]，所以还是下次吧。");
            outputText("[pg]阿瑞安失望地呜咽了一声。");
            outputText("[pg][say:我想我现在得睡一会儿了。要一起吗？][Arian ey]大大地打了个哈欠，问道。你告诉他这个提议很诱人，但你真的得去忙别的事了。你抚摸着[Arian eir]的脸颊，告诉[Arian em]好好休息，把[Arian eir]的体力养回来——毕竟，[Arian ey]病得那么重也没过去多久。阿瑞安点了点头。[say:好吧，那很快再见？]");
            outputText("[pg]你向[Arian ey]保证很快会再见，并在[Arian eir]的额头上轻轻吻了一下。蜥蜴人安顿下来休息后，你悄悄重新穿好衣服，留下[Arian em]安然入睡。");
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getBlownByArian() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         if(arianMF("m","f") == "f")
         {
            get_images().showImage("arianfemale-home-getbj");
         }
         else
         {
            get_images().showImage("arianmale-home-getbj");
         }
         outputText("你的手顺着自己的小腹往下滑，思索着该做什么。阿瑞安似乎没有注意到，只是满怀期待地盯着你的勃起。你漫不经心地左右摆动臀部，并好笑地发现这个蜥蜴人似乎也跟着它移动视线。顺着这个念头，你问[Arian ey]愿不愿意帮你口交。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,950) == 0)
         {
            outputText("[pg]蜥蜴人移开[Arian eir]的目光，从出神中回过神来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
            {
               outputText("你注意到，在你的邀请下，阿瑞安裸露的阴茎正慢慢硬起来。");
            }
            outputText("[say:我……真的可以吗？]");
            outputText("[pg]你笑了笑，指出[Arian ey]听起来几乎有些迫不及待，不过你还是叮嘱[Arian em]要小心些；那可是很敏感的部位，虽然你不怀疑[Arian eir]的心意，但这并不会让[Arian eir]的牙齿变得不那么锋利。");
            outputText("[pg]阿瑞安急切地点点头。[say:我保证会小心的。我绝不会伤害你，[name]。]你也点点头，告诉蜥蜴人你会信任[Arian em]，随后在[Arian eir]床上躺下，把你[legs]之间的东西完全展露给[Arian em]。");
         }
         else
         {
            outputText("[pg]蜥蜴人冲你一笑，舔了舔[Arian eir]嘴唇。[say:我很乐意！][Arian ey]兴奋地回答道。你笑着提醒[Arian em]，要小心[Arian eir]的牙齿。");
            outputText("[pg]阿瑞安用力点头，表示明白你的担心。[say:当然，我绝不会伤害你的，[name]。]");
            outputText("[pg]对[Arian eir]的回答感到满意后，你告诉[Arian em]你会信任[Arian em]，随后在[Arian eir]床上躺下，把你双腿之间的东西完全展露给[Arian em]。");
         }
         outputText("[pg]阿瑞安翻身爬到你身上，伸手握住你的[cock biggest]，近乎虔诚地抚摸着。你看向阿瑞安的脸，发现[Arian em]正上下打量着你的阴茎，估量着它的尺寸。阿瑞安看着你笑了笑；接着[Arian ey]没有移开视线，伸出[Arian eir]舌头舔上你的[cockHead biggest]，又慢慢把你的阴茎含入口中，同时小心地抿起[Arian eir]嘴唇，以免[Arian eir]的牙齿弄疼你。");
         outputText("[pg]这感觉让你愉悦地颤抖起来；阿瑞安的口腔内部比你想象中更温暖，触感却平滑而柔软。某个又长又湿的东西在你的[cock biggest]周围扭动；有那么一瞬间，你几乎以为那是一条黏滑的蛇，但理智很快回笼，你意识到那是阿瑞安那条灵活的长舌，[Arian ey]正用它缠绕并纠住你探入其中的阴茎。");
         outputText("[pg]阿瑞安用力一吸，从你的[cock biggest]中诱出一小股前液，而阿瑞安也乐得将其吞下；第一次尝到你的精液时，[Arian ey]发出一声呻吟，随之而来的美妙震动沿着你的整根阴茎传来，诱出更多前液流进阿瑞安饥渴的口中。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,950) == 0)
         {
            outputText("[pg]你愉悦地喘息着，不由得疑惑阿瑞安什么时候把[Arian eir]嘴上的技巧练得这么好了；你还以为[Arian ey]说过，在遇见你之前[Arian ey]还是处子。");
            outputText("[pg]你问阿瑞安，[Arian ey]是不是真的在遇见你之前一直是处子。");
            outputText("[pg]阿瑞安松开你的阴茎，亲了亲它的[cockHead biggest]，然后回答道：[say:是的，我确定……不过我在自己身上练习过很多次……]");
            outputText("[pg]在[Arian em]自己身上？！你脱口而出；[Arian ey]到底有多柔韧啊？！");
            outputText("[pg]阿瑞安紧张地笑了笑，咬住[Arian eir]下唇。[say:我可是法师，记得吗？用魔法能做到很多事，但现在重点不是我，[name]。重点是你……所以让我给你看看我学会了什么吧。]阿瑞安在你的[cockHead biggest]上落下一吻，随后用[Arian eir]舌头慢慢缠住它，把你重新吸进[Arian eir]那渴求肉棒的口中。");
            outputText("[pg]你呻吟着，表示没错，这确实重要多了。");
         }
         else
         {
            outputText("[pg]你愉悦地喘息着，忍不住问阿瑞安，在你离开的时候[Arian ey]是不是一直由[Arian emself]练习。");
            outputText("[pg]阿瑞安松开你的阴茎，亲了亲它的[cockHead biggest]，然后回答道：[say:不用，我现在已经不需要在自己身上练习了。现在有你来帮我练，对吧？]阿瑞安在你的[cock biggest]上落下一吻，随后用[Arian eir]舌头慢慢缠上它，把你重新吸进[Arian eir]那渴求肉棒的口中。");
            outputText("[pg]你呻吟着告诉[Arian em]，只要[Arian ey]继续给你这么棒的口交，你非常乐意帮[Arian em]练习。");
         }
         outputText("[pg]你把你的[cock biggest]尽可能深地挺进蜥蜴人那张热切的小嘴里……噢，要是他们看到像[Arian em]这样骄傲的施法者正在这样给你含弄，会说些什么呢？");
         outputText("[pg]阿瑞安没有费心回答，嘴里塞满了阴茎，[Arian ey]也根本说不了话。[Arian Ey]用双手撑在你的[hips]上，开始真正卖力地为你口交；[Arian ey]一心想用有力、湿滑、啧啧作响的吮吸榨干你的精液，那声音从蜥蜴人嘴边没被你的[cock biggest]塞满的细小缝隙里传出来。");
         outputText("[pg]你呻吟着喘息着，拼命挺腰操弄着蜥蜴人的脸。你能感觉到熟悉的压力在体内深处积聚，快感的火花逐渐汇成高潮的前奏，你不禁想着，是不是该提醒阿瑞安接下来要发生什么……");
         outputText("[pg]阿瑞安始终没有放慢，即便[Arian ey]抬头看向你，想瞥见你的脸，好确认[Arian ey]有没有让你舒服。当你们四目相对时，你发誓自己能看见这位蜥蜴人法师正对你微笑，尽管[Arian eir]嘴里塞满了阴茎，让你看不清[Arian eir]的脸。你抓住[Arian eir]的脑袋开始引导[Arian em]时，[Arian Ey]愉悦地呻吟起来。");
         outputText("[pg]伴随着最后几声粗喘和吸气，它终于来了。高潮撕裂般席卷你的身体，将你的精液从[cock biggest]中喷涌而出，倾泻进阿瑞安吮吸着的嘴里——现在已经没必要担心[Arian ey]到底想不想让你射在嘴里了，精液已经进去了，[Arian ey]只能想办法应付。");
         outputText("[pg]第一股精液直冲[Arian eir]喉咙时，阿瑞安吃了一惊，却始终没有停止吮吸。不知怎么的，阿瑞安竟然能以你射出的速度，把你的精液全都喝进[Arian eir]那张热切的大嘴里；等你射完时，阿瑞安已经有了一个");
         if(get_player().cumQ() < 250)
         {
            outputText("小巧的");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("鼓鼓的");
         }
         else
         {
            outputText("巨大的");
         }
         outputText("圆肚子。[Arian Ey]带着满足的叹息松开你的阴茎，仰躺回床上。[say:啊……我饱了。]");
         outputText("[pg]你告诉[Arian em]，[Arian ey]看起来确实很饱");
         if(get_player().cumQ() >= 1500)
         {
            outputText("，事实上，你很惊讶[Arian ey]喝了那么多竟然没有撑爆");
         }
         outputText("；[Arian ey]确定自己没事吗？");
         outputText("[pg]阿瑞安打了个哈欠，露出[Arian eir]满是利齿的大嘴。[say:嗯，我只是需要睡一觉。]你轻笑着告诉[Arian em]，[Arian ey]至少也该钻到被子底下去。[say:太……累了，不想动。]阿瑞安又打了第二个哈欠。你觉得也没理由不绅士一点，便上前帮阿瑞安站起身来");
         if(get_player().cumQ() >= 1000)
         {
            outputText("——考虑到[Arian ey]肚子的大小，看起来就像个快要生下幼儿的母亲，这事可没你想得那么容易");
         }
         outputText("。你让这个蜥蜴人靠着你的肩膀，拉开[Arian eir]的床单，扶着[Arian em]回到床上；[Arian ey]倒下去时，床簧不堪重负地发出抗议");
         if(get_player().cumQ() >= 250)
         {
            outputText("，冲击让[Arian eir]肚子里的精液翻搅起来，发出清晰可闻的晃荡声");
         }
         outputText("。");
         outputText("[pg][say:谢谢你，[name]。]阿瑞安又打了个哈欠，闭上[Arian eir]的眼睛。你微笑着，亲昵地拍了拍这个睡着的蜥蜴人的头；然后穿好衣服，动身");
         if(!arianFollower())
         {
            outputText("回到营地，只是在离开前通知了莱卡和布恩，阿瑞安正在睡觉。");
         }
         else
         {
            outputText("走出阿瑞安的帐篷。");
         }
         get_player().orgasm("Dick");
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,950,FlagDict_Impl_.arrayReadInt(_loc1_,950) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function eavesDropOnArian() : void
      {
         clearOutput();
         arianSprite();
         get_images().showImage("arian-fap");
         outputText("你悄悄挪到门边，把耳朵贴在木门上，开始专心偷听。");
         outputText("[pg][say: 该死的病……该死的梦……啊，[name]……要是你知道就好了……]阿瑞安喘息呻吟着，手掌拍打发出的清晰撸动声传入你的耳中。[say: 啊！你把我折磨成这样……我多希望你能那样对我……啊……]");
         outputText("[pg]你思索着这个奇妙的发展。所以，这个爬虫对你动心了？他觉得你有吸引力？嗯，那么……你是该给他机会让他自己解决，还是现在进去，给他一个比手更好玩的东西？");
         dynStats(DynStat.Inte(1));
         menu();
         addButton(0,"闯进去",bargeInOnArian);
         addButton(1,"离开",leaveFappingArian);
      }
      
      public function doublePenetrateArian() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         get_images().showImage("arianfemale-home-doublepenetrate");
         var _loc2_:int = get_player().cockThatFits(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,937));
         var _loc3_:int = get_player().cockThatFits2(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,937));
         outputText("你打量着你那女性化的蜥蜴恋人，感觉自己的[cocks]在[armor]里开始蠢蠢欲动。既然你有足够的家伙能派上用场，而阿瑞安也有足够的小穴，你便问阿瑞安愿不愿意让你同时干进[Arian eir]的屁股和小穴里？");
         outputText("[pg]阿瑞安咬住[Arian eir]下唇，听到你的提议后有些坐立不安。[say: 可以。我的意思是……蜥蜴人雌性本来就该这样做爱，而且我现在也确实有这些部位了。]");
         outputText("[pg]阿瑞安翻过身，脸朝下趴在[Arian eir]床上，高高翘起[Arian eir]臀部，好让你能轻松碰到[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) <= 33)
         {
            outputText("紧致的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) <= 66)
         {
            outputText("松弛的");
         }
         else
         {
            outputText("抽动的");
         }
         outputText("肛门和湿淋淋的阴道；一双带爪的手伸到身后，为你掰开[Arian eir]臀瓣。[say: 好了，我准备好了。]阿瑞安回头看着你说道。");
         outputText("[pg]你轻轻挪到[Arian em]身后的床上，温柔地捏住[Arian eir]丰满圆润的臀瓣，揉了几下后把手移进[Arian eir]臀缝，试着同时按摩[Arian eir]的肛门和小穴。你用掌心抵着[Arian eir]后穴轻轻摩擦，手指则抚弄着[Arian eir]柔软的" + (get_noFur() ? "" : "覆着细鳞的") + "阴唇，问[Arian em]感觉如何。[say: 很、很好，]阿瑞安颤抖着回答。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg]你把手指滑进阿瑞安的小穴里，让[Arian eir]的淫液把它弄得又湿又滑，然后抽出手；你将那根手指对准[Arian eir]的屁股，开始执拗地顶着[Arian eir]的后穴。你费了些力气，但[Arian eir]的后穴终于让步了。阿瑞安呻吟起来，你的手指穿过[Arian eir]括约肌，探进[Arian eir]温暖的体内。你笑着告诉阿瑞安，[Arian ey]这里可真紧。");
            outputText("[pg][say: 嗯……我的屁股没怎么被用过，当然会紧。只是拜托你别太粗暴，好吗？有点疼。]");
            outputText("[pg]你向[Arian em]保证你会温柔些；而且[Arian eir]的小穴也会一起被填满，应该能让[Arian em]更容易适应。说完，你小心地对准自己的肉棒，开始向里压去。要挤进[Arian eir]的屁股里颇费了一番力气，但[Arian eir]的小穴却很快就用温暖湿润的怀抱接纳了你。");
            outputText("[pg][say: 噢噢噢！]阿瑞安最初因疼痛而发出的叫声，随着你终于进入其中，转成了深沉的愉悦呻吟。你停下来，给[Arian em]一点时间适应。[say: 我感觉被塞得好满……很疼，但同时又好舒服。嗯嗯……请继续动。]你照[Arian ey]说的做，缓缓地一直顶到根部。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg]你知道阿瑞安对肛交并不陌生，但出于礼貌，你还是觉得应该先多少润滑一下手指。你的手指来回抚弄爱抚，在[Arian eir]湿润的深处进出，然后你抽出手，开始探向[Arian eir]尾下的后穴。那训练有素的穴口欣然接纳了你，几乎没有任何抵抗，你那沾满雌液的手指便滑了进去。");
            outputText("[pg][say: 啊，这感觉真好。我这样被对待，感觉自己真像个女孩子……]");
            outputText("[pg]那当然了，[Arian ey]本来就是个女孩子，你咧嘴一笑。既然这样能让[Arian em]开心，你为什么不该这么对[Arian em]呢？[say: 这、这个，我其实不是真的女孩子。我是说……原本不是，但这确实让我很开心。你为什么不插进来呢？][Arian Ey]有些紧张地对你笑了笑。");
            outputText("[pg]好吧，既然[Arian ey]真的这么感兴趣。你迅速对准位置，开始向前压去，温柔地插进你恋人那两个渴求的小穴里。[say: 好——舒服……在把我完全塞满之前不要停，]阿瑞安说道，[Arian eir]尾巴在上方懒洋洋地摇晃着。你轻笑一声，把它拨到一边，好让自己继续顶进[Arian em]体内，一直没入到根部。");
         }
         else
         {
            outputText("[pg]与其说是必要，不如说是出于礼貌，你仔仔细细地用手指揉弄按摩阿瑞安那湿淋淋的小穴，把手指润得又滑又湿，然后才开始戳弄阿瑞安尾巴下面那个贪婪的小穴。你完全没有遇到任何阻力；事实上，它似乎还刻意皱缩起来，好把你的手指吸吮进去，肌肉也不断收紧，像是想把你留在里面。你暗自一笑，告诉阿瑞安，[Arian eir]的小菊蕾果然是个不知羞的小东西，而你对此一点也不意外。");
            outputText("[pg]阿瑞安愉悦地颤抖着，向后挺身，好让[Arian eir]后穴把你的手指吸得更深。[say: 嗯……这可都是拜你所赐。我不是在抱怨就是了。我喜欢你从后面占有我。]");
            outputText("[pg]你问，[Arian ey]真的这么喜欢吗？[Arian eir]那两个贪婪的小穴都急着想要一根好肉肠把自己塞满，嗯？[say: 是的……我需要你。求你了……让我舒服起来……像个女孩一样，]阿瑞安恳求道。");
            outputText("[pg]好吧，如果这就是[Arian ey]想要的，你又有什么理由拒绝[Arian em]呢？你立刻摆好姿势，开始缓缓将自己送入[Arian em]体内。");
            outputText("[pg][say: 嗯……快点嘛，[name]。你明明可以再快一点的，别逗我了！]阿瑞安抗议着向后迎向你，同时[Arian eir]尾巴缠上你的腰，把你往里拉。");
            outputText("[pg]你指出，[Arian eir]两个小穴都需要一点温柔对待。不过，你还是加快了节奏，挺进[Arian eir]饥渴的小穴里，直到自己没根而入。");
         }
         outputText("[pg]你呻吟着，揉捏阿瑞安那" + (get_noFur() ? "" : "带着鳞片却依然") + "丰润的屁股，问[Arian ey]觉得这双份填塞的滋味如何？[Arian ey]用[Arian eir]臀部贴着你磨蹭，回答道：[say: 我只能说，我开始明白我们蜥蜴人为什么会长成这样了。现在就占有我！][Arian ey]命令道。");
         outputText("[pg]你一巴掌拍在[Arian eir]挺翘的小屁股上，肌肤相击的脆响随之传开，然后你告诉[Arian em]别太贪心；这又不是比赛，没必要抢着赢。[say: 嗷！可、可是……我想要你！][Arian Ey]执拗地向后迎着你。你告诉[Arian em]，你也想要[Arian em]，但也没必要这么发号施令。阿瑞安撅起嘴。[say: 对不起……]");
         outputText("[pg]你说，这才对。随后，你开始挺进[Arian eir]的两个小穴。同时贯穿阿瑞安的两处小穴是一种独特的感觉；[Arian eir]后穴紧紧裹住你的" + get_player().cockDescript(_loc3_) + "，竭力把你深深含到根部，不让你抽动；而[Arian eir]的小穴又湿又滑，熟练地按摩着你的肉棒。有那么一瞬间，你甚至怀疑自己还需不需要动。");
         outputText("[pg][say: 噢，[name]……你根本不知道这感觉有多棒。我感觉好满……好舒服……好像被人渴求着……我爱你！让我的卵受精吧！]你低哼一声，露出坏笑，说阿瑞安也许有点太沉迷了，除非[Arian ey]是在告诉你，这个曾经是男孩的家伙真的想当妈妈？[say: 我……当妈妈……别、别停！我要你尽可能深地插进我里面！]当[Arian eir]两个小穴在你闯入的肉棒周围阵阵收缩，努力把你吸得越来越深时，你不由得呻吟起来。你任由它们引导，但也警告[Arian em]，如果[Arian ey]不收敛一下[Arian eir]的热情，不管[Arian ey]愿不愿意，你可能真的会让[Arian em]当上妈妈。");
         outputText("[pg][say: 你以为我在努力做什么！？现在给我进来，把我的子宫染成白色！]阿瑞安嚷道，[Arian em]撑在[Arian eir]床上，任由[Arian eir]的后穴和小穴都以惊人的力道把你吸进去。你一在两个小穴里没根而入，[Arian eir]后穴就死死夹住你的" + get_player().cockDescript(_loc3_) + "，而[Arian eir]小穴的收缩也开始真正将你榨得一滴不剩。被卡住的你别无选择，只能坐享[Arian eir]一阵阵的收缩，同时感觉自己正逼近一场不可避免的高潮。");
         outputText("[pg]你还是有些压不下惊讶，没想到这会让[Arian em]变成这样，但如果这就是[Arian ey]想要的。况且，[Arian eir]两个小穴像虎钳一样夹着你的肉棒，你也没得选，不是吗？你使出全部狠劲又挺进了两三下，抓住[Arian eir]的屁股大吼一声，高潮终于从你的双根肉棒中喷涌而出。");
         if(get_player().cumQ() <= 250)
         {
            outputText("[pg]你的[cocks]在阿瑞安饥渴的小穴里爆发，给予它们梦寐以求的温热液体。两根肉棒所受到的按摩只让这强烈的快感更上一层，你发现自己射得比平时更多。即使你停止倾泻，它们也仍不停地按摩着你，索要更多。");
            outputText("[pg][say: 更多，我的卵还需要更多！]阿瑞安命令道，可你已经真的被榨干了……");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("[pg]液态欲望灌满阿瑞安体内，你的[cocks]竭力释放");
            if(get_player().balls == 0)
            {
               outputText("自己");
            }
            else
            {
               outputText("你的[balls]");
            }
            outputText("中的积存；这份积存，阿瑞安不但乐意接受，还急着替你榨出每一滴残余。[Arian eir]后穴紧紧压迫着你的" + get_player().cockDescript(_loc3_) + "，[Arian eir]的小穴则不断榨弄你的" + get_player().cockDescript(_loc2_) + "。面对这样的邀请，又有谁能拒绝？你放任自己尽情释放，用比自己想象中更多的精液填满这个饥渴的蜥蜴人。");
            outputText("[pg][say: 更、更多，]阿瑞安央求着，哪怕[Arian eir]小腹已经开始鼓起。");
         }
         else
         {
            outputText("[pg]你射出的力道如此猛烈，要不是阿瑞安的后穴把你的" + get_player().cockDescript(_loc3_) + "夹得那么紧，你肯定[Arian ey]会被直接顶开。[say: 好多精液！太棒了！]阿瑞安呻吟着，而你很快就让[Arian eir]平日纤细的小腹明显隆起一块。尽管你那惊人的精液量已经足以彻底填满这个饥渴的蜥蜴女孩，[Arian eir]的后穴和小穴仍然加倍卖力，确保你被彻底榨干；而你也毫无抗拒的意思。");
            outputText("[pg]等你终于结束时，阿瑞安的肚子已经明显鼓胀起来。[say: 啊……卵……精液……是的……][Arian ey]恍惚地说道。");
         }
         outputText("[pg]阿瑞安的后穴在你的" + get_player().cockDescript(_loc3_) + "周围松弛下来，随后阿瑞安慢慢从你的肉棒上滑下，一屁股跌到[Arian eir]床上；[Arian ey]闭着眼，沉浸在幸福中，小睡了一会儿。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,947) == 0)
         {
            outputText("[pg]你松了口气，轻轻拍了拍阿瑞安的屁股，说你没想到[Arian em]竟然这么急着产下一窝受精卵，更没想到[Arian em]会这么……强势。");
            outputText("[pg]阿瑞安猛地睁开眼，迅速翻过身来与你对视。[say: 哦天啊！请原谅我，[name]。我发誓我也不知道自己是怎么了。刚才那是……对不起！] [Arian Ey]羞愧地低下了[Arian eir]头。");
            outputText("[pg]你只是笑了起来。所以说，看来[Arian ey]当时并不是真的能控制自己，对吧？好吧，你早该想到[Arian ey]会不适应的；毕竟[Arian ey]本来就不该陷入这种情况。");
            outputText("[pg][say: 我真的很抱歉……]");
            outputText("[pg]你告诉[Arian em]，[Arian ey]不需要道歉，但你确实需要知道：你现在是不是要当父亲了？[Arian ey]真的因为刚才和[Arian em]做爱而怀孕了吗？");
            outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say: 其实没有。我并没有一窝蛋可以让你受精，所以答案是否定的，] [Arian ey]说道，语气里带着一丝失望。");
            outputText("[pg]你问[Arian ey]为什么听起来这么失望；在遇见你之前，[Arian ey]一直都是以男性身份生活的——[Arian ey]真的想这么彻底地接受女性身份，甚至产下一窝蛋吗？");
            outputText("[pg]阿瑞安捂住[Arian eir]脸，身体扭动起来，那样子你只能形容为……很少女。[say: 对不起，我有这么多冲动，而且……嗯……老实说，如果是给你产下一窝蛋，我并不反感。]");
            outputText("[pg]你一时不知道该说什么，于是只是问[Arian ey]刚才是否享受。");
            outputText("[pg][say: 非常享受！]阿瑞安开心地咧嘴笑了。你也笑了笑，拍了拍[Arian em]的头，告诉[Arian em]听到这话真不错；也许你们改天该再来一次？");
            outputText("[pg][say: 如果能再来一次，我会很高兴的。]");
            outputText("[pg]你告诉[Arian em]你会记住的，然后礼貌地重新穿好衣服，离开了[Arian eir]");
            if(!arianFollower())
            {
               outputText("寝室");
            }
            else
            {
               outputText("帐篷");
            }
            outputText("。");
         }
         else
         {
            outputText("[pg]你松了口气，轻轻拍了拍阿瑞安的屁股，说每次你们像那样做爱时，[Arian ey]都会变得强势，这总让你觉得很意外。");
            outputText("[pg]阿瑞安慵懒地睁开[Arian eir]眼，翻过身面对你，揉着[Arian eir]肚子。[say: 嗯，我也不知道自己为什么会变成那样。我就是控制不住。]");
            outputText("[pg]你告诉[Arian em]，其实看着[Arian em]那样变化还挺有趣的，毕竟平常[Arian ey]绝不会向你索求什么。你从来没想到[Arian ey]还有那种……强势的一面。阿瑞安咬住[Arian eir]下唇。[say: 顺便说一句，刚才真的对不起。]");
            outputText("[pg]你摇了摇头，告诉[Arian em]没关系，然后轻轻拍了拍[Arian em]的[Arian eir]头，重新穿好衣服，告辞离开了[Arian eir]");
            if(!arianFollower())
            {
               outputText("寝室");
            }
            else
            {
               outputText("帐篷");
            }
            outputText("。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontTeaseHighAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         outputText("你轻轻抚摸蜥蜴人的侧身，又在[Arian eir]脖颈上落下一个温柔的轻吻。在你的安抚下，阿瑞安叹了口气，慢慢又安静下来。你等了一会儿，但[Arian ey]刚才做的梦似乎已经散去，[Arian ey]现在是真的睡熟了，你也可以重新睡去。");
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
      
      public function dontSleepWithArian() : void
      {
         clearOutput();
         outputText("你决定暂时晚上不和阿瑞安一起睡。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         arianHomeMenu();
      }
      
      public function dontListenToMediumAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         outputText("你轻轻抚摸蜥蜴人的侧身，又在[Arian eir]脖颈上落下一个温柔的轻吻。在你的安抚下，阿瑞安叹了口气，慢慢又安静下来。你等了一会儿，但[Arian ey]刚才做的梦似乎已经散去，[Arian ey]现在是真的睡熟了，你也可以重新睡去。");
         get_camp().sleepRecovery(false);
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
      
      public function dontListenToLowAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         outputText("你轻轻抚摸蜥蜴人的侧身，又在[Arian eir]脖颈上落下一个温柔的轻吻。在你的安抚下，阿瑞安叹了口气，慢慢又安静下来。你等了一会儿，但[Arian ey]刚才做的梦似乎已经散去，[Arian ey]现在是真的睡熟了，你也可以重新睡去。");
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
      
      public function dontHelpArianWhenYouMeetHim(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("不喜欢它带来的风险——毕竟，对方可能是个抢劫犯，也可能染了什么糟糕又高度传染的病——你继续往前走。没走多远，两个打扮优雅的" + (get_noFur() ? "身后拖着雪貂般尾巴的人" : "雪貂兽人") + "飞快跑来，差点撞上你。你冲他们喊，让他们看路，但他们压根不理你，径直朝你刚经过的那条小巷冲去。你看着他们抓住那个兜帽人，把他拉起来。那些雪貂" + (get_noFur() ? "人" : "兽人") + "开始对目标叽叽喳喳地说个不停；虽然你听不清他们具体在说什么，但听起来像是在训斥，同时他们从随身的小袋里取出一只瓶子，让那个兜帽人喝下去。披着斗篷的男人咳嗽渐渐平息下来，随后他们一人架住他一条胳膊，半扶半拖地把他带走了。你有些纳闷这到底是怎么回事，但还是觉得无关紧要，继续上路。");
         if(param1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,934,-1);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1253,1);
         }
         menu();
         addButton(0,"下一步",get_telAdre().telAdreMenu);
      }
      
      public function denyAriansMoveIn() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉阿瑞安，你想花点时间考虑一下。阿瑞安起初看起来有些失望，但还是对你笑了笑。[say:我明白……别有压力……那么，我们今天要做什么？]");
         arianHomeMenu();
      }
      
      public function clearTalisman() : void
      {
         get_player().removeKeyItem("Arian\'s Charged Talisman");
         get_player().createKeyItem("Arian\'s Talisman",0,0,0,0);
      }
      
      public function bargeInOnArian() : void
      {
         clearOutput();
         arianSprite();
         get_images().showImage("arian-fap");
         outputText("你带着一抹促狭的笑意转动门把，发现阿瑞安的房门并没有上锁；你毫不迟疑地推门而入，正好看见一道黏稠的前液甩在阿瑞安纤细的小腹上，而他慌忙试图把自己遮起来。");
         outputText("[pg][say: [name]！等、等等，我可以解释！我发誓我……我……哦，玛莱啊！]他把自己藏进床上的被子里，白色" + (get_noFur() ? "" : "鳞片覆盖") + "的脸庞羞得通红。");
         outputText("[pg]你慢慢走向这只躲起来的蜥蜴，在他的床边坐下。你告诉他，能成为他的欲望对象让你很受宠若惊，而且他没必要把自己藏起来。如果他对你有这种感觉，早该直接说出来。");
         outputText("[pg]阿瑞安从被子底下探出头来。[say: 你、你的意思是，你没有生我的气？]你笑着告诉他没有。阿瑞安明显放松下来，让被子滑落到胸前。");
         if(get_player().isMale())
         {
            outputText("[pg][say: 我只是以为……毕竟我们都是男人……]他一边解释，一边坐立不安。[say: 我不知道你会不会……嗯……会不会介意那种事……]");
            outputText("[pg]你挑了挑眉；看来阿瑞安并不排斥男人和男人之间的事……你要怎么回答他？");
            menu();
            addButton(0,"不介意",youDontMindBeingGayForArian);
            addButton(1,"喜欢女孩",youLikeGirlsNotSickLizardDudes);
         }
         else if(get_player().isGenderless())
         {
            outputText("[pg][say: 我只是以为……毕竟我们都是男的……] 他不安地摆弄着双手。[say: 我不知道你会不会……呃……会不会介意这个……]");
            outputText("[pg]你打断了他，告诉他你其实并不算男性。你脱下内衣，让阿瑞安着迷地注视着你的胯间——那干净、光滑、没有性别特征的胯间。阿瑞安不敢相信自己所见，向前爬来，着迷地伸手触碰你的胯间。[say: 怎么会？你……我……我们不能……] 你用一根手指止住他，告诉他你们俩能做的事多着呢。");
            arianSexMenu(false);
         }
         else if(get_player().isFemale())
         {
            outputText("[pg][say: 只是……呃……你这么漂亮，而我……我没想到你会……] 他没有再说下去。你听得出他语气不太确定，于是把手放在他的肩上，问他怎么了。[say: 我只是不确定……自己够不够好……] 他一边解释，一边局促不安。[say: 说不定你根本不喜欢男人……]");
            outputText("[pg]你对阿瑞安笑了笑；看来他是在担心你的性取向……你要怎么回答他？");
            menu();
            addButton(0,"更喜欢男人",girlsLikeMaleArian);
            addButton(1,"更喜欢女人",girlsLikeFemaleArian);
         }
         else
         {
            outputText("[pg][say: 只是……呃……你这么漂亮，而我……我没想到你会……] 他没有再说下去。");
            outputText("[pg]你告诉他，他看起来很可爱，尤其是他表现得像个没救的处男时。一听到“处男”这个词，阿瑞安缩了一下。你对这个情况感到惊讶，便问他是不是真的还是处男。");
            outputText("[pg]阿瑞安又把脸藏进被子里，低声说，[say: 是的……]");
            outputText("[pg]你把被子从他脸上拉开，说道：[say: 嗯……那我们就得解决一下这个问题了。] 你从他的床上滑下来，开始脱下你的[armor]。阿瑞安也害羞地照做，脱下自己的长袍，直到他全身赤裸地躺在床上。");
            outputText("[pg]然而，当你把[armor]扔到地板上时，阿瑞安睁大了眼睛，意识到你并不完全是女性；他望着你的[cocks]，又看向你双腿间逐渐湿润的小穴，眼中既惊奇又兴奋。");
            outputText("[pg][say: 我……你……我从没……哇……] 你叫了一声阿瑞安的名字，把他从恍惚中唤醒。[say: 对、对不起，我不该一直盯着看，] 他连忙道歉，但你只是被他的反应逗笑了，告诉他不用为这个担心。");
            outputText("[pg][say: 我从没想过你会同时拥有两种……呃……性别，] [Arian ey]紧张地说道。你只是对他笑了笑，问他对此有没有意见。");
            outputText("[pg]阿瑞安立刻脱口而出：[say: 不！当然不！绝对没有！我只是……呃……说实话，我不介意你有额外的……嗯……部位；实际上我觉得那还有点……性感。] 他看着你，脸颊因自己的坦白而羞得通红。[say: 所以……嗯……我的意思是……如果你……我也不介意。] 阿瑞安咽了口唾沫，声音清晰可闻。[say: 如果你想插入我……我是说，如果你不介意我是男性的话……我不是想冒犯你什么的！我只是听说有些像你这样的女孩更喜欢……其他女孩……] 他羞愧地移开了视线。");
            outputText("[pg]你若有所思地摸了摸下巴……");
            menu();
            addButton(0,"喜欢男性",hermsLikeMaleArian);
            addButton(1,"喜欢女性",hermsLikeFemaleArian);
         }
      }
      
      public function askArianToDisenchant() : void
      {
         clearOutput();
         registerTag("shirtStage",TagFun_Impl_.fromInt(get_undergarments().SEA_SHIRT.saveContent.armorStage));
         registerTag("izmaAsked",TagFun_Impl_.fromBool(get_undergarments().SEA_SHIRT.saveContent.izmaAsked));
         outputText("你从你的[inv]里拿出那件带有贵族气质、仿佛属于航海者的衬衫，交给阿瑞安，并开始解释你所知道的一切。[arian Ey]专心地听着，吸收着你的每一句话；你讲述它如何与穿戴者绑定，又如何扭曲他们。[if (izmaAsked) { 伊兹玛曾说，这可能与她的族人在几十年前试图变成鲨鱼时所使用的魔法同出一源。}]");
         outputText("[pg]这名白化蜥蜴人摸索着布料，思索着你给出的所有信息。[say:我对这种魔法一无所知，但我相信，如果我花些时间以它现在的形态研究它，应该能解除它上面的绑定。][arian Ey]叹了口气。[say: 大概需要几天。]");
         menu();
         addButton(0,"动手吧",arianDoIt);
         addButton(1,"算了",arianNevermind).hint("别费事了。");
      }
      
      public function askArianAboutNobleShirt() : void
      {
         clearOutput();
         registerTag("shirtStage",TagFun_Impl_.fromInt(get_undergarments().SEA_SHIRT.saveContent.armorStage));
         outputText("你从一个狂热的狂信徒那里顺走了一件看起来不错的衬衫，而现在它脱不下来了。[if (shirtStage > 2) {更糟的是，它正在变化|毫无疑问，这可不是什么好兆头}]。这个困境似乎让[arian em]慌了神。[say: 这、这可不好，你受伤了吗？]");
         outputText("[pg]不管发生了什么，至少你解释说，你的生命目前还没有受到威胁。这多少缓解了这名蜥蜴人的焦虑，但[arian ey]似乎仍一心绞尽脑汁想办法帮忙。[arian Ey]把一只手放到你胸前，集中精神。");
         outputText("[pg][say: 这不是什么寄生虫，这是魔法。有某种附魔在起作用，但我以前从没见过这样的东西。]阿瑞安叹了口气，又继续思考了好一会儿。[say: 我实在不知道该从哪里下手……但、但是如果你找到任何关于这种魔法的书或卷轴，我会把里面每一个字都读完，并尽我所能帮你！]");
         outputText("[pg]书或卷轴。你会记在心上，但谁又能保证你真能找到这么直接相关的东西呢？");
         get_undergarments().SEA_SHIRT.saveContent.arianAsked = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianVitalityTincture() : void
      {
         arianSprite();
         clearOutput();
         outputText("你在口袋里摸索一阵，掏出一瓶贾科莫兜售的那种奇怪药水，递给这个病恹恹的蜥蜴人，并解释说它能增强[Arian eir]体质，让[Arian em]获得永久的活力。");
         outputText("[pg]阿瑞安感激地对你笑了笑。[say:谢谢你为我做这些，[name]。]");
         outputText("[pg]你告诉[Arian em]这没什么，然后坏笑着补充道，反正那个下流小贩在荒原上又不难找。你看见蜥蜴人脸上的表情，连忙向[Arian em]保证，你确信这药水有效，你只是不信任那个狡猾的商人而已，一点都不信。");
         outputText("[pg][say:既然你这么说……]阿瑞安接过药水，拔开瓶塞。[say:那我喝了。][Arian Ey]一口气把药水灌了下去，喝完后立刻皱起了脸。[say:呃……要不是我知道你不会，我都要以为你在谋杀我的味蕾了。]");
         outputText("[pg]真有那么难喝吗？那药水闻起来隐约像樱桃味，应该不至于像阿瑞安表现得那么糟吧……");
         outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say:这是药……药从来都不好喝。而且里面有樱桃。我讨厌樱桃，]阿瑞安厌恶地说道。");
         outputText("[pg]你向[Arian em]道歉，不过，嘿，药本来就总是难喝嘛。再说了，它现在不是对[Arian em]大有好处吗？");
         outputText("[pg][say:我想我的确感觉好多了。谢谢你，[name]。]阿瑞安对你笑了笑，看起来已经好了一些。");
         outputText("[pg]你微笑着，轻轻抚摸蜥蜴人的[Arian eir]头，告诉[Arian em]不用谢。现在，你觉得[Arian ey]该重新躺下休息了；得给药一点时间起效。你答应会尽量晚些时候再回来看[Arian em]，但现在[Arian ey]需要多休息。阿瑞安点点头，在[Arian eir]床上安顿下来。");
         get_player().consumeItem(get_consumables().VITAL_T);
         arianHealth(10);
         menu();
         addButton(0,"下一步",giveArianAnItem);
      }
      
      public function arianStoryPry() : void
      {
         clearOutput();
         arianSprite();
         outputText("哦，不，你可不会让他这么轻易就糊弄过去。你调皮地轻点了一下[Arian eir]鼻尖，告诉他最好老实交代");
         if(get_player().cor < 40)
         {
            outputText("；这样卸下良心上的负担，[Arian ey]也能睡得更安稳");
         }
         outputText("。");
         outputText("[pg]阿瑞安闭上[Arian eir]眼睛，承认道：[say: 是个很亲近的人！] [Arian ey]脱口而出，随即把自己藏进被子里。");
         outputText("[pg]哎呀，这可就有意思了……不过，不管你怎么试探，他都不肯再多说半个字，也不肯从被子里出来。事情已经很明显了，你也只能叹口气，尽量隔着被子拍拍[Arian eir]脑袋，告诉他你改天再来，并为自己这么多管闲事向他道歉。随后你转身出门，下楼返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianStoryDialogue2() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你打量了一下阿瑞安，说他看起来确实好多了。");
         outputText("[pg][say: 多亏了你。]阿瑞安笑了笑，随后低下头叹了口气。你问他怎么了。");
         outputText("[pg][say: 我最近一直在做一些……呃，让人有点困惑的梦。]阿瑞安解释道。你有些好奇，问他都是什么样的梦；希望不是什么噩梦。");
         outputText("[pg]阿瑞安立刻说道：[say: 不！不是噩梦！只是……我觉得有点不寻常……]");
         outputText("[pg]你疑惑地看着他。[say: 也许我还是告诉你比较好……]");
         outputText("[pg]阿瑞安清了清[Arian eir]嗓子，开始解释：[say: 一开始，我站在某个地方——我不知道是哪儿——但在特尔阿德雷。我独自一人，可我很开心；我在等某个人。我等的人来了之后，我们聊了起来——现在我已经不记得聊了什么。]阿瑞安有些坐立不安。");
         outputText("[pg]你告诉他，如果他真的想听听你的看法，就得努力回想一下之后发生了什么；不过到目前为止，这听起来还不算太奇怪。");
         outputText("[pg][say: 你看，奇怪的地方是……之后发生的事。] 阿瑞安尴尬地脸红了。[say: 我们去了我的房间，然后我……抱歉，我说不出口！] 阿瑞安的脸更红了。");
         outputText("[pg]你很快就明白他一直在做什么样的梦了。你嘴角带着淡淡的微笑，安慰地拍了拍他的肩膀，告诉他做这种梦没什么好担心的。");
         outputText("[pg]阿瑞安看着你，依旧很尴尬。[say: 可我遇见的那个人……我不知道这样合不合适……也许是腐化开始影响我了？]");
         outputText("[pg]你问他为什么会这么觉得——[Arian eir]梦里的情人到底有什么不对？……[Arian ey]是在担心对方是个男孩吗？还是个有鸡巴的女孩？");
         outputText("[pg]阿瑞安咽了口唾沫，声音清晰可闻。[say: 不，不是这个问题……我是说……也许……只是……就当我没说吧……我有点累了……我们改天再聊，可以吗？]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         menu();
         addButton(0,"算了",arianStory2DropIt);
         addButton(1,"追问",arianStoryPry);
      }
      
      public function arianStoryDialogue1() : void
      {
         arianHealth(1);
         clearOutput();
         arianSprite();
         outputText("你想多了解一些阿瑞安，于是问[Arian eir]是否介意跟你讲讲[Arian eir]的过去。毕竟，作为一个至少从恶魔战争早期就活下来的幸存者，而且还是个巫师，[Arian eir]那宽大的袖子里肯定藏着不少故事。");
         outputText("[pg]阿瑞安点点头。[say: 总是只有我听你的故事，好像确实不太公平……不过在开始之前……你觉得这场恶魔之祸是多久以前开始的？]");
         outputText("[pg]你耸了耸肩；");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) >= 1)
         {
            outputText("玛莱亲口告诉过你，他们大概是在，多少来着，20到30年前出现的？");
         }
         else
         {
            outputText("你猜应该是很久以前了，毕竟看他们似乎把这个世界搞得一团糟。");
         }
         outputText("[pg]阿瑞安点点头。[say: 猜得不错……那你觉得我看起来多大？]");
         outputText("[pg]你上下打量着这位爬行动物巫师，思索了一会儿。然后你坦言自己其实不太熟悉浑身长满鳞片的人，不过你猜[Arian eir]大概二十五六岁？");
         outputText("[pg]阿瑞安点点头，笑了笑。[say: 我其实二十三岁……所以关于这整场麻烦究竟是怎么开始的，我也没法告诉你太多。那时候我还只是个孩子……而且我父母也确实把我保护得远离了这一切……]阿瑞安望向远处。[say: 被保护着……我想这个词很适合形容我。我人生中的大部分时间，都被隔绝在这个世界之外。]");
         outputText("[pg]你问他为什么；究竟是什么让[Arian eir]父母把他和外面的世界隔绝开来？");
         outputText("[pg]阿瑞安回头看向你。[say: 嗯，外面的世界一团糟，所以他们觉得最好让我一直待在学院里；他们给我讲过那些年幼蜥蜴人走到外面后，被恶魔拖走、拿去参加可怕仪式的故事。我想他们也不算完全说错，但对一个孩子说这种话真的太残忍了。不过，到头来，他们也只是想保护我。而且以我的好奇心……唉，还是别纠结这个了。]阿瑞安清了清[Arian eir]嗓子。[say: 总之，从我记事起，我就一直待在学院里。我跟你说过我以前整天埋在书堆里的事，对吧？]");
         outputText("[pg]你点点头，承认他的确跟你说过。");
         outputText("[pg][say: 嗯，我没告诉你的是，那时候书本也是我唯一在乎的东西。]");
         outputText("[pg]你说，既然他自己都承认是个书虫，那他现在却这么迫切地想出去活动[Arian eir]筋骨，听起来确实有点奇怪。阿瑞安听了笑起来。[say: 是啊，变化挺大的，不是吗？]随后，他叹了口气说道，[say: 其实还挺讽刺的。因为我不能出去，所以我拥有的只有书；而那些书也就成了我的世界：我阅读它们，喜爱它们，生活在它们之中，并掌握它们。把那么多时间都花在阅读上之后，成为巫师就成了一条相当轻松的路。我一到年龄，就正式加入了学院；在测试期间，我展现出的能力超过了我的考官，至少也与他们相当。最后，他们认为没有必要再指导我，于是宣布我已是这门技艺的大师，并把我的学生分配给了我：莱卡和布恩。]");
         outputText("[pg]他喜欢有[Arian eir]自己的学生可以教吗？");
         outputText("[pg]回忆起往事，阿瑞安眼睛一亮。[say: 喜欢？我简直爱死了！他们两个……后来远远不只是学生；他们成了我的朋友。我甚至可以说，他们是我家人的一部分。我从小就是一个人长大，被长辈们忽视——他们总是忙着下一个研究项目，根本没空注意我——陪我解闷的也只有书。你能想象我那时候有几个朋友吗？]");
         outputText("[pg]你不得不承认，他描述的处境听起来相当孤独。");
         outputText("[pg][say: 所以你应该能想象，当我不但得到一个、而是两个必须认真听我每一道指示的人时，我有多激动。]阿瑞安低下头，[Arian eir]脸上带着一丝悔意。[say: 一开始我挺刻薄的。我最后把自己的怨气发泄到了他们身上，不过幸好他们愿意原谅我。从那以后，我们就一直很亲近。]阿瑞安笑了笑。");
         outputText("[pg]你告诉他，很高兴听到他们真正熟络起来了；这就是为什么阿瑞安在[Arian eir]学院遭到袭击时，特别注意确保他们逃出去吗？");
         outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say: 不完全是。我的本意是击败所有入侵的恶魔；我太傲慢了，也为此付出了惨重代价。布恩和莱卡能活下来，只是因为那阵黑魔法浪潮袭来时，他们离我最近。我耗费了大量力量和心神，才抵抗住那股浪潮的影响……那太残酷了。]");
         outputText("[pg]这和他现在如此虚弱有关吗——也就是为了保护自己和[Arian eir]学徒，抵挡恶魔的黑魔法所承受的压力？");
         outputText("[pg][say: 是的，确实有关。我现在不打算细讲，但我的施法方式会对施法者的身体造成损伤，这就是我现在落到这种悲惨状态的原因。]阿瑞安叹了口气。[say: 现在我甚至连出去散个步都做不到……]");
         outputText("[pg]你伸出手，拍了拍他的肩膀；你其实不觉得这能让他好受多少，但以前在你村里，人们遇到这种情况时总会这么做。你拍着[Arian eir]肩膀时，意识到他还没告诉你，究竟是什么让[Arian eir]态度发生了这么大的转变。于是你一边继续安慰似的轻拍他，一边问他，既然以前是个不爱社交、整天宅在屋里的书虫，那现在卧病在床为什么会让他这么难受。");
         outputText("[pg][say: 啊，对。我扯远了，抱歉。]阿瑞安冲你咧嘴一笑，说道，[say: 我逃出了学院。]你挠了挠后颈；这算不上什么解释。注意到你脸上的困惑后，阿瑞安解释道，[say: 学院里没有窗户。说是为了保护我们的隐私，并确保不会有外界因素干扰我们的学习。现在这些都不重要了。所以，在我带着布恩和莱卡逃出学院以前，我甚至从未仰望过天空。]");
         outputText("[pg]你惊讶地眨了眨眼；他居然连天空都没见过？他们怎么能把人拘束到这种地步？什么——难道他是在室内孵出来的，然后就再也不准出门？");
         outputText("[pg]阿瑞安叹了口气。[say: 嗯，我确实跟你说过，我父母一直把我关在学院里。]他又叹了一声。[say: 我从来不知道世界有这么大，也这么美。我错过了太多东西。我想出去，想多看看这个世界。不管好的还是坏的。]阿瑞安低下头。[say: 但事实是，我不能，至少现在这样不行。]他懊恼地叹了口气。");
         outputText("[pg]你试着让这个沮丧的蜥蜴人振作起来，鼓励他凡事要乐观一点；毕竟，在那些稀奇古怪的药水和滋补剂里，肯定有什么东西能让喝下去的人变得更健康、更强壮吧？");
         outputText("[pg]阿瑞安叹了口气。[say: 我已经试过很多了。布恩和莱卡几乎跑遍了整个特尔阿德雷，想找点能让我好起来的东西，可好像什么都没用……]");
         outputText("[pg]你继续追问他，问他真的完全不知道、也没听说过任何可能有帮助的东西吗。");
         outputText("[pg]阿瑞安皱起[Arian eir]眉头，陷入沉思。[say: 我想……我好像确实听说过一种东西。什么……活力……我现在想不起它的名字了。应该是某种补剂或者茶，据说能让人变得更结实、更强壮。]");
         outputText("[pg]好，那就这么定了。你告诉阿瑞安，你会帮他，但他必须答应乖乖待在床上；要是他还像你们第一次见面时那样总往外跑，他永远都好不了。");
         outputText("[pg]阿瑞安叹了口气。[say: 我知道我不该出去，可有时候一直闷在这里，我真的觉得自己快疯了。我在学院里已经待了太久了。而且，你根本没有义务帮我。我连那种药上哪儿找都不知道，怎么能麻烦你去替我找呢。]");
         outputText("[pg]你告诉他，你明白那种感觉一定很难受。不过，总是到处乱跑显然对他没有任何好处。再说，这根本不麻烦；你就是想帮他。嗯……要不这样，你答应时不时过来看看他，给他讲讲你在荒原上的经历，让他通过你的行动间接感受外面的生活？这样能不能鼓励他好好待在床上，别把自己累过头？");
         outputText("[pg]阿瑞安听了你的提议，露出微笑。[say: 嗯，那肯定会有帮助。我喜欢有你作伴；你身上有种……嗯……我想你能让我放松下来，而且听听外面的世界也不坏。只是我真的很想亲眼看看。]");
         outputText("[pg]他会看到的，但前提是他听你的话，真正给自己一个恢复的机会！你坚持要他先放松下来；也许正是这种紧张，再加上他因为无聊而不断折腾自己，才让他一直没能真正好转。");
         outputText("[pg][say: 也许你说得对。好吧，那我相信你，[name]。我已经被困在学院里很多年了……我想只要你来看我，我应该还能再撑几个星期。]他伸出[Arian eir]手。[say: 成交？]");
         outputText("[pg]你用力握住他的手，郑重宣布成交。阿瑞安朝你笑了笑，随后张开[Arian eir]嘴，打了个大大的哈欠。[say: 抱歉，[name]。我想我有点困了……]");
         outputText("[pg]你笑了笑，告诉他没关系，他需要[Arian eir]睡眠，所以最好上床休息。阿瑞安点点头，钻进被窝。[say: 谢谢你，[name]。]你向他道了晚安，轻轻关上[Arian eir]门。离开时，你告诉布恩和莱卡阿瑞安已经睡着了，然后返回营地。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianStory2DropIt() : void
      {
         clearOutput();
         arianSprite();
         outputText("虽然你确实有点好奇，但你还是决定不再让他难堪，告诉他没关系，你现在就让他好好睡一觉。");
         outputText("[pg][say: 谢谢你，[name]。那我们之后再见。] 阿瑞安把自己裹进被子里。你一直看着他安顿好，然后才踏上回程，返回你在玛瑞斯荒野中的临时住处。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianSprite() : void
      {
         spriteSelect(get_noFur() ? (arianMale() ? SpriteDb.get_s_arianNofur() : SpriteDb.get_s_arianFemaleNofur()) : (arianMale() ? SpriteDb.get_s_arian() : SpriteDb.get_s_arianFemale()));
      }
      
      public function arianSpellPlace(param1:String) : void
      {
         arianSprite();
         clearOutput();
         outputText("你告诉阿瑞安，你想让[Arian em]把" + param1 + "放进你的护符里。");
         outputText("[pg][say: 好的。请把材料交给我，我马上就能把它灌注进去。] [Arian Ey]对你笑了笑。你在自己的随身物品里翻找一阵，凑齐所需的东西，递给了这名蜥蜴人。");
         outputText("[pg]阿瑞安急切地接过你递来的材料，走到[Arian eir]工作桌前。[Arian Ey]拿起旁边的一只碗，往里面倒满水，然后四下看了看。[say: 嗯……我好像忘了什么……哦，对了！[name]，我还得请你把护符也交给我。] [Arian Ey]向你伸出一只手。");
         outputText("[pg]你忍不住说了一句，自己早就料到[Arian em]会这么说，然后从脖子上摘下护符，递给这位爬虫类巫师。");
         outputText("[pg][say: 呃……好。现在我得集中精神了。] [Arian Ey]把你的护符放进碗里，让它浸入水中，然后闭上[Arian eir]眼睛，开始凝聚[Arian eir]魔力。不一会儿，你献上的那些材料突然燃烧起来，直到只剩下灰烬；灰烬飘进碗中，与里面的水混合在一起。");
         outputText("[pg]碗中传来一阵柔和的嗡鸣，水也开始发光。没过多久，嗡鸣声便渐渐消散；阿瑞安把手伸进碗里，取出你的护符举给你看。[say: 给你，[name]。]");
         outputText("[pg]你向[Arian em]道谢，接过护符，感受了片刻其中脉动的能量，随后又把它戴回脖子上。你感谢阿瑞安的帮助，并向[Arian em]保证，这一定会在你穿行这片土地时派上用场。");
         outputText("[pg](<b>你的护符已被灌注了" + param1 + "。你可以在战斗中的“魔法特攻”菜单里使用它。</b>)[pg]");
         var _loc2_:int = 0;
         var _loc3_:String = param1;
         if(_loc3_ == "驱散法术")
         {
            _loc2_ = 1;
            get_player().consumeItem(get_consumables().W__BOOK,2);
            get_player().consumeItem(get_consumables().B__BOOK,2);
         }
         else if(_loc3_ == "治疗法术")
         {
            _loc2_ = 2;
            get_player().consumeItem(get_consumables().SLIMYCL,2);
            get_player().consumeItem(get_consumables().VITAL_T,2);
         }
         else if(_loc3_ == "焚烧法术")
         {
            _loc2_ = 3;
            get_player().consumeItem(get_consumables().GOB_ALE,2);
            get_player().consumeItem(get_consumables().S_GOSSR);
         }
         else if(_loc3_ == "减欲法术")
         {
            _loc2_ = 4;
            get_player().consumeItem(get_consumables().L_DRAFT,2);
            get_player().consumeItem(get_consumables().F_DRAFT);
         }
         else if(_loc3_ == "护盾法术")
         {
            _loc2_ = 5;
            get_player().consumeItem(get_useables().B_CHITN,2);
            get_player().consumeItem(get_useables().T_SSILK);
         }
         if(get_player().hasKeyItem("Arian\'s Charged Talisman"))
         {
            get_player().removeKeyItem("Arian\'s Charged Talisman");
            get_player().createKeyItem("Arian\'s Charged Talisman",_loc2_,0,0,0);
         }
         else if(get_player().hasKeyItem("Arian\'s Talisman"))
         {
            get_player().removeKeyItem("Arian\'s Talisman");
            get_player().createKeyItem("Arian\'s Charged Talisman",_loc2_,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianSexingTalk() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你心照不宣地朝[Arian em]坏笑，问[Arian ey]既然已经有过[Arian eir]的第一次，现在对性爱有什么感觉？");
         outputText("[pg]阿瑞安尴尬地咬住[Arian eir]的下唇。[say: 我……呃……我们不能聊点别的吗？]你摇摇头，告诉[Arian em]这没什么好羞耻的。毕竟你们已经有过亲密接触；而且你也想了解[Arian eir]的性癖和愿望。");
         outputText("[pg]阿瑞安脸红了，深吸一口气。[say: 好吧……]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) != 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
            {
               outputText("[pg][say: 我一直都很介意自己没有第二根鸡巴，]阿瑞安承认道。");
               outputText("[pg]真的？");
               outputText("[pg][say: 嗯，像我这样的蜥蜴人通常都有两根，而我只有一根……我一直觉得自己很怪，所以通常都会避开任何形式的性接触——当然，要避开也不难，毕竟我平时总是把" + (get_noFur() ? "脸" : "口鼻") + "埋在书里。也许我不太合群也是因为这个……或者……我也不知道。重点是，我从来没指望过能找到一个会……你懂的……] 阿瑞安坐立不安，朝你露出紧张的笑容。");
               outputText("[pg]你也对[Arian em]回以微笑。你正觉得阿瑞安很可爱，尤其是[Arian ey]像这样害羞的时候。不过，如果[Arian eir]少了一根配套的阴茎真是个大问题，也许你可以在旅途中找到什么东西，帮[Arian em]弥补这一点。[Arian ey]会喜欢那样吗？");
               outputText("[pg][say: 哦……我想也许真有什么东西能做到吧。不过我觉得现在也没那么重要了。除非你想让我再长一根？]");
               outputText("[pg]你琢磨了一下这个想法，但还是觉得阿瑞安现在这样就很好；不过也许以后某天可以再说……");
            }
            else
            {
               outputText("[pg][say: 我以前一直很介意自己没有第二根阴茎，] 阿瑞安承认道。[say: 但我想，多亏了你，我以后不用再为这个烦恼了。] 阿瑞安对你笑了笑。");
               outputText("[pg]你告诉[Arian em]这没什么麻烦的；双倍的快感，双倍的乐趣，对吧？");
               outputText("[pg]阿瑞安脸红了。[say: 大概吧……]");
               outputText("[pg]不过……这也意味着，如果[Arian ey]打算自慰，就得多花一倍功夫。[say: 呃……你为什么要这么说？] 阿瑞安紧张地问道。");
               outputText("[pg]你轻笑一声，告诉[Arian em]你可没忘记上次撞见[Arian em]自慰的事。");
               outputText("[pg]阿瑞安紧张地笑了起来。");
            }
            outputText("[pg]不过[Arian eir]的尺寸呢？在这个世界里，如果尺寸是个问题，要改变它其实相当容易。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 1)
            {
               outputText("[pg][say: 嗯，我个人倒是没什么不满。不管我们做什么，我都感觉很好。就算你不碰我那里也是。不过如果你想让我变得更大，或者想让我把它去掉……我都没有意见。]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 2)
            {
               outputText("[pg][say: 它已经比我曾经期望的要大得多了。有时候会有点撑……我是说，在我的小穴里……但我还挺喜欢的，而且这也意味着如果我们……我是说……如果你想的话……你也会感觉更舒服。不是说我介意，我只要能和你在一起就很开心。如果你想用什么办法改变它……我也不会介意。]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 3)
            {
               outputText("[pg][say: 老实说，它大得让我不太自在。但你说你喜欢，所以我就留着了。] 你看见[Arian eir]的长袍开始被顶起来，忍不住逗弄起这个害羞的蜥蜴人。看来尽管[Arian eir]嘴上抱怨，[Arian ey]其实很享受两腿之间夹着这么个怪物……一个[Arian ey]根本没法藏住的怪物。");
               outputText("[pg]阿瑞安脸红了。[say: 我……好吧，我承认……感觉确实挺舒服的……而且也有点变态的刺激……不过，如果你觉得我该变小一点……我也不介意。]");
            }
            outputText("[pg]你告诉阿瑞安，你会考虑的……");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            outputText("[pg]阿瑞安叹了口气，脸颊泛红；一股明显属于发情雌性的气味开始弥漫在房间里。那气味，再加上这个蜥蜴人可爱的坐立不安，已经把[Arian eir]现在的状态暴露无遗。");
            outputText("[pg]阿瑞安叹了口气，舔了舔[Arian eir]的嘴唇。[say: 我从没想过自己有一天会变成女孩……更别说亲身体会当女孩是什么感觉了……一切都变得不一样了……但也不是坏事……只是有点奇怪，我想。]");
            outputText("[pg]你告诉[Arian em]这很正常，然后问[Arian ey]对此感觉如何。");
            outputText("[pg][say: 我总是莫名其妙地不舒服。还会有一些以前从没有过的奇怪冲动。胸口也觉得沉甸甸的。最重要的是……] 阿瑞安看着你，脸红了起来。");
            outputText("[pg]最重要的是什么？你问道。");
            outputText("[pg]阿瑞安移开[Arian eir]视线。[say: 只要靠近你，我就会变得……很热……]");
            outputText("[pg]真——的？你对[Arian em]坏笑。阿瑞安的脸更红了。[say: 还、还有那些蛋……好多蛋……]");
            outputText("[pg]蛋？");
            outputText("[pg][say: 对，蛋。蜥蜴人女性在整个受孕期都会产卵……我……每个月都得应付这个……而且每次快要产卵的时候，我总会忍不住去想……]");
            outputText("[pg]想什么？");
            outputText("[pg][say: 想你。] 阿瑞安承认道。");
            outputText("[pg]既然这样，也许你该找个时候帮[Arian em]产卵。");
            outputText("[pg][say: 我想，我会喜欢的……找个时候吧，] 阿瑞安回答。");
            if(arianFollower())
            {
               outputText("[pg]你告诉[Arian em]，等[Arian ey]快要产卵的时候，你一定会过来看看。[pg][say: 我会等你的。] 阿瑞安微笑道。");
            }
            else
            {
               outputText("[pg]虽然你很想那么做，但要是布恩和莱卡，尤其是莱卡，看到你拿着一枚蛋从[Arian eir]房间里出来，肯定会狠狠数落你一顿。[pg]阿瑞安咯咯一笑，[say: 那倒是真的。也许到时候我们可以想办法单独相处？][pg]也许吧……");
            }
         }
         outputText("[pg]你打量着阿瑞安，决定问问[Arian eir]更喜欢哪种做爱方式。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 33)
         {
            outputText("[pg]阿瑞安若有所思地摸了摸[Arian eir]下巴，但最后[Arian ey]只是耸耸肩，说道：[say: 我想我其实没什么特别偏好的……所以你想怎么做都可以。] 阿瑞安对你笑了笑。");
            outputText("[pg]也许[Arian ey]还不确定，只是因为你还没和[Arian em]玩得够多……或许你该多试试一些……事情？");
            outputText("[pg]阿瑞安紧张地对你笑了笑，然后慢慢点头表示同意。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) < 66)
         {
            outputText("[pg]阿瑞安若有所思地摸了摸[Arian eir]下巴。[say: 说实话……自从你……呃……把它放进后面之后……] 阿瑞安脸红了。[say: 我就一直在想，后面其实也没那么糟……一开始我很怕会疼……虽然确实有点疼，但也很舒服。]");
            outputText("[pg]你听了有些惊讶。并不是每个人都会喜欢肛交。");
            outputText("[pg]阿瑞安移开[Arian eir]视线。[say: 我不是说我喜欢……但如果是你的话，我不介意……]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) <= 100)
         {
            outputText("[pg]阿瑞安脸红了。[say: 我……我喜欢你用我的屁股……感觉真的很舒服，] 阿瑞安承认道。");
            outputText("[pg]哦，真的吗？你问。能找到一个真正喜欢肛交的人已经很少见了，更别说还愿意大方承认的人。这可完全不像是那个害羞的蜥蜴人会说出来的话。");
            outputText("[pg]阿瑞安咬着[Arian eir]下唇，紧张地朝你笑了笑。[say: 我想……喜欢这种事，是不是说明我是个变态？]");
            outputText("[pg]你轻笑一声。也许吧……不过考虑到你在这个世界里见过的种种，你还真很难说清到底什么标准才算变态。但那并不重要；你也很喜欢用[Arian eir]的屁股。阿瑞安对你露出笑容。");
         }
         else
         {
            outputText("[pg]阿瑞安红着脸移开[Arian eir]视线。[say: 我总是忍不住想起你用我屁股的时候……真的很舒服……如果非要说我喜欢什么的话……那就是这个……我也希望你觉得舒服。] 阿瑞安紧张地对你笑了笑。");
            outputText("[pg]这……[Arian em]还真是相当直白……你没想到[Arian em]会这样坦白。但你喜欢这样；[Arian eir]的屁股确实很舒服，而且你也很高兴这让阿瑞安感到快乐，还这么喜欢。");
            outputText("[pg]阿瑞安瞥了一眼你的胯下。");
            if(get_player().hasCock())
            {
               outputText("[pg][Arian Ey]紧张地朝你笑了笑，开始坐立不安。[say: 或许……你愿意……那个……再用我一次吗？求你了？] 阿瑞安满怀期待地问道。");
               menu();
               addButton(0,"是",yesYouButtslutIllFuckYou);
               addButton(1,"否",goddamnitNoYouButtSlut);
               return;
            }
            outputText("[pg]但当[Arian ey]没看到任何隆起时，[Arian ey]失望地叹了口气。[say: 也许……你可以让你的鸡巴再长回来，然后……算了……] 阿瑞安移开[Arian eir]视线。");
            outputText("[pg]你告诉[Arian em]你会考虑的。");
         }
         sexTalkFinish();
      }
      
      public function arianSexMenu(param1:Boolean = true) : void
      {
         arianSprite();
         if(param1)
         {
            clearOutput();
            outputText("你问阿瑞安，[Arian ey]现在有没有足够的精力来做点爱。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 30)
            {
               outputText("[pg]阿瑞安有些紧张地对你笑了笑。[say: 我……当然。我很愿意。你想做什么？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 50)
            {
               outputText("[pg]阿瑞安紧张地笑了笑，移开[Arian eir]目光。[say: 当然。我想更多地了解你：你的身体、你的想法，还有你的一切。所以……你想做什么？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 75)
            {
               outputText("[pg]阿瑞安笑了笑，移开[Arian eir]目光。[say: 我很愿意。这不只是为了感谢我的礼物吧？]");
               outputText("[pg]你向[Arian em]保证不是那样；你只是刚好来了兴致。");
               outputText("[pg]阿瑞安高兴地看着你。[say: 好……你想做什么？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 100)
            {
               outputText("[pg]阿瑞安温柔地对你微笑。[say: 做爱的话，我总是有力气的，[name]。你想做什么？]");
            }
            else
            {
               outputText("[pg]阿瑞安微笑着抚摸你的[face]。[say: 这还用问吗？]");
            }
            outputText("[pg]你朝你的蜥蜴人爱人笑了笑，开始脱下[armor]。阿瑞安也照做，在[Arian eir]的床上安顿下来，入迷地看着你；[Arian ey]正等待你的决定。等你一丝不挂时，那个蜥蜴人显然高兴极了；你对[Arian em]笑了笑，考虑起自己的选择……");
         }
         menu();
         addButtonDisabled(0,"肛交插入","此场景需要你有一根尺寸合适的阴茎。");
         addButtonDisabled(1,"肛交承受","此场景需要阿瑞安有阴茎。");
         addButtonDisabled(2,"被口交","此场景需要你有阴茎。");
         addButtonDisabled(3,"给" + arianMF("他","她") + "口交","此场景需要阿瑞安有阴茎。");
         addButtonDisabled(4,"插入小穴","此场景需要你有一根尺寸合适的阴茎，且阿瑞安需要有小穴。");
         addButtonDisabled(5,"被插入","此场景需要阿瑞安有阴茎。");
         addButtonDisabled(6,"假阳具玩法","此场景需要你和阿瑞安都有小穴，且你需要有一根假阳具。");
         addButtonDisabled(7,"套茎","此场景需要你有一根尺寸合适的阴茎，且阿瑞安的阴茎不能太大。");
         addButtonDisabled(8,"双重插入","此场景需要你有两根尺寸合适的阴茎，且阿瑞安需要有小穴。");
         addButtonDisabled(9,"舔阴","此场景需要你和阿瑞安都有小穴。");
         addButtonDisabled(10,"坐脸","此场景需要你和阿瑞安都有小穴。");
         addButtonDisabled(11,"骑尾巴","此场景需要你和阿瑞安都有小穴。");
         if(get_silly())
         {
            addButtonDisabled(12,"摸头","此场景需要你和阿瑞安都有小穴。");
         }
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(50))
            {
               addButton(0,"肛交插入",giveArianAnal);
            }
            addButton(2,"被口交",getBlownByArian);
            if(get_player().hasCockThatFits(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,937)) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               addButton(4,"插入小穴",penetrateArian);
            }
            if(get_player().hasCockThatFits(50) && get_player().cockThatFits2(50) >= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               addButton(8,"双重插入",doublePenetrateArian);
            }
            if(get_player().smallestCockArea() <= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) < 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               addButton(7,"对接",arianDocking);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            addButton(1,"肛门接招",getButtWreckedByArian);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            addButton(3,"给" + arianMF("他","她") + "口交",suckAriansDick);
         }
         if(get_player().hasVagina())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               addButton(5,"挨操",getPenetratedByArianAndHisHitlerMustache);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
            {
               addButton(9,"舔阴",arianCunnilingus);
               addButton(10,"坐脸",arianFacesitting);
               addButton(11,"骑尾巴",arianFemaleTailriding);
               if(get_player().hasKeyItem("Dildo") || get_player().hasKeyItem("Deluxe Dildo"))
               {
                  addButton(6,"假阳具玩乐",arianDildoFun);
               }
               if(get_silly())
               {
                  addButton(12,"摸头",arianHeadpats);
               }
            }
         }
         addButton(14,"返回",arianHomeMenu);
      }
      
      public function arianPlot5() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你还没来得及说什么，阿瑞安就拦住了你。[say: 我一直想问你一件事，[name]。最近我感觉好多了；说真的，我可能比以前状态还好。]阿瑞安脸红了。");
         outputText("[pg][say: 我想问问你，我们能不能……嗯……住在一起？]阿瑞安咬住[Arian eir]下唇。");
         outputText("[pg]你向阿瑞安解释了传送门的事，以及你身为勇者的使命——因为你的职责所在，你不能就这样搬到这里来和[Arian em]一起生活。");
         outputText("[pg]阿瑞安连忙补充道：[saystart]哦……不……不是让你搬到这里来。是我搬去和你一起住……");
         if(get_camp().companionsCount() > 1)
         {
            outputText("已经有其他人和你住在一起了，所以再多我一个也没关系吧？对吧？");
         }
         outputText("[sayend]");
         outputText("[pg]你思索着[Arian eir]请求……一方面，有个懂魔法的人同行会对你的任务大有帮助，而且你也已经开始喜欢和阿瑞安相处了；但布恩和莱卡怎么办？");
         outputText("[pg][say: 我已经和他们谈过了，我相信他们已经准备好独自继续自己的魔法学习了。他们照顾我很久了；我觉得是时候让他们为自己而活了。再说，我们也不会永远分开；我会时不时回来看看的。]阿瑞安满怀希望地对你笑了笑。");
         outputText("[pg]嗯……既然[Arian ey]都这么说了……你该怎么办？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         menu();
         addButton(0,"接受",acceptArianMovingIntoCamp);
         addButton(1,"拒绝",denyAriansMoveIn);
      }
      
      public function arianPlot4() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你还没来得及说什么，阿瑞安就说道：[say: 哦，我有个好消息，[name]！]");
         outputText("[pg]好消息？是什么？");
         outputText("[pg][say: 我感觉已经好到可以把我的魔力引导进你体内了。如果你觉得自己快被这个世界的腐化压垮，我应该能帮上你的忙。不过这种治疗的强度太高，我想一天最多只能做一次……]");
         outputText("[pg]你告诉[Arian em]，就算每24小时只能用一次，那也会是个非常有用的手段，并感谢[Arian em]愿意为了你作出这样的牺牲。");
         outputText("[pg]阿瑞安对你露出灿烂的笑容。[say: 没关系。我愿意为你做任何事。][Arian Ey]静静凝视着你的眼睛……也许凝视得有点太久了……你清了清嗓子，阿瑞安这才像是从恍惚中回过神来。[say: 哦！呃……你有什么想做的吗？][Arian Ey]有些坐立不安。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         arianHomeMenu();
      }
      
      public function arianNevermind() : void
      {
         outputText("[pg]这个提议你记下了，但你暂时还不打算让[arian em]来处理。也许，还有别人更懂这方面的事。[say: 我明白。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianMale() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) <= 0)
         {
            return false;
         }
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0 ? 0 : 1;
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) <= _loc1_;
      }
      
      public function arianMagicLessons() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你问阿瑞安，[Arian ey]是否愿意给你上几堂魔法课。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,946) >= 4)
         {
            outputText("[pg]阿瑞安抬起[Arian eir]手，让你停下话头。[say:我很欣赏你的热情，[name]。但你必须先休息一下，让今天的课程好好沉淀。我保证明天会教你更多。]阿瑞安对你微笑。");
            outputText("[pg]也许[Arian ey]是对的……你告诉[Arian em]，明天会再请[Arian em]教你更多，然后便告辞离开。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg]阿瑞安点点头。[say:当然！那么，我该从哪里讲起呢……]");
         if(get_player().get_inte100() < 25)
         {
            outputText("[pg]你告诉阿瑞安，其实你对魔法总体上还很陌生，所以也许[Arian ey]可以教你一些基础？阿瑞安点点头。[say:很好……]阿瑞安清了清[Arian eir]嗓子。");
            outputText("[pg][say:所有魔法的基础都是精神力量，或者更准确地说，是你的意志力——那种让不存在之物……成为现实的渴望、愿望与激情。这也正是法师们一开始就必须如此刻苦学习的原因。]");
            outputText("[pg]你仔细聆听阿瑞安说的每一句话，在心里记下那些更重要的课程内容……");
            outputText("[pg][say:以上就是全部；有什么问题吗？]阿瑞安耐心等待你的回答。经过一堂漫长的魔法基础与施法原理课，你已经有些疲惫，叹了口气。你告诉阿瑞安，你暂时没有问题……不过以后想找个时间再复习一遍这堂课。");
            outputText("[pg]阿瑞安对你微笑。[say:当然，[name]。如果你有任何疑问，或者想让我再讲一遍，只要开口就好。我会确保自己总有时间陪你。]");
            outputText("[pg]你感谢这位蜥蜴人的课程，然后");
            if(!arianFollower())
            {
               outputText("动身返回你的营地。");
            }
            else
            {
               outputText("回去继续忙自己的事。");
            }
         }
         else if(get_player().get_inte100() < 50)
         {
            outputText("[pg]你告诉阿瑞安，你已经掌握了基础知识，所以不如讲点更进阶的内容？");
            outputText("[pg]阿瑞安若有所思地轻敲[Arian eir]的下巴，然后笑了起来。[say: 我知道了！我们来聊聊导流吧。]");
            outputText("[pg]导流？你问道。");
            outputText("[pg][say: 没错，就是将你的法术集中到一个媒介中的技艺——简单来说，就是给物品附魔。]");
            outputText("[pg]你笑着告诉阿瑞安，这听起来是个很有意思的课题……");
            outputText("[pg][say: 所以记住：不要让你的媒介过载，否则后果可能会很可怕……问问布恩就知道了，]阿瑞安轻笑道。");
            outputText("[pg]你不禁好奇，到底发生过什么事，能让[Arian em]觉得这么好笑。不过眼下这堂课让你有些疲惫，于是你感谢阿瑞安的教导，并向[Arian em]告辞");
            if(!arianFollower())
            {
               outputText("，然后返回营地。");
            }
            else
            {
               outputText("，走出[Arian eir]的帐篷，继续忙自己的事。");
            }
            if(!get_player().hasStatusEffect(StatusEffects.KnowsCharge))
            {
               outputText("[pg]当你[walk]离开时，你开始琢磨阿瑞安今天的课程。你想，或许可以把导流原理运用到战斗中，用来强化你的[weapon]。");
               outputText("[pg]那会很有用；你得找机会试试看。");
               get_player().createStatusEffect(StatusEffects.KnowsCharge,0,0,0,0);
            }
         }
         else if(get_player().get_inte100() < 75)
         {
            outputText("[pg]你说自己现在已经相当了解魔法的运作方式了，所以希望[Arian em]开始讲解更复杂的理论。");
            outputText("[pg]阿瑞安若有所思地摩挲着[Arian eir]的下巴。[say: 嗯……啊哈！我们来讨论具现术吧。从这里开始，我们就要接触更复杂的理论和方法了。我知道不用我多说，但还是请你认真听。具现术对任何法师来说都是一门重要技艺。]");
            outputText("[pg]你点点头，阿瑞安随即开始为你讲解具现术这门技艺中的精细要点。");
            outputText("[pg]阿瑞安没有夸张；这确实是个相当复杂的课题……");
            outputText("[pg][say: 现在，为了结束这堂课，我会给你一个实际例子，说明如何有效地运用具现术来保护自己。所以注意听，[name]。具现出来的物体通常比真实物体要脆弱，因此具现一面盾牌、一套盔甲，甚至一件武器都不是什么好选择。更别说那还相当复杂。一套盔甲不仅由金属构成，还有其他部件——你得把每一部分都单独具现出来并维持住。与其如此，不如具现一种简单的元素，让战局朝对你有利的方向扭转。]");
            if(!get_player().hasStatusEffect(StatusEffects.KnowsBlind))
            {
               outputText("[pg]比如什么？你有些好奇地问。");
               outputText("[pg]阿瑞安举起一只握紧的拳头。[say: 小心你的眼睛。]你点点头。阿瑞安将[Arian eir]的拳头对准附近的一面墙，然后张开[Arian eir]的手。一道明亮的闪光从[Arian eir]手中射出，落在墙上，没有造成任何伤害。[say: 这就是光元素。我制造出了一道强光，能暂时致盲任何恰好在它显现时看向它的人。]");
               outputText("[pg]你意识到这样的法术在战斗中会很有用。阿瑞安对你咧嘴一笑。[say: 我很高兴这堂课对你有帮助，[name]。过来吧，我教你如何正确具现它。]");
               outputText("[pg]你花了几分钟学习如何正确使用这个法术，经过一番练习后，你已经可以在需要时稳定地施展它。你感谢阿瑞安的授课，也感谢[Arian em]教会你一个新法术。随后你向这位咧嘴笑着的蜥蜴人告别，离开了，并承诺很快会再来看望[Arian em]。");
               get_player().createStatusEffect(StatusEffects.KnowsBlind,0,0,0,0);
            }
            else
            {
               outputText("[pg]你明白阿瑞安在说什么了。[Arian Ey]的意思是，比起具现一道屏障，最好是具现出类似强光的东西，试着让敌人失明。");
               outputText("[pg]阿瑞安得意地点点头。[say: 很好，[name]！我就是这个意思。]");
               outputText("[pg]你又和阿瑞安聊了几分钟，然后感谢[Arian em]的教导，并向这位咧嘴笑着的蜥蜴人告别，承诺很快会再来看[Arian em]。");
            }
         }
         else
         {
            outputText("[pg]你问阿瑞安，[Arian ey]是否介意听听你自己关于魔法的一些理论；最近你一直在认真思考这个课题。");
            outputText("[pg]阿瑞安看着你，眼中因你要说的内容而亮起兴趣。[say: 请说吧，我很想听听你的想法。]你解释说，如果你能够用魔法具现元素，那么只要稍加集中精神，也许就能在施法过程中改变这些元素；你把自己设想的方法告诉了这位蜥蜴人法师。");
            outputText("[pg]如果你能随心所欲地具现元素，那是否也能改变它们呢？你可以先在手中具现出一种不易挥发的物质，然后将它投向目标，同时集中精神改变它的性质，从而制造出爆炸反应。比如，你可以先聚集少量尘埃，再迅速将其转化为高度可燃的元素，让它看起来就像是你让空气爆炸了一样。");
            outputText("[pg]等你说完，阿瑞安冲你咧嘴一笑。[say: 很不错，[name]。没错，变化术也是法师若想被称为真正大师就必须掌握的技艺之一；让我给你更详细地解释一下……]");
            outputText("[pg]你专心听着这位蜥蜴人讲解……");
            outputText("[pg][say: 大致就是这样。学院里曾有法师在研究这个课题，但后来恶魔引发的那场麻烦发生了……也许有一天，我们还能重新开始这方面的研究。]");
            outputText("[pg]你告诉阿瑞安，这次谈话非常有趣；[Arian ey]今天与你分享的知识，肯定会在你的冒险中派上用场。");
            outputText("[pg]阿瑞安开心地冲你咧嘴一笑。[say: 能帮上忙我很高兴，[name]。请尽快再来吧；我很乐意和你继续讨论这些。]");
            outputText("[pg]你向阿瑞安道谢，并承诺不久后会再来。你告辞，然后");
            if(!arianFollower())
            {
               outputText("踏上回家的路。");
            }
            else
            {
               outputText("离开[Arian eir]的帐篷。");
            }
            if(!get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
            {
               outputText("[pg]走在路上时，你思考着刚才与阿瑞安讨论的内容，并得出结论：只要把具现术与变化术结合起来，你就能迅速而轻松地制造出一片不断扩张的烈焰，在战斗中灼烧敌人。");
               outputText("[pg]你应该找个机会尽快实践一下。");
               get_player().createStatusEffect(StatusEffects.KnowsWhitefire,0,0,0,0);
            }
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,946,FlagDict_Impl_.arrayReadInt(_loc1_,946) + 1);
         dynStats(DynStat.Inte(1));
         if(get_player().get_inte100() < 75)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().get_inte100() < 50)
         {
            dynStats(DynStat.Inte(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianMF(param1:String, param2:String) : String
      {
         if(arianMale())
         {
            return param1;
         }
         return param2;
      }
      
      public function arianLaysEggs() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:String = FlagDict_Impl_.arrayReadString(KFLAGS.flags,954);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,955,0);
         outputText("当你走近帐篷时，你想知道阿瑞安是否准备好产卵了……你的沉思很快被里面传来的痛苦呻吟打断了。看来阿瑞安要生了！你毫不迟疑地冲了进去，映入眼帘的是赤裸的蜥蜴人——");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("双性");
         }
         else
         {
            outputText("女孩");
         }
         outputText("正蹲在一个木盆上方，一只手伸在[Arian eir]双腿之间，按摩着[Arian eir]湿漉漉的私处，另一只手则揉着[Arian eir]的肚子，试图把蛋从[Arian em]体内催出来。");
         outputText("[pg]你看到[Arian em]身子一晃，[Arian ey]太专注于眼前的事，甚至没有注意到你。你担心[Arian ey]会失去平衡摔倒，于是赶紧移到[Arian em]身后，抱住并稳住[Arian em]。");
         outputText("[pg]这位蜥蜴人");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("双性" + arianMF("男孩",""));
         }
         else
         {
            outputText("女性");
         }
         outputText("正大口吸着气，又慢慢嘶声吐出，咬牙撑过[Arian eir]子宫的一阵阵收缩。[Arian ey]全神贯注于生产，以至于一开始甚至没意识到你的存在。过了片刻，[Arian eir]的眼睛终于认出你就在这里，[Arian ey]勉强给了你一个勇敢的微笑。[say: 啊，你好，[name]；抱歉让你看到我这个样子——我本来希望在你看到之前就把这些都弄完的，][Arian ey]带着歉意说道。");
         outputText("[pg]你责备[Arian em]，告诉[Arian em]，[Arian ey]准备产蛋的时候就该叫你；你肯定会很乐意帮忙。你把[Arian em]抱得更紧，让[Arian em]更贴近你的胸口，一只手移过去迎上[Arian ey]正慢慢按摩[Arian eir]肚子的那只手。你与[Arian eir]十指相扣，帮[Arian em]一起按摩[Arian eir]的肚子。");
         outputText("[pg][say: 嗯……谢谢你，[name]，有人帮忙的时候确实舒服多了。要是我知道最后会生出个宝宝来，这也不算太糟，可我受这么一遭，最后得到的也不过是一顿小点心。现在我有点明白为什么鹰身女妖满肚子蛋的时候总是那么想受精了：倒不是她们——或者说我——有多么想当妈妈，而是白白经历这一切，最后一点回报都没有，实在太让人烦了，]这位蜥蜴人重重叹了口气，一边说着，一边靠在你身上借力。");
         outputText("[pg]不过，你还是很感激[Arian em]愿意为你这么做。接着你注意到，[Arian ey]似乎真的已经进入了[Arian eir]作为一个" + arianMF("双性男孩","女孩") + "的角色。你怎么也想不到，以前还是男人的人会说出这种话……但阿瑞安这样子倒也挺可爱的，而你也喜欢现在这个模样的[Arian em]。你在[Arian em]脸颊上轻轻一吻，表示强调。好了，[Arian ey]还有一窝蛋要生，而你会陪在这里，帮[Arian em]完成所有必要的步骤。你把[Arian eir]的手从[Arian eir]肚子上拿开，放到你的腹部上，然后自己开始揉抚[Arian eir]的肚子。你的另一只手也松开[Arian em]，同样接替了那只正在按摩[Arian eir]阴唇的手，你很快取代了[Arian eir]的动作，挑逗并按揉着那处通向[Arian eir]体内深处、正在收缩的入口。");
         outputText("[pg]这位蜥蜴人从喉咙里发出低低的呻吟。[say: 嗯……你的手指还真是有魔力呢，对吧？][Arian Ey]说着，随即又皱起脸。[say: 啊呃，这一下可真够难受的——它们马上就要出来了，][Arian ey]用出奇平稳的语气说道，随着[Arian eir]腹部肌肉绷紧又收缩，[Arian ey]轻轻呻吟起来。");
         outputText("[pg]你的手上动作一刻不停，同时问[Arian em]你该做些什么？不过阿瑞安已经没时间回答了，因为你感觉到其中一个蛋形的隆起开始沿着这位蜥蜴人的产道往下移动。你感觉到[Arian eir]的小穴正在扩张，速度远比任何女人都该有的快；有那么一瞬间你不禁担心起来，但那颗蛋很快便通过，落入你早已等在那里的手中。你几乎刚来得及把它安全地放进盆里，另一颗蛋就又落进了你的手心。阿瑞安的肚子随着迅速的宫缩而震颤，随着一颗颗蛋排出，肚子也飞快地缩小下去。");
         outputText("[pg][say: 嗯呃……一旦真正开始，很快就会结束的，所以别担心，[name]。我一分钟就好了，][Arian ey]向你保证道。");
         outputText("[pg]你点了点头，尽管从这个姿势[Arian ey]看不见你。你低声说，[Arian ey]能面对这种折磨，真是个非常勇敢的女孩……而且你也不能否认，看着[Arian eir]这样产卵，确实有种特别的吸引力。[Arian Ey]看起来非常性感。你告诉[Arian em]，这正好可以当作将来[Arian ey]产下受精卵时的练习。你希望等那一天到来时，[Arian ey]能像现在这样性感。");
         outputText("[pg]这位蜥蜴人笑了起来，随着[Arian eir]子宫持续收缩，那笑声的音调有些忽高忽低。[say: 如果你真的觉得我这样很性感，[name]，那我还真希望我们能早点来一次真正的。噢……我体内已经没剩多少了，][Arian ey]说道，闭上[Arian eir]的眼睛继续用力。正如[Arian ey]所说，片刻之后，[Arian eir]的肚子便恢复了平常的平坦，而最后几颗蛋也咔嗒作响地落进了铺着稻草、[Arian ey]一直蹲在上方的盆里。[Arian ey]如释重负地嘶嘶叹了口气，小心翼翼地直起身，跨过那只盆。[say: 我……你能帮我拿点凉水来吗，[name]？我那边有个水壶？][Arian ey]问道，指向相应的方向。");
         outputText("[pg]你回答说当然可以。你轻轻扶着[Arian em]从蹲姿坐到地上，然后朝[Arian ey]指示的水壶走去。你四下看了看，很快发现一只杯子，便倒满水，把这杯凉水带回给气喘吁吁的蜥蜴人。[Arian Ey]从你手里接过杯子，大口灌下一大口，然后又往[Arian eir]头上倒了一些。[say: 噢……舒服多了。你去看看那些蛋吧，看看我们的小实验有没有成功？我先恢复一下力气，][Arian ey]建议道。");
         outputText("[pg]你点点头，开始翻检那些蛋。它们大多看起来像普通的蛋，和大号鸡蛋没太大区别。最后，你找到了一个似乎符合条件的。你把这颗蛋和其他蛋分开，又检查了一遍，发现阿瑞安只成功产下了一颗" + Utils.cnName(_loc1_) + "蛋。不过，对你来说这也已经足够了。你拿起那颗蛋，转身轻轻放到旁边的柜台上。然而当你回头查看阿瑞安的情况时，却看见这位蜥蜴人正随手拿起一颗[say: 普通]蛋，掂量着它的大小。");
         outputText("[pg]阿瑞安完全没注意你，而是饥肠辘辘地端详着[Arian eir]刚产下的蛋。一丝口水从[Arian eir]嘴角渗出，[Arian ey]迅速伸出长舌一卷舔掉，随后张开[Arian eir]的嘴，把整颗蛋都塞了进去。[Arian Ey]在嘴里含着它滚动了一阵，才终于把蛋壳刺破，发出清晰可闻的吸吮声，将里面的东西吸了个干净，然后把被压碎但仍大致完整的蛋壳吐到[Arian eir]手里。[Arian Ey]又抓起另一颗，和刚才一样急切地吞入口中，吸干内容物后吐出蛋壳。");
         outputText("[pg]你咳嗽了一声，试着提醒眼前这位饥饿的蜥蜴人，你还在房间里……");
         outputText("[pg]她停了下来，正要把另一颗蛋塞进[Arian eir]嘴里，脸上露出有些不好意思的神情。[say: 啊……抱歉，[name]。我只是太饿了，而且，呃，反正这些东西里面也没别的，对吧？还是说你也想尝一个？][Arian ey]突然提议道，把[Arian eir]最新的“点心”递向你。");
         outputText("[pg]你礼貌地拒绝了，告诉[Arian em]说，[Arian ey]刚经历过分娩，大概比你更需要它。总之，你也差不多该走了。你感谢这位蜥蜴人为你产下这颗" + Utils.cnName(_loc1_) + "蛋，并让[Arian em]好好享用[Arian eir]的……餐点……同时指出，虽然你个人很欣赏眼前的景色，但[Arian ey]之后大概还是该穿上些衣服。");
         outputText("[pg]阿瑞安倒吸一口气，赶忙遮住[Arian em]自己，对你露出紧张的笑容。[say: 谢谢你提醒我，[name]。不过，][Arian ey]紧张地咯咯笑了笑。[say: 如果你更希望我保持裸体，我也愿意为你这么做……]你认真考虑了一下这个想法……但最后还是告诉[Arian em]，你更希望下次来访时[Arian ey]能穿上衣服。不然的话，你就看不到[Arian em]为你性感脱衣了，你笑着说道。");
         outputText("[pg][say: 嗯，这也算是一种看法吧。]阿瑞安笑了起来。[say: 那么，如果你不打算陪我一起吃，一位女士可得享用[Arian eir]的早餐了，][Arian ey]对你说道，然后又整颗吞下一颗蛋，接着打了个很不淑女的嗝。[say: 好吧，这个吞下去确实有点太多了，][Arian ey]承认道，血色涌上[Arian eir]脸上苍白的" + (get_noFur() ? "皮肤" : "鳞片") + "" + (get_noFur() ? "" : "，形成[Arian eir]那种近似脸红的反应") + "。");
         outputText("[pg]你看着阿瑞安的反应笑了起来，告诉[Arian em]你并不介意。你现在该走了。你转身把那颗蛋收进口袋，离开阿瑞安的帐篷，临走前向这位蜥蜴人道别。[pg]");
         var _loc2_:ItemType = null;
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "brown")
         {
            _loc2_ = get_consumables().L_BRNEG;
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "purple")
         {
            _loc2_ = get_consumables().L_PRPEG;
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "blue")
         {
            _loc2_ = get_consumables().L_BLUEG;
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "pink")
         {
            _loc2_ = get_consumables().L_PNKEG;
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "white")
         {
            _loc2_ = get_consumables().L_WHTEG;
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,954) == "rubbery black")
         {
            _loc2_ = get_consumables().L_BLKEG;
         }
         get_inventory().takeItem(_loc2_,get_camp().returnToCampUseOneHour);
      }
      
      public function arianKiss() : void
      {
         clearOutput();
         arianSprite();
         outputText("拜访阿瑞安时，[arian ey]注意到你一直盯着[arian em]看，便问道：[say: 我脸上有什么东西吗，[name]？]突然，你迅速在这位法师的唇上亲了一下，[arian ey]一边脸红一边结结巴巴地说：[say: 我……哦，天啊……]阿瑞安迟疑地摸了摸[arian eir]的嘴，逐渐从这突如其来的亲密举动中缓过神来。[say: 我没想到会这样……]阿瑞安回吻了你，然后害羞地看向地面，接着提议道：[say: 如果你愿意的话……我们可以再多来几次？]");
         outputText("[pg]你温柔地决定把阿瑞安放倒在[arian eir]的沙发上，然后压到[arian em]身上。这只蜥蜴把[arian eir]双手贴在你的脸颊上，[arian eir]眼中满是爱慕，流露出[arian ey]对你的温暖情意。你们两人开始交换无数个吻，而你将阿瑞安的双手握进自己手中，与[arian em]十指相扣。你们亲吻的声音在奢华的帐篷里回荡，仿佛持续了一个永恒那么久。");
         outputText("[pg]当你终于停下亲吻你的恋人时，[arian ey]已经气喘吁吁，[arian eir]脸上带着如梦似幻的神情。阿瑞安勉强开口道，[say: 我……喜欢……接吻。]你温柔地最后一次将唇贴上阿瑞安的唇，然后起身。[arian Ey]大概需要休息一会儿，所以你暂时让阿瑞安独自待着。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianImbue() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你还没来得及开口，阿瑞安就轻呼一声，[say: 哦，[name]。我有个惊喜要给你。]阿瑞安微笑着说道。");
         outputText("[pg]惊喜？是什么？");
         outputText("[pg]阿瑞安打开[Arian eir]工作桌的一个抽屉，取出一个小包裹。它包得整整齐齐，还系着一条小丝带。[say: 给你的。]阿瑞安说着，把礼物递了过来。");
         outputText("[pg]你伸出手，轻轻从[Arian em]手里接过，小心地拆开包裹。你心里有一瞬间闪过一个念头：这该不会是订婚戒指吧？随即又把这个想法抛开——肯定不是，就算是在特尔阿德雷也不至于。包裹打开后，你看到了一条银项链：它的设计精致而充满异域风情，非常漂亮。那条奇特的链子下垂着一块小小的银牌，中央刻着一枚符文，只是你并不认识那符文。");
         outputText("[pg]阿瑞安对你微笑。[say: 你喜欢吗？这是我亲手做的。]");
         outputText("[pg]你端详着这件迷人的饰物，并诚实地告诉[Arian em]：它很漂亮。你从没想到[Arian em]竟然这么有手艺。阿瑞安被你夸得脸红起来。[say: 谢谢，你喜欢就好。不过让我解释一下——它不是普通项链，其实是一枚魔法护符。我想送你一件能在冒险中派上用场的东西，]阿瑞安解释道。");
         outputText("[pg]你对[Arian em]笑了笑，立刻把项链挂到自己脖子上，告诉[Arian em]它既贴心又好看。阿瑞安脸红了。[say: 只是有个……嗯，一点小问题。]");
         outputText("[pg]你紧张地僵住了。问题……？你不禁怀疑自己现在戴上它到底是不是个好主意。阿瑞安点点头。[say: 我其实还没有给这枚护符灌注任何法术，因为我没有需要的材料。抱歉，[name]。]阿瑞安失望地低下头。");
         outputText("[pg]你松了口气。那么，如果下次来时你给[Arian em]带些材料呢？你问道。那样能帮[Arian em]完成最后的处理吗？");
         outputText("[pg]阿瑞安微笑着点点头。[say: 当然。不过我得提醒你，这枚护符只能容纳一个法术，但一旦被灌注了法术，你就可以尽情使用它……我是说……只要你不会因此累过头……我有一份法术清单，上面写着完成法术需要的东西；你只要把材料带来，再告诉我你想要哪个法术就行了。]");
         outputText("[pg]你向阿瑞安道谢；这样的礼物在你的旅途中一定会很有用。");
         outputText("[pg]阿瑞安咬住[Arian eir]下唇。[say: 那么……你有什么想做的吗？也许……]阿瑞安脸红了。[say: 你可以好好地谢我一下……为了这份礼物。][Arian Ey]上下打量着你，随后又把[Arian eir]视线落到地板上，局促地扭动起来。");
         outputText("[pg]哦嚯……你灼热的目光几乎要把这个紧张又害羞的蜥蜴人看穿。你用最撩人的眼神盯着[Arian em]，问[Arian ey]所谓[say: 好好地谢[Arian em]一下]……到底是什么意思？你伸手抚过[Arian eir]的脸侧，强调着自己的话，看着[Arian em]因你的触碰而满怀期待地轻颤。");
         outputText("[pg]阿瑞安清晰地咽了口口水。[say: 我……我……我想要你！]阿瑞安脱口而出，尴尬地移开[Arian eir]视线，身体扭动得更厉害了。你已经知道，这是[Arian ey]情动的信号。");
         outputText("[pg]你要和阿瑞安做爱吗？");
         get_player().createKeyItem("Arian\'s Talisman",0,0,0,0);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         menu();
         addButton(0,"是",yesPlotSexArian);
         addButton(1,"否",noPlotSexNauArian);
      }
      
      public function arianHomeMenu() : void
      {
         var _g2:Camp;
         var newl:Boolean;
         var _g1:ArianScene;
         var _g:ArianScene;
         var _loc1_:NobleShirt = get_undergarments().SEA_SHIRT;
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 0 && arianHealth() >= 10)
         {
            addButton(0,"继续",arianStoryDialogue1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 1 && arianHealth() >= 20)
         {
            addButton(0,"继续",arianStoryDialogue2);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 2 && arianHealth() >= 30)
         {
            addButton(0,"继续",arianDialogue3);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 3 && arianHealth() >= 50)
         {
            addButton(0,"继续",arianImbue);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 4 && arianHealth() >= 75)
         {
            addButton(0,"继续",arianPlot4);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) == 5 && arianHealth() >= 100)
         {
            addButton(0,"继续",arianPlot5);
         }
         else
         {
            if(_loc1_.saveContent.arianDisenchant && get_time().days > _loc1_.saveContent.arianDisenchantDay + 1)
            {
               outputText("你走近那名蜥蜴人，对方脸上的表情已经明白地告诉你工作完成了。你开口询问那件衬衫的事。");
               outputText("[pg][say:我设法解开了上面的束缚！][arian ey]一边说，一边把叠好的衣物递给你。[Arian Eir]的脸色沉了下来，接着说道。[say:不过，我没法在不毁掉布料的情况下把所有魔法都去除掉，所以如果长时间穿着它，它还是会扭曲你的身体。]");
               outputText("[pg]你拍了拍[Arian eir]的肩膀，向这位蜥蜴人保证，[Arian eir]的努力你依然很感激，而且也并非全无用处。");
               _loc1_.saveContent.arianDisenchant = false;
               _loc1_.saveContent.bound = false;
               get_inventory().takeItem(_loc1_,arianHomeMenu);
               return;
            }
            addButton(0,"外貌",arianAppearance).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,942) == 0,"你还没好好看清他。");
            addButton(1,"交谈",talkToArianChoices).hint(arianFollower() ? "和你的蜥蜴人爱人聊一会儿。也许聊聊魔法？或者更亲密的事？" : "和阿瑞安聊点什么");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) >= 2)
            {
               _g = this;
               addButton(2,"性爱",function():void
               {
                  _g.arianSexMenu();
               }).hint("和阿瑞安来点成人乐趣。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) >= 1)
            {
               addButton(5,"给予物品",giveArianAnItem).hint("给阿瑞安一件你的物品。这可能最终会改变" + (arianMF("m","f") == "f" ? "她" : "他") + "。");
            }
            if(arianFollower())
            {
               addRowButton(1,"示爱",arianAffection).hint("向你的蜥蜴人爱人表达爱意。");
            }
            if(get_player().hasKeyItem("Arian\'s Talisman") || get_player().hasKeyItem("Arian\'s Charged Talisman"))
            {
               addRowButton(1,"护符",imbueTalisman).hint("谈谈阿瑞安送给你的护符。" + (get_player().hasKeyItem("Arian\'s Charged Talisman") ? "也许你可以改变它目前灌注的法术？" : "也许你可以往里面灌注一个法术？"));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,943) >= 5)
            {
               addRowButton(1,"治疗堕落",treatCorruption).hint("请求阿瑞安帮你清除一部分正在影响你的堕落。");
            }
            if(arianFollower() && get_time().hours > 20)
            {
               _g1 = this;
               newl = true;
               addButton(9,"同床而眠",function():void
               {
                  _g1.sleepWithArian(newl);
               }).hint("今晚以及之后的夜晚，都和阿瑞安一起睡在" + (arianMF("m","f") == "f" ? "她" : "他") + "的床上。");
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Arian")
            {
               addButton(9,"独自睡",dontSleepWithArian).hint("不再睡在阿瑞安的床上。");
            }
            if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDAR) == 0)
            {
               addButton(10,"藤蔓",get_game().swamp.alrauneScene.askArian).hint("有什么办法能解决这个吗？");
            }
            if(arianFollower() && get_player().hasItem(get_useables().LETHITE))
            {
               addRowButton(2,"莱希石",giveLethicite).hint("阿瑞安精通魔法和附魔，也许[Arian ey]能派上莱希石的用场。");
            }
            if(get_player().get_upperGarment() == _loc1_ && _loc1_.knownBound() && !_loc1_.saveContent.arianAsked)
            {
               addRowButton(2,"诅咒衬衫",askArianAboutNobleShirt).hint("阿瑞安精通魔法和附魔，肯定知道一两件能帮上忙的事。");
            }
            else if(get_player().hasItem(_loc1_) && _loc1_.saveContent.bound && !_loc1_.saveContent.arianDisenchant)
            {
               addRowButton(2,"解除附魔",askArianToDisenchant).hint("阿瑞安也许知道该如何在诅咒发作前解除它。");
            }
            if(!arianFollower())
            {
               addButton(14,"返回",get_telAdre().telAdreMenu).hint("留下阿瑞安，然后回到外面去。");
            }
            else
            {
               _g2 = get_camp();
               addButton(14,"返回",function():void
               {
                  _g2.campLoversMenu();
               }).hint("离开阿瑞安的帐篷，回到外面去。");
            }
         }
      }
      
      public function arianHealth(param1:int = 0) : int
      {
         var _loc2_:* = null as IMap;
         if(param1 != 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,935,FlagDict_Impl_.arrayReadInt(_loc2_,935) + param1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) > 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,935,100);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,935,0);
            }
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935);
      }
      
      public function arianHeadpats() : void
      {
         clearOutput();
         arianSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         outputText("你告诉阿瑞安这次从床上下来，因为你有特别的东西要给她。她照做了，带着期待的神情走到你面前。你用命令的口吻让她在你面前跪下。[say: 当然可以，[name]。]当她把自己降到地板上时，你将一只手放在她" + (get_noFur() ? "" : "覆着鳞片的") + "头顶。等她稳稳跪好后，你开始前后移动手掌，起初动作很慢，轻轻抚摸她柔软的脑袋。");
         outputText("[pg][say: [Name]……嗯，好舒服。]她一边说着，一边因愉悦而坐立不安、发出低哼，你于是加快了速度。她弓起背，你低头看着你的小蜥蜴人荡妇，把手从她的头皮上抬开。还没等她意识到，你便在她头顶轻轻快速地拍了一下。她兴奋地喘息着，不安地扭动，哼哼唧唧地索求更多。你不想让她失望，便一次又一次抬手落下。");
         outputText("[pg]你接连不断地给阿瑞安拍头，开始注意到她身下形成了一大滩湿迹；你苍白的" + (get_noFur() ? "" : "覆着鳞片的") + "爱人的小穴正不断涌出爱液。看着她身后的尾巴越摇越快，你决定彻底放开手脚，两边一起攻势全开。你没有停下拍她的头，接着又加入另一只手，热烈而亲昵地揉弄她柔软的" + (get_noFur() ? "" : "覆着鳞片的") + "头皮。这样做还不到几秒，她的双腿便抽搐起来，臀部猛地一挺，尾巴在身后狂乱甩动。[say: [name]，继续，继续……啊啊啊我要……]她没有把尖叫的话说完，而是化作沉重的喘息和呻吟，同时抬起双手，疯狂揉弄自己柔软的" + (get_noFur() ? "" : "覆着鳞片的") + "奶子。看见淫液在她两腿之间飞溅涌出，你可以确信她已经迎来了第一次高潮，而且强烈得惊人。");
         outputText("[pg]你又拍又揉，动作愈发猛烈，并命令她当个乖荡妇，好好给你找点乐子。你甚至还没来得及说完，就看见她向前倾身，感觉到她的嘴含住了你的[clit]，用灵巧的舌头用力吸吮舔弄。她吸着、舔着、用舌头缠绕你肿胀小核时所表现出的急切与热情，让人兴奋不已。只要你持续关注她的脑袋，她便把自己存在的全部意义都奉献给取悦你；没过多久，你就感觉到熟悉的高潮压力在双腿之间积聚。你用手背缓慢而温柔地抚摸她的侧脸。她被这种感觉彻底迷住，舌头以惊人的力道顶撞你的阴蒂，很快便将你推向一次强烈的顶点。感受着高潮的浪潮席卷全身，你不受控制地将[if (issquirter) {大量|意料之外的大量}]液体喷在你苍白爱人的嘴、下巴和胸口上。");
         outputText("[pg]在你高潮后，阿瑞安把头向后移开，抬头望着你，眼中满是渴求。[say: 求你了，[name]。请再给我更多！]她刚才那么卖力地取悦了你，你也乐意满足她，于是决定让她尽情享受。你现在飞快地拍着她的头，同时温柔地揉着，低头告诉她，她是个好女孩。她笑了起来，疯狂摇着尾巴，在自己制造出的那滩体液上扭动身体。时间一分一分过去，你的爱人喘息、呻吟着，仿佛已经完全失控。她眼睛上翻，舌头从嘴里垂出；每隔几分钟，你都能注意到她的身体因高潮而痉挛，湿透的小穴又往身下那滩水洼里添上更多淫液。");
         outputText("[pg]在这场漫长到难以置信的激烈拍头之后，你告诉你的爱人，她现在已经够了。[say: 可是[name]！我还想要更多！]你告诉她以后还会再给她，现在你得去处理别的事。你抓住她的肩膀，让她躺进身下那滩湿迹里，并告诉她在你离开期间要乖乖的。她噘着嘴看着你，似乎接受了你的决定。穿好衣服后，你重新踏上你的任务之路。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianHandholding2() : void
      {
         clearOutput();
         arianSprite();
         outputText("你醒来时，看见阿瑞安正带着温柔的微笑低头看着你。你很快意识到，自己的头正枕在[arian eir]腿上。你坐起身来，却忍不住打了个哈欠。你的爱人带着歉意对你说：[say: 对不起，我不小心睡在你身上了。]其实[arian em]没必要道歉；毕竟你也睡着了。阿瑞安轻轻笑了一声，随后[arian ey]说道：[say: 累了就好好休息，这很重要。想到你那么照顾我的健康，我也希望你有好好照顾自己的身体，[name]。]");
         outputText("[pg]你礼貌地向阿瑞安点点头，感谢[arian em]关心你，但解释说自己该走了。你的爱人皱起眉，不过还是理解地点了点头。[say: 我的帐篷永远为你敞开，所以一定要尽快再来看我。]");
         cheatTime(1);
         doNext(playerMenu);
      }
      
      public function arianHandholding() : void
      {
         clearOutput();
         arianSprite();
         outputText("你在阿瑞安的帐篷里坐到沙发上，问[arian ey]是否介意牵手。作为回应，阿瑞安毫不犹豫地牵住了你的手。[arian eir]脸上带着微笑，轻轻握了握你的手。[arian Ey]对你说：[say: 你应该知道，我永远不会拒绝和你牵手的，[name]。]当你们两人安静地坐在一起时，你能感觉到阿瑞安稍稍往你身边挪近，直到[arian ey]能够把[arian eir]的头靠在你的肩上。");
         outputText("[pg]阿瑞安靠着你过了几分钟后，你试着挑起话题，却发现你的爱人已经带着微笑睡着了。你考虑离开，好让阿瑞安休息，但当你刚要动时，就感觉到[arian em]把你的手握得更紧，还不安地动了动。打扰到[arian em]实在让人很难不感到内疚，于是你把头靠在[arian eirs]旁边。你也没理由不能休息一下，于是闭上眼睛，渐渐睡了过去。");
         doNext(arianHandholding2);
      }
      
      override public function arianFollower() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,933) > 0;
      }
      
      public function arianFemaleTailriding() : void
      {
         clearOutput();
         arianSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         outputText("你告诉你的蜥蜴人恋人，想和她试试稍微有点不同寻常的玩法，并让她仰面躺下，张开她" + (get_noFur() ? "" : "覆着鳞片的") + "双腿，好让她的尾巴从双腿之间笔直地翘起来。她完全照你说的做了，而你只是站在她身前看了一会儿，欣赏着她纤细" + (get_noFur() ? "" : "、覆着鳞片") + "的身体，以及已经明显湿润起来的小穴。被你这么看着，她有些坐立不安，脸也红了起来。");
         outputText("[pg][say: 呃，[name]？你不打算上床陪我吗？还是说，让我这样摆出来给你看，就是那个不同寻常的部分？] 你笑了起来，安抚这位害羞的恋人说，后面还有更多呢。你朝她微微一笑，爬上床来到她身边。但你并没有贴近她的身体，而是跨坐在她那条覆着鳞片的长尾巴上。你用自己的[vagina]在上面来回蹭磨，让自己和她粗实的附肢都变得又滑又湿，同时告诉她，你一直都很喜欢她那条可爱的白色尾巴。她又一次脸红了，似乎也猜到了你打算做什么。[say: [name]，你总是这么会哄人。想怎么对我的尾巴都可以，被这样使用……感觉还挺刺激的。]");
         outputText("[pg]你对着满眼爱意的伴侣坏笑了一下，将自己湿透的小穴沿着她柔软而渐细的尾端滑得更深，接着俯下身，从下到上，缓慢而绵长地舔过她裸露小穴的外侧。她没想到自己紧窄湿润的小穴会被这样照顾，不由得扭动起臀部，将尾巴向上顶向你。[say: 嗯唔，[name]，好舒服。] 你抬起头看向她的眼睛，告诉她这才刚刚开始。你朝她露出一个诱人的坏笑，随后重新专注起来，将嘴唇移向她已经挺起的小小阴蒂。你先轻轻吻了一下，又缓慢舔过，接着将它含入口中。听见她倒抽一口气，你开始温柔地吮吸她挺立的快感小核，并用舌头轻轻绕着它打转。");
         outputText("[pg][say: 嗯……你真让我开始后悔，为什么没有早点变成女孩子。] 听见她享受其中，你也满意起来，决定开始实践自己一开始就想好的玩法。你仍旧用嘴取悦着她，同时微微抬起身体，离开她那覆着鳞片的附肢。你小心地调整她的尾巴，让它弯成一个角度，尾尖正好抵在你的[vagina]入口处。");
         outputText("[pg]你挑逗般地在她柔软覆鳞的尾端上蹭磨，将它润湿，好迎接接下来要发生的事。你牢牢握住她的尾巴，让它稳稳向上翘着，然后慢慢坐了下去。当那条覆鳞的附肢开始进入你体内时，你发出一声呻吟，却因为嘴正贴在你的" + (get_noFur() ? "" : "覆着鳞片的") + "恋人身上而显得有些含糊。渴望着更多的你继续下沉，让她进入得更深。随着她的尾巴在你体内越陷越深，你也更用力地用舌头抵压她的阴蒂，她几乎舒服得喘息起来。[say: 啊啊，[name]，你里面好暖！] 听到她的夸赞，你欣喜地更用力吮吸她的阴蒂，并加重舌尖的压力。你抬眼看向她，见她的双手移向自己柔软" + (get_noFur() ? "" : "、覆着鳞片") + "的乳房，爱抚揉捏起来。眼前的景象让你的欲火更盛，你抓住她尾巴与床面相接的部位稳住它，然后将自己彻底贯在上面。她覆鳞的尾肢深入到几乎让尾尖轻轻触到你的宫颈，而越来越粗的部分撑开你湿透的小穴，令你在强烈的快感与疼痛中尖叫出声。");
         get_player().cuntChange(20,true,true,false);
         outputText("[pg]想把这次体验榨到极致，你稳稳地按着节奏在她的尾巴上上下起伏。一次又一次抬起又落下，你的小穴紧紧裹住她；那惊人的粗度从你体内退出，又再次深深没入。几乎没过多久，你便感觉到腿间升起一阵熟悉的压力，被你尽情蹂躏自己的那条尾巴带来的强烈快感，很快让你的小穴痉挛着高潮喷涌，同时在你爱人粗大的尾巴周围收得更紧。");
         outputText("[pg]你不想当个自私的伴侣，不愿一高潮就停下，于是任由阿瑞安的肢体尽可能深地留在你体内，自己则放慢动作，只在上面轻轻摇晃。相反，你开始专注于她的需求。你将一只手从她的尾巴上移开，用两根手指探向她湿淋淋的阴道入口，惹得她扭动身体，把自己" + (get_noFur() ? "" : "覆着鳞片的") + "奶子捏得更用力。为了让这个饥渴的蜥蜴人得到她想要的释放，你慢慢将手指压进她体内。你进入她时，她倒抽一口气，你能感觉到她正试图用体内的肌肉夹紧你的手指。你不再用舌头绕着她的阴蒂打转，而是专注地用力抵住那里，缓慢而有力地上下舔弄，同时在她体内弯曲手指，很快便开始前后抽插起来。");
         outputText("[pg]毫不意外，她并没有再坚持多久，身体便迎来了你一直努力促成的结果。阿瑞安在你见过她经历的最强烈高潮之一中痉挛起来，大量淫液淹没了你正在干她的那只手。她弓起背，因快感而大声呻吟、喘息。她甚至没有意识到，强烈的高潮支配住身体时，竟把自己的尾巴深深顶进了你体内。那尾巴在最深处尽可能地扭动着，在你体内迅猛而有力地搅动，让你感到强烈的快感。毫无预兆地，你感觉又一阵压倒性的压力在体内积聚，另一波高潮把欢愉浪潮推遍你的全身，也让她的尾巴此刻被彻底浸透，甚至在它与床面相接的地方，床单上已经开始形成一小滩湿迹。");
         outputText("[pg]当你们两人开始从这场激烈的欢爱中冷静下来，你慢慢抽出她的尾巴，躺到她身边喘口气。你微笑着亲吻她的额头，告诉她这比你预想的还要有趣得多。[say: 相信我，我也是。而且一想到，我以前竟然从没想过能这样用自己的尾巴。我在想，我会不会柔韧到能把它用在自己身上……]你告诉她把这个念头留到以后再说[if (!isnaked){，然后站起身穿好衣服}]。");
         outputText("[pg]在离开前，你拍了拍她" + (get_noFur() ? "" : "柔软、布满鳞片的") + "头，告诉她现在是时候继续你的任务了。她祝你好运，然后开始清理，你离开了她的" + (arianFollower() ? "帐篷" : "房间") + "。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianFacesittingWatersports() : void
      {
         clearOutput();
         arianSprite();
         outputText("简直不敢相信她居然比你先高潮了，你决定给她一点小小的惩罚。以你现在的位置，正好有个再合适不过的做法。你抬起小穴离开她的脸，她好奇地抬头看着你。[say: [name]？你要做什——]你没等她把话说完，就直接对准她张开的嘴，缓缓放出一股尿液。她因为惊讶没有立刻闭上嘴，结果被你的尿液灌满了口腔。看着你的尿从她" + (get_noFur() ? "" : "布满鳞片的") + "脸颊上淌下来，你咯咯笑着，继续洒下滚热的金色液体，同时向前挪动身体。你浇湿了她" + (get_noFur() ? "" : "覆着鳞片的") + "脖子、奶子、肚子，随后又向前挪到足够的位置，尿在她的外阴上，直到最后彻底尿尽。你命令她当个乖女孩，把嘴里的东西咽下去，然后又回到她嘴上方的位置，继续骑在她脸上。感觉到她把一些温热液体喷溅进你的[vagina]里，你笑着告诉她，这就是比你先高潮的下场。");
         outputText("[pg]你俯下身，用双手把她身上的尿液抹开，涂遍她的胸口、肚子、胯部和大腿。她" + (get_noFur() ? "" : "覆着浅色鳞片的") + "身体如今在你金色的湿意下闪闪发亮，你让她快点把这里弄完。你用力骑着她，感觉她尽管遭遇了这突如其来的惊喜，仍然一如既往地热情用舌头侍奉你。她伸手摸向你的阴蒂，又疯狂地弄了你几分钟，不知不觉间，你感到高潮的热意涌了上来。你高潮时，胯部在她脸上一次又一次快速起伏，在高潮余韵中把淫液喷洒到她本就湿透的脸上。");
         outputText("[pg]心满意足后，你下了床，重新穿好衣服。你一边把[armor]穿回身上，一边抬头看去，只见她脸上满是震惊。[say: 你怎么能这么做，[name]？！]你只是解释说，这是你一直想和她试试的事，而你觉得刚才正是个好机会。你向她保证自己没有恶意，并提出帮她清理干净。[say: 不……没关系。其实还是很有意思的。可下次你要做这种事的时候，最好先提醒我一声，这样我还能把嘴闭上！我得找点烈的东西把这味道冲掉……]她叹了口气，开始清理，而你也准备离开。就在你走出她的" + (arianFollower() ? "帐篷" : "房间") + "时，你告诉她，不让她闭上嘴本来就是乐趣的一部分。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianFacesittingFirst() : void
      {
         clearOutput();
         arianSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         outputText("你和阿瑞安一起上床后，问她愿不愿意让你骑在她那张可爱的" + (get_noFur() ? "" : "覆着鳞片的") + "小脸上。听到你的称赞，她微笑着红了脸。[say:[name]，你真甜。我简直不敢相信这真的发生了……]");
         outputText("[pg]你先让她平躺在床上，给了她一个短促的吻，然后开始小心地把你的[vagina]移到她脸上方。你想在进入正题前再多挑逗她一下，于是把自己湿润发亮的小穴悬在她脸前晃动。你先移到她眼前，问她喜不喜欢自己看到的东西。[say:你比我想象中还要美。]你能听出她声音里的惊叹，所以知道她当然很享受眼前的景色，但在让她品尝之前，你想让她变得<i>非要不可</i>。你在她上方稍稍扭动身体，让女性体液的水珠洒落在她身上。随后你向下挪动，让饥渴的小穴贴上她" + (get_noFur() ? "" : "覆鳞的") + "额头，再沿着她的脸一路滑到鼻子上。你在那里停留片刻，贴着她的鼻子研磨，让你的[clit]尽可能硬挺起来。就在你这么做时，你感觉阿瑞安开始在你身下扭动，接着察觉到一种奇妙的触感。你低头看去，发现她那条灵活的舌头正从嘴里伸出，舔舐着你硬起来的阴蒂。你问她在做什么，可还没等她解释，你低头看向她的身体，便发现她的大腿内侧此刻已经湿得发亮，尾巴上几乎形成了一小滩液体。");
         outputText("[pg][say:啊啊，[name]，你只是……你的气味好甜，好浓。拜托，快让我尝尝你吧！]你带着欲望咧嘴一笑，告诉她别担心；你会给她想要的东西。");
         outputText("[pg]准备正式开始后，你挪到她嘴上方，立刻感觉到她的舌头开始舔舐你。你发出一声出乎意料的满足呻吟，伸手抓住并掐捏她挺立的乳头。她在你的掐弄下在你身下扭动，脸颊摩擦着你，让你的快感更加强烈。你想要更多，便抓起她一只手臂，把她的手带到你的[clit]上。不用你多说一句，她便开始以画圈的动作抚弄，让你因快感而弓起后背。你俯身向前，抓住并揉捏她那柔软" + (get_noFur() ? "" : "覆鳞的") + "乳房的每一处，同时开始对着她的脸做出挺动的动作。就在你这么做时，她发出一声含混的呻吟，舌头在你体内灵活地游走。她原本揉弄你阴蒂的那只手从用手指变成了用掌心按压着它，并一圈圈摩擦。当你低头看去时，注意到她也开始在自己的阴蒂上模仿同样的动作，不同的是，她还同时用中指和无名指插入自己体内。她显然一点也不排斥自己新的女性生殖器。");
         outputText("[pg]对此，你比以往任何时候都更加急切，挺起[hips]向她顶去，俯身亲吻她的肚腹，双手仍揉捏着她的乳房。似乎就在你把嘴唇贴上她柔软的" + (get_noFur() ? "" : "覆鳞的") + "肚腹的瞬间，她的尾巴便以惊人的力道左右摆动起来，同时开始比刚才更快地揉弄你的每一颗阴蒂。你感觉她的双唇更深入地探索着你，舌头也探得更深，沿着你的阴道内壁长长舔舐。你听见并感到一声拖长的欢愉尖叫闷在你的小穴里；她的身体微微抽搐，尾巴也被自己的淫液浸透，竟然先你一步迎来了高潮。");
         outputText("[pg]你可不想被落下太多，于是命令她再卖力些，她含糊地应了一声。你把自己重重压在她嘴上，到这地步她简直是在亲吻你的小穴。感受到她用嘴唇用力含弄你的阴唇，你忍不住倒吸一口气；她的舌头在你体内漫长而缓慢地舔动，与你阴蒂上飞快的动作形成令人愉悦的反差。渐渐找到节奏后，你冒出一个主意。你粗暴地在她热切的嘴上挺动了几分钟，随后决定突然给她一个惊喜，迅速伸手掐住她两边的乳头。用力地。你感觉她的脑袋猛地往你身上一弹，长舌也因惊讶而狠狠深刺进你体内。那感觉实在太好，你决定再掐她一次，也得到了相似的反应。");
         outputText("[pg]这样下去你也快到了。你告诉她要做个好女孩，就照现在这样继续下去。你感觉她的脑袋上下动了几下，便把这当作她能做到的最好点头回应。你一次又一次掐她，每次都换来她的舌头更用力地抵向你。你很确定到了这时候，她这么做只是因为自己也乐在其中，不过不管怎样都很舒服。在你每次逼得她的舌头更加卖力之间，你都能感觉它在你体内旋转、游移。若不是亲身感受着，你绝不会相信她的舌头能灵巧到这种地步。不知不觉间，你发出一声沉重而愉悦的叹息，感觉自己的高潮越来越近。你越是接近高潮，就越用力地向你的新爱人顶去，也越发催促她探得更深。只差她的舌头再一次漫长而有力地刺向你体内，你便在狂喜中喘息呻吟，感觉灼热的快感浪潮席卷全身。你的背脊弓起，肌肉抽搐，阴道内壁紧缩，随即一股淫液喷涌而出，淋满你爱人的嘴和下巴。");
         outputText("[pg]你开始抬起身子，可还没离开她的脸几寸，她便从口中伸出那条灵活可卷的长舌，用它清理掉残留在你身上的所有液体，最后还舔了舔你的[vagina]，并在那里轻轻吻了一下。她坐起身时，沾满她脸的液体已经滴到下巴、脖颈，有些甚至一路流到了胸前。");
         outputText("[pg]你把她的身体拉近自己，紧紧抱住她，深深地吻着她。你问她刚才开不开心。[say: 是的……太棒了。我几乎不敢相信这是真的。我从没想过事情会变成这样。但我真的很高兴最后是这样。]她紧紧环住你，把身体贴向你。[say: 我爱你，[name]。]你毫不犹豫地告诉她，你也爱她。");
         outputText("[pg]这一刻固然甜蜜，但你还是想谈谈那个避不开的问题。你问她，这么随意地改变性别，尤其还是在刚才那种情热上头的时候，她真的不会介意吗？[say: 嗯……倒也不会。我本来就没有特别执着于自己是男人什么的。而且虽然这确实是个很大的变化，但到目前为止，我还挺喜欢现在这具身体的样子和感觉。现在说或许还太早，但我可能比以前更喜欢这样。] 听到她似乎没什么问题，你也放下心来，告诉她你真的很高兴她看起来挺喜欢这样，而不是只是为了你才维持这个样子。");
         outputText("[pg]短暂地依偎了一会儿后，你亲了亲她的额头，随后下床穿衣。你告诉她你得走了，不过你一定很快就会再回来。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianFacesitting() : void
      {
         clearOutput();
         arianSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         outputText("你没有浪费时间，立刻和阿瑞安一起上了床，问她愿不愿意让你骑在她那张可爱的" + (get_noFur() ? "" : "覆着鳞片的") + "小脸上。听到你的夸奖，她微笑着红了脸。[say: [name]，你真会说话。听起来棒极了。]");
         outputText("[pg]你先让她平躺在床上，给了她一个短促的吻，然后才小心地把自己的[vagina]挪到她脸上方。在真正开始之前，你想先再挑逗她一会儿，于是把自己湿亮的小穴在她脸前晃了晃。你先悬在她眼前，问她喜不喜欢眼前看到的东西。[say: 喜欢……我永远都会喜欢看着它。尤其是从这个角度看。] 她显然很享受这样的景色，但你想让她在尝到之前先变得<i>渴求</i>。你在她上方稍稍扭动身体，让一滴滴雌性的淫液落在她身上。接着你向下挪去，把饥渴的小穴贴上她的" + (get_noFur() ? "" : "覆着鳞片的") + "额头，再沿着她的脸一路滑到鼻尖。你在那里停留片刻，贴着她的鼻子研磨起来，让你的[clit]尽可能地挺立。就在你这么做的时候，你感觉到阿瑞安在你身下扭动起来，接着察觉到一种奇妙的触感。你低头一看，发现她那灵活的舌头正从口中伸出，舔弄着你硬起的阴蒂。你问她在做什么，可还没等她解释，你就低头看向她的身体，发现她的大腿内侧此刻已经湿得发亮，尾巴上几乎都积起了一小摊水迹。");
         outputText("[pg][say: 啊啊啊，[name]，你实在是……你的味道好甜，好浓。求你了，快让我尝尝你吧！] 你带着欲望咧嘴一笑，告诉她别担心；你会给她想要的。");
         outputText("[pg]准备正式开始后，你挪到她嘴上，立刻感觉到她的舌头开始舔舐你。你发出一声出乎意料的愉悦呻吟，伸手抓住并捏起她挺立的乳头。她在你身下因你的揉捏而扭动，脸颊蹭着你，让你的快感更加强烈。你想要更多，于是抓过她一条胳膊，把她的手带到你的[clit]上。无需你多说，她便开始打着圈抚弄，让你愉悦地弓起背。你俯下身，把她柔软无比" + (get_noFur() ? "" : "、覆着鳞片") + "的一对乳房整个握住、揉捏起来，同时开始对着她的脸挺动。与此同时，她发出含混的呻吟，舌头在你体内四处游走。她揉弄你阴蒂的那只手不再用手指，而是改用掌心按住它，绕着圈摩擦你。当你低头看去时，你发现她也开始在自己的阴蒂上模仿同样的动作，不同的是，她一边这么做，一边还用中指和无名指插入自己体内。");
         outputText("[pg]这让你比以往更加急切，你把[hips]往她身上顶去，俯身亲吻她的腹部，双手仍在揉弄她的乳房。几乎就在你把嘴唇贴上她柔软" + (get_noFur() ? "" : "、覆着鳞片") + "的腹部时，她的尾巴便以惊人的力道左右摆动起来，同时她揉弄你们两人阴蒂的速度也比之前快了许多。你感觉到她的嘴唇更加深入地探索着你，舌头也探得更深，沿着你的阴道内壁长长地舔舐。你听见并感觉到一声拖长的快感尖叫在你的小穴里响起，她的身体微微痉挛，尾巴也被自己的淫液浸湿，先你一步迎来了高潮。");
         doNext(arianFaceSittingContinued);
         if(get_watersportsEnabled())
         {
            addButton(1,"尿玩",arianFacesittingWatersports);
         }
      }
      
      public function arianFaceSittingContinued() : void
      {
         clearOutput();
         arianSprite();
         outputText("你不想被落下太多，于是命令她更卖力些，她含糊地应了一声。你用力把自己压到她嘴上，几乎让她此刻像在亲吻你的小穴。你感觉到她的嘴唇用力贴着你的阴唇动作，而她的舌头则在你体内缓慢而悠长地舔舐着；这与你阴蒂上快速的抚弄形成了美妙的反差，让你忍不住倒吸一口气。节奏渐入佳境时，你忽然有了个主意。你对着她急切的嘴巴猛烈挺动了几分钟后，决定突然给她一个惊喜，迅速伸手捏住她两边的乳头。用力地。你感觉到她的脑袋猛地往你身上一顶，那条长舌也因惊讶而又深又重地压进你体内。那感觉实在太棒了，于是你决定再捏她一次，也得到了相似的反应。");
         outputText("[pg]你已经快到了。你告诉她要做个乖女孩，就保持现在这样继续下去。你感觉到她的脑袋上下动了几下，便当作这是她能做到的最像点头的回应。你一次又一次地捏她，每次都换来她的舌头更用力地压向你。到了这时，你几乎可以肯定她是因为自己也乐在其中才这样做，但不管怎样，这感觉都很棒。每当你逼得她的舌头加倍卖力之后，你都能感觉到它又在你体内旋转、穿梭。若不是亲身感受着，你绝不会相信她的舌头能有如此灵活。还没等你反应过来，你便在高潮越来越近的感觉中发出一声沉重而愉悦的叹息。你越是接近高潮，就越用力地朝你的爱人挺动，也越发鼓励她探得更深。只需她的舌头再一次漫长而用力地顶向你的内壁，你便在狂喜中喘息呻吟，感到一波波炽热的快感席卷全身。你的背弓起，肌肉阵阵痉挛，阴道内壁也随之收紧；与此同时，你感觉到一股淫液喷涌而出，淋满了你爱人的嘴和下巴。");
         outputText("[pg]你刚撑起身子，还没来得及离开她的脸几寸远，她就从嘴里伸出那条灵活的长舌，把你身上残留的体液全都舔干净，最后还舔了舔你的[vagina]，在那里轻轻吻了一下。她脸上的体液已经顺着下巴流到脖子上，甚至还有一些滴到了她坐起身时露出的胸口。");
         outputText("[pg]在这样一场激烈的欢爱之后，你在她床上舒展开身体平复气息，看见她正舔着自己，还带着笑。你问她在做什么，但她等到舔完才回答，[say: 清理自己呀，笨蛋。我总不能就这样浑身沾着……那些东西到处走吧？]你说这倒也没错，不过只是清理的话，她笑得也太开心了点。[say: 嗯……]她有些不自在地扭了扭身子。[say: 我确实得承认，那个味道倒也没让我讨厌。]说完最后一句，她咯咯笑了起来，在你身边躺下。你以为她会凑过来抱住你，结果她却伸手捏住你的一颗乳头。[say: 不过那个真的很疼！我是说，你捏了一会儿之后我确实也有点喜欢，但你还是该先提醒我一下！它们接下来肯定要酸疼好一阵子了……]她说疼大概是真的，但她说最后一句时还用双手把自己的乳房挤在一起，把乳头在你脸前晃来晃去，你可不觉得她有多生气。你告诉她下次会提前提醒，然后伸手抱住她，她也随即抱住了你。");
         outputText("[pg]短暂依偎了一会儿后，你告诉她你得离开了，继续回去完成你的任务。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianEggingEvent() : void
      {
         var color5:String;
         var _g5:ArianScene;
         var color4:String;
         var _g4:ArianScene;
         var color3:String;
         var _g3:ArianScene;
         var color2:String;
         var _g2:ArianScene;
         var color1:String;
         var _g1:ArianScene;
         var color:String;
         var _g:ArianScene;
         var _loc1_:* = null as IMap;
         arianSprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,953,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,952) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,952,FlagDict_Impl_.arrayReadInt(_loc1_,952) + 1);
            outputText("当你正要进入阿瑞安的帐篷时，听见里面传来一声呻吟。不过那并不是愉悦的呻吟，而是不适的呻吟。你担心这个蜥蜴人是不是出了什么事，便决定走进[Arian eir]帐篷。");
            outputText("[pg]阿瑞安赤身裸体地躺在[Arian eir]床上，[Arian ey]缓慢地打圈抚摸着[Arian eir]肚子。你冲到[Arian eir]身边问发生了什么事？");
            outputText("[pg][say:呃？哦，你好，[name]。只是有点不舒服而已。]阿瑞安有些尴尬地笑了笑，又补充道：[say:你知道……就是那个时候……女孩子嘛……你懂的。][Arian Ey]咯咯笑了起来。");
            outputText("[pg]你松了口气，有那么一瞬间，你还以为[Arian eir]的健康问题又复发了。所以……这意思是[Arian ey]体内正在孕育一窝蛋？");
            outputText("[pg]阿瑞安点点头表示确认。[say: 没错。蜥蜴人雌性体内会长出未受精的蛋，而且每30天就必须产下一次。今天正好轮到我了。这个时候，雄性通常会……让蛋受精……然后雌性就会产下一窝受精蛋。]");
            outputText("[pg]你认真听着，随后突然想到一个问题。如果蜥蜴人一次产一窝蛋，难道不会数量过剩吗？还是说每一窝其实都特别少？");
            outputText("[pg]阿瑞安摇了摇[Arian eir]头。[say: 不。通常我们一窝会产10枚左右的蛋，但就算所有蛋都受精了，也不是每一枚都能发育成健康的宝宝。一般只有一个，或者两三个能顺利成熟。]你说，听起来有点让人难过。阿瑞安笑了笑，耸耸肩。[say: 我们的身体就是这样构造的……]");
            outputText("[pg]你问是不是任何人都能让[Arian eir]的蛋受精。阿瑞安有些坐立不安，咬了咬[Arian eir]下唇。[say: 嗯……是的。你为什么这么问？你是不是……也许……有兴趣？]你想了想……然后告诉[Arian em]你只是好奇，不过谁知道呢……也许以后会吧。");
            outputText("[pg]阿瑞安移开[Arian eir]视线，开心地笑着。[say: 也许吧，不过我得说，这和我想象中自己组建家庭的方式不太一样。我一直以为自己会是帮别人产下……你懂的吧？]你点点头，问这会不会让[Arian em]不舒服。阿瑞安摇了摇[Arian eir]头。[say: 一点也不会。如果真要我选一个人来当我孩子的父亲，那肯定会是你，[name]。][Arian Ey]对你微笑，你也对[Arian em]回以微笑。");
            outputText("[pg]所以……除非你打算和[Arian em]组建家庭……不然做爱就免谈了。阿瑞安突然脱口而出：[say: 不！]你被[Arian eir]突如其来的爆发吓得往后一缩；[Arian ey]捂住[Arian eir]嘴，紧张地笑了笑。[say: 对、对不起……大概是荷尔蒙让我有点情绪化……总之……不是那样。我在自己身上施了一个附魔，除非我们把它解除，否则你没法让我怀上。所以……等哪天我们都准备好了，也都愿意的时候……嘿嘿。][Arian Ey]有些坐立不安，紧张地笑着。");
            outputText("[pg]你告诉[Arian em]，听到[Arian ey]在这件事上这么谨慎，你就放心多了。");
            outputText("[pg][say: 当然，成为父母可是很大的责任，]阿瑞安说道。");
            outputText("[pg]你点了点头。然后，你好奇地问[Arian ey]，如果蛋里面什么都没有，[Arian ey]生下它们后打算怎么处理？");
            outputText("[pg][say: 通常我们会直接吃掉，因为它们富含蛋白质，对母体的健康也有好处。不过我想我可以试着给你做点有用的东西。你知道那些据说有变身效果的彩色魔法蛋吧？我可以试着用我的魔法，按照你选的颜色培育出几枚蛋。]");
            outputText("[pg]你告诉[Arian em]，那对你的任务会很有帮助，但你不希望[Arian em]勉强[Arian em]自己；[Arian ey]能在不伤到[Arian em]自己的情况下做到吗？");
            outputText("[pg]阿瑞安骄傲地挺起[Arian eir]胸膛。[say: 我当然能！虽然魔法有时候会难以预料，但我可是大法师，只是给自己的蛋注入魔力这么简单的事，完全不成问题……不过我还是很感谢你的关心。][Arian Ey]对你微笑。");
            outputText("[pg]如果是这样的话，你告诉[Arian em]，那要是[Arian ey]能试着用[Arian eir]未受精的蛋为你制作彩色蛋，你会很感激的。");
            outputText("[pg][say: 当然！你想要什么颜色？]");
         }
         else
         {
            outputText("你正要走进阿瑞安的帐篷，忽然听见里面传来一声呻吟。看来又到每个月的那个时候了……");
            outputText("[pg]你走进帐篷，映入眼帘的是阿瑞安正赤裸地躺在[Arian eir]床上，用缓慢的圆周动作揉着[Arian eir]肚子。[Arian Ey]看到你朝[Arian em]走来，便微笑着向你打招呼。[say: 你好，[name]。我体内又长出一窝新的蛋了，你想让我试着给你做一枚彩色蛋吗？]");
         }
         menu();
         _g = this;
         color = "brown";
         addButton(0,"棕色",function():void
         {
            _g.pickAnEggArian(color);
         });
         _g1 = this;
         color1 = "purple";
         addButton(1,"紫色",function():void
         {
            _g1.pickAnEggArian(color1);
         });
         _g2 = this;
         color2 = "blue";
         addButton(2,"蓝色",function():void
         {
            _g2.pickAnEggArian(color2);
         });
         _g3 = this;
         color3 = "pink";
         addButton(3,"粉红色",function():void
         {
            _g3.pickAnEggArian(color3);
         });
         _g4 = this;
         color4 = "white";
         addButton(4,"白色",function():void
         {
            _g4.pickAnEggArian(color4);
         });
         _g5 = this;
         color5 = "rubbery black";
         addButton(5,"橡胶",function():void
         {
            _g5.pickAnEggArian(color5);
         });
         addButton(6,"不用了",leaveEggs);
      }
      
      public function arianDocking() : void
      {
         arianSprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-home-docking");
         }
         else
         {
            get_images().showImage("arianmale-home-docking");
         }
         outputText("你把目光落在阿瑞安的生殖裂口上，然后对[Arian em]笑了笑。你问[Arian ey]，比起把[Arian eirs]的藏起来，把你的肉棒“藏”进[Arian eir]的裂口里会是什么感觉？");
         outputText("[pg]阿瑞安微微颤了一下。[say: 那……我觉得感觉可能会有点怪，但在某些蜥蜴人伴侣之间也不是没有这种事。你要是想试试，我没意见。]");
         outputText("[pg]你告诉[Arian em]，没错，你就是想试试——抱歉，可这听起来实在太变态了；而且，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
         {
            outputText("[Arian ey]不是一直想有两根肉棒吗？好吧，现在就是[Arian eir]亲自体验那种感觉的机会了。");
         }
         else
         {
            outputText("[Arian ey]里面本来就已经藏着两根了……再多一根肉棒也不会差太多，对吧？");
         }
         outputText("[pg][say: 你说得也对。那好吧，我们试试。]阿瑞安仰躺下来，分开[Arian eir]的双腿，让你能碰到[Arian eir]的生殖裂口，同时轻轻抚摸着那几道柔软的褶皱，正是它们藏着[Arian eir]那");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("一对");
         }
         outputText("阴茎");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，不让你窥见。");
         outputText("[pg]你轻轻推开[Arian eir]的手，用手指抚过那奇特而几乎像女性般的褶皱，摩挲着那片柔软光滑的" + (get_noFur() ? "皮肤" : "覆盖着[Arian em]那里的鳞片") + "。你温柔地按摩着[Arian em]，让[Arian em]在刺激下轻轻呻吟起来，随后才鼓起勇气，开始小心地向里面探去。里面湿润而滑腻，肌肉紧紧夹住你的手指，而你不需要探得太深，很快就感觉到自己碰到了那鼓胀、再明显不过的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("阿瑞安阴茎的轮廓");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("。你用手指蹭过顶端");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("，想看看你这位覆鳞爱人会有什么反应。");
         outputText("[pg]阿瑞安呻吟了一声。[say: 嗯，如果你再这样下去，我就没法为你把它憋在里面了。]");
         outputText("[pg]你告诉[Arian em]，那可太可惜了，然后轻轻抽回手指。阿瑞安失望地呜咽了一声。[say: 啊——我倒是不介意改成用手帮我。][Arian Ey]朝你露出调皮的笑容。");
         outputText("[pg]那可不行，你告诉[Arian em]；你一开始想的就是更特别的玩法，而且你打算把它做完。你飞快地撸了几下自己的[cock smallest]，好让它进入状态，接着把它对准阿瑞安的肉棒裂缝，双臂环住[Arian eir]脖子保持平衡，开始向前压去，将它轻轻送进那名副其实的男孩子小穴里。");
         outputText("[pg]里面紧得不可思议，也比[Arian em]身体其他地方更温暖——至于原因，你现在根本懒得去想——而且满是润滑的体液，滑溜溜的。感觉如此怪异，却又火热得要命……而当你的[cock smallest]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) == 0)
         {
            outputText("蹭上[Arian eir]自己的蜥蜴人肉棒");
         }
         else
         {
            outputText("被夹在[Arian eir]两根蜥蜴肉棒之间");
         }
         outputText("时，那摩擦感简直不可思议，快感像火花一样沿着你的肉茎一路炸开。你在甜美的欲火中呻吟，告诉阿瑞安这感觉实在太棒了。");
         outputText("[pg]阿瑞安的表情有些难以解读；你能看出这名蜥蜴人脸上明显带着不适，但与此同时，[Arian ey]又兴奋地喘息着。[say: 呃，感觉被塞得好满……但也很舒服。你的肉棒在蹭我的……试、试着动动腰。]");
         outputText("[pg]你把环在[Arian eir]脖子上的手臂移到[Arian eir]腰间，照[Arian ey]说的做：先把腰往后撤，再向前挺入，就像真要操进一个小穴里一样。随着你的动作，[Arian eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("双根肉棒");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("湿滑、疙疙瘩瘩又鼓胀成球的表面擦过你闯入的肉茎，[Arian eir]的鞘壁也竭尽所能地夹紧、挤压，弄得你像发情的母狗一样呻吟喘息。阿瑞安愉悦的呻吟也与顶上你的声音，[Arian eir]那抽搐着、鼓胀成球的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("几乎像阴道一样按摩着你的[cock smallest]。颤抖的双手抓住你的肩膀，帮你在阿瑞安的雄性裂缝上上下起伏。[say: 啊，玛莱啊！感觉就像在体内被人撸一样……好舒——服……太舒服了！用、用力点……快射了！][Arian ey]恳求着，炽热的气息喷在你脸上；喘得像发情的母狗一样。");
         outputText("[pg]不行，你喘着回应，除非你先射出来……带着这句近乎绝望的承诺（警告？恳求？谁在乎呢？），你又像活塞一样来回抽插了四次，随后仰头对着天花板嚎叫，在阿瑞安临时凑成的阴道里射了出来。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]即便你的精液量本来并不算多，阿瑞安狭窄的生殖裂缝里空间也实在有限，你很快就发现那道小缝已经被灌得满溢出来。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你的精液量足以让雌性的肚子微微鼓起，但相比之下，阿瑞安的裂缝太浅了，这意味着你的精液几乎是从[Arian eir]被灌满的缝隙里喷涌而出。");
         }
         else
         {
            outputText("[pg]你惊人的精液量实在太庞大，连地精都别想把它全部含在体内。所以也难怪只是一股精液，就足以让阿瑞安那道小缝因回流而喷发，淫荡的白色喷泉将你的肚子和阿瑞安的身体一并涂满。");
         }
         outputText("[pg]精疲力竭的你瘫倒在这名蜥蜴人的[Arian chest]上。阿瑞安急切地用恳求的眼神看着你，无力地推着你的肩膀。[say: 拔、拔出来，求你了！]");
         outputText("[pg]你问[Arian em]怎么了，仍沉浸在射精的余韵里，没能立刻听从[Arian em]的话。[say: 要……射了……没地方了！][Arian ey]呻吟着说道。意识到问题所在后，你赶紧照做——你可不想把[Arian em]撑爆！你从[Arian eir]的肉棒裂缝里抽出自己沾满精液的肉茎，等着看[Arian ey]能不能在射精前把[Arian eir]自己的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("");
         }
         outputText("在射出来之前伸出来。");
         outputText("[pg]一小股白浊从[Arian eir]灌满精液的肉缝里喷出时，阿瑞安如释重负地呻吟起来，把[Arian eir]" + (get_noFur() ? "苍白皮肤" : "白色鳞片") + "都浸在你们混合的精液里。接着，一");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("对沾满精液的肉柱探了出来");
         }
         else
         {
            outputText("根沾满精液的肉柱探了出来");
         }
         outputText("，虚弱地又射出几股精液，然后无力地缩回");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
         {
            outputText("它们的");
         }
         else
         {
            outputText("它的");
         }
         outputText("藏身处。[say:啊啊……]阿瑞安只说了这么一句，便瘫倒下去。");
         outputText("[pg]你友好地拍了拍[Arian em]的肩膀，脸上挂着坏笑，问[Arian ey]是不是也很享受。");
         outputText("[pg]阿瑞安叹了口气，看向你。[say:感觉很好。很奇怪……但确实很好。不过，我还从没觉得蛋蛋这么胀过；要是你没及时拔出去，我可能真要被撑爆了。][Arian Ey]疲惫地笑了笑。");
         outputText("[pg]你把[Arian em]拉进一个深吻里，紧紧抱住[Arian em]，吻到[Arian eir]喘不过气来才放开。你歪了歪头，轻轻抚摸着[Arian eir]的脸，告诉[Arian em]你很高兴[Arian ey]没受伤。毕竟，你还需要你的小膝上蜥蜴保持最佳状态呢。");
         outputText("[pg]阿瑞安冲你露出一个迷人的笑容。[say:我很好奇是为什么呢，][Arian ey]一边说，一边揉着[Arian eir]被用过的肉缝。");
         outputText("[pg]你告诉[Arian em]，做爱当然很不错，但[Arian eir]身上还有其他优点。然后，在[Arian ey]来得及追问之前，你又吻住了[Arian em]。趁[Arian ey]还沉浸在性爱过后的晕乎和傻笑里，你悄悄从[Arian eir]床上下来，重新穿好衣服，溜了出去，临走前还给[Arian em]送了个飞吻。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianDoIt() : void
      {
         outputText("[pg]花上几天就能免费解除附魔，对你来说听起来再合适不过了。阿瑞安灿烂地笑了笑，说道，[say:能帮上你的忙，我一直都很高兴。]");
         get_player().destroyItems(get_undergarments().SEA_SHIRT,1);
         get_undergarments().SEA_SHIRT.saveContent.arianDisenchant = true;
         get_undergarments().SEA_SHIRT.saveContent.arianDisenchantDay = get_time().days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianDildoFun() : void
      {
         arianSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,983) == 0)
         {
            outputText("你打量着你的爬虫类女友，目光沿着[Arian eir]的身体向下");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
            {
               outputText("，掠过[Arian eir]的肉棒");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
               {
                  outputText("");
               }
            }
            else
            {
               outputText("，");
            }
            outputText("来到[Arian eir]湿漉漉的小穴前，那里显然正渴望着来点刺激。想到你自己的小穴也有同样的感觉，你决定试试有趣的玩法，于是把那根你");
            if(get_player().hasKeyItem("Dildo"))
            {
               outputText("从贾科莫那里买来的");
            }
            else
            {
               outputText("从塔玛尼那里得到的");
            }
            outputText("假阳具拿给阿瑞安看，问[Arian ey]愿不愿意试试看。");
            outputText("[pg]蜥蜴人难为情地移开[Arian eir]的视线。[say:呃……我想应该可以吧？][Arian Ey]有些坐立不安。[say:不过我以前从没在……那种时候用过什么东西，更别说这种了。]");
            outputText("[pg]你温柔地安抚[Arian em]，向[Arian em]保证一切都会没事；你会在这里帮[Arian em]适应它，也会教[Arian em]怎么正确使用。再说，这可比[Arian eir]的手指好用多了……");
            outputText("[pg][say:那、那好吧。][Arian Ey]紧张地笑了笑。");
         }
         else
         {
            outputText("你再次把假阳具拿给阿瑞安看，告诉[Arian em]这一次你想玩玩你的玩具——毕竟[Arian ey]第一次可是那么喜欢。");
            outputText("[pg]阿瑞安难为情地扭捏了一下。[say:好吧。]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,983,FlagDict_Impl_.arrayReadInt(_loc1_,983) + 1);
         outputText("[pg]你小心地把假阳具放在枕头旁边，然后转向阿瑞安，将[Arian em]拉进怀里，双臂环住[Arian eir]的腰。接着你让[Arian em]转过身，把[Arian em]一把抱离地面，再将[Arian em]平放到床上。你跨坐到[Arian em]身上，把[Arian eir]的手腕按在[Arian eir]头旁的床铺上，让[Arian em]动弹不得，[Arian Ey]紧张地咯咯笑了起来。你的舌头从唇间滑出，带着下流的暗示，随后你低下头，先吻上[Arian eir]一侧深色的乳头，再吻上另一侧。你开始沿着[Arian eir]的躯干向上，一路朝[Arian eir]的脖颈落下短促、柔软而轻柔的吻，认真地一路吻向[Arian eir]的双唇，阿瑞安在你身下扭动着、挣扎着。到了那里，你在[Arian eir]唇上落下轻若蝶翼的一吻，但这还不够；你松开[Arian eir]的手腕，改用一只柔和却不容抗拒的手掌按住[Arian eir]两边脸颊，将[Arian em]固定在原处，然后用自己的双唇热烈地吞吻住[Arian eir]的唇。");
         outputText("[pg]你的蜥蜴人爱人回应着你的吻，[Arian eir]覆鳞的双臂环住你，将你紧紧抱住，双腿也本能地分开，任你进入。你继续吮吻[Arian eir]的双唇，用舌头强势地试探，看看[Arian ey]是否会让你深入。与此同时，你也更舒服地伏在[Arian eir]身上，将一只手沿着[Arian eir]的躯干滑下，抚过[Arian eir]的腹部，直到探到[Arian eir]的双腿之间。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("你没有理会[Arian eir]的肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("，你");
         }
         else
         {
            outputText("你");
         }
         outputText("先将一根手指滑进[Arian eir]湿滑的小穴，接着又伸入第二根，轻柔地抚弄[Arian eir]内侧阴唇，试着找出[Arian eir]的敏感点。第一阵快感袭来时，阿瑞安惊讶地睁开眼睛，[Arian ey]在你的亲吻中低声呻吟。[Arian Eir]舌头兴奋地探出，与你的舌头共舞。");
         outputText("[pg]你任由[Arian eir]舌头与你纠缠，淫靡地吮吸着它，看着阿瑞安在你身下扭动呻吟，完全沉溺在你的掌控之中。不过，热身也该到此为止了；你中断亲吻，将手从[Arian eir]小穴里抽出。阿瑞安虚弱地抗议着，但你轻声让[Arian em]安静下来，一边抚摸[Arian eir]脸颊，一边宣告热身时间已经结束。你用另一只手拿起旁边的假阳具，随后把它拍在[Arian eir][Arian chest]之间。现在该让[Arian ey]为你表演点什么了……");
         outputText("[pg]蜥蜴人法师紧张地咽了口唾沫，但还是会意地点点头。你因[Arian em]如此听话而给了[Arian em]最后一个吻，顺手捏了捏[Arian eir]乳房，然后从[Arian em]身上挪开，故意让你的[vagina]擦过[Arian eir]腹部，愉悦地颤抖起来" + (get_noFur() ? "" : "，因为[Arian eir]光滑鳞片的触感一路传入你的小穴") + "。你跳下床，重新坐到床尾，挺直身子占了个绝佳位置，正好能欣赏[Arian ey]接下来打算做的一切。");
         outputText("[pg]阿瑞安将假阳具拿在手里，反复握紧又松开，看着橡胶在[Arian eir]触碰下变形。[Arian Ey]又紧张地看了你一眼，然后张大[Arian eir]嘴。[Arian Ey]把假阳具送入[Arian eir]唇间，轻轻吮吸，用[Arian eir]唾液将它濡湿。不错，对于初学者来说相当不错。你点点头，鼓励[Arian em]说[Arian ey]开了个好头。阿瑞安会意地眨眨眼，继续用唾液涂满那根橡胶棒。");
         outputText("[pg]觉得湿润程度差不多后，她把假阳具从[Arian eir]嘴里吐了出来。[Arian ey]一手托住乳房，用假阳具顶端摩擦[Arian eir]挺立的乳头，在刺激下低声呻吟。[Arian Eir]眼睛瞥向你，想确认[Arian ey]是否取悦了你。你调整姿势，好让[Arian ey]看清你赤裸的身体，让[Arian em]看着你的双手挑逗地滑向小穴入口。你轻轻呻吟，被[Arian ey]的表演挑起兴致，开始抚弄自己。受到你这番表现的鼓舞，阿瑞安微微一笑，再次舔了舔假阳具的顶端。[Arian Ey]一边抚弄[Arian eir]另一边乳头，一边发出呻吟，把假阳具夹在[Arian eir]乳房之间，让它沿着[Arian eir]乳沟上下滑动。每当假阳具变干，[Arian ey]就把它重新送回[Arian eir]嘴里，拖着长长的吮吸声再次涂满唾液。你注意到，[Arian Ey]已经开始进入状态了。");
         outputText("[pg]你忽然拍了拍手，把正沉浸在口交式挑逗中的阿瑞安吓了一跳。你动作流畅而诱人地爬向[Arian em]，从[Arian eir]毫不抗拒的手指间轻轻拿走假阳具，同时将自己缠到[Arian em]身边。你贴着[Arian em]用舞台耳语般的声音说，[Arian Ey]刚才的表演很不错，不过这其实不是你真正想看的。你要帮[Arian em]一把，让[Arian em]知道这事到底能有多爽……");
         outputText("[pg]你先魅惑地用自己的舌头缠住假阳具，湿漉漉地亲吻它、吮吸它，热切品尝着[Arian eir]唾液的味道，同时确保它被你们混合的津液彻底浸透。然后，你把滴着水的玩具举到[Arian em]面前，让[Arian eir]仔细看看。[Arian Ey]迷醉地盯着那根假阳具，兴奋地喘息着。等[Arian ey]已经被充分挑起情欲后，你才将假阳具移向[Arian eir]双腿交汇处，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("撩人地擦过[Arian eir]那些已经渗出液体的敏感鸡巴");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("");
            }
            outputText("，然后");
         }
         outputText("蹭上[Arian eir]外侧阴唇，沿着每片阴唇上下摩擦，又压在[Arian eir]阴蒂上揉弄，轻轻将顶端抵入[Arian eir]小穴，却又在它真正撑开[Arian eir]小穴之前抽了出来。");
         outputText("[pg]你玩弄着[Arian eir]身体时，阿瑞安呻吟着扭来扭去，被橡胶假阳具带来的摩擦弄得喘息连连。[say:哦，[name]。这、这感觉太棒了！][Arian ey]愉悦地呻吟着，主动朝假阳具挺动，试图寻求更深的接触。");
         outputText("[pg]你问[Arian em]，既然感觉这么好，那[Arian ey]为什么不证明给你看？你继续用假阳具挑逗[Arian em]，却就是不肯插进去，空着的那只手则兴奋地抚弄着你的[clit]，手指不断抽插你的[vagina]。难道[Arian ey]不已经渴望到快疯了吗？想让这根假鸡巴夹在[Arian eir]双腿之间，把[Arian eir]小穴撑得大开，把[Arian eir]体内顶得满满当当，直到[Arian ey]变成一摊任人摆布的欲望烂泥？那[Arian ey]为什么不向你展示一下，这就是[Arian ey]想要的呢？");
         outputText("[pg]阿瑞安困惑地看着你。[say:证明？……啊！][Arian ey]大声呻吟起来，在你的挑逗下疯狂挺动。对，就是证明……说着，你牢牢握住假阳具，粗暴地将它尽可能深地捅进阿瑞安的小穴，直到这只发情的蜥蜴人再也容纳不下！这个" + arianMF("","雌性") + "蜥蜴人的大嘴惊讶地张开；可[Arian ey]没能尖叫出来，只发出一声倒抽气。你确保将这一瞬间牢牢记在脑海里。阿瑞安闭上[Arian eir]眼睛，发出低沉的呻吟——那是充满快感的呻吟。[Arian Eir]脸庞扭曲起来，[Arian eir]阴道内壁紧紧夹住了这个橡胶入侵者。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 0)
         {
            outputText("[Arian Eir]鸡巴");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0)
            {
               outputText("一阵阵抽动");
            }
            else
            {
               outputText("抽动起来");
            }
            outputText("抽动着，喷出一股白浊。");
         }
         outputText("你能感觉到……你这突如其来的插入，让可怜的蜥蜴人法师瞬间高潮了。");
         outputText("[pg]你坏笑着伏在你的爬虫类女友身上，饥渴地亲吻[Arian em]，把[Arian eir]又长又灵活的舌头吸进嘴里玩弄——也顺便堵住[Arian eir]接下来可能发出的销魂尖叫。你一只手揉捏着[Arian eir][Arian chestAdj]乳房，另一只手则继续把假阳具在[Arian em]体内来回抽插，先把它往外抽——这可不容易，因为[Arian ey]的小穴把它夹得太紧了——再粗暴地狠狠顶回去，如此反复，像是要一路钻向[Arian eir]的子宫口，把[Arian eir]弄成在你身下颤抖不止的一摊。可怜的蜥蜴人根本无力抵抗你无情的攻势。阿瑞安所能做的，只有愉悦的尖叫和放荡而饥渴的呻吟。");
         outputText("[pg]你就这样持续了好一阵，每一分钟都令人愉悦不已，直到你觉得[Arian ey]已经享受够了；现在该轮到你了。你试着把假阳具从[Arian eir]紧夹的小穴里拽出来，可[Arian ey]只是浑身发颤、呻吟不止，又一次高潮撕裂般席卷了[Arian eir]的身体——[Arian ey]把玩具在[Arian eir]体内夹得太紧，你根本拔不出来！你松开手，拍了拍[Arian eir]的脸颊，故意抱怨[Arian ey]这样可不公平。");
         outputText("[pg]阿瑞安呻吟着，微微睁开[Arian eir]眼睛看向你。[say:你、你这话……是什么意思？][Arian ey]问道，显然还没从[Arian eir]的高潮中缓过来。");
         outputText("[pg]你回答说，这还用问吗，[Arian ey]把假阳具全霸占给[Arian em]自己用了，还顺势又试着拔了一下，以强调你的话。享受的是[Arian Ey]，可你自己一点乐子都没有——这样对[Arian em]来说公平吗？嗯？阿瑞安喘息着，摇了摇[Arian eir]头。[say:对不起……][Arian Ey]努力平稳[Arian eir]的呼吸，好歹让自己能正常说话。");
         outputText("[pg][say:对不起，[name]。我觉得你现在还不能把假阳具从我里面拔出来。那样会……呃……对我来说太刺激了。所以拜托你，至少现在不要。]你稍微从[Arian em]身上爬开些，好让[Arian ey]能更自由地活动，也方便你看[Arian em]怎么做。[say:不过我想我能帮你解决你的问题。]你来了兴趣，示意[Arian em]继续。[Arian Ey]开始吟唱咒语，片刻之后，你便饶有兴致地看见你的假阳具底部开始自行延伸，长成了一个熟悉的阳具形状。很快，你眼前就出现了一根一模一样的复制品，而原来的那根仍深埋在你的蜥蜴人女友体内。真是个聪明的女孩……");
         outputText("[pg]阿瑞安疲惫地笑了笑。[say:好了。原谅我，[name]，我现在累得动不了了。]没关系，你可以替[Arian em]动，你回答道，同时已经开始调整姿势，让你的[vagina]对准那根如今变成双头的假阳具，准备把自己套上去。");
         outputText("[pg]你扭动着、摆动着，淫荡地呻吟起来，摩擦着每一处你知道能带来快感的地方；在这般兴奋的状态下，你很容易就沉浸其中。你的每一次挺动都会让你的女友发出销魂的呻吟，因为那也牵动着[Arian eir]过度兴奋的小穴里的假阳具。你挺动、研磨、夹紧，你和阿瑞安的两处私处像拔河一样争夺着你最心爱的玩具。你能感觉到快感正将你淹没，欲火的火花在脑中炸开；你快到了……哦，诸神啊，你真的快到了！");
         outputText("[pg]伴随着一次用力的夹紧和拉扯，你把假阳具从阿瑞安的爱穴里拔了出来，同时仰起头大声叫喊着迎来高潮。高潮的浪潮冲刷过你，令你全身都在快感中颤抖。当一切终于结束时，你松了口气，浑身无力地倒回床上，小穴也随之放松，让假阳具滑落出来。");
         outputText("[pg]等你喘过气来，你漫不经心地伸手拿起最爱的玩具，举到面前，看着它慢慢变回原本的形态，尽管上面仍滴淌着你们混合的体液。你坦然地笑着告诉阿瑞安，能拥有[Arian em]这样的" + arianMF("herm-boy","girl") + "朋友，你大概就是玛瑞斯最幸运的[boy]了。");
         outputText("[pg]阿瑞安喘着气，仍有些上气不接下气，不过[Arian eir]的呼吸似乎已经恢复到了更正常的节奏。听到你的夸奖，[Arian Ey]忍不住咧嘴笑了。[say:别傻了，[name]。幸运的是我才对。不过你这么看重我，我真的很高兴。]你有什么理由不这么想呢？[Arian Ey]为了更好地取悦你，连[Arian eir]出生时的性别都舍弃了——任何错过把阿瑞安这么可爱的人抢到手的女孩都是傻瓜，而她们再也没机会弥补这个错误了，因为[Arian ey]现在完全属于你。说完，你在床上挪动身体，扑进你的" + arianMF("herm-boy","girl") + "朋友怀里，用你的[skinfurscales]脸颊蹭着[Arian eir]光滑的鳞片，把[Arian eir]紧紧抱在怀中。");
         outputText("[pg]阿瑞安也亲昵地回蹭着你。[say:我爱你，[name]。]你只是抱着[Arian em]，让[Arian em]感受你的温暖。接着，你才意识到自己一只手里还握着一根湿漉漉的假阳具，便随手把它递到阿瑞安面前，举在[Arian eir]脸前，命令[Arian em]把它清理干净。还没等[Arian ey]抗议，你就指出，<b>[Arian ey]</b>从中得到了最多的乐趣，<b>[Arian ey]</b>也弄出了最多的污迹，所以把它清理干净自然是<b>[Arian em]</b>的责任。你把它在[Arian eir]" + (get_noFur() ? "脸" : "吻部") + "前晃了晃，以示强调。");
         outputText("[pg]阿瑞安听了你的话眨了眨眼，但还是笑着答应了。[say:当然。][Arian Ey]张开[Arian eir]的嘴，让[Arian eir]的舌头垂卷出来，邀请你把假阳具放进[Arian eir]张开的口中。你立刻把这根假阳具轻轻送了进去，让[Arian em]按[Arian eir]自己的节奏开始。");
         outputText("[pg]她清理得很认真，而且从样子看来，[Arian ey]自己也享受得不得了。阿瑞安大多数时候都闭着眼睛，但你注意到[Arian ey]会睁眼瞥你一下，然后自顾自地微笑。[Arian eir]脑子里正在想的事一定非常愉快。只过了几分钟，你就把假阳具抽出来检查。蜥蜴人的唾液在周围的光线下闪闪发亮，而就你所见……假阳具上已经没有半点你或阿瑞安体液的痕迹了。你微笑着拍了拍你的蜥蜴人的头，夸奖[Arian em]干得漂亮。");
         outputText("[pg][say:谢谢，不过我还没做完。]你看着[Arian em]，想知道[Arian ey]打算做什么。阿瑞安沿着你的身体游移，直到[Arian eir]的脸悬在你的[vagina]上方。你唇边浮现出心照不宣的笑意，放松下来，期待着让[Arian em]开始工作。[Arian Ey]轻轻分开你的双腿，开始舔舐，确保把你的体液全都舔入口中。");
         outputText("[pg]你倒抽一口气，浑身轻颤，随着[Arian ey]取悦你那过度敏感的爱液通道而轻声呻吟。没过多久，也许只是一两分钟，你就在一次小高潮中扭动起来，女性的体液涌入你爱人渴求的口中，浸润着[Arian eir]探入其中的舌头。[Arian Ey]确保把它们全都舔干净，完全不想浪费哪怕一滴。[say:嗯，真美味。]阿瑞安一边说，一边舔净[Arian eir]唇上残留的痕迹。");
         outputText("[pg]你满足地长叹一声，强势地把你的小蜥蜴人荡妇拖进怀里，将[Arian em]抱住依偎，明明白白地表示你短时间内完全不打算让[Arian em]去任何地方。幸运的是，[Arian ey]似乎也很乐意待在这里，于是你闭上眼睛，任由自己慢慢睡去。不过，在彻底陷入沉睡之前，你把一只温柔的手放在阿瑞安的小穴上，轻轻抚摸[Arian em]——不是为了再次挑起[Arian em]的情欲，只是想让[Arian em]在那里感受到充满爱意的触碰，在那个给你们双方都带来如此多快乐的地方……");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianDialogue3() : void
      {
         clearOutput();
         arianHealth(1);
         arianSprite();
         outputText("你还没来得及开口，阿瑞安就问你：[say: [name]，我一直在想……你对魔法有兴趣吗？你为我做了这么多，我觉得自己也该想办法回报你。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,943,FlagDict_Impl_.arrayReadInt(_loc1_,943) + 1);
         menu();
         addButton(0,"是",yesArianShouldMagicTeach);
         addButton(1,"否",noArianShouldntMagicTeach);
      }
      
      public function arianCunnilingusTonguefuck() : void
      {
         clearOutput();
         arianSprite();
         outputText("你大声告诉她，你要全部感受个遍，要她用能给出的一切填满你饥渴的小穴。[say: 遵命，女士！]她顺从地应道，同时把自己贴向你，舌头很快探进你湿透的小穴。然后更深。更深。更深。直到你感觉它顶上了你的宫颈，让你在痛楚与快感中叫出了声。接着你感觉她的舌头变得越来越粗，越来越粗。你这才意识到，它并不是在变粗，而是正一层层折叠起来。它长得足以把你的身体从里到外塞满好几遍。");
         outputText("[pg]最后，她的舌头完全伸展开来，你的[vagina]也被彻底撑开。它抵着你的宫颈，而她开始前后摆动脑袋。她折叠起来的舌头撑开你的阴道壁，每次她把头往前一顶，都重重压上你的宫颈。那感觉简直像是她在给你做一场反向口交。那根肉棒般的舌头填满你、撑开你，让你在难以承受的快感，以及恰到好处的痛楚中不受控制地呻吟起来。她变得越来越大胆，也越来越粗暴，随着脑袋的摆动，用鼻尖狠狠摩擦你的[clit]，力道大得让你再也忍不住。你淌着淫液的小穴渴望被操，而且必须被狠狠地操。你抓住她的后脑，开始挺胯操弄她的脸，用阴蒂用力碾着她的鼻子，逼着她的舌头更快、更狠地操你，尽可能把你撑开。尽管你的淫液已经从小穴里泛滥而出，但你知道，她的口水也比你见过的任何时候都要多，你的穴口被你的淫液和她的唾液混合物弄得一片湿滑。");
         get_player().cuntChange(6,true,true,false);
         outputText("[pg]你低头看向她，也注意到她显然并不是毫无收获。她整只手都在身后前后抽动，尾巴高高翘到极限，正卖力地弄着自己。从这个角度你无法确定她用了几根手指，也无法确定她是在弄自己的小穴，还是那紧致的小屁眼，但你足够了解她，知道无论是哪一种，她都享受得不得了。随着欲望和高潮的冲动越积越盛，你挺胯的动作变得近乎野兽般狂乱，几乎失去控制。感觉高潮涌上来的瞬间，你发出一声尖叫，抓住她的头，几乎是硬把她的嘴按进你身体里，那舌头顶得如此之深，让你甚至能轻易想象自己的小腹被撑出凸起。你不受控制地喷了她一脸，把她彻底淋满，此刻她整张脸都被你的雌性淫液浸得湿透，白色的鳞片在湿光中闪闪发亮。阿瑞安自己的手在高高翘起的尾巴下动得越来越快；你既听见，也感觉到她发出一声愉悦的尖叫。她明显的高潮让埋在你体内的舌头像是在震颤一般，又一次将你推向高潮，让你再度把她的脸浇湿。");
         outputText("[pg]你满足到了极点，放开她的头，身体也随之放松下来，并告诉她她干得真他妈漂亮。你这位被你用得彻底的爱人坐起身来，满脸都滴着你的淫液，然后用那条长舌把自己的整张脸舔了个遍。你暗自想着，她究竟只是想把自己舔干净，还是在尽可能多地回味你的味道。等你的淫液看起来差不多都从她脸上消失后，她开口说道：[say: [name]，这简直难以置信。太让人兴奋了。太野性了。太……]她话音渐渐低下去，随后忽然扑到你身上，一遍又一遍亲吻你的脸。你拦住她，将她拉过来，深深吻上她的嘴唇，尝到自己的淫液与她的唾液混在一起的味道，同时把她紧紧抱在怀里。");
         outputText("[pg][say: 啊——我爱你，[name]。不过我想我现在需要睡一会儿了，你刚才可真是让我卖了不少力气，]她一边说，一边打着哈欠伸了个懒腰。你在她柔软的鳞片脑袋上轻轻抚摸了好几下，然后起身穿好衣服。你告诉她，你确实很期待下一次，随后离开" + (arianFollower() ? "帐篷" : "房间") + "，让她好好睡一觉。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianCunnilingusGentle() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉她，你想看看她所谓给女孩舔弄到底是什么样。[say:当然，亲爱的。为你做什么都可以，]她说道，嘴正贴在你的女性私处上，声音因此有些含混。她在你湿透的小穴上快速亲了几下，随后用双唇几乎将你滴着淫液的小穴整个含住。她的嘴唇贴着你的性器轻轻蠕动，像是在亲吻那里，接着舌尖滑入你的体内。一开始只是舌尖，她在你体内绕着圈搅动。你抚摸着她头上柔软光滑的鳞片，告诉她继续。她急切地想取悦你，于是把更多舌头探入你体内。随着她越探越深，她舔舐着你柔软湿热的内壁，最后稳稳地将足有五英寸的舌头埋在你体内。");
         outputText("[pg]她并没有把舌头当作临时的肉棒使用，而是选择让它在你体内打转，品尝你整个女性私处的味道。她在不同位置抵压你的阴道内壁，直到碰到某个让你快感上涌、双眼睁大的地方，令你发出一声销魂的尖叫，并不由自主地紧紧夹住她。察觉自己找对了地方，她更用力地压了上去，让你的身体绷紧。她将舌尖牢牢抵在你体内，开始用它舔弄那个点。很用力。那股压力完全不亚于任何情趣玩具或肉棒，却全部集中在你的G点上。她热切又兴奋地舔舐着你的敏感点，而你注意到她也开始以惊人的劲头摩擦自己的阴蒂，让你忍不住怀疑到底是谁更享受这一切。");
         outputText("[pg]还没等你细想，你就感觉自己迅速逼近高潮。你在她身下扭动挣扎，这反而鼓励她舔得更快、压得更用力，也把自己摸得像是人生最后一次一样。你感到淫液喷涌而出，整具身体都在一次无比强烈的高潮中绷紧。她的头更用力地压向你，双唇完全锁住你的小穴，试图把你所有美味的汁液都留在口中。她的手在自己的性器上越动越快，你看见她的身体颤抖起来，舌头也更加猛烈地攻向你，两腿之间不断有液体滴落、涌出。看着她的手离开自己的性器，舌头也随着高潮退去而缩回，你心想，她似乎还真<i>可能</i>不知怎么比你更享受这件事。那名一脸满足的蜥蜴人抬起头，又在你的入口舔了几下，尽可能吞下所有能舔到的液体。她似乎怎么都尝不够你的女性体液。也许这点值得记住。");
         outputText("[pg]阿瑞安终于抬起头，嘴边一圈都因你的汁液而闪闪发亮。她换了个位置，在你身旁躺下，亲密地依偎过来。[say:哦，[name]，刚才太棒了。你的味道真是……太棒了。我没想到你会这么美味。我真的会习惯这种事的。我爱你，]她说完，舔掉脸上剩下的你的体液，灿烂地笑了起来。你伸手搂住她，深深地吻了她。你和她依偎了几分钟，随后注意到她似乎已经打起了盹，脸上仍挂着大大的笑容。你宠爱地轻拍了一下她柔软的脑袋，然后起身[if (!isnaked){，穿好衣服，}]离开她的" + (arianFollower() ? "帐篷" : "房间") + "。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianCunnilingus() : void
      {
         clearOutput();
         arianSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,942,FlagDict_Impl_.arrayReadInt(_loc1_,942) + 1);
         arianHealth(3);
         outputText("你钻进蜥蜴人爱人的床上，躺在她身旁，紧紧地抱住她。你望进她的眼睛，温柔地对她一笑，随后凑上去吻住她。你的舌头探进她口中，品尝着她甘甜的唾液，舌尖掠过她的牙齿，接着碰到了某样让你灵机一动的东西：她这个种族所拥有的那条灵活的长舌。现在，它显然可以派上大用场。");
         outputText("[pg]你稍稍退开，向你的爱人露出你所能摆出的最诱人的笑容。阿瑞安好奇地看着你，问道：[say: 啊，怎么停下来了？]你告诉她，你有个主意，想试试那条舌头究竟能做些什么。阿瑞安兴奋地看着你仰面躺下、舒展身体，用双手将自己的[vagina]完全展现在她面前。你不断流出的淫液已经清楚地说明了你的意图。她一脸期待地在床上四肢着地，缓缓舔了舔嘴唇。[say: 哦，[name]，你看起来真是美味极了！]她可爱地说着，低下头凑向你的[vagina]。");
         outputText("[pg]这名苍白的蜥蜴人一开始还带着几分挑逗。你感觉到她先舔舐起流到外面的淫液，接着又用那条灵活的舌头轻戳你的[clit]。你的身体越来越热，她像个老手一样挑逗着你的小穴，虽然你知道她所有的经验都来自于你。你短促地呻吟一声，像是在鼓励她。终于，你已经忍不住了。你的双手抓住她的后脑，把她按向自己。一开始你还很轻柔，确保她开始给你你此行真正想要的东西。你首先注意到的，是她开始轻轻吮吸你的[clit]，用那条完全受她掌控的舌头一波波地向它施加压力。舌尖在你的敏感点周围一圈又一圈地游移，很快便让原始的欲望充满你的身体。此时你的淫液已经从小穴里汩汩涌出，沾满了她白色鳞片覆盖的下巴，让那里闪闪发亮。你再次抓住她的头，用力到让她倒抽一口气。你将她的嘴牢牢按在自己小穴的入口处，向她下达命令。");
         menu();
         addButton(0,"温柔",arianCunnilingusGentle);
         addButton(1,"舌交",arianCunnilingusTonguefuck);
      }
      
      public function arianCuddle() : void
      {
         clearOutput();
         arianSprite();
         outputText("你问阿瑞安，[arian ey]有没有兴趣一起依偎一会儿。你的恋人脸上微微泛红，点头答应了。你们两人一起躺到[arian eir]的长沙发上，你当大勺，[arian em]当小勺。你轻轻搂住阿瑞安的腰，沿着[arian eir]的脖颈慢慢落下一个又一个吻。你的恋人伸展身体，让你能更方便地触碰[arian eir]敏感的肌肤。每一个轻柔的吻都让这位巫师为你发出可爱的呻吟。阿瑞安开口问道，[say: 我还以为我们只是要抱一会儿……不过我不介意……如果……如果你想让我们做点别的……]你把这名蜥蜴人的身体紧紧搂向自己，感觉阿瑞安愉悦地扭动着，同时[arian ey]说道，[say: 我爱你，[name]。]");
         outputText("[pg]你们又一起休息了一会儿，直到你意识到自己大概该走了。当你起身时，阿瑞安有些失落地问道，[say: 你已经要走了吗？没关系，[name]，我明白。希望我们很快还能再抱在一起。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function arianCockSize() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) <= 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) > 3)
         {
            return 0;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 1)
         {
            return 9;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) == 2)
         {
            return 16;
         }
         return 36;
      }
      
      public function arianChestAdjective() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = Utils.rand(10);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 0)
         {
            return "";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 1)
         {
            if(_loc2_ <= 4)
            {
               _loc1_ += "小巧的";
            }
            else if(_loc2_ <= 6)
            {
               _loc1_ += "娇小的";
            }
            else if(_loc2_ <= 8)
            {
               _loc1_ += "挺翘的";
            }
            else
            {
               _loc1_ += "一手可握的";
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 2)
         {
            if(_loc2_ <= 3)
            {
               _loc1_ += "饱满的";
            }
            else if(_loc2_ <= 5)
            {
               _loc1_ += "盈手可握的";
            }
            else if(_loc2_ <= 7)
            {
               _loc1_ += "富有弹性的";
            }
            else
            {
               _loc1_ += "曲线优美的";
            }
         }
         else if(_loc2_ <= 3)
         {
            _loc1_ += "硕大的";
         }
         else if(_loc2_ <= 5)
         {
            _loc1_ += "丰满诱人的";
         }
         else if(_loc2_ <= 6)
         {
            _loc1_ += "颤巍巍的";
         }
         else if(_loc2_ <= 7)
         {
            _loc1_ += "几乎撑破胸罩的";
         }
         else if(_loc2_ <= 8)
         {
            _loc1_ += "丰盈的";
         }
         else
         {
            _loc1_ += "巨大的";
         }
         return _loc1_;
      }
      
      public function arianChest() : String
      {
         var _loc1_:String = "";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) == 0)
         {
            return "胸部";
         }
         if(Utils.rand(2) == 0)
         {
            _loc1_ += arianChestAdjective() + " ";
         }
         var _loc2_:int = Utils.rand(10);
         if(_loc2_ <= 2)
         {
            _loc1_ += "奶子";
         }
         else if(_loc2_ <= 5)
         {
            _loc1_ += "乳房";
         }
         else if(_loc2_ <= 7)
         {
            _loc1_ += "奶枕";
         }
         else
         {
            _loc1_ += "奶子";
         }
         return _loc1_;
      }
      
      public function arianAppearance() : void
      {
         clearOutput();
         registerTag("arianbreasts",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,941) > 0));
         registerTag("ariancocks",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,939) > 0 ? TagFun_Impl_.fromInt(2) : (arianCockSize() != 0 ? TagFun_Impl_.fromInt(1) : TagFun_Impl_.fromInt(0)));
         registerTag("arianvagina",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0));
         outputText("阿瑞安是个体型中等的蜥蜴人，看不出[Arian ey]过去曾经病弱虚弱的痕迹。[Arian Ey][if (nofur) {皮肤白得超乎想象，耳朵和头发本该在的位置则长着纯白色鳞片|从头到脚都覆盖着纯白色鳞片}]。[Arian Eir]脸[if (nofur) {有些" + arianMF("男性化","女性化") + "|从外观到结构都完全是爬行动物的样子}]，但绝对不难看。阿瑞安穿着[Arian eir]平常的法师长袍，遮住了[Arian eir]大部分特征，只露出一条从身后伸出的尾巴，以及[Arian eir]身体[if (arianbreasts) {和乳房}]的大致轮廓。");
         outputText("[pg]阿瑞安有[if (arianbreasts) {显眼的[if (nofur) {类人|覆鳞}]乳房，令人惊讶的是，尽管[Arian eir][if (nofur) {也带有一些爬行动物特征|本质上是爬行动物}]，上面却还有乳头。|胸口和你对[if (nofur) {略带爬行动物性质的人|爬行动物}]的预期一样，平坦得毫无起伏，也没有任何特征。}]");
         outputText("[pg][Arian Ey]双腿之间有[if (ariancocks == 1) {一根普通的蜥蜴人阴茎，这对蜥蜴人来说相当少见，}][if (ariancocks == 2) {两根蜥蜴人阴茎，这是蜥蜴人的标准配置，}][if (arianvagina) {[if (ariancocks > 0) { 以及}]一个紧致、[if (nofur) {新生且永久无毛的小穴|外部覆有鳞片的新生小穴}]}]。");
         outputText("[pg]阿瑞安的臀瓣之间有一个紧致而" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,936) > 66 ? "随时准备好" : "正常") + "的肛门，就长在它该在的地方。[if (silly) { 不然人的屁眼还能长在哪儿？}]");
         doNext(visitAriansHouse);
      }
      
      public function arianAffection() : void
      {
         menu();
         addNextButton("亲吻",arianKiss).hint("是时候接吻了。");
         addNextButton("牵手",arianHandholding).hint("和[arian eirs]十指相扣。");
         addNextButton("依偎",arianCuddle).hint("你只是想和[arian em]亲密地待一会儿。").disableIf(get_time().hours > 20,"反正已经到睡觉时间了。");
         setExitButton("返回",arianHomeMenu);
      }
      
      public function acceptArianMovingIntoCamp() : void
      {
         clearOutput();
         arianSprite();
         outputText("你告诉阿瑞安，你很乐意让[Arian em]搬来和你一起住。阿瑞安的脸一下子亮了起来，就像拿到一桶糖果的孩子。[say:真的吗！？太好了！我这就收拾东西，我们马上就能出发！]");
         menu();
         addButton(0,"下一步",inviteArianToCamp);
      }
      
      public function TeaseHighAnalXPArian() : void
      {
         arianSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            get_images().showImage("arianfemale-camp-dreamingArian");
         }
         else
         {
            get_images().showImage("arianmale-camp-dreamingArian");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,951,1);
         outputText("首先，你决定先看看阿瑞安究竟在梦些什么……");
         outputText("[pg][say:……[name]……不要……别给那只火鸡填馅……填我吧……我也想变得好吃。]");
         outputText("[pg][Arian ey]梦到的是食物，还是做爱？");
         if(get_player().hasCock())
         {
            outputText("[pg]唉，管它呢，稍微放纵一下又何妨？你用一只手开始挑逗地抚弄自己的肉棒，想让它好好硬起来，同时用另一只手的手指滑进蜥蜴人的尾穴，看看你的挑逗会不会引起反应，证明[Arian ey]确实想让[Arian eir]的屁股被操。");
            outputText("[pg][say:嗯……嘿嘿。好小啊……[name]……你还能更厉害点的。]");
            outputText("[pg]好吧，看来已经没必要再犹豫了。你的肉棒因期待而硬得像石头，你扭动身体摆好姿势，直截了当地顶进[Arian eir]的屁股。阿瑞安在[Arian eir]睡梦中淫荡地呻吟，[Arian eir]调教有素的小屁眼轻易地——不，几乎是迫不及待地——一记挺送便把你吞了进去，贪婪的肉壁湿滑地裹过你的整根长度，随后紧紧夹住，像是要把你吸进体内。");
            outputText("[pg][say:噢哦……就是这样……把我弄得美味一点……]阿瑞安的 hips 急切地开始向你顶来，想把你更深地逼进[Arian eir]不断收缩的后庭；每当你顶进去，包裹着你的[cock smallest]的肉便顺从地让开，让你轻松深入；而每当你往外抽，阿瑞安的括约肌又会紧紧夹住你，仿佛不想让你离开那紧窄的拥抱。感觉很舒服，尽管要进入合适的节奏有些困难。");
            outputText("[pg]不过，尽管姿势有些别扭，你还是坚持了下去。你俯身凑到阿瑞安耳边低语，问[Arian ey]是不是想被填得又舒服又满。");
            outputText("[pg][say:不只是满……我想变得像火鸡小姐一样大……]");
            outputText("[pg]你问，真的吗？[Arian ey]真的想要一个柔软的大肚子，里面塞满又热又咸的" + get_player().mf("男人","双性人") + "黏液吗？");
            outputText("[pg][say: 嗯，是的……把酱汁灌进我身体里，]阿瑞安愉悦地嘶声说道。");
            outputText("[pg]你早已欲火焚身，不需要更多鼓励。最后几下抽插因你的急切而显得粗暴，随后你任由高潮吞没自己，尽可能持久而猛烈地射进阿瑞安贪婪的小屁股里。");
            outputText("[pg]你已经尽力射了出来，却发现自己射得没有平时那么多，毕竟你还处在半梦半醒之间。[say: 嗯，不……还要更多馅料。我的松饼需要它……]你尽了全力，却实在榨不出更多像样的东西，只好告诉阿瑞安，[Arian ey]需要睡一觉，等早上你再把[Arian em]填满。阿瑞安呜咽了一声，不过眼下似乎总算平静了下来……现在也许你终于能好好睡一觉了。");
            outputText("[pg]你试着从这个蜥蜴人训练有素的屁股里拔出来，却发现自己动弹不得。好吧，这可不是你今晚原本预想的过夜方式，但你实在太累了，没什么力气把你的[cock smallest]从这个蜥蜴人贪婪的屁眼里抽出来。你只能在当前的姿势下尽量让自己舒服些，然后闭上了眼睛……");
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("[pg]可惜的是，你没有必要的部件来陪[Arian em]玩。不过，也许只要你为[Arian em]做点特别的事，[Arian ey]就会平静下来，让你睡上一觉……？");
            outputText("[pg]换作别人，你大概会先把手指润滑一下；不过考虑到阿瑞安已经把[Arian emself]彻底变成了一个屁股荡货，你怀疑[Arian ey]根本不需要。你用两根手指轻轻抵住[Arian eir]皱紧的尾孔；它迫不及待地滑开，让你探了进去，甚至还发出一声你几乎敢肯定是柔软吮吸般的声音。里面湿润而滑腻，比起普通的肛门，更像是一只发情的小穴。你开始缓缓地将手指在那温暖湿润的深处进进出出。");
            outputText("[pg]随着阿瑞安的屁股像真空一样把你的手吸进去，你想把手抽出来变得越来越困难。[say: 噢……不是填满……但也好舒服……]");
            outputText("[pg]你不禁想着，也许自己该长出一根肉棒来……要么就是想办法把阿瑞安的屁股收紧一点，让[Arian ey]别再这么痴迷于被肉棒塞满了。当你思索着这个深奥难题时，手指仍不断在这个屁股荡货蜥蜴人的屁眼里抽送；你不由得好奇，单靠这样能不能让[Arian em]高潮……？");
            outputText("[pg][say: 嗯，你漏掉了一个地方。]阿瑞安开始迫不及待地迎着你的手指挺动，想把它们尽可能深地顶进[Arian eir]那贪婪的屁股里。");
            outputText("[pg]你又在这个显然十分满足的蜥蜴人体内抽插了一会儿，但最终还是觉得无聊起来；不管[Arian ey]有多享受，这对你来说实在没什么感觉，而你还想睡觉。你最后深深地顶了[Arian em]一下，随后试着抽出手指，却发现根本抽不出来。这个贪婪的蜥蜴屁股不肯放你走！");
            outputText("[pg][say: 不行，要是把馅料拿出来，贝果就不好吃了……]阿瑞安喃喃道，仍然睡着。");
            outputText("[pg]你又拽了几下，然后不满地叹了口气。看来你只能忍着了；你困得不想把[Arian em]叫醒。不过你在自己睡过去之前暗暗记下，等早上阿瑞安可少不了一顿训。");
            dynStats(DynStat.Lust(15));
         }
         menu();
         addButton(0,"下一步",get_camp().sleepWrapper);
      }
   }
}

