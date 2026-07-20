package classes.scenes.places.telAdre
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
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
   import classes.scenes.places.TelAdre;
   import classes.scenes.places.telAdre._Edryn.SaveContent;
   import flash.Boot;
   import haxe.IMap;
   
   public class Edryn extends TelAdreAbstractContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public var edrynHeliaLastThreesomeCheck:int;
      
      public function Edryn()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         edrynHeliaLastThreesomeCheck = 0;
         globalSave = false;
         saveVersion = 1;
         saveName = "edryn";
         saveContent = new SaveContent(null,null,null,null);
         super();
         pregnancy = new PregnancyStore(722,68);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         var _loc1_:* = null as IMap;
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            if(pregnancy.get_type() == 31)
            {
               get_game().urtaQuest.urtaAndEdrynGodChildEpilogue();
               pregnancy.knockUpForce(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,724));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,723,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,724,0);
               return true;
            }
            if(pregnancy.get_type() == 25)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,69,FlagDict_Impl_.arrayReadInt(_loc1_,69) + 1);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,72,1);
               pregnancy.knockUpForce();
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,71) == 0 && pregnancy.get_type() != 31)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,68,FlagDict_Impl_.arrayReadInt(_loc1_,68) + 1);
         }
         return false;
      }
      
      public function threesomeEdrynAndHel() : void
      {
         clearOutput();
         get_images().showImage("edryn-hel-threesome");
         var _loc1_:int = get_player().cockThatFits(300);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,404,FlagDict_Impl_.arrayReadInt(_loc2_,404) + 1);
         outputText("你们来到了埃德琳的私人房间，这是酒吧里一个昏暗的小壁龛，地板上铺着厚厚的一层枕头。你开始脱衣服，看着赫尔被埃德琳突然的臀部撞击几乎挤到了墙上：[say:你最好开始用你那长长的蜥蜴舌头给我热身，小可爱，]她说着，自己也脱下了宽松的衬衫。[pg]");
         outputText("赫尔没有再被催促，立刻开始工作，抓住埃德琳宽阔的侧腹，把脸埋进半人马娘的马穴里。你抓住你的" + get_player().cockDescript(_loc1_) + "，对着眼前展开的表演自慰。埃德琳开心地嘶鸣着，扭动着臀部迎合赫尔的脸，把火蜥蜴越来越紧地挤在墙上。[pg]");
         outputText("好了，好了。在埃德琳仅仅因为口交就高潮之前，你把女孩们分开了。你花了一点时间思考如何让这个三人行在埃德琳巨大的马躯上进行。你托了赫尔一把，让她骑在埃德琳的背上，然后在半人马娘身后就位。[pg]");
         outputText("赫尔翻身仰卧，用腿在埃德琳的背上稳住身体，你用你的" + get_player().cockDescript(_loc1_) + "摩擦埃德琳张开的马穴，让半人马娘浑身发抖。这颤抖差点把赫尔从她背上甩下来，导致火蜥蜴痛苦地把爪子抓进埃德琳的侧腹。她惊讶地向后退缩，把自己刺穿在你的[cock]上。[pg]");
         outputText("埃德琳向后退，迫使你踉跄了一下，直到埃德琳把你的阴茎齐根吞没。你的背撞在墙上，你的臀部挺进半人马娘光滑的肉洞里。马娘的小穴像一个滚烫的丝绸老虎钳一样收缩着包裹着你的肉棒，已经开始榨取你。你开始在她体内抽插，抽出直到你的阴茎刚刚分开她的阴唇，然后用力挺进直到根部");
         if(get_player().balls > 0)
         {
            outputText("，你的阴囊湿漉漉地拍打着她小穴的底部");
         }
         outputText("。[pg]");
         outputText("在半人马娘的背上，赫尔向后爬，直到她丰满的臀部与埃德琳的臀部齐平。她的尾巴像蛇一样伸出，缠绕在你的腰上，然后它滚烫狭窄的尖端顶在埃德琳紧致的后庭上。现在有了赫莉娅肉感的尾巴紧紧缠绕着你，你只能对半人马娘进行较短的抽插，你通过加快速度来弥补，以足以让任何人类严重瘀伤的力量猛烈撞击她紧致的深处。在你一次抽插的最高点，赫尔终于让她的尾巴尖穿过了埃德琳紧致的肛门，只推进了一英寸，就已经让她的坐骑在狂喜中尖叫起来。[pg]");
         outputText("你决定双管齐下，向前倾身，把脸埋进赫尔性感的双腿之间。当你的舌头滑出，挑逗她的外阴唇，轻轻拂过她的小阴蒂，然后滑入她滚烫的裂缝时，火蜥蜴倒吸了一口凉气。你开始活塞般地抽插你的臀部和脸，在你同时操着半人马娘和火蜥蜴时，加快了不稳定的节奏，伴随着赫尔滑动的尾巴在埃德琳屁股里进进出出的节奏，攻击着她们张开的小穴。[pg]");
         outputText("然而，看来这种双重攻击对可怜的埃德琳来说太过强烈了。当她抓住自己的乳房，挺起臀部，前腿因为快感而瘫软时，你咧嘴笑了起来。赫尔惊叫一声，向后摔倒，刚好脱离了你的触及范围，直到她的背部撞上了埃德琳的人类半身。你不愿让火蜥蜴在没有释放的情况下离开，于是你跳上埃德琳丰满的臀部，顺势滑下，像举起长矛一样举起你的" + get_player().cockDescript(_loc1_) + "，直直地刺入赫尔等待着的小穴。当你的肉棒撞击她的子宫颈时，她发出了夹杂着快感与痛苦的尖叫，而你的脸则被埋在了她的双乳之间。你正准备开始认真地操她，但还没来得及，你的屁股突然被赫尔长长的尾巴插入了。你大叫出声，突然被火蜥蜴滚烫的小穴和突如其来的尾巴操弄困住了。[pg]");
         outputText("片刻之后你高潮了，你抓住赫尔的肩膀，尽可能深地挺进她的身体。你释放了心中的野兽，伴随着最后一次有力的冲刺，将精液喷洒进她的子宫。赫尔的头向后仰去，感受着你的精液填满她的身体，很快她也迎来了高潮，呻吟着，将你那已经酸痛的肉棒里最后一点精液榨干。[pg]");
         outputText("你们三个瘫倒在一起，气喘吁吁，沉浸在快感与疲惫之中。你俯身查看刚刚被你当床用的半人马娘，欣慰地看到埃德琳似乎被操傻了，她双眼翻白，舌头淫荡地吐在嘴外。赫尔靠在她的背上，张着嘴大口喘气，手指缓慢地从她那被填满的小穴里抠出一点你的精液。你从她体内抽出，从人堆里爬下来，把肉棒塞进埃德琳张开的嘴里，用她来清理你的阴茎。[pg]");
         outputText("当你满意后，你踉跄着倒在她的马身上，几乎无法抵挡强烈的睡意。半人马娘满足地呻吟着，[say: 嗯，我们有空应该再来一次。你们俩太棒了。][pg]");
         outputText("[say: 哦，是啊。我们……我们有空一定要再来一次，]赫尔附和道，差点从埃德琳的背上摔下来。你给了两个女孩一个长长的吻，然后收拾好你的[armor]，走回营地。[pg]");
         get_player().orgasm("Dick");
         get_game().helFollower.helAffection(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function shockedByPregdrynThenAccept() : void
      {
         var _g:Edryn;
         clearOutput();
         outputText("你倾身向前，握住埃德琳的手，将它们捧在你的掌心。她抬起头看着你的眼睛，读懂了你的表情，当她看清你脸上的感情时，露出了微笑。[pg]");
         outputText("[say: 谢谢你！你刚才真的吓到我了，你知道吗？哇，我心里的石头总算落地了，]埃德琳呼出一口气。她站起身来，轻声说道：[say: 我得去趟小马驹的洗手间，我马上回来，亲爱的，]然后离开了。[pg]");
         _g = this;
         doNext(function():void
         {
            _g.pregdrynOffer();
         });
      }
      
      public function shockedByEdrynsPregnancy() : void
      {
         clearOutput();
         outputText("你结结巴巴地想要回答，面对这惊人的消息，你不知道该说什么。埃德琳看起来快要哭了，而你只能努力寻找合适的词语。她紧紧抓住桌子，指关节发白，眼睛惊恐地左右扫视。");
         outputText("[pg]<b>你该怎么做？</b>");
         menu();
         addButton(0,"接受",shockedByPregdrynThenAccept);
         addButton(1,"拒绝",beAnAssholeToPregdryn);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.boys = 0;
         saveContent.girls = 0;
         saveContent.herms = 0;
         saveContent.kidMet = false;
      }
      
      public function pregdrynOffer(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         if(!pregnancy.get_isPregnant())
         {
            edrynSexSelecter();
            return;
         }
         if(pregnancy.get_incubation() < 250)
         {
            outputText("埃德琳艰难地移动着，因为她那肿胀的怀孕肚子，她几乎是摇摇晃晃地走着。像往常一样，她那闪闪发光的黑色阴唇暴露在外，随着荷尔蒙在她体内涌动，她不断地渗出粘液。她身上散发出的气味简直不真实！就像它直接钻进了你的大脑，把“操”的旋钮调到了最大。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你所有的[cocks]在几秒钟内就充血了，变得坚硬如石，甚至因为渴望而隐隐作痛。");
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]在几秒钟内就充血了，变得坚硬如石，甚至因为渴望而隐隐作痛。");
            }
            outputText("你完全被这巨大的兴奋惊呆了，并且");
            if(get_player().cor + get_player().lib < 100 || get_player().cockTotal() < 1)
            {
               outputText("你努力克制自己不去把手伸进[armor]里抚摸自己。");
            }
            else
            {
               outputText("你忍不住抓住了");
               if(get_player().cockTotal() == 1)
               {
                  outputText("你的");
               }
               else
               {
                  outputText("一根");
               }
               outputText("[cock]并在桌子底下抚摸起来。");
            }
            outputText("[pg]");
            outputText("如果不是因为扑鼻而来的强效半人马信息素增加，你根本不会注意到她的回归。直到一只手滑到桌子底下把玩你的");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else if(get_player().cockTotal() > 0)
            {
               outputText(get_player().cockDescript(0));
            }
            else
            {
               outputText("裤裆");
            }
            outputText("才把你从那不可思议的性欲迷雾中唤醒。");
         }
         else
         {
            outputText("像往常一样，当埃德琳转身离开时，她那不寻常的阴道完美地展现在你眼前。她那闪烁着黑光的阴唇几乎要渗出水来，散发出的气味似乎比平时更浓烈，让你头晕目眩。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你所有的[cocks]在几秒钟内就充血了，变得坚硬如石，甚至因为渴望而隐隐作痛。");
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]在几秒钟内就充血了，变得坚硬如石，甚至因为渴望而隐隐作痛。");
            }
            outputText("你被突然飙升的性欲弄得有些头晕目眩，而且");
            if(get_player().cor + get_player().lib < 100 || get_player().cockTotal() < 1)
            {
               outputText("你努力克制自己不去把手伸进[armor]里抚摸自己。");
            }
            else
            {
               outputText("你忍不住抓住了");
               if(get_player().cockTotal() == 1)
               {
                  outputText("你的");
               }
               outputText("一根");
               outputText("[cock]并在桌子底下抚摸起来。");
            }
            outputText("[pg]");
            outputText("像往常一样，你几乎没有注意到她的回归。直到一只手偷偷摸摸地伸到桌子底下，抚摸你的");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else if(get_player().cockTotal() > 0)
            {
               outputText(get_player().cockDescript(0));
            }
            else
            {
               outputText("裤裆");
            }
            outputText("你才从恍惚中清醒过来。");
         }
         if(get_player().cockTotal() == 0)
         {
            outputText("她低下头，目光在你的裤裆上停留了片刻，然后叹了口气，[say:你为什么把你的鸡巴弄没了？我很喜欢你，但我真的不想和你现在的样子做爱。]");
            outputText("[pg]埃德琳看起来有些沮丧地离开了。");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
            return;
         }
         var _loc2_:int = get_player().cockThatFits(300);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(get_player().cockArea(_loc2_) >= 24 && get_player().cockArea(_loc2_) < 300)
         {
            outputText("埃德琳在桌子底下继续抚摸你，脸上洋溢着灿烂的笑容。她问道，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) == 0)
            {
               outputText("[say:我的气味现在对你的影响更大了吗？]");
            }
            else
            {
               outputText("[say:你光是闻闻我的小穴就要射了吗？]");
            }
            outputText("你试图否认，但她却套弄着你的肉棒，继续说道：[say: 别撒谎了，亲爱的，我能感觉到你现在有多硬，而且我出来的时候，绝对看到了你那副神魂颠倒的样子。我们回我房间去吧，让你再闻闻，好吗？][pg]");
            outputText("半人马没有等你回答，便小跑着朝她的房间走去。几滴液体溅落在地板上，为你留下了一条可以追踪的痕迹。你站起身来，被情欲冲昏了头脑，流着先列腺液，跌跌撞撞地穿过酒吧，走向她的房间，简直就像喝醉了一样。");
            dynStats(DynStat.Lust(50));
            outputText("[pg]你想怎么处理这件事？");
            menu();
            outputText("你可以来一场超棒的、怀孕半人马性爱。");
            addButton(0,"孕期做爱",fuckPregEdryn);
            if(get_player().biggestCockArea() >= 300)
            {
               outputText("既然你至少有一部分不能被她接受，你可以舔她的小穴，直到你仅仅因为她的信息素就高潮。");
               addButton(1,"不合适舔穴",jizzFromEatingPregdrynOut);
            }
            outputText("或者，你可以给她口交，直到你陷入疯狂，然后狂野地操她。");
            addButton(2,"舔,发情,操",eatEdrynPussyLikeABawss);
            return;
         }
         if(get_player().cockArea(_loc2_) > 300)
         {
            outputText("埃德琳的手拂过你所有的[cock]，然后猛地缩了回去，吓了一跳。她叹了口气，[say: 亲爱的，那东西简直是个怪物。我的意思是，毫无疑问我很想让它进到我里面，但我保证它塞不进我的。][pg]");
            outputText("她恳求地看着你，几乎是在哀求，[say: 拜托，想个办法塞进我里面。]埃德琳抓住你的肩膀，在你耳边低语，[say: 怀孕让我一直都处于发情状态。我需要你在我里面。][pg]");
            outputText("半人马的脸上闪过一丝若有所思的神情，她继续在你耳边喘息着，[say: 来吧，我们回我房间去。如果你愿意舔我，我会想办法照顾那个怪物的。也许我小穴里飘出的信息素能让你不用我碰就高潮呢？我以前在一些客人身上见过这种情况，而且我现在身上的气味这么浓……][pg]");
            outputText("埃德琳放开你，四肢着地爬了起来，朝着她在店后面的房间走去。她渴望的气味在空气中弥漫，你像一只迷路的小狗一样跟在后面。当然，小狗可不会把它们巨大、坚硬如石的雄性特征暴露在周围所有人面前。谢天谢地，你很快就到了她的门前，并冲了进去。");
            doNext(jizzFromEatingPregdrynOut);
            dynStats(DynStat.Lust(50));
            return;
         }
         outputText("埃德琳咯咯地笑着，[say: 你什么时候变得这么小了？我见过比这还大的小马驹呢！]但她的手还在继续抚摸你。你在她的掌控中扭动着，快要爆发了。怀孕的半人马戏弄道，[say: 亲爱的，我觉得如果你把这么小的东西塞进我里面，我可能都感觉不到。][pg]");
         outputText("她看着你脸上的表情笑了起来，继续说道，[say: 哦，别这样。事实就是事实。你仍然是我孩子的父亲。我们为什么不回我房间去呢？你可以舔我，直到半人马的信息素压倒你的小鸡巴，让它喷出来，好吗？][pg]");
         outputText("半人马没有等你回答，便小跑着朝她的房间走去。几滴液体溅落在地板上，为你留下了一条可以追踪的痕迹。你站起身来，被情欲冲昏了头脑，流着先列腺液，跌跌撞撞地穿过酒吧，走向她的房间，简直就像喝醉了一样。");
         doNext(jizzFromEatingPregdrynOut);
         dynStats(DynStat.Lust(50));
      }
      
      public function postEdrynEatOutRut() : void
      {
         clearOutput();
         outputText("当埃德琳和你醒来时，你们的生殖器都酸痛敏感，以至于清理身体都几乎是一种折磨。半人马娘甚至评论说她得花钱雇人来清理这烂摊子，但她的眼中闪烁着自豪的光芒。不知怎么的，你的[armor]在这场性爱狂欢中被阴道分泌物溅到了，当你重新穿上它们时，[eachCock]恢复了熟悉的硬度。你咬着下唇，在道别后溜了出去，坚硬如铁，浑身散发着埃德琳的情欲气息。你离开时，响起了一阵有限的掌声，夹杂着起哄和口哨声。真是一场酣畅淋漓的性爱！");
         hideUpDown();
         dynStats(DynStat.Lust(20 + get_player().lib / 5));
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 4)
         {
            edrynPregChance();
         }
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 4)
         {
            edrynPregChance();
         }
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 4)
         {
            edrynPregChance();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,776,FlagDict_Impl_.arrayReadInt(_loc1_,776) + 1);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function pleasedbyPregdryn() : void
      {
         var _g:Edryn;
         clearOutput();
         outputText("你咧嘴一笑，向这位充满欲望的半人马表示祝贺。听到你的话，她如释重负地咯咯笑了起来，并在你讲完时擦去了额头上的一滴汗水。埃德琳大声说道：[say: 我真高兴你能为此感到开心！我不指望你放弃你的任务搬来和我一起住，或者做类似的事情，但能在这个镇上听到小蹄子哒哒作响的声音一定会很棒。][pg]");
         outputText("埃德琳从桌边退开，伸了个懒腰，随着紧张感从她高大的身躯中消散，她的肌肉明显放松了下来。她低声说道：[say: 马上回来，亲爱的，我得去趟小马驹的洗手间，]然后她就离开了。[pg]");
         _g = this;
         doNext(function():void
         {
            _g.pregdrynOffer();
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveHelInZeBitch() : void
      {
         clearOutput();
         if(edrynBar() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,405) == 1)
         {
            outputText("你决定不尝试在女孩们之间安排什么——你现在喜欢你的爱人们分开。你花了一个小时剩下的时间安静地和赫莉娅聊天，然后给了她一个友好的告别吻，转身离开。");
         }
         else
         {
            outputText("你拒绝了赫莉娅的请求，说你现在对群交没什么兴趣。她沮丧地叹了口气，但很快就恢复了过来，并给了你一个心领神会的眨眼。[say:好吧，也许以后吧。我知道你和我一样喜欢群交。][pg]");
            outputText("你花了一个小时剩下的时间安静地和赫莉娅聊天，然后给了她一个友好的告别吻，转身离开。");
         }
         doNext(get_telAdre().barTelAdre);
      }
      
      public function jizzFromEatingPregdrynOut() : void
      {
         clearOutput();
         edrynSprite(true);
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你关上身后的门，揉了揉眼睛，试图适应房间里的黑暗。所有的灯都熄灭了，只有远处的墙上点着一根蜡烛。你徒劳地四处张望了几秒钟，直到灵光一闪。她浓烈的气味会指引你找到她！你弯下腰，开始左右转动，四处嗅探。你听到一声女性的轻笑，虽然在这个陌生的房间里，你无法分辨声音是从哪里传来的。嗅出你的“猎物”相当容易，你已经从阴户麝香的强度判断出埃德琳在房间的哪个角落。[pg]");
         outputText("这种气味浓烈、充满性欲，而且完全不似人类。你走近一步，继续小口嗅探，几乎没有注意到你的");
         if(get_player().cockArea(_loc1_) < 24)
         {
            outputText("小鸡巴开始抽动并渗出先列腺液。");
         }
         else
         {
            outputText("巨大的肉棒拖在地上，漏出先列腺液。");
         }
         outputText("在这团麝香云的中心，寻找那多汁、强力小穴的冲动压倒了你的理智。在欲望的迷雾中向前摸索，你深吸着气，吸入越来越多埃德琳那天堂般的气味。你知道你快到了——你能听到她安静的呼吸声。[pg]");
         outputText("你深陷于绝望的渴望之中，以至于匆忙的脚步给你惹了麻烦。你的[foot]绊到了什么东西，你不可阻挡地向前摔去。在恐慌中，你像风车一样挥舞着手臂。一只手伴随着响亮的“啪”声拍在了覆盖着皮毛的肉体上，另一只手则消失在一堆柔软、有弹性的织物中。枕头接住了你，缓冲了跌落的冲击，但你的脸直接砸进了一个温暖、湿润且兴奋的地方。埃德琳倒吸一口凉气，惊呼道，[say: 没必要这么粗暴！我以为你会喜欢玩捉迷藏……你的老二似乎很喜欢，而且我需要一点时间喘口气。带着你的孩子到处跑可不容易！][pg]");
         outputText("她的话你完全听不进去。你用手肘撑起身子，向前倾斜，感觉一丝丝女性的淫液挂在你的脸上，你深深地吸入她的气味。");
         if(get_player().totalCocks() > 1)
         {
            outputText("你的每根");
         }
         else
         {
            outputText("你");
         }
         outputText("的[cocks]");
         if(get_player().cumQ() < 100)
         {
            outputText("滴下先列腺液到枕头上。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("稳定地流出先列腺液，很快浸湿了几个枕头。");
         }
         else
         {
            outputText("涌出足够的先列腺液浸透了一个枕头，没过多久，你那过度热情的肉棒就拼命地把液体滴得到处都是。");
         }
         outputText("这是一种强烈的气味。半人马令人陶醉的麝香已经让你处于边缘，而你甚至还没尝过她的小穴！你的心怦怦直跳，双手抓住她的侧腹，准备服侍你怀孕的爱人。[pg]");
         outputText("在黑暗的房间里待了这么久，你的眼睛已经适应了昏暗的光线。就在你面前几英寸的地方，是埃德琳巨大的阴部。它黑色的褶皱上覆盖着一层厚厚的粘液，顺着她球状的阴蒂流下，汇聚后滴落。你向前倾身，深吸一口气，然后把脸埋进那道裂缝中。你的舌头几乎是自动地伸了出来，舔舐着她内部的褶皱，品尝着她滴下的甜美、浓郁的花蜜。那温暖是显而易见的，当你用脸在小穴上下摩擦时，空气中几乎弥漫着埃德琳欲望的热气。你舔舐、吸吮着她滑溜溜的甜蜜欲望，但对你或你那流着口水的[cocks]来说，似乎永远都不够。[pg]");
         outputText("埃德琳扭动着身体，呻吟着，[say: 是的……就是-啊-那里。嗯……我想你已经迷上我的小穴了，不是吗？]她向后伸出手拍了拍你的头，柔声说道，[say: 对，真是个好[boy]，把它们都舔干净。哦天哪，你光是吃我就已经漏得像个筛子了！哦，是的，再低一点，舔我的阴蒂——对，对——哦……嗯，我打赌这味道一定让你受不了了吧？你为什么不吸吮我的阴蒂，稍微喘口气呢。我打赌你很快就会忍不住喷出来的。][pg]");
         outputText("你颤抖着退开，舔去嘴唇上她的淫液，大口喘着气，然后转移目标去舔她的阴蒂。");
         if(get_player().isTaur())
         {
            outputText("你的双腿在地板上无力地抽搐着，被你抛在脑后，因为你把所有的注意力都集中在你的手、嘴和跳动的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         outputText("她的豆豆和她的小穴一样，比人类的大好几个尺寸，有高尔夫球那么大，几英寸长。你把它吸进嘴里，把一只手插进她滑溜溜的通道里，一边吸吮、上下套弄她的阴蒂，一边用拳头操她。埃德琳嘶鸣着，紧紧夹住入侵的拳头。她的小穴喷发了，液体溅了你一脸，让你浑身浸透了她芳香的气味。[pg]");
         outputText("你从性欲的迷雾中惊醒，猛地向后退去，倒吸了一口凉气。那气味——就像是性爱被提炼成高潮，直接射入你的大脑。你的[hips]不受控制地颤抖着，疯狂地痉挛着，因为你被气味迷乱的大脑引发了全身的高潮。");
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "和你的身体一起收缩痉挛，");
            if(get_player().vaginas[0].vaginalWetness == 5)
            {
               outputText("喷水");
            }
            else
            {
               outputText("流出液体");
            }
            outputText("，拙劣地模仿着埃德琳的小穴。");
         }
         outputText("精液开始从");
         if(get_player().totalCocks() > 1)
         {
            outputText("你的每一根");
         }
         outputText("[cocks]中稳定地流出。你的尿道鼓胀收缩，迫使你把精液全都浪费在埃德琳的枕头上。");
         if(get_player().cumQ() < 1000)
         {
            outputText("水流越来越粗。埃德琳甚至评论道：[say: 哎呀，我宝宝的爸爸真是充满了精液！全都给我射出来吧，亲爱的，你在我的阴蒂上做得太棒了，你值得释放。]你喷射着，滴落着，呼吸着空气中的高潮，喷射着");
            if(get_player().cumQ() < 3000)
            {
               outputText("最后一点欢愉的液体。");
            }
            else
            {
               outputText("越来越多的欢愉液体。精液滴穿地板，你制造了一个几英寸深的水坑。");
            }
         }
         outputText("[pg]");
         outputText("埃德琳笑着把你拉起来，紧紧地拥抱了你一下。她在你耳边低语：[say: 谢谢你的理解。我通常不会这么……敏感，或者说精力充沛。在我怀孕期间你可以继续这样做，但如果我们的孩子出生后你还想做爱，你就得适应我。][pg]");
         outputText("你点点头，捏了捏她滴着奶水的乳头。在埃德琳推开你之前，一股白色的液体喷了出来。你轻笑着穿上衣服，她也穿上了衣服，但在你逃离她的房间之前，她掀起衬衫，挤压乳头，把奶水喷了你一脸。[pg]");
         outputText("[say: 礼尚往来！]她惊呼道。你离开了，无法反驳这个逻辑。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helEdrynThreeSomeStartYerEngines() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,404) == 0)
         {
            outputText("突然，你脑海中浮现出一个主意。你问赫尔是否想见见埃德琳。[pg]");
            outputText("[say:什——真的吗？]她倒吸一口凉气，挑起眉毛。她的尾巴在你腿上兴奋地摇摆着，直到你站起来，牵起赫尔的手，把她带到埃德琳的桌子旁。半人马娘看到你们走近，友好地挥了挥手，不过当她注意到你挽着的另一个女孩时，她歪了歪头。[pg]");
            outputText("[say:嘿，[name]，]埃德琳半笑着说。[say:你的朋友是谁？][pg]");
            outputText("你介绍了这两个女孩，在埃德琳点头示意后，你们俩都在半人马娘的桌子旁坐下。你们愉快地聊了几分钟，看到赫尔和埃德琳相处得如此融洽，你感到很欣慰。几分钟内，她们就开始比较埃德琳的守卫任务和赫尔作为流浪狂战士的冒险经历。你让她们聊了一会儿，但最终你还是提出了带赫尔来见半人马娘的原因。[pg]");
            outputText("令火蜥蜴惊讶的是，当你提到她对埃德琳的小小迷恋时，赫尔脸红了。半人马娘看到赫尔变得通红，发出了少女般的咯咯笑声，但很快就挥手示意没事。[say:别担心，小可爱，]埃德琳说着，握住了赫莉娅的手。[say:看来[name]忘了提：我私下里还会做点“湿活”。[He]和我有一点默契，既然我欲火焚身，而你又这么可爱……我们来实现你的愿望怎么样？][pg]");
            outputText("赫尔高兴得差点尖叫起来。她用力地点头，让你和埃德琳都笑了。埃德琳给了你们一个心领神会的眼神，牵着你和赫尔的手，把你们带进了她的私人房间。");
         }
         else
         {
            outputText("你牵起赫尔的手，把她带到埃德琳的桌子旁。半人马娘看到你们走近，笑得很开心，并邀请你们坐下。你们愉快地聊了几分钟，然后赫尔急切地问埃德琳是否有心情来点群交。[pg]");
            outputText("[say:嗯，通常我只喜欢两个人，但是……为了你们俩，我可以破例一次。][pg]");
            outputText("你们三个咧嘴笑着，一起走向埃德琳的私人房间。");
         }
         doNext(threesomeEdrynAndHel);
      }
      
      public function helAppearance() : void
      {
         outputText("[pg]令你惊讶的是，你看到火蜥蜴赫尔坐在角落的一张桌子旁，两个性感的狐狸" + (get_noFur() ? "" : "兽人") + "女孩坐在她的大腿上。当她看到你进来时，这位漂亮的爬虫举起她的酒杯，在酒吧嘈杂的声音中大喊道，[say:嘿！[name]！这边！]");
      }
      
      public function get_debugName() : String
      {
         return "Edryn";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckPregEdryn() : void
      {
         clearOutput();
         edrynSprite(true);
         get_images().showImage("edryn-preggo-fuck");
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         if(!get_player().isTaur())
         {
            outputText("你身后的门刚一关上，埃德琳就猛地向前扑来，用她强壮的身躯撞向你，力道之大，将你向后推了几英尺，倒在角落里的一大堆枕头上。她那巨大的、滴着乳汁的乳房");
            if(get_player().get_tallness() < 60)
            {
               outputText("在你的头顶弹跳着");
            }
            else if(get_player().get_tallness() < 84)
            {
               outputText("拍打着你的脸");
            }
            else
            {
               outputText("紧紧压在你的胸膛上");
            }
            outputText("绝对值得承受这足以让人淤青的冲击。埃德琳转过身，她的蹄子在房间的地板上发出响亮的咔哒声，直到她把后半身对着你。她的尾巴自动翘起，露出了她肿胀、黑色的阴唇。一股浓烈的半人马体液从那道裂口中稳定地滴落，随着你的半人马爱人靠近，溅落在你的[feet]上。[pg]");
            outputText("你瞬间脱下你的[armor]，完全暴露了你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("选中的");
            }
            outputText(get_player().cockDescript(_loc1_) + "。它因期待而滴水，随着你每一次吸入伴侣那过度性感的肉缝的气味，都会漏出几滴先列腺液。埃德琳回头看了看距离，但当她看到你的状态时，她的脸上绽放出了幸福的笑容。她说，[say:稳住，我们可不想让你错过目标，对吧？]随着她的后半身慢慢下降，滚烫的爱液溅满了你的肉棒。[pg]");
            outputText("半人马的肉缝伴随着长长、湿润的吸溜声吞噬了你的" + get_player().cockDescript(_loc1_) + "。她的体温比你的高得多，湿滑的热度包裹着你操干棒的每一寸敏感肌肤。你周围的血肉本能地挤压和按摩着。感觉太好了，就好像你的" + get_player().cockDescript(_loc1_) + "要在快感的冲击下融化了一样。埃德琳大声呻吟，开始在你身上抽插她的臀部，[say:哦，是的，太完美了……][pg]");
            outputText("沉重的砰砰声回荡着，数百磅因怀孕而变大的半人马后半身一次又一次地撞击着你。如果不是枕头吸收了一些力量，你的骨盆在埃德琳的第一次动作中就会被压碎。她的汁液随着每一次粗暴的抽插而飞溅，浸湿了你的胸膛，并喷到了你的脸上。你躺在她身下呻吟，迎合着她的抽插，但她甚至都没有注意到！她的动作背后有着比你整个身体还要重的重量，她粗暴的抽插只会变得越来越激烈。[pg]");
            outputText("你抓住她的尾巴，用尽全身力气把自己拉向她，尽可能粗暴地将你的身体撞进她的小穴。你自己的高潮就在眼前，埃德琳愉悦的呻吟和嘶鸣达到了狂喜的顶点。她的小穴紧紧地挤压着你，滚烫的肉壁用力地榨取着你，迫使你当场高潮。它在根部紧紧挤压，然后将压力传递到顶端，从你被性虐待的阴茎中抽出爆炸性的精液。[pg]");
            outputText("埃德琳瘫软下来，她全身颤抖，乳汁从她肿胀的乳房中喷涌而出。她的手向上伸去，抓住她的乳头，拉扯着喷乳口。它们现在看起来比她怀孕前更长了。她肿胀的喷乳口至少有一两英寸长！");
            if(get_player().cumQ() < 100)
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "将最后的精液倾泻到她饥渴的小穴中，并微微变软。她温暖的小穴不断地进行着榨取动作，依然令人愉悦，但它们阻止了你变软，直到半人马的高潮结束。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "将浓稠的精液喷射到她饥渴的小穴中，用异常大量的精液淹没了她的私处。她温暖的小穴不断地进行着榨取动作，迫使越来越多的精液进入她体内，直到她自己的高潮结束。");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(_loc1_) + "爆发了，将一股浓稠的精液倾泻到半人马饥渴的小穴中。在埃德琳的高潮持续期间，不断的榨取动作并没有停止，帮助你用更多的精液淹没她。即使在你怀孕的爱人高潮结束后，你的" + get_player().cockDescript(_loc1_) + "仍然不断地将更多的精液倾泻到她体内，直到精液浸透并从她毛茸茸的巨大屁股上滴落。");
            }
            outputText("[pg]");
            outputText("你轻轻捏了捏她过大的屁股，轻轻按摩着，而埃德琳则从美妙的性爱中恢复过来。她回头看着你，喘着粗气，[say:以玛莱的名义，我需要这个。][pg]");
            outputText("半人马伴随着一声长长、湿润的“嘶啦”声抬起了她的后半身。你喘着粗气拔了出来，完美地看到了你的杰作。她小穴的嘴唇微微张开，上面覆盖着一层白色的液体。长着黑色嘴唇的小穴继续流出粘稠的性爱粘液，但由于你的贡献，颜色变得更加不透明。性爱的气味弥漫在房间里，让你的" + get_player().cockDescript(_loc1_) + "再次变硬。[pg]");
            outputText("埃德琳靠在墙上，喘着粗气，回头看着你。她露出了疲惫的假笑，但看起来她无法再承受一回合了。你开始发抖；没有她包裹着你的爱之隧道的温暖，房间似乎冷了很多。瞥了一眼，你找到了你的装备并穿上。在观众全神贯注的注视下穿衣服很困难，但你还是设法穿好了。[pg]");
            outputText("在收集好你的小袋子后，埃德琳看起来已经恢复了。她向你走来，双臂环抱住你，将你的脸结结实实地压在她充满乳汁的乳房之间。你能闻到从她乳头滴落的液体的味道。知道你的女儿在成长过程中会有如此丰富的食物，这让你感到高兴。埃德琳感谢你，[say:那真是太棒了，亲爱的。几分钟后我可能又会发情并湿透，所以请尽快回来。在我们的孩子出生之前，我都会是一个湿漉漉的烂摊子。]");
         }
         else
         {
            outputText("当你关上身后的门时，埃德琳对你笑了笑。她伸了个懒腰，躺在一大堆枕头上，用它们来支撑她怀孕增加的重量。她的后半身正对着你，她扭过头来，给了你一个“过来”的手势。你犹豫地和她一起爬进柔软的垫子堆里，把你的身体对准她的身后。她的姿势很完美，你用双臂环抱住她“人类”的腰，把你的下半身拖到位。埃德琳抓住你的脸，把你拉进一个吻中，当你们俩安顿好时，她那因射箭而强壮的手臂轻松地保持着抓握。[pg]");
            outputText("你结束了亲吻，将她的耳垂底部吸入口中，努力保持嘴巴稳定，同时将你的" + get_player().cockDescript(_loc1_) + "拉到她饥渴的私处。" + get_player().cockHead(_loc1_) + "滑入滚烫的褶皱中，迫使你喘息，让埃德琳的耳垂逃脱了它的口腔监狱。她假笑了一下，然后轻咬你的肩膀，而你则滑入她宽大、湿滑的通道的其余部分。由于你们相似的体型，这几乎是完美的契合，你们俩都发出了愉悦的嘶鸣声。[pg]");
            outputText("埃德琳咬得更重了，一阵疼痛穿过你的肩膀。她的臀部在你的臀部上扭动，她开始有节奏地收紧和放松她的入口，紧紧地挤压着你");
            if(!get_player().hasSheath())
            {
               outputText("在根部");
            }
            else
            {
               outputText("就在你的阴茎鞘上方");
            }
            outputText("。你的下半身弓起，将你的" + get_player().cockDescript(_loc1_) + "拔出一半，然后猛地向前挺动，将其深深埋入她的体内。撞击让她从屁股到肩膀的肉都跟着颤动，你在她身下感受到了这种本能的、几乎不假思索的性支配信号。[pg]");
            outputText("半人马娘向后仰去，呻吟着，[say: 哦，天哪，怀孕的感觉真是太棒了！我的小-小-啊啊啊-穴湿透了。简直就像后面装了个水龙头！而且我好-哦哦哦敏感！嗯，操，" + get_player().mf("种马","亲爱的") + "，别停。求你别停！][pg]");
            outputText("你因用力而闷哼一声，开始更加粗暴地操她。你的双臂紧紧搂住她的腰部，带着爱意与渴求，满足着她的要求。你用力的抽插猛击着她肿胀、滴水的阴户，让你们交缠的身躯随之颤抖，甚至弄掉了几个枕头。空气中充满了抓挠的声音。你的双腿在寻找支撑，但却无处着力。和怀孕的爱人侧躺在枕头里，让你无法像身体渴望的那样用力操干。[pg]");
            outputText("她那湿滑如丝的通道感觉棒极了，它收缩着，像老虎钳一样紧紧夹住你的男性象征。埃德琳张着嘴，当她的眼神开始涣散时，你能感觉到通道的肌肉抽搐在加剧。她正处于高潮的边缘，而你也紧随其后。你抬起一只手抚上她的头，吻了她，舌头滑过她的嘴唇，然后探入其中与她唇齿交缠。她在你身下起伏，在达到顶峰时痉挛着。她的淫液喷涌而出，溅在你的大腿");
            if(get_player().balls > 0)
            {
               outputText("和[balls]上");
            }
            outputText("。她的阴户紧紧地攥着你，让你因为害怕弄伤自己而动弹不得，她入口处紧密的密封就像一个阴茎环，实际上让你的" + get_player().cockDescript(_loc1_) + "在她体内胀大。[pg]");
            outputText("你的" + get_player().cockDescript(_loc1_) + "被从");
            if(!get_player().hasSheath())
            {
               outputText("根部");
            }
            else
            {
               outputText("包皮");
            }
            outputText("一直榨取到" + get_player().cockHead(_loc1_) + "，最后在顶端紧紧挤压。然后它松开，又重新开始。本能地，你发出嘶鸣，在温暖、湿透的通道内爆发了。法式热吻变成了一场狂热的口水战，你们俩在交配中迷失于高潮。");
            if(get_player().cumQ() >= 300)
            {
               if(get_player().cumQ() < 1000)
               {
                  outputText("你惊人的精液量浸透了她泥泞的通道，并和半人马娘的淫液一起从入口处滴落。");
               }
               else
               {
                  outputText("你身体产生的精液轻松地填满了她的通道。每一次连续的喷射都会从她被塞满的阴户中冲出一股液体，浸透了枕头、埃德琳的屁股和你的胯部。");
                  if(get_player().cumQ() >= 4000)
                  {
                     outputText("等你平静下来时，你已经浸透了所有的枕头，精液在身下汇成了一滩。");
                  }
               }
            }
            outputText("[pg]");
            outputText("埃德琳结束了亲吻，中间还挂着一丝唾液。她欣喜若狂地咯咯笑着，[saystart]哇。嗯，哇！太棒了！现在从我身上下去，你这个");
            if(get_player().get_tallness() > 74)
            {
               outputText("大");
            }
            outputText("笨蛋！[sayend] 她调皮地把你推开，试图从你身下爬出来。你和她一起笑着，向后退去，让你疲软的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "从她沾满精液的阴户中拔出。伴随着湿润的吧唧声，它拔了出来，从拔出塞子的开口处释放出洪流般的半人马精液。[pg]");
            outputText("在你们俩都摇摇晃晃地站起来穿好衣服后，埃德琳向你道谢，[say: 亲爱的，那真是太棒了。几分钟后我可能又会发情滴水了，所以请快点回来。我想在我们的孩子出生之前，我都会是个湿漉漉的麻烦精。][pg]");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckEdrynTaur() : void
      {
         clearOutput();
         edrynSprite(true);
         get_images().showImage("edryn-fuck-as-taur");
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你的马身不由自主地向前猛冲，后腿直立，向前扑去。埃德琳被猛烈地插入，被迫承受你大部分的重量，发出一声马嘶。她的马穴真是个奇迹，能够扩张到让最淫荡的人类和恶魔荡妇都自愧不如的程度。她巨大的马穴那如天鹅绒般的肉壁紧紧地夹着你，将你完全困在她多汁的深处。她微微扭动着身体，弯下腰，在体内挑逗着你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("埃德琳回头看了你一眼，眨了眨眼，同时放松了内部肌肉。由于对这突如其来的放松毫无防备，你在后腿站稳之前滑出了几英寸。半人马娘调侃道，[say: 你确定你能应付这种操法吗？像一头发情的野兽一样？你看起来快要摔倒了。来，抓住天花板上垂下来的吊环稳住自己。你需要利用一切能利用的杠杆来满足像我这样发情的女孩。][pg]");
         outputText("吊环离头顶不算太高，你伸长手臂就能轻松够到。抓住它们很容易，而且效果立竿见影。由于手臂支撑了你前半身更多的重量，控制身体的动作应该会容易得多。你向后一挺，又滑出了一点，然后后腿猛地向前一顶，手臂用力拉扯，伴随着一声湿润的啪嗒声，将你的" + get_player().cockDescript(_loc1_) + "齐根没入。[pg]");
         outputText("埃德琳淫荡地呻吟着，随着你拔出准备下一次猛烈冲刺，她迎合着你的动作。你开始认真地抽插，一边喘着粗气，一边努力将你的兽身挺进半人马娘那流着汁液的黑色阴唇中。你惊叹于它散发出的奇特质感和非人的温暖，你的身体渗出了一层细汗，你正尽你所能地给身下的母马配种。");
         if(get_player().cor < 75)
         {
            outputText("你退缩了一秒，责备自己产生了奇怪的想法，但你丝毫没有放慢抽插的速度。");
         }
         else
         {
            outputText("你笑了，意识到你本没打算把她当成母马，把自己当成她的种马，但你现在的所作所为正是如此。你加快了抽插的速度，重新下定决心要用小母马填满这个小穴。");
         }
         outputText("[pg]当你操弄着她那流着淫水的马穴时，她扭过头来看着你的眼睛。你能听到她大量的体液溅落到地板上的声音，当她呻吟着向后靠向你，并在你的嘴唇上印下一个湿吻时，你能感觉到那些液体正顺着你的后腿滴落。她的一只手");
         if(get_player().biggestTitSize() <= 1)
         {
            outputText("抚摸着你的胸膛");
         }
         else
         {
            outputText("爱抚着你的乳房");
         }
         outputText("而另一只手则抚摸着你的[face]侧面。你的身体不断地抽插着，同时你们的舌头交织在一起，在彼此的嘴唇上留下唾液。她向后退去，再次呻吟出声，当她在你身下高潮时，呻吟声渐渐变成了一声马嘶。[pg]");
         outputText("她的小穴再次紧紧锁住你，从根部一直到你的" + get_player().cockHead(_loc1_) + "，一圈一圈地夹紧。立刻，它们开始从根部向顶端滑动，新的肉环沿着肉棒底部形成，她的小穴用力地榨取着你的" + get_player().cockDescript(_loc1_) + "。被困在她体内的你，只能呻吟着，用射精来回应她的高潮。当你感觉到释放的温暖在你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText("下体");
         }
         outputText("。[pg]");
         outputText("埃德琳小穴的起伏和挤压让你越过了不归路。你翻着白眼，将精液卸入她充满麝香的通道，随着你的身体一波接一波地释放出种子，你几乎失去了抓握力。收缩并没有停止");
         if(get_player().cumQ() < 100)
         {
            outputText("即使在你射完之后。");
         }
         else
         {
            outputText("，将越来越多的精液挤进她马匹大小的子宫里。");
            if(get_player().cumQ() > 250)
            {
               outputText("她的身体因为刚刚接受的大量液体注入而发出嘈杂的咕噜声，她的肚子明显膨胀了。");
            }
            if(get_player().cumQ() > 500)
            {
               outputText("随着你的身体耗尽最后的大量储备，它继续进行，使她膨胀到走路都会有困难的程度。");
            }
            outputText("即使在那之后，她的小穴还在继续榨取你。");
         }
         if(get_player().statusEffectv1(StatusEffects.Edryn) <= 1)
         {
            outputText("[pg]你伴随着湿润的啵声拔出，看着混合着半人马精液的液体像瀑布一样从她肿胀的阴唇中倾泻而出。它湿漉漉地溅落在地板上，埃德琳终于放松下来，重重地倒在一堆枕头上。她摇了摇头，把手掌放在身体两侧的地板上，试图在恢复平衡时稳住自己。埃德琳给了你一个疲惫的微笑，说道：[say: 哦哦哦，那太棒了。我的大多数客人都不能让我像那样高潮。也不用担心让我怀上小母马，我吃了一些草药来预防。你有空应该再来，好吗？]");
         }
         else if(get_player().statusEffectv1(StatusEffects.Edryn) <= 3)
         {
            outputText("[pg]她幸福地叹了口气，低头看着你，[say: 哦，[name]，你最棒了。我们应该很快再来一次。哦，女神啊，光是想想我就能感觉到我的汁液开始流了。]");
         }
         else if(get_player().statusEffectv1(StatusEffects.Edryn) == 4)
         {
            outputText("[pg]她幸福地叹了口气，说道：[say: 哦，宝贝，你知道吗？我再也不收你钱了。只要继续让我像那样高潮，我们随时都可以做。]");
         }
         else
         {
            outputText("[pg]她满足地叹了口气，说道：[say: 嗯，别停止来看我，好吗？]");
         }
         outputText("[pg]你们俩尽可能地擦拭干净，重新穿好衣服，然后回到酒吧。你清楚地意识到你的腹股沟散发着多么强烈的半人马荡妇的恶臭。你的身体，对酒吧顾客的气味和审视感到高兴，拒绝软化，为你那沾满精液的阴茎提供了一个绝佳的视野。当你离开时，周围爆发出咯咯的笑声，尽管那些注意到的人中，有不止几个人的乳头变硬了，或者自己也搭起了帐篷。");
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 4)
         {
            edrynPregChance();
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3));
         if(get_player().get_lust() < 30)
         {
            get_player().set_lust(30);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckEdrynNonTaur() : void
      {
         clearOutput();
         edrynSprite(true);
         get_images().showImage("edryn-fuck-as-non-taur");
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("她扭动着丰满的臀部向你靠近，湿漉漉地挤压着你的");
         if(get_player().get_tallness() < 48)
         {
            outputText("脸");
         }
         else
         {
            outputText("身体");
         }
         outputText("。她回头看着你，说道：[say:如果你不想让你的装备闻起来像发情的半人马，你最好脱掉它，用你的舌头让我热身。]你急忙脱下装备");
         if(get_player().get_tallness() > 72)
         {
            outputText("，然后跪下，以便更好地与她平齐");
         }
         outputText("，将你的[face]埋入她湿滑的褶皱中，品尝她的味道。你的鼻子轻松地滑入她的裂口，舌头在其中探索，试探并品尝着浓稠的半人马淫液。味道酸甜，与它散发出的气味截然不同。你轻松地找到了她硕大的阴蒂并吸吮起来，听着湿润的挤压声和愉悦的嘶鸣声。[pg]");
         outputText("你喘着粗气退开，脸上沾着一层薄薄的雌性黏液。她俯身在后半身上，人类那一半因为情欲的燥热而泛着红晕，递给你一条毛巾。你擦了擦脸，听着她兽性的爱液滴落到地板上发出的“啪嗒-啪嗒-啪嗒”声。她已经完全湿透了，你怀疑即使是魅魔也无法做到这种程度。她勾了勾手指，来回摇晃，让她那肿胀的黑色阴唇微微颤动。你不需要更多的鼓励了。[pg]");
         if(get_player().get_tallness() < 60)
         {
            outputText("你抓起一张凳子，这样你就有足够的高度来好好操她，然后爬了上去。");
         }
         outputText("用双手托着你那");
         if(get_player().cockArea(_loc1_) > 200)
         {
            outputText("沉甸甸的包裹");
         }
         else
         {
            outputText("用手支撑着自己");
         }
         outputText("，你引导着你的" + get_player().cockDescript(_loc1_) + "走向面前那闪闪发光的黑色母马阴户。它像天鹅绒窗帘一样轻易地分开了。你慢慢地滑入埃德琳那欢迎你的下体，享受着不用费力就能将你巨大的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "塞进去的难得体验。当你进入一半时，她颤抖了一下，");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("感觉到你的包皮环滑入她的阴唇之间。");
         }
         else
         {
            outputText("在地板上喷出了一点液体。");
         }
         outputText("你插得越深，就越能感受到她的温暖。她的体温比人类高，感觉好得几乎要让你融化。[pg]");
         outputText("她嘶鸣着向后推挤你，迫使你整个" + get_player().cockDescript(_loc1_) + "滑入她润滑良好的通道。你拍了拍她的屁股，看着那长满毛的侧腹微微颤动。埃德琳再次回头，给了你一个性感的眼神。还没等你弄明白她想告诉你什么，她的整个阴户就紧紧收缩起来，像一个丝绸台钳。它紧紧地绞着你的" + get_player().cockDescript(_loc1_) + "，将你固定在强壮的半人马娘体内，让你的[legs]感到发软无力。[pg]");
         outputText("埃德琳稍微放松了一点，足以让你活动，你高兴地开始操她的后半身，抓住她的尾巴作为杠杆，用力地撞击她。她的整个身体随着你的动作摇摆，甚至连乳房都在晃动。她配合着你，以同样的热情向后推挤，直到她丰富的爱液溅满了你的肚子和大腿，每一次抽插都伴随着响亮的啪啪声。她快乐地嘶鸣着，越操越用力，直到你努力不被这个过度热情的女人撞倒。[pg]");
         outputText("她呻吟着、嘶鸣着，她的兽性阴户发出响亮的啧啧声，吞咽着你的" + get_player().cockDescript(_loc1_) + "，达到了狂热的顶峰。一切突然发生了变化，你失去了平衡。你紧紧抓住她的尾巴，拼命地坚持着，因为她把你压倒在地板上。成百上千个柔软的枕头缓冲了坠落，确保你不会被埃德琳的后半身压碎，但你完全被她压在了身下。[pg]");
         outputText("你觉得你应该做点什么，但你什么也做不了。她从未错过任何一个节拍，抬起后半身直到你快要滑出来，然后猛地砸下来，偶尔用她不受控制的尾巴拍打你的脸。在几百磅重的马肉下无助地躺着，你被迫承受着这一切，像个充气娃娃一样被操了不知道多久。[pg]");
         outputText("当她终于高潮时，你已经被折腾得浑身酸痛，而她似乎一点也不在乎。她发出一声马嘶，重重地压了下来，让你难以呼吸。她的小穴一阵痉挛，开始榨取你的肉棒。它紧紧地收缩成一个环，从你的根部一直滑到龟头，但肌肉收缩得太快了，挤压着你的快感之环多得数不清。你的心脏在胸腔里狂跳，你试图在呼吸的同时达到高潮，但只有你的肉棒成功做到了这一点。[pg]");
         outputText("当你在埃德琳充满麝香的通道里释放时，你的眼睛翻白，放弃了呼吸，因为你的身体释放出一波又一波的种子。收缩并没有停止，");
         if(get_player().cumQ() < 100)
         {
            outputText("即使你已经射完了。[pg]");
         }
         else
         {
            outputText("将越来越多的精液挤进她马一样大小的子宫里。");
            if(get_player().cumQ() >= 250)
            {
               outputText("她的身体因为刚刚接受的大量液体注入而发出嘈杂的咕噜声，她的肚子明显膨胀了。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("随着你的身体耗尽最后的大量储备，它继续进行，使她膨胀到走路都会有困难的程度。");
            }
            outputText("即使你已经射完了，她的阴道还在继续榨取你。[pg]");
         }
         outputText("当你的视线边缘开始变黑时，埃德琳");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("试图站起来，抬起足够的高度让你好好呼吸几口，但你的肉结让她锁在你身上，你们两个又绑在一起一两分钟，直到它缩小，将你最后的精液排空到她体内。你挣脱出来，");
         }
         else
         {
            outputText("慢慢地从你身上站起来，");
         }
         outputText("就像大坝决堤一样，一波混合的性液从她肿胀的嘴唇倾泻到你身上。埃德琳高兴地叹了口气，你意识到她的舌头挂在嘴边，眼睛微微翻白。你意识到，尽管她努力表现得克制，但她的身体却决心成为一个放荡的荡妇。[pg]");
         if(get_player().statusEffectv1(StatusEffects.Edryn) <= 1)
         {
            outputText("她高兴地叹了口气，低头看着你，[say: 哦，那太好了。我的大多数顾客都不能让我那样高潮。我希望你没事！也不用担心我怀孕，我吃了一些草药来防止这种事情发生，直到我准备好。][pg]");
         }
         else if(get_player().statusEffectv1(StatusEffects.Edryn) <= 3)
         {
            outputText("她高兴地叹了口气，低头看着你，[say: 哦，[name]，你是最棒的。我们应该很快再做一次。哦，女神，一想到它，我就能感觉到我的汁液开始流出来了。][pg]");
         }
         else if(get_player().statusEffectv1(StatusEffects.Edryn) == 4)
         {
            outputText("她高兴地叹了口气，说道：[say: 哦，宝贝，你知道吗？我再也不收你钱了。只要继续让我那样高潮，我们随时都可以做。][pg]");
         }
         else
         {
            outputText("她满足地叹了口气，说道：[say: 嗯，永远不要停止来拜访我，好吗？][pg]");
         }
         outputText("你们两个尽可能地清理干净，重新穿好衣服，然后回到酒吧。你清楚地意识到你身上散发着强烈的半人马荡妇的气味。你的身体对这种气味和酒吧顾客的审视感到高兴，拒绝变软，提供了一个绰绰有余的帐篷。当你离开时，周围爆发出咯咯的笑声和笑声，尽管注意到你的人中不止几个乳头变硬或自己搭起了帐篷。");
         if(get_player().statusEffectv1(StatusEffects.Edryn) >= 4)
         {
            edrynPregChance();
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3));
         if(get_player().get_lust() < 30)
         {
            get_player().set_lust(30);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findOutEdrynIsPregnant() : void
      {
         edrynSprite();
         clearOutput();
         outputText("埃德琳趴在桌子上，若有所思地用手指在水杯边缘画圈，无精打采地戳着盘子里的青菜。每次你和她对视，她的眼睛总是向下或向旁边瞥去。你从未见过这个不知羞耻的半人马如此烦恼，你抓住她的肩膀问道：[say: 怎么了？][pg]");
         outputText("她终于抬起头看着你，棕色的大眼睛里闪烁着泪光，解释道：[say: 我——我怀孕了。我去找了修道院的人，让他们用魔法检查了一下。你是孩子的父亲。][pg]");
         outputText("半人马娘脸涨得通红，既然开了口，她便一口气把所有事情都说了出来：[say: 我不知道是怎么回事！我一直在吃避孕的草药，我从来没听说过有人吃着这些草药还会怀孕的。]她一边说一边轻轻拍了拍自己的侧腹，[say: 我想你的精液里肯定有什么特别的东西！我们的孩子会是个半人马，就像她妈妈一样，我打算把她生下来。][pg]");
         outputText("<b>你作何反应？</b>");
         menu();
         addButton(0,"震惊",shockedByEdrynsPregnancy);
         addButton(1,"高兴",pleasedbyPregdryn);
         if(get_player().hasCock())
         {
            addButton(2,"唤情",arousedByPregdryn);
         }
         else
         {
            addButtonDisabled(2,"唤情","这个场景需要你拥有阴茎。");
         }
      }
      
      public function edrynSprite(param1:Boolean = false) : void
      {
         if(!pregnancy.get_isPregnant())
         {
            spriteSelect(SpriteDb.get_s_edryn());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_edryn_preg());
         }
      }
      
      public function edrynSexSelecter() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = get_player().statusEffectv1(StatusEffects.Edryn);
         if(_loc2_ == 0)
         {
            _loc1_ = 200;
         }
         else if(_loc2_ == 1)
         {
            _loc1_ = 100;
         }
         else if(_loc2_ == 2)
         {
            _loc1_ = 50;
         }
         else if(_loc2_ == 3)
         {
            _loc1_ = 25;
         }
         else if(_loc2_ == 4)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = 0;
         }
         if(_loc1_ > get_player().get_gems())
         {
            clearOutput();
            outputText("你意识到自己付不起和这位性感半人马娘共度良宵的费用，只能带着满腔的失望和欲火离开。");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
            return;
         }
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - int(_loc1_));
         statScreenRefresh();
         edrynFucktroduction();
         get_player().addStatusValue(StatusEffects.Edryn,1,1);
      }
      
      public function edrynPregChance() : void
      {
         if(pregnancy.knockUpChance(0,25) && get_player().cumQ() >= 250)
         {
            pregnancy.knockUp(25,500);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,71,0);
         }
      }
      
      public function edrynOffer() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = get_player().statusEffectv1(StatusEffects.Edryn);
         if(_loc2_ == 0)
         {
            _loc1_ = 200;
         }
         else if(_loc2_ == 1)
         {
            _loc1_ = 100;
         }
         else if(_loc2_ == 2)
         {
            _loc1_ = 50;
         }
         else if(_loc2_ == 3)
         {
            _loc1_ = 25;
         }
         else if(_loc2_ == 4)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = 0;
         }
         var _loc3_:int = get_player().cockThatFits(300);
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(get_player().isTaur() && get_player().totalCocks() > 0)
         {
            if(get_player().cockArea(_loc3_) < 24)
            {
               outputText("[say: 哎呀，亲爱的，你对我来说有点太小了。也许你应该尝尝当地的美食，然后再跑回来，这样我就能帮你了，好吗？][pg]");
               outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
               cheatTime(1);
               doNext(get_telAdre().barTelAdre);
               return;
            }
            if(get_player().cockArea(_loc3_) > 300)
            {
               outputText("[say: 哇哦，亲爱的，你对我来说有点太大了，我应付不来。也许你应该找点东西把它缩小一点，不要太多，然后再跑回来，这样我就能帮你了，好吗？][pg]");
               outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
               cheatTime(1);
               doNext(get_telAdre().barTelAdre);
               return;
            }
            outputText("[say: 哎呀，你还真是急不可耐呢？我能感觉到它有多紧绷多饱满，简直快要爆炸了。好吧，我有个好消息要告诉你，" + get_player().mf("种马先生","大鸡巴小姐") + "，我是最棒的那种佣兵——只要给钱什么都干，甚至包括满足发情的马科" + get_player().mf("种马","配种机器") + "。][pg]");
            outputText("你呻吟了一声，在公共场合被公然抚摸让你比以往任何时候都要兴奋。这个半人马妓女向你眨了眨眼，提议道，[saystart]那么你觉得呢，和我滚床单值不值");
            if(_loc1_ > 0)
            {
               outputText(Utils.num2Text(_loc1_) + "颗宝石？");
            }
            else
            {
               outputText("你一个小时的时间？");
            }
            outputText("[sayend][pg]");
            outputText("她松开了你的" + get_player().cockDescript(_loc3_) + "，满怀期待地看着你。你的身体已经准备好为了一个和她交配的机会做任何事了。你要怎么做？[pg]");
            if(_loc1_ > 0)
            {
               outputText("（你要支付" + Utils.num2Text(_loc1_) + "颗宝石来操她吗？）");
            }
            else
            {
               outputText("（你要操她吗？）");
            }
            doYesNo(edrynSexSelecter,get_telAdre().barTelAdre);
         }
         else if(get_player().cockTotal() > 0)
         {
            if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               if(get_player().cockArea(_loc3_) > 300)
               {
                  outputText("[say: 哇，好大！亲爱的，你想和我玩的话，还得再小一点才行。为什么不去想办法把它缩小到像我这样的马能承受的尺寸呢，也许之后我们就能玩了，好吗？][pg]");
                  outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
                  cheatTime(1);
                  doNext(get_telAdre().barTelAdre);
                  return;
               }
               if(get_player().cockArea(_loc3_) < 24)
               {
                  outputText("[say: 哎呀，就这？亲爱的，你想和我玩的话，还得再大一点才行。为什么不去尝尝当地的特产呢，也许之后我们就能玩了，好吗？][pg]");
                  outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
                  cheatTime(1);
                  doNext(get_telAdre().barTelAdre);
                  return;
               }
               outputText("[say: 嗯哼，果然不出我所料。你刚才在幻想着我的小穴，对吧？]她问道。出于本能，你试图摇头否认，但她似乎并没有被骗过。埃德琳松开了你的胯部，责备道，[say: 别撒谎了，你一闻到我多汁小穴的味道，你所有的矜持和毅力就都化作了一滩想要交配和繁殖的春水。相信我，我以前见过这种情况。][pg]");
               outputText("她似乎并不生气，反而显得相当……兴奋。埃德琳解释道，[saystart]又粗又多汁的" + get_player().mf("先生","女士") + "，我可不仅仅是个拿钱办事的打手。我私底下还会接点“湿活”，而且我还没见过哪根马屌闻到我的气味不兴奋得跳起来的。算你走运，我觉得你挺可爱的，而且我现在正欲火焚身。所以，要不");
               if(_loc1_ > 0)
               {
                  outputText(Utils.num2Text(_loc1_) + "颗宝石，");
               }
               else
               {
                  outputText("你一个小时的时间，");
               }
               outputText("我就让你和我的多汁小穴来个亲密接触，怎么样？[sayend][pg]");
               outputText("她站起身来，那股气味再次袭来，让你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋紧绷，你的");
               }
               outputText(get_player().cockDescript(_loc3_) + "抽动起来。你会接受她的提议，给她想要的吗？[pg]");
               if(_loc1_ > 0)
               {
                  outputText("（你要支付" + Utils.num2Text(_loc1_) + "颗宝石来操她吗？）");
               }
               else
               {
                  outputText("（你要操她吗？）");
               }
               doYesNo(edrynSexSelecter,get_telAdre().barTelAdre);
            }
            else
            {
               if(get_player().cockArea(_loc3_) > 300)
               {
                  outputText("[say: 哇，好大！亲爱的，你想和我玩的话，还得再小一点才行。为什么不去想办法把它缩小到像我这样的马能承受的尺寸呢，也许之后我们就能玩了，好吗？][pg]");
                  outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
                  cheatTime(1);
                  doNext(get_telAdre().barTelAdre);
                  return;
               }
               if(get_player().cockArea(_loc3_) >= 24)
               {
                  outputText("[say: 我的背影就那么让你着迷吗？]她调侃道，[say: 通常只有马男孩才会对我这么硬，但你……你想体验一下狂野的骑乘，对吧？][pg]");
                  outputText("她的话说到了点子上，来一发快速的性爱来压制你不断高涨的欲望也没什么坏处，不是吗？[pg]");
                  outputText("埃德琳继续说道，[saystart]我接各种各样的佣兵工作，甚至包括那种湿漉漉的活儿，算你走运，我已经湿透了，足够让你把你的[cock]插进来满足一下。");
                  if(_loc1_ > 0)
                  {
                     outputText(Utils.Num2Text(_loc1_) + " 颗宝石");
                  }
                  else
                  {
                     outputText("你一个小时的时间");
                  }
                  outputText("就能让你体验一生难忘的骑乘。那么，你觉得呢，[name]？你想做我的性玩具吗？[sayend][pg]");
                  outputText("她站起身转过头，向你展示她充满异国情调的后臀。一滴液体从她的阴唇滑落，溅在桌子底下，提醒着你这场交易会有多湿润。你真的想上她吗？");
                  if(_loc1_ > 0)
                  {
                     outputText("[pg](你要支付 " + Utils.num2Text(_loc1_) + " 颗宝石来操她吗？)");
                  }
                  doYesNo(edrynSexSelecter,get_telAdre().barTelAdre);
               }
               else
               {
                  outputText("[say: 哇，就这？抱歉，你想和我玩的话，还得再大一点才行。为什么不去尝尝当地的特产，等你变大一点再来呢？][pg]");
                  outputText("你对这个结果有些失望。看来今晚你是没法尝到半人马娘的滋味了。");
                  cheatTime(1);
                  doNext(get_telAdre().barTelAdre);
               }
            }
         }
      }
      
      public function edrynKidEncounter() : void
      {
         clearOutput();
         var _loc1_:int = edrynGetKid();
         outputText("你正[walking]在特尔阿德雷繁忙的街道上，突然身后传来一声尖锐的喊叫，引起了你的注意。转过身，你看到埃德琳在马路对面朝你挥手。但这很奇怪，那声音听起来比——");
         outputText("[pg]你感到一阵突如其来的冲击，一只年轻的半人马兴奋地冲向你，差点撞到你，[kid.his]前腿抓住了你的[if (tallness > 48) {臀部|肩膀}]。起初这相当令人震惊，但当你看到[kid.he]有着你的眼睛时，一切都说得通了。你的[kid.son]开始用尖锐的声音兴奋地叽叽喳喳，虽然语速太快听不清什么，但背后的情感却很清楚——[kid.he]见到你欣喜若狂，兴奋得完全无法掩饰。");
         outputText("[pg]埃德琳凑到你身边，绕过你那高兴的孩子，设法亲了你一下。[say:只是带孩子散散步，]她说道，[say:不过能碰见你总是件好事。]");
         outputText("[pg]能看到你的孩子[if (cor < 50) {逐渐长大，这[i:很]好|偶尔出现，这并不讨厌}]。你仔细打量了[kid.him]一番。[Kid.his]头发还是很短，眼睛大得让你几乎不敢相信它们能长在[kid.him]脸上，但这只会让[kid.him]显得更加可爱。少许白点覆盖着[kid.his]侧腹，一件小小的" + (_loc1_ == 1 ? "背心" : "裙子") + "点缀着[kid.his]幼小的身躯。总的来说，[kid.he]看起来很像埃德琳，但在你的孩子身上认出你自己熟悉的特征，还是让人感到欣慰。");
         outputText("[pg]然而，当你的小天使伸长脖子在你的嘴唇上印下一个吻时，你完全猝不及防。这是一个足够天真的举动，但你的头还是[if (cor < 50) {惊讶地|条件反射般地}]往后缩了一下，当这只小半人马困惑地看着你时，埃德琳轻笑了一声。");
         outputText("[pg][say:好了，亲爱的，]这名" + (_loc1_ > 1 ? "年长的" : "") + "半人马娘说道。[say:我们亲吻像[Daddy]这样的人时要亲脸颊，记得吗？]");
         outputText("[pg][say:可" + get_player().mf("[i:妈妈]就是这样亲爸爸的","[i:你]就是这样亲妈妈的") + "！]");
         outputText("[pg]埃德琳只是轻笑了一声，牵起她孩子的手，然后转向你。[say:好吧，很高兴见到你，[name]。回头见？]");
         outputText("[pg][say:再见，[Daddy]！]你的孩子附和道，[kid.he]在原地蹦蹦跳跳，[kid.his]小脚在鹅卵石上发出清脆的哒哒声。");
         outputText("[pg]你向她们挥手道别，埃德琳开始带着你的[kid.son]向城里走去。[Kid.he]似乎因为这么快就要离开你而感到难过，但当[kid.he]慢慢消失在人群中时，[kid.he]还是忍不住回头冲你微笑。");
         saveContent.kidMet = true;
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function edrynHeliaThreesomePossible() : Boolean
      {
         if(get_game().time.get_totalTime() == edrynHeliaLastThreesomeCheck || get_game().time.get_totalTime() == -edrynHeliaLastThreesomeCheck)
         {
            return edrynHeliaLastThreesomeCheck > 0;
         }
         edrynHeliaLastThreesomeCheck = int(get_game().time.get_totalTime());
         if(get_player().get_gender() == 0 || get_game().time.hours < 14 || get_game().time.hours >= 20 || Utils.rand(2) == 0 || (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 0 && !get_game().helFollower.followerHel()) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            edrynHeliaLastThreesomeCheck = -edrynHeliaLastThreesomeCheck;
            return false;
         }
         return true;
      }
      
      public function edrynGetKid() : int
      {
         var _loc1_:int = 0;
         if(Utils.rand(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69)) <= saveContent.boys)
         {
            _loc1_ = 1;
         }
         else
         {
            _loc1_ = Utils.rand(saveContent.girls + saveContent.herms) <= saveContent.girls ? 2 : 3;
         }
         registerTag("kid.he",_loc1_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("kid.him",_loc1_ == 1 ? TagFun_Impl_.fromString("他") : TagFun_Impl_.fromString("她"));
         registerTag("kid.his",_loc1_ == 1 ? TagFun_Impl_.fromString("他的") : TagFun_Impl_.fromString("她的"));
         registerTag("kid.son",_loc1_ == 1 ? TagFun_Impl_.fromString("儿子") : TagFun_Impl_.fromString("女儿"));
         return _loc1_;
      }
      
      public function edrynFucktroduction() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:Number = 0;
         var _loc3_:Number = get_player().statusEffectv1(StatusEffects.Edryn);
         if(_loc3_ == 0)
         {
            _loc2_ = 200;
         }
         else if(_loc3_ == 1)
         {
            _loc2_ = 100;
         }
         else if(_loc3_ == 2)
         {
            _loc2_ = 50;
         }
         else if(_loc3_ == 3)
         {
            _loc2_ = 25;
         }
         else if(_loc3_ == 4)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         if(!get_player().isTaur())
         {
            if(_loc2_ > 0)
            {
               outputText("宝石易手，她的手臂又回到了你的[armor]里，把你拉向后面的房间。一阵轻笑声追着你穿过酒吧，直到你身后关门的沉闷声音让它们安静下来。你被用力推到墙上，牙齿都磕得咯咯作响。眼前的星星渐渐散去，露出一条巨大的裂缝，流着清澈的女性粘液。气味扑鼻而来，");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) == 0)
            {
               outputText("她的手臂又回到了你的[armor]里，把你拉向后面的房间。一阵轻笑声追着你穿过酒吧，直到你身后关门的沉闷声音让它们安静下来。你被用力推到墙上，牙齿都磕得咯咯作响。眼前的星星渐渐散去，露出一条巨大的裂缝，流着清澈的女性粘液。气味扑鼻而来，");
            }
            else
            {
               outputText("一阵轻笑声追着你穿过酒吧，直到你身后关门的沉闷声音让它们安静下来。你被用力推到墙上，牙齿都磕得咯咯作响。眼前的星星渐渐散去，露出一条巨大的裂缝，流着清澈的女性粘液。气味扑鼻而来，");
            }
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("让你的" + get_player().cockDescript(_loc1_) + "抽搐疼痛。它让你的身体充满了动物般的欲望，压倒了你曾经可能拥有的任何礼节感。");
            }
            else
            {
               outputText("用奇怪的欲望压倒了你。尽管你很兴奋，但很难不享受这一切。");
            }
         }
         else
         {
            if(_loc2_ > 0)
            {
               outputText("硬币易手，她抓住你，把你拉向酒吧后面一个黑暗的门口。一阵轻笑声追着你穿过酒吧，直到你身后关门的沉闷声音让它们安静下来。埃德琳转过身去，露出她巨大的裂缝，流着清澈的女性粘液。气味扑鼻而来，");
            }
            else
            {
               outputText("她抓住你，把你拉向酒吧后面一个黑暗的门口。一阵轻笑声追着你穿过酒吧，直到你身后关门的沉闷声音让它们安静下来。埃德琳转过身去，露出她巨大的裂缝，流着清澈的女性粘液。气味扑鼻而来，");
            }
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("让你的" + get_player().cockDescript(_loc1_) + "抽搐疼痛。它让你的身体充满了动物般的欲望，压倒了你曾经可能拥有的任何礼节感。");
            }
            else
            {
               outputText("用奇怪的欲望压倒了你。尽管你很兴奋，但很难不享受这一切。");
            }
         }
         outputText("[pg]你要怎么享用她？你可以直接操她。或者，你可以舔她的小穴，直到你被性欲逼疯，彻底失去控制。");
         menu();
         addButton(1,"舔她",eatEdrynPussyLikeABawss);
         if(get_player().isTaur())
         {
            addButton(0,"操她",fuckEdrynTaur);
         }
         else
         {
            addButton(0,"操她",fuckEdrynNonTaur);
         }
      }
      
      public function edrynBarTalk() : void
      {
         var _g1:Edryn;
         var _g:Edryn;
         var _loc2_:Number = NaN;
         var _loc3_:* = null as ItemType;
         var _loc4_:* = null as IMap;
         edrynSprite();
         if(!get_player().hasStatusEffect(StatusEffects.Edryn))
         {
            get_player().createStatusEffect(StatusEffects.Edryn,0,0,0,0);
         }
         clearOutput();
         get_images().showImage("edryn-bar-chat");
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(get_telAdre().katherineEmployment.canTalkToEdryn())
         {
            get_telAdre().katherineEmployment.talkToEdryn();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,72) == 1)
         {
            _loc2_ = Utils.rand(2) + 1;
            if(Utils.rand(10) < 2)
            {
               _loc2_ = 3;
            }
            outputText("埃德琳绽放出一个美丽的笑容，滔滔不绝地说，[saystart]我们有了一个");
            if(_loc2_ == 1)
            {
               outputText("儿子");
            }
            else if(_loc2_ == 2)
            {
               outputText("女儿");
            }
            else
            {
               outputText("扶他");
            }
            outputText("！你当时不在镇上，但生产很顺利，所以别担心。分娩最多也就持续了一个小时。你真该看看你的");
            if(_loc2_ == 1)
            {
               outputText("儿子");
            }
            else
            {
               outputText("女儿");
            }
            outputText("第一次试着站起来的样子。太不可思议了！");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) == 1)
            {
               outputText("我得少花点时间待在这里，这样才能好好抚养");
               if(_loc2_ == 1)
               {
                  outputText("他");
               }
               else
               {
                  outputText("她");
               }
               outputText("，但如果你能在我有空的时候找到我，我会非常乐意“帮助”你解决需求的。");
            }
            else
            {
               outputText("真不敢相信我们已经一起生了" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69)) + "个孩子了！你待会儿最好来看看我——");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) < 3)
               {
                  outputText("我想念你填满我的感觉");
               }
               else
               {
                  outputText("我想让你再让我怀孕");
               }
            }
            outputText("。[sayend][pg]");
            outputText("你留下来和她聊天，了解更多关于你刚出生的孩子的事情，和你的四足情人度过了一段愉快的时光。");
            cheatTime(1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,72,0);
            doNext(get_telAdre().barTelAdre);
            return;
         }
         if(pregnancy.get_isPregnant())
         {
            outputText("当你走近时，埃德琳愉快地微笑着，");
            outputText("邀请你坐在她对面的桌子旁。她把堆积如山的盘子推到一边，因为怀孕的沉重身躯而不舒服地挪动了一下。你对她微笑，轻松地聊了一会儿，直到埃德琳吃完了食物。她说了声抱歉，起身去洗手间。[pg]");
            _g = this;
            doNext(function():void
            {
               _g.pregdrynOffer();
            });
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0)
         {
            outputText("埃德琳示意你坐下，并招手让女服务员给你拿杯饮料。你和这位丰满的半人马坐在一起聊了一会儿，讲述你最近的冒险和性经历。她有时大笑，有时脸红，有时安慰你，但当你讲完时，她因分娩而变大的乳头就像她束腰外衣下的两颗硬子弹，脸也红了。埃德琳拨弄了一会儿食物，然后借故离开，[say: 抱歉，亲爱的，我感觉有点脸红。我要回房间躺一会儿……][pg]");
            if(get_player().totalCocks() == 0)
            {
               outputText("她低下头，目光在你的裤裆上停留了片刻，然后叹了口气，[say:你为什么把你的鸡巴弄没了？我很喜欢你，但我真的不想和你现在的样子做爱。]");
               outputText("[pg]看来你现在没法和她找乐子了。");
               cheatTime(1);
               doNext(get_telAdre().barTelAdre);
               return;
            }
            if(get_player().cockArea(_loc1_) < 300 && get_player().cockArea(_loc1_) > 24)
            {
               outputText("她起身小跑着离开时向你眨了眨眼，臀部性感地摇曳着，吸引着你的目光。她那强烈的气味在空气中弥漫，你的身体立刻产生了强烈的反应，欲火焚身。");
               outputText("你低头看着你的[cocks]并咒骂着，对她如此轻易地影响你感到恼火。这次你绝不可能拒绝她。你起身跟着她回到她的房间，打算解决你双腿之间的需求。[pg]");
               _g1 = this;
               doNext(function():void
               {
                  _g1.pregdrynOffer();
               });
               return;
            }
            if(get_player().cockArea(_loc1_) <= 24)
            {
               outputText("她低下头，目光在你的胯部停留了片刻。埃德琳问道，[saystart]你什么时候变得这么小了？我们这样没法操！");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,73) < 2)
               {
                  outputText("给，拿点这个。这是我们前几天从一个被我们赶出去的恶棍那里没收的，我知道它能让你变得足够大，满足我。只是别用得太疯了，好吗？[sayend][pg]");
                  _loc3_ = get_consumables().GROPLUS;
                  _loc4_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc4_,73,FlagDict_Impl_.arrayReadInt(_loc4_,73) + 1);
               }
               else
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,73) >= 5)
                  {
                     outputText("我很想帮你，但我没有给你的补给。我相信你会找到办法的。[sayend][pg]");
                     cheatTime(1);
                     doNext(get_telAdre().barTelAdre);
                     return;
                  }
                  outputText("给，拿点这个。这是我们前几天从一个被我们赶出去的恶棍那里没收的，我知道它能让你变得足够大，满足我。只是别用得太疯了，好吗？[sayend][pg]");
                  _loc4_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc4_,73,FlagDict_Impl_.arrayReadInt(_loc4_,73) + 1);
                  if(Utils.rand(2) == 0)
                  {
                     _loc3_ = get_consumables().MINOBLO;
                  }
                  else
                  {
                     _loc3_ = get_consumables().INCUBID;
                  }
               }
               get_inventory().takeItem(_loc3_,get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("她低下头，倒吸了一口凉气，[say: 我操！你怎么会有这么个怪物！？当一个半人马都被你的尺寸震惊时，亲爱的，是时候少吃点阴茎增大丸了。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,73) < 2)
            {
               outputText("她的眼睛亮了起来，建议道，[say: 吃点这个；它应该能消肿。][pg]");
               _loc4_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc4_,73,FlagDict_Impl_.arrayReadInt(_loc4_,73) + 1);
               get_inventory().takeItem(get_consumables().REDUCTO,get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("她说，[say: 你应该找点缩形膏之类的东西把它缩小。我没再遇到过，所以你得自己去弄。][pg]");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
            return;
         }
         outputText("当你走近时，埃德琳愉快地微笑着，");
         if(get_player().isTaur())
         {
            outputText("邀请你坐在她对面的桌子旁。你意识到你的同伴根本没有坐在任何座位上，而是“坐”在她的下半身上。你也照做，在她对面坐下，庆幸这家酒吧是为半人马设计的。");
         }
         else
         {
            outputText("指着附近的一张凳子。你拉过座位，意识到你的半人马同伴根本没有静静地坐着，而是“坐”在她的下半身上，目前正躺在地板上。");
         }
         outputText("尽管情况有些奇怪，你还是留下来和她愉快地聊了会儿天。你发现谈话很有趣，你们俩呆在那里吃了一顿清淡的饭菜，有面包、奶酪和一杯葡萄酒。虽然你觉得这段时间很愉快，但你有一种“不对劲”的感觉。[pg]");
         outputText("你仔细观察你的晚餐同伴，试图弄清楚你察觉到了什么，但你就是说不上来。埃德琳悄悄地打了个嗝，为她的粗鲁道歉，并借口去了女洗手间。当她转身离开时，你清楚地看到了她的背影。她那马一样的性器官巨大而肿胀，闪烁着水光。她尾巴左右轻轻地甩动，将她那麝香般的气味像波浪一样推向你，");
         if(get_player().isTaur() && get_player().totalCocks() > 0)
         {
            outputText("那强烈的雌性气味渗入你的血液，让你头晕目眩，你的[cock]");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("从包皮里滑了出来");
            }
            else
            {
               outputText("几乎瞬间充血");
            }
            outputText("，现在坚硬如石。你深吸一口气，你的大脑被淹没在野性本能的海洋中。坚硬的地板在你的身下痛苦地挤压着你的[cock]，迫使你站起来。你能感觉到不止几道好奇的目光滑过你现在完全暴露的男性特征，它抽动着，仿佛在为这种关注而高兴。[pg]");
            outputText("你来回摇摆着身体，时而打着响鼻，时而深吸着雌性的气味，你的目光立刻锁定在返回的母马身上。你的[cock]在你身下跳动着，胀痛得厉害。一滴浓稠的先列腺液在你的" + get_player().cockHead() + "上凝结，仿佛酒馆里还需要你表现得更加露骨似的。埃德琳打量着你，走到你身边说道，[say: 哎呀呀，看来有人很喜欢自己看到的。还是说闻到的？我总是搞不懂到底是什么让你们这些" + get_player().mf("studs","hotties") + "对我这么兴奋。][pg]");
            outputText("一只柔软的手滑到你的腹部下方，托起你的[cock]，用长长滑腻的抚摸将那滴先列腺液涂抹开来。她娇嗔道，[saystart]");
            dynStats(DynStat.Lust(70));
            edrynOffer();
            return;
         }
         if(get_player().totalCocks() > 0)
         {
            if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               outputText("浓烈的雌性气味让你感到有些头晕目眩。");
               if(get_player().cocks[0].cockLength > 16)
               {
                  outputText("你几乎没有注意到你那逐渐变硬的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "撞击桌子底部发出的砰砰声。[pg]");
               }
               else
               {
                  outputText("你不安地扭动着身体，在勃起时感到被你的[armor]束缚住了。[pg]");
               }
               outputText("在气味引发的迷雾中来回摇摆，你没有注意到埃德琳的归来。她大声咳嗽了一下，把你拉回现实世界，推开了她那闪闪发光的小穴的记忆。你开始笨拙地寻找词语，直到你意识到她正心照不宣地对你微笑。出乎意料的是，抚摸滑过你的腹股沟，隔着你的[armor]托起并测量着你。[pg]");
               dynStats(DynStat.Lust(60));
               edrynOffer();
               return;
            }
            outputText("但那浓烈的麝香味只会提醒你这里的一切有多么不同。");
            if(get_player().isCorruptEnough(50) || get_player().statusEffectv1(StatusEffects.Edryn) > 0 || get_lowStandards())
            {
               outputText("不由自主地，你的脑海中想象着她那多汁的马穴会是什么感觉，你的[cock]立刻做出了反应，变粗准备就绪。你不安地扭动着身体，因为你的[armor]感觉太紧了。[pg]");
               outputText("你闻了闻迅速消散的气味，注意到它并不难闻，只是很浓烈，你再次发现自己想象着站着");
               if(get_player().get_tallness() < 60)
               {
                  outputText("在一个凳子上");
               }
               outputText("在她身后，像对待兽人一样操她。沉浸在思绪中，你没有注意到埃德琳的归来。她大声咳嗽了一下，把你从即兴的幻想中唤醒，并给了你一个心照不宣的微笑。一次意想不到的抚摸滑过你的腹股沟，小心翼翼地揉捏和托起你。");
               if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
               {
                  outputText("当你的[cock]扭动着缠绕在她的手臂上时，她羞涩地笑了。");
               }
               outputText("[pg]");
               dynStats(DynStat.Lust(40));
               edrynOffer();
               return;
            }
            outputText("[pg]你一直等到她回来，希望至少有一次事情能恢复正常。虽然接下来的谈话很愉快，但你很难享受其中，最终向这位漂亮的半人马娘告别。");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
         }
         else if(get_player().hasVagina() && get_player().get_lust100() > 70)
         {
            outputText("现在你湿透了，你发现她的气味很迷人。你的一部分好奇它尝起来会是什么味道。当半人马娘回来时，你称赞她那匀称的臀部，但她只是礼貌地笑了笑，并告诉你她[say: 对你这种类型不感兴趣，]不管那是什么意思。接下来的谈话非常愉快，但天下没有不散的筵席。");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
         }
         else
         {
            outputText("但那浓烈的麝香味只会提醒你这里的一切有多么不同。");
            outputText("[pg]你一直等到她回来，希望至少有一次事情能恢复正常。虽然接下来的谈话很愉快，但你很难享受其中，最终向这位漂亮的半人马娘告别。");
            cheatTime(1);
            doNext(get_telAdre().barTelAdre);
         }
      }
      
      public function edrynBar() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) == 0 && get_game().time.hours >= 14 && get_game().time.hours <= 19 && (get_game().time.hours < 17 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) == 0))
         {
            return true;
         }
         return false;
      }
      
      public function eatEdrynPussyLikeABawss() : void
      {
         clearOutput();
         edrynSprite(true);
         get_images().showImage("edryn-eat-her-out");
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         var _loc2_:int = get_player().cockThatFits2(300);
         outputText("埃德琳刚要开口，但她还没说出半打字，你就脱下了你的[armor]，你的[cocks]骄傲地挺立着，清澈的先列腺液顺着");
         if(get_player().cockTotal() == 1)
         {
            outputText("它的底部流下");
         }
         else
         {
            outputText("它们的底部流下");
         }
         outputText("。当你意识到埃德琳竟然脸红了，而且红得像甜菜一样时，你开心地笑了！她的后腿紧张地在周围跳跃，她越过肩膀打量着你，她的尾巴不停地来回摆动，将更多催情的麝香送入你的鼻腔。");
         if(pregnancy.get_isPregnant())
         {
            outputText("你能感觉到，自从她怀孕后，她的信息素变得更加浓烈，但这对你的大脑来说，不过是遗忘黑板上的一抹暗淡笔记。在如此闷热的氛围中，除了你自己的工具，根本不可能去思考衡量任何东西的效力。");
         }
         else
         {
            outputText("你注意到在封闭空间里气味似乎更强烈，但这对你的大脑来说，不过是遗忘黑板上的一抹暗淡笔记。当暴露在她如此强烈的气味中时，除了将你自己[sheath]深埋进她体内，几乎不可能去想任何事情。");
         }
         outputText("[pg][say: 你是要操我，还是打算一整天都盯着我的小穴看？] 脸红的半人马一边调侃，一边迈着小碎步向你走来，屁股先对着你。[say: 我都可以，只要你让我蹭你，直到我满意为止。]");
         outputText("[pg]你坏笑着告诉她，虽然你确实打算将自己埋入她巨大肿胀的裂口中，但你不打算在这场性爱中只做个旁观者。她的小穴最好准备好迎接浓稠的内射，因为你要痛饮她的芳香，直到你忍不住把她操得红肿。这个淫荡的半人马娘对这个建议挑了挑眉，但你能看到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,776) == 0)
         {
            outputText("因为你的虚张声势，她的嘴角扯出一丝微笑");
         }
         else
         {
            outputText("当她想起你上次这么做时，脸上泛起淫荡的笑容");
         }
         outputText("。");
         outputText("[pg]埃德琳小跑着靠近，说道：[say: 那你最好吃光，亲爱的，因为我给你准备了四道菜。] 她肿胀的小穴现在离你只有几英寸远。黑色的阴唇在你面前微微分开，随着湿气开始从兽性的入口流出，慢慢地眨着眼，肉眼可见地使你面前的空气起雾。一层少女的粘液挂在微微张开的入口处，在最后一次吸入她几乎甜美的气味后，你一头扎了进去。你的鼻子是你对半人马小穴发动猛烈战争的第一个牺牲品，一贴上去就被饥渴的褶皱吞没了。你继续推进，直到你的嘴滑过挂在她阴道上的湿润粘稠的面纱，津津有味地亲吻她厚唇的马穴，同时让你的舌头滑出来玩耍。");
         outputText("[pg]刚舔第一口，埃德琳就明显变得更湿了。黏糊糊的汁液从她体内涌出，覆盖了你的脸颊和下巴，然后滴落到你的[chest]上，给你留下了她女性气味的印记。");
         if(get_player().tongue.type > 0)
         {
            outputText("她甚至还没开始品尝你天赋的果实，你就让你长长的舌头在她体内伸展开来，用力按压她的肉壁，温柔地弹拨她体内每一个敏感的褶皱。");
         }
         outputText("这个胸部丰满、充满兽性的女人毫不羞耻地呻吟着，双手摸向自己的乳房揉捏，她的阴蒂充血到了最大尺寸。你能感觉到那个敏感的小结节在你的上颚隆起，所以你张大嘴巴快速吸吮了一下，然后继续打磨她的内脏。在那之后，这个马的快乐蜂鸣器变得坚硬如石，继续意味深长地顶着你，在你的嘴里火热地跳动。");
         outputText("[pg]当你试图专注于沐浴在她小穴美味……浓烈……性感的香气中时，你在你的[feet]上晕乎乎地摇晃着。[EachCock]随着时间的流逝，饥渴地抬起。");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("胀得发痛，你粗壮的肉棒每一次抽动都让你恨不得立刻把它埋进她的身体里——只要能平息你体内那股伤人的欲望，做什么都行。你气喘吁吁地退开，大口呼吸。空气中充满了埃德琳的气味，浓烈得几乎让人窒息，那么甜美、湿润……充满了女性的魅力。你一手扶墙，努力站稳，发出野兽般的呜咽，你的肉棒已经硬得发痛，迫不及待地想要插进小穴里。");
         outputText("[pg]你再次猛地扑向她甜美的小穴，扒开她橡胶般的马唇，开始新一轮的攻势。你像个野[man]一样狂啃着她的私处，完全不顾一切，脑子里只剩下那股贪婪的、几乎被遗忘的欲望，只想一遍又一遍地舔她。她是一匹湿润、准备就绪的母马，而你是一个雄性");
         if(get_player().get_gender() != 1)
         {
            outputText("，或者说足够接近雄性");
         }
         outputText("。一层红色的、充满欲望的薄雾开始笼罩你的视野边缘，即使闭上眼睛，你也发誓能透过眼皮看到她那巨大的、黑玛瑙般的小穴轮廓。");
         outputText("[pg]埃德琳突然发出一声马嘶，她的小穴在你的舌头上痉挛起来，以令人难以置信的肌肉紧致度紧紧夹住。一圈圈痉挛的肌肉在上面游走，从她的入口一直拉扯到只能是她子宫的地方，当她把麝香般的汁液溅满你的脸时，你脑子里想的只有：如果它也能这样夹住你的" + get_player().cockDescript(_loc1_) + "，那感觉该有多美妙。你舔舐着你劳动的酸甜果实，任由它像波浪一样冲刷过你的头顶，尽可能多地吞咽她的雌性精液，你的大脑完全被小穴占据，只能呆呆地强迫你更用力地贴上去，即使现在插进去的不是你的肉棒。你已经陷入了一种粉碎思想的发情期，这种发情期正在稳步地抹去你意识中的所有其他顾虑。");
         outputText("[pg]埃德琳在漫长而湿润的高潮终于结束后，迈着摇晃的腿小跑开，说道：[say:嗯，那次高潮真不错，但我以为你要——呃！]当你把你的" + get_player().cockDescript(_loc1_) + "直接插进她的小穴时，她闷哼了一声");
         if(_loc2_ >= 0)
         {
            outputText("并且你的" + get_player().cockDescript(_loc2_) + "插进了她的屁眼");
         }
         outputText("。她的");
         if(pregnancy.get_isPregnant())
         {
            outputText("因为怀孕而肿胀的乳白色的乳房，");
         }
         else
         {
            outputText("大乳房");
         }
         outputText("滑稽地弹跳着，它们的主人因为你粗暴的插入而失去了知觉，无法试图约束它们");
         if(pregnancy.get_isPregnant())
         {
            outputText("当它们到处滴奶时");
         }
         outputText("。你一手抓住她巨大的马臀，另一手抓住她充满异国情调的尾巴，更用力地推向她，直到她湿滑、欢迎的湿润从四面八方包裹住你");
         if(_loc2_ >= 0)
         {
            outputText("紧致的收缩感正缠绕着你的另一个勃起");
         }
         outputText("。当你感觉到她非人的温暖从四面八方挤压过来时，你野蛮地咆哮着。女孩像马一样的后半身由无数强壮的肌肉组成，它们同时紧紧地收缩，将你完全固定住。");
         outputText("[pg]你可怜巴巴地呜咽着——操她、让她怀孕的欲望压倒了一切，但现在动弹只会带来痛苦。埃德琳轻笑着说：[say:宝贝，你不能这样吓唬女孩子。现在，别太疯狂，我就放开你，好吗？]你靠在她毛茸茸的背上，吸收着她的温暖，向她肌肉发达的动物半身点头。是的，只要能再操她……做什么都行。[say:那好吧。]");
         outputText("[pg]就像变魔术一样，那股压倒性的压力消失了，你可以肆无忌惮地探索她的深处了。当你再次开始抽插她时，你喉咙里发出呻吟，这次你放慢了速度，以免惹怒她，你的双手环抱住她");
         if(pregnancy.get_isPregnant())
         {
            outputText("怀着宝宝的");
         }
         outputText("支撑着中间，[legs]微微悬空，你扭动身体，将你的[cocks]猛地撞入");
         outputText("里面。当你抽插埃德琳那喷涌着、润滑良好的裂缝时，狭小的房间里回荡着吸吮和挤压的声音。马娘兴奋地呻吟着，开始进入状态，你逐渐加快节奏，直到你的[hips]湿漉漉地拍打着她湿透的臀部。她嘶鸣着，回头看了一眼，脸红得让你短暂地怀疑自己是不是在操一个恶魔。");
         outputText("[pg]毫无预兆地，她的小穴突然再次紧缩，虽然没有之前那么用力，但当你锯过她那滴水的下体时，还是让你感到了一丝疼痛。当你犁过她那闪闪发光的肉门时，她那充满情欲的爱液滴落的“啪嗒啪嗒”声越来越大。她变得越来越湿，被淫水浸透了。她的分泌物加上紧致度的增加，压垮了你的耐力，伴随着她高昂的体温，感觉你的阴茎就像一根蜡烛，融化成一滩白色的、高潮的黏液。");
         outputText("[pg]你弓起背，任由那明显的释然感冲刷全身，沸腾的欲望从你的[balls]中喷涌而出，淹没了可怜半人马那滑溜溜的马穴。你用力挺动[hips]射精，每一次射出浓稠的精液，都伴随着将你的" + get_player().cockDescript(_loc1_));
         if(_loc2_ >= 0)
         {
            outputText("和" + get_player().cockDescript(_loc2_));
         }
         outputText("深深埋入");
         if(_loc2_ >= 0)
         {
            outputText("它们的");
         }
         outputText("根部");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。冲刷着你的幸福释然感抹去了你的意识，取而代之的是浓稠、平静的温暖，让你眼皮沉重地耷拉下来，舌头无力地挂在嘴边，同时你将精液泵满那扭动的半人马。你感觉自己就像一口快乐的、深不见底的精液井，还有巨大的、未开发的储备等待释放。显然，你发情的身体已经超负荷运转，没过多久，埃德琳那乌黑的小穴就开始往地上滴落白色的浓浆。");
         if(!pregnancy.get_isPregnant())
         {
            outputText("她空虚的子宫从容地接纳了这些精液，不过当你感觉到她的腰部因为被撑开而鼓起时，你开始有些担心了。埃德琳的腿软了，她的小穴开始收缩得更紧，挤压成一圈圈同心圆，从入口一直延伸到子宫颈，将滚烫的精液直接挤进那充满浓浆的子宫里。你尽可能地在她的屁股上弹跳，爽得根本顾不上别的，直到你的阴茎干涸，精液浸透了埃德琳的整个后半身才停下来。");
            if(_loc2_ >= 0)
            {
               outputText("她的屁股也是类似的状态。里面充满了精液，压力大到随着她的每一次收缩都会喷射出来。");
            }
         }
         else
         {
            outputText("由于她的子宫被你的后代塞满，精液无处可去。即使埃德琳的小穴挤压成一系列同心圆，将你的精液拉向她的子宫颈，也无济于事，精液只能从你周围流出，白白浪费掉。马娘的后半身被这东西浸透了，白花花的精液和麝香般的马精混杂在一起。");
            if(_loc2_ >= 0)
            {
               outputText("她的屁眼也受到了类似的待遇，被填得满满的，以至于半人马娘每一次收缩都会把你的精液挤出来。");
            }
            outputText("即使在这一切之后，她还是把你榨得一干二净，甚至更多。");
         }
         outputText("[pg]你瘫倒在她毛茸茸的背上，埃德琳侧身滚到附近的垫子上，淫荡地呻吟着，眼睛闭上，陷入了疲惫的沉睡。你的眼皮也决定让你加入她的行列，沉沉睡去。然而，她的信息素依然弥漫在空气中，即使在睡梦中，你也感觉到你的[balls]重新充满，你的[hips]开始再次将你的阴茎泵入那滑溜溜的通道。");
         outputText("[pg]“<b>噗叽-噗叽-噗叽-噗叽-</b>”的声音持续了好几个小时，任何有幸把耳朵贴在门上的人都能听到。");
         menu();
         addButton(0,"继续",postEdrynEatOutRut);
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.25),DynStat.Sens(-3));
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null));
      }
      
      public function beAnAssholeToPregdryn() : void
      {
         clearOutput();
         outputText("你直视着惊慌失措的半人马娘的眼睛，解释说她怎么处理自己的身体是她自己的事，你不想和这件事有任何关系。她愣了一瞬间，然后脸因为愤怒而涨得通红。埃德琳尖叫道：[say: 那就给我滚远点！][pg]");
         outputText("酒馆里的每个人都转过头来看热闹，面对一个愤怒、荷尔蒙爆棚的半人马，还有这么多双眼睛盯着你，最好还是赶紧离开。[pg]");
         outputText("<b>(埃德琳将不再和你说话。)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,70,1);
         doNext(get_telAdre().barTelAdre);
      }
      
      public function arousedByPregdryn() : void
      {
         var _g:Edryn;
         clearOutput();
         outputText("你咧开嘴，露出近乎好色的笑容，向这位充满欲望的半人马表示祝贺。她的眼睛因为你的表情而震惊地睁大了一瞬，然后眯成了一个性感的表情。埃德琳戏弄道：[say: 我觉得有人有点怀孕癖，嗯？是想到我的奶子会因为充满乳汁而肿胀，还是想到我会一直摇摇晃晃、欲火焚身，让你兴奋了？]她打了个寒颤，突出的乳头轮廓紧贴着她本就紧绷的束腰外衣。埃德琳的目光垂下，脸上浮现出一丝懊悔的笑容，她承认道：[say: 太棒了，现在我也被勾起性欲了！让我去用一下小马驹的洗手间。然后，也许，我们可以互相“照顾”一下。][pg]");
         _g = this;
         doNext(function():void
         {
            _g.pregdrynOffer();
         });
      }
      
      public function approachHelAtZeBitch() : void
      {
         clearOutput();
         get_game().helScene.spriteChooser();
         get_images().showImage("hel-chat-at-bar");
         menu();
         var _loc1_:int = get_player().cockThatFits(300);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(edrynBar() && get_player().statusEffectv1(StatusEffects.Edryn) >= 4 && get_player().cockArea(_loc1_) < 300 && get_player().cockArea(_loc1_) > 24 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,405) == 0)
         {
            outputText("[say: 嘿，我的爱人，] 赫莉娅带着腼腆的笑容说道，你在她对面坐下。两个狐狸女孩醉醺醺地咯咯笑着，促使赫尔在她们每个人的屁股上顽皮地拍了一下，然后打发她们走。[saystart]嗯，真高兴在这里见到你，");
            if(get_player().get_femininity() < 49)
            {
               outputText("帅哥");
            }
            else
            {
               outputText("美女");
            }
            outputText("。来镇上是为了生意……还是为了找乐子？[sayend]她眨了眨眼，发出满足的呼噜声。[pg]");
            outputText("你花了几分钟和火蜥蜴聊天，避开了她的问题，问她在特尔阿德雷做什么。她轻笑了一声，说道：[say: 几天前才找到这个地方。我怎么会不知道这里有一整个镇子的人？总之，我到了这里，然后一个火辣的半人马娘开始拿着这块宝石在我身上挥舞，然后——][pg]");
            outputText("[say: 半人马娘？你是说埃德琳吗？][pg]");
            outputText("[say: 对！就是她！哦天哪，我愿意花一大笔宝石把我的尾巴塞进她的侧腹！]她笑着，把尾巴伸到桌子底下挠你的大腿。你轻轻拍了一下她那灵活的肢体，直到它停在你的大腿上，依偎在你的[hips]周围，而赫尔则若无其事地喝完了剩下的麦酒。[pg]");
            outputText("和火蜥蜴坐在一起，你注意到在拥挤的酒吧对面，埃德琳正坐在她的桌子旁，喝着一小杯酒。半人马娘捕捉到了你的目光，给了你一个性感的媚眼。你脑海中浮现出一个主意：你可以轻松地把这两个女孩介绍给对方。你要这么做吗？");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,405,1);
            addButton(1,"埃德琳3P",helEdrynThreeSomeStartYerEngines);
         }
         else
         {
            outputText("[say: 嘿，我的爱人，]当你坐在她对面时，赫莉娅带着羞涩的笑容说道。两个狐狸女孩醉醺醺地咯咯笑着，赫尔在她们的屁股上各拍了一下，让她们离开，然后转过身来坐在你的腿上。[saystart]哎呀，真高兴在这里见到你，");
            if(get_player().get_femininity() < 49)
            {
               outputText("帅哥");
            }
            else
            {
               outputText("美女");
            }
            outputText("。来镇上是为了生意……还是为了找乐子？[sayend]她眨了眨眼，发出满足的呼噜声。[pg]");
            outputText("你花了几分钟和火蜥蜴聊天，和你喝醉的爱人开玩笑、大笑。");
            if(edrynBar() && get_player().cockArea(_loc1_) < 300 && get_player().cockArea(_loc1_) > 24 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,405) == 1)
            {
               outputText("不过，最终赫尔朝坐在离你不远处的埃德琳点了点头，问你是否愿意来点三人行的时光。你愿意吗？[pg]");
               addButton(1,"埃德琳3P",helEdrynThreeSomeStartYerEngines);
            }
            else
            {
               outputText("不过，最终赫尔给了你一个性感的眼神，问你是否愿意参加一点集体活动。你愿意吗？[pg]");
               if(get_player().statusEffectv1(StatusEffects.Edryn) < 4)
               {
                  addButtonDisabled(1,"埃德琳3P","这个场景需要你更好地了解埃德琳。");
               }
               else if(get_player().cockArea(_loc1_) > 300)
               {
                  addButtonDisabled(1,"埃德琳3P","这个场景需要你有一根更小的阴茎。");
               }
               else if(get_player().cockArea(_loc1_) < 24)
               {
                  addButtonDisabled(1,"埃德琳3P","这个场景需要你有一根更大的阴茎。");
               }
               else
               {
                  addButtonDisabled(1,"埃德琳3P","这个场景需要埃德琳在附近。");
               }
            }
         }
         addButton(0,"狐狸女孩",get_game().helScene.heliaPlusFoxyFluffs);
         addButton(14,"离开",leaveHelInZeBitch);
      }
   }
}

