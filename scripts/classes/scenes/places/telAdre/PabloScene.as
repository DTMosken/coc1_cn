package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class PabloScene extends TelAdreAbstractContent
   {
      
      public function PabloScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function workoutWithPablo() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2329) == 0)
         {
            outputText("你对着这个假小恶魔点点头，告诉他你确实需要锻炼一下。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
            {
               outputText("[pg]在门口工作的半人马娘走过来收取费用，你在她手里放了10颗宝石，作为一小时锻炼的费用。");
            }
            outputText("[pg][say: 太好了，]巴勃罗咧嘴笑着回应道。[say: 我旁边还有一根单杠。也许你可以试着做几个引体向上？]");
            outputText("[pg]说完，巴勃罗拍打着翅膀，飞到了他的单杠上。");
            outputText("[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) < 80)
         {
            outputText("你锻炼了大约一个小时左右，期间还交流了一些你在玛瑞斯旅行的故事。他非常专心地听你讲故事，并在适当的时候发表评论。");
            outputText("[pg]你离开去冲了个澡，然后返回营地，巴勃罗在你走的时候向你挥手告别。");
         }
         else
         {
            outputText("你急切地接受了这个小恶魔形态家伙的邀请。");
            outputText("[pg][say: 太好了！你知道我有多喜欢我们的锻炼。像往常一样，我旁边就有一根单杠你可以用。]");
            outputText("[pg]你点点头，跳起来抓住单杠。你锻炼了一个小时，交流着你在玛瑞斯冒险的各种故事。他在适当的时候发表评论，偶尔还会说几句俏皮话。");
            outputText("[pg]一个小时到了，你从单杠上跳下来，走向淋浴间，巴勃罗向你挥手告别。洗完澡后，你回到了营地。");
         }
         if(get_player().get_str100() < 40)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_str100() < 60)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_str100() < 80)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_str100() < 90)
         {
            dynStats(DynStat.Str(0.4));
         }
         dynStats(DynStat.Str(0.1));
         get_player().modTone(90);
         get_player().changeFatigue(20);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2329,FlagDict_Impl_.arrayReadInt(_loc1_,2329) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) < 60)
         {
            pabloAffection(5);
         }
         pabloAffection(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloShowerStopHim() : void
      {
         clearOutput();
         outputText("为了阻止巴勃罗，你猛地推开隔间的门，甚至懒得遮掩自己。你疯狂地向他跑去，差点在湿滑的地板上滑倒。你跪倒在地，双臂环抱住他，阻止他逃跑。这个小恶魔形态的家伙僵住了，说不出话来。");
         outputText("[pg][say: ……但是……为什么，[name]？]");
         outputText("[pg]难道他从来没有想过，你觉得他对你的吸引力很讨人喜欢吗？一次也没有？");
         outputText("[pg]你转过头看着他，在他的脸颊上轻轻吻了一下。你从来没想过他的脸颊还能变得更红，但在那一刻，你发誓它们确实变红了。令你惊讶的是，巴勃罗从你的怀抱中挣脱出来，双臂紧紧搂住你的脖子。他毫不犹豫地给了你一个热情的吻，整个身体都兴奋得发抖。");
         outputText("[pg][say: 噢，[name]！] 他开始说道，打破了那个吻。[say: 你根本不知道听到你这么说我有多松了一口气！]");
         outputText("[pg]你觉得你大概能猜到。");
         outputText("[pg]直到这时，巴勃罗才停下来欣赏你赤裸的身体。他一边打量着你的身体，一边赞许地点头，将一切尽收眼底。你已经能看出他腰间的毛巾被勃起的阴茎顶起的形状。当他意识到下面发生了什么时，他睁大了眼睛，迅速用手捂住了胯部。");
         outputText("[pg][say: 哦，抱歉。也许这有点太直接了。]");
         outputText("[pg]你可不这么认为。事实上，也许你能帮他解决这个问题？");
         outputText("[pg][say: 你是说你真的想做？] 巴勃罗问道，听到这个想法，他的脸亮了起来。");
         outputText("[pg]你当然想。你的隔间还开着，你示意他进去。");
         outputText("[pg][say: 是、是的，我非常乐意，] 他拼命地点头说道。");
         outputText("[pg]说完，你走向隔间，挑逗地扭动着臀部。巴勃罗紧随其后。在路上，你思考着该如何应对。是你来主导，还是让巴勃罗来掌控局面？你要用哪些部位？");
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            pabloGetsGrossedOutByWorms();
            return;
         }
         pabloSexMenu();
      }
      
      public function pabloShowerSexIntro() : void
      {
         spriteSelect(SpriteDb.get_s_pablo());
         clearOutput();
         outputText("经过漫长而艰苦的锻炼，你休息了片刻，擦去额头上的汗水，喘着粗气。既然你的额头都出汗了，那身体的其他部位肯定也一样。因此，你决定在回营地之前先冲个澡。");
         outputText("[pg]像往常一样，你退到更衣室，脱下你的[Armor]，用毛巾裹住自己。当你走进隔间时，你看到一张熟悉的面孔走进了房间。是巴勃罗。从他腰间围着的毛巾来看，他肯定也想洗个澡。他显得非常紧张，看着地板，不停地摆弄着大拇指。");
         outputText("[pg][say: 啊……你好，[name]。] 他伸手摸了摸头，挠了挠一只耳朵后面。[say: 其实有一件事我一直想跟你说——已经有一段时间了。]");
         outputText("[pg]打开水龙头后，你转过身面对你的小恶魔朋友。他到底想说什么？");
         outputText("[pg][say: 嗯，] 他咽了口唾沫，[say: 在我们做朋友的这段时间里，你为我做了那么多。这太不可思议了。从来没有人像你这样对我这么好。我晚上一直睡不好，因为我总是在想你，梦见你。我在想也许我们……我不知道，可以一起做些其他的事情。比如，嗯，约会，甚至，] 他停顿了一下，犹豫着，[say: 做爱。]");
         outputText("[pg]你张大了嘴巴，对朋友的告白感到震惊。同时，你又忍不住感到受宠若惊。他显然在很多方面都喜欢你！");
         outputText("[pg][say: 噢，算了吧！就当我什么都没说！我早该知道这是个愚蠢的主意！] 他哭喊着，双手抱头。他似乎把你的惊愕沉默当成了拒绝。他转身走向房间的入口，打算离开。你该阻止他，还是让他走比较好？");
         menu();
         addButton(0,"让他走",pabloShowerLetGo).hint("让巴勃罗走。让他走也没什么坏处。你确信你还能再见到他。");
         addButton(1,"阻止他",pabloShowerStopHim).hint("阻止巴勃罗。这将引发一些性感的时刻。");
      }
      
      public function pabloShowerLetGo() : void
      {
         clearOutput();
         outputText("你叹了口气，决定让他走。巴勃罗似乎很尴尬，甚至有些羞愧。他可能需要一些独处的时间。也许这对你也有好处。你可能需要一些时间来思考这一切，来接受这一切。毕竟不是每天都有人承认对着你想入非非。");
         outputText("[pg]你看着地面，看着水流进下水道。水变冷了，你发现自己不像以前洗澡时那么享受了。你确定你做出了正确的决定吗？");
         outputText("[pg]你冻得发抖，关掉水龙头，尽快擦干身体。你冲向更衣室，扔掉毛巾，重新穿上你的[Armor]。然后，你回到了营地。");
         get_player().changeFatigue(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloSexMenu() : void
      {
         spriteSelect(SpriteDb.get_s_pablo_nude());
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"用肉棒",pabloDickingTimeSubMenus);
         }
         else
         {
            addButtonDisabled(0,"用肉棒","你需要有一根肉棒才能这么做。");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"用小穴",PabloPussPussSubMenus);
         }
         else
         {
            addButtonDisabled(1,"用小穴","你需要有一个小穴才能这么做。");
         }
         addButton(2,"用屁股",pabloButtsecksSubMenus);
      }
      
      public function pabloSecret() : void
      {
         spriteSelect(SpriteDb.get_s_pablo_nude());
         clearOutput();
         outputText("你抬起一只胳膊，闻了闻腋下。你厌恶地皱起了鼻子。这味道简直太难闻了！你害羞地环顾四周，确保周围的人都在侦测范围之外，然后走向储物柜。" + get_player().clothedOrNaked("在那里，你脱下你的" + get_player().armorDescript() + "，脱得精光，然后抓起","在那里，你已经一丝不挂，你抓起") + "一条毛巾遮住自己。当你走近淋浴间时，你听到了流水声，确认了还有其他人在。在到达房间入口之前，水停了。不管是谁，他们肯定要出来了。当你到达入口时，你看到巴勃罗从其中一个隔间出来，你完全看到了他赤裸的身体。他似乎没有注意到你。");
         outputText("[pg]在他的双腿之间有一根相当大的人类阴茎，至少对于他这种身材的人来说是这样。你估计它大约有六英寸长，一英寸半宽。他的睾丸，大小适中，每个大约一英寸宽。他转向隔间，当你看到他拍打翅膀，把自己举到半空中去抓挂在门上的毛巾时，你完全看到了他的背面。你现在可以看到那条原本会被他的睾丸隐藏起来的小缝隙。他是个扶他！");
         outputText("[pg]觉得你已经盯着他看了够久了，你挑了一个隔间走过去。");
         outputText("[pg]你走进隔间时向他打招呼，把毛巾挂在门上，然后关上门。");
         outputText("[pg]巴勃罗向后跳去，捂住他的胯部，因为你看到了他赤裸的身体而震惊地后退。他震惊的表情很快变成了绝望，尴尬的泪水在他的眼眶里打转。");
         outputText("[pg][say: 不，不，该死，不！]他呜咽着，急忙用毛巾把自己裹起来。[say: 我希望永远没有人会看到我这个样子！]");
         outputText("[pg]你低头看着他，感到困惑。他指的是他是个扶他这件事吗？为什么，在像玛瑞斯这样的地方，会有人因为这种事情而感到尴尬，更不用说想要保守秘密了？你决定直接问他。");
         outputText("[pg]小恶魔形态的他把手从脸上移开，抬头看着你，悲伤地点了点头。");
         outputText("[pg]但这为什么让他如此尴尬？你遇到过很多像他一样的人" + (get_player().get_gender() == 3 ? "，而且你碰巧也是其中之一。" : "。"));
         outputText("[pg]他向旁边看了一会儿，然后又看向你。");
         outputText("[pg][say: 你的意思是……你真的对我感兴趣，想知道我为什么要隐瞒它？]他问。");
         outputText("[pg]你当然感兴趣。你们是朋友，不是吗？");
         outputText("[pg]小恶魔沉默了一会儿，在脑海中思考着各种选项。");
         outputText("[pg][say: 好吧，]他开始说，靠在你的隔间门上，[say: 我告诉你。如果你能相信的话，人们对像我这样的人，拥有双性的人，有一种真正的偏见。我很确定这与恶魔有关。显然，在他们到来之前，拥有双性几乎是闻所未闻的。所以我猜人们只是把我们和他们，恶魔联系在一起……我变成这样也有点是我自己的错。还记得我说过我吃喝的一些东西改变了我吗？这就是我怎么长出阴道的。我以前只有一个阴茎。]");
         outputText("[pg]当你听着的时候，你皱起了眉头。一切都变得清晰起来。你对你这个假小恶魔朋友只有同情。你转过身来看着巴勃罗，给了他一个令人安心的微笑。你告诉他他是你的朋友。当然，他多出来的器官不会困扰你。");
         outputText("[pg]小恶魔形态的他脸上亮了起来，他平时友好的微笑又回来了。");
         outputText("[pg][say: 你不介意？哦，[name]！你真的是我很好的朋友！]");
         outputText("[pg]你松了一口气，很高兴能让你朋友振作起来。");
         outputText("[pg]这没什么，真的。");
         outputText("[pg]洗完澡，你关掉水龙头，抓起毛巾擦干身体。擦干后，你裹上毛巾离开隔间，走向更衣室。走到门口时，你向巴勃罗挥手告别。在那里，你" + get_player().clothedOrNaked("重新穿上你的[Armor]并") + "心满意足地回到了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2330,1);
         pabloAffection(20);
         get_player().changeFatigue(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloPussPuss(param1:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            if(get_player().get_tallness() >= 60 && !get_player().isTaur())
            {
               outputText("你低头看着你的小恶魔朋友，当你检查他赤裸的身体时，你的小穴湿润了。你比他高得多，你在思考如何才能舒服地操他。当你记起隔间的后墙时，你狡黠地笑了。你知道该怎么做了。");
               outputText("[pg]你突然抱起小恶魔形态的他，紧紧地拥抱着他。他发出一声惊讶的喘息，但他欢迎你突如其来的拥抱，在你的脸颊上印下一个吻。你深深地看着他的眼睛，问他是否准备好充分利用这个隔间的后墙。他似乎明白了你的暗示。");
               outputText("[pg][say: 是的，是-是的。要我，求你了！]巴勃罗呜咽着，用双腿缠住你，他脚上的爪子轻轻地抓进你的背里。");
               outputText("[pg]你决定不再让兴奋的小恶魔等待。你小心翼翼地把他靠在隔间的后墙上，告诉他用双腿缠住你以作支撑。就在你把你的小穴对准他急切的肉棒时，你已经能看到他满怀期待地舔着嘴唇了。");
               outputText("[pg][say: 来吧，[name]。别再这样挑逗我了！]他抱怨道。");
               outputText("[pg]看到巴勃罗如此急不可耐，你忍不住咧嘴笑了起来。他真的已经准备好了，不是吗？嗯，你觉得没必要再让他等下去了。毕竟，你自己也迫不及待想要开始了。于是，你毫不迟疑地坐到了小恶魔形态那根跳动的肉棒上。当你让他进入你那温暖诱人的小穴时，他如梦似幻地叹了口气，眼睛都翻白了。");
               get_player().cuntChange(20,true,true,true);
               outputText("[pg]起初，你动作很慢，以稳定的节奏扭动着臀部，但你无法保持这个节奏太久。巴勃罗在你体内抽动的肉棒带来的快感，已经快要把你逼向高潮了。从你伴侣急促的呼吸来看，他也快到极限了。此时，你们俩就像发情的野兽一样交媾着。任何进来洗澡的健身房顾客，肯定都会听到你们做爱时发出的淫荡声音。巴勃罗最先失控，他发出一声低沉的呻吟，将他的精液满满地射入你的体内。你紧随其后，你那快速收缩的内壁榨干了他肉棒里的每一滴精华" + (get_player().hasCock() ? "，同时你的" + get_player().cockDescript() + "也将精液射满了他的肚子" : "") + "。你们俩都被迫喘口气，你努力地将小恶魔形态按在墙上。");
               outputText("[pg]巴勃罗终于开口了，他的呼吸依然急促。[say: 太棒了，[name]。我想我以前从来没有这么快射过。你现在可以把我放下来了。]");
               outputText("[pg]你毫不迟疑地将他放回地面，让你们俩在流水下清理干净。巴勃罗走出隔间，擦干身体，将毛巾裹在腰间。你也照做。离开前，他给了你最后一个拥抱和亲吻。");
               outputText("[pg][say: 谢谢你，亲爱的。我不能要求更好了。]");
            }
            else
            {
               outputText("你看着你的小恶魔朋友，当你打量他赤裸的身体时，你的小穴湿润了。你们俩的身高相差无几。这很好。你有个主意，考虑到你们之间没有明显的身高差，这应该不难实现。你狡黠地对他笑了笑，突然把他推倒在地，让他仰面躺着。这样，你就能舒服地骑在他身上。他起初似乎被吓了一跳，但似乎并不反感你的举动。");
               outputText("[pg][say: 啊，我知道你要干什么了，]巴勃罗坏笑着评论道。[say: 我喜欢这样。我非常喜欢。]");
               outputText("[pg]你已经悬停在他那根坚硬的肉棒上方了。你放低身子，直到他的肉棒刚好抵住你的入口，然后停下来，挑逗他。他似乎完全知道你在做什么，而且他觉得这并不好笑。");
               outputText("[pg][say: 拜托，[name]。这样挑逗我没意义。你和我一样想开始，你知道我是对的。]");
               outputText("[pg]巴勃罗没说错。他真是个聪明的小恶魔形态！既然他这么聪明，你觉得现在是时候给他他想要的东西了。于是，你毫不迟疑地将自己插在巴勃罗那根跳动的肉棒上。感觉就像你想象的那样美妙。很明显，你的伴侣对你的感觉也是一样的。在他睁开眼睛的短暂瞬间，你可以看到他的眼睛都翻白了。");
               get_player().cuntChange(20,true,true,true);
               outputText("[pg]起初，你动作很慢，以稳定的节奏扭动着臀部，但你无法保持这个节奏太久。巴勃罗在你体内抽动的肉棒带来的快感，已经快要把你逼向高潮了。从你伴侣急促的呼吸来看，他也快到极限了。此时，你们俩就像发情的野兽一样交媾着。任何进来洗澡的健身房顾客，肯定都会听到你们做爱时发出的淫荡声音。巴勃罗最先失控，他发出一声低沉的呻吟，将他的精液满满地射入你的体内。你紧随其后，你那快速收缩的内壁榨干了他肉棒里的每一滴精华" + (get_player().hasCock() ? "，同时你的" + get_player().cockDescript() + "也将精液射满了他的肚子" : "") + "。你们俩别无选择，只能休息片刻，喘口急需的气。");
               outputText("[pg]巴勃罗终于开口了，他的呼吸依然急促。[say: 太棒了，[name]。我想我以前从来没有这么快射过。你现在可以从我身上下来了。]");
               outputText("[pg]你毫不迟疑地将他放回地面，让你们俩在流水下清理干净。巴勃罗走出隔间，擦干身体，将毛巾裹在腰间。你也照做。离开前，他给了你最后一个拥抱和亲吻。");
               outputText("[pg][say: 谢谢你，亲爱的。我不能要求更好了。]");
            }
         }
         else
         {
            outputText("当你躺在淋浴间的地板上时，巴勃罗用困惑的眼神看着你，挠了挠头。他似乎没明白你的暗示。你忍不住对他的困惑轻笑起来。你本以为他会知道你的意图。不过，你向他展示了自己，这就足以让他明白了。");
            outputText("[pg][say: 你真的想让我主导？]小恶魔形态问道。[say: 哇，我还以为你会是那个主导的人。不过，这也不是坏事。我来做。我只是没料到会这样。]");
            outputText("[pg]巴勃罗现在正悬停在你上方，显然在心里盘算着。你只能猜测他正在试图弄清楚他到底想在这里做什么。他抓住你赤裸的身体作为支撑，顺势骑在了你身上……");
            outputText("[pg][say: 你知道，我可能对性并不陌生，但我还是想确保我们在做这件事时我没有弄疼你。如果我开始得意忘形，请告诉我。]");
            outputText("[pg]你对巴勃罗关心你的安危轻笑了一声。你告诉他你会没事的，并调皮地揉乱了他湿漉漉的头发。他对着你微笑，尾巴开心地甩来甩去。");
            outputText("[pg][say: 好吧，[name]，既然你这么说，]小恶魔形态回答道。他那根跳动的肉棒已经对准了你的[vagina]，滴着液体的肉棒抵在你的入口处。[say: 我希望你准备好了，因为我要进去了！]");
            outputText("[pg]他进来了！尽管你极力克制，但当巴勃罗那根美妙的肉棒在你温暖的褶皱中安家落户时，你还是忍不住发出梦幻般的叹息。他才刚插进来一会儿，就已经感觉棒极了！你必须尽一切努力，确保这场欢爱能持续得越久越好。");
            get_player().cuntChange(20,true,true,true);
            outputText("[pg]起初，这个小恶魔形态的家伙动作很慢，以稳定的节奏在你体内抽插，但他没能保持多久。你甜美的小穴带给他的那种如临仙境般的感觉，已经开始让他濒临失控。你自己也快到极限了，于是你极力鼓励他加快速度。他欣然从命。此时，你们俩就像发情的野兽一样交媾。任何进来洗澡的健身者肯定都会听到你们俩发出的淫荡声音。巴勃罗最先败下阵来，他发出一声低沉的呻吟，将他的精液满满地注入你的体内。你紧随其后，内壁迅速收缩，榨取着他肉棒里的每一滴精华。你们俩别无选择，只能休息片刻，喘口气。");
            outputText("[pg][say: 太棒了，[name]，]他终于开口了。[say: 我想我以前从来没有这么快射过。]");
            outputText("[pg]你在说什么呢，你问道。毕竟大部分活都是他干的。当你指出这一点时，巴勃罗羞涩地笑了笑。");
            outputText("[pg][say: 我想你是对的，但我还是很开心。这才是最重要的，对吧？哦，趁我还没忘，谢谢你，亲爱的。]");
            outputText("[pg]说完，小恶魔形态的他离开了，让你在回营地前能自己清理干净。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2334,FlagDict_Impl_.arrayReadInt(_loc2_,2334) + 1);
         pabloAffection(5);
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloIntro(param1:Boolean = true) : Boolean
      {
         if(get_game().time.hours > 14 && get_game().time.hours <= 20)
         {
            if(param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2327) == 0)
               {
                  outputText("[pg]在后面，有一个矮小的，不，——非常——矮小的人影在做引体向上。他不可能超过三英尺半高。他光着膀子，只穿了一条短裤。他的皮肤是明亮的桃红色，鼻子和脸颊上有一丝红晕。他很轻盈，但仍然明显肌肉发达。在他身后摇摆着一条长度几乎与他身高相匹配的尾巴，尖端是一个微小的箭头状。一对蝙蝠般的小翅膀从他的肩胛骨长出。他的脚趾末端是锋利的爪子，手指也是。你的注意力随后转向他的脸。它略显柔弱，但仍然明显具有阳刚之气。他的头顶是一头蓬松、卷曲、不整洁的沙金色头发。眯起眼睛，你可以看到他头上那堆头发下有一对小角，以及一对可爱的尖耳朵。他的眼睛几乎完全是黑色的，除了他朱红色的虹膜。想起来，他有点像……一个小恶魔？不，在特尔阿德雷不可能。他绝不可能是小恶魔。或者他是吗？");
               }
               else
               {
                  outputText("[pg]像往常一样，巴勃罗在后面做他通常的引体向上锻炼。");
               }
            }
            return true;
         }
         return false;
      }
      
      public function pabloGetsGrossedOutByWorms() : void
      {
         outputText("[pg]正当你思考要怎么操这个小恶魔形态的家伙时，他向后跳去，震惊地退缩了。什么把他吓成这样？他指着你已经勃起的阴茎，手指发抖。没过多久你就明白是怎么回事了。你低头一看，正好看到一条蠕虫正从你肉棒的顶端慢慢爬出来。它“啪”的一声掉在地上，被冲进了下水道。");
         outputText("[pg][say: 蠕虫！]巴勃罗惊呼，干呕起来。那一刻，他原本坚挺的肉棒立刻软了下来。[say: 我……对不起，[name]。我想我不能在你有那些东西的时候和你做。我可不想也被传染！]小恶魔形态的他走向淋浴间的出口，但停顿了一下，叹了口气。他转过身面对你。[say: 不过，这并不意味着我完全不想和你在一起。我想的！只是……如果你除掉了那些蠕虫，再来找我，然后我们就可以做了！]");
         outputText("[pg]说完，他离开了。你发誓在他出去的时候，你听到他低声说：[say: 请把它们除掉。]他一定很想做。你能感觉到他的失望。你自己也非常期待。不过，你觉得这不值得纠结，洗完澡后就回营地了。");
         pabloAffection(-10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2336,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloDickingTimeSubMenus() : void
      {
         var anal1:Boolean;
         var inCharge1:Boolean;
         var _g1:PabloScene;
         var anal:Boolean;
         var inCharge:Boolean;
         var _g:PabloScene;
         clearOutput();
         outputText("你的肉棒该怎么用？是你来主导还是让他来带领？你想插小穴还是插屁股？");
         menu();
         _g = this;
         inCharge = true;
         anal = false;
         addButton(0,"主导(阴道)",function():void
         {
            _g.pabloDickingTime(inCharge,anal);
         }).hint("你将主导并插入他的阴道。","主导 (阴道)");
         addButtonDisabled(1,"主导(肛门)","不幸的是，这个场景还没有写出来。你为什么不写那个场景，worldofdrakan？","主导 (肛门)");
         _g1 = this;
         inCharge1 = false;
         anal1 = false;
         addButton(2,"巴勃罗带领(阴道)",function():void
         {
            _g1.pabloDickingTime(inCharge1,anal1);
         }).hint("你将让巴勃罗带领，他会用阴道接纳你的肉棒。","巴勃罗带领 (阴道)");
         addButtonDisabled(3,"巴勃罗带领(肛门)","不幸的是，这个场景还没有写出来。你为什么不写那个场景，worldofdrakan？","主导 (肛门)");
      }
      
      public function pabloDickingTime(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:* = null as IMap;
         clearOutput();
         if(param2)
         {
            if(param1)
            {
               outputText("");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               checkPablosVirginity(true);
            }
            else
            {
               outputText("");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
               outputText("[pg]");
            }
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2333,FlagDict_Impl_.arrayReadInt(_loc3_,2333) + 1);
         }
         else
         {
            if(param1)
            {
               if(get_player().get_tallness() >= 60 && !get_player().isTaur())
               {
                  outputText("你低头看着你的小恶魔朋友，当你检查他赤裸的身体时，你的[cock]变硬了。你比他高得多，你思考着如何才能舒服地操他。当你记起隔间的后墙时，你狡黠地笑了。你知道该怎么做了。");
                  outputText("[pg]你突然抱起小恶魔形态的他，紧紧地拥抱着他。他发出一声惊讶的喘息，但他欢迎你突如其来的拥抱，在你的脸颊上印下一个吻。你深深地看着他的眼睛，问他是否准备好充分利用这个隔间的后墙。他似乎明白了你的暗示。");
                  outputText("[pg][say: 是的，是-是的。要我，求你了！]巴勃罗呜咽着，用双腿缠住你，他脚上的爪子轻轻地抓进你的背里。");
                  outputText("[pg]你决定不再让兴奋的小恶魔等待。你小心翼翼地把他靠在隔间的后墙上，告诉他用双腿缠住你以获得支撑。就在你把你的[cock]对准他已经流着淫液的小穴时，他轻轻地推了你一下。");
                  outputText("[pg][say: 呃，等等，]他紧张地说。");
                  outputText("[pg][say: 怎么了？]你问。");
                  outputText("[pg]你的朋友犹豫了一下才回答。[say: 这……这是我第一次。呃，至少在那个地方是。你能不能，啊，稍微温柔一点？]");
                  outputText("[pg]你当然可以。他只要开口就行。于是，你小心翼翼地将你的长度缓缓送入他的体内。他微微皱眉，你担心自己可能弄疼了他。你问他是否还好，他坚持说没事，催促你继续。你顺从了他，但正如你承诺的那样，保持着缓慢而轻松的节奏。");
                  checkPablosVirginity(false);
                  outputText("[pg]当你在他饥渴的小穴中抽插时，巴勃罗继续发出轻柔的呜咽声。仿佛是条件反射一般，他伸手握住自己跳动的肉棒，疯狂地套弄着，直到顶端开始滴下先列腺液。你对这个小恶魔形态的家伙的热情报以灿烂的微笑，稍微加快了速度。");
                  outputText("[pg]当你的肉棒在他的小穴中像活塞一样进出时，他简直要尖叫起来。没过多久，这个乱作一团的小恶魔形态就完全失控了，他的肉棒剧烈地抽搐着，一股又一股的精液从他的顶端喷发出来，射在你的胸膛上。他小穴的内壁狂热地紧紧夹住你的阴茎，榨取着它的每一滴精华。他瘫倒在隔间的墙上，在你们的欢爱中筋疲力尽。你选择抱着他，直到他完全喘过气来，尽管你自己也有些疲惫。");
                  outputText("[pg]他终于开口了，呼吸依然急促。[say: 太棒了，[name]。我想我以前从来没有这么快高潮过。你现在可以把我放下来了。]");
                  outputText("[pg]你毫不迟疑地将他放回地面，让你们俩在流水下清理干净。巴勃罗走出隔间，擦干身体，将毛巾裹在腰间。你也照做。离开前，他给了你最后一个拥抱和亲吻。");
                  outputText("[pg][say: 谢谢你，亲爱的。我不能要求更好了。]");
               }
               else
               {
                  outputText("你看着你的小恶魔朋友，当你打量他赤裸的身体时，你的[cock]硬了起来。你们俩在身高上相差不远。这很好。你有一个主意，考虑到你们之间没有明显的身高差（/“你的体型”如果是半人马的话），这应该不难做到。你对他狡黠地笑了笑，突然把他翻转过来，让他四肢着地，然后骑了上去。他起初似乎被吓了一跳，但似乎并不反感你的举动。当你把坚硬的肉棒压在他湿润的褶皱上时，他的尾巴挡住了你的去路。有什么不对劲吗？");
                  outputText("[pg][say: 嘿，你能不能稍微温柔一点？我可能对性不陌生，但我还是个处男，啊，在那个地方。]");
                  outputText("[pg]你当然可以。他只要开口就行。于是，巴勃罗的尾巴移开了，你能够小心翼翼地将你的长度缓缓送入他的体内。他微微皱眉，你能感觉到他在你身下发抖。有那么一瞬间，你担心自己可能弄疼了他。你问他是否还好，他坚持说没事，催促你继续。你顺从了他，但正如你承诺的那样，保持着缓慢而轻松的节奏。");
                  checkPablosVirginity(false);
                  outputText("[pg]当你的肉棒在他的小穴中像活塞一样进出时，他简直要尖叫起来。没过多久，这个乱作一团的小恶魔形态就完全失控了，他的肉棒剧烈地抽搐着，一股又一股的精液从他的顶端喷发出来，顺着下面的下水道流走。他小穴的内壁狂热地紧紧夹住你的阴茎，榨取着它的每一滴精华。他瘫倒在隔间的地板上，在你们的欢爱中筋疲力尽。你从小恶魔身上移开，给了他一些空间，你自己也需要喘口气。");
                  outputText("[pg]他终于开口了，呼吸依然急促。[say: 太棒了，[name]。我想我以前从来没有这么快高潮过。你可以动了。你这样笼罩着我，我实在起不来。]");
                  outputText("[pg]你毫不犹豫地站起身，让你们俩在流水下清理干净。巴勃罗走出隔间，擦干身体，将毛巾裹在腰间。你也照做。在离开之前，他给了你最后一个拥抱和吻。");
                  outputText("[pg][say: 谢谢你，亲爱的。我不能要求更好了。]");
               }
            }
            else
            {
               outputText("当你躺在淋浴间的地板上时，巴勃罗用困惑的眼神看着你，挠了挠头。他似乎没明白你的暗示。你忍不住对他的困惑轻笑起来。你本以为他会知道你的意图。不过，你向他展示了自己，这就足以让他明白了。");
               outputText("[pg][say: 你真的想让我主导？]小恶魔形态问道。[say: 哇，我还以为你会是那个主导的人。不过，这也不是坏事。我来做。我只是没料到会这样。]");
               outputText("[pg]巴勃罗现在盘旋在你上方，显然在心里盘算着。你只能猜测他正在试图弄清楚他到底想在这里做什么。他用爪子般的手握住你的[cock]，充满爱意地抚摸着。");
               outputText("[pg][say: 你知道，我可能对性一点也不陌生，但我的阴道还是个处女，如果这说得通的话。也许你正是那个能帮我破处的人，嗯？你觉得呢？]");
               outputText("[pg]你赞同地点了点头。如果那是他想要的，那就随他去吧。");
               outputText("[pg]小恶魔满怀期待地舔了舔嘴唇。他那已经流着口水的小穴正对着你坚挺的肉棒。他小心翼翼地降低身体，直到你渗出液体的龟头刚好抵住他的入口。接着，他深吸一口气，让你滑入他的体内。有那么一瞬间，小恶魔形态的他因为你的肉棒进入他的褶皱而倒吸了一口凉气。你担心他可能弄伤了自己，于是问他是否还好。");
               checkPablosVirginity(false);
               outputText("[pg][say: 嗯，我没事，]他回答道。[say: 我只是需要适应一下，仅此而已。我马上就能准备好。]");
               outputText("[pg]你微笑着，给这个小恶魔形态的身体足够的时间来适应你，时不时地抚摸他湿漉漉的沙金色头发。最终，他试探性地动了动，发出一声愉悦的叹息。他可能准备好继续了。确实如此。现在，他已经开始以稳定的节奏扭动臀部，而且速度越来越快。");
               outputText("[pg][say: 哦，[name]，]小恶魔呻吟道。[say: 这感觉太棒了！]");
               outputText("[pg]他自己做得也不赖。如果他继续这样下去，用不了多久你们俩都会被送上高潮。事实上，你已经在努力忍住不射了。你真的很希望你们俩能一起高潮。");
               outputText("[pg]在那一刻，你发誓巴勃罗读懂了你的心思。你能感觉到他的内壁在你的[cock]周围快速收缩，他向后仰起头，在快感中哀号。一波又一波的精液从你伴侣粗大的肉棒喷射而出，落在你的胸膛上。当你射出自己的精液时，你不得不抓住巴勃罗紧实的屁股来支撑自己，而他则享受着这每一秒。");
               outputText("[pg]当你们俩从高潮中平复下来后，你们只能待在那里喘口气。第一个试图站起来的是巴勃罗，但即使那样，他的呼吸仍然明显很吃力。当你的肉棒拔出时，你可以看到你的精液从小水滴般从他的小穴里滴落。看到你用精液把他填得满满的，你忍不住得意地笑了。");
               outputText("[pg][say: 太棒了，[name]，]他终于开口了。[say: 我想我以前从来没有这么快射过。]");
               outputText("[pg]你在说什么呢，你问道。毕竟大部分活都是他干的。当你指出这一点时，巴勃罗羞涩地笑了笑。");
               outputText("[pg][say: 我想你是对的，但我还是很开心。这才是最重要的，对吧？哦，趁我还没忘，谢谢你，亲爱的。]");
               outputText("[pg]说完，小恶魔形态的他离开了，让你在回营地前能自己清理干净。");
            }
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2332,FlagDict_Impl_.arrayReadInt(_loc3_,2332) + 1);
         }
         pabloAffection(5);
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloComesBackAfterWormCure() : void
      {
         spriteSelect(SpriteDb.get_s_pablo());
         clearOutput();
         outputText("当你靠近巴勃罗时，他的眼睛亮了起来。他显然很高兴见到你。但是为什么当你靠近时他要避免眼神接触呢？什么让他这么烦恼？也许他还在为你们俩在淋浴间发生的事感到尴尬？");
         outputText("[pg][say: 哦，嘿，[name]，]他向你打招呼，尾巴无力地垂着。[say: 我……啊，抱歉之前的事。我真的很想，你知道的，做那件事。只是……那些蠕虫！哇，等一下。你回来，该不会是因为你已经把它们除掉了吧？]");
         outputText("[pg]那一刻，他眼中又恢复了欢快的光芒，尾巴高兴地摇来摇去。确实，你已经摆脱了蠕虫，而且你非常愿意继续之前未完的事情。巴勃罗对这个进展显然非常高兴。虽然很难确定，但你发誓你能看到他的短裤里开始有了勃起的迹象。");
         outputText("[pg][say: 哇，[name]，太棒了！]小恶魔形态的他惊呼道，已经朝着淋浴间走去了。[say: 来吧，我们走！]");
         outputText("[pg]他可真是个急不可耐的家伙，不是吗？在去淋浴间的路上，你考虑着该如何应对。是你来主导，还是让巴勃罗来掌控局面？你要用哪些部位？");
         pabloAffection(10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2336,0);
         pabloSexMenu();
      }
      
      public function pabloButtsecksSubMenus() : void
      {
         var inCharge1:Boolean;
         var _g1:PabloScene;
         var inCharge:Boolean;
         var _g:PabloScene;
         clearOutput();
         outputText("你的" + get_player().assDescript() + "该怎么用？你是要主动出击还是让他主导？");
         menu();
         _g = this;
         inCharge = true;
         addButton(0,"主动出击",function():void
         {
            _g.pabloButtSecks(inCharge);
         }).hint("你将主动出击，让他插你的小穴。","主动出击");
         _g1 = this;
         inCharge1 = false;
         addButton(1,"巴勃罗主导",function():void
         {
            _g1.pabloButtSecks(inCharge1);
         }).hint("你将让巴勃罗主导，他会用小穴接纳你的肉棒。","巴勃罗主导");
      }
      
      public function pabloButtSecks(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("当你躺在淋浴间的地板上时，巴勃罗困惑地盯着你，挠了挠头。他似乎没有领会你的暗示。你发现自己被他的困惑逗乐了。你还以为他会知道你的意思。不过，你还是向他露出了你的[ass]，诱人地扭动着，这就足以让他明白了。");
            outputText("[pg][say: 哦……哦！所以你想让我把它放进去？插进你的屁股里？]");
            outputText("[pg]巴勃罗忍不住为自己的话轻笑起来。虽然你也觉得好笑，但你还是对他摇了摇手指，调皮地责备他。他最好闭上嘴，赶紧插进来，除非他想被你反过来戏弄。");
            outputText("[pg][say: 好吧，好吧，既然你这么说，] 小恶魔回应了你的责备。[say: 好了，[name]，准备好你的菊花吧！]");
            outputText("[pg]就在巴勃罗急切的肉棒顶端压在你的入口时，你动了一下，拒绝了他的进入。小恶魔惊讶地倒吸了一口气，声音中透着明显的失望。他挑起一根眉毛，双臂交叉，从你身边退开。");
            outputText("[pg][say: 拜托，[name]。你在干什么？] 他问道。");
            outputText("[pg]你警告过他了，不是吗？你脸上带着坏笑，提醒他你告诉过他，除非他愿意被戏弄，否则就别说那些俏皮话。所以现在，他成了被戏弄的对象。当巴勃罗对你摇头时，你爆发出一阵大笑。");
            outputText("[pg][say: 你我都知道，你和我一样想快点开始，] 他说。他没说错。[say: 我要再试一次，这次请不要动了！]");
            outputText("[pg]好吧，他确实说了“请”。他真好。好吧，你想你已经让他等得够久了。巴勃罗再次骑到你身上，这一次，当他滑过你的肛门括约肌时，你没有做出任何阻止的举动。");
            get_player().buttChange(20,true,true,true);
            outputText("尽管他肯定忍得很辛苦，但他现在还是保持不动，确保你完全准备好了。你告诉他你会没事的，并示意他可以继续。巴勃罗点点头，毫不犹豫地开始了。");
            outputText("[pg]起初，小恶魔形态的他动作很慢，以稳定的节奏在你体内抽插，但他无法保持这个节奏太久。你甜美的屁股带给他的美妙感觉已经开始让他濒临高潮。你自己也快到了，你极力鼓励他快点。他欣然从命。此时，你们俩就像发情的野兽一样交配。任何进来洗澡的健身者肯定都会听到你们俩发出的淫荡声音。巴勃罗最先失控，发出一声低沉的呻吟，将他的精液满满地灌入你体内。你紧随其后，条件反射般地夹紧了他那根滚烫、跳动的肉棒。你们俩别无选择，只能休息片刻，喘口气。");
            outputText("[pg][say: 太棒了，[name]，]他终于开口了。[say: 我想我以前从来没有这么快射过。]");
            outputText("[pg]你问他在说什么，毕竟大部分力气都是他出的。你指出这点时，巴勃罗害羞地笑了笑。");
            outputText("[pg][say: 我想你是对的，但我还是很开心。这才是最重要的，对吧？哦，趁我还没忘，谢谢你，亲爱的。]");
            outputText("[pg]说完，小恶魔形态的他离开了，让你在回营地前能自己清理干净。");
         }
         else
         {
            outputText("当你躺在淋浴间的地板上时，巴勃罗困惑地盯着你，挠了挠头。他似乎没有领会你的暗示。你发现自己被他的困惑逗乐了。你还以为他会知道你的意思。不过，你还是向他露出了你的[ass]，诱人地扭动着，这就足以让他明白了。");
            outputText("[pg][say: 哦……哦！所以你想让我把它放进去？插进你的屁股里？]");
            outputText("[pg]巴勃罗忍不住为自己的话笑了起来。你本想让他别闹了，但你自己也觉得挺好笑的。现在，就让这小恶魔形态的家伙开心一下吧。他迅速骑上你，抓住你[ass]的两侧作为支撑。");
            outputText("[pg][say: 好了，[name]，准备好你的菊花！我要进去了！]巴勃罗大声宣布，生怕别人听不见。");
            outputText("[pg]他迅速滑过你的肛门括约肌，几乎没给你任何反应的时间。");
            get_player().buttChange(20,true,true,true);
            outputText("尽管他肯定忍得很辛苦，但他现在还是保持不动，确保你完全准备好了。你告诉他你会没事的，并示意他可以继续。巴勃罗点点头，毫不犹豫地开始了。");
            outputText("[pg]起初，小恶魔形态的他动作很慢，以稳定的节奏在你体内抽插，但他无法保持这个节奏太久。你甜美的屁股带给他的美妙感觉已经开始让他濒临高潮。你自己也快到了，你极力鼓励他快点。他欣然从命。此时，你们俩就像发情的野兽一样交配。任何进来洗澡的健身者肯定都会听到你们俩发出的淫荡声音。巴勃罗最先失控，发出一声低沉的呻吟，将他的精液满满地灌入你体内。你紧随其后，条件反射般地夹紧了他那根滚烫、跳动的肉棒。你们俩别无选择，只能休息片刻，喘口气。");
            outputText("[pg][say: 太棒了，[name]，]他终于开口了。[say: 我想我以前从来没有这么快射过。]");
            outputText("[pg]你问他在说什么，毕竟大部分力气都是他出的。你指出这点时，巴勃罗害羞地笑了笑。");
            outputText("[pg][say: 我想你是对的，但我还是很开心。这才是最重要的，对吧？哦，趁我还没忘，谢谢你，亲爱的。]");
            outputText("[pg]说完，小恶魔形态的他离开了，让你在回营地前能自己清理干净。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2334,FlagDict_Impl_.arrayReadInt(_loc2_,2334) + 1);
         pabloAffection(5);
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pabloAffection(param1:int = 0) : int
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2328,FlagDict_Impl_.arrayReadInt(_loc2_,2328) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2328,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2328,100);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328);
      }
      
      public function declineWorkout() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2329) == 0)
         {
            outputText("你礼貌地拒绝了，现在实在没什么心情锻炼。");
            outputText("[pg][say: 没关系，]小恶魔说道。[say: 不过，随时欢迎你来和我一起锻炼。]");
            outputText("[pg]说完，你便离开了。");
            pabloAffection(5);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) < 80)
         {
            outputText("你拒绝了，解释说你只是顺道过来打个招呼。");
            outputText("[pg]巴勃罗笑了，似乎对你的举动感到受宠若惊。");
            outputText("[pg][say: 没关系，[name]。不过你能顺道来看看我，我很高兴。]");
         }
         else
         {
            outputText("你对着你的朋友微笑，解释说你只是顺道过来打个招呼，问问他最近怎么样。");
            outputText("[pg][say: 你人真好，]巴勃罗轻笑着说道。[say: 我最近过得很好，尤其是在我们在淋浴间那次相遇之后，感觉更棒了。]");
            outputText("[pg]你能感觉到自己满脸自豪。你很高兴能帮到他。你告诉他晚点再见。");
            outputText("[pg][say: 我很期待！]小恶魔开心地回答，并向你挥了挥手。");
         }
         doNext(get_telAdre().gym.gymDesc);
      }
      
      public function checkPablosVirginity(param1:Boolean) : void
      {
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2333) == 0)
            {
               outputText("<b>你夺走了巴勃罗的肛门处子之身！</b>");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2332) == 0)
         {
            outputText("<b>你夺走了巴勃罗的阴道处子之身！</b>");
         }
      }
      
      public function approachPablo() : void
      {
         spriteSelect(SpriteDb.get_s_pablo());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2327) == 0)
         {
            outputText("你走近那个像小恶魔一样的生物，脑海中涌现出一大堆问题。注意到你后，他从单杠上跳了下来。");
            outputText("[pg][say: <i>你好啊。我想我们还没见过面。我叫巴勃罗。你呢？</i>]");
            outputText("[pg][say: [name]，]你回答道。");
            outputText("[pg]虽然你觉得你们才刚认识，这样问可能有些失礼，但你还是忍不住想知道。");
            outputText("[pg][say: 你是……？]");
            outputText("[pg]你犹豫了一下。");
            outputText("[pg][say: 小恶魔？]巴勃罗打断了你。他似乎已经预料到了你的问题。[say: 很多人都这么问我。我想我算是吧，但也不完全是。]");
            outputText("[pg]不过，他看起来确实像个小恶魔。你很好奇，他到底是怎么进入特尔阿德雷的。他们肯定以为他是个小恶魔。");
            outputText("[pg][say: 他们确实是这么认为的，]他开始说道，低下头，脚在地上蹭了蹭。回想起他刚到这座城市的那一天，他忍不住笑了起来。[say: 我费了好大劲才解释清楚，那可真不容易。最后，他们用一种特殊的晶体对我进行了一次奇怪的腐化扫描。你可以想象，当我通过他们的测试时，他们有多惊讶。]");
            outputText("[pg]如果他以前不是这样，那他是什么？他又是怎么变成这样的？你真希望他不介意你问这些。");
            outputText("[pg][say: 说出来你可能不信，我曾经也是个人类。我以前是个冒险者。有一天，我偶然穿过了一个传送门，然后，瞧！我就来到了这个地方，玛瑞斯大陆！]");
            outputText("[pg]你瞪大了眼睛。他以前也是人类，就像你" + (get_player().get_race() == "human" ? "现在一样" : "曾经一样") + "！");
            outputText("[pg][say: 后来，我饿了，——非常——饿。有一段时间，食物很难找，我只能找到什么吃什么。有时候小恶魔身上会带着这种奇怪的食物，有时候他们会带着饮料。我想你应该明白我的意思了。长话短说，我吃的东西最终改变了我。]");
            outputText("[pg]你聚精会神地继续听他讲故事。");
            outputText("[pg][say: 我的头发以前也不是这个颜色的。它是黑色的，]他一边说着，一边卷起一绺沙金色的头发。[say: 沙漠里有个疯婆子把它弄成了这样，她自称是沙漠女巫。呵。我拒绝让她对我施法时，她大发雷霆。我还能怎么办？她甚至不告诉我那是什么法术。最后，为了平息她的怒火，我妥协了。其实，我已经有点习惯这个颜色了。不过，关于我的事就说到这里吧。也许我们可以一起锻炼一下？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2327,1);
            pabloAffection(10);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2328) < 80)
         {
            outputText("你走近巴勃罗。");
            outputText("[pg][say: 噢，嘿，[name]！又来锻炼了吗？]");
         }
         else
         {
            outputText("你微笑着走向巴勃罗，很高兴再次见到你的朋友。");
            outputText("[pg][say: 瞧瞧是谁来了，]小恶魔转过身来面对你，咧嘴大笑。[say: 嘿，朋友。你是来锻炼的吗？你知道我这里随时欢迎你。还是说你只是顺路来打个招呼？]");
         }
         menu();
         addNextButton("是",workoutWithPablo).disableIf(!get_player().hasFatigue(20),"你现在太累了，无法锻炼。");
         addNextButton("否",declineWorkout);
      }
      
      public function PabloPussPussSubMenus() : void
      {
         var inCharge1:Boolean;
         var _g1:PabloScene;
         var inCharge:Boolean;
         var _g:PabloScene;
         clearOutput();
         outputText("你的[vagina]该怎么用？是你来主导还是让他来带领？");
         menu();
         _g = this;
         inCharge = true;
         addButton(0,"主导",function():void
         {
            _g.pabloPussPuss(inCharge);
         }).hint("你将主导并用阴道承受。","主导");
         _g1 = this;
         inCharge1 = false;
         addButton(1,"巴勃罗带领",function():void
         {
            _g1.pabloPussPuss(inCharge1);
         }).hint("你将让巴勃罗带领，他会好好利用他的肉棒。","巴勃罗带领");
      }
   }
}

