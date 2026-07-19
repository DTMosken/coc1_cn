package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class Gym extends TelAdreAbstractContent
   {
      
      public function Gym()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function weightLifting() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         if(get_player().get_fatigue() > get_player().maxFatigue() - 25)
         {
            outputText("<b>你现在根本没法锻炼——你已经筋疲力尽了！</b>");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
            {
               outputText("最好还是省下钱，休息好了再来。");
            }
            doNext(get_telAdre().telAdreMenu);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 10);
            statScreenRefresh();
         }
         get_player().changeFatigue(25);
         outputText("你走到举重器械前，开始锻炼。");
         if(get_player().get_str100() < 25)
         {
            outputText("由于力量有限，你只能从架子左侧较小的哑铃开始，但即使如此，你还是成功地感受到了肌肉的灼热感，并出了些汗。");
         }
         else if(get_player().get_str100() < 40)
         {
            outputText("你掂量了几个哑铃，挑了几个中间偏左的。没过多久你就出汗了，但你坚持做完了各种练习，让你的身体感到酸痛和疲惫。");
         }
         else if(get_player().get_str100() < 60)
         {
            outputText("当你握住架子上几个较重的哑铃开始举重时，你笑了。你猛然意识到，你现在的力气可能比英格纳姆的铁匠大师本还要大。哇！这个认知让你更加努力地逼迫自己，你花了将近一个小时用这些哑铃做各种力量训练。");
         }
         else if(get_player().get_str100() < 80)
         {
            outputText("你自信地抓起这里最重的哑铃掂了掂。没过多久，你就大汗淋漓，感觉到灼热感在你渐渐疲惫的身体中跳动。锻炼大约花了一个小时，但你觉得今天取得了不错的进展。");
         }
         else if(get_player().get_str100() < 90)
         {
            outputText("你抓起他们最重的哑铃，开始了一套让你累得气喘吁吁的锻炼。把哑铃放在一边，你弯曲手臂，对自己的力量感到惊叹——你现在大概能和一两只牛头人掰手腕并取得胜利了！");
         }
         else
         {
            outputText("这个地方几乎没有什么能挑战你的了，但你还是拿起了你能拿到的最重的哑铃开始锻炼。一个小时过去后，你出了一身大汗，但如果没有更重的哑铃，你可能不会变得更强壮了。");
         }
         if(get_player().get_str100() < 90)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_tou100() < 40)
         {
            dynStats(DynStat.Tou(0.3));
         }
         outputText(get_player().modTone(85,5 + Utils.rand(5)));
         promptShowers();
      }
      
      public function promptShowers() : void
      {
         outputText("[pg]回营地前你想去洗个澡吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,920) == 1)
         {
            menu();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2137) == 0)
            {
               addButton(0,"“淋浴间”",get_telAdre().sexMachine.exploreShowers);
               addButton(1,"淋浴",get_telAdre().brooke.repeatChooseShower);
               setExitButton();
            }
            else
            {
               doYesNo(get_telAdre().brooke.repeatChooseShower,get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            doYesNo(get_telAdre().sexMachine.exploreShowers,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function gymMenu() : void
      {
         menu();
         addButton(0,"更衣室",get_telAdre().jasun.changingRoom).hint("去更衣室看看，也许你会遇到什么人？");
         addButton(1,"慢跑",goJogging).hint("使用慢跑跑道。");
         addButton(2,"举重",weightLifting).hint("做一些老式的举重运动来挑战你的力量。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0 && get_player().get_gems() >= 500)
         {
            addButton(4,"终身会员",buyGymLifeTimeMembership).hint("花500颗宝石购买终身会员？从长远来看，这可以为你节省宝石。","终身会员");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) > 0)
         {
            addButtonDisabled(4,"终身会员","你已经拥有终身会员资格。所以去使用设施吧。","终身会员");
         }
         else
         {
            addButtonDisabled(4,"终身会员","你买不起健身房的终身会员。你需要500颗宝石。","终身会员");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,677) == 0 && get_telAdre().cotton.cottonsIntro())
         {
            addButton(5,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) > 0 ? "科顿" : "马娘",get_telAdre().cotton.cottonGreeting).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) > 0 ? "和科顿一起做瑜伽，或者花点时间陪她。" : "接近那个肌肉发达的马娘……还是扶他马？");
         }
         if(get_game().time.hours > 9 && get_game().time.hours <= 15)
         {
            addButton(6,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,204) > 0 ? "赫克尔" : "鬣狗",get_telAdre().heckel.greetHeckel).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,204) > 0 ? "去和赫克尔谈谈，也许可以一起训练。" : "接近那只渴望奔跑的鬣狗。");
         }
         if(get_telAdre().ifris.ifrisIntro())
         {
            addButton(7,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,205) > 0 ? "伊弗里斯" : "恶魔女孩",get_telAdre().ifris.approachIfris).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,205) > 0 ? "给伊弗里斯一些可以看的东西：你。或者不给？" : "和恶魔女孩搭讪。也许你能给她留下深刻印象？");
         }
         addButton(8,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) > 0 ? "洛蒂" : "猪娘",get_telAdre().lottie.lottieAppearance(false)).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) > 0 ? "去和洛蒂谈谈，也许可以一起训练。" : "走到猪娘身边和她搭讪。也许你自己也去游个泳？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,695) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,693) == 0)
         {
            addButton(9,"洛珀",get_telAdre().loppe.loppeGenericMeetings).hint("去见洛珀，聊聊天或者找点乐子。");
         }
         if(get_telAdre().pablo.pabloIntro() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2336) != 1)
         {
            addButton(10,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2327) > 0 ? "巴勃罗" : "小恶魔？",get_telAdre().pablo.approachPablo);
         }
         addButton(14,"离开",get_telAdre().telAdreMenu).hint("回到外面。");
      }
      
      public function gymDesc() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,678) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,677) == 0 && get_telAdre().cotton.pregnancy.get_isPregnant())
         {
            get_telAdre().cotton.cottonPregnantAlert();
            return;
         }
         spriteSelect(null);
         clearOutput();
         outputText("尽管你的家乡英格纳姆是一个繁荣的大村庄，但在来到特尔阿德雷之前，你从未见过健身房。这座建筑本身与周围的建筑在结构上有许多不同之处：齐腰高的矮墙，由简单柱子支撑的拱形天花板，以及铺满沙子的地板。也许里面唯一“正常”的房间就是更衣室和浴室，它们");
         if(get_player().cor < 35)
         {
            outputText("幸运的是，");
         }
         else if(get_game().ceraphScene.hasExhibition() || get_player().cor > 80)
         {
            outputText("不幸的是");
         }
         outputText("有全尺寸的墙壁来保护使用者的隐私。一阵微风吹过，表明露天设计提供了极佳的通风。你注意到一面墙上挂着各种大小和形状的举重器材，非常适合锻炼肌肉和增肌。这里还有慢跑跑道，甚至在后面还有一个全尺寸的草地跑道供半人马奔跑。虽然有些设备看起来有点深奥，但你确信你可以利用这里的大部分东西。[pg]");
         outputText("虽然健身房被城市守卫和各种市民频繁使用，但目前并不太拥挤。");
         outputText("门口刚进来就有一个穿着背心的半人马娘，她有着巨大圆润的乳房和挺拔的乳头，但她只是咳嗽了一声让你抬起头，然后说道，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            outputText("[say: 使用这里的设施每小时10颗宝石，或者500颗宝石购买终身会员。] 她双手叉腰，看来你得付十颗宝石才能真正使用这里的任何东西。");
         }
         else
         {
            outputText("[say: 哦，欢迎回来 [name]。祝你锻炼愉快！]");
         }
         if(get_player().get_gems() < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            outputText("[pg]<b>你把手伸进口袋想掏钱，结果却空空如也。看来你没有足够的钱来使用设备或见任何人。该死！</b>");
            doNext(get_telAdre().telAdreMenu);
            return;
         }
         get_telAdre().lottie.lottieAppearance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,695) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,693) == 0)
         {
            outputText("[pg]你发现兔女郎洛珀正在四处闲逛，毛巾搭在她的肩膀上。当她看到你时，她微笑着向你挥手，你也向她挥手致意。");
         }
         if(get_game().time.hours > 9 && get_game().time.hours <= 15)
         {
            get_telAdre().heckel.heckelAppearance();
         }
         gymMenu();
      }
      
      public function goJogging() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as Butt;
         var _loc3_:* = null as Hips;
         clearOutput();
         if(get_player().get_fatigue() > get_player().maxFatigue() - 30)
         {
            outputText("<b>你现在根本没法锻炼——你已经筋疲力尽了！</b>");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
            {
               outputText("最好还是省下钱，休息好了再来。");
            }
            doNext(get_telAdre().telAdreMenu);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 10);
            statScreenRefresh();
         }
         get_player().changeFatigue(30);
         outputText("你踏上慢跑跑道，");
         if(get_player().get_tou100() < 25)
         {
            outputText("但你很快就气喘吁吁，几分钟后不得不停下来。为了提高耐力，你强迫自己保持快走，直到能再次跑起来。");
         }
         else if(get_player().get_tou100() < 40)
         {
            outputText("但你的表现并不理想。你好几次差点停下来，但还是咬牙坚持，直到筋疲力尽。");
         }
         else if(get_player().get_tou100() < 60)
         {
            outputText("你表现得相当不错。你慢跑了将近一个小时，出了一身健康的汗。甚至你的[legs]也因为疲惫而感到刺痛和灼热。");
         }
         else if(get_player().get_tou100() < 80)
         {
            outputText("这对你来说根本不算什么。你以不错的速度跑了一圈又一圈，直到浑身湿透，相当疲惫。");
         }
         else if(get_player().get_tou100() < 90)
         {
            outputText("你度过了一段非常愉快的时光。你能在整个过程中保持略低于冲刺的速度，尽管在这个过程中你出了大量的汗。");
         }
         else
         {
            outputText("这对你来说几乎没有挑战性。你有一半的时间都在冲刺，但仍然感觉不到自己有丝毫的进步。不过，你确实燃烧了大量的卡路里。");
         }
         if(get_player().get_spe100() < 40)
         {
            dynStats(DynStat.Spe(0.3));
         }
         if(get_player().get_tou100() < 90)
         {
            dynStats(DynStat.Tou(0.5));
         }
         if(get_player().butt.rating >= 15)
         {
            outputText("[pg]所有的跑步一定起到了作用，因为你的[ass]感觉没那么有弹性了。");
            _loc2_ = get_player().butt;
            --_loc2_.rating;
         }
         else if(get_player().butt.rating >= 10 && Utils.rand(3) == 0)
         {
            outputText("[pg]慢跑确实有助于修饰你的[ass]。");
            _loc2_ = get_player().butt;
            --_loc2_.rating;
         }
         else if(get_player().butt.rating >= 5 && Utils.rand(3) == 0)
         {
            outputText("[pg]经过锻炼，你的[ass]似乎变得更紧实了一点。");
            _loc2_ = get_player().butt;
            --_loc2_.rating;
         }
         else if(get_player().butt.rating > 1 && Utils.rand(4) == 0)
         {
            outputText("[pg]经过锻炼，你的[ass]似乎变得更紧实了一点。");
            _loc2_ = get_player().butt;
            --_loc2_.rating;
         }
         if(get_player().hips.rating >= 15)
         {
            outputText("[pg]感觉你的[hips]减掉了一些重量，变窄了。");
            _loc3_ = get_player().hips;
            --_loc3_.rating;
         }
         else if(get_player().hips.rating >= 10 && Utils.rand(3) == 0)
         {
            outputText("[pg]感觉你的[hips]减掉了一些重量，变窄了。");
            _loc3_ = get_player().hips;
            --_loc3_.rating;
         }
         else if(get_player().hips.rating >= 5 && Utils.rand(3) == 0)
         {
            outputText("[pg]感觉你的[hips]减掉了一些重量，变窄了。");
            _loc3_ = get_player().hips;
            --_loc3_.rating;
         }
         else if(get_player().hips.rating > 1 && Utils.rand(4) == 0)
         {
            outputText("[pg]感觉你的[hips]减掉了一些重量，变窄了。");
            _loc3_ = get_player().hips;
            --_loc3_.rating;
         }
         outputText(get_player().modThickness(1,5 + Utils.rand(2)));
         outputText(get_player().modTone(100,2 + Utils.rand(4)));
         promptShowers();
      }
      
      public function buyGymLifeTimeMembership() : void
      {
         clearOutput();
         if(get_silly())
         {
            outputText("你一边掏出宝石袋，一边大喊：[say: 闭嘴，拿着我的宝石！][pg]");
         }
         outputText("你在袋子里摸索了一下，掏出500颗宝石，倒在半人马的手里。她瞪大了眼睛，转身小跑向后面的柜台。她弯下腰数钱时，你正好可以从她低胸的上衣领口一览无余地看到她几乎懒得遮掩的乳沟。");
         if(get_player().hasCock())
         {
            outputText("这让你涨红了脸，但这和运动毫无关系。也许你以后能骗她和你独处一会儿？");
            dynStats(DynStat.Lust(10 + get_player().lib / 10));
         }
         outputText("[pg][b: 获得关键物品：健身房会员卡！]");
         get_player().createKeyItem("Gym Membership",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,167,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         gymMenu();
      }
   }
}

