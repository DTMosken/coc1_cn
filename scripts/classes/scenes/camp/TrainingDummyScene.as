package classes.scenes.camp
{
   import classes.BaseContent;
   import classes.Player;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class TrainingDummyScene extends BaseContent
   {
      
      public function TrainingDummyScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function renameDummy() : void
      {
         var rename:Boolean;
         var _g:Camp;
         clearOutput();
         outputText("训练假人的新名字应该叫什么？");
         menu();
         genericNamePrompt();
         _g = get_camp();
         rename = true;
         doNext(function():void
         {
            _g.nameDummy(rename);
         });
      }
      
      public function dummyWon(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你不知道自己怎么会被一个没有生命的物体打败，但你还是做到了。恭喜你，你正式成为一个废物了。");
            outputText("[pg]你在营地边缘昏倒了，在如此可悲的表现之后，没有人关心你的倒下。只有[dummyname]趁机不知怎么地从你昏迷的身体上抢走了几颗宝石，也许还用手指抠了抠你的[butthole]。");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("你扔下你的[weapon]，大口喘着粗气，被这些性感的木头弄得欲火焚身，无法继续训练。你需要发泄——无论用什么方式——而现在，没有生命的[dummyname]似乎和其他情人一样好。你被欲望冲昏了头脑，猛地撞向它，把假人撞倒，疯狂地亲吻它坚硬的木头脸，完全不在乎木刺。");
            menu();
            addNextButton("乳交",dummyTitfuck).hint("把你的阴茎滑进它的乳房之间。").sexButton(1).disableIf(get_camp().saveContent.dummyGender < 2,"假人没有乳房。");
            addNextButton("骑乘",dummyRide).hint("用阴道骑乘假阳具。").sexButton(2).disableIf(int(get_camp().saveContent.dummyGender % 2) == 0,"假人没有阴茎。");
            addNextButton("肛门骑乘",dummyAnalRide).hint("用肛门骑乘假阳具。").disableIf(int(get_camp().saveContent.dummyGender % 2) == 0,"假人没有阴茎。");
            if(int(get_camp().saveContent.dummyGender % 2) == 0 && (!get_player().hasCock() || get_camp().saveContent.dummyGender == 0))
            {
               addNextButton("昏倒",dummyFaint).hint("无事可做了。");
            }
         }
      }
      
      public function dummyTitfuck() : void
      {
         clearOutput();
         outputText("你迅速掏出你的[dick]，满意地听着肉体拍打在木头上的声音。");
         outputText("[pg]没有时间做前戏了，你迅速锁定你渴望的目标：[dummyname]金字塔形的胸部。你用肉棒在上面敲打，在坚硬的表面上涂抹下第一滴先列腺液，然后你跨坐在它的躯干上，将你的肉棒对准那道木制的沟壑。向前挺进，你滑入它坚硬的乳房之间，尽管它们像木头一样僵硬，但当你的肉棒在粗糙的木板上摩擦时，你现在哪里也不想去。你急切地加快了速度，很快就像一只疯狂的啄木鸟在寻找一只特别肥胖的白蚁一样，在假人身上敲打着。");
         outputText("[pg]玛莱啊，那粗糙的木头感觉太棒了！它摩擦你敏感肌肤的方式，很快在假人的胸前抹上了一道道血迹，而害怕不小心把木刺扎进肉棒的恐惧只会让你更硬。你迷失在树脂般的激情中，你的[dick]在快感和痛苦中燃烧，你用力而快速地钉在木头上，甚至害怕你会把印记烙在木板上，但即使这样也无法阻止你满足那像森林大火一样狂野燃烧的欲望。");
         outputText("[pg]无论如何，你那充满欲望的锯木运动很快就结束了，因为你再也受不了这种热度，在极乐中大叫出声，将你的精液喷洒在[dummyname]的胸部和脸上，给它的木头涂上一层新鲜的精液。");
         outputText("[pg]你真的很需要这个。假人现在被彻底弄脏了，在下一次下雨之前肯定会散发着精液的味道，你把它扶正，再次把它钉入土中，然后离开去洗掉你肉棒上的血迹并给自己治疗。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function dummySetUp() : void
      {
         clearOutput();
         outputText("看来你已经把假人逼到了极限。你走过去把它举起来，再次将坚硬的杆子插入狭窄的土坑中，并用石头紧紧固定住。");
         get_combat().cleanupAfterCombat();
      }
      
      public function dummyRide() : void
      {
         clearOutput();
         outputText("这和自慰没什么区别，对吧？至少当你把你的[armor]拨到一边，露出你的[vagina]，漫不经心地抚摸着你的阴唇，已经期待地滴下淫液时，你是这么告诉自己的。");
         if(get_player().hasVirginVagina())
         {
            outputText("[pg]你停了下来。这将是第一次有东西插入你，而到底是什么驱使你在一个训练假人身上破处，你也不太确定。即使现在已经没有回头路了，你至少可以做的是让你的处女小穴更容易通过。收集了一些你自己的润滑液，你把它涂抹在假阳具上，让它变得光滑，为即将到来的事情做好准备。你不想再拖延了；你将自己对准[dummyname]的木制肉棒，张开你的阴唇，坐了下去。在它进入你之后不久，你因为一阵短暂的刺痛而退缩了一下，但并没有减慢你下降的速度，直到你的骨盆接触到坚硬、粗糙的木头。");
            outputText("[pg]第一次有这样的东西在你的体内，感觉很奇怪，但远没有你想象的那么痛。事实上，你确信一旦你开始动作，感觉会非常舒服。");
         }
         else
         {
            outputText("[pg]没有太多的仪式感，你将你的入口对准[dummyname]的假阳具，将自己刺入它的木制长度上。它有点干，很难进入，因为你事先没有润滑它，但你自己的汁液很快就为你解决了这个问题，让你沉下去，直到你的骨盆接触到粗糙的木头。你保持这个姿势了一会儿，只是陶醉于这种坚硬的东西在你体内的感觉。");
         }
         get_player().cuntChange(5.5,true,true);
         outputText("[pg]当你开始移动时，你一开始做得很慢，故意将你的阴唇在木头上拖拽，让你内壁的每一寸都感受到下降过程中的每一个小凸起，这让你发出一声满足的叹息。渐渐地，你加快了速度，湿润的拍打声开始在你的营地里回荡，尽管你不太在乎谁会听到你的声音，因为你的大脑陷入了发情状态，驱使你的[hips]越来越快地撞击假人，不久你的呼吸就跟上了你粗暴的节奏。这感觉比它应该的要好——毕竟它只是一个假阳具——但这种孤独的自慰行为中有些东西感觉更亲密，更刺激，就像你不仅仅是一个人在这里，而是几乎就像你真的在和某人做爱一样。");
         outputText("[pg]你喘着粗气，向前倾斜，" + (get_camp().saveContent.dummyGender >= 2 ? "抚摸着假人圆锥形的乳房" : "在假人的胸前稳住自己") + "，像骑着一个真正的爱人一样骑着你没有生命的爱人，你感觉到自己越来越接近高潮。");
         outputText("[pg]你终于在极乐中呻吟出声，猛地坐下，最后一次将假阳具深深埋入你的体内，当你颤抖时，拼命地在它上面摇晃，你的[vagina]试图从木制的长度中榨取永远不会到来的精液。最终，你瘫倒在坚硬的假人身上，双臂环抱住它，沉浸在余韵中。");
         outputText("[pg]不过，你很快就恢复了理智，将现在滴着液体的肉棒从你体内拔出，在你的体内留下一种空虚感，同时你将倒下的假人重新扶正，并将其固定在地上。");
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function dummyMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("你走到营地边缘，你的训练假人[dummyname]正扎根在地上。你想对它做什么？");
         }
         menu();
         addNextButton("训练",dummyFight).hint("用这块木头测试你的[weapon]。");
         addNextButton("重命名",renameDummy).hint("更改它的名字。");
         addNextButton("摧毁",destroyDummy).hint("摧毁这个东西。如果你想的话，随时可以建一个新的。");
         addButton(14,"返回",get_camp().campActions);
      }
      
      public function dummyLost() : void
      {
         clearOutput();
         outputText("可怜的假人倒下了，被彻底击败。谢天谢地，你没有弄坏它，但也许下次你应该对它温柔点。");
         menu();
         addNextButton("扶起",dummySetUp).hint("把它重新扶正。");
         addNextButton("乳交",dummyTitfuck).hint("把你的阴茎滑进它的乳房之间。").sexButton(1).disableIf(get_camp().saveContent.dummyGender < 2,"假人没有乳房。");
         addNextButton("骑乘",dummyRide).hint("用阴道骑乘假阳具。").sexButton(2).disableIf(int(get_camp().saveContent.dummyGender % 2) == 0,"假人没有阴茎。");
         addNextButton("肛门骑乘",dummyAnalRide).hint("用肛门骑乘假阳具。").disableIf(int(get_camp().saveContent.dummyGender % 2) == 0,"假人没有阴茎。");
      }
      
      public function dummyFight() : void
      {
         var _loc1_:TrainingDummy = new TrainingDummy();
         startCombatImmediate(_loc1_);
      }
      
      public function dummyFaint() : void
      {
         clearOutput();
         outputText("但是你无能为力，没有什么能满足你燃烧的性欲。你无法承受——羞耻、欲望、屈辱。你的视线边缘变暗，你的头感觉比平时更轻，周围的声音消失在虚无中……你晕倒在你那本不该存在的木制爱人[dummyname]的怀里，它熟练地从你的口袋里偷走了几颗宝石。");
         get_combat().cleanupAfterCombat();
      }
      
      public function dummyAnalRide() : void
      {
         clearOutput();
         outputText("这和自慰没什么区别，对吧？至少当你把你的[armor]拨到一边，露出你的[butt]，漫不经心地抚摸着自己，期待地喘息着时，你是这么告诉自己的。");
         outputText("[pg]没有太多的仪式感，你将你的[butthole]对准[dummyname]的假阳具，将自己刺入它的木制长度上。它有点干，很难进入，因为你事先没有润滑它，但你自己的汁液很快就为你解决了这个问题，让你沉下去，直到你的臀部接触到粗糙的木头。你保持这个姿势了一会儿，只是陶醉于这种坚硬的东西在你体内的感觉。");
         outputText("[pg]当你开始移动时，你一开始做得很慢，故意将你的括约肌在木头上拖拽，让你肠壁的每一寸都感受到下降过程中的每一个小凸起，这让你发出一声满足的叹息。渐渐地，你加快了速度，湿润的拍打声开始在你的营地里回荡，尽管你不太在乎谁会听到你的声音，因为你的大脑陷入了发情状态，驱使你的[hips]越来越快地撞击假人，不久你的呼吸就跟上了你粗暴的节奏。这感觉比它应该的要好——毕竟它只是一个假阳具——但这种孤独的自慰行为中有些东西感觉更亲密，更刺激，就像你不仅仅是一个人在这里，而是几乎就像你真的在和某人做爱一样。");
         outputText("[pg]你喘着粗气，向前倾斜，" + (get_camp().saveContent.dummyGender >= 2 ? "抚摸着假人圆锥形的乳房" : "在假人的胸前稳住自己") + "，像骑着一个真正的爱人一样骑着你没有生命的爱人，你感觉到自己越来越接近高潮。");
         outputText("[pg]你终于在极乐中呻吟出声，猛地坐下，最后一次将假阳具深深埋入你的体内，当你颤抖时，拼命地在它上面摇晃，你的臀部紧紧夹住木制的入侵者，试图徒劳地榨取它。最终，你瘫倒在坚硬的假人身上，双臂环抱住它，沉浸在余韵中。");
         outputText("[pg]不过，你很快就恢复了理智，将现在变得光滑的肉棒从你体内拔出，在你的体内留下一种空虚感，同时你将倒下的假人重新扶正，并将其固定在地上。");
         get_player().orgasm("Anal");
         get_combat().cleanupAfterCombat();
      }
      
      public function destroyDummy() : void
      {
         clearOutput();
         outputText("你决定不再需要这个东西了。");
         outputText("[pg]摇晃了几下后，你成功地把它从地里拔了出来，直接扔进了营火里，它在令人满意的火焰中化为灰烬。");
         get_camp().saveContent.dummyBuilt = false;
         get_camp().saveContent.dummyGender = 0;
         get_camp().saveContent.dummyName = "";
         doNext(playerMenu);
      }
   }
}

