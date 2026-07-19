package classes.scenes.areas.mountain
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Salon extends BaseContent implements TimeAwareInterface
   {
      
      public function Salon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,441,0);
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1025) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) != 4)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,1022,FlagDict_Impl_.arrayReadInt(_loc1_,1022) + 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) == 7)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1022,0);
            }
         }
         return false;
      }
      
      public function shopMenu() : void
      {
         var _g:Salon;
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,441) == 1;
         var _loc2_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,142) > 0;
         spriteSelect(SpriteDb.get_s_lynette());
         clearOutput();
         outputText("林奈特拉开角落里的一个柜子，展示出各种各样充满异国情调的染发剂。你想要哪一种？");
         if(!_loc1_)
         {
            outputText("如果你还想要更多，就得付30颗宝石。");
         }
         if(_loc2_)
         {
            outputText("[pg]你也可以花" + (_loc1_ ? "60" : "120") + "颗宝石购买牛头人精液。");
         }
         menu();
         shopButton(get_consumables().BLUEDYE.get_shortName(),get_consumables().BLUEDYE);
         shopButton(get_consumables().ORANGDY.get_shortName(),get_consumables().ORANGDY);
         shopButton(get_consumables().PINKDYE.get_shortName(),get_consumables().PINKDYE);
         shopButton(get_consumables().PURPDYE.get_shortName(),get_consumables().PURPDYE);
         shopButton(get_consumables().GREEN_D.get_shortName(),get_consumables().GREEN_D);
         shopButton(get_consumables().EXTSERM.get_shortName(),get_consumables().EXTSERM);
         if(_loc2_)
         {
            shopButton("牛头人精液",get_consumables().MINOCUM,_loc1_ ? 60 : 120,true);
         }
         if(_loc1_)
         {
            _g = this;
            setExitButton("返回",function():void
            {
               _g.hairDressingMainMenu();
            });
         }
         else
         {
            setExitButton();
         }
      }
      
      public function shopButton(param1:String, param2:ItemType, param3:int = 30, param4:Boolean = false) : void
      {
         var _g:Salon = this;
         var itype1:ItemType = param2;
         var cost1:int = param3;
         var alwaysPay1:Boolean = param4;
         addNextButton(param1,function():void
         {
            _g.buyDye(itype1,cost1,alwaysPay1);
         }).hint(param2.get_tooltipText(),param2.get_tooltipHeader()).disableIf(get_player().get_gems() < param3 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,441) == 0 || param4),"需要花费" + param3 + "宝石。");
      }
      
      public function sandFacial() : void
      {
         spriteSelect(SpriteDb.get_s_lynette());
         clearOutput();
         outputText("你靠在一张舒适的椅子上，拉动控制杆让它倾斜。地精们在你周围忙碌，收集“特制沙子”。你闭上眼睛，任由她们把粗糙、有质感的黏液溅在你的[face]上。感觉不太好，但如果它能让你像预期那样英俊，那也无所谓了。[pg]");
         outputText("过了一会儿，地精女孩们回来，把你脸上的东西清理干净。（+10 男性气质）");
         get_player().modFem(0,10);
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function salonPurchaseMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,441,1);
         }
         spriteSelect(SpriteDb.get_s_lynette());
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(get_player().get_femininity() < 100 && get_player().get_gender() == 2)
         {
            _loc2_ = true;
         }
         else if(get_player().get_femininity() < 85 && (get_player().get_gender() == 0 || get_player().get_gender() == 3))
         {
            _loc2_ = true;
         }
         else if(get_player().get_femininity() < 70 && get_player().get_gender() == 1)
         {
            _loc2_ = true;
         }
         else if(get_player().get_femininity() < 100 && get_player().hasPerk(PerkLib.Androgyny))
         {
            _loc2_ = true;
         }
         if(get_player().get_femininity() > 0 && get_player().get_gender() == 1)
         {
            _loc3_ = true;
         }
         else if(get_player().get_femininity() > 30 && get_player().get_gender() == 2)
         {
            _loc3_ = true;
         }
         else if(get_player().get_femininity() > 20 && (get_player().get_gender() == 0 || get_player().get_gender() == 3))
         {
            _loc3_ = true;
         }
         else if(get_player().get_femininity() > 0 && get_player().hasPerk(PerkLib.Androgyny))
         {
            _loc3_ = true;
         }
         menu();
         addNextButton("剪短",cutShort).disableIf(get_player().hair.type == 6 || get_player().hair.length <= 2);
         addNextButton("剪中等",cutMedium).disableIf(get_player().hair.length <= 13);
         addNextButton("剪长",cutLong).disableIf(get_player().hair.length < 26);
         addNextButton("留长",hairGrow).disableIf(get_player().hair.type == 6 || get_player().hair.length >= get_player().get_tallness());
         addNextButton("剃光",removeHair).disableIf(get_player().hair.type == 6 || get_player().hair.length <= 0);
         addNextButton("购买产品",shopMenu);
         addNextButton("胡须选项",beardMenu);
         addNextButton("泥浆面膜",mudFacial).hint("这种面膜应该能增强你脸部的柔软度，并大大增强它的女性气质。").disableIf(!_loc2_,"你已经尽可能地女性化了。");
         addNextButton("沙子面膜",sandFacial).hint("地精们保证这种面膜会给你一个粗犷、英俊的外表，这要归功于他们特殊的、永恒的沙子。").disableIf(!_loc3_,"你已经尽可能地男性化了。");
         setExitButton();
      }
      
      public function salonPaymentMenu(param1:Boolean = false) : void
      {
         menu();
         addNextButton("地精口交",goblinHairDresserFacefuck).hint("让林奈特给你口交。").disableIf(!get_player().hasCock(),"你需要一根肉棒才能用你自己的精液支付。");
         addNextButton("犬科",gloryholeDoggie).hint("吸吮那根带肉结的肉棒。");
         addNextButton("小恶魔",gloryholeImp).hint("吸吮那根恶魔的肉棒。从它不断的上下浮动来看，一定有人在努力保持在合适的高度。");
         addNextButton("牛头怪",gloryholeMinotaur).hint("吸吮那根巨大的牛头怪肉棒！");
         addNextButton("男魅魔",gloryholeIncubus).hint("吸吮那根男魅魔的肉棒。它散发出那种令人愉悦的辛辣气味。");
         addNextButton("操地精",fuckLynnette).disableIf(!get_player().hasCock(),"你需要一根肉棒才能操她。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) < 4,"她已经怀孕了。");
         addNextButton("给精液",giveCumOptions).disableIf(!get_player().hasItemArrayAny([get_consumables().MINOCUM,get_consumables().P_M_CUM,get_consumables().URTACUM]),"你可以试着在外面找点精液。");
         if(param1)
         {
            addButton(14,"返回",favoriteSalonMenu);
         }
         else
         {
            setExitButton();
         }
      }
      
      public function salonPay(param1:int = 30, param2:Boolean = false) : void
      {
         var _loc3_:* = null as Player;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,441) != 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,441,0);
            if(param2)
            {
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() - param1);
            }
         }
         else
         {
            _loc3_ = get_player();
            _loc3_.set_gems(_loc3_.get_gems() - param1);
         }
         statScreenRefresh();
      }
      
      public function salonGreeting() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.HairdresserMeeting))
         {
            hairDresserRepeatGreeting();
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.HairdresserMeeting,0,0,0,0);
            hairDresserGreeting();
         }
      }
      
      public function removeHair() : void
      {
         clearOutput();
         outputText("你告诉林奈特你想把头发剃光。[pg]");
         outputText("林奈特让你坐下，并指挥她的女儿们把你的头发剪短。她们毫不费力地在你的头皮上挥舞着剪刀，直到你感觉到洞穴里的一丝凉意拂过。接着，林奈特在你剩下的发茬上涂抹了一种特殊的药膏，发茬开始变硬并脱落。之后，她把你的头好好地清洗了一番。[pg]");
         outputText("<b>你现在没有头发了！</b>");
         get_player().hair.length = 0;
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function removeBeard() : void
      {
         clearOutput();
         outputText("你告诉林奈特你想要刮掉胡子。[pg]");
         outputText("林奈特让你坐下，然后在你的" + get_player().beardDescript() + "上涂抹了一种特殊的药膏。胡须开始变硬并脱落，之后她把你的下巴清理得干干净净。[pg]");
         outputText("<b>你不再有胡子了！</b>");
         get_player().beard.style = 0;
         get_player().beard.length = 0;
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mudFacial() : void
      {
         spriteSelect(SpriteDb.get_s_lynette());
         clearOutput();
         outputText("你靠在一张舒适的椅子上，拉动控制杆让它倾斜。地精们在你周围忙碌，收集“特制泥巴”。你闭上眼睛，任由她们把那东西涂满你的[face]，希望它能像承诺的那样改善你的肤色。两片黄瓜片放在你的眼睛上，遮挡了你的视线。[pg]");
         outputText("完成后，这群胸部丰满、绿皮肤的女人散开，留你一个人安静。时间慢慢流逝，泥巴最终变硬并裂开。就像排练好的一样，小手拿着湿抹布出现，把你的脸擦干净。一旦她们完成，你感觉自己焕然一新！（+10 女性气质）");
         get_player().modFem(100,10);
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function minotaurSalonFollowUp() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_lynette());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,142) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,142,FlagDict_Impl_.arrayReadInt(_loc1_,142) + 1);
            outputText("林奈特扇了你一巴掌，把你从昏迷中唤醒。什么？你在哪？你环顾四周，发现自己被绑在理发椅上，身上结满了白色的黏液，但为什么？[pg]");
            outputText("地精在你开口询问之前就回答了，[say: 宝贝，你太饥渴了，简直让我的女儿们看起来像贞洁的处女！自从我母亲去世后，愿玛莱保佑她的灵魂，我还没见过谁像你这样对牛头人这么疯狂的。通常除了点娱乐性的药物游戏外，我们对牛头人没那么多用处，但你榨出了这么多精液，我们都可以开始卖了！这不是很棒吗！？][pg]");
            outputText("你点点头，对自己的行为感到有些震惊，但已经期待地舔了舔嘴唇。林奈特微笑着说，[say: 你可以按平时价格加60颗宝石买一些，但现在，来点头发护理怎么样？免费的！][pg]");
         }
         else
         {
            outputText("你被一巴掌扇醒，从精液引发的寻欢洞狂欢中依然有些迷糊，你摇摇晃晃地站起[feet]。林奈特甩了甩刺痛的手掌，道歉说，[say: 抱歉我不得不一直这么做，但你狂欢之后真的很难叫醒！不管怎样，如果你想要的话，你已经赢得了一些头发护理。当然，你也可以买更多你最喜欢的体液……][pg]");
         }
         outputText("林奈特提供并解释了他们的选项，[say: 那么，亲爱的，你想要什么？我们可以帮你剪短，或者做个拉长护理。或者你可以买个染发剂自己用。只要记得过几天回来补色就行。]");
         salonPurchaseMenu(true);
      }
      
      public function minotaurCumBukkakeInSalon() : void
      {
         clearOutput();
         get_player().minoCumAddiction(10);
         get_player().slimeFeed();
         outputText("当沙龙的门在你身后关上时，一股熟悉的、天堂般的香味钻进你的鼻子，渗入你的大脑，让你充满了渴望和炽热的欲望。林奈特微微撅起嘴唇，扭动着身体向你走来，但你把她推开了。当你靠近这股让你陶醉的香味的源头时，她已经被你完全抛在脑后。你梦幻般地叹了口气，熟悉的化学物质在你的血液中奔腾，让你的瞳孔慢慢放大");
         if(get_player().hasVagina())
         {
            outputText("并且让你的小穴充满了液态的欲望。[pg]");
         }
         else if(get_player().hasCock())
         {
            outputText("并让[eachcock]变成了一团肿胀、跳动的肉块。[pg]");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你推开几个盯着你看的地精荡妇，一边走一边脱下你的[armor]。你大脑中动物的本能意识到，这种不必要的束缚只会妨碍那些浓稠、滴落的半人马精液泵入你的体内。另一扇门在你身后关上，那股气味不顾一切地将你拖入沙龙深处，靠近地精们藏在后面的隐蔽的寻欢洞。你一边流着口水，一边沉浸在舌尖上那味道的记忆中，让你的身体在自动驾驶模式下寻找它。");
         if(get_player().hasVagina() || get_player().hasCock())
         {
            outputText("一条");
            if(get_player().hasVagina())
            {
               outputText("女性的淫液");
               if(get_player().hasCock())
               {
                  outputText("和");
               }
            }
            if(get_player().hasCock())
            {
               if(get_player().cumQ() < 100)
               {
                  outputText("先列腺液");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("几英寸宽的先列腺液");
               }
               else
               {
                  outputText("一英尺多宽的先列腺液");
               }
            }
            outputText("在你身后粗糙的地板上蜿蜒，清晰地标记着你走向那股压倒性麝香的路径。");
         }
         outputText("[pg]");
         outputText("时间缓慢而折磨人地流逝，但你转过拐角，叹了口气。救赎就在眼前——你已经到达了寻欢洞，令你高兴的是，有近十根坚硬、滴落、美味的……嗯……半人马肉棒塞在洞里，有些在接缝处凸出，渗出渴望的液体。你向前走去，臀部性感地摇摆着，强效半人马麝香那如毒品般的欲望将你拉得越来越近。你开心地喵喵叫着，把其中一根拿在手里，顺着它的长度抚摸，当它跳动并流出一股天堂般的粘液顺着你的手臂流下时，你咯咯地笑了起来。你用一个长长、慵懒的动作把它从你的手臂上舔掉，然后撅起嘴唇含住半人马膨胀的龟头，用力吸吮，寻找更多它那令人陶醉的甘露。[pg]");
         outputText("你听到一声深沉、压抑的叹息，越来越多的美味先列腺液涌入你的嘴里，点燃了你的感官，带来一场烟花般的快感");
         if(get_player().get_gender() > 0)
         {
            outputText("并且增加了你在地板上留下的水洼的大小");
         }
         outputText("。在吞咽芳香液体的间隙，你把肿胀的肉棒吸得越来越深，当它推开你的悬雍垂时，你高兴地抑制住你的呕吐反射。你活动着喉咙，狂热地吞咽着把它吸下去。当它被越来越深地吸入你的体内时，龟头冠状沟短暂地撑开了你的脖子，直到你的嘴唇穿过洞口皱起，你闻到了半人马带有信息素的胯部。[pg]");
         outputText("野兽向后拉，开始猛烈地操弄这个洞，每一次虐待喉咙的寻欢洞抽插都伴随着深沉、隆隆的愉悦叹息。如果不是他不断冒泡的先列腺液把你的喉咙变成了一个湿滑的肉洞，你早就被磨破了，但相反，你继续向前倾，每次他把它们压在你被肉棒撑开的嘴唇上时，你都会闻他那纠结的阴毛。其他发情的种马不满地咕哝着，但你伸出双手，抓住两个急切的野兽跳动的马鞭。当你尽最大努力让它们都射出来时，三种不同步的心跳通过你的手和喉咙敲击着。[pg]");
         outputText("你闭上双眼，任由舌头在牛头人最下方的中间环上扫来扫去，感受着他的龟头冠状沟在你体内随之胀大。这兽人拍打着墙壁，发出充满激情与压抑欲望的低吼，他那粗大的龟头撑开你的喉咙，死死卡在里面。他的尿道有节奏地收缩着，撑开你那已经包裹着肿胀肉棒的双唇，向你那被麝香迷醉的大脑发出信号——你渴望的东西就要来了。你发出幸福的低吟，肚子开始咕噜作响，迎接那一股股黏稠的牛头人春药。[pg]");
         outputText("被卡在喉咙里喷射精液的龟头固定住，你发了疯似的用双手套弄着另外两根肉棒，随着那迷幻的精液让你本就迷糊的大脑更加沉醉，你的[feet]也跟着摇晃起来。你能感觉到那兽性肉棒在排出沉重、黏稠的精液时，每一次肌肉收缩的脉动，而那积聚在你腹中的黏稠醉意让你的双眼都对上了焦。你疯狂套弄的双手挤出了点点滴滴的先列腺液，浸湿了你的手臂和手掌。不过，光靠手是无法让他们射出来的。他们需要一些……更紧致的东西。[pg]");
         outputText("你在药物带来的极乐中开始呻吟，但你那充满愉悦的叫声却被一阵黏糊糊的吸溜声打断了——那根逐渐疲软的肉棒正从你那被撑成阴茎形状的嘴唇中拔出。它从墙上拔出时，在你嘴巴和下巴上滴下了一串精液，在那些蓄势待发的牛头人肉棒群中留下了一个空位。你舔舐着那头种马留下的痕迹，幸福地发出呼噜声，伸手穿过那个洞，挑逗地托住那个离去的牛头人的睾丸。他咕哝了一声，挣脱了你的手——暂时满足了。你弯曲手指做出一个勾引的手势，将手臂从那个被汗水润滑的寻欢洞中收回，等待着另一个牛头人过来。[pg]");
         outputText("那只让你左手忙个不停的野兽重新站到了现在空出来的洞口前，你决定奖励他动作这么快。你舔掉嘴唇上最后一点咸咸的白浊，心里暗想，得到奖励的可不止他一个，但那个怪物般的牛头人不需要知道这些。");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("你用你那柔软的" + get_player().allBreastsDescript() + "包裹住这根新的肉棒，对它的粗度和宽大、已经膨胀的龟头感到惊喜。也许你本来可以用手让他射出来的？");
            if(get_player().biggestTitSize() < 6)
            {
               outputText("即便如此，你的乳房还是无法完全包裹住他，所以你用忙碌的双手将它更用力地压向自己作为补偿。");
            }
            outputText("先列腺液顺着肉棒流下，在你的双乳间湿漉漉地挤压着，让你的身体变成了一个散发着火热、黏稠的牛头人性爱气息的滑水道。");
         }
         else
         {
            outputText("你将那根肉棒紧紧压在胸前，大量的先列腺液涂满了你的躯干，直到你变成了一个火热、湿润的牛头人性爱滑水道。你用双臂环抱住他那惊人的粗壮，用双手紧紧挤压他，用整个身体套弄他，那紧致的程度足以让这个可怜的牛头人以为自己正插在某个倒霉冒险者的屁眼里。");
         }
         outputText("[pg]");
         outputText("你降低又抬高身体，在你的[legs]上上下弹跳，以增强你正在进行的");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("乳交");
         }
         else
         {
            outputText("全身手淫");
         }
         outputText("的效果。在这个姿势下，你拥有完美的视角，看着你的套弄挤出大大的先列腺液气泡，在你失去快感之前，你含住牛头人脆弱的尿道吸吮，用舌头在它周围画着大圈，因为你无法张开足够大的嘴来容纳他的龟头。当然，所有的注意力只会让他的龟头膨胀得更大，不仅是顶端，而是整根肉棒。");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("突然的粗度变化在你的" + get_player().allBreastsDescript() + "中引起了一阵诱人的涟漪，这种快感足以让你对着他那不断变宽的尿道呻吟出声。");
         }
         outputText("你拔出肉棒，弹跳得更快了，迷失在你的欲望和弥漫在空气中的性爱麝香的阴霾中，一心想看看这头巨大的种马能喷多少在你身上。[pg]");
         outputText("牛头人没有让你失望。他的尿道因为即将到来的精液喷发而扩张，你顺着他的肉棒慢慢滑下，直到它直直地对准你的脸。你闭上眼睛，感觉到第一股爆发溅在你的[hair]和额头上。下一股直接喷了你一脸，让你戴着这层像毒品一样的黏液面具难以呼吸，但快速舔几下就让你恢复了状态，呼吸也变得顺畅了。牛头人不断地把粗大的精液喷射在你的身体上，直到你变成了一团黏糊糊的、散发着强烈牛头人信息素气味的烂泥，强烈的眩晕感淹没了你，你从那根还在高潮的牛头人肉棒上摔了下来，在你的[chest]和胯部接下了最后几股精液。你的双手本能地把几股精液铲进你的[assholeorpussy]");
         if(get_player().hasVagina())
         {
            outputText("，而你大脑中动物的那一部分则希望这能让你怀上一个同样粗壮的儿子");
         }
         outputText("。[pg]");
         get_player().knockUp(2,432,70);
         outputText("你咯咯笑着，踉踉跄跄地走到下一根排队的肉棒前转过身，脑子里满是用最直接的方式接受它的精液的想法——肛交。你掰开屁股瓣向后靠去，用你[asshole]的温暖让其中一只发情的野兽吃了一惊，你慢慢放松，包裹住他的龟头。他居然在你体内喷射出了一串串什么东西，但你和牛头人待得够久了，知道那不可能是精液，至少现在还不是。滑溜溜的先列腺液让你很容易就能向后摇晃，把自己钉在最前面的几英寸上，");
         if(get_player().analCapacity() < 80)
         {
            outputText("在药物麻木的痛苦中，享受着将自己撑开到超出正常容量的快感。");
         }
         else if(get_player().analCapacity() < 140)
         {
            outputText("享受着那种完美的充实感。");
         }
         else
         {
            outputText("欣喜地意识到你甚至能吞下比这更粗壮的阴茎！");
         }
         get_player().buttChange(90,true,false);
         outputText("[pg]你顺着那根抽搐的牛鞭滑下，直到你的[ass]拍打在墙上。你缓慢地退开，但随即又更用力地顶了回去。你肚子里、皮肤上，甚至弥漫在空气中的大量牛头人精液，已经把你变成了一个淫荡、饥渴的婊子。野兽拔出阴茎时，你发出哀怨的呜咽，感到空虚和无用，直到他再次猛插进来，提醒你你的使命。他开始狠狠地操你，完全不顾及你的感受，又深又快地抽插着他那根马屌。他包皮上的三个环圈每次");
         if(!get_player().hasCock())
         {
            outputText("穿过你的身体，触碰到你甚至不知道存在的敏感神经，直到你高潮，像个淫荡的婊子一样颤抖和摇晃。");
         }
         else
         {
            outputText("挤压着你的前列腺，让" + get_player().sMultiCockDesc() + "不断滴落和喷射，直到你再也无法忍受，像个淫荡的婊子一样颤抖着高潮。精液从[eachcock]中源源不断地流出，在地板上汇聚成水洼，慢慢流向一个无疑是通向水箱或贪婪地精小穴的排水口。");
         }
         outputText("[pg]");
         outputText("你的[legs]完全失去了力量，但你还是勉强支撑着，让你的种马在你体内弯曲他的阴茎，用更多强效的成瘾物填满你的后庭。你滑落下来，浑身无力，依然在经历高潮，精液从那根被遗弃的阴茎上如雨般落在你的背上，滚落下来，汇入地板上越来越大的体液水洼中。你茫然地微笑着，被比任何人能承受的还要多的牛头人精液弄得神志不清，你四肢着地爬起来，爬向下一个。还要更多……");
         get_player().orgasm("Lips",false);
         get_player().orgasm();
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         dynStats(DynStat.Lib(2),DynStat.Sens(2),DynStat.Cor(2));
         doNext(minotaurSalonFollowUp);
      }
      
      public function lynnetteApproval(param1:int = 0) : Number
      {
         var _loc2_:* = null as IMap;
         if(param1 != 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1023,FlagDict_Impl_.arrayReadInt(_loc2_,1023) + param1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1023) < -100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1023,-100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1023) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1023,100);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1023);
      }
      
      public function isDiscovered() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.HairdresserMeeting);
      }
      
      public function hairGrow() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         if(get_player().hair.type == 4)
         {
            outputText("当你要求接发时，林奈特怀疑地看着你。[say: 无意冒犯，亲爱的，但这东西基本上就像手臂或器官，而不是头发。我不是地精外科医生，即使我那个不听话的女儿在这里捐献一些零件，我也不会尝试去接长它。很抱歉让你白射了一场，但我帮不了你。也许我们可以做点别的？][pg]");
            salonPurchaseMenu();
            return;
         }
         outputText("林奈特抓起一个瓶子，把一种白色的液体喷到你的头发上。你真的希望这不是你的报酬。但这肯定不是，因为很快你就感觉到了增加的重量");
         var _loc1_:int = Utils.rand(3) + 3;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
         var _temp_1:* = get_player().hair;
         _temp_1.length = _temp_1.length + _loc1_;
         outputText("又长出了" + Utils.num2Text(_loc1_) + "英寸的[haircolor]头发。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hairDressingMainMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,441,1);
         }
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         outputText("林奈特提供并解释了他们的选项，[say: 那么，亲爱的，你想要什么？我们可以帮你剪短，或者做个拉长护理。或者你可以买个染发剂自己用。只要记得过几天回来补色就行。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,142) > 0)
         {
            outputText("[pg]当然，你也可以花点宝石买点半人马精液……");
         }
         salonPurchaseMenu();
      }
      
      public function hairDresserRepeatGreeting() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         get_images().showImage("location-salon");
         if(Utils.rand(5) == 0 && (get_player().hasPerk(PerkLib.MinotaurCumAddict) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) > 0))
         {
            minotaurCumBukkakeInSalon();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) == 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1025) > 0)
         {
            outputText("你一走进沙龙，林奈特就满面笑容地");
            if(get_player().get_tallness() >= 48)
            {
               outputText("抬起头");
            }
            outputText("看着你。[say: 嘿，亲爱的。是来享受更多服务，还是来看看孩子们的？]她拍了拍现在已经平坦的腹部。[say: 我昨晚把她们生下来了。我们有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1025)) + "个孩子……当然，全是女孩。]她把一绺做过精美造型的头发别在精灵般的耳后。[say: 现在，当你想要再次为我的精子库做贡献时，一定要告诉我。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1024) > 0)
            {
               outputText("[pg]可以看到几张新的绿色面孔正看向你这边，在寻欢洞工作时还红着脸，可能是一窝生下来的。她们长得真快。");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1024,FlagDict_Impl_.arrayReadInt(_loc1_,1024) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1025));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1025,0);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1027) == 1)
            {
               favoriteSalonMenu();
               return;
            }
            if(get_player().cockTotal() == 0)
            {
               outputText("[pg]她若有所思地敲了敲下巴。[say: 真遗憾你没有带把儿了。别担心，后面的寻欢洞在恶魔和怪物中很受欢迎，去后面接点精液，我们再看看怎么帮你弄头发，好吗？]");
               outputText("[pg]（寻欢洞里有几根鸡巴，你想处理哪一根（如果你愿意的话）？");
            }
            else
            {
               outputText("[pg]她若有所思地敲了敲下巴。[say: 你要享受我们的常规服务吗？每次头发护理只要一次口交！也许你想成为林奈特子宫的回头客？无需预约。或者你宁愿从后面的寻欢洞里拿我们的费用？]");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1023) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1027) == 0)
            {
               outputText("林奈特一看到你出现，简直是喜笑颜开，在你改变主意之前就把你赶进了她店里的大厅。你疑惑地看着她，想知道到底是什么让她这么兴奋，这时她宣布：[say: 听着，亲爱的，你把我肚子搞大的工作做得太棒了，我决定你应该得到一点奖励——除了把我填满之外。]说到这里，她的乳头似乎隔着衣服变硬了一点。[say: 你可以免费享受我们的任何常规服务，我那强壮、阳刚的……嗯……]她的眼睛短暂地闭上，一只手消失在裙子的开衩下。片刻之后，她猛地一震，把手抽了回来，有些不好意思地承认。[say: 我们免费给你做头发！只是别忘了时不时来把我肚子搞大，好吗？]");
               outputText("[pg]这似乎是笔划算的交易！");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1027,1);
               favoriteSalonMenu();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1027) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) < 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1025) > 0)
               {
                  outputText("林奈特因为肿胀的肚子挡着，把你迎进来有点困难。她已经怀有身孕，非常沉重，这可能是由于一些地精设计的化学物质加速了她的怀孕。她那极其丰满的臀部来回摇晃着，一摇一摆地走进沙龙深处，打招呼说：[say: 欢迎回来，小甜心。是来为事业捐款，还是来从你最喜欢的怀孕荡妇这里拿点免费赠品？]她把屁股扭向你，拍了一下，让它在她那件透明的裙子里颤动。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) < 4)
               {
                  outputText("地精林奈特去开门让你进来，挥手示意你往她店里走。她闪亮的黑色连衣裙几乎包不住她丰满的臀部和颤动的胸部，她向你打招呼：[say: 欢迎回来，小甜心！你本该顺道来填满我的烤箱的。我最后不得不动用我们的储备。]她深情地用一只手臂搂住你的腰，揉了揉你的腹部。[say: 我更想要我的勇者的孩子。]她抬头对你笑了笑，说：[say: 我相信你来这里不只是为了参观。你需要修剪一下，还是只想为我的小生意捐点款？]“捐款”这个词从她嘴里说出来，尽可能缓慢而性感。");
               }
               else
               {
                  outputText("在你把门闩转了不到一半的时候，林奈特就把门完全拉开了，以令人眼花缭乱的速度把你拉了进去。她把那对丰满得快要把裙子撑破的乳房贴在你的");
                  if(get_player().get_tallness() <= 48)
                  {
                     outputText("侧面");
                  }
                  else if(get_player().get_tallness() <= 68)
                  {
                     outputText("[hips]");
                  }
                  else
                  {
                     outputText("[leg]");
                  }
                  outputText("，她那如山峰般高耸的双乳紧紧压着你，力道之大，甚至在你身上留下了乳白的印记。");
                  outputText("[pg][say: 我最爱的种马，最近过得怎么样？] 她嘴里吐出甜言蜜语，同时开始抚摸你[armor]的胯部，问道：[say: 如果你想的话，我可以给你剪头发，但既然有个女人在你面前，等着被填满，为什么还要剪头发呢？] 她坏笑了一下。[say: 那么，你选哪个？]");
               }
               if(get_player().cockTotal() == 0)
               {
                  outputText("[pg]当她意识到你不再有那玩意儿时，她的表情沉了下来。[say: 亲爱的，你真该重新长出一根鸡巴来。这么完美的种马却装备不足，真是有点可惜。]");
               }
               favoriteSalonMenu();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1022) >= 4)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1026) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1026,1);
                  outputText("林奈特那张熟悉的脸再次在沙龙门口迎接你，她脸上挂着幸福的笑容，向你招手示意你进去。这件衣服像第二层皮肤一样紧贴着她，凸显出这位地精商人出人意料平坦的小腹；她没有怀孕！");
                  outputText("[pg][say: 发现什么让你喜欢的东西了吗，小甜心？] 这只地精扭动着她那适合生育的臀部，娇声说道。[say: 毕竟，女孩子不可能一直怀孕的。] 她轻轻擦拭着衣服上被突出的乳头弄湿的几处水渍，笑得有些夸张。");
               }
               else
               {
                  outputText("林奈特为你打开门，在你还没来得及欣赏她那丰满迷人的曲线时，就把你迎了进去。她的裙子轻薄透气，紧紧贴着她相对平坦的小腹，这表明她的子宫目前是空着的。从她看到你进来时那灿烂的笑容来看，她似乎还沉浸在产后的喜悦中。[say: 欢迎回来，亲爱的！是来找点乐子，剪个头发，还是两者都要？]");
               }
               if(get_player().cockTotal() == 0)
               {
                  outputText("[pg]她若有所思地敲了敲下巴。[say: 我看你还是没法自己支付我们的服务费。别担心，后面的寻欢洞在恶魔和怪物中很受欢迎，你只要去那里接点精液，我们再看看怎么帮你弄头发，好吗？]");
                  outputText("[pg]（寻欢洞里有几根鸡巴，你想处理哪一根（如果你愿意的话）？");
               }
               else
               {
                  outputText("[pg]她若有所思地敲了敲下巴。[say: 你需要我们的常规服务吗？每次理发只需要口交一次！也许你想试试林奈特的子宫？或者你更愿意从后面的寻欢洞里赚取我们的费用？]");
               }
            }
            else
            {
               outputText("地精林奈特应声开门，让你进去，挥手示意你往店里走。当她向你打招呼时，她那闪亮的黑色连衣裙几乎包不住她那丰满的臀部和晃动的胸部，[saystart]欢迎回来，亲爱的！");
               if(get_player().cockTotal() == 0)
               {
                  outputText("我看你还是没法自己支付我们的服务费。别担心，后面的寻欢洞在恶魔和怪物中很受欢迎，你只要去那里接点精液，我们再看看怎么帮你弄头发，好吗？[sayend]");
                  outputText("[pg]寻欢洞里有几根鸡巴，你想处理哪一根（如果你愿意的话）？");
               }
               else
               {
                  outputText("你需要我们的常规服务吗？每次理发只需要口交一次！或者你更愿意从后面的寻欢洞里赚取费用？[sayend]");
               }
            }
         }
         salonPaymentMenu();
      }
      
      public function hairDresserGreeting() : void
      {
         spriteSelect(SpriteDb.get_s_lynette());
         clearOutput();
         get_images().showImage("location-salon");
         outputText("你走进洞穴，眼前的景象出乎你的意料。洞穴的地面铺着光滑的木板，墙壁几乎完全被悬挂的镜子覆盖。少数几个钟乳石上钻了钩子，上面挂着成百上千把剪刀、剃须刀、梳子和其他美发工具。这让你想起了家乡的理发店。");
         outputText("[pg]墙边有几把椅子，穿着乳胶裙、戴着手套的地精们看起来很无聊。一看到你，她们就精神起来，兴奋地围着你吵闹，直到一个胸部大得反重力的地精把她们推开，向你打招呼。");
         outputText("[say: 我为我的女儿们道歉，]她一边说一边把身体贴向你。[saystart]她们大部分都是一群没脑子的荡妇。我叫林奈特，欢迎来到我的沙龙！你想剪头发还是接发？我们都能搞定，而且我们要的不多——只要一发精液。");
         if(get_player().cockTotal() == 0)
         {
            outputText("看起来你自己没有，但如果你需要的话，我们后面有寻欢洞。只是别吞太多，好吗？[sayend]");
            outputText("[pg]她带你来到洞穴的后面，那里用木板封了起来。木板上大约有20个洞，大部分都是空的。就在你看着的时候，几根新鸡巴滑了进来，地精的女儿们立刻开始给它们口交和操弄。只有几个你可以尝试——你要给其中一个口交吗（如果是的话，选哪个）？");
         }
         else
         {
            outputText("我甚至可以帮你个忙，让你射在我嘴里，我已经怀孕了。你觉得怎么样？想要一发精液和理发吗？还是你宁愿去后面的寻欢洞里拿你的报酬，你这个" + get_player().mf("变态男孩","调皮女孩") + "？[sayend][pg]");
            outputText("在沙龙的最深处，你可以看到一堵用木板封起来的墙，上面挖了些洞，其中一些目前正被各种怪物的阴茎塞着。你是让地精给你口交，还是去给其中一个口交来换取你的报酬？");
         }
         salonPaymentMenu();
         outputText("[pg]<b>（\"沙龙\"已添加到地点菜单中。）</b>");
      }
      
      public function hairDresser() : void
      {
         outputText("在探索这座山的时候，你发现了一扇巧妙隐藏的门。从里面你能听到磨刀的声音。你要进去吗？");
         doYesNo(salonGreeting,get_camp().returnToCampUseOneHour);
      }
      
      public function growBeard(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         clearOutput();
         if(param1 == 1)
         {
            if(get_player().mf("m","f") == "f")
            {
               outputText("林奈特盯着你。[say: 你不觉得当个长胡子的女人看起来很奇怪吗？]她问道。[pg]");
               outputText("你向她坚持说你真的很想要胡子，不管你是男是女。[pg]");
               outputText("[say: 好吧……那我现在就开始了，]她说。");
            }
            outputText("[pg]林奈特抓起一个瓶子，把一种白色的液体喷在你的下巴和脸颊上。你真希望那不是你付的报酬。但肯定不是，因为没过多久，你的新胡子就长出来了！");
            get_player().beard.length = 0.2;
            outputText("[say: 在你离开之前，我会让你选择你想要的款式，]她说。[pg]");
            changeBeardStyle(true);
            return;
         }
         if(get_player().hair.type == 4)
         {
            outputText("当你要求做加长护理时，林奈特半信半疑地看着你。[say: 无意冒犯，亲爱的，但那东西基本上就像手臂或器官，而不是胡子。我不是地精外科医生，即使我那些不听话的女儿在这里捐献一些零件，我也不会尝试去加长它。很抱歉让你白跑一趟，但我帮不了你。也许我们可以做点别的？][pg]");
            beardMenu();
            return;
         }
         outputText("林奈特抓起一个瓶子，把一种白色的液体喷在你的下巴和脸颊上。你真希望那不是你付的报酬。但肯定不是，因为没过多久，你就感觉到了增加的重量，那是");
         _loc2_ = int((5 + Utils.rand(5)) / 5);
         var _temp_1:* = get_player().beard;
         _temp_1.length = _temp_1.length + _loc2_;
         outputText(Utils.num2Text(_loc2_) + "英寸");
         if(_loc2_ >= 2)
         {
            outputText("");
         }
         outputText("的[haircolor]胡子。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function goblinHairDresserFacefuck() : void
      {
         var paid:Boolean;
         var _g:Salon;
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         get_images().showImage("lynnette-blowjob");
         outputText("林奈特舔了舔嘴唇，几乎是撕扯着扒开了你的[armor]，几秒钟内就让你的胯部暴露无遗。你的[cock]立刻弹了出来，在勃起时拍打在她的鼻子上。她双手环抱住你，开始熟练地套弄起来，舌头在你的龟头上轻弹，嘴唇包裹住");
         if(get_player().cocks[0].cockThickness >= 4)
         {
            outputText("尽可能多地包裹住你");
         }
         else
         {
            outputText("包裹住你最前面的几英寸");
         }
         outputText("。她的舌头滑入你的尿道，然后弓起背，解开裙子上的吊带，让她那对硕大的乳房吞没你的肉棒。乳汁从这位正在泌乳的地精身上喷溅滴落，润滑着她的乳房和双手，她取悦着你的每一寸肌肤。[pg]");
         outputText("在接受如此专业的刺激时，你根本无法忍住，你射出了精液，把她的脸颊撑得像松鼠一样鼓鼓的。");
         if(get_player().cumQ() >= 250)
         {
            outputText("她无法全部含住，突然开始吞咽，精液从她的鼻子里流出，顺着她的嘴唇流下。");
         }
         outputText("过了一会儿，一切结束了，她退了回去，把大部分精液吐进了一个漏斗里。精液顺着管子流了下去，你不得不怀疑管子的另一端是不是有个发情的地精女孩正张开双腿等着。");
         outputText("[pg]这位地精理发店老板娘稍微咳嗽了几下，然后舔干净嘴唇，对你露出了灿烂的笑容。[pg]");
         get_player().orgasm("Dick");
         _g = this;
         paid = true;
         doNext(function():void
         {
            _g.hairDressingMainMenu(paid);
         });
      }
      
      public function gloryholeMinotaur() : void
      {
         var paid:Boolean;
         var _g:Salon;
         clearOutput();
         get_player().slimeFeed();
         outputText("你的目光被那根巨大的牛头怪肉棒吸引，本能地跪在它面前。[pg]");
         outputText("它是这个房间里目前最大的一根肉棒，从你跪着的位置看，它显得更加巨大；它有两英尺多长，长度上分布着三个包皮环。你勉强能用整只手握住它的粗细。你张大嘴巴向前倾身，把粗大、海绵状的龟头含进嘴里。味道非常浓烈，它的麝香味就像牛头怪的肉棒一样浓郁。你舒服地呻吟着，开始前后晃动脑袋，把越来越多的肉棒含进嘴里。你配合着吸吮的节奏套弄着剩下的肉棒。你能听到墙的另一边传来沉闷的咕噜声和喷鼻息声，显然是你的伴侣发出的赞许声。[pg]");
         outputText("在牛头怪反应的驱使下，你把越来越多的牛头怪肉棒含进嘴里。当你用嘴对付第一个环时，你解开了[armor]的上半部分，释放出你的" + get_player().allBreastsDescript() + "。每一次吞吐，你都能把更多的公牛肉棒吞进喉咙。你抚摸着你的" + get_player().biggestBreastSizeDescript() + "，同时含着肉棒呻吟。当你的嘴含住第二个环时，牛头怪的肉棒剧烈地跳动了一下，他的精液在你的嘴里爆炸了。你震惊地瞪大了眼睛，尽可能快地拔出肉棒。你吞下了最初几股浓稠、丰富的牛头怪精液，而剩下的则射了你一脸和一胸。你");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("托起");
         }
         else
         {
            outputText("弓起背，露出");
         }
         outputText("你的[chest]，任由精液如雨点般落在你身上。当他的高潮停止，肉棒软下来时，你的脸和[chest]上已经覆盖了一层厚厚的精液。[pg]");
         outputText("牛头怪的麝香味让你头晕目眩，你漫不经心地擦拭并吞下[face]上的精液。一个地精助手拿着一个碗走进来，用一块光滑平整的石头轻轻刮掉你胸部的精液。等你清理干净并穿好衣服后，助手把你带回了林奈特那里。[pg]");
         dynStats(DynStat.Lust(33),DynStat.Cor(1));
         get_player().orgasm("Lips",false);
         get_player().refillHunger(30);
         get_player().minoCumAddiction(10);
         _g = this;
         paid = true;
         doNext(function():void
         {
            _g.hairDressingMainMenu(paid);
         });
      }
      
      public function gloryholeIncubus() : void
      {
         var paid:Boolean;
         var _g:Salon;
         get_player().slimeFeed();
         clearOutput();
         outputText("你跪在那根跳动的恶魔肉棒前，准备赚取你的报酬。[pg]");
         if(Math.max(get_player().cor,Math.max(get_player().lib,get_player().get_lust())) < 33)
         {
            outputText("你挑了这根肉棒，希望为男性魅魔服务能带来最大的快感，从这根肉棒散发出的令人愉悦的辛辣气味来看，你猜对了。你张大嘴巴把它含进去，感觉到冠状沟周围的凸起紧贴着你的嘴唇。一滴先列腺液滴在你的舌头上，味道美妙极了，激励着你去取悦这根堕落的肉棒。你双手抓住它开始套弄，一边舔舐吸吮着龟头，一边感受着手指下腐化的结节，渴望得到更多。你很快就得到了回报，你急切地开始吞咽那汹涌而来的液体。谢天谢地，男魅魔的高潮似乎持续了很久，当他射完时，你的肚子已经饱了，嘴里也塞满了白浆。你设法忍住了最后一口没有咽下去，因为你还需要用它来付账。[pg]");
            dynStats(DynStat.Lust(1),DynStat.Cor(1.5));
         }
         else
         {
            outputText("你用手握住那根堕落的肉棒，引导它进入你等待着的嘴里，渴望尝试一次狂野的体验。男魅魔的肉棒没有让你失望，很快就滴下了源源不断的、味道奇妙的先列腺液，这只让你更加渴望恶魔的精液。你向前倾身，把大部分凹凸不平的紫色肉棒含进嘴里，用舌头舔遍它的全身，特别关照了他冠状沟底部边缘的一圈结节。你很快就得到了回报，一股如天堂般美妙的恶魔种子喷涌而出。你大口吞咽着，渴望得到更多，谢天谢地，男魅魔有足够的量给你。当他射完时，你已经浑身发抖，欲火焚身，但谢天谢地，你有足够的意志力在嘴里留下一口精液作为报酬。[pg]");
            dynStats(DynStat.Lust(1),DynStat.Cor(1));
         }
         if(get_player().get_lust() < 99)
         {
            get_player().set_lust(99);
         }
         get_player().orgasm("Lips",false);
         get_player().refillHunger(35);
         statScreenRefresh();
         _g = this;
         paid = true;
         doNext(function():void
         {
            _g.hairDressingMainMenu(paid);
         });
      }
      
      public function gloryholeImp() : void
      {
         var paid:Boolean;
         var _g:Salon;
         get_player().slimeFeed();
         clearOutput();
         outputText("你走到墙上的洞前，看着那根你必须服侍的勃起的恶魔肉棒。从它的高度和不断上下晃动的幅度来看，那只小恶魔一定在另一边盘旋，拼命想留在洞里。[pg]");
         if(Math.max(get_player().cor,Math.max(get_player().lib,get_player().get_lust())) < 33)
         {
            outputText("你努力把嘴凑到面前这个怪物身上，心里纳闷自己为什么要这么做。你的头上下晃动，试图配合那根粗大的恶魔工具的动作，你抓住它，把它引导进你的嘴里。它很烫，比你想象的还要烫，滴着令人作呕的甜腻先列腺液，让你浑身发麻。你全身心地投入到这项悲惨的任务中，只想尽快完成它。你的舌头在那些结节上打转，当它在你嘴里膨胀时，你紧紧抓住它，把一团黏糊糊的精液射进你的喉咙。你咳嗽着，喷溅着，吞下了大部分，但你还是设法保留了足够的量作为你的报酬。[pg]");
            dynStats(DynStat.Lust(15),DynStat.Cor(0.5));
         }
         else if(Math.max(get_player().cor,Math.max(get_player().lib,get_player().get_lust())) < 66)
         {
            outputText("你张大嘴巴，上下晃动，努力配合在你面前摇晃的奇怪鸡巴。最后，你双手环抱住它凹凸不平的根部，稳住它，然后吞下那根跳动的恶魔鸡巴，尽可能多地把它含进嘴里。你挤压并抚摸它，舔舐着冠状沟周围的结节，黏糊糊的精液开始从中喷涌而出。这个小家伙的耐力不怎么样，但他一定憋了很久，因为他的种子淹没了你的嘴和喉咙。你努力吞咽以跟上节奏，但当他结束时，你气喘吁吁，浑身沾满了白浊。[pg]");
            dynStats(DynStat.Lust(35),DynStat.Cor(1));
         }
         else
         {
            outputText("你立刻向前扑去，享受着再次吸收恶魔精液的想法。当你的嘴唇顺着那根质地奇特的肉棒向下移动，吞没了近10英寸长的恶魔阴茎，感觉到它压迫着你的喉咙时，你的腹股沟一阵酥麻。你卷起舌头开始前后滑动，立刻得到了浓稠的先列腺液作为奖励。另一端的小恶魔立刻失去了控制，当你向前推挤，将他连根吞下时，一波波的精液直接喷射进你的肚子里。你感觉到他在跳动，及时抽身，将最后几股精液吞入口中，为你留给地精的报酬攒着。[pg]");
            dynStats(DynStat.Lust(45),DynStat.Cor(2));
         }
         get_player().orgasm("Lips",false);
         get_player().refillHunger(25);
         outputText("突然，那根恶魔肉棒从你的手中滑落，缩回了洞里。你听到一声沉闷的撞击声，似乎有什么东西掉在了地上。可怜的家伙。[pg]");
         _g = this;
         paid = true;
         doNext(function():void
         {
            _g.hairDressingMainMenu(paid);
         });
      }
      
      public function gloryholeDoggie() : void
      {
         var paid:Boolean;
         var _g:Salon;
         get_player().slimeFeed();
         clearOutput();
         outputText("你叹了口气，跪下身子，让自己与墙上伸出的那根狗肉棒平齐。它的顶端尖尖的，底部有一个肿胀的圆形肉结。事实上，这根狗肉棒的主人一定很兴奋能来这里——它正滴着精液，肉结肿得太大了，根本缩不回洞里。[pg]");
         if(Math.max(get_player().cor,Math.max(get_player().lib,get_player().get_lust())) < 33)
         {
            outputText("你费力地张开嘴，把这个奇怪的东西含进嘴里。你觉得自己像个怪胎，但还是强迫自己开始工作，为今天将要为你提供头发护理的雄性服务。它尝起来又咸又充满汗味，还有一种强烈的麝香味，尽管你理智上觉得不妥，但还是被它激起了性欲。你发现自己开始沉浸其中，一边舔舐一边吸吮，发出愉悦的哼声。你伸手去摸那个肉结，狗肉棒在你的嘴里跳动了一下，喷出一大股浓稠的精液到你的喉咙里。你退出来大半，套弄着肉棒，把精液收集在嘴里。[pg]");
            dynStats(DynStat.Lust(15),DynStat.Cor(0.25));
         }
         else if(Math.max(get_player().cor,Math.max(get_player().lib,get_player().get_lust())) < 66)
         {
            outputText("你张大嘴巴，尽可能多地把那根尖尖的肉棒含进嘴里。有几次你差点被噎住，但你还是设法吞到了那根粗大肿胀的肉结处。你开始前后滑动，呼吸着你的“客户”身上散发出的充满野性的麝香味，越来越被这种情境所唤起。你伸手抚摸着肉结，轻轻挤压并套弄着肉棒，直到它把一大股浓稠的精液射进你的嘴里。你退出来，在嘴里接住你的劳动成果，用手挤奶般地套弄着肉棒，直到它射完，然后肉棒缩回了洞里。[pg]");
            dynStats(DynStat.Lust(25),DynStat.Cor(0.25));
         }
         else
         {
            outputText("你扑向那根肿胀的狗肉棒，轻松地将它整个吞下，嘴唇在粗大的肉结周围张得大大的。你能感觉到它在你的喉咙里顶着悬雍垂，但你像个好荡妇一样设法抑制住了呕吐反射，一边对付着这根汗津津的肉棒，给它洗了个彻底的舌头浴。你的嘴唇包裹住肉结的底部，感觉它开始撑开你的下巴。在它把你卡住之前，你退了出来，用手挤压着肉结。它高潮了，把一大股黏糊糊的精液射进你的嘴里。[pg]");
            dynStats(DynStat.Lust(30),DynStat.Cor(0.3));
         }
         get_player().orgasm("Lips",false);
         get_player().refillHunger(10);
         outputText("一个年轻的地精拿着一个碗走过来，让你把报酬吐进去。你吐出那些黏稠物并擦了擦嘴，地精端着精液离开了。你注意到她身后的地上有一串透明的水滴。她一定是在期待着什么……");
         _g = this;
         paid = true;
         doNext(function():void
         {
            _g.hairDressingMainMenu(paid);
         });
      }
      
      public function giveCumToLynnette(param1:int) : void
      {
         clearOutput();
         outputText("你向林奈特展示了那瓶" + (param1 == 0 ? "牛头怪" : "乌尔塔的") + "精液。林奈特小心翼翼地从你手里接过瓶子，说道，[say:我很乐意收下这些，谢谢。现在我能为你做点什么？]");
         if(param1 == 0)
         {
            if(get_player().hasItem(get_consumables().MINOCUM))
            {
               get_player().destroyItems(get_consumables().MINOCUM,1);
            }
            else
            {
               get_player().destroyItems(get_consumables().P_M_CUM,1);
            }
         }
         else if(param1 == 1)
         {
            get_player().destroyItems(get_consumables().URTACUM,1);
         }
         salonPurchaseMenu(true);
      }
      
      public function giveCumOptions() : void
      {
         var _g2:Salon;
         var type1:int;
         var _g1:Salon;
         var type:int;
         var _g:Salon;
         menu();
         if(get_player().hasItem(get_consumables().MINOCUM) || get_player().hasItem(get_consumables().P_M_CUM))
         {
            _g = this;
            type = 0;
            addButton(0,"牛头怪",function():void
            {
               _g.giveCumToLynnette(type);
            });
         }
         if(get_player().hasItem(get_consumables().URTACUM))
         {
            _g1 = this;
            type1 = 1;
            addButton(1,"乌尔塔的",function():void
            {
               _g1.giveCumToLynnette(type1);
            });
         }
         _g2 = this;
         addButton(14,"返回",function():void
         {
            _g2.salonPaymentMenu();
         });
      }
      
      public function fuckLynnette() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         get_images().showImage("lynnette-fuck");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1028) == 0)
         {
            outputText("在你的建议下，林奈特的睫毛危险地低垂下来。她给了你一个迷离的眼神，问道：[say: 是吗？]她绕着你转圈，用似乎能看穿你[armor]的眼睛上下打量你。她一定看到了她喜欢的东西，因为她向前倾身，将她沉甸甸的乳房分开在你的");
            if(get_player().get_tallness() >= 72)
            {
               outputText("[leg]");
            }
            else if(get_player().get_tallness() >= 55)
            {
               outputText("[hips]");
            }
            else
            {
               outputText("侧面");
            }
            outputText("以便她能将修剪整齐的手滑进你的内衣里。她依次抚摸[eachCock]");
            if(get_player().cockTotal() > 1)
            {
               outputText("依次");
            }
            outputText("手法娴熟得像个弄蛇人，然后");
            if(get_player().balls == 0)
            {
               outputText("在你的[sheath]附近按压");
            }
            else
            {
               outputText("用她娇小的手指卷住你的[sack]掂量着");
            }
            outputText("。");
            if(get_player().get_hoursSinceCum() < 24)
            {
               outputText("[pg]一声娇笑从她唇间溢出。[say: 抱歉，[name]，除非我能怀上一打女儿，否则我是不会怀孕的。]她依依不舍地捏了捏你的下体，然后抽出手，顺势用手掌抚摸过你敏感的腹股沟和腹部。[say: 我需要浓稠、粘腻、憋了很久的精液，它们会拼命地让每一个能碰到的卵子受精。]她一想到这里就浑身发抖，说道：[say: 等你整整二十四小时没射精再来找我吧。到时候你就可以让我怀孕了……前提是还没有其他幸运的种马捷足先登。]");
               outputText("[pg]她舔去手指上你的气味，问道：[say: 那么，你还有其他想支付的方式吗？]");
               salonPaymentMenu();
               return;
            }
         }
         else
         {
            outputText("林奈特听到你的决定，舔了舔嘴唇，摇曳生姿地走上前来。她那巨大的臀部摇摆得如此性感，以至于她那丰满的屁股简直像是在引发一场性爱地震。[say: 你能理解我们先快速检查一下吧，对吧，[name]？]她没有等你的回答，就紧紧贴在你身上，让你能清楚地感觉到她那柔软、湿透的双乳贴合着你的身体曲线，让林奈特娇小身躯每个毛孔散发出的湿热气息浸透你裸露的[skinfurscales]。她的手未经允许就直接伸进了你的内衣，紧紧抓住[oneCock]掂量着。");
            outputText("[pg]你发出一声赞赏的呻吟，[eachCock]在淫荡的享受中抽搐着，因为");
            if(get_player().get_lust100() <= 75)
            {
               outputText("它几乎立刻就胀到了最大尺寸");
            }
            else
            {
               outputText("它完全勃起的状态显露无疑");
            }
            outputText("。林奈特抚弄了几下，确保你已经充分充血，然后手指向下移，捏了捏");
            if(get_player().balls == 0)
            {
               outputText("你的[sheath]周围，感觉一下你憋了多久");
            }
            else
            {
               outputText("轻轻地捏着你的[balls]，在手掌中掂量着，感觉一下你到底憋了多久");
            }
            outputText("。");
            if(get_player().get_hoursSinceCum() < 24)
            {
               outputText("[pg]她脸上慢慢浮现出皱眉的表情。[say: [name]，这可不行。我需要焦急、饥渴的小精子，它们会以足够的力量从你的鸡巴里冲出来，让我的卵巢受孕。如果你总是射精，我就得不到这些。等你二十四小时没射精再来，我会给你一个合适的地方射……如果还没有人抢在你前面的话。你想留下来用其他方式支付吗？]");
               salonPaymentMenu();
               return;
            }
         }
         outputText("[pg]林奈特娇嗔道：[say: 就是这个……你让它等了一个又一个小时，烤得香喷喷、坏坏的种子。]她期待地颤抖着。[say: 你要把每一滴粘稠的东西都塞进我里面，它会浓稠得把我的小穴粘住，直到生产的时候。明白了吗？]她用近乎痛苦的力度紧紧捏住[oneCock]，把你完全勃起的阴茎握在手心里，同时轻松地脱下你的[armor]。[say: 是的，你会的……哦，这正是我今天需要的，]这个绿皮肤的女人叹息着，一边揉搓着你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("[sheath]");
         }
         outputText("眼中充满饥渴。");
         outputText("[pg]林奈特把你脱下的[armor]扔过肩膀，拉着你最大的[cock biggest]，朝一个巧妙隐藏的侧室走去。她那丰满、摇晃的屁股随着每一步像一个淫荡的节拍器一样来回摆动，摇晃的幅度刚好让你的眼睛几乎被迷住，追踪着闪烁的裙子上反光，那裙子试图包裹住她那非人般多汁的丰乳肥臀，却失败了。发现你在盯着看，她给了你一个更温柔、更安慰的捏弄。[say: 等着看我脱下这件衣服吧，亲爱的……尽量忍住别射，直到我们把你放进我里面。]");
         outputText("[pg]你点点头，踢上了林奈特房间的门。这间卧室和它的主人一样，是个紧凑的小房间，四面都是近在咫尺的洞穴墙壁，但天花板至少有十英尺高，确保这个空间对从地精到牛头怪的任何生物来说都很舒适。林奈特的床大得离谱，几乎占据了整个房间。这位地精主母终于放开了你，跳上她的床，转身面对你。");
         outputText("[pg]林奈特从一侧松垮的肩带开始，慢慢将上衣边缘拉下，露出她那饱满的翠绿色乳晕，却又没让你完全看到她那坚挺的乳头。包裹着乳头的紧身布料颜色微微变深，被一股急切分泌的乳汁染湿，紧贴在皮肤上，将这位曲线优美的美女的整个乳房形状展露无遗。她在另一侧重复了这个动作，让裙子的两侧完全挂在她淫荡凸起的乳头上，随着她来回摇晃，那布满颗粒的乳晕上半部分肆无忌惮地展示在你游移的目光中。她的双乳像淫荡的玩具一样弹跳摇晃，以乳波荡漾的力度碰撞在一起，然后又弹开，每一次撞击都让裙摆下沉得更低，直到她那凸起的乳头完全弹出来。");
         outputText("[pg]就像泄了气的皮球一样，林奈特那薄如蝉翼的裙子摇摇晃晃地滑落，堆积在她那丰满得有些夸张的臀部上方，在腰间形成了一圈褶皱。她在床上弹跳着，让那对毫无支撑的乳房放肆地波动起来，最终从两颗解放的乳头上喷射出乳白色的奶水。她像肚皮舞娘一样扭动着臀部，白色的奶水顺着她颤抖的翠绿色腹部流下，裙子也随之越滑越低，最终露出了她阴部上方那片泛着深红色的肌肤。她眨了眨眼，将沾满奶水的布料从她那深色、燃烧着情欲的阴阜上剥离，分离的声音清晰可闻。长长的、充满女性气息的淫液在布料和林奈特的身体之间拉出丝线，在断裂前短暂地连接着，然后滴落在她那丰满圆润的大腿上。");
         outputText("[pg]林奈特仰面倒在枕头上，床铺随之弹跳。你看着她那对巨大的乳房——简直比牛娘的还要大，完全不像是地精该有的尺寸——在自身的重量下微微扁平，展现出它们真正的规模。她脖子以下、肚脐以上的部分完全被一片翠绿色的乳肉海洋所覆盖，而这位地精显然很乐意展示这一点，她将手指深深陷入其中，让指尖消失在那柔软无比的肉垫里。她呻吟着张开双腿，让你能看得更清楚，同时向你抛出你见过的最饥渴的媚眼。她那饱满、沾满爱液的下唇微微张开，邀请你来填满它们。你很清楚她已经生过很多女儿了，但她那完美无瑕、如孔雀石般隆起的阴部却没有任何磨损的迹象，反而闪烁着光泽，证明了她种族天生的弹性。");
         outputText("[pg][say: 上我，]地精向你展示着她赤裸的身体，低吼道，[say: 我想感觉你在我里面，[name]。我想让你为我射精。]她淫荡地笑了。[say: 你一定会为我射精的。]她眼中闪烁的坚定光芒让你心中毫无怀疑。她肯定会被射满一逼的精液，而你唯一能做的就是满足她。");
         outputText("[pg]在你爬上床给她应得的疼爱之前，你闻到空气中弥漫着一种甜美且不可否认的……充满生育气息的味道。这显然是这位绿色主母发情时散发的充满费洛蒙的气味，浓郁地悬浮在空气中，渗入你的体内。你的男性象征毫不掩饰地抽动着");
         if(get_player().cockTotal() > 1)
         {
            outputText("已经");
         }
         else
         {
            outputText("已经");
         }
         outputText("开始渗出透明的先列腺液。它们顺着你那肿胀、渴望的精管下方流下");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("并加速流向你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("[sheath]");
         }
         outputText("，在它们流过的轨迹上留下一层闪亮的、充满性欲的光泽，而且你盯着林奈特那翠绿色的阴部看的时间越长，吸入她那让人勃起的气味越多，它们流出的速度就越快。");
         outputText("[pg][say: 操我，]这个痴迷于怀孕的荡妇乞求着，同时将一只手伸向她的阴部，将阴唇大大地掰开，露出一条闪烁着紫水晶光泽的通道，向所有进入的人承诺着极致的快感。");
         outputText("[pg]你爬上床，一只手握着[oneCock]，眼睛色眯眯地盯着你那翠绿色的战利品，当你爬到位置上时，你的老二渗出滚烫的先列腺液，滴落在你那等待征服的猎物光滑的大腿上。她用恳求的眼神看着你，等待着不可避免的插入，她抓住你的手，按在她那湿透的阴户上。这种感觉让你隐约想起把手放在一锅沸水上方，滚烫的蒸汽在你的手上凝结成水珠。这就决定了；你现在绝对需要操她！你的老二");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("不会接受拒绝。");
         var _loc1_:int = get_player().cockThatFits(80);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("[pg]你粗暴地将自己挪到位置上，发出一声闷哼，你与这个不知羞耻的荡妇四目相对，用一个眼神让她知道你将要多用力地操她，她的阴户将会被捣得多完美。那个表情让她毫不怀疑自己即将变成罗圈腿，而这个小荡妇只是咧嘴笑了。你像一头狂暴的公牛一样毫不掩饰地向前挺进，将你的" + get_player().cockHead(_loc1_) + "狠狠地撞进她那流着口水的三角区，感觉她的阴唇紧紧贴着你的粗壮，被撑成一个紧紧挤压着老二的O型环，不知为何紧紧地包裹着你，但又比任何女人都更有弹性。");
         if(get_player().cockArea(_loc1_) > 50)
         {
            outputText("她的肚子凸显出你肿胀肉棒的轮廓，清晰地展示出你那根能把婊子操坏的巨根的形状，因为它正顺着");
            if(get_player().cockArea(_loc1_) <= 80)
            {
               outputText("她的肚子向上移动。");
            }
            else
            {
               outputText("进入她的胸腔，插入的深度是任何低等种族都无法承受的。");
            }
         }
         outputText("这个生育机器抓住你的[hips]，用她那微薄的力量拼命拉扯。");
         if(get_player().cockArea(_loc1_) <= 90)
         {
            outputText("你狠狠地撞击她，力度大到溅出一片少女的淫液，你将自己完全没入");
            if(get_player().balls > 0)
            {
               outputText("，[balls]贴在她湿润多汁的屁股蛋上。");
            }
         }
         else
         {
            outputText("你终于停了下来，低头一看，发现她并没有完全吞下你。再深入可能会弄疼她，破坏气氛，所以你只能进行部分抽插。");
            if(get_player().balls > 0)
            {
               outputText("她的双脚缠住你的[sack]，深情地挤压着你的[balls]，很好地弥补了她自身的不足。");
            }
         }
         outputText("[pg]林奈特真是湿透了！她的阴户就像一个湿漉漉的火炉，紧紧包裹着你的" + get_player().cockDescript(_loc1_) + "，紧紧地夹住你，让你保持不动，同时她也在适应这根坚硬跳动的肉棒的形状和大小。随着你的骑乘，她脸上浮现出幸福而无脑的笑容，尽管她的双手仍然固执地放在你的臀部，帮助你不要在她准备好之前就猛烈抽插。当你动弹不得时，你决定利用这个地精的其他特征，尽可能多地抓住她那巨大的乳房。你的手勉强能覆盖住那肿胀胸部的四分之一，你的手指深深地陷入那柔软的绿色肌肤中，当你把手移到她的乳头附近时，这位理发师发出了一声愉悦的喘息。");
         outputText("[pg]林奈特因为乳头传来的强烈快感而失去了对腹部肌肉的控制，她那紧紧夹住你肉棒的力道也随之崩溃，你终于可以自由地在她那喷涌的下体中抽插了。你把你的" + get_player().cockDescript(_loc1_) + "拔出，直到只剩下龟头还埋在她那带着紫色的内壁里，然后，就像你最初插入时一样，用力地把它猛插回去。她的双手从你的[hips]滑落到床单上，抓起一把把越来越脏的布料，紧紧攥住。包裹着你的蜜穴不受控制地颤动着，随着你强有力的抽插而疯狂地收缩，将你的先列腺液与她自己分泌的大量爱液混合在一起，直到那越来越肿胀的入口处流出白色的浆液。");
         outputText("[pg]这位沉浸在幸福中的地精翻了个白眼，一秒钟后眼皮就垂了下来，她大叫道：[say:哦，操，对，就是那里！操我！操我！好爽！]她的身体颤抖着，伴随着一声愉悦的尖叫。[say:你要让我高-高-高潮了……！]林奈特那丰满的生育大腿随着她所驾驭的激情浪潮而翻滚，有节奏地挤压着你的肉棒，那不经意的肌肉收缩感觉太好了，几乎要把精液直接从你的[balls]里吸出来。");
         outputText("[pg]不知怎么的，你并没有立刻把精液射进这个正在按摩你肉棒的地精阴户里。在一种强烈的、本能的冲动驱使下，你继续将你那坚硬如铁的阳具在林奈特那散发着麝香的阴道里抽插，把爱液溅得到处都是。困在你的[balls]里的种子在翻滚沸腾，你的身体正在竭尽全力地将产量最大化");
         if(get_player().balls > 0)
         {
            outputText("，让你的阴囊感觉紧绷，睾丸肿胀而敏感。");
         }
         else
         {
            outputText("，让你的肠胃因为近乎高潮的收缩而紧绷痉挛。");
         }
         outputText("你体内积聚了海啸般的精液，以至于憋着它实际上已经开始让你感到疼痛，但同时，你的身体也拒绝屈服，不愿就此高潮。");
         outputText("[pg]林奈特那巨大的、滴着奶水的乳头就像它们所像的翠绿火山峰一样爆发了，喷涌出象牙色的奶油，形成淫荡的瀑布，冲刷着你们俩，就像一种甜美、光滑的润滑剂，让她的双腿可以轻松地在你的双腿上滑动。当你的双手附着在她那漏奶的乳房上时，她发出呜咽声，就像被磁力吸引一样，你挤压它们，捏住水流，然后释放压力，让她喷出巨大的、脉动的乳汁。她大叫道：[say:挤我的奶！像挤一头肮脏的母牛荡妇一样挤我的奶！]她的背部抬起，将那些喷水的乳头更紧密地压在你的手指之间，因为又一次高潮，虽然比第一次小，但还是席卷了她娇小柔嫩的身体。");
         outputText("[pg]你的抽插从有力的冲刺变成了疯狂的打桩，力量之大，甚至让冲击力沿着她丰满的大腿和屁股荡起阵阵涟漪。当你像一头发情的野兽一样骑在这只地精身上时，就连她那喷着奶水的乳房也随着你猛烈操弄小穴的冲击而摇晃颠簸，你用你的" + get_player().cockHead(_loc1_) + "猛烈撞击着");
         if(get_player().cockArea(_loc1_) > 24)
         {
            outputText("她那微微退让的子宫颈");
         }
         else
         {
            outputText("尽可能深地靠近子宫颈");
         }
         outputText("，当你沉浸在她那湿润、天鹅绒般的隧道中时，你发出咕噜声和咆哮声。你的注意力完全集中在包裹着你的那条光滑隧道的触感上，以及你能插得多深，你能让她产生多强烈的高潮并紧紧夹住你。");
         outputText("[pg]在令人失去理智的高潮间隙，林奈特抬头看着你，撅起她那肿胀的、吸过肉棒的嘴唇舔了舔。她伸出双臂紧紧搂住你的脖子，她把你拉下来时的力量让你感到惊讶，她引导你的嘴唇贴上她湿润的嘴唇，进行了一个热切的吻。当你们嘴对嘴地依偎在一起时，她的嘴唇在你的嘴唇上滑动，你的臀部还在运动，你们交换着唾液，在你们成对的口腔之间来回地用舌头交锋。她的一只手紧紧抓住你的[hair]，打破了这个吻，时间长到足以让她咆哮：[say:射。现在。]");
         outputText("[pg]你的身体早就准备好爆发了，这句话就像一个不可抗拒的触发器，引发了你的高潮，让你把你的" + get_player().cockDescript(_loc1_) + "");
         if(get_player().cockArea(_loc1_) <= 90)
         {
            outputText("再次完全插入");
         }
         else
         {
            outputText("尽可能深地插入");
         }
         outputText("并停留在那里。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("正在");
            }
            else
            {
               outputText("正在");
            }
            outputText("痉挛着");
            if(get_player().longestCockLength() <= 12)
            {
               outputText("在这个贪婪的绿色荡妇的肚子上");
            }
            else
            {
               outputText("在她双乳间那沾满乳汁的沟壑里，完全埋入那柔软的乳房中");
            }
            outputText("，狂野地喷射着精液。精液和所有的地精淫水混合在一起，变成了一滩黏糊糊的泥沼，把林奈特染成了白色。");
         }
         outputText("伴随着释然的尖叫，你能感觉到精液从你的[balls]中涌出，穿过你的身体，顺着你那深埋在阴道里的肉棒流下，使它膨胀起来，一团团精液滚过那蜜汁四溢的褶皱，在那个丰满地精的子宫颈上炸开。精液触碰到子宫口的瞬间，你的爱人再次陷入了浑身颤抖的高潮；她翻着白眼，小穴紧紧夹住，最重要的是，她的子宫颈扩张成一个大开的洞，以你射精的速度将精液直接吸入她的子宫。");
         outputText("[pg]当你将提纯的欲望倾注进这个幸运女人的子宫时，一双小手紧紧抓住了你的肩膀，深深地陷入了你的[skinfurscales]中。林奈特的嘴唇再次猛烈地贴上你的，她的舌头钻进你的嘴里，然后咬住你的下唇，用力地咬着，让你感到一阵疼痛。她翻着白眼，身体因为极度的快感而颤抖，看起来几乎像是在抽搐。你的肉棒和她那渴望精液的子宫一样，根本不在乎这些，这两个器官正忙着交换遗传物质，根本无暇顾及它们主人的状态。");
         if(get_player().cumQ() < 1000)
         {
            outputText("[pg]转眼间，你已经射完了，而林奈特的子宫吞下了每一滴精液。她那诱人的裂隙流出的汁液变得清澈，让你相信她那贪婪的子宫把所有的精液都吞了下去。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("[pg]从你体内涌出的精液如此之多，以至于林奈特原本紧绷的肚子因为受孕的重量而变得丰满起来，刚好让她有了一个小小的、摇晃着的、充满造人乐趣的肚子。你把最后几股精液射进她体内，注意到没有一滴精液从她那诱人的裂隙中漏出，你微笑着，感到完全满足。");
         }
         else if(get_player().cumQ() < 6000)
         {
            outputText("[pg]有太多的精液从你的" + get_player().cockHead(_loc1_) + "中流出，以至于林奈特曾经紧绷的肚子立刻因为精液的重量而丰满起来，你最初的几次喷射就让她有了一个摇晃的肚子。当你继续用你那孕育生命的浆液淹没她的子宫时，她的肚子在你们之间继续隆起，最终拱成一个怀孕般的圆顶。不知怎么的，她的身体把所有的精液都留在了里面，当你结束时，只有一小股精液从她那诱人的裂隙中漏出。");
         }
         else if(get_player().cumQ() < 10000)
         {
            outputText("[pg]哦，天哪，精液太多了！它像河水一样从你体内涌出，把这个可怜地精原本狭窄的腹部撑成了一个看起来像怀孕了的小圆顶。每一次子宫被填满，那圆润的凸起都会可爱地晃动一下，然后变得更大，在你巨大的男子气概的重量下膨胀，直到她那翠绿的隆起被闪亮、紧绷的皮肤覆盖。她的肚脐凸了出来，这个地精那性感的裂隙终于无法承受压力，让感觉像是一升的精液倒流出来，溅了你一身。");
         }
         else
         {
            outputText("[pg]哦，天哪！每一次倾盆大雨般的精液涌出都是如此的巨大，以至于当它冲进这个可怜地精的子宫时，简直把她撑开了。最初的两股喷射足以把她曾经紧绷的腹部变成一个塞满精液的圆顶，在那之后你还在继续射精，每一次都让她那怀孕般的肚子摇晃、膨胀，变得越来越圆，直到她隆起的腹部看起来几乎和她一样大。她的肚脐早就凸了出来，光滑的翠绿色皮肤因为过度拉伸的紧绷感而闪闪发光。林奈特轻声呜咽着，突然一股精液从你的" + get_player().cockDescript(_loc1_) + "周围滚落出来。看来她就是无法把所有的精液都留在里面，而你甚至还没有射完！你一边射精一边继续抽插，用大量的精液冲刷着你这个即将怀孕的性玩具的通道，直到你最终精疲力竭。");
         }
         outputText("[pg]林奈特紧紧地抱着你，直到她完全确定你已经榨干了每一滴精液");
         if(get_player().cumQ() >= 3000)
         {
            outputText("，即使");
            if(get_player().cumQ() >= 10000)
            {
               outputText("大部分");
            }
            else
            {
               outputText("一些");
            }
            outputText("现在都在床上了");
         }
         outputText("。直到那时她才松开你，让你滑出来");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("伴随着一声湿润的“啵”声。你的肉结在拔出时完美地撑开了她的阴唇，你忍不住惊叹于你把这个婊子调教得有多好。可惜她可能很快又会紧致起来");
         }
         else
         {
            outputText("伴随着一股喷涌而出的淫水追逐着你");
         }
         outputText("。她呻吟着，");
         if(get_player().cumQ() < 1000)
         {
            outputText("[say: [name]，刚才很爽，但你几乎没射多少！如果你连我的子宫表面都涂不满，我怎么能一次生下十几个女儿！？] 她颤抖着。[say: 走吧。我得找点药来解决这个问题，不然这次我生不出像样的一窝。]");
            outputText("[pg]你离开时感觉有点不受重视。也许你能在外面找到一些增加精液量的补剂？不过，你还欠她一次理发……");
            lynnetteApproval(-2);
         }
         else if(get_player().cumQ() <= 10000)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1027) == 1)
            {
               outputText("[say: 哇，[name]。你射得像个牛头怪……而且还没有把我迷晕！天哪，我已经能感觉到那些小游侠在寻找我的卵子了。]她咯咯地笑着，拿出一个小瓶，一口吞下。[say: 我最好确保有足够的卵子给它们，对吧？][pg]你带着幸福的微笑离开了。看来林奈特很认可你这个伴侣。");
            }
            else
            {
               outputText("[say: 嗯，[name]，我喜欢你把我填满的感觉。] 她仰头喝下一瓶助孕药剂，叹了口气。[say: 帮个忙，早点回来。我宁愿生出一大群你的孩子，也不愿生出一堆软弱的荡妇。]");
            }
            lynnetteApproval(10);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1027) == 0)
            {
               outputText("[say: 哦……天哪……什、什么？怎么会……？我被塞得好满，[name]！我能感觉到，就像我已经怀孕快要撑爆了一样，而我甚至还没给我的宝宝们受精的机会！]她一手捧起你漏出的一些精液涂抹在她那巨大的肚子上，另一手拿着一瓶助孕剂。[say: 去吧宝贝，我只想在里面泡一会儿，确保我能尽可能多地怀上女孩。]林奈特仰头喝下药水，把空瓶扔到一边，全神贯注地沉浸在你的精液中。[pg]你带着幸福的微笑大摇大摆地走进主厅，注意到她的女儿们试图向你提供“服务”时投来的羡慕目光。");
            }
            else
            {
               outputText("[say: 操我，亲爱的！我……你知道吗，你是唯一能把我填得这么满的人。我是说，除了机器以外。] 林奈特的脸涨得通红，她挣扎着去拿一瓶助孕药剂，一半的身体被她自己塞满精液的重量压住。你微笑着轻松地递给她，她喝下后感激地看着你。[say: 我真他妈喜欢就这么躺在这里，被操到失去意识，躺在我种马欲望的湖泊里，沉浸其中直到我爽晕过去。][pg]她的表白听起来几乎是情意绵绵的，她一定意识到了这一点，因为当她说话时，她的语气变了，[say: 只要确保你过几天再来好好操我一顿就行了。如果你知道什么对你的鸡巴好，你就会这么做的！][pg]你用一个吻让她安静下来，让她神魂颠倒，然后你一边穿衣服一边漫步走出去。林奈特满足的呻吟声似乎在你留在沙龙的整个时间里都萦绕着你。");
            }
            lynnetteApproval(25);
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1028,FlagDict_Impl_.arrayReadInt(_loc2_,1028) + 1);
         get_player().orgasm("Dick");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1025,3 + Utils.rand(3));
         if(get_player().cumQ() >= 1000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (1 + Utils.rand(3)));
         }
         if(get_player().cumQ() >= 2000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (1 + Utils.rand(3)));
         }
         if(get_player().cumQ() >= 3000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (2 + Utils.rand(3)));
         }
         if(get_player().cumQ() >= 4000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (2 + Utils.rand(3)));
         }
         if(get_player().cumQ() >= 6000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (2 + Utils.rand(3)));
         }
         if(get_player().cumQ() >= 10000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1025,FlagDict_Impl_.arrayReadInt(_loc2_,1025) + (2 + Utils.rand(3)));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1022,0);
         salonPurchaseMenu(true);
      }
      
      public function favoriteSalonMenu() : void
      {
         var favorite:Boolean;
         var _g:Salon;
         salonPurchaseMenu();
         _g = this;
         favorite = true;
         addNextButton("支付",function():void
         {
            _g.salonPaymentMenu(favorite);
         });
      }
      
      public function cutShort() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         if(get_player().hair.type == 4)
         {
            outputText("当你要求剪发时，林奈特盯着你看。[say: 不行，亲爱的；那东西看起来像活的，我可不想把我漂亮的地板弄得到处都是血。不过，还是感谢你为白色档案做出的贡献；也许我们可以做点别的？][pg]");
            salonPurchaseMenu();
            return;
         }
         outputText("林奈特和她的女儿们拿着锋利的剪刀围着你，毫不费力地修剪着你的[hair]。当她们完成时，你只剩下");
         get_player().hair.length = 1;
         outputText("[hair]。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cutMedium() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         if(get_player().hair.type == 4)
         {
            outputText("当你要求剪发时，林奈特盯着你看。[say: 不行，亲爱的；那东西看起来像活的，我可不想把我漂亮的地板弄得到处都是血。不过，还是感谢你为白色档案做出的贡献；也许我们可以做点别的？][pg]");
            salonPurchaseMenu();
            return;
         }
         outputText("林奈特和她的女儿们拿着锋利的剪刀围着你，毫不费力地修剪着你的[hair]。当她们完成时，你只剩下");
         get_player().hair.length = 10;
         outputText("[hair]。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cutLong() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_lynette());
         if(get_player().hair.type == 4)
         {
            outputText("当你要求剪发时，林奈特盯着你看。[say: 不行，亲爱的；那东西看起来像活的，我可不想把我漂亮的地板弄得到处都是血。不过，还是感谢你为白色档案做出的贡献；也许我们可以做点别的？][pg]");
            salonPurchaseMenu();
            return;
         }
         outputText("林奈特和她的女儿们拿着锋利的剪刀围着你，毫不费力地修剪着你的[hair]。当她们完成时，你只剩下");
         get_player().hair.length = 25;
         outputText("[hair]。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cutBeard() : void
      {
         clearOutput();
         if(get_player().hair.type == 4)
         {
            outputText("[pg]当你要求剪胡子时，林奈特盯着你看。[say: 没门，亲爱的；那东西看起来是活的，我可不想把血弄得我漂亮的地板上到处都是。不过，感谢你为白色档案做出的贡献；也许我们可以做点别的？][pg]");
            beardMenu();
            return;
         }
         outputText("林奈特和她的女儿们拿着锋利的剪刀围着你，毫不费力地修剪着你的" + get_player().beardDescript() + "。当她们完成时，你只剩下了");
         get_player().beard.length = 0.01;
         outputText(get_player().beardDescript() + "。");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function chooseBeardStyleFinalize(param1:int = 0) : void
      {
         clearOutput();
         var _loc2_:Array = ["简单的胡子","山羊胡","干净的剃须","山野村夫的发型"];
         outputText("你告诉林奈特你想要一个" + _loc2_[param1] + "。[pg]");
         outputText("林奈特和她的女儿们开始用锋利的剪刀和白色液体处理你的胡子，它慢慢地变成了你要求的款式。[pg]");
         get_player().beard.style = param1;
         outputText("过了一会儿，你现在有了一个" + get_player().beardDescript() + "！");
         salonPay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function changeBeardStyle(param1:Boolean = false) : void
      {
         var choiceStyle3:int;
         var _g3:Salon;
         var choiceStyle2:int;
         var _g2:Salon;
         var choiceStyle1:int;
         var _g1:Salon;
         var choiceStyle:int;
         var _g:Salon;
         outputText("你想要什么款式的胡子？[pg]");
         menu();
         _g = this;
         choiceStyle = 0;
         addButton(0,"普通",function():void
         {
            _g.chooseBeardStyleFinalize(choiceStyle);
         });
         _g1 = this;
         choiceStyle1 = 1;
         addButton(1,"山羊胡",function():void
         {
            _g1.chooseBeardStyleFinalize(choiceStyle1);
         });
         _g2 = this;
         choiceStyle2 = 2;
         addButton(2,"干净利落",function():void
         {
            _g2.chooseBeardStyleFinalize(choiceStyle2);
         });
         _g3 = this;
         choiceStyle3 = 3;
         addButton(3,"山野村夫",function():void
         {
            _g3.chooseBeardStyleFinalize(choiceStyle3);
         });
         if(param1)
         {
            setExitButton();
         }
         else
         {
            addButton(14,"返回",beardMenu);
         }
      }
      
      public function buyDye(param1:ItemType, param2:int = 30, param3:Boolean = false) : void
      {
         clearOutput();
         salonPay(param2,param3);
         get_inventory().takeItem(param1,shopMenu);
      }
      
      public function beardMenu() : void
      {
         var _g4:Salon;
         var _g3:Salon;
         var mode1:int;
         var _g2:Salon;
         var mode:int;
         var _g1:Salon;
         var _g:Salon;
         menu();
         if(get_player().isChild() && !get_player().hasBeard())
         {
            outputText("[pg]林奈特看着你的脸，摇了摇头。[say: 像你这样的孩子，无论我怎么做都长不出胡子的。]");
            outputText("[pg]有点令人失望，但也没必要坚持。");
            outputText("[pg][say: 嘿，内心的胡子才是最重要的。不过，如果你真的想长胡子，我听说北方有一些女战士酿造的蜂蜜酒非常烈，喝了就能长胡子。这可能是一种比喻，但我看不出有什么理由去怀疑它。]");
            outputText("[pg]值得记住。不过现在，你的脸上没什么可做的。");
            _g = this;
            setExitButton("返回",function():void
            {
               _g.hairDressingMainMenu();
            });
            return;
         }
         outputText("[pg][say: 我可以帮你解决与胡子相关的需求，]林奈特说。");
         addButton(0,"剪胡子",cutBeard).disableIf(!get_player().hasBeard(),"你没有胡子可剪。");
         if(!get_player().hasBeard())
         {
            _g1 = this;
            mode = 1;
            addButton(1,"长胡子",function():void
            {
               _g1.growBeard(mode);
            });
         }
         else
         {
            _g2 = this;
            mode1 = 0;
            addButton(1,"留长胡子",function():void
            {
               _g2.growBeard(mode1);
            }).disableIf(get_player().beard.length >= 6,"你的胡子已经够长了。");
         }
         _g3 = this;
         addButton(2,"胡子款式",function():void
         {
            _g3.changeBeardStyle();
         }).disableIf(!get_player().hasBeard(),"你没有胡子可做造型。");
         addButton(3,"剃光胡子",removeBeard).disableIf(!get_player().hasBeard(),"你没有胡子可剃。");
         _g4 = this;
         setExitButton("返回",function():void
         {
            _g4.hairDressingMainMenu();
         });
      }
   }
}

