package classes.scenes.places.telAdre
{
   import classes.Appearance;
   import classes.BreastStore;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import classes.scenes.places.telAdre._Rubi.SaveContent;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Rubi extends TelAdreAbstractContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function Rubi()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "rubi";
         saveContent = new SaveContent(null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function yesBimboNTR() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你思索了片刻，然后慢慢点了点头。让她发泄一下又有什么坏处呢？你知道她总会回到你身边。你同意了她的请求，她顿时尖叫一声，紧紧抱住你，把粉色软垫甩到一边。");
         outputText("[pg][say: 哦，宝贝，我太爱你了！]她咯咯笑个不停，在你脸上落下一连串狂热的吻。[say: 他们谁都比不上你，但他们会有帮助的。]");
         outputText("[pg]事情就这么定了，鲁比将可以自由地和任何人上床，就像你也同样自由一样。既然已经说清楚，你决定让她先穿好衣服。你走出房子，返回营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,621,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function whyTheFuckIsRubiWearingAnInquisitorsCorset() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿上审判官束身衣的样子。[say: 哎呀，我真的很喜欢那一套呢。又漂亮又有蕾丝！]");
         outputText("[pg]鲁比先穿上一件带红色蕾丝点缀的黑色胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，尽管[rubi ey]显然并不需要穿这个");
         }
         outputText("，[rubi ey]熟练地在[rubi em]背后扣好。接着，[rubi ey]拿起一条黑色吊袜带，顺着[rubi eir]纤细的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("光洁无毛的");
         }
         else
         {
            outputText("覆着毛发的");
         }
         outputText("双腿往上套，直到它稳稳贴在[rubi eir]腰间。随后，[rubi ey]又很快穿上一双配套的渔网袜，由吊袜带固定住。袜子是黑色的，但背面镶着金色的束身衣纹样，一直延伸到一对软垂的深红色蝴蝶结。接下来是一条带金色点缀的红色内裤，[rubi ey]把它顺着[rubi eir]双腿往上拉，让它紧紧贴住[rubi eir]丰满的屁股。");
         outputText("[pg]接下来才是那件真正的束身衣，一件红金相间的艺术品，上面缝着繁复的金色符文。鲁比松开背后的系带，钻了进去，把它沿着[rubi eir]身体往上拉。[rubi Ey]试着收紧它，却费了点劲；于是你上前接过绳带，一路将它收紧，让鲁比的腰围一下子小了好几圈。最后，你给它系上一个精致的小蝴蝶结。之后，鲁比穿上一双黑色高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟被去掉了，好给[rubi eir]自己的恶魔足跟腾出空间");
         }
         outputText("。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = barDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function waitAndGetNTRedLikeTheBoyBitchYouAre() : void
      {
         get_images().showImage("rubi-get-ntr-ed");
         clearOutput();
         rubiSprite();
         outputText("你决定先等等，看事情会怎么发展。那男人彻底脱光，而他并非完全的人类这一点，你一点也不意外。他头上竖着一对狼似的耳朵，腰后伸出一条蓬松的灰白色尾巴。狼人张口说了些什么，但你在外面听不见。不管他说了什么，显然是引起了鲁比的注意。");
         outputText("[pg]那个金发傻妞从沙发上的位置挪开，跪到背对着你的狼人面前。从你能看到的情况判断，你确信她正在给他口交。欲火和一丝嫉妒在你心里涌起，你不由自主地绕到房子侧面，想找个更好的观察位置。");
         outputText("[pg]你从另一扇窗户往里窥视，看见鲁比闪亮的红唇裹住了狼人的犬形肉棒。她以感官撩人的缓慢速度上下吞吐，舌头每隔几秒就探出来一下，几乎像是在故意挑逗你。她的脑袋摆动得越来越快，你注意到她的手指已经滑向私处，可惜从这个角度看去，被她的双腿挡住了。");
         outputText("[pg]就在你考虑要不要换到另一扇窗户时，你看见狼人开口说了话。鲁比松开紧含着他肉棒的嘴唇，露出笑容。你看见她咯咯地笑着，四肢着地爬上沙发，把自己呈现在她的犬类同伴面前，也无意间呈现在你面前。你能看到她的小穴已经被淫液打湿，尾巴像猫一样催眠似的左右摆动。说那男人露出了狼一般的笑容都算低估了他，因为他的嘴角几乎咧到了耳根。他跪着爬上沙发，来到你那傻妞情人身后。可恶，你的视线又被挡住了！");
         outputText("[pg]你双膝发颤地回到前窗，正好看见狼人那根湿亮的红色犬形肉棒滑进鲁比迫不及待的小穴里。她张开嘴，而你完全可以想象那低沉的呻吟声从她喉中滚出，因为你已经好几次听她发出过那种声音了。这个男人竟能让她有同样的反应，你心里泛起一阵小小的嫉妒。随着鲁比的狼人情人开始征伐这片新领地，更多的[say:哦哦]和[say:啊啊]从她嘴里涌出，在你的想象中回荡。你有点为自己感到羞耻，但不得不承认，这让你兴奋起来了。");
         if(!get_player().isTaur())
         {
            outputText("[pg]随着这场性爱继续，你发现自己的手探进[armor]里，抚弄着");
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]");
            }
            else if(get_player().hasCock())
            {
               outputText("[eachCock]");
            }
            outputText("。");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("他们俩就这样持续了五分钟、十分钟、十五分钟。你发现每一个体位都比上一个更有意思。");
         if(get_silly())
         {
            outputText("他们甚至还用了游戏里根本没有的体位！");
         }
         outputText("半小时后，鲁比和狼人筋疲力尽地坐在沙发上，他的精液正从她每个孔穴里流出来。");
         outputText("[pg]那个男人对她咧嘴一笑，但出乎你意料的是，她只是礼貌地微微一笑，说了几句话。男人看起来有些吃惊，但几乎立刻就开始重新穿衣服。趁他穿衣服的时候，你移动到房子侧面的窗户旁，以免被这个落荒而逃的种马发现。一分钟后，你看到那个狼人走出房子，沿着街道走去，嘴里还嘟囔着类似[say:欲求不满的婊子]之类的话。");
         outputText("[pg]好吧，现在正是和她摊牌的好时机……你站起身，整理好衣服，走进屋里；此时赤裸的鲁比正用一条湿毛巾擦拭自己的身体。");
         outputText("[pg]她一看见你，立刻眉开眼笑，[say: 哦，宝贝！我都不知道你会过来呢！]然后她似乎才意识到自己正一丝不挂，身上大半都沾着精液，而且你是在她前一个情人刚离开几秒后就进来的。[say: 哦。对哦。]");
         doNext(NTRbimboBitchResolution);
      }
      
      public function teaseRubi() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("rubi-tease");
         clearOutput();
         rubiSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("你心里另有一番截然不同的打算，于是命令鲁比脱光。[rubi eir]脸上带着好奇的神色，慢慢照做。[rubi ey]从[rubi eir]柔软");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
            {
               outputText("苍白的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
            {
               outputText("覆满毛皮的");
            }
            else
            {
               outputText("红色的");
            }
            outputText("肌肤上剥下的每一件衣物，似乎都耗费了漫长的时间，直到最后，[rubi ey]只穿着内裤站在你面前。");
            outputText("[rubi Eir][rubi cock]似乎把内裤撑得紧绷，渴望着被释放出来。你站起身，走到鲁比身后，贴在[rubi eir]耳边暧昧地低语，一边说话一边轻咬、亲吻[rubi eir]的脖颈。你告诉[rubi em]，除非你另有指示，否则[rubi ey]在任何情况下都不准射出来。如果[rubi ey]射了，就会受到严厉惩罚。鲁比明显咽了口唾沫，点头表示[rubi eir]同意。");
            if(get_player().get_tallness() > 60)
            {
               outputText("[pg]你微微一笑，双手搭上鲁比的肩膀，指尖沿着[rubi eir]柔嫩的胸口和小腹勾画出一道道无形的线。一只手随意捏住一颗乳头，另一只手则向下滑去，握住[rubi eir]内裤里逐渐鼓起的隆起。");
            }
            else
            {
               outputText("[pg]你微微一笑，双臂环住鲁比的腰腹，指尖沿着[rubi eir]柔嫩的胸口和小腹勾画出一道道无形的线。一只手随意向上探去，捏住一颗乳头，另一只手则向下滑去，握住[rubi eir]内裤里逐渐鼓起的隆起。");
            }
            outputText("[pg][say:啊，别碰那里，]鲁比喘息道。你的手紧紧握住[rubi em]，让[rubi em]发出一声小小的惊叫。");
            outputText("[pg]你在你的小恶魔玩具身后跪下，让[rubi em]弯下腰，双手撑在沙发上。");
            outputText("[rubi Ey]红着脸回头看你，神情既好奇又带着欲望。[rubi Ey]咽了口唾沫，抬起[rubi eir]尾巴，让你可以毫无阻碍地碰到[rubi eir]被内裤包裹的臀部。");
            outputText("[pg]你牢牢抓住[rubi eir]的内裤，把它一点点往下褪，直到落到[rubi eir]脚踝处。[rubi Ey]从内裤里迈出来，而就在这个念头闪过你脑海的瞬间，你立刻把它塞进鲁比嘴里。[rubi Ey]含糊地发出抗议，却没有把它吐出来。");
            outputText("[pg]鲁比光裸的屁股就摆在你面前，你几乎用尽全部意志力，才没直接把脸埋进去。但你还是稳住了自己，记起原本的计划。于是你小心地用手指圈住[rubi eir]逐渐硬起的肉棒。你紧紧握住它，感受着[rubi eir]的脉动从中传来。随后，你开始用缓慢而稳定的动作套弄起来。");
            outputText("[pg][say:嗯呃，]鲁比闷哼一声，抓紧了沙发垫。你特意提醒[rubi em]，[rubi ey]在任何情况下都不准射出来。[rubi Ey]点点头，说道，[say:是、是的，" + get_player().mf("sir","miss") + "。]");
            outputText("[pg]你稍稍加快套弄的节奏，同时俯身凑近，把鼻尖抵在鲁比的尾巴旁，嘴唇贴上[rubi eir]紧致的屁眼。你伸出舌头，绕着[rubi eir]的穴口一圈圈舔舐。你退开些，看着唾液让[rubi eir]微微皱缩的穴口像一颗未经雕琢的宝石般闪亮，不禁为之着迷。");
            outputText("[pg]你脸上浮起一抹狡黠的笑，伸出两根手指抵在鲁比已经湿润的入口处，然后滑了进去。[rubi Eir]脸上短暂掠过一丝惊讶，但很快就换成了满足的笑容。你将手指向下弯曲，寻找[rubi eir]的前列腺。[rubi Ey]猛地一颤，手中的阴茎也变得更硬了，你知道自己找到了。你的手指在那处轻轻打着圈，每转一圈，鲁比都随之扭动起来。");
            outputText("[pg][say:啊，" + get_player().mf("先生","小姐") + "，我快受不了了，] [rubi ey]低声说道，那声音介于耳语和呻吟之间。");
            outputText("[pg]你捏了捏[rubi eir]的鸡巴，提醒[rubi em]，如果[rubi ey]射了，就等着受罚吧。[rubi Ey]咽了口唾沫，点点头，闭上[rubi eir]的眼睛。[rubi Eir]全身似乎都绷紧了。[rubi Ey]说得没错，[rubi ey]真的快撑不住了。你顺势抽出手指，也松开了鲁比的阴茎。[rubi Ey]叹了口气，几乎瘫倒在沙发上。");
            outputText("[pg]你舔干净手指上[rubi eir]的前液，然后吻住[rubi em]，让[rubi em]尝尝[rubi eir]自己的味道。接着你告诉[rubi em]，在你允许[rubi em]释放之前，[rubi ey]不准以任何方式自慰。");
            outputText("[pg]这番狡黠的玩弄告一段落后，你站起身，整理好自己的仪表，转身出门。你最后看到的鲁比，是[rubi em]坐在沙发上，脸上带着可怜巴巴的神情，眼巴巴地盯着[rubi eir]那根怒挺的勃起。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,608,FlagDict_Impl_.arrayReadInt(_loc1_,608) + 1);
            }
         }
         else
         {
            outputText("你另有打算，于是命令鲁比脱光衣服。[rubi Ey]脸上带着好奇的神情，兴致勃勃地照做了。[rubi Ey]从[rubi eir]柔软的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
            {
               outputText("苍白的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1)
            {
               outputText("绯红的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
            {
               outputText("覆着毛发的");
            }
            else
            {
               outputText("带有条纹的");
            }
            outputText("肌肤上剥下的每一件衣物，仿佛都耗费了漫长的时间。事实上，[rubi ey]似乎很享受脱衣服的过程，不时轻轻转个圈，把[rubi eir]的衣服朝你扔来，直到[rubi ey]一丝不挂地站在你面前。");
            outputText("[pg][rubi Eir]的小穴因情欲而湿亮发光，这并不让你意外。如今的[rubi Ey]似乎一天到晚都在发情。你站起身，走到鲁比身后，贴着[rubi eir]的耳朵暧昧地低语，话语之间还轻咬、亲吻着[rubi em]。你告诉[rubi em]，在你另行说明之前，[rubi ey]无论如何都不准高潮。要是[rubi ey]敢射，后果会很严重。[rubi Ey]咯咯笑了笑，但还是点头表示同意。");
            if(get_player().get_tallness() > 60)
            {
               outputText("[pg]你微微一笑，将双手搭在鲁比的肩上，让指尖沿着[rubi eir]的[rubi breasts]和腹部描画出看不见的线条。一只手随意地捏住一颗乳头，另一只手则向下滑去，探入她柔软娇嫩的肉缝之中。");
            }
            else
            {
               outputText("[pg]你微微一笑，从身后环住鲁比的腰腹，让指尖沿着[rubi eir]的[rubi breasts]和腹部描画出看不见的线条。一只手随意向上探去，捏住一颗乳头，另一只手则向下滑去，探入她柔软娇嫩的肉缝之中。");
            }
            outputText("[say:噢，没错，就是那里，]鲁比喘息道。你的手紧紧捏住[rubi eir]的阴蒂，让[rubi em]同时发出一声惊叫和愉悦的轻哼。");
            outputText("[pg]你跪在你的小" + rubiMF("恶魔","女恶魔") + "身后，让[rubi em]弯下腰，双手撑在沙发上。[rubi Ey]回头看着你，头发凌乱得像已经被干过好几回，那充满欲望的眼神让你发现自己几乎也和[rubi ey]一样兴奋起来。[rubi Ey]抬起[rubi eir]的尾巴，让你能毫无遮挡地接触[rubi eir]的臀部和小穴，然后还冲着你的脸晃了晃，像是在逗弄一条宠物狗。你抬起手，啪的一声落在[rubi eir]苍白的屁股上，让[rubi em]明白现在谁才是宠物，随后朝[rubi em]露出一抹坏笑。");
            outputText("[pg]鲁比光裸的屁股就摆在你面前，你几乎要用尽全部意志力，才没直接把脸埋进那诱人的湿润小穴里。但你还是稳住了，谨记着自己的计划。于是，你把拇指插进[rubi eir]饥渴的小穴里，食指和中指则分别贴在[rubi eir]阴蒂两侧，用缓慢而稳定的动作摩擦着它。");
            outputText("[pg][say:嗯嗯，]鲁比呻吟着，抓紧了沙发垫。你提醒[rubi em]无论如何都不能高潮，可话还没说完，[rubi eir]的小穴就紧紧夹住了你的拇指，一股淫液喷涌而出，溅满了你的手和脸。好吧，这计划算是泡汤了。你估计，想控制这么敏感的女孩的高潮，基本上是不可能的。不过你还是能继续挑逗[rubi em]。");
            outputText("[pg]你稍稍加快手指的动作，同时俯身凑近，把鼻尖贴在鲁比的尾洞旁，嘴唇抵上[rubi eir]的小穴。你伸出舌头，绕着自己的手指，肆意扫过[rubi eir]的阴唇。你退开一些，舔了舔嘴唇，忍不住回味那股味道。");
            outputText("[pg]你脸上浮起一抹狡黠的笑，把空着的那只手拢成锥形，压进鲁比湿透的小穴里。[rubi Eir]脸上掠过一阵恍惚的欢愉，你几乎可以肯定，[rubi eir]的眼睛都翻了上去。你将手指并拢弯起，握成拳头，在[rubi em]体内一下一下地抽送。与此同时，你抽出另一只手的拇指，把它用在鲁比的敏感小豆上，捻弄、摩擦、毫不留情地折磨着它。");
            outputText("[pg][say:哦，天哪，]鲁比用介于耳语和呻吟之间的声音说道，[saystart]我要……我要");
            if(rubiBimbo())
            {
               outputText("那个，");
            }
            outputText("高潮了！[sayend]");
            outputText("[pg]你把拳头尽可能深地推进去，鲁比的双腿颤抖着，几乎要支撑不住[rubi em]。一声震耳欲聋的尖叫从[rubi eir]唇间爆发出来，另一股淫液喷涌而出，再次浇了你一身。鲁比向前瘫倒在沙发上，[rubi eir]阴道的肌肉几乎要把你也一并带倒。但你还是及时抽出了拳头，没有跟着[rubi em]一起摔倒。");
            outputText("[pg]你慢慢舔净自己的手指，然后吻住[rubi em]，让[rubi em]尝到自己的淫液。[rubi Ey]咯咯笑着，也把你的脸舔得干干净净，直到一滴都不剩。");
            outputText("[pg]这场恶趣味的玩乐结束后，你站起身，整理好自己的仪容，转身出门。你最后看到的鲁比，是[rubi em]四肢大敞地坐在沙发上，[rubi eir]脸上挂着无比满足的神情。");
         }
         saveContent.hadSex = true;
         dynStats(DynStat.Lust(5 + get_player().lib / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function teaseButtjobs() : void
      {
         get_images().showImage("rubi-tease-buttjob");
         clearOutput();
         rubiSprite();
         outputText("你暗自咧嘴一笑，决定再多逗弄这个小恶魔" + rubiMF("男孩","女孩") + "一会儿。你把拇指更深地探进[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("屁股");
         }
         else
         {
            outputText("小穴");
         }
         outputText("，找到了[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("前列腺");
         }
         else
         {
            outputText("G点");
         }
         outputText("，并围着它打圈揉弄，让鲁比那沾得一片狼藉的嘴唇里拖出一声长长的呻吟。你每一次顶进鲁比柔软的臀肉，手指就围着[rubi eir]最敏感的地方再画上一圈，直到你感觉到[rubi eir]的身体开始绷紧。");
         outputText("[pg]你对恋人的身体再熟悉不过，自然看得出[rubi ey]快要高潮了。你等着那个最完美的瞬间——[rubi eir]身体绷到最紧，背脊弓起，脚趾蜷缩，嘴巴张成漂亮的O形，[rubi eir]那双适合含吮肉棒的嘴唇微微颤抖，正悬在高潮的边缘。就在这一刻，你抽出拇指，拍了[rubi eir]的屁股一巴掌，比之前稍微重了一点。[rubi Eir]的身体绷得更紧，[rubi ey]咬住[rubi eir]的嘴唇，可那份[rubi ey]渴求的释放与欢愉却没有到来。你训斥着眼前这个淫荡的小人偶，告诉[rubi em]，只有在你允许的时候，[rubi ey]才准射出来。鲁比轻轻呜咽一声，带着既委屈又欲望满溢的眼神回头看你，但[rubi ey]还是懂事地点了点头。");
         outputText("[pg]鲁比顺从的模样点燃了你的欲望，你感觉自己的高潮正在逼近。不管你怎么挑逗[rubi em]，[rubi ey]都一动不动，只用一阵颤抖和一声渴求的叹息，泄露出那毫无疑问正流遍[rubi eir]全身的快感。你用力抓住一边臀肉，尽可能向上猛顶，体内的堤坝也在这一刻骤然崩塌。你的[balls]愉悦地翻涌，你的[cock biggest]猛地绷紧，你拖长声音深深叹息，肉棒随之爆发，精液向上喷射而出，立刻溅在鲁比的尾巴和背上，又顺着[rubi eir]丰盈的臀瓣往下滴落。");
         outputText("[pg]你立刻把鲁比转过身来，而[rubi ey]也明白了你的意思，用那已经沾满肉棒痕迹的嘴唇含住[cockHead biggest]。你的肉棒剧烈抽搐，一波又一波甜腻的精液喷进鲁比等候已久的口中。[rubi Ey]把它们全都咽了下去");
         if(get_player().cumQ() <= 50)
         {
            outputText("一口气全吞了下去，脸上露出一丝小小的得意");
         }
         else if(get_player().cumQ() <= 150)
         {
            outputText("艰难地一口咽下，喉咙都被撑得发紧；等[rubi ey]终于不再喘气时，脸上浮现出一抹小小的得意笑容");
         }
         else
         {
            outputText("来多少吞多少，一口接一口的精液几乎像是被直接灌进[rubi eir]胃里。量实在太多，[rubi ey]吞到一半就忍不住笑了起来，为自己能接下这么大一发而自豪");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("。灌下这么多之后，你确信鲁比现在确实鼓起了一点小肚子，简直像是[rubi ey]已经怀了好几个月");
         }
         outputText("。");
         outputText("[pg]最后，又一股精液喷出，落在你的爱人脸上。你侧身滑倒在舒适的沙发上，彻底精疲力尽。鲁比却似乎还精力十足，接下来的几分钟里，[rubi ey]尽职尽责地舔遍你的[cock biggest]，把上面的体液清理干净，直到它在你腿间显得光亮又干净。");
         outputText("[pg]你笑着亲了亲这个恶魔" + rubiMF("男孩","女孩") + "，说自己能和[rubi em]在一起真是太幸运了。");
         outputText("[pg][say: 不，宝贝，能遇见你才是我的幸运，][rubi ey]说道，一边把[rubi eir]赤裸的身体偎进你怀里。你们两个就这样在性爱后的慵懒睡意中慢慢睡去。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,608,FlagDict_Impl_.arrayReadInt(_loc1_,608) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,1);
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToRubiInHouse() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你现在只想和鲁比聊聊。你想聊些什么？");
         menu();
         addButton(0,"身份认同",rubiIdentity);
         setExitButton("返回",rubisFuckingHouseYouPervert);
      }
      
      public function specialRelationship20scene() : void
      {
         clearOutput();
         rubiSprite();
         outputText("当你离开面包店时，听见身后传来高跟鞋的嗒嗒声。回头一看，你看见鲁比正朝你赶来，喊道：[say:嘿，等一下！]你照做了，停下来等她追上。她在你面前停下，双手撑在纤细的膝盖上喘着气。");
         outputText("[pg][say:呼，抱歉，刚才你走的时候我没赶上。你走得太快了，]她深吸一口气。[say:听着，我、我喜欢你。]她的脸一下子涨得通红。[say:但我有件事必须告诉你。关于我的事。]");
         outputText("[pg]你问是不是因为她有一部分恶魔血统，她摇了摇头。[say:不，不是那个。]你鼓励她继续说下去。");
         outputText("[pg]她看起来犹豫了一会儿，红宝石般鲜红的嘴唇张了又合，却始终没有说话。你注意到她一只手紧紧攥着另一只手，攥得指节都发白，双腿也像暴风雨中的树木一样颤抖。你上前一步，坚定地把双手放在她肩上，直视着她的眼睛，说她可以把任何事都告诉你。");
         outputText("[pg]鲁比点点头，似乎稍稍松了口气，继续说道：[say:我、我是个……我从小就喜欢漂亮裙子、高跟鞋，还有那些东西。所以当我来到特尔阿德雷时，我把它当成了重新塑造自己的机会。但要展现真正的自己一直都……很难。所以我想说的是：我是男孩子。]她……[i:他]那张本就涨红的脸，似乎变成了更深的猩红色。");
         outputText("[pg]你有些惊讶，但这倒也说得通。她……他胸部确实很平，而且你也经常怀疑自己是不是偶尔在她的裙子下面看见过某种鼓起的轮廓……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,606,1);
         menu();
         addButton(0,"接受",acceptRubi).hint("接受鲁比本来的样子。");
         addButton(1,"拒绝",rejectRubi).hint("你拒绝了他。");
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rubisFuckingHouseYouPervert() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:* = null as Player;
         get_images().showImage("rubi-at-house");
         clearOutput();
         rubiSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,622) == 0)
         {
            outputText("你没有点任何东西，而是在鲁比经过你桌边时叫住他，把[rubi em]拉近，在[rubi eir]耳边低声问[rubi ey]愿不愿意和你一起回[rubi eir]家。");
            outputText("[pg][rubi Ey]微微脸红，[rubi eir]尾巴在[rubi em]身后兴奋地摇来摇去。[say: 等、][rubi ey]飞快地环顾四周，[say: 等我找个人替我顶一下班。][rubi Ey]立刻走进后面的房间，几分钟后带着一位穿着女侍制服的年轻犬族女孩回来了。鲁比给[rubi eir]的替班指了几张桌子，又交代了几句，然后回到你身边。");
            outputText("[pg][rubi Ey]紧紧挽住你的手臂，说道：[say: 我家不远，我们走吧。]你站起身，[rubi ey]挽着你的胳膊，带你穿过特尔阿德雷的街道。[rubi Ey]领着你走过几个街区，来到一片看起来相当不错的街区，走向一排挨得很近的房子。你们两人穿过一座精心打理的花园，走进前门。");
            outputText("[pg]鲁比松开了挽着你手臂的[rubi eir]手，说道：[say: 就当自己家一样！]随后[rubi ey]匆匆跑进另一个房间。你趁这个机会四处打量。屋里装饰得很有品味，到处都有可供坐卧的靠垫和枕头，颜色各不相同。壁炉上方的炉架上摆着一幅有些焦痕的画像，画中是两个看起来很幸福的人类，以及一个年纪很小的男孩。你猜那应该就是恶魔袭击之前的鲁比和[rubi eir]家人。");
            outputText("[pg]你没等鲁比多久，[rubi ey]就端着两杯酒回来了。[rubi Ey]递给你一杯，你喝了一口，优雅的风味和怡人的香气让你微微有些惊讶。你们两人喝着酒，聊了一会儿，随后鲁比看着你的眼睛说道：[say: 所以……你现在让我单独陪着你了。你想做什么呢？]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,622,FlagDict_Impl_.arrayReadInt(_loc1_,622) + 1);
         }
         else if(rubiBimbo() && (get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties)) && Utils.rand(7) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,625,1);
            outputText("你没有点任何东西，而是在鲁比经过你桌边时叫住她，把她拉近，提议一起离开。");
            outputText("[pg]鲁比咧嘴露出一个柴郡猫般的笑容，点了点头。[say: 当然可以啦！让我去叫迪娅替我看一下桌子，好吗？]她立刻去了后面的房间，几分钟后带着那位年轻的犬族女侍一起回来。鲁比给她指了几张桌子，又跟接替她的人交代了几句，然后回到你身边。");
            outputText("[pg][say: 我们赶紧溜吧，]她说道，接着你们朝她家走去。然而，你们没走多远。在前往鲁比所住街区的路上，你们路过一家小裁缝店，橱窗里挂着一套可爱得不得了的小衣服。你们一边偷偷笑着，一边完全忘了原本要做什么，走进了店里。");
            outputText("[pg]漂亮的布料铺满了每个台面，粉色和各种柔和的浅色，点缀着荷叶边与蕾丝。可爱的小上衣和配套的下装挂在架子上，鲁比立刻冲向其中一个区域，兴高采烈地在衣架间翻找起来。你忍不住咯咯笑着加入她，一套接一套地挑看，还拿来和自己或你这个迷迷糊糊的同伴比划。");
            outputText("[pg]试穿了大约半个小时的各式服装后，鲁比挑中了一套漂亮的小衣服并买了下来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,623) == 0)
            {
               outputText("[pg]与此同时，并没有什么东西真正吸引你的目光……直到你看见一条粉色百褶裙，搭配粉白相间的挂脖上衣。你开心得尖叫一声，把它挑了出来。尺寸正合适！");
               outputText("[pg][say: 哦哦，那件看起来太性感了，宝贝。让我给你买吧。送给你这个性感小野兽，算我请客，]鲁比兴奋地喊道，然后把钱递给裁缝。离开店铺时，你连声感谢你的爱人，随后回到了营地。");
               outputText("[pg]直到回去之后，你才想起来自己本来是打算趁在城里时操鲁比的！你咯咯笑了起来，一边骂自己真是迷糊。唉，反正随时都能再进城嘛，购物这种事总是不嫌多的！");
               get_inventory().takeItem(get_armors().BIMBOSK,get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("[pg]与此同时，并没有什么东西真正吸引你的目光，你最后带着有些意犹未尽的感觉离开了店铺。你的爱人飞快地在你脸颊上亲了一下，感谢你陪她度过了一段美好时光，然后你们再次各自分别。");
            outputText("[pg]直到回到营地之后，你才想起来自己本来是打算趁在城里时操鲁比的！你咯咯笑了起来，一边骂自己真是迷糊。唉，反正随时都能再进城嘛，购物这种事总是不嫌多的！");
         }
         else if(rubiBimbo())
         {
            outputText("你没有点任何东西，而是在鲁比经过你桌边时叫住她，把她拉近，提议一起离开。");
            outputText("[pg]鲁比咧嘴露出一个柴郡猫般的笑容，点了点头。[say: 当然可以啦！让我去叫迪娅替我看一下桌子，好吗？]她立刻去了后面的房间，几分钟后带着那位年轻的犬族女侍一起回来。鲁比给她指了几张桌子，又跟接替她的人交代了几句，然后回到你身边。");
            outputText("[pg][say: 咱们赶紧闪人吧，]她说道，接着你们便朝她家走去。你们两人在她刚重新装饰过的家里安顿下来。她似乎把原本色彩鲜艳的枕头和窗帘都换成了各种深浅的粉色，而她的全家福也有几处被重新涂改过，现在画上了一对幸福的人类夫妻和他们的女儿，三人全都打扮成粉色。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,621) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,624) > 0)
            {
               outputText("[pg]你的小淫娃一路小跑到一个镶着宝石的小锁箱前打开它，从里面取出一袋钱。[say: 这是我那点副业分给你的那份，]她咯咯笑道。");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,624));
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,624,0);
               statScreenRefresh();
            }
            outputText("[pg][say: 所以宝贝，你想对我做什么？]她在你耳边低声说道。");
         }
         else
         {
            outputText("你没有点任何东西，而是在鲁比经过你桌边时叫住[rubi em]，把[rubi em]拉近，提议一起离开。");
            outputText("[pg]小恶魔" + rubiMF("男孩","女孩") + "脸上一红，[rubi eir]尾巴在身后兴奋地甩动着。[say: 又来？][rubi ey]一边问，一边偷偷环顾四周，[say: 我去叫迪娅替我顶一下班。][rubi Ey]立刻去了后面的房间，几分钟后带着那位年轻的犬族女侍一起回来。鲁比给她指了几张桌子，又跟[rubi eir]的替班交代了几句，然后回到你身边。");
            outputText("[pg][say: 走吧，][rubi ey]低声说道，接着你们便朝[rubi eir]家走去。你们很快就穿过特尔阿德雷的街道，来到鲁比精心照料的花园里。");
            outputText("[pg]还没等你反应过来，你就又一次站在了鲁比布置得颇有品味的客厅里。房间里散落着许多可供坐卧的枕头和软垫，一张宽大的绒面沙发摆在壁炉对面。壁炉上方的台架上放着一幅略有焦痕的肖像画，画中是一对看起来很幸福的人类夫妻和一个小男孩。你猜那应该是恶魔袭击[rubi eir]村庄之前，鲁比一家人的画像。");
            outputText("[pg]鲁比在沙发上伸展开身体，说道：[say: 那么宝贝，既然你都把我带到这儿了，你想做什么？]");
         }
         menu();
         addButton(0,"性爱",rubiSexMenu);
         addButton(1,"衣柜",goInRubisClosetSoThatYouCanComeOutOfTheCloset);
         addButton(2,"交谈",talkToRubiInHouse);
         if(rubiAffection() >= 50 && !rubiBimbo())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,832) == 0)
            {
               outputText("[pg]鲁比朝面包店带来的几瓶东西和一个盒子示意了一下，然后说道：[say: 你看起来绷得太紧了，宝贝。我知道你在外面不容易，所以，呃，我、我想着如果你愿意的话，今天也许可以让我好好宠宠你。]");
            }
            else
            {
               outputText("[pg]鲁比朝角落里的那些瓶子和盒子点了点头，又狡黠地冲你眨了眨眼。[say: 还想再来次按摩吗？]");
            }
            addButton(4,"按摩",chocoRubiMassage);
         }
         if(get_player().isNaga() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,610) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < get_player().biggestCockLength() && get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) == 0 && get_player().isCorruptEnough(85) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) <= 2)
         {
            outputText("[pg]<b>你可以用蛇一般的扭动催眠鲁比，把[rubi em]变成一个更加顺从、急不可耐的荡妇。这样做很可能无法逆转。</b>");
            addButton(5,"催眠",hypnoBimboficationForRubiSloots);
         }
         addButton(14,"离开",rubiLeave).hint("和鲁比道别，至少现在先这样。");
      }
      
      public function rubiSprite() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,988) > 0)
         {
            spriteSelect(SpriteDb.get_s_rubi_horns());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_rubi_hornless());
         }
      }
      
      public function rubiSexMenu() : void
      {
         menu();
         addButtonDisabled(0,"做爱","此场景需要你拥有阴茎，或足够大的阴蒂，并且性兴奋度足够高。");
         addButtonDisabled(1,"假阳具做爱","此场景需要你拥有豪华假阳具，并且性兴奋度足够高。");
         addButtonDisabled(3,"释放","此场景需要鲁比憋得够久。");
         addButtonDisabled(4,"调教","此场景需要你拥有过于巨大的阴茎，并且鲁比的好感度足够高。");
         addButtonDisabled(5,"被干","此场景需要鲁比拥有尺寸像样的阴茎，并且好感度足够高。");
         addButtonDisabled(6,"夹臀摩擦","此场景需要你拥有阴茎。");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock() || get_player().hasVagina() && get_player().getClitLength() >= 4)
            {
               addButton(0,"做爱",fuckRubi);
            }
            if(get_player().hasKeyItem("Deluxe Dildo"))
            {
               addButton(1,"假阳具做爱",dildoFuckRubi);
            }
         }
         addButton(2,"挑逗",teaseRubi);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0 && !rubiBimbo() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            addButton(3,"释放",releaseRubi);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 75 && rubiCapacity() < get_player().biggestCockArea() && get_player().hasCock())
         {
            addButton(4,"调教",anallyTrainYourBitchBoySlutHowToBeAnalForDCL);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 75 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 5)
         {
            addButton(5,"被干",getFuckedByRubi);
         }
         if(get_player().hasCock())
         {
            addButton(6,"臀缝摩擦",rubiHotdogging);
         }
         addButton(14,"返回",rubisFuckingHouseYouPervert);
      }
      
      public function rubiPutsOnNursesClothesSoSheCanCheckYourTemperature() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看[rubi em]穿护士制服的样子。[say:哦哦，有点发烧了吗？需要我给你擦身浴吗？][rubi ey]调笑着说，然后把那套衣服拿了起来。");
         outputText("[pg][rubi Ey]先穿上一件朴素、只带一点蕾丝装饰的白色胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，不过以[rubi eir]平坦的胸口来看，显然并不需要它");
         }
         outputText("。[rubi Ey]把[rubi eir]的手臂穿过孔洞，熟练地扣好背后的搭扣。接着，[rubi ey]拿起一条白色吊袜带，顺着[rubi eir]纤细的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
         {
            outputText("覆着毛的");
         }
         else
         {
            outputText("光洁无毛的");
         }
         outputText("腿往上套，直到它服帖地箍在[rubi eir]腰间。一双配套的白色渔网袜很快也穿好了，由吊袜带固定住。接下来是一条白色棉质内裤，[rubi ey]顺着[rubi eir]的腿往上拉，让它紧紧贴住[rubi eir]丰满的屁股。");
         outputText("[pg]接下来就该穿真正的连衣裙了。鲁比把白色连衣裙举起来看了一会儿，然后套到身上。这条柔滑的白色连衣裙紧紧贴着[rubi eir]的身体，一个小小的红十字正好落在[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("心口");
         }
         else
         {
            outputText("左胸");
         }
         outputText("。[rubi Ey]把配套的帽子戴到[rubi eir]头上，调整好后，又穿上一双白色浅口鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) > 0)
         {
            outputText("，鞋跟已经拆掉，还留了个洞给[rubi eir]的恶魔足跟");
         }
         outputText("。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = iceCreamDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function rubiPenisReducto() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         rubiSprite();
         outputText("你把那罐糊状物递了过去。鲁比仔细看了看，又凑近闻了闻，然后用两根手指舀起一些苍白的物质，抹在[rubi eir]的阴茎上。没过多久，罐子就空了，[rubi eir]的[rubi cock]也全都沾满了那东西。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 3)
         {
            outputText("[pg]效果似乎过了一会儿才开始发作。很快，你看见鲁比颤抖起来，[rubi eir]的[rubi cock]先是一硬，随后迅速缩小。等过程结束时，你很确定[rubi ey]少了[if (metric) {几厘米|整整一英寸}]，而那些糊状物也在过程中被完全吸收了。");
            _loc1_ = 985;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         else
         {
            outputText("[pg]它似乎没有任何效果。");
         }
         get_player().consumeItem(get_consumables().REDUCTO);
         menu();
         addButton(0,"下一步",pickAnItemToFeedRubi);
      }
      
      public function rubiPenisGroPlus() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("rubi-gro-plus-penis");
         clearOutput();
         rubiSprite();
         outputText("你把那瓶带绿色的液体递了过去。鲁比花了点时间端详它，随后深吸一口气，把整瓶液体都注入[rubi eir]的[rubi cock]根部。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 12 || rubiGetCockType() == CockTypesEnum.HORSE && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 20 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 30 && get_hyper())
         {
            outputText("[pg]鲁比握住[rubi eir]的阴茎，只见它突然硬了起来，在[rubi eir]手中清晰地搏动着。它猛地胀大，就在你眼前长大了大约[if (metric) {五厘米|两英寸}]。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,985,FlagDict_Impl_.arrayReadInt(_loc1_,985) + (2 + Utils.rand(2)));
            if(get_hyper())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 30)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,30);
               }
            }
            else if(rubiGetCockType() != CockTypesEnum.HORSE)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 12)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,12);
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 20)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,20);
            }
         }
         else
         {
            outputText("[pg]可惜，除了让[rubi eir]的阴茎硬起来之外，这东西似乎对鲁比那根");
            if(rubiGetCockType() == CockTypesEnum.HORSE)
            {
               outputText("能把肉鞘撑满的马屌");
            }
            else
            {
               outputText("巨屌。");
            }
         }
         get_player().consumeItem(get_consumables().GROPLUS);
         menu();
         addButton(0,"下一步",pickAnItemToFeedRubi);
      }
      
      public function rubiMF(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) < 1)
         {
            return param2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) == 1)
         {
            return param2;
         }
         return param1;
      }
      
      public function rubiLeave() : void
      {
         clearOutput();
         outputText("你向鲁比解释说你要出发了，作为回应，[rubi ey]很快抱了你一下，并理解地点了点头。你也回应了[rubi eir]的动作，将鲁比抱在怀里片刻，然后才松开[rubi em]。");
         outputText("[pg][Rubi Ey]随后送你离开，开心地喊道：" + (!rubiBimbo() ? "[say: 有空再来看我，宝贝！]" : "[say: 就是说，要早点再来看我哦，宝贝！]"));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rubiIsAShe() : void
      {
         clearOutput();
         rubiSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
         outputText("鲁比点点头，从现在起会用\"她\"来称呼自己。");
         menu();
         addButton(14,"返回",rubisFuckingHouseYouPervert);
      }
      
      public function rubiIsAHe() : void
      {
         clearOutput();
         rubiSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,0);
         outputText("鲁比点点头，从现在起会用\"他\"来称呼自己。");
         menu();
         addButton(14,"返回",rubisFuckingHouseYouPervert);
      }
      
      public function rubiIntros() : Function
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1014) == 0)
         {
            initializeRubi();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,605) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,621) == -2)
         {
            return null;
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,607) == 0)
         {
            outputText("一个可爱的人类女孩在桌与桌之间穿梭，收拾空桌，并为坐着的客人送上饮品。她的胸部相当平坦，身穿粉白相间、带有花边的女侍制服和围裙。当她背对你时，你能看出她并非[i:完全]是人类，因为一条末端呈铲形的红色长尾巴正从她裙底伸出来。");
         }
         else if(rubiAffection() < 30)
         {
            outputText("鲁比在这里，在桌与桌之间来回穿梭，麻利地清理空桌并招待新客人。她长长的红色尾巴来回摆动，有时会把裙子掀起一点，让人瞥见她的内裤。");
         }
         else
         {
            if(rubiBimbo() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,621) == 0 && Utils.rand(9) == 0)
            {
               outputText("奇怪的是，明明已经到了鲁比当班的时间，她却不在这里。[pg]");
               return cheatingRubi;
            }
            if(rubiBimbo())
            {
               outputText("鲁比在这里，在桌与桌之间来回穿梭，虽然动作不如[rubi ey]以前那么利落，却多了许多热情。[rubi Eir]长长的红色尾巴四处甩动，似乎总被客人和同事的胯间吸引过去。");
            }
            else
            {
               outputText("鲁比在这里，在桌与桌之间来回穿梭，麻利地清理空桌并招待新客人。[rubi Eir]长长的红色尾巴兴奋地来回摆动。");
            }
         }
         outputText("[pg]");
         return approachRubiScenes;
      }
      
      public function rubiIncubus() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,611) == 3;
      }
      
      public function rubiIdentity() : void
      {
         clearOutput();
         rubiSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1005) == 0)
         {
            outputText("你注意到，鲁比总是用\"他\"来指代自己，尽管");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("他一直试图表现得并非如此");
            }
            else
            {
               outputText("他不久前的变化似乎正好相反");
            }
            outputText("。你向他问起这件事，他只是脸红了。");
            outputText("[pg][saystart]哦，那个……呃，我想我从来没觉得自己是个女孩，你懂吧？我真的很喜欢漂亮衣服，还有那些大家说很女孩子气的东西，但我并不一定想成为女孩。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
            {
               outputText("不过既然我现在是了，我确实超喜欢这样！");
            }
            outputText("[sayend] 他一边稍稍扭捏着，一边向你坦白道。[say:要是你想叫我\"她\"，我也没关系的，只是想让你知道。]");
            outputText("[pg]你希望鲁比使用哪一种代词？");
         }
         else
         {
            outputText("你又和鲁比详细聊了聊[rubi eir]性别认同。总的来说，[rubi ey]似乎对成为哪种性别都相当开放，只要能穿上[rubi eir]漂亮裙子，[rubi ey]对哪边都没什么特别偏好。");
            outputText("[pg]你希望鲁比使用哪一种代词？");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1005,FlagDict_Impl_.arrayReadInt(_loc1_,1005) + 1);
         menu();
         addButton(0,"他",rubiIsAHe);
         addButton(1,"她",rubiIsAShe);
         setExitButton("返回",talkToRubiInHouse);
      }
      
      public function rubiHotdogging() : void
      {
         get_images().showImage("rubi-hotdogged");
         clearOutput();
         rubiSprite();
         outputText("你坐在性感恋人旁边的沙发上，一个流畅的动作就把[rubi em]拉到自己腿上。鲁比咯咯笑着，在你腿上扭了扭，随即俯身吻上你的嘴唇。你一只手按在[rubi eir]柔软的屁股上，另一只手搭在[rubi eir]肩胛之间的背上，把[rubi em]拉近，将你的[tongue]探入[rubi eir]口中。你充满情欲地探索着伴侣的口腔，而[rubi ey]闭上[rubi eir]眼睛，发出呻吟。");
         outputText("[pg]你们暂时分开这个吻，喘了口气，随即又再次吻在一起。在这场唇齿交缠的亲热中，你盲目地抓住鲁比的衣服，一层一层地把[rubi em]剥了个干净，直到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
         {
            outputText("皮肤苍白的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
         {
            outputText("红皮肤的");
         }
         else
         {
            outputText("覆满毛皮的");
         }
         outputText("" + rubiMF("男孩","女孩") + "赤裸着躺在你的腿上。鲁比咯咯笑着，把一只手探进[rubi eir]大腿之间");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("握住[rubi eir]的阴茎");
         }
         else
         {
            outputText("用手指摩挲[rubi eir]的阴蒂");
         }
         outputText("，同时[rubi ey]说道：[say: 那么宝贝，你打算怎么做？要把我按住，好好蹂躏一番吗？你想怎么来？]");
         outputText("[pg]鲁比扭动着[rubi eir]的腰，急切地等着你的回答，而你的嘴角则勾起一抹坏笑。看来[rubi ey]已经等得很心急了，不是吗？");
         outputText("[pg]鲁比咯咯一笑，[rubi eir]点点头回应。[say: 哦，是啊，我简直为了你</i>饥渴难耐<i>，宝贝，][rubi ey]说道，接着从你的腿上滑下来，在你脚边跪下。");
         outputText("[pg]你对这种顺从的表现满意地哼了一声，向后靠在沙发上，双臂大大地搭在靠背上。你告诉脚边这个小妖精，在满足[rubi eir]自己之前，得先让你准备好。[rubi Eir]红宝石般的红唇化作一抹笑意，[rubi ey]立刻把你的[cock biggest]从束缚中解放出来。鲁比咂了咂[rubi eir]的嘴唇，俯向你半硬的阴茎，先在顶端吻了一下，又沿着每一[if (metric) {厘米|英寸}]一路吻下去。");
         outputText("[pg]你愉快地叹了口气，更深地陷进沙发柔软的垫子里，尽情享受着双腿之间那个火辣的小荡妇开始卖力服侍。[rubi Eir]的嘴唇在你阴茎外侧噘起，留下一抹朦胧的红色口红印。没过多久，更多这样的印痕接连出现，形成了一圈\"王冠\"般的口红印，环绕在你的[cockHead biggest]周围。你的[cock biggest]几乎胀痛地跳动着，前液从马眼里渗出，而鲁比热切地舔舐着，让它滑过[rubi eir]的舌头，再顺着[rubi eir]的喉咙咽下。");
         outputText("[pg]虽然你很乐意就这么坐着，等到自己射进鲁比嘴里，但你还有别的、更坏心眼的打算。你挥手示意[rubi em]停下，然后站起身。这个小恶魔" + rubiMF("男孩","女孩") + "一开始看起来有些失望，但想到接下来还有更多花样，[rubi em]便期待地抬头冲你笑。你让鲁比爬上沙发，背对着你跪下。");
         outputText("[pg]当你的手顺着[rubi eir]背部滑下，沿着[rubi eir]脊椎，轻轻在[rubi eir]尾巴根部打圈时，[rubi Ey]颤抖了一下。你的指尖划过[rubi eir]身体两侧，仅仅是勉强触碰到[rubi eir]柔软、");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("娇嫩肌肤");
         }
         else
         {
            outputText("丝滑毛皮");
         }
         outputText("。鲁比弓起背，唇间逸出一声轻轻的喘息。[rubi Eir]的身体本能地朝你的手靠过来，渴望的不只是这么简单的撩拨，可你却把手抽开，在[rubi eir]圆润的屁股上玩笑般拍了一下，略带责备地惩戒[rubi em]。");
         outputText("[pg][say: 对、对不起，宝贝，][rubi ey]声音发颤地说道，[say: 只是感觉太舒服了，我忍不住。]你很轻易就原谅了[rubi em]，但也说明，如果[rubi ey]想在这一切结束时高潮，就必须保持不动，并服从你的每一道命令。鲁比用力咽了咽口水，却又开心地点点头，[say: 哦，真的要掌控全局了，是吗？尽管来吧，宝贝。]你回以[rubi em]一个不怀好意的笑容，并向[rubi em]保证你会的。");
         outputText("[pg]你的手指再次落到眼前这个着了迷的小恶魔身上，以最轻微的触碰撩拨着[rubi eir]的身体。这招很有效，因为在[rubi eir]两腿之间，你能看见[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("小穴湿润起来");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("，而");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("肉棒勃起");
         }
         outputText("。[rubi Ey]显然很享受这种轻松又顽皮的挑逗。你又玩笑似地拍了拍鲁比的屁股，含笑看着[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
         {
            outputText("苍白的肌肤");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
         {
            outputText("绯红的肌肤");
         }
         else
         {
            outputText("覆着毛发的肉体");
         }
         outputText("轻轻颤动。");
         outputText("[pg]不过，挑逗并没有就此结束。你握住自己沾着口红印、丝毫没有软下来的肉棒，把它滑进鲁比的臀瓣之间，引得你的伴侣发出一声柔媚的[say: 噢哦]。你用你的[cock biggest]顶端在鲁比诱人的后庭上下摩擦，把前液抹在上面，却完全不插进去。相反，你抓住鲁比的臀瓣，将它们挤在一起，紧紧压住你的肉棒。你轻轻闷哼一声，沉醉于[rubi eir]丝滑的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("皮肤");
         }
         else
         {
            outputText("毛皮");
         }
         outputText("贴着你阳物的触感，随后慢慢开始在鲁比的臀瓣间抽送。");
         outputText("[pg]鲁比这边则因为这极致的挑逗而懊恼地呻吟起来，但[rubi ey]仍然继续听从你的指示，在你不断顶弄[rubi eir]丰腴屁股时一动不动。你每一次挺动都伴着低哼，也开始注意到鲁比的手臂和双腿都在微微发颤，[rubi eir]唇间还泄出压抑的叹息。看来这真的把[rubi em]撩得不轻！你没有打乱节奏，而是伸手探到[rubi eir]双腿之间，将拇指滑入[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("肛穴");
         }
         else
         {
            outputText("小穴");
         }
         outputText("，同时用食指和中指在[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("阴蒂");
         }
         else
         {
            outputText("会阴");
         }
         outputText("。");
         outputText("[pg]你心里盘算着。你可以继续这样挑逗[rubi em]，不让[rubi em]高潮，反正[rubi ey]显然很沉醉于这种感觉。或者，你也可以大方一点，让[rubi em]现在就痛快释放……你要怎么选？");
         saveContent.hadSex = true;
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
         menu();
         addButton(0,"挑逗鲁比",teaseButtjobs);
         addButton(1,"释放",popButtjobs);
      }
      
      public function rubiHasARubberFetish() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿上那套橡胶情趣装的样子。[say:哦呵呵，][rubi ey]咯咯笑着，冲你挑了挑眉，[say:有点想玩刺激的了，是吧？]");
         outputText("[pg]鲁比一开始拿出来的不是衣服，而是一小瓶油和乳液。[rubi Ey]取了一小把那东西，闻起来有淡淡的紫丁香味，搓了搓[rubi eir]的双手，开始把它涂到[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("皮肤");
         }
         else
         {
            outputText("毛茸茸的身体");
         }
         outputText("，从[rubi eir]的双腿开始，一路涂到躯干和手臂。等鲁比的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("皮肤");
         }
         else
         {
            outputText("毛发");
         }
         outputText("在油光下闪闪发亮，真正穿衣服的时候也到了。");
         if(!rubiBimbo())
         {
            outputText("[rubi Ey]先拿起一条透明橡胶内裤，沿着[rubi eir]的双腿往上拉，直到它服帖地贴住[rubi eir]的屁股。");
         }
         outputText("接着，鲁比套上一件透明乳胶上衣，长袖设计，还开了洞来露出[rubi eir]的乳头。这衣服很难穿，你也得帮鲁比一把才行，但一旦穿好，效果简直棒极了，就像第二层皮肤一样紧贴着[rubi eir]的身体。");
         outputText("[pg]接下来是裙子，比起那件上衣要简单得多。不过配套的长袜就麻烦了。鲁比不得不坐到地板上，让你费力地把它们拉上[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
         {
            outputText("覆着毛的");
         }
         outputText("双腿。你不禁好奇，你不在的时候 [rubi ey] 到底是怎么做到的！最后，鲁比穿上一双高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟被切掉，好给 [rubi eir] 恶魔般的足跟腾出空间，");
         }
         outputText("，完成了整套打扮。总的来说，[rubi ey] 看起来已经准备好去地下城里度过一晚了。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = barDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function rubiGrowPlusBreasts() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("rubi-gro-plus-tits");
         clearOutput();
         rubiSprite();
         outputText("你把那瓶带蓝色的液体递了过去。鲁比花了点时间端详它，随后深吸一口气，把半瓶注入一侧乳房，剩下的则注入[rubi eir]另一侧乳房。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 7 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 30 && get_hyper())
         {
            outputText("[pg]鲁比的乳房突然自行晃动起来，像被充气一样膨胀。这个小小的恶魔变形者浑身颤抖，快感冲刷着[rubi eir]的身体，[rubi eir]的乳房至少变大了两个罩杯。[rubi Eir]的手指无意识地揉弄着[rubi eir]新长出的丰满乳房，拨弄着那片泛红而敏感的肉，直到变形带来的情热终于散去，只留下[rubi em]在你面前瘫坐在地，喘息不止。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,984,FlagDict_Impl_.arrayReadInt(_loc1_,984) + (2 + Utils.rand(2)));
            if(get_hyper())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 30)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,30);
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 7)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,7);
            }
         }
         else
         {
            outputText("[pg]可惜，除了让[rubi eir]的乳头变得格外挺翘之外，它们似乎对鲁比本就巨大的胸部没什么效果。");
         }
         get_player().consumeItem(get_consumables().GROPLUS);
         menu();
         addButton(0,"下一步",pickAnItemToFeedRubi);
      }
      
      public function rubiGetCockType() : CockTypesEnum
      {
         return CockTypesEnum.ParseConstantByIndex(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,986));
      }
      
      public function rubiCock(param1:int = 50) : String
      {
         var _loc2_:int = 300;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) < 4)
         {
            _loc2_ = 10;
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 6)
         {
            _loc2_ = 150;
         }
         return Appearance.cockDescription(rubiGetCockType(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) / 6,param1,_loc2_);
      }
      
      public function rubiChest() : String
      {
         return rubiBreasts();
      }
      
      public function rubiCapacity() : Number
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1010) * 10;
         if(_loc1_ > 76)
         {
            _loc1_ = 76;
         }
         if(get_hyper())
         {
            _loc1_ += 200;
         }
         return 24 + _loc1_;
      }
      
      public function rubiBreasts() : String
      {
         var _loc1_:String = "一对";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            _loc1_ = "胸部";
         }
         else
         {
            _loc1_ += Appearance.breastCup(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984));
            _loc1_ += " ";
            _loc1_ += BreastStore.breastDescript(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984));
         }
         return _loc1_;
      }
      
      public function rubiBoobsReducto() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         rubiSprite();
         outputText("你把那罐糊状物递了过去。鲁比仔细看了看，又凑近闻了闻，然后用两根手指舀起一些苍白的物质，抹在[rubi eir]的乳房上。没过多久，罐子就空了，[rubi eir]的[rubi breasts]也全都沾满了那东西。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 0)
         {
            outputText("[pg]效果似乎过了一会儿才开始发作。很快，你看见鲁比颤抖起来，[rubi eir]的乳房也像在震颤一般，迅速缩小。等过程结束时，你很确定[rubi ey]已经小了整整一个罩杯，而那些糊状物也在过程中被完全吸收了。");
            _loc1_ = 984;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         get_player().consumeItem(get_consumables().REDUCTO);
         menu();
         addButton(0,"下一步",pickAnItemToFeedRubi);
      }
      
      public function rubiBimbo() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,610) != 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1002) == 0;
         }
         return false;
      }
      
      public function rubiBalls() : String
      {
         return "正常";
      }
      
      public function rubiAppearance() : void
      {
         get_images().showImage("rubi-inspect-appearance");
         clearOutput();
         rubiSprite();
         outputText("你打量着你那赤裸的恶魔变形者爱人。");
         outputText("[pg]鲁比大约[if (metric) {一米五|五英尺高}]，有着非常纤细而富有女人味的身体。[rubi Eir]皮肤是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
         {
            outputText("苍白得几乎像瓷器一样");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1)
         {
            outputText("一种异域感的樱桃红");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
         {
            outputText("覆盖着一层细密、丝滑的白色绒毛");
         }
         else
         {
            outputText("一种异域感的樱桃红，与灰色的腹部以及沿着[rubi eir]双腿和手臂上下延伸的条纹相映成趣");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("，而且全身无毛，除了[rubi eir]那");
         }
         else
         {
            outputText("，并且[rubi ey]留着一头");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,996) == 0)
         {
            outputText("短短的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,996) == 1)
         {
            outputText("齐肩的");
         }
         else
         {
            outputText("长长的");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,995) == 0)
         {
            outputText("黑色");
         }
         else
         {
            outputText("金色");
         }
         outputText("头发，[rubi ey]把它修剪成可爱又有女人味的样式。鲁比的脸柔和而圆润");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1000) > 0)
         {
            outputText("，[rubi eir]脸颊上还长着几根可爱的胡须");
         }
         outputText("，[rubi eir]嘴唇涂成了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
         {
            outputText("猩红色的");
         }
         else
         {
            outputText("暗黑色的");
         }
         outputText("，[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 0 || rubiBimbo())
         {
            outputText("绿色");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 1)
         {
            outputText("纯黑色");
         }
         outputText("的眼睛描着眼线" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) == 1 ? "" : "，却暴露出[rubi eir]原本的男性出身") + "。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,988) > 0)
         {
            outputText("两只小角从[rubi eir]的发际线向上伸出，通体漆黑。");
         }
         outputText("一对");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 0)
         {
            outputText("可爱的普通耳朵从[rubi eir]的头部两侧伸出，每只耳朵上都穿着一枚小小的吊坠耳环");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 1)
         {
            outputText("可爱的猫耳从[rubi eir]头顶冒出，似乎每只都能独立活动");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 2)
         {
            outputText("覆有羽毛的耳朵从[rubi eir]的头部两侧伸出，每只耳朵都会不时可爱地轻颤一下，而且都穿着一枚小小的吊坠耳环");
         }
         outputText("。");
         outputText("[pg][rubi Ey]有");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("平坦的胸膛");
         }
         else
         {
            outputText("[rubi breasts]");
         }
         outputText("，上面挺立着两颗");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) == 1)
         {
            outputText("黑色的");
         }
         outputText("乳头。");
         outputText("[pg][rubi eir]两腿之间有一根");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText(rubiCock() + "，在你的注视下开始挺立起来。根据经验，你知道它勃起时能达到惊人的" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) + "英寸。");
            outputText("在[rubi eir]阴茎下方晃荡着一对");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) < 9)
            {
               outputText("因精液而胀大的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 9)
            {
               outputText("肿胀发青的");
            }
            outputText("睾丸");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,997) == 1)
            {
               outputText("，紧贴着[rubi eir]身体，装在一个可爱的圆鼓鼓囊袋里");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("，还有一个");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("可爱的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,991) > 0)
            {
               outputText("黑色的");
            }
            outputText("小穴，上方有一颗小小的阴蒂");
            outputText("。虽然你看不见，但你知道鲁比在[rubi eir]两瓣屁股之间、该在的位置，有个完美的小屁眼。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]一条末端呈黑桃形的红色尾巴在[rubi em]身后摇摆，偶尔会缠上[rubi eir]的腿。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("最后，鲁比踩着长长的黑色尖刺站立，让[rubi em]走起路来就像穿着高跟鞋一样。");
         }
         menu();
         addButton(0,"给予物品",pickAnItemToFeedRubi);
         addButton(1,"赠送衣服",giftRubiClothes);
         addButton(2,"换装",playDressUp);
         addButton(14,"返回",rubisFuckingHouseYouPervert);
      }
      
      public function rubiAffection(param1:int = 0) : int
      {
         if(param1 == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,604,FlagDict_Impl_.arrayReadInt(_loc2_,604) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,604,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,604,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604);
      }
      
      public function reset() : void
      {
         saveContent.hadSex = false;
      }
      
      public function releaseRubiMassage() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你觉得[rubi ey]刚才那么尽心地照顾你，也该得到点奖励。");
         outputText("[pg]你把草莓往里送得更深，将它最宽的部分送到唇间，让舌头掠过那层巧克力表面，融化摩卡色的外壳，同时目光紧锁着鲁比的眼睛。[rubi Ey]呻吟起来，沉醉地欣赏着这场口中的盛宴。[if (rubihascock) {前液不断冒出，[rubi eir]短小又女气的肉棒看起来已经快要爆开了。它几乎像一根充得过头的香肠，只不过这根正危险地濒临喷发。不过[rubi Ey]还是勉强忍住了；毕竟[rubi ey]还贴在你的屁股后面，所以一直等着你的许可才敢射出来|鲁比夹紧[rubi eir]大腿，[rubi eir]整个身体都在颤抖，好像这个可怜的" + rubiMF("男孩","女孩") + "就快要爆开了一样。你就这样让[rubi em]在煎熬中等着，时间仿佛过得无比缓慢；[rubi eir]的视线始终没有离开你的眼睛，默默等待着你允许[rubi em]高潮。}]。");
         outputText("[pg]你把草莓推进嘴里吞下，故意响亮地咂了咂嘴，然后说道，[say: 来吧，鲁比，别让我等太久。你也该释放一下压力了。]");
         outputText("[pg]听到你的宣告，鲁比咬住[rubi eir]下唇，眼皮不受控制地半垂下来。[rubi Ey]呻吟着，[say: 噢噢——好！]然后[if (rubihascock) {抓住你裹着毛巾的臀瓣，把它们并在一起夹住[rubi eir]肉棒。你感觉到[rubi eir]硬挺的阳具在你的屁股上弹了一下、两下、三下，接着你的恋人用尖细的声音放荡地呻吟起来，同时你也感觉到底部传来一阵湿意。|跳上[rubi eir]的床，把[rubi emself]压到你裹着毛巾的[if (tailLeg) {尾巴|[if (isgoo) {下身|腿}]}]上，直到[rubi eir]的湿意渗透毛巾，浸到你的[skindesc]。鲁比急促的喘息充满了[rubi eir]卧室，[rubi ey]在你身上磨蹭着，彻底屈从于[rubi eir]的欲望。几乎刚一开始，你就感觉到鲁比突然在你周围颤抖起来，[rubi ey]发出一声尖细的呻吟，随即[rubi ey] }]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 3)
            {
               outputText("[pg]一股股冒着泡的精液从[rubi eir]小巧的囊袋里涌出，很快浸进柔软蓬松的布料中，鲁比就这样把自己榨干。没过多久，[rubi ey]几乎连一滴精液都射不出来了，但[rubi eir]的勃起仍尽职尽责地抽搐着，仿佛还能永远射下去。[rubi eir]脸上如释重负的表情可爱极了，你把鲁比拉进怀里依偎着，让那条沾满精液的毛巾接住[rubi eir]放荡的射精。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 5)
            {
               outputText("[pg]一股股浓稠滚烫的精液湿淋淋地溅进蓬松的布料里，鲁比那憋了太久的睾丸拼命想把你逼它们忍住的热精全都排空。[rubi Eir]温热的精液很快浸透毛巾，在[rubi ey]压进你臀缝里、留下的肉棒形凹陷中积成一滩，又慢慢透过这层屏障滴到你的屁股上。[rubi Eir]舌头从[rubi eir]嘴里垂出来，满是如释重负的模样；随着[rubi ey]不断排空，最终在最后一点精液从[rubi em]身上淌出时，整个人瘫倒在你的背上。[pg]你把[rubi em]从身上拉下来，搂进怀里依偎着。等[rubi ey]慢慢平静下来后，你亲吻[rubi em]，感谢[rubi em]给了你一个美妙的夜晚。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 7)
            {
               outputText("[pg]他的精液射得又猛又急，直接穿透毛巾冲进你的臀缝里。一连串白浊从[rubi eir]小小的肉棒中喷涌而出，速度又快、力道又狠，把布料弄成一团湿滑的狼藉，而你的[butt]也被[rubi eir]黏稠的男孩精液弄得湿漉漉的。随着鲁比改变姿势，那大量的射精突然一道道喷到你背上；[rubi ey]舌头挂在外面，完全沉浸在解脱与狂喜之中，[rubi eir]眼睛几乎翻到上面，[rubi ey]彻底迷失在[rubi eir]轰鸣般的高潮里。那名伪娘的睾丸一边咕噜作响地缩小，一边随着每一次喷射抽搐，直到恢复正常大小。不过到了那时，你的背上早就被他一个人办了场射精秀。");
               outputText("[pg]鲁比猛地一颤，往湿透的毛巾里挤出几缕无力的白浊，然后就趴倒在你身上，陷进[rubi eir]自己弄出的狼藉里。你把[rubi em]拉到一旁抱住，亲了[rubi em]一下，把[rubi em]唤醒。等[rubi ey]看起来清醒到能再次听懂你说话时，你感谢[rubi em]带给你如此美妙的时光。鲁比听了脸上一红，随即为弄得一团糟向你道歉，并在你离开前帮你清理干净。今天，可不止一条毛巾成了你这位男宠积攒已久的精力的牺牲品。");
            }
            else
            {
               outputText("[pg]他的精液从[rubi em]体内涌出，化作一股浓稠的白色浪潮，力道大到立刻渗透了毛巾；量也多得惊人，到[rubi eir]第三次喷射时，精液已经从湿透布料的边缘滴落下来。[rubi eir]像个荡妇一样呻吟着，[rubi eir]双手揉捏着你湿透的屁股，[rubi eir]身体则被一阵阵快感痉挛折磨得颤抖不止。这个男娘连自己都不知道存在的肌肉都在拼命运作，把[rubi eir]满满的爱液喷洒出来；当[rubi eir]背脊不由自主地弓起时，[rubi eir]喷射的精液喷泉也随之抬高，冲刷过你的后背，精液在油上凝成珠，就像雨水落在玻璃上一样。[rubi Eir]睾丸以肉眼可见的速度瘪下去，而床铺和你的身体也一起变成了一片又热又湿的狼藉。你看着[rubi eir]眼睛完全翻白，舌头从[rubi eir]嘴里耷拉出来——鲁比的大脑已经在[rubi eir]快感的冲击下彻底宕机，只剩[rubi eir]身体像开了自动模式一样继续射精，直到[rubi ey]被彻底榨干。");
               outputText("[pg]慢慢地，洪流变成了懒散的滴落，随后伴随着一声呜咽，终于停了下来。鲁比无力地瘫倒在你沾满精液的背上，[rubi eir]双手陷进你身两侧的水洼里——那都是[rubi ey]把床垫弄成的样子。你故意左右扭了扭屁股，让[rubi eir]已经射空的勃起又抽搐了最后几下，然后才把筋疲力尽的男娘拉到你身旁。你把[rubi em]紧紧抱住，亲吻[rubi em]，鲁比随之发出呜咽；你没有理会[rubi ey]弄出的狼藉，只想单纯享受这段与恋人相依的温柔时刻。看来你们今天都得到了自己需要的东西，不过在你适合离开之前，鲁比恐怕还得再换掉好几条毛巾……");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 3)
            {
               outputText("放慢到慵懒而绵长的节奏，尽可能把[rubi eir]等待已久的释放拖得更久。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 5)
            {
               outputText("仰头后倒，把[rubi eir]手指深深抠进你的[ass]里，在被压抑了这么久之后，竭尽全力想保持站稳。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 7)
            {
               outputText("笨拙地瘫倒在你的背上。[rubi Eir]被压抑已久的高潮似乎把[rubi em]的力气彻底抽空了，鲁比只能勉强搂住你，一边喘着气慢慢缓过来。");
            }
            else
            {
               outputText("扑倒在你背上，沉浸在狂喜之中。鲁比的四肢和尾巴搭在你身上，仿佛过了好几分钟，[rubi ey]才终于动了动。即便现在，[rubi ey]仍因被压抑了这么久后的余韵而颤抖不已。");
            }
            outputText("[pg]等到" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) != 0 ? "你扶着鲁比" : "[rubi ey]踉跄着") + "从你身上下来时，毛巾已经" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) > 5 ? "完全湿透" : "沾上了些痕迹") + "，但你并不在意，只是把[rubi em]拉近，让[rubi em]依偎在你怀里。你感谢[rubi em]陪你度过了这段美好的[timeofday]时，[rubi Ey]仍有些慌乱，但你低下头，用一个吻堵住了[rubi em]所有的疑虑。你告诉鲁比，你最喜欢的，就是看着[rubi em]被一点点触碰弄得彻底失控；而[rubi ey]只是更贴近了你作为回应。鲁比又软又暖，[rubi eir]身上残留的气味与巧克力和油香交织在一起，你就这样躺在鲁比身边，陪着[rubi em]，直到[rubi ey]不再需要为止。");
            outputText("[pg]你们俩一定是不知什么时候睡着了，因为从鲁比窗外透进来的[sun]光变化就能看出来。你[if (isnaked) {起身伸展身体|穿上你的[armor]}]时，[rubi Ey]又偷吻了你一下；而在你返回营地时，[rubi ey]已经开始换[rubi eir]的床单了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,608,0);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function releaseRubi() : void
      {
         get_images().showImage("rubi-orgasm-denial-release");
         clearOutput();
         rubiSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,0);
         outputText("你命令鲁比脱光。熟悉流程的[rubi ey]便慢慢照做。没有脱衣舞，也没有刻意表演，[rubi ey]只是尽快脱掉衣服，直到[rubi ey]身上只剩下[rubi eir]内裤，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("[rubi eir]的[rubi cock]把布料撑得紧绷，仿佛随时都要挣脱出来。");
         }
         else
         {
            outputText("紧紧贴着[rubi eir]平坦的小丘。");
         }
         outputText("[pg]你跪在[rubi em]面前，抓住[rubi eir]内裤两侧，亲手把它剥了下来，露出他硬得像石头一样的肉棒。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 3)
         {
            outputText("还有[rubi eir]那小小的蛋蛋");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,997) == 1)
            {
               outputText("，被困在那只娘炮的小囊袋里");
            }
            outputText("，你觉得它们似乎有些肿胀，尽管你还没挑逗[rubi em]多久。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
         {
            outputText("还有[rubi eir]那对颇具分量的蛋蛋，在你毫不留情的挑逗下，似乎已经胀到了平常的两倍大。它们甚至泛着一点淡淡的青色，虽然不太显眼。");
         }
         else
         {
            outputText("还有[rubi eir]那对巨大的蛋蛋，在你无休止的挑逗下，似乎已经有棒球那么大。它们甚至明显泛着青色，显然胀痛得急需释放。");
         }
         outputText("[pg]你示意[rubi em]坐到旁边的咖啡桌上，[rubi ey]照做了。你用手指握住[rubi eir]的阳具，开始缓慢套动，同时提醒[rubi em]，[rubi ey]不准射。[rubi Ey]呜咽了一声，但还是点点头。你看得出来，[rubi ey]每一刻都在和[rubi eir]的身体本能抗争，渴望着只有你的命令才能带来的释放。");
         outputText("[pg]但现在还不会让[rubi em]如愿。你还有很多事要做。你没有松开握着[rubi em]的手，而是把[rubi em]往后推，让[rubi ey]仰躺在桌面上，[rubi eir]双腿垂在桌沿外。你伸出两根手指，抹起一些正顺着[rubi eir]肉棒和你的手往下淌的前列腺液，然后把它按摩进[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 3)
         {
            outputText("肿胀的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
         {
            outputText("微微发青的");
         }
         else
         {
            outputText("肿胀得厉害、泛着青色的");
         }
         outputText("睾丸。等它被充分润滑后，你将两根手指按了进去。");
         outputText("[pg]鲁比的脸短暂地扭成惊讶的表情，又很快变成了欲望。[rubi Ey]大声喘息着，舌头伸在外面。不过，在[rubi eir]脸上那愈发浓烈的欲望背后，你看得出[rubi ey]正全神贯注。无论如何，[rubi ey]都决心不让你失望。要是你告诉[rubi em]，[rubi em]再也不能射了，你相信[rubi ey]一定会当真，而且[rubi ey]绝不会让那种事发生。对[rubi em]来说，幸好你还没残忍到那个地步。");
         outputText("[pg]你的手指在[rubi em]体内探动，寻找着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("P点");
         }
         else
         {
            outputText("G点");
         }
         outputText("。当鲁比不由自主地猛地一颤、扭动起来时，你就知道自己找到了。前列腺液开始从鲁比的[rubi cock]里大量渗出，顺着你的手和手臂流下，在茶几上积成一摊。鲁比的身体颤抖不止，在桌上像离水的鱼一样挣动着。");
         outputText("[pg]你胆子更大了一点，将第三根手指滑入小恶魔" + rubiMF("男孩","女孩") + "的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("直肠");
         }
         else
         {
            outputText("褶缝");
         }
         outputText("。你用三根手指按压并按摩[rubi eir]的前列腺，让从[rubi eir]顶端流出的前列腺液变得更多。");
         outputText("[pg]最后，你觉得差不多够了。你把手指从[rubi eir]的屁股里抽出，转而托住[rubi eir]的睾丸，捏得鲁比因为不适而发出一声尖叫。你更快地套弄[rubi eir]的阴茎，并命令[rubi em]射出来，每说一个字都捏一下[rubi eir]的睾丸。");
         outputText("[pg]鲁比脸上先是露出解脱，随后又被情欲取代。[rubi Ey]已经等这一刻等了很久。你又捏了一下[rubi eir]的睾丸，[rubi eir]的嘴唇绷成一个紧紧的O形，一股精液猛地射出，先是飞溅上去，然后啪地落在[rubi eir]胸口。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 3)
         {
            outputText("紧接着又是一股力道稍弱的珍珠白精液，落在[rubi eir]脸上，随后还有几股更小的精液溅在[rubi em]周围。[rubi Eir]的阴茎抽动、痉挛，随后慢慢软了下去。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 5)
         {
            outputText("紧接着又是一股力道稍弱的珍珠白精液，然后又一股，再一股，每一股都落得更靠近[rubi eir]的脸。最后，它又象征性地抽动了几下，把细小的精液团喷到周围。[rubi Eir]的阴茎抽动、痉挛，却只喷出空气，仿佛[rubi eir]的身体还在渴求释放。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 7)
         {
            outputText("紧接着又是一股力道更猛的珍珠白精液，溅到天花板上，又滴落到你们俩身上。又一股精液喷涌而出，接着又一股，再一股，每一股都大片覆盖在鲁比的肚子、胸口和脸上。[rubi Eir]的阴茎终于最后抽搐、痉挛了几下，只喷出空气，仿佛[rubi eir]的身体还在渴求释放。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
         {
            outputText("紧接着又是一股力道更猛的珍珠白精液，溅到天花板上，又滴落到你们俩身上，随后又一股，再一股。没过多久，你们正上方的天花板就出现了一大片被白浊精液覆盖的斑块，像树上滴落的露水一样洒在你身上。然而，鲁比的阴茎并没有就此停下，它还在不断抽动，喷洒着[rubi eir]的种子，直到[rubi ey]全身都被这东西覆盖。最后，它总算结束了，尽管[rubi eir]的[rubi cock]仍在痉挛，只喷出空气，仿佛[rubi eir]的身体还在渴求释放。");
         }
         else
         {
            outputText("紧接着又是一股更加强劲的珍珠白精液，溅到天花板上，又滴落到你们俩身上，随后又一股，再一股。没过多久，你们正上方的天花板就出现了一大片被白浊精液覆盖的斑块，像林间树上滴落的露水一样洒下。然而，鲁比的阴茎并没有就此停下，它还在不断抽动，喷洒着[rubi eir]的种子，把[rubi em]自己、你和周围都大片覆盖住，直到一切看起来都白茫茫一片。");
         }
         outputText("[pg]鲁比的身体明显放松下来，[rubi eir]的四肢瘫软下去，[rubi eir]的阴茎也跟着软了下来，只是慢一些。你把手舔干净，又给了鲁比一个湿漉漉的吻，[rubi ey]感激地轻哼回应。得到了[rubi ey]渴望已久的释放后，[rubi ey]陷入了高潮后的梦境。");
         outputText("[pg]你站起身，决定让[rubi em]睡一会儿。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 5)
         {
            outputText("你把自己清理干净，给鲁比留下一张写着[say:下次见]的小纸条，然后出门返回营地。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
         {
            outputText("你走进浴室，把身上的精液洗掉，简单冲了个澡。之后，你擦干身体，给鲁比留了张写着[say:下次见]的小纸条，然后出门返回营地。");
         }
         else
         {
            outputText("你走进浴室，把身上的精液洗掉——这可绝不轻松。之后，你擦干身体，给鲁比留了张写着[say:下次见]的小纸条，然后出门返回营地。你当然不想在[rubi ey]醒来时还待在那里，免得还得跟[rubi em]一起把整栋屋子打扫干净。");
         }
         saveContent.hadSex = true;
         rubiAffection(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,608,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rejectRubi() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你双手扶着他的肩膀，小心地让他与你保持一臂距离。你尽可能委婉地告诉他，你对他已经没有[i:那种]兴趣了，至少现在没有。");
         outputText("[pg]鲁比眼眶泛泪，你能看见他的嘴唇在颤抖，但他还是努力装出坚强的样子。[say: 我明白。我只是必须告诉你。听着，别把这件事告诉别人，好吗？我不想让我的秘密传出去。]你向他保证不会揭穿他，他也对你露出一个淡淡的笑容。");
         outputText("[pg]鲁比轻轻吸了吸鼻子，转身回到面包店，恶魔般的尾巴在身后沮丧地垂着。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,605,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function putRubiInAWaitressUniform() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿上女服务员制服的样子。[say:唔，好吧，不过那只是我的工作服，][rubi ey]回答道。");
         outputText("[pg]鲁比先穿上一件带蕾丝花边的白色胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，不过以[rubi eir]平坦的胸口来看，显然并不需要它");
         }
         outputText("。[rubi Ey]把[rubi eir]胳膊穿过开口，熟练地扣好背后的搭扣。接着，[rubi ey]拿起一条黑色吊袜带，沿着[rubi eir]纤细而");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("光洁无毛的");
         }
         else
         {
            outputText("覆着毛发的");
         }
         outputText("双腿往上套，直到它紧贴在[rubi eir]腰间。随后，[rubi ey]又很快穿上一双配套的透明长袜，用吊袜带固定好。");
         if(!rubiBimbo())
         {
            outputText("[pg]你那恶魔化的情人接着小跑到一只抽屉柜前，在里面翻找了一阵，最后拿出一条饰有褶边的粉色内裤，前面还带着一个小蝴蝶结。[rubi Ey]先后把套着丝袜的两条腿伸进内裤里，然后往上拉，直到它紧紧裹住[rubi eir]圆润的屁股和[rubi cock]。");
         }
         else
         {
            outputText("[pg]现在你本以为[rubi em]会穿上一条内裤，可看来[rubi eir]被傻妞化搅得晕乎乎的脑子已经把这事彻底忘了。");
         }
         outputText("鲁比走到一排衣服前，安静地找了一会儿，然后从上面取下两只衣架：一件粉色衬衫和一条配套的粉色裙子。");
         outputText("[pg]先穿上衬衫，然后是裙子。鲁比只把衬衫的扣子扣到大约一半");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，露出[rubi eir]平坦胸膛的一部分");
         }
         else
         {
            outputText("，露出大片深深的乳沟");
         }
         outputText("，然后把衬衫下摆塞进裙子里。最后，鲁比选了一双");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("看起来像平底鞋的鞋，鞋跟处还开了个洞，正好容纳[rubi eir]恶魔般的足跟");
         }
         else
         {
            outputText("短跟鞋");
         }
         outputText("并穿了上去。[rubi Ey]穿着女服务生制服轻轻转了一圈，又弯了好几次腰，向你展示[rubi eir]");
         if(!rubiBimbo())
         {
            outputText("少女风内裤");
         }
         else
         {
            outputText("光溜溜的下身");
         }
         outputText("。");
         outputText("[pg][say:好啦！我看起来怎么样？]你咧嘴一笑，告诉[rubi em][rubi ey]看起来棒极了，而且你向来抵挡不住穿制服的[rubi man]。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = iceCreamDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnSluttySwimwearYouSkank() : void
      {
         var date1:Function;
         var _g1:Rubi;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿泳装的样子。[say:哦，可附近又没有泳池或湖。还是说，你只是想看我穿比基尼？]鲁比咯咯笑了一会儿。");
         outputText("[pg]鲁比先穿上比基尼下装，那几乎只是一条勉强能算作衣服的布料。[rubi Ey]把它顺着[rubi eir]双腿拉上去，让它紧紧贴住[rubi eir]丰满的屁股，然后转过身来朝你扭了扭。接着是上装，一件挂脖式比基尼上衣，[rubi ey]把它从[rubi eir]头上套下去，在[rubi eir]背后系好。那两片三角形布料");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 3)
         {
            outputText("松松垮垮地搭在鲁比的小胸脯上");
         }
         else
         {
            outputText("被鲁比丰满的胸部撑得紧绷");
         }
         outputText("。");
         outputText("[pg]最后，你的恶魔情人穿上一双凉鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) > 0)
         {
            outputText("，鞋底开了个洞，好给[rubi eir]的恶魔脚跟留出空间");
         }
         outputText("。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         _g1 = this;
         date1 = function():void
         {
            _g1.exhibitionistDate();
         };
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnMyBodysuitYouWhore() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看[rubi em]穿那件连体衣。[say:哦，那件还挺可爱的，][rubi ey]说道，[say:虽然也没多少布料就是了。不过我想这就是重点，对吧？]");
         outputText("[pg]鲁比轻笑一声，从衣架上取下那件连体衣。它几乎是透明的，不过有几处位置恰到好处的不透明花朵装饰，你知道它能保住鲁比最后一点体面……至少勉强能吧。鲁比坐到[rubi eir]梳妆台前的椅子边上，把那件衣服套上[rubi eir]那双");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("光滑的");
         }
         else
         {
            outputText("覆着毛发的");
         }
         outputText("腿上往上拉，接着一路套上[rubi eir]身体，直到[rubi ey]把[rubi eir]手臂伸进那双透明的长袖里。稍作调整后，确认");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("[rubi eir]胯下那一包被整齐地收好");
         }
         else
         {
            outputText("一朵红玫瑰正好遮住了[rubi eir]的阴阜");
         }
         outputText("，而连体衣的臀部也完美贴合着[rubi eir]自己的屁股后，[rubi ey]便向你摆起了姿势。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = barDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnBondageStrapsYouBondageTrap() : void
      {
         var date1:Function;
         var _g1:Rubi;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看[rubi em]穿上那套束缚皮带。[say:哦！那套衣服啊？]鲁比顿时满脸通红");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) > 0)
         {
            outputText("，至少你是这么想象的");
         }
         outputText("。[say:那套真的好羞人……不过是你的话，我会穿的。]");
         outputText("[pg]小恶魔" + rubiMF("男孩","女孩") + "从一个装满其他皮革配件的箱子里取出那套皮带。鲁比笨手笨脚地摆弄着那团纠缠在一起的皮带，直到你上前帮忙。在你的帮助下，你们俩总算弄清楚了哪头是哪头，鲁比也把[rubi eir]双腿伸进了下半部分。你把那团皮革沿着[rubi eir]腿往上拉，并扣紧固定好。接着再把剩下的部分拉上去，进一步收紧并扣牢。");
         outputText("[pg]最终，你把整套皮带都沿着鲁比的躯干和手臂扣好，包括[rubi eir]脖子上的一只厚项圈。你把整套东西收紧到恰到好处的程度，让鲁比的动作受到些许限制，不过[rubi ey]之后完全可以自己脱出来。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         _g1 = this;
         date1 = function():void
         {
            _g1.exhibitionistDate();
         };
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnAWaitressUniformYouWhore() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿上[rubi eir]平常女服务生制服的暴露版。[say: 哦，你喜欢那套衣服，对吧？我就猜你会喜欢，]鲁比咯咯笑着说道。");
         outputText("[pg]当然，这套衣服其实没多少布料，一开始就是一条短到几乎会被误认成腰带的裙子。");
         if(!rubiBimbo())
         {
            outputText("接着，[rubi ey]穿上一条粉色褶边内裤，沿着[rubi eir]纤细的双腿往上拉，直到它贴住[rubi eir]丰满的屁股。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("奇怪的是，这条内裤似乎只遮住了鲁比的睾丸，却把[rubi eir]的肉棒完全露在外面。");
            }
         }
         outputText("鲁比拿起一条简单的白色围裙，接着套在身上，把类似挂脖的上半部分绕过[rubi eir]脖子，再把系带系在[rubi eir]腰间。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("最后，鲁比拿起一个粉色蕾丝阴茎套，顺着[rubi eir]的[rubi cock]套下去，再用一条粉色缎带固定住，并在[rubi eir]肉棒根部系成一个蝴蝶结。");
         }
         outputText("[pg]做完这一切后，[rubi ey]只是穿上一双黑色露趾高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟被去掉了，好给[rubi eir]自己的恶魔足跟腾出空间");
         }
         outputText("，然后穿着这套暴露的衣服在你面前摆起姿势。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         doNext(rubiAppearance);
      }
      
      public function putOnATubeTopYouWhore() : void
      {
         var date1:Function;
         var _g1:Rubi;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看 [rubi em] 穿抹胸和短裤的样子。[say:哦，我喜欢那套。有点大胆，不过超可爱！]");
         outputText("[pg]鲁比一开始拿出的，似乎是你见过布料最少的细带丁字裤。[rubi Ey] 套进那条小得可怜的内裤里，把它往上拉，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("把 [rubi eir] 阴茎牢牢塞进遮住 [rubi eir] 裆部的三角布片里，同时");
         }
         outputText("那根细带牢牢嵌进鲁比的臀缝里。随后是一条小得离谱的牛仔短裤，顺着[rubi eir]纤细的双腿滑上去，几乎只堪堪盖住已经穿好的丁字裤。鲁比扯了扯那件暴露内裤两侧的细带，确保它们能清清楚楚地露在牛仔短裤上方。");
         outputText("[pg]接着，[rubi ey]拿起那件抹胸——几乎只是一条长方形布料——从[rubi eir]头上套了下去，整理好位置，盖在[rubi eir]的" + rubiChest());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 2)
         {
            outputText("上，把那片单薄的布料绷得紧紧的");
         }
         outputText("。最后搭配的是一双简单的凉鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋底开了个洞，好给鲁比的恶魔脚跟留出空间");
         }
         outputText("。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         _g1 = this;
         date1 = function():void
         {
            _g1.exhibitionistDate();
         };
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnASuitYouSlut() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看 [rubi em] 穿西装的样子。[say:哦，真的吗？它看起来是不错啦，不过你不觉得太男人味了吗？]");
         outputText("[pg]鲁比先穿上一件黑色蕾丝胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，尽管[rubi ey]显然并不需要穿这个");
         }
         outputText("，[rubi ey] 熟练地在 [rubi em] 身后扣好。接着，[rubi ey] 拿起一条黑色吊袜带，沿着 [rubi eir] 纤细的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("光洁无毛的");
         }
         else
         {
            outputText("覆着毛发的");
         }
         outputText("双腿往上拉，直到它服帖地箍在 [rubi eir] 腰间。配套的黑色长袜也很快穿好，由吊袜带固定住。接下来是一条黑色内裤，[rubi ey] 将它沿着 [rubi eir] 双腿往上拉起，让它紧紧贴住 [rubi eir] 丰满的臀部。你不禁怀疑这一切和西装有什么关系，但随后你又想起了自己面对的是谁。");
         outputText("[pg]最后，鲁比终于开始穿真正的西装，先是一件简单的白色纽扣衬衫。随后是西裤，鲁比利落地把衬衫下摆塞进裤子里。最后穿上黑色外套，松松地罩在 [rubi eir] 身上。鲁比又穿上一双高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟被切掉，好给 [rubi eir] 恶魔般的足跟腾出空间，");
         }
         outputText("然后迅速把 [rubi eir] 头发向后梳拢。总的来说，[rubi ey] 看起来就像个穿着男朋友衣服的女孩……也就是说，相当性感。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = fancyDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnADressYouBimbo() : void
      {
         var date1:Function;
         var minidress:Boolean;
         var _g1:Rubi;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿迷你连衣裙的样子。[say:哦，就是我们一起买的那件可爱小裙子？当然！它超可爱的！]");
         outputText("[pg]这条无肩带的淡粉色连衣裙实在没多少布料，鲁比只是拿出那截短短的中空布筒，从[rubi eir]身上套上去，在[rubi eir][rubi breasts]周围稍微调整了一下，又往下拉到勉强还算得体的位置，虽然你很确定这状态维持不了多久。毕竟，[rubi ey]可没穿任何胸罩或内裤。不过，鲁比还是又穿上了一双粉色高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) > 0)
         {
            outputText("，鞋跟被去掉了，好给[rubi eir]自己的恶魔足跟腾出空间");
         }
         outputText("。");
         outputText("[pg]随后鲁比摆了好几个姿势，让你好好欣赏了一番[rubi eir]几乎没被遮住的身体。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         _g1 = this;
         minidress = true;
         date1 = function():void
         {
            _g1.exhibitionistDate(minidress);
         };
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function putOnADashingOutfitYouWhore() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿上那套帅气的衣服。[say:哦，今天是想来点海盗式劫掠，抢抢人家的屁股吗？][rubi ey]带着狡黠的微笑问道。");
         outputText("[pg]鲁比一开始拿出的，似乎是你见过布料最少的细带丁字裤。[rubi Ey] 套进那条小得可怜的内裤里，把它往上拉，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("把[rubi eir]肉棒牢牢塞进遮住[rubi eir]胯间的三角布料里，");
         }
         outputText("细绳则紧紧嵌进鲁比的臀缝里。接着鲁比挑出一条小得不可思议的皮裤。[rubi Ey]一条腿一条腿地穿进去，费力地把那条紧身裤拉过[rubi eir]光滑的大腿和有型的屁股。中途你也搭了把手，帮忙把裤子往上提，好让鲁比把扣子扣好。最终，那条皮裤像第二层皮肤一样紧贴着鲁比的双腿，把[rubi eir]屁股、大腿和小腿的每一道曲线都勾勒了出来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("，更别提[rubi eir]胯间那相当可观的一大包了");
         }
         outputText("。");
         outputText("[pg]你那恶魔变形者情人从周围几乎无穷无尽的衣架上挑出一件衣服，一件白色的丝绸衬衫。放弃了通常的胸罩，[rubi ey]穿上衬衫，由于上面没有扣子，就在底部打了个结。这套衣服整体上性感得要命，展示了[rubi eir]腰腹，并露出了顺着[rubi eir]" + rubiChest() + "流淌而下的乳沟。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("再加上胯间那明显的大鼓包，鲁比看起来真像个潇洒帅气、只是有点淫荡的女海盗。");
         }
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = iceCreamDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function popButtjobs() : void
      {
         get_images().showImage("rubi-pop-buttjob");
         clearOutput();
         rubiSprite();
         outputText("不，你觉得鲁比最近表现得这么棒，[rubi ey]绝对值得射出来。你把拇指更深地探进[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("屁股");
         }
         else
         {
            outputText("小穴");
         }
         outputText("，找到了[rubi eir]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("前列腺");
         }
         else
         {
            outputText("G点");
         }
         outputText("，并围着它打圈揉弄，让鲁比那沾得一片狼藉的嘴唇里拖出一声长长的呻吟。你每一次顶进鲁比柔软的臀肉，手指就围着[rubi eir]最敏感的地方再画上一圈，直到你感觉到[rubi eir]的身体开始绷紧。");
         outputText("[pg]你对爱人的身体再熟悉不过，很清楚[rubi ey]什么时候快要高潮。你等待着那个完美的瞬间——[rubi eir]的身体绷到最紧，背脊弓起，脚趾蜷缩，嘴张成完美的O形，那双含弄过肉棒的嘴唇微微颤抖，正悬在高潮边缘。就在时机恰到好处的一刻，你用力按下那个最柔嫩的点，狠狠将[rubi em]推过了界限。鲁比喊叫出声，那是一声高亢而柔媚的叫喊，随后[rubi ey]咬住了[rubi eir]的嘴唇。");
         outputText("[pg]鲁比的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("小穴紧紧夹住你的拇指，猛地喷涌出来，把你的手裹满[rubi eir]滑腻的淫液");
         }
         else
         {
            outputText("后穴颤抖着，像是想把你的拇指吸得更深，随后又紧紧夹住，滑腻的液体漏得你满手都是");
         }
         outputText("。[rubi Eir]整个身体都在高潮中抽搐，一条性感的腿突然不受控制地前后颤动。鲁比抓紧一只枕头，咬住它，压下又一声高潮的呻吟。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("在[rubi em]身下，[rubi eir]的肉棒猛地抽动，射出一股珍珠白的精液，溅在下方的沙发上");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 5)
            {
               outputText("，紧接着又是一股更强劲的精液，溅在[rubi eir]腹部，把[rubi eir]的[rubi breasts]也裹上了精液");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 7)
            {
               outputText("，紧接着又是一股更强劲的精液，然后是第三股、第四股。转眼间，鲁比的整个躯干，连同[rubi eir]的[rubi breasts]，几乎都被精液镀上了一层");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
            {
               outputText("，随后又接连射出好几股，而且每一股似乎都比上一股更有力。每一次喷射都让鲁比的身体抽搐、战栗，直到[rubi eir]整个躯干，还有沙发，都被那股带着麝香味的精液覆盖");
            }
            else
            {
               outputText("，随后又是十几股，每一股都比上一股更浓、更有力。鲁比的肉棒像[rubi eir]的身体一样不受控制地抽动着，把整张沙发、[rubi eir]整个上半身，甚至[if (metric) {一米多|五英尺}]外的墙面都沾上那股麝香味的东西");
            }
         }
         outputText("。");
         outputText("[pg]看着鲁比那副高潮得如此激烈的模样，你也感觉自己的高潮正在逼近。[rubi Eir]的身体脸朝下趴在沙发上，翘臀高高抬起，而你则在[rubi eir]柔软的臀瓣间磨蹭着肉棒。余韵带来的细小快感仍在[rubi eir]体内一阵阵荡开；你用力抓住一边臀肉，尽可能向上挺动，体内像是有一道堤坝突然崩开。你的[balls]");
         if(get_player().balls > 1)
         {
            outputText("翻腾起来");
         }
         else
         {
            outputText("翻腾起来");
         }
         outputText("，快感阵阵；你的[cock biggest]猛地硬挺起来，你发出一声悠长的叹息，肉棒随之爆发，向上射出精液，立刻溅在鲁比的尾巴和背上，又顺着[rubi eir]丰满的臀瓣滴落下来。");
         outputText("[pg]你立刻把鲁比转过身来。尽管[rubi ey]还没从自己那场撼动心神的高潮中缓过来，[rubi ey]似乎还是明白了你的意思，用已经沾满肉棒痕迹的嘴唇裹住[cockHead biggest]；你的肉棒疯狂抽搐，一股又一股甜腻的精液喷进鲁比等候着的嘴里。[rubi Ey]");
         if(get_player().cumQ() <= 50)
         {
            outputText("一口气全吞了下去，脸上露出一丝小小的得意");
         }
         else if(get_player().cumQ() <= 150)
         {
            outputText("艰难地一口咽下，喉咙都被撑得发紧；等[rubi ey]终于不再喘气时，脸上浮现出一抹小小的得意笑容");
         }
         else
         {
            outputText("来多少吞多少，一口接一口的精液几乎像是被直接灌进[rubi eir]胃里。量实在太多，[rubi ey]吞到一半就忍不住笑了起来，为自己能接下这么大一发而自豪");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("。灌下这么多之后，你确信鲁比现在确实鼓起了一点小肚子，简直像是[rubi ey]已经怀了好几个月");
         }
         outputText("。");
         outputText("[pg]最后，又一股精液喷出，落在你的爱人脸上。你侧身滑倒在舒适的沙发上，彻底精疲力尽。鲁比却似乎还精力十足，接下来的几分钟里，[rubi ey]尽职尽责地舔遍你的[cock biggest]，把上面的体液清理干净，直到它在你腿间显得光亮又干净。");
         outputText("你笑着吻了吻这个恶魔" + rubiMF("男孩","女孩") + "，说自己能和[rubi em]在一起有多么幸运。");
         outputText("[pg][say: 不，宝贝，能遇见你才是我的幸运，][rubi ey]说道，一边把[rubi eir]赤裸的身体偎进你怀里。你们两个就这样在性爱后的慵懒睡意中慢慢睡去。");
         get_player().orgasm("Generic");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,608,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playDressUp() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你看了看鲁比收藏的大量衣服。你想让鲁比穿上哪一套？");
         outputText("[pg]<b>鲁比的衣柜里有：</b>");
         menu();
         closetOption("Uniform","A Waitress\'s Uniform");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100)
         {
            closetOption("性感制服","A Risque Waitress\'s Uniform");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,612) == 1)
         {
            closetOption("西装","Suitclothes");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,618) == 1)
         {
            closetOption("帅气套装","A Dashing Outfit With Tight Leather Pants");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,615) == 1)
         {
            closetOption("抹胸上衣","A Tube Top");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,617) == 1)
         {
            closetOption("舞会长裙","A Long Ballroom Dress");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,614) == 1)
         {
            closetOption("科奇里服装","A Green Adventurer\'s Outfit");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,619) == 1)
         {
            closetOption("护士装","A Skimpy Nurse\'s Outfit");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,620) == 1)
         {
            closetOption("泳装","Slutty Swimwear");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,616) == 1)
         {
            closetOption("连体衣","A Sheer Bodysuit");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1013) == 1)
         {
            closetOption("束身衣","An Inquisitor\'s Corset");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,613) == 1)
         {
            closetOption("性癖服饰","Rubber Fetish Clothes");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1012) == 1)
         {
            closetOption("拘束带","Bondage Straps");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,625) == 1)
         {
            closetOption("艳俗短裙","A Bimbo Minidress");
         }
         setExitButton("返回",rubiAppearance);
      }
      
      public function pimpOutRubi() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你认真想了很久，把各种可能都琢磨了一遍。随后你又想到另一件事。她想要有人帮她控制欲望，那为什么不趁机赚点钱呢？你解释说，她想跟谁睡都可以，不过她也可以为自己的时间收费。毕竟，如果要做自己喜欢的事，那顺便拿点报酬也没什么不好。");
         outputText("[pg]鲁比想了想，最后开心地点点头，[say:哦，这主意太棒了，宝贝！那我就会像埃德琳一样了！而且你每次过来，我也会把你的“分成”给你。]她咯咯笑着，直接在你唇上亲了一口。[say:噢，我还需要更多衣服、化妆品，还有……]她的声音渐渐低下去，兴奋地匆匆跑向自己的卧室。");
         outputText("[pg]那事情就这么定了，鲁比会正式开始接客，并把收益分给你。既然已经安排妥当，你决定让她安安静静地翻自己的衣柜。你走出屋子，返回营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,621,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pickAnItemToFeedRubi() : void
      {
         var itype10:ItemType;
         var _g10:Rubi;
         var itype9:ItemType;
         var _g9:Rubi;
         var itype8:ItemType;
         var _g8:Rubi;
         var itype7:ItemType;
         var _g7:Rubi;
         var itype6:ItemType;
         var _g6:Rubi;
         var itype5:ItemType;
         var _g5:Rubi;
         var itype4:ItemType;
         var _g4:Rubi;
         var itype3:ItemType;
         var _g3:Rubi;
         var itype2:ItemType;
         var _g2:Rubi;
         var itype1:ItemType;
         var _g1:Rubi;
         var itype:ItemType;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         var _loc1_:ButtonDataList = new ButtonDataList();
         menu();
         if(!rubiBimbo() && !rubiIncubus() && rubiAffection() >= 100)
         {
            outputText("你可以给鲁比一些男魅魔药剂，让[rubi em]变得更有男子气概，但也更加腐化；或者给鲁比一份傻妞药剂，把[rubi em]变成性感火辣的女性尤物。[pg]");
         }
         outputText("你要给[rubi em]什么？");
         if(!rubiBimbo())
         {
            _g = this;
            itype = get_consumables().BIMBOLQ;
            _loc1_.add("傻妞液",function():void
            {
               _g.giveRubiATFItem(itype);
            },get_player().hasItem(get_consumables().BIMBOLQ) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().BIMBOLQ));
         }
         _g1 = this;
         itype1 = get_consumables().INCUBID;
         _loc1_.add("男魅魔药剂",function():void
         {
            _g1.giveRubiATFItem(itype1);
         },get_player().hasItem(get_consumables().INCUBID) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().INCUBID));
         _g2 = this;
         itype2 = get_consumables().P_DRAFT;
         _loc1_.add("纯净药剂",function():void
         {
            _g2.giveRubiATFItem(itype2);
         },get_player().hasItem(get_consumables().P_DRAFT) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().P_DRAFT));
         _g3 = this;
         itype3 = get_consumables().SUCMILK;
         _loc1_.add("魅魔乳液",function():void
         {
            _g3.giveRubiATFItem(itype3);
         },get_player().hasItem(get_consumables().SUCMILK) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().SUCMILK));
         _g4 = this;
         itype4 = get_consumables().P_S_MLK;
         _loc1_.add("纯净魅魔乳液",function():void
         {
            _g4.giveRubiATFItem(itype4);
         },get_player().hasItem(get_consumables().P_S_MLK) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().P_S_MLK));
         _g5 = this;
         itype5 = get_consumables().PURPEAC;
         _loc1_.add("纯净桃子",function():void
         {
            _g5.giveRubiATFItem(itype5);
         },get_player().hasItem(get_consumables().PURPEAC,5) ? "" : "你的这个物品数量不够。","",get_player().hasItem(get_consumables().PURPEAC,5));
         _g6 = this;
         itype6 = get_consumables().EQUINUM;
         _loc1_.add("马化药剂",function():void
         {
            _g6.giveRubiATFItem(itype6);
         },get_player().hasItem(get_consumables().EQUINUM) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().EQUINUM));
         _g7 = this;
         itype7 = get_consumables().W_FRUIT;
         _loc1_.add("猫须果",function():void
         {
            _g7.giveRubiATFItem(itype7);
         },get_player().hasItem(get_consumables().W_FRUIT) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().W_FRUIT));
         _g8 = this;
         itype8 = get_consumables().REDUCTO;
         _loc1_.add("缩形膏",function():void
         {
            _g8.giveRubiATFItem(itype8);
         },get_player().hasItem(get_consumables().REDUCTO) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().REDUCTO));
         _g9 = this;
         itype9 = get_consumables().GROPLUS;
         _loc1_.add("Gro+",function():void
         {
            _g9.giveRubiATFItem(itype9);
         },get_player().hasItem(get_consumables().GROPLUS) ? "" : "你没有这个物品。","",get_player().hasItem(get_consumables().GROPLUS));
         _g10 = this;
         itype10 = get_consumables().TRAPOIL;
         _loc1_.add("伪娘油",function():void
         {
            _g10.giveRubiATFItem(itype10);
         },get_player().hasItem(get_consumables().TRAPOIL) ? "" : "你没有这件物品。","",get_player().hasItem(get_consumables().TRAPOIL));
         _loc1_.submenu(rubiAppearance);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noBimboNTR() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你抱起双臂，摇了摇头。你告诉她，如果这段关系还想继续，她就必须对你保持忠诚。性玩具和自慰足够用来控制她的[say: 欲望]了。她看起来有些难过，但还是一边听你说，一边点了点头。");
         outputText("[pg][say: 当然，宝贝。你说什么都行，]接着她咯咯笑了起来，[say: 至少每次你进城的时候，我都还能盼着见到你。]");
         outputText("[pg]事情就这么定了，鲁比会克制自己，不再到处跟人上床。既然已经说清楚，你决定让她先穿好衣服，自己也好好想想。你走出房子，返回营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,621,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function interruptTheNTRsYouCrazyFool() : void
      {
         clearOutput();
         rubiSprite();
         outputText("谁也别想把鸡巴插进你的");
         if(get_silly())
         {
            outputText("老婆");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("——只要你还说了算！你从藏身处冲出来，大喊一声警告，然后闯进那栋鲜艳的粉红色房子。");
         outputText("[pg]鲁比吓得轻轻一跳，坐了起来，但她的手指仍然深深埋在小穴里。那个男人则转过身，上下打量着你，像是在估量什么。不出所料，他并不是人类。虽然他有一张人类的脸，但你看到他头上竖着狼一样的耳朵，一条蓬松的灰白尾巴从裤子上的洞里伸出来。那个狼人不屑地嗤笑道，[say:行了，滚出去吧。我还有东西要看，还有人要干呢。]");
         if(get_player().get_str() >= 61)
         {
            outputText("[pg]被他这样打发走激怒了，你挥拳打向那男人。趁他猝不及防，你一拳把他打倒在地，发出一声沉闷的砰响。他双手抱着头缓了一会儿。你用[foot]顶了顶他的肚子，叫他赶紧滚。他嘟囔着抓起衬衫，头也不回地溜走了。");
         }
         else
         {
            outputText("[pg]被他这样打发走激怒了，你挥拳打向那男人。你的拳头结结实实砸在他的下巴上，他踉跄着后退了一步。他惊讶地看了你一秒，随后笑了起来，[say:有种啊，小子，不过让我教教你真正的男人是怎么做的。]");
            if(get_player().get_spe() < 61)
            {
               outputText("[pg]狼人朝你挥来一记右勾拳，你试图低头躲开，却还是被正正擦中下巴。你像一袋土豆似的倒了下去，眼前一阵天旋地转。你挣扎着想站起来时，看见鲁比怒气冲冲地从沙发上下来，把一件又一件东西砸向袭击你的人。你几乎看不清那些东西是什么，直到一根黑色马形假阳具从你身边滚过。");
               outputText("[pg]狼人抬手护住自己，你听见他说，[say:行了，行了，我走！疯婊子！]然后他冲出了门。听见门关上后，你感觉到有双手扶住了你的胳膊，鲁比把你扶到沙发上坐下。过了一会儿，你缓过神来，视线恢复正常，也没觉得有什么大碍。");
            }
            else
            {
               outputText("[pg]狼人朝你挥来一记右勾拳，但你轻松地俯身躲过，并趁他失去平衡时扫倒了他的双腿。他像一袋土豆似的摔倒在地。你咧嘴一笑，顶了顶他的肚子，叫他赶紧滚。他嘟囔着抓起衬衫，头也不回地溜走了。");
            }
         }
         doNext(NTRbimboBitchResolution);
      }
      
      public function initializeRubi() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,610) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,5);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,1);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,7);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,995,1);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1014,1);
      }
      
      public function iceCreamDate() : void
      {
         var _loc2_:* = null as IMap;
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2);
         statScreenRefresh();
         rubiSprite();
         outputText("[pg]你带着刚打扮好的爱人走出小屋。你们手牵着手走在特尔阿德雷的街道上，寻找一个适合安静用餐的好地方。路过鲁比工作的面包店后，你看见一家小店，招牌上写着“冰淇淋店”。鲁比往店里看去，[rubi eir]眼睛睁得大大的，问道：[say: 哦！我们能进去一下吗？]");
         outputText("[pg]你点点头，两人一起走了进去。店面不大，只有几张桌子，大多都空着。店铺最里面有个柜台，后面摆着好几桶冰凉绵密的美味。站在柜台后的[if (nofur) {狐人男子|雄性狐狸}]告诉你们随便坐，他马上就会过来点单。你带着鲁比来到窗边的一张桌子旁坐下，随意聊着天，直到那只狐狸走近。");
         outputText("[pg][say: 啊，我要一份芭菲！谢谢！]鲁比立刻说道。你也给自己点了一份，没过多久，那只狐狸就回来了，把两份芭菲放到你们桌上。");
         outputText("[pg]鲁比的眼睛睁得像碟子一样大，[rubi ey]拿起[rubi eir]勺子就挖了起来，你也一样。[say: 我喜欢来这里，][rubi ey]说道，[say: 这里是特尔阿德雷少数有冰淇淋和冷甜点的地方之一。真的很棒。我有时候会来这里坐着，看人来人往。以前在我的村子里，我也常和爸爸妈妈一起这样……]鲁比突然安静了下来，但当[rubi ey]转头看向你时，[rubi ey]却忍不住咯咯笑了起来。");
         outputText("[pg]你有些困惑，问[rubi em]什么事这么好笑。[say: 你脸上沾了点冰淇淋，][rubi ey]一边笑一边说道。你擦了擦自己的脸和鼻子，试图把那些甜腻的东西弄掉。");
         outputText("[pg]就在你确信已经全擦干净时，鲁比止住笑声，说道：[say: 你漏了一处。]你还没来得及问在哪里，鲁比就隔着桌子探过身来，正正吻上你的嘴唇，吮走了一小团冰淇淋——你甚至不确定那团冰淇淋一开始是否真的存在。鲁比满脸通红，坐回[rubi eir]座位上，小声嘟囔道：[say: 擦掉了。]");
         outputText("[pg]接下来的约会里，你们一边看着窗外来往的人群，一边偶尔替他们编出人生经历、目标和感情关系。鲁比那无可救药的浪漫一面在这里彻底绽放。在[rubi eir]的想象中，似乎每个人都在思念着另一个人。有单恋，有三角恋，有四角恋，有外遇，还有更多更多。每一个从窗前经过的人，看起来都像是为某个人——或好几个人——神魂颠倒。鲁比为他们编出完整的背景故事、第一次约会、在夕阳下的初吻，以及共度的第一个夜晚。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1006) == 0)
         {
            outputText("[pg][rubi Ey]在这一切发生时看向你，把一只手搭在你的手上，十分真诚地说道：[say: 我……谢谢你陪我做这些。这对我来说意义很大。以前我经常和爸爸妈妈一起这样，你知道的，在恶魔袭击之前。虽然他们已经不在我身边了，但能再次和别人一起做这些，真的对我很重要。]");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1006,FlagDict_Impl_.arrayReadInt(_loc2_,1006) + 1);
         }
         outputText("[pg]不过，你们的帕菲并不是无穷无尽的。等你们把这份层层叠叠的冰冻甜点吃完后，似乎也该回去了。你们再次牵起手，走出店门，默默回到鲁比的住处，只是待在彼此身边便已心满意足。");
         outputText("[pg]一回到屋里，鲁比就瘫在沙发上，[rubi eir]脸上挂着恶作剧般的笑容。[say: 那么，你打算给我一个美好的晚安“吻”吗？]");
         rubiSexMenu();
         setExitButton();
      }
      
      public function hypnoBimboficationForRubiSloots() : void
      {
         clearOutput();
         outputText("你从你的[armor]中滑出，饥渴地在空气中吐着信子，品尝着这个娇小男孩的欲望。他被你深深吸引，却又努力想表现得文雅一些。这在某种程度上很可爱，但你更希望他能对自己的冲动更……诚实一点。你想要这个可爱的、");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("阴柔男孩");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
         {
            outputText("长着鸡巴的女孩");
         }
         else
         {
            outputText("小骚货");
         }
         outputText("准备好公开对你的鸡巴发情，每次你出现就缠上来，在大庭广众之下摸你的胯间鼓包。他不该再那么在意体面，而该把心思更多放在性欲的满足和魅力上……没错。");
         outputText("[pg]鲁比张着嘴，入迷地看着你。他嘴唇翕动，结结巴巴地想说话，却一个字也说不出来。其实这也难怪——你那根又大又硬的家伙");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("已经甩了出来，随着你柔韧的动作摇晃着，而他有的只是相比之下小得可怜的小鸡巴。你借着娜迦身体赋予你的蛇一般的优雅，带动全身有节奏地摇摆，同时迎上他的目光。你很清楚自己想把他逼进怎样堕落的境地，随即感到一股");
         if(get_game().jojoScene.isJojoCorrupted())
         {
            outputText("熟悉的");
         }
         else
         {
            outputText("陌生的");
         }
         outputText("黑暗力量在体内涌起。");
         outputText("[pg]鲁比无力抗拒你催眠般的凝视。你的双眼仿佛燃起缕缕黑暗、近乎恶魔般的力量，开始迷住这个脆弱的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
         {
            outputText("男娘");
         }
         else
         {
            outputText("双性人");
         }
         outputText("。他凝视你的力量越久，下巴就越是松弛无力。");
         outputText("[pg]你用安抚的话语让他平静下来，并引导他的注意力。");
         outputText("[pg]他无声地动着嘴唇：[say:……可以相信你……]");
         outputText("[pg]你滑得更近了，然后");
         if(get_player().get_tallness() >= 72)
         {
            outputText("俯下身");
         }
         else
         {
            outputText("向前探身");
         }
         outputText("，让他可爱的脸离你的脸只剩[if (metric) {几厘米|几英寸}]远。在这期间，你始终维持着那令人着迷的摇摆，让他的目光懒懒地追随着你的身体，一点点陷得更深。鲁比松弛的嘴唇间垂下一缕口水，挂到了下巴上；你想象着他的意识也正以差不多的方式从体内流失，顺着身体泄向他的[rubi cock]。");
         outputText("[pg]你无暇往那只手上瞥一眼，但你游移的手很快就摸到他硬了起来。事实上，他硬起来的速度快得惊人。只用了几秒，他就涨到了最大尺寸，并开始在你手中阵阵跳动。湿意几乎立刻渗过他的衣物。那东西又滑又黏——是前列腺液。");
         outputText("[pg]你深深凝视着这个越来越顺从的男孩空洞的双眼，意识到自己驾驭住的那股黑暗力量，已经把你开始的催眠强化到了近乎心灵感应的程度。鲁比已经彻底无望地被迷住了，而且陷得如此之深，以至于他真的正让自己的清醒思绪化作前列腺液，从屌里滴出来。你的力量究竟能做到什么地步？只有一种方法能测试出来。");
         outputText("[pg][say: 鲁比，]你开口唤起他的注意，[say: 你能感觉到我眼睛的力量，对吧？它们束缚着你，控制着你，引导你进入这种幸福、无念、不断滴落的状态。]");
         outputText("[pg]鲁比的回答含糊不清。[say: 嗯啊啊啊…………眼睛好漂——亮。]");
         outputText("[pg][say: 我知道它们很漂亮，宠物。专注在它们的力量上。它们强大到你能感觉它们进入了你的体内，强大到即使我移开视线，你也依然能感觉它们钻进你身体深处，把你填满，让你体内除了我的控制之外，再也容不下任何东西。]");
         outputText("[pg][say: 容不下……]他低低呻吟着回答。");
         outputText("[pg]你指示道，[say: 没错，我的眼睛就在你体内，控制着你。我要闭上外面的这双眼睛，但它们会一直在那里，在你体内，牢牢盯住你，让你舒服得思绪都融化成黏腻、滴落、性感的臣服。]");
         outputText("[pg][say: 好舒……服……性感……]鲁比喘息着，在你手中微微抽动。你眨了眨眼，低头看去。他的下装已经完全被前液浸透了！他滴得异常快——比以往任何时候都快。你的手掌刚一碰上去就立刻湿透了，于是你把手抽开，在这个被迷住、很快就会沦为小骚货的家伙衣服上擦干。他依旧空洞地望着前方，一动不动，只有臀部已经开始细微地扭动，向上抬起，仿佛想要挺胯去蹭空气。你能看见他的大腿因渴求而颤抖；这个可怜的小");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
         {
            outputText("男娘");
         }
         else
         {
            outputText("带屌女孩");
         }
         outputText("脑子肯定相当活跃，才会让他滴得那么快。");
         outputText("[pg]你最好处理一下这个问题。你用尾巴缠住他毫不反抗的双臂，又一路蜿蜒向上，直到圈住他的脖子和额头。就位之后，你集中力量开口，话语中压着超自然的分量：[say: 哦，鲁比，你的脑子很习惯一直运转，对吧？可是，让它那样继续下去实在太乱了。]你把蛇一般的尾尖扭到他耳边，钻了进去。[say: 现在没必要那样了，鲁比。不去思考的感觉很舒服，对不对？]");
         outputText("[pg]已经说不出话的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("鸡巴-");
         }
         outputText("女孩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
         {
            outputText("气男孩");
         }
         outputText("只是微微点头作答。");
         outputText("[pg][say:你想一直都保持这种感觉吗——开心又无忧无虑？]你问道。");
         outputText("[pg]鲁比点了点头，这次用力了一些。");
         outputText("[pg]你的脸上浮现出捕食者般的笑容。[say:这很正常。每个人都想快乐，而我会帮你变得超——开心。]你把自己的尾巴想象成某种心灵感应天线，一边继续说话、塑造这个倒霉的受害者，一边把思绪通过它传导出去。[say:你现在感觉很好，是因为你兴奋又脑袋空空，鲁比。是你的思维阻止你体验这种彻底的幸福。就算现在，它也还在干扰，所以我才不得不把你的思绪重新引导到你的鸡巴里，把这份礼物送给你。]");
         outputText("[pg]你本以为这不可能，但鲁比的表情又变得更加松弛了。");
         outputText("[pg][say:我可以帮你解决这个问题，鲁比，但我需要你的配合。我需要你自己想要它。我需要你想要一直发情、没有杂念、一直幸福。你必须真心想要一直感受这种美妙，而且这感觉真的超——棒，对吧？]");
         outputText("[pg]鲁比流下口水。[say:……是的……]");
         outputText("[pg]你回答道：[say:乖男孩。我要你闭上眼睛，继续在心里看着我的眼睛，感受插在你耳朵里的尾巴把力量喂给它们，让它们变得如此令人无法抗拒，以至于它们的思想和命令都会变成你自己的。感受我正在接管你，鲁比，然后彻底敞开自己，让我的心智引导你的心智，走向只属于你的极乐。]");
         outputText("[pg]他没有开口回答，但你几乎立刻感觉到了变化。你能感觉到他的思绪在你周围旋转，仿佛消失进一大缸像糖蜜般黏稠的胶质里，而他的心智则成了你想象中双手里的软泥。那里已经连象征性的抵抗都不剩了——只有彻底、完全的臣服。一声呜咽从他唇间滑出。他的肉棒颤抖着、抽动着，硬得仿佛随时都会爆开，而他的睾丸也意味深长地震颤着，正处在倾泻的边缘。");
         outputText("[pg][say:没错，乖男孩，]你嘶声说道，同时用心灵感应把他的心智变成你的游乐场。自我意识？你的玩具不需要那种东西。你把那块空间改造成追寻并享受肉体快感的区域，把原本充满忧虑的中心变成一枚精神上的阴蒂。接着，你找到了鲁比的性欲。一点黑暗力量轻而易举就让它膨胀起来，哪怕你得让出他的一点理性能力来腾出空间。他的智力像多余的精液一样，从他的鸡巴里滴落出去。你轻声安抚着他，你声音中的震颤让他的眼睛因惊叹而颤动。");
         outputText("[pg][say:你为我做得真好，鲁比，真的非常好。]你一只手抚摸着他的肉棒，继续动手。这个骚货男孩的心智还没完全准备好。他那些温顺的小癖好，实在配不上一个渴求肉棒的奴隶。如果再牺牲一点他的智力，换来一份足以媲美恶魔、对肉棒和小穴的堕落渴望，也没什么关系吧？");
         outputText("[pg]这样好多了。你低声说道：[say:你已经能感觉到这些变化了，对吧，我不知羞耻的小骚货？它们让你比以往任何时候都更饥渴、更兴奋，只等你的高潮把我的改造烙印进去，把你不可逆地变成一个渴求肉棒的泄欲玩具。]你又稍稍加快速度撸动了一会儿，才松开他。到这时候，他的前列腺液简直像尿一样往外喷，而且那液体甚至开始因为混进精液而变得有些灰白。");
         outputText("[pg]他的下巴绷紧，松弛下来却依旧可爱的下颌间漏出哀求般的呻吟和呜咽。他听起来几乎像只小狗。你绕到另一侧，把嘴唇贴上他的耳朵，低语道：[say:你能感觉到自己在跳动吗，宠物？你能感觉到胯间那美妙的酸胀吗？那股需求正酥麻地催促着你，把你推向一个会永远改变你的高潮。]你舔了舔他的耳垂。[say:来吧，小狗。为我抽动。为我跳动。为我释放出来。]");
         outputText("[pg]鲁比从头到尾都没有碰自己，却发出一声叹息。你及时低头看去，正好看见他的[rubi cock]把一道珍珠色的臣服射到地板上。那东西浓稠得几乎能称作一根缆绳。这个骚货简直是在把自己所有烦恼都射出来，把每一份过去的忧虑和牵挂，都化作象牙白的狂喜液流喷射而出。他的腰胯开始痉挛般颤抖着挺动，彻底屈服，而他的眼睛早已翻进眼眶深处，你的魔法也如你所言牢牢固定下来。");
         outputText("[pg]等他结束时，地上已经积了一大滩，而鲁比的肉棒依旧毫不萎软，硬得惊人，随时准备迎接第二轮。");
         outputText("[pg]不过，还是少了点什么。一个吞精、永远发情的玩具，应该再漂亮一点。你更深地汲取体内那口禁忌力量之井，把双手放到这个浸满幸福的男孩胸前。他应该有奶子：又大又柔软、人人都会想拿来干的奶子。他也会愿意让别人这么做；你对此很确定。你捻弄着鲁比的乳头，轻柔却坚定地拉扯那小巧的乳尖，感觉到指尖下的肉逐渐充盈起来，像即将绽放的花苞一样鼓胀，每过一秒都变得更加丰满，你不禁露出笑容。很快，你掌心里就捧满了苍白的肉，可这还不够。你鼓励似的揉捏它们，而这个伪娘的肉体也顺从地回应着，向外隆起成圆润丰满的胸脯。你托起它们，在掌心里晃了晃。它们大概有C罩杯了。");
         outputText("[pg]与此同时，这个即将变成荡妇傻妞的兴奋家伙因为这种感觉第二次射了出来，他太激动了，被揉弄自己的——不……她的奶子时根本忍不住。鲁比正在变成一个柔顺、渴求性爱的扶她，而你最好也把她当成那样看待。不过，C罩杯还不够做一场像样的乳交，于是你更加集中精神，把比糖蜜还浓稠的腐化之力直接灌进她颤动、膨胀的奶子里。它们高高挺立在她胸前，骄傲地膨胀着，越过D罩杯，最终变成一对完美的DD罩杯——作为起点，这个尺寸不错。");
         outputText("[pg]鲁比虚弱地颤抖着，慢慢恢复意识，看向你。她的眼神比之前稍微呆滞了一些，也没那么好奇了，但其中却明亮地燃烧着幸福与欲望。她还没来得及说话，你就把一根手指按在她唇上，让她安静下来。变化背后的一缕黑暗流入她的嘴唇，把它们填充成一对微微嘟起、迎接肉棒的软枕。完美。");
         outputText("[pg][say:光是看着你，我就已经发情了。你打算怎么处理？]");
         outputText("[pg]鲁比迫不及待地笑了。");
         outputText("[pg]<b>鲁比现在成了一个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
         {
            outputText("扶她");
         }
         outputText("傻妞！她会变得更加欲求不满、胸大无脑，不过这不正是你想要的吗？</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,610,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,5);
         dynStats(DynStat.Lust(1000),DynStat.Cor(10));
         rubiSexMenu();
         rubiAffection(100);
      }
      
      public function goOnAnAnalAdventureRubiNotReallyJustAnAdventurersOutfit() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿冒险者装的样子。[say: 啊，好呀，那我现在是不是要当勇者了？]鲁比攥起[rubi eir]纤巧的双手叉在腰上，问道。[saystart]鲁比，玛瑞斯勇者！恶魔杀手兼");
         if(get_silly())
         {
            outputText("老婆收集者！");
         }
         else
         {
            outputText("女人推倒者");
         }
         outputText("！听起来还挺有派头的，对吧？[sayend][rubi Ey]咯咯笑了一会儿，然后把衣服收拢起来。");
         outputText("[pg][rubi Ey]先穿上一件朴素、只带一点蕾丝装饰的白色胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，不过以[rubi eir]平坦的胸口来看，显然并不需要它");
         }
         outputText("。[rubi Ey]把[rubi eir]的手臂穿过肩带，熟练地扣好后背。接着是一条相配的内裤，[rubi ey]沿着[rubi eir]修长光滑的双腿往上套。[rubi Ey]把它拉到位，让它紧紧贴住[rubi eir]圆润可爱的屁股。");
         outputText("[pg]接下来穿的是一条棕色紧身裤。鲁比先把裤腿卷起来，然后坐到梳妆台前的座椅上，伸进一条腿，把裤腿一路放到膝盖，再用同样的方式穿好另一条腿。随后[rubi ey]站起身，把剩下的部分全都拉上去。它贴着[rubi eir]双腿和屁股的样子让曲线更显诱人，你忍不住舔了舔嘴唇。");
         outputText("[pg]最后穿上的是一件深绿色束腰外衣，鲁比只是把它从[rubi eir]头上套下去，再用一条皮带固定好。[rubi Ey]戴上一顶相配的绿色尖帽，帽尖逐渐收窄");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 1)
         {
            outputText("，遮住了[rubi eir]的猫耳");
         }
         outputText("。与这套衣服搭配的靴子长到小腿中部，由柔软上等的皮革制成");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟处还开了个洞，显然是为了让鲁比的恶魔足跟穿过去");
         }
         outputText("。等靴子也穿好后，趁你被[rubi eir]的屁股分散注意力时，鲁比不知从哪儿拿出一把木剑，为整套装扮画上句号。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = iceCreamDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function goInRubisClosetSoThatYouCanComeOutOfTheCloset() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你提出想看看鲁比的衣柜。[rubi Eir]眼睛一亮，兴奋地拍起[rubi eir]双手。[saystart]");
         if(rubiBimbo())
         {
            outputText("天哪！");
         }
         outputText("真的吗？就在这边！[sayend] 鲁比握住你的手，把你拖进卧室，又穿过另一道门。");
         outputText("[pg]你差点惊得下巴都掉到地上。鲁比的衣帽间恐怕有[rubi eir]卧室那么大！各式各样的长裤、衬衫、连衣裙、下装和上衣挂在房间两侧的衣架上，下面则摆着小抽屉柜，或是一排排各种款式的鞋子。平底鞋、高跟鞋、靴子、芭蕾舞鞋……几乎你能想象到的任何鞋子都能在这里找到，而且各种颜色一应俱全。对面那面墙的大部分都被一张巨大的梳妆台占据，上面有一面华丽的大镜子，台面上摆满了多到让你不知从何下手的化妆品。剩下的墙边空处则散布着几面全身镜，房间中央则完全空了出来。");
         outputText("[pg]鲁比在房间中央转了一圈，显然很高兴来到这里。你还没来得及说什么，鲁比就脱下了[rubi eir]现在穿着的衣服，把它整整齐齐地叠好放到一边，然后双手叉着[rubi eir]腰，骄傲地站在那里。[say: 所以，你想让我穿点什么吗？]");
         menu();
         addButton(0,"下一步",rubiAppearance);
      }
      
      public function giveRubiClothes(param1:ItemType = undefined) : void
      {
         clearOutput();
         rubiSprite();
         outputText("你把备用衣服递过去，鲁比的眼睛顿时亮了起来。[say:给我的？]这个小恶魔几乎是尖叫出声，欣喜若狂。[say:谢谢谢谢谢谢谢谢你！]");
         outputText("[pg]鲁比把这套衣服举到[rubi eir]身前，咧嘴笑道：[say:噢噢，我太喜欢了！我是说，我得拿去裁缝那儿改合身，但我真的超爱它！]");
         outputText("[pg]你不太明白[rubi ey]怎么会因为它这么兴奋，毕竟这不过是衣服而已，但你还是笑着点头附和，很高兴能让[rubi em]开心。");
         get_player().consumeItem(param1,1);
         if(param1 == get_armors().CLSSYCL)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,612,1);
         }
         else if(param1 == get_armors().RBBRCLT)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,613,1);
         }
         else if(param1 == get_armors().ADVCLTH)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,614,1);
         }
         else if(param1 == get_armors().TUBETOP)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,615,1);
         }
         else if(param1 == get_armors().T_BSUIT)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,616,1);
         }
         else if(param1 == get_armors().B_DRESS)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,617,1);
         }
         else if(param1 == get_armors().LTHRPNT)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,618,1);
         }
         else if(param1 == get_armors().NURSECL)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,619,1);
         }
         else if(param1 == get_armors().S_SWMWR)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,620,1);
         }
         else if(param1 == get_armors().I_CORST)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1013,1);
         }
         else if(param1 == get_armors().BONSTRP)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1012,1);
         }
         else if(param1 == get_armors().BIMBOSK)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,625,1);
         }
         rubiAffection(20);
         doNext(rubiAppearance);
      }
      
      public function giveRubiATFItem(param1:ItemType) : void
      {
         var _loc2_:* = null as IMap;
         var _loc3_:int = 0;
         clearOutput();
         rubiSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1011) == 0)
         {
            outputText("鲁比好奇地看着你递来的东西。[rubi Ey]把它拿在[rubi eir]手里翻来覆去，仔细观察着里面的液体。最后，[rubi ey]有些不安地问道：[say: 这会……改变我的身体吗？]");
            outputText("[pg]你慢慢点头，向这位年轻的恶魔变形者解释它的效果。你说明时，鲁比心不在焉地随着你的话点着[rubi eir]头。[say: 所以，你想让我改变？]你说完后，[rubi ey]开口道。[say: 我是说……我觉得现在这样也挺好，但如果你想让我改变……]鲁比抬头看着你，[rubi eir]眼中满是爱意。[say: 如果你希望我改变，我很乐意。][pg]");
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1011,FlagDict_Impl_.arrayReadInt(_loc2_,1011) + 1);
         if(param1 == get_consumables().SUCMILK || param1 == get_consumables().P_S_MLK)
         {
            if(param1 == get_consumables().SUCMILK)
            {
               outputText("你把那瓶乳白色液体递给鲁比。[rubi Ey]花了点时间读了读粉色标签，然后拔出软木塞，一口气把整瓶都喝了下去。");
            }
            else
            {
               outputText("你把那瓶纯化的乳白色液体递给鲁比。[rubi Ey]花了片刻读了读粉色标签，然后拔出软木塞，一口气喝光了整瓶。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 7 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 30 && get_hyper())
            {
               outputText("[pg]鲁比轻轻倒抽一口气，[rubi eir]双手立刻按向[rubi eir]胸口。就在你眼前，鲁比的乳房开始胀大，整整增大了一个罩杯。鲁比试探着捧起[rubi eir]乳房，适应着它们新的重量。");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,984,FlagDict_Impl_.arrayReadInt(_loc2_,984) + 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 4 && !get_hyper())
            {
               outputText("[pg]鲁比的[rubi cock]突然胀大，硬得发疼。[rubi Ey]握住它，随着它开始缩小，猛地呻吟出声；它至少缩短了[if (metric) {几厘米|一英寸}]，最后给[rubi em]留下了一根");
               _loc3_ = 985;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
               outputText(Math.round(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) * 10) / 10 + "英寸的阴茎。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) <= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("[pg]鲁比的肉棒微微胀起，它那[if (metric) {近三厘米|一英寸长}]的硬挺，此时让你想起一颗较大的阴蒂。然而，这状态并没有维持多久。这根[if (metric) {小得可怜|一英寸长}]的肉棒开始逐渐萎缩，缩回恶魔变形者的胯间，直到彻底干瘪消失。鲁比的手探进[rubi eir]大腿之间，想抓住[rubi eir]失去的男性象征，却什么也摸不到。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,0);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
               {
                  outputText("[pg]鲁比突然一颤，[rubi eir]唇间逸出一声轻柔的呻吟。[rubi Eir]手指探得更深，似乎伸进了[rubi eir]身体里！虽然看起来有些奇怪，但你确信，<b>鲁比长出了一个全新的阴道</b>。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,991,0);
               }
            }
            if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
            {
               outputText("[pg]鲁比突然一颤，[rubi eir]唇间逸出一声轻柔的呻吟。[rubi Eir]手指探进[rubi eir]大腿之间，似乎伸进了[rubi eir]身体里！虽然看起来有些奇怪，但你确信，<b>鲁比长出了一个全新的阴道</b>。[say: 噢，]鲁比说道，[rubi eir]的身体微微发颤。[say: 它好敏感！]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 0 && Utils.rand(3) == 0 && param1 == get_consumables().SUCMILK)
            {
               outputText("[pg]鲁比突然两脚交替跳了起来，猛地倒吸一口气。[say: 啊，疼，疼，疼！][rubi ey]喊道，一屁股坐到[rubi eir]光裸的屁股上。[rubi Ey]小心翼翼地抬起一只脚，检查脚跟和脚底。鲁比前后摇晃着，抱住[rubi eir]的脚；一个明显的凸起出现在脚跟上。很快，皮肤裂开，一根锋利的黑色尖角长了出来，向下指着。这样持续了一分钟后，鲁比忽然如释重负地叹了口气，痛苦的生长似乎终于平息。[rubi Ey]站起身来，那根尖角让[rubi em]站立和走路时都像穿着高跟鞋一样。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1001,1);
            }
            if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,988) == 0 && param1 == get_consumables().SUCMILK)
            {
               outputText("[pg]鲁比的双手突然猛地抬起，抱住[rubi eir]脑袋，像是头痛欲裂。[rubi Ey]盲目地到处摸索，想找出疼痛的来源，随后你看见了。两个小小的鼓包出现在[rubi eir]额头上，就在发际线处。它们越长越大，直到皮肤干净利落地裂开，露出闪亮的黑色骨质——角。它们向上、向后生长，形成浅浅的棱脊。不过，在完全越过[rubi eir]头顶之前，生长就停了下来。鲁比平静下来，站起身。[rubi Eir]双手抚过这对新东西的每一[if (metric) {厘米|英寸}]，一边望向镜子，为[rubi eir]恶魔般的外貌惊叹不已。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,988,1);
            }
            if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 1 && param1 == get_consumables().SUCMILK)
            {
               outputText("[pg]鲁比突然捂住[rubi eir]肚子，你注意到红色斑点开始出现在[rubi eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
               {
                  outputText("皮肤");
               }
               else
               {
                  outputText("皮毛");
               }
               outputText("。这些斑点很快扩散开来，迅速爬满了[rubi eir]全身。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
               {
                  outputText("与此同时，覆盖在[rubi eir]身上的丝滑柔软毛皮，似乎也随着这股红色异变的侵袭而开始脱落。");
               }
               outputText("没过多久，[rubi eir]原本光滑无毛的皮肤就变成了深红色，正好与[rubi ey]很久以前长出的那条黑桃形尾巴颜色相配。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,994,1);
            }
         }
         else if(param1 == get_consumables().INCUBID || param1 == get_consumables().P_DRAFT)
         {
            if(param1 == get_consumables().INCUBID)
            {
               outputText("你把那瓶乳白色液体递给鲁比。[rubi Ey]花了片刻读了读标签，然后拔出软木塞，一口气喝光了整瓶。");
            }
            else
            {
               outputText("你把那瓶纯化的乳白色液体递给鲁比。[rubi Ey]花了片刻读了读粉色标签，然后拔出软木塞，一口气喝光了整瓶。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 0 && !get_hyper())
            {
               outputText("[pg]鲁比轻轻倒抽一口气，[rubi eir]双手立刻按向[rubi eir]胸口。就在你眼前，鲁比的乳房开始变小，整整缩小了一个罩杯。鲁比试探着捧起[rubi eir]乳房，适应着它们减轻后的新重量。");
               _loc3_ = 984;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,0);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 12 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 20 && rubiGetCockType() == CockTypesEnum.HORSE || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 30 && get_hyper()))
            {
               outputText("[pg]鲁比的[rubi cock]突然肿胀起来，痛苦地硬了起来。[rubi Ey]握住它，随着它开始脉动，猛地发出一声呻吟；每一次跳动都让它变得更大，至少增加了一英寸，最终让[rubi em]拥有了一根");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,985,FlagDict_Impl_.arrayReadInt(_loc2_,985) + 1);
               outputText(Math.round(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) * 10) / 10 + "英寸的阴茎。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
            {
               outputText("[pg]鲁比倒吸一口气，[rubi eir]的双手猛地探到[rubi eir]双腿之间，慌乱地抓寻着什么。透过[rubi eir]的指缝，你看见了它——一截肉乎乎的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
               {
                  outputText("红色的");
               }
               else
               {
                  outputText("粉色的");
               }
               outputText("凸起物……一根崭新的阴茎！鲁比浑身一颤，[rubi eir]纤细的小手指环住了那根新长出来的、[if (metric) {十二厘米|五英寸}]长的阴茎。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,5);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,986,CockTypesEnum.HUMAN.get_Index());
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && Utils.rand(3) == 0)
            {
               outputText("[pg]鲁比颤抖着，[rubi eir]手探到[rubi eir]大腿之间，四处摸索着什么。[rubi Ey]疯狂地摸索，却显然什么也没找到。[say: 它……它不见了！][rubi ey]用颤抖的声音说道。[say: 我的小穴不见了！]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,1);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,991,0);
            }
            if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 1 && param1 == get_consumables().INCUBID)
            {
               outputText("[pg]鲁比突然捂住[rubi eir]肚子，你注意到红色斑点开始出现在[rubi eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
               {
                  outputText("皮肤");
               }
               else
               {
                  outputText("皮毛");
               }
               outputText("。这些斑点很快扩散开来，迅速爬满了[rubi eir]全身。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
               {
                  outputText("与此同时，覆盖在[rubi eir]身上的丝滑柔软毛皮，似乎也随着这股红色异变的侵袭而开始脱落。");
               }
               outputText("没过多久，[rubi eir]原本光滑无毛的皮肤就变成了深红色，正好与[rubi ey]很久以前长出的那条黑桃形尾巴颜色相配。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,994,1);
            }
            if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,988) == 0 && param1 == get_consumables().INCUBID)
            {
               outputText("[pg]鲁比的双手突然猛地抬起，抱住[rubi eir]脑袋，像是头痛欲裂。[rubi Ey]盲目地到处摸索，想找出疼痛的来源，随后你看见了。两个小小的鼓包出现在[rubi eir]额头上，就在发际线处。它们越长越大，直到皮肤干净利落地裂开，露出闪亮的黑色骨质——角。它们向上、向后生长，形成浅浅的棱脊。不过，在完全越过[rubi eir]头顶之前，生长就停了下来。鲁比平静下来，站起身。[rubi Eir]双手抚过这对新东西的每一[if (metric) {厘米|英寸}]，一边望向镜子，为[rubi eir]恶魔般的外貌惊叹不已。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,988,1);
            }
         }
         else
         {
            if(param1 == get_consumables().GROPLUS)
            {
               outputText("[pg]你想把Gro+注射到哪里？");
               menu();
               addButton(0,"乳房",rubiGrowPlusBreasts);
               addButton(1,"阴茎",rubiPenisGroPlus);
               addButton(14,"返回",pickAnItemToFeedRubi);
               return;
            }
            if(param1 == get_consumables().REDUCTO)
            {
               outputText("[pg]你想让鲁比把缩形膏用在哪里？");
               menu();
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 0)
               {
                  addButton(0,"乳房",rubiBoobsReducto);
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  addButton(1,"阴茎",rubiPenisReducto);
               }
               addButton(14,"返回",pickAnItemToFeedRubi);
               return;
            }
            if(param1 == get_consumables().BIMBOLQ)
            {
               outputText("你把那瓶淫娃利口酒递了出去。鲁比接过瓶子，有些迟疑地打量着。[say: 淫娃……利口酒？] [rubi ey]问道，冲你挑了挑眉。[say: 可这东西是干什么的？这里贴着好大一张警告标签。效果永久，强烈……] [rubi eir]的声音随着阅读渐渐低了下去。");
               outputText("[pg]你解释说，这瓶利口酒会给[rubi em]一个全新的开始，正是[rubi ey]当初来到特尔阿德雷时所渴望的那种。以前[rubi ey]只是在戴着一副面具，而现在，[rubi ey]可以真正变成那副面具。[rubi Ey]跟着你的话点了点头，但眉头仍然皱着。");
               outputText("[pg][say: 你确定吗？我觉得我现在的身体就挺好……但如果你想让我改变，我会照做的，] [rubi ey]说道，紧紧攥着瓶子，神情忽然变得非常认真。");
               outputText("[pg]你点点头，告诉[rubi em]，这正是你想要的。");
               outputText("[pg][say: 如果这是你想要的，那也是我想要的，宝贝。] [rubi Ey]深吸一口气，打开瓶子，闭上[rubi eir]眼睛。[rubi ey]一气呵成地把瓶口凑到[rubi eir]唇边，将里面的东西一饮而尽。");
               outputText("[pg]药效过了一会儿才开始发作，但一旦发作，变化便接踵而至。鲁比痛苦地弯下腰，捂住[rubi eir]肚子。[rubi Ey]低头看去，[rubi eir]双眼睁得大大的，亲眼看着这些变化发生。骨头咔咔作响，移位、摇晃，鲁比的腰肢收窄，[rubi eir]臀部则向外扩张。[rubi Eir]整个身体仿佛就在你眼前缩小，变得更加纤细。[rubi Eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,996) == 0)
               {
                  outputText("短");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,996) == 1)
               {
                  outputText("及肩");
               }
               else
               {
                  outputText("长");
               }
               outputText("发突然向外疯长，白金色的长发如瀑布般流过[rubi eir]肩头。[rubi Eir]原本就很纤巧的双手变得更加女性化，[rubi eir]双脚也是如此。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,996,2);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("[pg]鲁比瞪大眼睛，满是惶恐地抓住[rubi eir]胯下，[rubi eir]的手滑进[rubi eir]大腿之间；[rubi eir]的阴茎逐渐萎缩消失，让鲁比拥有了");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
                  {
                     outputText("[rubi eir]的小穴");
                  }
                  else
                  {
                     outputText("一个崭新的小穴");
                  }
                  outputText("。很明显，这个曾经的男性如今已经彻底变成了女性。鲁比向后倒在沙发上，变化似乎终于结束了。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,990,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
               }
               outputText("[pg][say: 呃，哦。天。哪。诸神啊。刚才也太疯狂了，][rubi ey]说道，接着突然捂住[rubi eir]的喉咙。[say: 哇，呃，我的声音变了！]虽然[rubi ey]原本的声音就很女性化，但现在明显更有少女感了。倒不是变得尖细，只是……更少女，还带着一点傻乎乎的腔调。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 7)
               {
                  outputText("[pg][rubi Ey]低头看向[rubi eir]的胸口，脸上掠过一丝失望。[say: 啊？我都得到这么棒的身体了，居然没有奶子？][rubi ey]叫了出来，显然很不开心。");
                  outputText("[pg]仿佛听到了[rubi eir]的抱怨，[rubi eir]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) > 0)
                  {
                     outputText("黑色的");
                  }
                  outputText("乳头周围的肉开始颤动，随后膨胀起来。你发誓自己听见了呼呼的声音，就像有人在给气球充气一样。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) == 0)
                  {
                     outputText("短短几秒内，鲁比的胸口就变得像青春期少女一样；不到一分钟，它们至少已经有B罩杯了。");
                  }
                  outputText("你们俩带着病态的好奇坐在那里，看着那团肉一点一点、一罩杯一罩杯地向外隆起。五分钟后，生长终于停止，鲁比小心地捧住[rubi eir]新长出的巨大E罩杯乳房。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,7);
               }
               outputText("[pg]沉默被鲁比的一声大喊打破：[say: 哦，操，太棒了，这才像话嘛！][rubi Ey]站起身，跳起了一支只能称作奶子舞的舞蹈，随着只有[rubi eir]脑海里才存在的旋律，飞快地先捏一边乳房，再捏另一边。看来除了新身体之外，那瓶利口酒还给了鲁比过剩的精力！");
               outputText("[pg][rubi ey]突然想起你还在这里，于是停下来给了你一个大大的拥抱，把[rubi eir]的乳房压在");
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("你的胸前");
               }
               else
               {
                  outputText("你身上");
               }
               outputText("。[say: 真的太谢谢你了，宝贝！你简直最棒了！那么……你想帮我给这具身体开开荤吗？]");
               outputText("[pg]你咧嘴一笑，说道：[say: 当然。]毕竟，你一向很乐意帮忙！");
               get_player().consumeItem(get_consumables().BIMBOLQ);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1004,1);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,610,1);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,995,1);
               rubiSexMenu();
               setExitButton();
               return;
            }
            if(param1 == get_consumables().EQUINUM)
            {
               outputText("你把那瓶乳白色液体递了过去。鲁比打量了一下，向你投来古怪的目光。[say: 马？认真的吗？怎么，你喜欢巨根吗？][rubi ey]难以置信地问道。尽管如此，[rubi ey]还是拔掉瓶塞，把[rubi eir]的嘴唇贴上喇叭状的瓶口，一口喝下了这份能引发变化的饮料。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
               {
                  outputText("[pg]鲁比倒吸一口气，[rubi eir]的双手猛地探到[rubi eir]双腿之间，慌乱地抓寻着什么。透过[rubi eir]的指缝，你看见了它——一截肉乎乎的");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
                  {
                     outputText("红色的");
                  }
                  else
                  {
                     outputText("粉色的");
                  }
                  outputText("凸起物……一根崭新的阴茎！鲁比浑身一颤，[rubi eir]纤细的小手指环住了那根新长出来的、[if (metric) {十二厘米|五英寸}]长的阴茎。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,5);
               }
               if(rubiGetCockType() != CockTypesEnum.HORSE)
               {
                  outputText("[pg]最初几秒什么都没发生。接着鲁比突然弯下腰，痛苦地捂住[rubi eir]肚子。[rubi eir]一只手紧紧按着腹部，另一只手则向下抓住[rubi eir]的[rubi cock]。[rubi eir]阴茎上的肉一阵起伏，血管猛地鼓胀起来。随着[rubi eir]阴茎开始变形，鲁比喉咙里挤出一声低低的呻吟，那粉色的龟头突然变平，并向外扩展开来。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,986,CockTypesEnum.HORSE.get_Index());
                  outputText("[pg]鲁比的阴茎在[rubi eir]手中变粗，随着变化继续，宽度至少增加了[if (metric) {几厘米|一英寸}]。一圈厚实的肉环在阴茎根部附近鼓起……毫无疑问，那是鞘的雏形。你惊叹地注视着，鲁比阴茎根部的皮肉开始变暗，慢慢转为灰黑色，同时也蔓延到[rubi eir]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) < 9)
                  {
                     outputText("肿胀的");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 9)
                  {
                     outputText("充血胀大的");
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,997) == 1)
                  {
                     outputText("紧致又伪娘味十足的");
                  }
                  outputText("阴囊上。颜色向前蔓延，似乎停在那圈标示着[rubi eir]鞘口边缘的厚肉环处……不过，一片片暗灰色又出现在[rubi eir]接下来[if (metric) {十几厘米|几英寸}]的长度上，与[rubi eir]阴茎肉鲜亮的粉色形成了漂亮的反差和花纹。");
                  outputText("[pg]鲁比忽然叹了口气，松开[rubi eir]肚子和阴茎，缓了一会儿，才惊奇地低头看向[rubi eir]新变出的马屌。[say:哇哦，][rubi ey]一边说，一边用[rubi eir]手指抚过顶端那道新出现的海绵状凸缘。[say:啊，这下可得花点时间适应了……]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,985,FlagDict_Impl_.arrayReadInt(_loc2_,985) + (3 + Utils.rand(5)));
               }
            }
            else if(param1 == get_consumables().TRAPOIL)
            {
               outputText("你用一只手把那小瓶油转了转，把鲁比从衣柜里拉出来。按你的打算，[rubi ey]需要找个舒服的地方躺下。你们俩回到卧室，你吩咐鲁比趴到床上。[rubi Ey]先把床罩铺平，然后便迫不及待地照做了。");
               outputText("[pg]你打量着眼前的景象。鲁比正脸朝下趴在那张大概是世上最柔软、最少女心的床上。[rubi Eir]柔软的身体毫无遮掩地展现在你面前，有着挺翘的心形屁股、奶油般的大腿和柔嫩的双脚。更别提那条左右轻轻摆动的柔韧尾巴了。你忍不住咧嘴一笑，爬上鲁比趴伏的身体，同时掀开瓶盖。");
               outputText("[pg]你坐到鲁比的大腿上，[rubi eir]翘臀和后背就在你面前摊开。你稍稍倒转瓶子，让一大团半浓稠的油顺着[rubi eir]脊背流下，在[rubi eir]后腰处汇成一小滩。你往自己手上也倒了些油，然后把瓶子放到一旁。事先好好活动了一下双手后，你立刻投入其中，将手指按进鲁比的肉体里。");
               outputText("[pg]你的手指寻找着肌肉里僵硬的结节，从[rubi eir]肩膀一路按到[rubi eir]下背，并在[rubi eir]屁股上停留得比必要的时间更久。你同样照顾到[rubi eir]手臂和双腿上的肌肉，把每一处紧绷都揉散，鲁比则愉悦地对着床罩发出呻吟。");
               outputText("[pg]没过多久，你让[rubi em]翻过身来，自己又回到[rubi eir]大腿上方的位置。鲁比紧实的腹部上下起伏，[rubi eir]呼吸也变得沉重。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("鲁比的[rubi cock]抽动着，顶端已经渗出前列腺液，像是要直指上方的天空");
               }
               else
               {
                  outputText("鲁比的小穴亮晶晶的，在你的照料下早已彻底湿透");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 0)
               {
                  outputText("，[rubi eir]的[rubi breasts]则随着[rubi eir]呼吸的起伏轻轻上下晃动");
               }
               outputText("。");
               outputText("[pg]你在这里重复了一遍流程，把大团的油涂到你爱人的身上，而[rubi eir]的身体也在你的触碰下愉悦地弓起。你的手指再次深入其中，不过这次不再专注于揉开鲁比身上的僵结，而是把重点放在[rubi eir]乳头、肚腹和胯间。你喜欢[rubi ey]对每一次轻触做出的反应：当你擦过[rubi eir]大腿内侧时，[rubi eir]脚趾会蜷起；而当你的手指挑逗[rubi eir]腋下时，你还能看见[rubi eir]可爱地咬住嘴唇。");
               outputText("[pg]等鲁比从脖子以下终于都涂满了油，你退后一步微笑着，等待变化开始生效。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 1 && !get_hyper())
               {
                  outputText("[pg]鲁比轻轻倒抽一口气，[rubi eir]双手立刻按向[rubi eir]胸口。就在你眼前，鲁比的乳房开始变小，整整缩小了一个罩杯。鲁比试探着捧起[rubi eir]乳房，适应着它们减轻后的新重量。");
                  _loc3_ = 984;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,1);
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
               {
                  outputText("[pg]鲁比轻轻倒抽一口气，[rubi eir]双手立刻按向[rubi eir]胸口。就在你眼前，鲁比的乳房开始胀大，整整增大了一个罩杯。鲁比试探着捧起[rubi eir]乳房，适应着它们新的重量。");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,984,FlagDict_Impl_.arrayReadInt(_loc2_,984) + 1);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 1)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,984,1);
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 3 && !get_hyper())
               {
                  outputText("[pg]鲁比的[rubi cock]突然胀起，变得硬得发疼。[rubi Ey]握住它，随着它开始变小，忽然发出一声呻吟。它至少缩短了[if (metric) {几厘米|一英寸}]，最后给[rubi em]留下了一根");
                  _loc3_ = 985;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) < 3)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,985,3);
                  }
                  outputText(Math.round(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) * 10) / 10 + "英寸的阴茎。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,997) == 0)
               {
                  outputText("[pg]油似乎渗进了鲁比的皮肤，让[rubi eir]肌肤一时间泛起一种光亮、近乎昆虫甲壳般的光泽。然而，你的目光并没有被[rubi eir]亮泽的皮肤吸引，而是落在了[rubi eir]胯间，尤其是[rubi eir]睾丸上。那只阴囊本身似乎诡异地扭动起来，你意识到它正在缩小！鲁比惊慌地叫了一声，阴囊收紧并向上缩去，但幸好并没有消失。相反，它似乎只是变得更紧致了。你试探着把手指搭在[rubi eir]新的阴囊上，欣慰地发现[rubi ey]仍然有两颗睾丸，尽管看起来像是只有一颗：它们被困在一个可爱的小包里，似乎向上收拢，而不是垂下来。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,997,1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) != 1)
               {
                  outputText("[pg]鲁比的双手迅速摸向[rubi eir]乳头，那两点像是气温骤降了二十度一样挺立起来。随着乳头开始变暗，从乳晕边缘一点点向内蔓延，[rubi Ey]忍不住咯咯笑了起来，仿佛被人挠痒似的。没过多久，鲁比的乳头就变成了诱人的缟玛瑙般漆黑。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1003,1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) != 1)
               {
                  outputText("[pg]鲁比眨了眨眼，又眨了一次，像是有什么东西卡在了[rubi eir]眼睛里。[rubi Ey]抬手摸向眼睛，但你已经看出了让[rubi em]不适的原因。某种墨黑色的物质似乎正覆盖在[rubi eir]眼睛上，从外侧开始向内蔓延。没过多久，它就覆盖了巩膜，接着又覆盖了虹膜。鲁比闭着眼睛等了一会儿，然后重新睁开，露出了[rubi eir]全新的纯黑眼眸。[rubi Ey]立刻冲进衣橱，去照镜子查看它们。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,993,1);
               }
               else
               {
                  outputText("[pg]遗憾的是，什么都没有发生。也许已经没有什么可变的了，又或者你拿到的是一瓶次品。无论如何，鲁比似乎对这次按摩很满意，心满意足地在床上躺了好几分钟，才清理好[rubi em]自己，回到了衣橱里。");
               }
            }
            else if(param1 == get_consumables().W_FRUIT)
            {
               outputText("你把那颗小小的、像桃子一样的果子递给鲁比。[rubi Ey]把它放在[rubi eir]手里翻来覆去地看，评价道：[say:你怎么会喜欢这种东西？它们也太……毛茸茸了！不过嘛，各有所好吧。]鲁比明显咽了口唾沫，像是在给[rubi em]自己做心理准备，随后才咬向这颗带着绒毛的果子。显然，它并没有[rubi ey]想象中那么糟，因为[rubi ey]发出一声满意的低哼，把果子一直吃到了果核。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) != 1)
               {
                  outputText("[pg]鲁比的双手猛地摸向[rubi eir]头，[rubi ey]痛得跪倒在地。有那么一会儿，你还不确定出了什么问题，随后你看见了： [rubi eir]耳朵扭曲并拉长，突然长出一层细密的白毛。它们慢慢变成三角形，并沿着鲁比的头部向上移动，直到停在头顶，就像……好吧，就像一对猫耳朵。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,998,1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1000) != 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,999) != 1)
               {
                  outputText("[pg]这一次，鲁比的双手摸向[rubi eir]脸颊，几根胡须从[rubi eir]脸上冒了出来。它们在[rubi eir]触碰下可爱地颤动着，但变化还不止这些。鲁比看着[rubi eir]双手，惊讶地吸了口气，眼看着它们长出一层细密的白毛并开始变形。[rubi eir]掌心和手指上的几块皮肤颜色变亮，变成粉色，而白毛则覆盖了其余部分。最终，鲁比得到了一双爪子般的手。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1000,1);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,999,1);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,987) != 1)
               {
                  outputText("[pg]随后，鲁比坐了下来，仿佛有一阵剧痛沿着[rubi eir]双腿窜了上去。[rubi Ey]抱住一条腿，类似的变化也在那里发生了：脚被白毛覆盖，脚底和脚趾上长出了粉色的肉垫。[rubi Eir]脚跟也随之拉长，从脚趾处向后延伸，形成了你确信是趾行式的结构。果不其然，等变化结束后，鲁比用[rubi eir]新腿试探着走了几步，[rubi ey]被迫踮着脚尖行走，这反倒把[rubi eir]屁股衬托得更加明显。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,987,1);
               }
               else if(rubiGetCockType() != CockTypesEnum.CAT && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("[pg]起初几秒钟什么都没有发生。随后鲁比突然弯下腰，痛苦地捂住[rubi eir]肚子。一只手紧紧按着[rubi eir]腹部，另一只手则向下抓住[rubi eir][rubi cock]。[rubi eir]阴茎上的肉开始起伏，血管猛地鼓起。一声低沉的呻吟从鲁比喉咙里挣扎着挤了出来，而[rubi eir]阴茎也随之变形，顶端向外拉长，龟头上冒出数个倒刺般的突起。就在你眼前，那些倒刺颤动了一下，随后贴伏在[rubi eir]阴茎上。它们似乎并不锋利，更像是准备好刺激潜在伴侣的构造。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,986,CockTypesEnum.CAT.get_Index());
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
               {
                  outputText("[pg]鲁比突然捂住[rubi eir]肚子，而你注意到[rubi eir]皮肤上出现了白色斑点。你发现这并不只是肤色改变，而是[rubi eir]皮肉上长出了一层细密的白毛，并正以极快的速度蔓延！一块块白毛迅速覆盖了[rubi eir]躯干，只有乳头保持原样，随后是手臂和双腿，最后是脸庞，让[rubi em]拥有了一个可爱的小纽扣鼻。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,994,2);
               }
            }
         }
         if(param1 == get_consumables().PURPEAC)
         {
            outputText("虽然你知道单吃这些桃子并不会引发任何变化，但你不禁想，如果把它们凑在一起，或许会对鲁比这样的人产生什么作用。你把五颗桃子递过去，并提到它们做成派可能会很好吃。鲁比眼睛一亮，[rubi ey]点了点头：[say:哦！我可以试试看，当然可以！]");
            outputText("[pg]鲁比从衣架上取下一条围裙，系在[rubi eir]身上，也没再穿别的东西，就这样走进了厨房。你跟上去，看着[rubi ey]开始忙活：先预热小烤箱，然后拿出一个派盘，铺上新鲜的派皮。[rubi Ey]把桃子切开，又加了一些你没留意的其他材料。说实话，你的目光更多地落在鲁比曲线漂亮的裸臀上，看着它晃来晃去。");
            outputText("[pg]不知不觉间，一个完整的派已经在烤箱里烘烤，而鲁比把你推到了沙发上。[rubi Ey]爬到你身上，然后趴在你怀里，紧紧抱住你。接下来的半个小时左右，你们就这样在沙发上相拥依偎，鲁比半裸的身体贴在你身上。最终，烤箱旁的计时器响了起来，鲁比像一只被水威胁到的猫一样，从你怀里猛地弹起。[rubi Ey]冲到烤箱前，戴上一只大得滑稽的隔热手套，从里面取出了刚烤好的派。");
            outputText("[pg][rubi Ey]深深吸了一口气，随后满足地叹息道：[say:嗯——闻起来真香！你想来一块刚出炉的吗？]");
            outputText("[pg]你婉拒了，说这些桃子本来就是带给[rubi em]的，而且你随时都能再弄一些。[rubi Ey]点点头，给[rubi em]自己切下一块派，等它稍微凉了一点后咬了一口。[rubi Eir]嘴角立刻扬起笑容，你发誓自己听见一声小小的愉悦呻吟从[rubi eir]紧闭的唇间挤了出来。转眼间，那一块就没了，接着是第二块，然后半个派似乎都消失不见了。");
            outputText("[pg][say:哎呀，真好吃，]鲁比一边说，一边回到沙发边，瘫进柔软的坐垫里。[rubi Ey]解下围裙，露出赤裸的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
            {
               outputText("皮肤");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1)
            {
               outputText("红色皮肤");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
            {
               outputText("覆毛皮肤");
            }
            else
            {
               outputText("条纹皮肤");
            }
            outputText("。这个带有恶魔印记的" + rubiMF("男孩","女孩") + "满足地揉了揉[rubi eir]肚子。[say:那些桃子真不错，宝贝。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) != 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && rubiGetCockType() != CockTypesEnum.ANEMONE)
            {
               outputText("[pg]鲁比的眼睛突然睁大，[rubi ey]捂住[rubi eir]肚子。[say:噢，天哪……我的肚子突然变得好热。]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) != 2)
               {
                  outputText("[pg][rubi Eir]的手没在那里停留太久，便猛地抬到[rubi eir]头上，因为[rubi eir]的耳朵似乎就在你眼前闪烁、变形。[rubi Eir]的");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 0)
                  {
                     outputText("普通");
                  }
                  else
                  {
                     outputText("猫科");
                  }
                  outputText("耳朵似乎缩进了[rubi eir]头骨里，随后消失不见，只留下皮肤和头发。你不禁怀疑鲁比是不是永远失去了[rubi eir]耳朵，但这个念头刚从脑海中闪过，你就注意到正常耳朵所在的位置长出了两个小小的突起。");
                  outputText("[pg]它们很快向外绽开，长成了某种隐约像耳朵的形状。随后，一簇簇鲜亮的羽毛冒了出来，粉色和橙色的绒羽覆盖了整只耳朵。");
                  outputText("[pg][rubi Eir]把手移开，试探性地戳了戳那对耳朵。它们可爱地抖了抖，鲁比立刻跑去镜子前查看[rubi em]自己的样子。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,998,2);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 3)
               {
                  outputText("[pg][rubi Eir]的双手紧紧按在[rubi eir]肚子裸露的皮肤上。令你惊讶的是，你发现[rubi eir]的肤色似乎正在改变。一开始，它逐渐变深，");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
                  {
                     outputText("原本苍白的肤色被鲜艳的樱桃红取代");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1)
                  {
                     outputText("不过在[rubi eir]本就樱桃红的肌肤上几乎看不出来");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
                  {
                     outputText("毛皮迅速褪去，露出下面鲜红的肌肤");
                  }
                  outputText("，但这种变化并不均匀。鲁比身体的大部分都变成了樱桃红，而[rubi eir]腹部反倒变浅，成了甜美的银灰色。一道道同样银色的条纹出现了，似乎毫无规律地遍布鲁比的手臂和双腿，甚至不可思议地一路延伸到[rubi eir]恶魔尾巴上。");
                  outputText("[pg]当变化似乎停止，或至少慢下来时，鲁比平静地松开按在[rubi eir]肚子上的手，走到镜子前查看[rubi em]自己的样子。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,994,3);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && rubiGetCockType() != CockTypesEnum.ANEMONE)
               {
                  outputText("[pg][rubi Eir]的手没在那里停留太久，便猛地探向[rubi eir]胯间，摸索着[rubi eir]两腿之间的[rubi cock]。那里的肉似乎泛起波纹，血管突然鼓胀起来。一声低沉沙哑的呻吟从鲁比喉中挤出，随着[rubi eir]肉棒开始变形");
                  if(rubiGetCockType() != CockTypesEnum.HUMAN)
                  {
                     outputText("，先是变得更接近人类的模样");
                  }
                  outputText("。小小的结节开始出现，环绕在阴茎的龟头周围，也围在根部。鲁比纤细的双手拂过其中两个结节，[rubi eir]的阴茎突然绷紧，硬得前所未有！不管那些东西是什么，它们显然相当敏感。");
                  outputText("[pg]那些小突起迅速向外生长，拉长成细小的、海葵般的触手。变化终于停止时，鲁比带着不小的不安低头望去，只见[rubi eir]阴茎头部周围的四条触手，以及根部的四条触手，都在自行扭动蠕动着。");
                  outputText("[pg][say:哦……哦天哪。]当[rubi ey]用一只手握住这根新近改变的器官时，[rubi ey]只能说出这句话。那些触手也同样试图缠上鲁比的手，显然有着自己的意志。你相当确定，[rubi ey]恐怕还得花上一点时间才能适应。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,986,CockTypesEnum.ANEMONE.get_Index());
            }
            else
            {
               outputText("[pg]你仔细观察着鲁比，但这批桃子除了填饱[rubi eir]的肚子之外，似乎没有任何效果。又或者，已经没有什么能再改变了。");
            }
            get_player().consumeItem(param1,1);
            get_player().consumeItem(param1,1);
            get_player().consumeItem(param1,1);
            get_player().consumeItem(param1,1);
         }
         get_player().consumeItem(param1,1);
         menu();
         addButton(0,"下一步",pickAnItemToFeedRubi);
      }
      
      public function giveRubiALongDressToHideHerHideousBody() : void
      {
         var date1:Function;
         var _g:Rubi;
         clearOutput();
         rubiSprite();
         outputText("你告诉鲁比，你想看看[rubi em]穿那条长裙的样子。[say: 哦哦，我就是</i>喜欢<i>那一条！等我一下！][rubi ey]一边说，一边拿出裙子和几样配饰。");
         outputText("[pg]鲁比先穿上一件淡粉色无肩带胸罩");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 1)
         {
            outputText("，尽管[rubi ey]显然并不需要穿这个");
         }
         outputText("，并被[rubi ey]熟练地在[rubi em]身后扣好");
         outputText("。接着，[rubi ey]拿起一条白色吊袜带，顺着[rubi eir]纤细的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
         {
            outputText("光洁无毛的");
         }
         else
         {
            outputText("覆着毛发的");
         }
         outputText("腿往上套，直到它服帖地箍在[rubi eir]腰间。一双配套的白色长袜很快也穿好了，由吊袜带固定住。接下来是一条淡粉色内裤，[rubi ey]顺着[rubi eir]的腿往上拉，让它紧紧贴住[rubi eir]丰满的屁股。");
         outputText("[pg]最后，鲁比把那条无肩带连衣裙抱进[rubi eir]怀里，转着圈摆出跳舞的动作。过了一会儿，[rubi ey]才像是突然想起你还和[rubi em]待在同一个房间里。[rubi Eir]脸一下子变得通红");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
         {
            outputText("（至少也变深了些）");
         }
         outputText("，[rubi ey]这才回到眼前的正事上。连衣裙被利落地穿好，等它就位后，你帮忙拉紧内置束腰的系带，并在背后打成一个整齐的小蝴蝶结。最后收尾的是一双粉色浅口高跟鞋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1)
         {
            outputText("，鞋跟被削掉了，还开了个洞，方便鲁比的恶魔足跟穿过去");
         }
         outputText("，[rubi ey]很快就把它们穿上了。");
         outputText("[pg]总的来说，[rubi ey]看起来已经随时可以去参加什么高级舞会了。");
         outputText("[pg]既然鲁比已经打扮好了，你想做什么？");
         menu();
         _g = this;
         date1 = fancyDate;
         addButton(0,"约会",function():void
         {
            _g.dateIntro(date1);
         });
         addButton(14,"返回",rubiAppearance);
      }
      
      public function giftRubiClothes() : void
      {
         var itype11:ItemType;
         var _g11:Rubi;
         var itype10:ItemType;
         var _g10:Rubi;
         var itype9:ItemType;
         var _g9:Rubi;
         var itype8:ItemType;
         var _g8:Rubi;
         var itype7:ItemType;
         var _g7:Rubi;
         var itype6:ItemType;
         var _g6:Rubi;
         var itype5:ItemType;
         var _g5:Rubi;
         var itype4:ItemType;
         var _g4:Rubi;
         var itype3:ItemType;
         var _g3:Rubi;
         var itype2:ItemType;
         var _g2:Rubi;
         var itype1:ItemType;
         var _g1:Rubi;
         var itype:ItemType;
         var _g:Rubi;
         var _loc4_:int = 0;
         clearOutput();
         rubiSprite();
         var _loc1_:ButtonDataList = new ButtonDataList();
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,612) == 1)
         {
            _loc2_[int(_loc2_.length)] = "西装";
         }
         else
         {
            _loc3_.push("西装");
            _g = this;
            itype = get_armors().CLSSYCL;
            _loc1_.add("西装",function():void
            {
               _g.giveRubiClothes(itype);
            },"","",get_player().hasItem(get_armors().CLSSYCL));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,613) == 1)
         {
            _loc2_[int(_loc2_.length)] = "橡胶情趣服";
         }
         else
         {
            _loc3_.push("橡胶情趣服");
            _g1 = this;
            itype1 = get_armors().RBBRCLT;
            _loc1_.add("橡胶服",function():void
            {
               _g1.giveRubiClothes(itype1);
            },"","",get_player().hasItem(get_armors().RBBRCLT));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,614) == 1)
         {
            _loc2_[int(_loc2_.length)] = "绿色冒险者装束";
         }
         else
         {
            _loc3_.push("绿色冒险者装束");
            _g2 = this;
            itype2 = get_armors().ADVCLTH;
            _loc1_.add("绿色服装",function():void
            {
               _g2.giveRubiClothes(itype2);
            },"","",get_player().hasItem(get_armors().ADVCLTH));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,615) == 1)
         {
            _loc2_[int(_loc2_.length)] = "抹胸上衣";
         }
         else
         {
            _loc3_.push("抹胸上衣");
            _g3 = this;
            itype3 = get_armors().TUBETOP;
            _loc1_.add("抹胸上衣",function():void
            {
               _g3.giveRubiClothes(itype3);
            },"","",get_player().hasItem(get_armors().TUBETOP));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,616) == 1)
         {
            _loc2_[int(_loc2_.length)] = "透明紧身衣";
         }
         else
         {
            _loc3_.push("透明紧身衣");
            _g4 = this;
            itype4 = get_armors().T_BSUIT;
            _loc1_.add("紧身衣",function():void
            {
               _g4.giveRubiClothes(itype4);
            },"","",get_player().hasItem(get_armors().T_BSUIT));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,617) == 1)
         {
            _loc2_[int(_loc2_.length)] = "长裙";
         }
         else
         {
            _loc3_.push("长裙");
            _g5 = this;
            itype5 = get_armors().B_DRESS;
            _loc1_.add("长裙",function():void
            {
               _g5.giveRubiClothes(itype5);
            },"","",get_player().hasItem(get_armors().B_DRESS));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,618) == 1)
         {
            _loc2_[int(_loc2_.length)] = "一套配紧身皮裤的帅气装束";
         }
         else
         {
            _loc3_.push("一套配紧身皮裤的帅气装束");
            _g6 = this;
            itype6 = get_armors().LTHRPNT;
            _loc1_.add("皮裤",function():void
            {
               _g6.giveRubiClothes(itype6);
            },"","",get_player().hasItem(get_armors().LTHRPNT));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,619) == 1)
         {
            _loc2_[int(_loc2_.length)] = "护士服";
         }
         else
         {
            _loc3_.push("护士服");
            _g7 = this;
            itype7 = get_armors().NURSECL;
            _loc1_.add("护士服",function():void
            {
               _g7.giveRubiClothes(itype7);
            },"","",get_player().hasItem(get_armors().NURSECL));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,620) == 1)
         {
            _loc2_[int(_loc2_.length)] = "淫荡泳装";
         }
         else
         {
            _loc3_.push("淫荡泳装");
            _g8 = this;
            itype8 = get_armors().S_SWMWR;
            _loc1_.add("淫荡泳装",function():void
            {
               _g8.giveRubiClothes(itype8);
            },"","",get_player().hasItem(get_armors().S_SWMWR));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,625) == 1)
         {
            _loc2_[int(_loc2_.length)] = "一件艳俗迷你裙";
         }
         else
         {
            _loc3_.push("一件艳俗迷你裙");
            _g9 = this;
            itype9 = get_armors().BIMBOSK;
            _loc1_.add("艳俗裙",function():void
            {
               _g9.giveRubiClothes(itype9);
            },"","",get_player().hasItem(get_armors().BIMBOSK));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1012) == 1)
         {
            _loc2_[int(_loc2_.length)] = "束缚绑带";
         }
         else
         {
            _loc3_.push("束缚绑带");
            _g10 = this;
            itype10 = get_armors().BONSTRP;
            _loc1_.add("束缚带",function():void
            {
               _g10.giveRubiClothes(itype10);
            },"","",get_player().hasItem(get_armors().BONSTRP));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1013) == 1)
         {
            _loc2_[int(_loc2_.length)] = "一件审判官束身衣";
         }
         else
         {
            _loc3_.push("一件审判官束身衣");
            _g11 = this;
            itype11 = get_armors().I_CORST;
            _loc1_.add("审判官束衣",function():void
            {
               _g11.giveRubiClothes(itype11);
            },"","",get_player().hasItem(get_armors().I_CORST));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100)
         {
            _loc2_[int(_loc2_.length)] = "一套性感女侍制服";
         }
         else
         {
            _loc3_.push("一套性感女侍制服");
         }
         if(int(_loc2_.length) > 0)
         {
            outputText("<b>鲁比的衣橱：</b>");
            _loc4_ = 0;
            while(_loc4_ < int(_loc2_.length))
            {
               outputText("\n" + _loc2_[_loc4_]);
               _loc4_++;
            }
            outputText("[pg]");
         }
         if(int(_loc3_.length) > 0)
         {
            outputText("你快速扫了一眼鲁比的东西，觉得[rubi ey]肯定很需要……" + _loc3_[Utils.rand(int(_loc3_.length))] + "。[pg]");
            outputText("[pg]你要给[rubi em]什么？");
         }
         else
         {
            outputText("你已经把[rubi ey]想用的所有衣服都给鲁比了。[pg-]");
            awardAchievement("盛装达人",123);
            outputText("[pg]");
         }
         _loc1_.submenu(rubiAppearance);
      }
      
      public function get_debugName() : String
      {
         return "鲁比";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getTeaFromRubi() : void
      {
         clearOutput();
         rubiSprite();
         if(rubiAffection() < 30)
         {
            outputText("你招呼鲁比过来，告诉她你想点一杯茶。她点点头，很快你面前就放上了一杯滚烫的香茶。[say: 这是我们的舒缓茶，能放松身心，]她说道。你抿了一口，叹了口气。确实很放松。");
            outputText("[pg]你喝着喝着，差点就要打起盹来，但鲁比过来陪你聊天，也顺便看看你的情况。过了一会儿，你觉得自己对她又熟悉了一些。感觉已经足够放松了，你便告辞，返回营地。");
         }
         else if(rubiBimbo())
         {
            outputText("你招呼鲁比过来，告诉她你想点一杯茶。她点点头，很快你面前就放上了一杯滚烫的香茶。[say: 这是，呃，我们的舒缓茶。好像是能放松身心什么的，]她说着咯咯笑了起来。你抿了一口，叹了口气。确实很放松。");
            outputText("[pg]你喝着喝着，差点就要打起盹来，但鲁比过来和你闲聊，也顺便看看你的情况。她甚至还抽空给你做了一次性感的肩部按摩，时不时把丰满的胸部压到你的背上。感觉已经足够放松了，你便告辞，返回营地。");
         }
         else
         {
            outputText("你叫住鲁比，告诉[rubi em]你想点一杯茶。[rubi Ey]点点头，很快，一杯热气腾腾、香气扑鼻的茶就摆在了你面前。[say: 这是我们的放松茶饮，能舒缓身心，][rubi ey]说道。你喝了一口，轻轻叹了口气。确实挺让人放松的。");
            outputText("[pg]你一边喝着茶，一边发现自己几乎快要睡过去了，不过鲁比过来和你聊了几句，也看看你怎么样。[rubi Ey]甚至还抽出一点时间，帮你简单按摩了一下太阳穴。感觉已经足够放松后，你向[rubi em]告辞，返回了营地。");
         }
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 6);
         rubiAffection(5);
         get_player().refillHunger(7);
         get_player().changeFatigue(-25);
         if(rubiAffection() >= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) == 0)
         {
            doNext(specialRelationship20scene);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function getFuckedByRubi() : void
      {
         get_images().showImage("rubi-fucks-you");
         clearOutput();
         rubiSprite();
         outputText("鲁比没有等你先做什么，而是牵起你的双手，把你带进卧室。[rubi Ey]把一只手臂搭在你肩上，手指穿过你后脑的头发，然后把你拉进一个深吻。鲁比那");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
         {
            outputText("红色的");
         }
         else
         {
            outputText("黑色");
         }
         outputText("嘴唇贴着你的感觉如此柔嫩，但它们很快分开，[rubi eir]舌头从唇间滑出，探入你温暖湿润的口腔深处。");
         outputText("[pg]你结束这个吻后，鲁比对你笑了笑，神情有些难为情。[say:对不起，宝贝，我只是……我已经想这么做很久了，][rubi ey]说道，[rubi eir]手滑向[rubi eir]两腿之间，你注意到[rubi eir]衣服下鼓起了相当明显的一块。[rubi Eir]纤细的双手抓住你的手臂，把你往后推倒在床上，不过你的[legs]还垂在床沿外。");
         outputText("[pg]尽管这种转变有些不像[rubi eir]平时的样子，[rubi eir]的动作显得急切，却并不粗暴。[rubi Eir]闪闪发亮的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 0 || rubiBimbo())
         {
            outputText("绿色");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 1)
         {
            outputText("紫色");
         }
         else
         {
            outputText("黑色");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) > 0)
         {
            outputText("竖瞳的");
         }
         outputText("眼睛总是与你对视，仿佛每做一个动作之前和之后，都在寻求你的认可。你很确定，这里仍然是由你掌控……只是你愿意让鲁比来主导而已。");
         outputText("[pg]年轻的恶魔变形者急忙脱下你的[armor]，看着你赤裸裸地趴在那里，[rubi ey]舔了舔嘴唇。[rubi Ey]跪了下来，低声说道：[saystart]让我把你这");
         if(!get_player().hasVagina())
         {
            outputText("肛穴");
         }
         else
         {
            outputText("小穴");
         }
         outputText("好好为我准备一下。[sayend]鲁比的脑袋探到你的双腿之间");
         if(get_player().hasCock())
         {
            outputText("，完全不理会你的[cocks]，");
         }
         outputText("把脸埋进你的[vagOrAss]，深深吸了一口气。[rubi Eir]嘴唇嘟起，直接在你的");
         if(!get_player().hasVagina())
         {
            outputText("屁股");
         }
         else
         {
            outputText("渐渐湿润的小穴");
         }
         outputText("上落下一吻。你轻轻呻吟一声，向后靠去，视线从");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,995) == 0)
         {
            outputText("黑发的");
         }
         else
         {
            outputText("金发的");
         }
         outputText("、夹在你大腿间的脑袋上移开，沉浸在这股感觉之中。");
         outputText("[pg]鲁比用嘴唇含住你的[vagOrAss]，用[rubi eir]舌头舔弄那片敏感的肉。你浑身一颤，在床上舒展开来，任由那感觉涌遍全身。鲁比用[rubi eir]嘴唇和舌头细细侍弄你紧致的小洞，又舔又吮，弄得一片湿乱，毫无疑问是在为接下来要发生的事做准备。但[rubi ey]并没有让[rubi em]self操之过急，而是不紧不慢地确认你已经准备妥当。[rubi Eir]修剪得精致完美的手指在你大腿内侧描画着只有[rubi ey]自己才懂的纹路，动作细腻而精准，让你的身体不由自主地轻颤起来。[rubi Eir]另一只手滑上你的腹部，一寸寸向上游移，用同样神秘的指法挑逗着你的肌肤。");
         outputText("[pg]你的下体刚被润湿，鲁比便站起身来，迅速脱去衣服，把它们也丢进地上的衣物堆里。[rubi Eir]柔美的双手沿着[rubi eir]身体向下滑去，握住从[rubi eir]胯间挺出的[rubi cock]，抚弄着让它完全挺立。它那");
         if(rubiGetCockType() == CockTypesEnum.HUMAN)
         {
            outputText("粉色、蘑菇般的顶端");
         }
         else if(rubiGetCockType() == CockTypesEnum.DEMON)
         {
            outputText("紫色、布满结节的顶端");
         }
         else if(rubiGetCockType() == CockTypesEnum.HORSE)
         {
            outputText("钝圆、散发麝香气味的顶端");
         }
         else if(rubiGetCockType() == CockTypesEnum.CAT)
         {
            outputText("带刺的顶端");
         }
         else if(rubiGetCockType() == CockTypesEnum.ANEMONE)
         {
            outputText("触手环绕的冠状部");
         }
         else
         {
            outputText("<b>错误：鲁比的阴茎类型设置无效。当前：" + Std.string(rubiGetCockType()) + "</b>");
         }
         outputText("从包裹着它的包皮中探出，随着[rubi eir]的阴茎绷紧，渴望着能填入什么东西，什么都好。");
         outputText("[pg]鲁比望进你的眼中，确认了[rubi eir]的渴望，然后满足了[rubi eir]阴茎的需求。只一个迅速的动作，鲁比就把[rubi eir]的肉棒插进你体内[if (metric) {几厘米|几英寸}]。被插入的感觉让你猝不及防地呻吟出声，声音比你想的还要大。鲁比微微一笑，抽出[if (metric) {一小段距离|几英寸}]，又重新顶了进来，比刚才更深了一点。这一次轮到你的恶魔爱人呻吟了；你用[vagOrAss]夹住[rubi eir]侵入的肉棒，像虎钳一样紧紧裹住[rubi em]。");
         if(!get_player().hasVagina())
         {
            get_player().buttChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) / 6,true,true,false);
         }
         else
         {
            get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) / 6,true,true,false);
         }
         outputText("[pg]鲁比抓住你的一条腿，抬到[rubi eir]肩上，然后又往里顶深了一点。这个动作正好蹭过你的");
         if(!get_player().hasVagina())
         {
            outputText("前列腺");
         }
         else
         {
            outputText("G点");
         }
         outputText("，只是短短一瞬，却足以让一道灼热的颤栗沿着你的脊背窜上来。看到你的反应，鲁比笑得更开，咧嘴一笑，开始慢慢地进出抽送。每一次顶弄都会擦过你敏感的");
         if(!get_player().hasVagina())
         {
            outputText("前列腺");
         }
         else
         {
            outputText("G点");
         }
         outputText("，你的四肢开始一个接一个地发麻。[rubi ey]一进一出地动着，你能感觉到体内有什么正在积聚。");
         outputText("[pg]你的双臂阵阵发麻，双手抓紧床单，试图稳住自己。你的[legs]颤抖着，皮肤上泛起一层鸡皮疙瘩。其中一条腿不受控制地剧烈抽动，在这不断攀升的快感面前，完全不听大脑指挥。你的脑袋一阵眩晕，被幸福感和某种别的东西淹没……那会是爱吗？你咬住嘴唇，脸上扭曲成渴求而绝望的表情。你爱上了这个被恶魔侵染的" + rubiMF("boy","girl") + "，这个与你分享秘密、分享人生的人吗？你的思绪变得一片模糊，到了这一步，就连你自己也无法确定，在这一切感官冲击之下埋藏的真正答案究竟是什么。然而，鲁比脸上的神情却再清楚不过。爱慕从[rubi em]身上满溢而出，[rubi ey]不断顶弄着，用一次次有分寸又小心翼翼的抽插，把你的[vagOrAss]干得越来越快。");
         outputText("[pg]接连几件事在短时间内发生了。首先，你的爱人低头看着你，眼神还是[rubi ey]今天一整天都在用的那一种。那种询问又顺从的眼神，几分钟前还在说：[say:我可以干你吗？]现在，它借着那双闪闪发亮的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 0 || rubiBimbo())
         {
            outputText("绿色");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 1)
         {
            outputText("紫色");
         }
         else
         {
            outputText("黑色");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) > 0)
         {
            outputText("竖瞳的");
         }
         outputText("眼睛，传达出：[say:我可以射在你里面吗？]");
         outputText("[pg]第二，你的心跳漏了一拍。第三，你喉咙里像是堵住了一块。你用力咽了咽，想把那感觉压下去，可它仍然存在。你的胃里翻腾不已，仿佛有无数蝴蝶在里面乱飞。第四，你几乎没怎么思考……就点了点头。那动作很轻，几乎难以察觉，但鲁比还是捕捉到了。");
         outputText("[pg][rubi Eir]的阴茎猛地插入，给你的");
         if(!get_player().hasVagina())
         {
            outputText("前列腺");
         }
         else
         {
            outputText("G点");
         }
         outputText("。高潮的能量突然从你的胯间向外爆发。四肢里那种酥麻而饥渴的感觉也随之炸开，冰凉的快感淋遍你的每一根神经。它像潮水般席卷全身，让你的身体绷紧，背脊弓起，四肢剧烈抽动。你张开嘴，忍不住一遍遍尖叫，[say:对，对！]，根本不在乎会不会有人听见。鲁比最后又挺进了一下，让又一阵小小的高潮震过你的身体；随着[rubi eir]身体在这场性爱狂喜中与你合为一体，你也无比清晰地感到自己被填满了。");
         outputText("[pg]鲁比的[rubi cock]在你体内涌动，一股接一股温热黏稠的精液射进你饥渴的");
         if(!get_player().hasVagina())
         {
            outputText("肠道");
         }
         else
         {
            outputText("子宫");
         }
         outputText("。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) >= 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 6)
            {
               outputText("量实在太多了，从你被蹂躏过的");
               if(!get_player().hasVagina())
               {
                  outputText("屁股");
               }
               else
               {
                  outputText("小穴");
               }
               outputText("里溢出来，顺着你的臀瓣淌下，在身下的床铺和地板上积成一滩。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) <= 9)
            {
               outputText("你的体内突然一阵翻腾，鲁比那惊人的量开始把你填满，[rubi eir]种子滑进每一处能容纳它的角落和缝隙。装不下的部分则从你被蹂躏过的");
               if(!get_player().hasVagina())
               {
                  outputText("屁股");
               }
               else
               {
                  outputText("小穴");
               }
               outputText("里化作一小股水流般涌出，在身下的床铺和地板上积成一滩。");
            }
            else
            {
               outputText("你的体内危险地翻腾起来，肚子竟真的鼓胀了起来，显出一圈明显的小腹；鲁比那奢侈的精液裹满你的内里，填满每一处能容纳它的角落和缝隙，甚至还硬生生撑出了新的空间。装不下的部分从你被蹂躏过的穴里如洪水般涌出，把你身下的床铺和地板都覆上一层滑腻的白色光泽。");
            }
         }
         outputText("然而鲁比并没有就此停下；[rubi ey]继续冲击你的[vagOrAss]，让你又经历了好几次小小却震颤全身的高潮，直到[rubi ey]再也承受不住，这才抽身退开，[rubi eir]阴茎仍然相当坚挺，安稳地裹在像外套一样的包皮里。");
         outputText("[pg]你迷迷糊糊地朝[rubi em]勾了勾手指，[rubi ey]便爬上床来到你身边。你伸手抱住[rubi em]，热烈地亲吻[rubi em]，随后把[rubi em]拉进怀里相拥。你们两个彼此依偎在对方怀中，心满意足地小睡了一会儿。");
         saveContent.hadSex = true;
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckRubi() : void
      {
         var _loc4_:* = null as IMap;
         get_images().showImage("rubi-fuck");
         var _loc1_:int = get_player().cockThatFits(rubiCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         clearOutput();
         rubiSprite();
         outputText("你牵起鲁比的手走进卧室，将[rubi em]紧紧搂在怀里。你坐在柔软蓬松的床边，把这个小恶魔" + rubiMF("男孩","女孩") + "拉到你的腿上。你们亲吻着，让你的[tongue]探入伴侣口中的深处。");
         outputText("[pg]你双手沿着鲁比的身体游走，拉扯着、撕开那些隔在你们之间的衣物。你们热烈地纠缠在一起，衣衫四散飞落，没过多久，你们便都一丝不挂，鲁比跨坐在你的腰上。" + rubiMF("他咯咯笑着，将手探到双腿之间","她咯咯笑着，将手探到双腿之间") + "，用纤细的手指握住你的");
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(_loc1_));
         }
         else
         {
            outputText(get_player().clitDescript());
         }
         outputText("。");
         var _loc2_:int = 0;
         var _loc3_:Boolean = get_player().hasCock();
         if(get_player().hasCock())
         {
            if(get_player().cocks[_loc1_].cockLength <= 4)
            {
               _loc2_ = 0;
            }
            else if(get_player().hasCockThatFits(rubiCapacity()))
            {
               _loc2_ = 1;
            }
            else
            {
               _loc2_ = 2;
            }
         }
         else if(get_player().getClitLength() <= 4)
         {
            _loc2_ = 0;
         }
         else if(get_player().getClitLength() <= 12 || get_hyper())
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = 2;
         }
         if(_loc2_ == 0)
         {
            outputText("[pg][say:哦，这里没什么分量嘛，嗯？]鲁比笑着问道，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) <= 5)
            {
               outputText("[say:看来咱俩半斤八两。]");
            }
            else if(rubiBimbo())
            {
               outputText("[say:真可惜，我还超期待能好好来上一炮呢。]");
            }
            else
            {
               outputText("[say:真有点可怜呢，居然被我这么个娇小的小东西比下去了……]");
            }
         }
         else if(_loc2_ == 1)
         {
            outputText("[pg][say:哇哦，你还真够有料的，]鲁比说道，眼中闪着期待的光。");
         }
         else
         {
            outputText("[pg][say:哦，玛莱在上……这东西我根本不可能塞得进去……不过我们还能用它做些别的事。]");
         }
         outputText("[pg]鲁比松开你的");
         if(get_player().hasCock())
         {
            outputText("阴茎");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("后，从你的腿上滑下来，跪在地板上。[rubi Ey]停顿片刻，用[rubi eir]双眼端详着你的");
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(_loc1_));
         }
         else
         {
            outputText("[clit]");
         }
         outputText("，随后俯身试探性地舔了一下，令你的脊背一阵发颤。见你这反应，[rubi ey]微微一笑，又舔了一下，用[rubi eir]柔滑的舌头沿着你的");
         if(get_player().hasCock())
         {
            outputText("肿胀的性器");
         }
         else
         {
            outputText("傲人的阴蒂");
         }
         outputText("一路舔过。鲁比的嘴沿着它来回游走，时而细致轻挑，时而响亮地吮吸。[rubi Eir]舌头在");
         if(get_player().hasCock())
         {
            outputText("你的龟头");
         }
         else
         {
            outputText("你的阴蒂尖端");
         }
         outputText("，让快感的战栗沿着你的脊背一路窜上去。");
         if(get_player().hasCock())
         {
            outputText("令人惊讶的是，在爱人口舌的娴熟挑弄下，你已经撑不了多久，身体也开始绷紧；但在最后一刻，你从鲁比的抓握和双唇间抽身而出，及时停下，没让自己射出来。");
         }
         if(_loc2_ < 2)
         {
            outputText("[pg]你觉得[rubi ey]主导得也够久了，便站起身来到鲁比身后，推着[rubi em]让[rubi eir]胸口和脑袋靠在床沿上。你抬起[rubi eir]尾巴，将你的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            else
            {
               outputText("[clit]");
            }
            outputText("抵在[rubi eir]紧致的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
            {
               outputText("尾穴");
            }
            else
            {
               outputText("小穴");
            }
            outputText("上，把[rubi eir]的唾液和你的爱液混合着抹进[rubi eir]的缝隙里，让[rubi em]在真正的乐趣开始前充分润滑");
            if(rubiBimbo())
            {
               outputText("，不过[rubi ey]其实也不需要额外润滑，因为[rubi ey]已经湿得像水龙头一样直往下滴");
            }
            outputText("。");
            outputText("你向前一挺，将整根都没入鲁比深处；那里充满情欲地一紧一松。借着额外的润滑，你轻松地进出其中，起初只是缓缓抽插。");
         }
         else
         {
            outputText("[pg]你觉得[rubi ey]主导得也够久了，便站起身来到鲁比身后，推着[rubi em]让[rubi eir]胸口和脑袋靠在床沿上。你抬起[rubi eir]尾巴，合拢[rubi eir]双腿，将你的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            else
            {
               outputText("[clit]");
            }
            outputText("抵在[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
            {
               outputText("睾丸");
            }
            else
            {
               outputText("小穴");
            }
            outputText("，把[rubi eir]的唾液和你的淫液混在一起，抹进[rubi eir]双腿间，让[rubi em]在真正的乐子开始前充分润滑起来");
            if(rubiBimbo())
            {
               outputText("，不过[rubi ey]其实也不需要额外润滑——[rubi ey]已经湿得像水龙头一样，正好顺着[rubi eir]双腿往下淌");
            }
            outputText("。");
            outputText("[pg]你向前挺进，你那巨大的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            else
            {
               outputText("[clit]");
            }
            outputText("滑入鲁比的大腿之间，被[rubi eir]紧紧夹住。你感觉到[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("硬挺的肉棒");
            }
            else
            {
               outputText("挺立的阴蒂");
            }
            outputText("正贴压在");
            if(get_player().hasCock())
            {
               outputText("你的肉棒上方");
            }
            else
            {
               outputText("你的阴蒂上方");
            }
            outputText("，你知道每一次抽送都会让[rubi ey]也爽上一阵。");
         }
         outputText("[pg]你一下一下顶得更深，节奏也慢慢加快。鲁比抓紧毯子，闭着眼，咬着[rubi eir]嘴唇。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0 && !rubiBimbo())
         {
            outputText("你重重拍了一下鲁比的屁股，提醒[rubi em]无论发生什么，[rubi ey]现在还不能高潮。[rubi Eir]双眼颤颤睁开，[rubi ey]甚至轻轻呜咽了一声，却连反驳的话都说不出来。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("鲁比的身体一阵战栗颤抖，几乎要瘫倒下去。[rubi Ey]不顾一切地抓住毯子，一股股珍珠白的精液从[rubi eir]肉棒中喷涌而出，溅在[rubi eir]胸口和毯子上。");
         }
         else
         {
            outputText("鲁比的身体一阵战栗颤抖，[rubi ey]几乎要瘫倒下去。[rubi Ey]不顾一切地抓住毯子，发出高潮般的尖叫，[rubi eir]小穴剧烈地收紧又放开。一股淫液从[rubi em]体内喷溅出来，浇在你的胯间，又顺着你和[rubi eir]的双腿往下淌。");
         }
         outputText("[pg]你尽可能坚持着，咬牙撑住，直到再也忍不下去。最后一次深深顶入时，你低吼一声，任由脑中一片空白，被高潮彻底吞没。");
         if(get_player().hasCock() && get_player().cockArea(_loc1_) <= rubiCapacity())
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "一瞬间胀大，随后在你那恶魔般的小性玩物体内深处喷发。");
            if(get_player().cumQ() < 250)
            {
               outputText("你又补了几下抽送，精液便从[rubi eir]穴口慢慢淌出。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("大量精液从[rubi eir]的深处淌出，而你又多顶了几下。");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("精液几乎从[rubi eir]那被操弄过度的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
               {
                  outputText("屁股");
               }
               else
               {
                  outputText("小穴");
               }
               outputText("里涌出来，而你又多顶了几下。");
            }
         }
         else if(get_player().hasCock())
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "胀大了一瞬，随即在鲁比身下喷发，把[rubi em]和毯子溅得");
            if(get_player().cumQ() < 250)
            {
               outputText("沾上了不少你的精液。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("沾上了大量你的精液。");
            }
            else
            {
               outputText("沾上了宛如洪流般强劲、珍珠色的精液。");
            }
         }
         else
         {
            outputText("你的[clit]短暂地悸动胀大，你的" + get_player().vaginaDescript(0) + "反射性收缩，一股暖流震荡全身。淫液顺着你的[legs]流下，解脱感像拍上沙滩的巨浪般将你淹没。");
         }
         outputText("[pg]你踉跄着后退，把你的" + get_player().cockClit(_loc1_) + "从鲁比体内抽出，倒在[rubi em]身旁的床上。[rubi Ey]依偎到你身边，与你躺在混杂的精液水洼里，紧紧抱住你。[saystart]那真是");
         if(rubiBimbo())
         {
            outputText("超");
         }
         else
         {
            outputText("绝对");
         }
         outputText("棒透了，宝贝，[sayend][rubi ey]低声呢喃着，随后沉入满是春梦的梦乡。");
         outputText("[pg]你也有点想就这么睡过去，不过俗话说得好，还有风景等着你看，还有人等着你上。所以你从鲁比身边抽身，匆匆冲了个澡，便返回营地。");
         saveContent.hadSex = true;
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
         rubiAffection(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0)
         {
            _loc4_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc4_,608,FlagDict_Impl_.arrayReadInt(_loc4_,608) + 1);
         }
      }
      
      public function findBimboCheatster() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你不悦地叹了口气。鲁比在跟别人约会？！你可不答应！你离开面包店，朝她住的街区走去。没花多久，毕竟你已经跟她去过那里很多次，就算没有她带路也早把路线记住了。");
         outputText("[pg]你悄悄溜进她家的前院，穿过花园。曾经种着水果、蔬菜和香草的地方，如今开满了映着彩虹般各种颜色的花。一个奇怪的声音让你停下脚步，确认自己没有被发现。你又听见那声音，意识到它来自一扇敞开的窗户。你悄悄靠近，往里面窥探声音的来源。");
         outputText("[pg]她就在那儿——鲁比，赤裸着摊在沙发上，两根手指深深埋进自己的小穴里。你稍微换了个位置，看见她旁边有个晒得黝黑的男人正准备脱掉衬衫。所以，在他们真正做什么之前，你就赶到了。鲁比呻吟着，一只手穿过浅铂金色的头发，盯着那个黝黑的男人。");
         outputText("[pg]你可以在他们继续下去之前打断他们，也可以等到一切结束。");
         menu();
         addButton(0,"打断",interruptTheNTRsYouCrazyFool);
         addButton(1,"旁观等待",waitAndGetNTRedLikeTheBoyBitchYouAre);
      }
      
      public function fancyDate() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         rubiSprite();
         if(get_player().get_gems() >= 10)
         {
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 10);
            statScreenRefresh();
            outputText("[pg]既然你的恋人已经打扮好，准备在城里度过一个夜晚，你决定带[rubi em]去特尔阿德雷最豪华的餐厅。你们手牵着手，一起离开鲁比那间虽小却温馨的家，出发去寻找城里最好的餐馆。鲁比领着你拐过几条街，你发现自己来到“比格比咖啡馆”前；那是一家门面宽阔、气派十足的餐厅。精美的大理石柱分立在这家无可挑剔的店门两侧。");
            outputText("[pg]你像个" + get_player().mf("绅士","淑女") + "该做的那样向鲁比伸出手臂，[rubi ey]也优雅地挽住了你，于是你护送[rubi em]走了进去。店里一位衣着讲究的兔男迎上来，把你们带到桌边，又分别递上一份菜单。他鞠了一躬，说你们的侍者马上就到。你大致扫了一眼菜单，只认得其中少数几道主菜。至少对你来说，这里的许多菜式都显得颇为异国风味。");
            outputText("[pg]片刻之后，你们的侍者来了——那是一位肩膀宽阔的狼人，就算穿上卫兵制服也毫不违和。鲁比点了一份鱼排，说[rubi ey]有点怀念过去的味道。你也决定点同样的东西，毕竟你确信菜单上大部分东西你都只能勉强看懂一小部分。侍者点点头，收走你们的菜单，转身回了厨房。");
            outputText("[pg]这给了你和鲁比一个观察餐厅里其他客人的机会。尽管这家店外观豪华，许多顾客却穿得相当朴素。就算在面包店，或者在湿身婊酒馆看到这些人，你也不会觉得意外。你一瞬间怀疑鲁比是不是打扮得太隆重了，不过看着[rubi ey]穿着那身衣服时如此开心的样子，你确信[rubi ey]根本不会在意。");
            outputText("[pg]你们俩看了一会儿来来往往的人，目光最终不约而同地落在角落里一对独处的狐狸身上。他们正握着彼此的手，低声交谈着，听不清在说什么。");
            outputText("[pg][say: 哦，可是法比乌斯，我是如此爱你，亲爱的，]鲁比突然说道。你一时间有些困惑，随后才意识到[rubi eir]那无可救药的浪漫情怀又占了上风，[rubi ey]只是在把那对狐狸的谈话戏剧化地演出来。");
            outputText("[pg][say: 我知道，我亲爱的卡米拉，但我们必须保守这个秘密。若是我们的家族知晓此事，我们就无法在一起了，][rubi ey]继续用一种模仿男性的声音说道。你忍不住微笑着注意到，即便[rubi ey]试图装出男声，听起来也还是像个天真无邪的年轻女孩。");
            outputText("[pg]随着这场即兴演绎继续下去，你发现自己的注意力不再那么集中在那对情侣身上，而是更多地落在鲁比和[rubi eir]编出的故事上。[rubi Ey]似乎非常迷恋禁忌之爱的想法，尤其是那种真爱——为了不让家族分崩离析而必须被隐藏起来的真爱。两个人看起来无论如何都像是命中注定属于彼此，却又因为这样那样的理由不得不分离；这样的念头深深触动了鲁比。你也意识到，随着这段虚构故事继续，[rubi ey]的眼中已经泛起了泪光。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1008) == 0)
            {
               outputText("[pg]这场假装读唇快要结束时，鲁比忽然停了下来，转头看向你。[say: 我……他们有点像我们，不是吗？你不能留在这里陪我，我也不能跟你一起走。但我们还是能找到属于我们的时刻，就在此时此地，和彼此在一起，不是吗？那就是我最期待的事。能和你共度的那短短几刻，][rubi ey]无比认真地坦白道，泪水在[rubi eir]眼中凝聚。");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,1008,FlagDict_Impl_.arrayReadInt(_loc2_,1008) + 1);
            }
            outputText("[pg]不过最后，你们的菜还是端上来了。鲁比用餐巾轻轻按了按[rubi eir]的眼角，小心不让[rubi ey]为这次约会精心化好的优雅妆容花掉。[say: 好了，这样就够啦，][rubi ey]咯咯笑着说道。[say: 来尝尝这鱼吧。我想知道它会不会比……]鲁比咬下一口，声音渐渐停住。[say: 不，绝对没有，][rubi ey]嘴里还含着鱼肉便得出结论。");
            outputText("[pg]你也尝了尝自己的鱼。味道相当不错");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,777) == 1)
            {
               outputText("，不过比不上你在湖边遇到的水獭姑娘渔夫卡露做的鱼。");
            }
            else
            {
               outputText("，这让你不禁好奇鲁比想的是谁。也许是[rubi eir]父母中的一位？");
            }
            outputText("[pg]等你们各自吃完晚餐后，你付了饭钱，并护送你可爱的约会对象回到[rubi eir]的住处，在这段安静的归途中享受着彼此的陪伴。");
            outputText("[pg]一回到屋里，鲁比就瘫在沙发上，[rubi eir]脸上挂着恶作剧般的笑容。[say: 那么，你打算给我一个美好的晚安“吻”吗？]");
            rubiSexMenu();
            setExitButton();
         }
         else
         {
            outputText("[pg]你觉得自己很想带鲁比去吃一顿精致的大餐，但你确信眼下自己负担不起。");
            outputText("[pg]说真的，你可是勇者啊。不该穷成这样的。");
            menu();
            addButton(0,"下一步",rubiAppearance);
         }
      }
      
      public function exhibitionistShowOff() : void
      {
         outputText("[pg]鲁比明显咽了咽口水，随后点点头，照着你的建议拉开[rubi eir]衣服，在下一个从你们身边经过的人面前露出[rubi eir][rubi breasts]。那名猫族男性惊讶地睁大了眼睛。你们迅速从他身旁经过，急着离开他的视线，以防他的反应不太友好。幸运的是，当他回头看时，你瞧见他脸上浮现出一丝笑意……看来鲁比让他今天值了。");
         outputText("[pg]你用手抚过爱人的身体，又用力捏了捏[rubi eir]的屁股，向[rubi em]保证那名猫族男人很享受刚才的表演……而且[rubi ey]也该向下一个路过的人展示一下。一名马族女人正悠然走来，她身材相当健美，看起来很有力量，正好奇地打量着鲁比和[rubi eir]那身夸张的装束。就在你们三人即将擦肩而过时，鲁比拉开[rubi eir]衣服，露出[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText(rubiCock());
         }
         else
         {
            outputText("闪着水光、湿漉漉的小穴");
         }
         outputText("。");
         outputText("[pg]那名马族女性的下巴微微张开，目光在这个恶魔" + rubiMF("男孩","女孩") + "的胯间，以及你和鲁比的脸之间来回游移。你们两人飞快地从她身旁冲过，直到你爱人这次露出癖的目标彻底消失在视野之外。");
         outputText("[pg]等你们两个钻进一条小巷后，鲁比开始疯狂地咯咯笑起来。[say:太棒了！你看到她的表情了吗？啊啊啊，我太喜欢了！]鲁比花了好几分钟才冷静下来，而等[rubi ey]缓过劲时，[rubi ey]几乎是拽着你又往街上走。[say:快点嘛，我还想再露给更多人看，][rubi ey]直截了当地说道。看来[rubi ey]真的玩得很开心。");
         outputText("[pg]在你们的这场\"约会\"中，鲁比向好几个人露了身体，有时甚至会光着上身，或光着下身到处走。看起来至少此时此刻，[rubi ey]完全没有半点羞耻心。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 ? " 看来，[rubi ey]早就把保守[rubi eir]\"秘密\"这回事抛到脑后了。" : ""));
         outputText("[pg]等你们两人绕回鲁比家时，你估计[rubi ey]至少已经把[rubi eir]的身体露给了十来个人看，而那些人看起来也全都从中得到了刺激。不过最兴奋的还是鲁比。当你们跨过门槛走进[rubi eir]家时，[rubi eir]的身体还在不停颤抖。");
         outputText("[pg][rubi Ey]抓住你的手臂，狂热地吻上你的嘴唇，说道：[say:哦，诸神啊，刚才太刺激了，宝贝。我已经等不及下次再这么做了。它让我真的、[b:真的]好兴奋……你打算怎么处理呢？]");
         rubiSexMenu();
         setExitButton();
      }
      
      public function exhibitionistDate(param1:Boolean = false) : void
      {
         rubiSprite();
         var _loc2_:Boolean = !get_player().isTaur() && get_player().hasVagina() && (get_player().hasKeyItem("Dildo") || get_player().hasKeyItem("Deluxe Dildo") || get_player().hasKeyItem("Demonic Strap-On"));
         outputText("[pg]你仔细琢磨着能去哪儿。既然[rubi em]打扮得像现在这么放荡，你觉得像样的晚餐肯定是没戏了。不过，也许你们可以在城里散散步，找点乐子。你搂住爱人的腰，两人一同踏进特尔阿德拉温暖的空气中。");
         outputText("[pg]你们离开了城中人流更密集的大道。鲁比有些不自在地扭动着身体，还不习惯在街上这么……暴露。你凑到[rubi eir]耳边低声鼓励，说[rubi ey]现在看起来有多性感，没必要为炫耀自己的魅力感到难为情。事实上，你还提议，[rubi ey]甚至可以向路过的陌生人再多展示一点。");
         if(param1)
         {
            menu();
            addNextButton("露给别人看",exhibitionistShowOff).hint("让鲁比向你们遇到的任何人暴露[rubi em]自己。");
            addNextButton("露天做爱",exhibitionistAnal).hint("把鲁比带进一条小巷，肛交操[rubi em]。").disableIf(!get_player().hasCock() && !_loc2_,"需要一根阴茎，或合适的替代品。").disableIf(get_player().hasCock() && get_player().cockThatFits(rubiCapacity()) < 0,"你的阴茎对鲁比来说太大了，承受不了。");
         }
         else
         {
            exhibitionistShowOff();
         }
      }
      
      public function exhibitionistAnalEnd() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("[pg][say: 那真是……]鲁比停顿了一下，喘匀气后将你拥进[rubi eir]怀里。[say: 太棒了，宝贝。]");
         outputText("[pg]你匆匆吻了[rubi em]一下，随后[if (isnaked) {捡起你的[inv]|穿上你的[armor]}]，牵起[rubi eir]的手，和[rubi em]一起[if (singleleg) {滑行|迈步}]走上街道。你毫不怀疑，任谁都能看出你们刚才干了什么——[if (hascock) {痕迹还在你身后一路拖着|你们俩身上简直满是那股味道}]，毕竟如此——但在你和[rubi em]并肩[walk]回家时，鲁比似乎完全不在意。事实上，等你们进了[rubi eir]家的前门时，[rubi ey][if (rubihascock) {的下身[if (denial) {仍然|已经}]硬着，}]浑身发抖，随即迫不及待地把你拽进[rubi eir]的卧室。");
         outputText("[pg][say: 诸神啊，刚才真是" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1007) == 1 ? "太不可思议了" : "我们至今最棒的约会之一") + "，]鲁比脱口而出，随即[if (redskin || rubifur) {别过脸去|涨红了脸}]。[say: 我[if (denial) {快撑不住了|忍不住了}]，宝贝。我们得再来一次。]");
         saveContent.hadSex = true;
         get_player().orgasm("DickVaginal");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,608,FlagDict_Impl_.arrayReadInt(_loc1_,608) + 1);
         }
         rubiSexMenu();
         setExitButton();
      }
      
      public function exhibitionistAnalDildo() : void
      {
         clearOutput();
         outputText("你给鲁比一分钟整理[rubi em]自己，自己则从[inv]里取出玩具[if (strapon) {，把它固定好时，你几乎觉得自己也像个魅魔。|[if (vines) {，命令你的藤蔓把它绑|，又捡起巷子里散落的几段绳子。也只能凑合用了；你一边尽量不去想它们是从哪来的，一边把假阳具绑}]在身上，做成一副临时背带。}]你走近时，你的新肉棒无声地垂落到鲁比的[if (rubifur) {毛皮|赤裸皮肤}]上。整个[day]都在你脑海中闪回，像一片狂乱而发热的模糊影像，一路把你带到这里。此刻，你和爱人一同站在特尔阿德雷的街头，暴露在所有人眼前，将顶端缓缓送入爱人的后穴。");
         outputText("[pg]毕竟，鲁比一直都知道该怎么让你[if (cor < 25) {放开自己|索取你想要的一切}]。你也许甚至该为此感谢[rubi em]，不过当你一[if (metric) {厘米接一厘米|寸接一寸}]地没入[rubi em]时，[rubi eir]口中传出的饥渴呜咽大概会盖过你的话。不过[rubi Ey]还该得到更多，于是你的手指沿着[rubi eir][if (rubifur) {丝滑的毛发|敏感的肌肤}]一路滑去，[if (rubihascock) {握住[rubi eir]肉棒|掠过[rubi eir]阴蒂}]，在你的胯部终于与[rubi eirs]相贴时轻柔地抚弄着[rubi em]。当你将自己顶到根部，[rubi ey]在你手中悸动不已，小腹里泛起酥麻的暖意，让你的呼吸都随之发颤。");
         outputText("[pg]你当然还想多感受一些那滋味，于是俯身靠近，在爱人身上慵懒地磨蹭着，而[rubi ey]在你身下喘息不止。你挑逗着[rubi em]，[rubi Eir]情欲已经黏在你的指间，每一次缓慢的挺进，都让你们贴着彼此一同颤抖。鲁比究竟等了多久，才等到" + (get_player().mf("male","female") == rubiMF("male","female") ? "另一个" : "一个") + "[man]这样彻底地占有[rubi em]？");
         outputText("[pg]而[rubi ey]现在确实属于你了。你的肉棒深深埋在[rubi em]体内，[rubi ey]在你的抚弄下扭动不已。每一次颤抖都传回你身上，在你的[clit]上激起阵阵悸动，可你仍想要更多，于是用空着的手陷进[rubi eir]柔软丰腴的臀肉里，直到[rubi ey]愉悦地倒抽一口气。再稍微用力一点，你的[if (hasclaws) {爪子|手指}]便抠进鲁比的[if (rubifur) {华美皮毛|[if (redskin) {本就泛红的|瓷白的}]肌肤}]里，[rubi ey]也本能地向后一顶[rubi eir]臀部，那股压力瞬间点燃了你的小腹。");
         outputText("[pg]你当然很想让鲁比再来一次，但又不想让这一刻结束得太快，于是只好把[rubi eir]裙子往上推，沿着[rubi eir]脊背一路落下安抚的亲吻，把满腔爱意都倾注给[rubi em]。[rubi Ey]因这番折腾而温热，带着汗水的咸味，那柔软的触感更是让人分心；当你的手沿着[rubi eir]身体两侧丝滑的[if (rubifur) {皮毛|肌肤}]游走时，你几乎听不清远处传来的那些声音。你心里有一部分在想，他们是不是听见了你们欢愉时湿滑的肉体交合声，可小腹中不断积聚的紧绷感显然更令人难以抗拒。每当你的臀部撞上鲁比的屁股，你的身体就绷得更紧一分，将所有担忧都彻底淹没。");
         outputText("[pg]然而这一切，都比不上[rubi ey]呼唤你名字的瞬间，[rubi eir]声音随着每一次挺动而发颤。[if (cor < 25) {平时你或许会觉得难为情，但听到|听到}][rubi em]在你的疼爱下逐渐失控，仍让你小腹一阵悸动。你迫不及待想给[rubi em][rubi ey]所需要的一切，于是环抱住[rubi em]，动作变得更快。[rubi eir]一只手擦过你的[skindesc]，一路摸向[rubi eir]的[if (rubihascock) {肉棒，急切地套弄着它|闪着水光的阴唇，手指轻易滑入其中}]，而[rubi ey]也朝着[rubi eir]的[if (denial) {始终无从到来的释放|第二次高潮}]飞快奔去。");
         outputText("[pg]鲁比[if (denial) {还没被折磨够呢|绝对配得上[rubi eir]的奖励}]，于是你决定[if (denial) {放慢节奏，只是|帮[rubi eir]一把，}]贴着[rubi em]研磨，同时尽全力[if (rubihascock) {找准[rubi eir]最敏感的地方|将[rubi eir]彻底填满}]。[rubi eir]每一次[if (rubihascock) {套动|挺动}]都让[rubi eir]全身颤抖，而你的脑海里只剩小腹中脉动的热意，以及爱人手指急切动作发出的声响，将你们一同推向边缘。[rubi Ey]一定知道你快到了，随着你唇间溢出的每一声喘叫，[rubi eir]臀部也一次比一次更用力地向后顶向你。");
         outputText("[pg]你把脸埋进[rubi eir]背上，将[rubi em]抱得更紧，在高潮席卷全身时怎么也不愿放开[rubi em]。你只能贴着鲁比颤抖，空虚的[vagina]阵阵痉挛，而那恶魔般的[rubi boy]则向后顶来，将你整根吞到最深处。[rubi eir]每一次颤抖都撞进你怀里，夺走你的呼吸，空气中只剩鲁比的叫声回荡，而[rubi ey][if (denial) {无助地扭动，始终得不到释放|也随你一同越过顶点}]。你们几乎连站都站不稳，只能彼此贴着发抖，向前瘫倒，直到浑身是汗、喘息不止地纠缠成一团。任何人都可能撞见你们这副模样，而你仍深埋在爱人体内；但你怀疑自己就算想[if (singleleg) {站稳|起身}]也做不到，哪怕守卫队长[if (urtaexists) {她|他}]本人就站在你身边。");
         outputText("[pg]等你终于攒够力气再次动起来时，鲁比的裙子正贴在你的[skindesc]上。[rubi Ey]看起来也没好到哪去；当你把[rubi em]拉得更近，让嘴唇沿着[rubi eir]的后背轻轻掠过、沉浸在[rubi eir]的温暖里时，[rubi ey]也只勉强发出一声[if (denial) {颤抖的|满足的}]叹息。不过，就算你很想再这样多待一会儿，特尔阿德雷的小巷也实在不是什么适合依偎的地方。于是你一边对鲁比说着赞美的话，让[rubi em]放松下来，一边慢慢从[rubi eir]体内深处抽出，并扶着[rubi em]站起来。");
         outputText("[pg]你让鲁比稍等一下，好让你收拾好自己，[if (strapon) {只花片刻松开你的玩具并把它塞回|然后[if (vines) {让藤蔓松开束缚|解开绳索}]，再把你的玩具放进}]你的[inv]里。这里唯一能证明你们来过的痕迹，就是[if (denial) {[if (issquirter) {你自己的淫液在石板上闪着湿光|正在迅速消散的性爱气味}]|[if (rubihascock) {一小片精液污痕|鲁比体液留下的水光}][if (issquirter) {，还混着你自己的那份[if (rubihascock) {淫液}]}]}]。");
         doNext(exhibitionistAnalEnd);
      }
      
      public function exhibitionistAnalCock() : void
      {
         clearOutput();
         outputText("你给了鲁比一分钟，让[rubi em]平复一下，然后把你的[cock]对准[rubi eir]穴口，让[rubi em]感受前端一阵阵搏动的热意。[if (denial) {[rubi Ey]自从上次被你挑逗后，[if (rubihascock) {一点都没软下去|看起来也没放松多少}]，现在还在发抖|[if (hascock) {尽管[rubi ey]刚刚才高潮过，[rubi ey]已经又硬了起来，并向|[rubi Ey]显然并不满足于只高潮一次，已经向}]}]你贴过来，[if (rubihascock) {还用|用}][rubi eir]柔软的臀瓣夹着你的整根来回磨蹭。不过这对你来说还不太够；当你往下滑去，把龟头紧紧抵在[rubi eir]穴口时，鲁比的呼吸顿时急促起来——看样子，[rubi ey]也同意这一点。");
         outputText("[pg][rubi eir]臀部那一下扭动，简直是你无法拒绝的邀请。你缓缓向前顶去，鲁比[if (rubimale) {少女般的}]呻吟声充满你的耳畔，直到你的[cock]前端终于没入[rubi eir]深处。温热从四面八方包裹并挤压着你，你继续向[rubi em]体内深入，让[rubi eir]丝滑的内壁按摩着你的肉棒，也让[rubi ey]逐渐适应你的长度。再深一点，你便完全滑入了你的恶魔[rubi boy]爱人体内，抓住[rubi eir]的屁股借力，而[rubi ey]则在板条箱上方扭动着身体。");
         outputText("[pg]你的第一下挺进来得很慢，动作轻柔，让[rubi eir]的温暖抚过你的[cock]。听见身下鲁比正在[if (rubihascock) {抚弄着|操弄着}][rubi em]自己，显然还渴望着更多快感，你忍不住笑了起来。既然这是[rubi ey]想要的，你当然乐意奉陪，于是先把自己埋进鲁比那销魂的热意之中，随后便任由本能接管，开始认真地猛干[rubi em]。现在任谁都能听见你们的动静了，每一次" + (get_player().skin.desc == "skin" ? "肉体" : (get_player().hasGooSkin() ? "黏胶" : "[skindesc]")) + "与肉体相撞的声响都在小巷里回荡，你的腰胯一次次撞上[rubi eirs]；可你怀疑，就算此刻守卫队长[if (urtaexists) {她|他}]本人站在你身后，你也未必停得下来。");
         outputText("[pg]可你反而加快了速度，沉溺在[rubi eir]内壁包裹而来的温热里，也沉溺在每一次挺入时从鲁比唇间逸出的可爱声音里。[rubi Eir]的热情只会让你更用力地填满[rubi em]，将自己的整根都没入[rubi em]体内，直到[if (cocklength > 6) {再也塞不下更多|你已经尽数没入}]。[rubi eir]每一次颤抖都回荡到你身上，沿着你的[cock]一阵阵荡开，让你的[if (hasballs) {[balls]|身体}]因欲望而绷紧。你才刚露出一点想要抽身的迹象，鲁比的尾巴就立刻拍打在你的胸口，[rubi em]身体的每一处都在竭力确保你不会离开。");
         outputText("[pg]既然[rubi ey]想要这样，你也乐意留下来，摆动腰胯，又从你饥渴的爱人口中逼出一声喘息。毕竟，鲁比柔软的屁股简直就是为了容纳你的精液而生，而[rubi ey]也清楚这一点；随着你在[rubi em]体内滑得更深，[rubi eir]肉壁把你夹得更紧。那紧致的肉壁仿佛在呼唤你，丝绒般的吸力让你的脑海里只剩下即将到来的释放，你的[if (hasballs) {睾丸因欲望翻涌|[cock]因欲望悸动}]。");
         outputText("[pg]短暂的停顿便是鲁比收到的唯一预警，下一刻你便尽可能深地顶了进去，[if (rubihascock) {每当你的龟头擦过[rubi eir]敏感点时，都任由鲁比的颤抖抚弄着你|一边揉捏着[rubi eir]屁股，一边听着[rubi eir]手指发出的湿滑声响，把你推向临界点}]。[if (denial) {虽然[rubi ey]不被允许让[rubi em]自己高潮，但你可没有克制的必要，于是不断撞进[rubi em]体内，直到[rubi eir]力气耗尽，瘫倒在你的怀里。|不过最先越过临界点的是[rubi Ey]，当[rubi eir][if (rubihascock) {精液溅上地面|淫液溅上你的[legs]}]时，[rubi eir]叫声在街道上回荡，用[rubi eir]欲望的痕迹把[if (rubihascock) {地面|它们}]染湿。}]你不得不扶住[rubi em]，而[rubi ey]则在你身上[if (denial) {无助地颤抖着|紧紧夹住}]，竭尽全力榨出你的精液。");
         outputText("[pg]而这确实奏效了。每一次抽动都让那熟悉的热意在你腹中汇聚，你加快了节奏，最后一次深深埋入，随即你的[cock]抽搐起来，把精液全数灌进鲁比迎接你的深处。你们同时发出一声呻吟；你[if (cumquantity > 500) {洪水般灌满|填满}]了[rubi em]，恶魔[rubi boy]的内壁一波接一波地榨出你的精液，直到[rubi eir]体内每一[if (metric) {厘米|英寸}]都肯定被你的精液覆盖。[if (cumquantity > 500) {量多到很快便从[rubi eir]的穴口流出，滴落到地上，并[if (denial) {把地面染得一片雪白|与鲁比[if (rubihascock) {自己的精液|的淫液}]混在一起。}]}]等你这场[if (cumquantity > 500) {猛烈}]高潮渐渐平息时，你几乎连靠向[rubi em]的力气都挤不出来，只能搂住鲁比那[if (redskin || rubifur) {汗津津的|汗湿而泛红的}]身体，沉进[rubi eir]温暖带来的舒适之中。");
         outputText("[pg]虽然你很想在这里多待一会儿，但你觉得你们俩至少也该试着装出点体面的样子。你刚一动作，慢慢从[rubi em]体内退出来时，鲁比发出那声可爱的轻叫，就已经足够算作奖励了。等你终于完全抽离出来，[rubi ey]身子一软向前倒去，还得靠你扶着才能站稳。你的精液在[rubi em]体内泛着湿亮的光，每当[rubi ey]颤巍巍地迈出一步，就会从[rubi eir]裙摆下溅落出来。");
         outputText("[pg]所谓体面也就这样了。");
         doNext(exhibitionistAnalEnd);
      }
      
      public function exhibitionistAnal() : void
      {
         clearOutput();
         registerTag("redskin",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3));
         registerTag("rubifur",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2));
         registerTag("rubimale",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) == 0));
         registerTag("taller",TagFun_Impl_.fromBool(get_player().get_tallness() > 63));
         registerTag("shorter",TagFun_Impl_.fromBool(get_player().get_tallness() < 57));
         registerTag("denial",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0));
         registerTag("strapon",TagFun_Impl_.fromBool(get_player().hasKeyItem("Demonic Strap-On")));
         registerTag("vines",TagFun_Impl_.fromBool(get_player().get_armor().get_id() == get_armors().VINARMR.get_id()));
         outputText("[say:在这里？]鲁比明显咽了口唾沫，随后点点头，跟着你走，紧紧攥住你的手，和你一起溜进一条小巷。头顶的建筑[if (isday) {为你们挡住毒辣的阳光|将你们笼罩在阴影里}]，但任何朝这条街巷里看上一眼的人，都肯定会知道你们在做什么；你领着鲁比沿鹅卵石路往前走时，[if (cor < 25) {你们俩都因紧张而兴奋地发颤|光是这种刺激感就让你浑身发颤}]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1001) == 1 ? "，[rubi eir]恶魔般的尖刺似乎每一步都在宣告你们的存在" : "") + "。不过从这条路的状况来看，已经很久没人来过——至少没人清扫过——这里了；只要能让你们的[day]冒险不被哪个跑去叫守卫队的人打断，你完全愿意[if (singleleg) {留意|踩过}]那些散落的垃圾。");
         outputText("[pg]再往前走一段，你终于找到了需要的东西：一个翻倒的板条箱，够大也够稳，可以让鲁比把[rubi eir]手撑在上面——但还不是现在。你这样告诉[rubi em]，同时让手指滑进[rubi eir]裙子的布料下。光是碰到[rubi eir][if (rubifur) {柔软的白色皮毛|光滑的[if (redskin) {红色|苍白}肌肤}]，就让[rubi em]扭动起来，于是你进一步逗弄这个恶魔[rubi boy]，把[rubi eir]一边裸露的臀瓣托在掌心，揉捏那柔软的肉。第一次挤压时，[rubi em]口中漏出一声[if (rubimale) {可爱得像女孩子一样的}]轻叫；但[if (rubihascock) {鲁比两腿间逐渐隆起的鼓包|鲁比在你手上磨蹭的样子}]已经足以证明[rubi eir]有多享受。");
         outputText("[pg][if (rubifur) {[rubi Ey]显得出乎意料地害羞|[rubi Ey][if (redskin) {比平时更红了|真的脸红了}]}]。[rubi ey][if (taller) {抬头|[if (shorter) {低头|转头}]}]看向你，嘴唇才刚微微分开，你便[if (taller) {俯身|[if (shorter) {踮起身|凑上前}]}]过去，将那双唇占为己有。不过这吻只持续了一瞬，你便带着微笑[if (singleleg) {挪|退}]开，让慌乱的鲁比还等着更多。毕竟，你绝不会做任何让[rubi ey]不舒服的事，而且[rubi ey]刚才看起来确实有点犹豫……");
         outputText("[pg]虽然[if (rubihascock) {[rubi eir]裙子里那顶抽动的小帐篷|紧紧缠在[rubi eir]腿上的尾巴}]已经足以作答，但最吸引你注意的，还是那带着羞意却急切无比的点头。如此乖巧当然该得到奖励，这一次你认真地吻住鲁比的唇，享受着你的手沿[rubi eir]后背滑下时，[rubi ey]随之战栗的反应。纤薄的布料几乎遮不住那股[if (rubifur) {积聚在[rubi eir]皮毛下|从[rubi eir]肌肤上散发出来}]的热意；你的手指继续向下，绕过鲁比的尾巴，顺着[rubi eir]屁股柔韧的曲线滑去，将它握入掌中。");
         outputText("[pg]真没想到你之前还不确定[rubi ey]会不会答应，可现在[rubi eir]的嘴却急切地贴着你的唇，在你用牙齿逗弄[rubi eir]的下唇时轻轻呜咽。特尔阿德雷[if (isday) {炽热|凉爽}]的空气拂过你的[skindesc]，[if (isday) {但与你们之间的热意相比根本不算什么|正好缓解了}]你们之间的热意，尤其是在鲁比的双手搭上你的肩膀、[rubi ey]加深这个吻之后。这个恶魔[rubi boy]的每个动作里都透出[rubi Eir]柔软而温存的爱意，[rubi eir]的舌头寻到你的舌头，不管你多用力地将手指蜷进[rubi eir]柔软的[if (rubifur) {毛皮|肌肤}]里，那缓慢而撩人的节奏都从未乱过。");
         outputText("[pg]远处路过的脚步声传入耳中，但你们谁也无心在意。此刻，唯有鲁比用甜蜜的亲吻和丝滑的触碰填满了你的整个世界，[rubi eir]的手指在你的[skindesc]上游走，直到一声低沉沙哑的呻吟从你胸中涌出。你真能在这里待上几个小时，在每一次温柔爱抚中越发放松，一边深深品尝鲁比，一边任由[rubi ey]将爱意倾注在你身上。不过就连你也得呼吸，所以你极不情愿地退开，临走还偷走了又一个吻。");
         outputText("[pg][rubi Ey]全神贯注地看着你[if (isnaked) {赤裸地站在[rubi em]面前|脱下你的[armor]}]，但当[rubi ey]伸手去碰[rubi eir]的[if (!isnaked) {自己那身}]衣服，而你轻轻握住[rubi eir]的手时，那目光很快就变成了惊讶。你告诉[rubi em]，[rubi Ey]得把它们穿在身上，而[if (rubifur) {虽然[rubi eir]的毛皮也许能遮住[rubi eir]的脸红，却盖不住[rubi eir]的手掌在你掌心里发颤的样子|听了你的话，鲁比的脸立刻[if (redskin) {更暗了几分|红了起来}]}]。毕竟，你可不是为了再脱下来才把[rubi em]打扮成这样的；再说，[rubi eir]那[if (rubihascock) {肉棒|曲线}]在[rubi eir]裙下大方显露的模样，只会让[rubi em]更可爱。这让你又得到一个羞怯的点头，而鲁比几乎兴奋得蹦起来，看着你把木箱推到墙边。");
         outputText("[pg]趁你分神，鲁比飞快地偷了一个吻，随后挪到位置上，微微俯下身，正好露出[rubi eir]裙摆下的[if (rubihascock) {硬挺肉棒|湿亮阴唇}]。尽管[rubi eir]如此兴奋[if (cor < 25) {——也许你的理智也在提醒你——|，}]你却并不急，[if (singleleg) {俯低身子|蹲下}]来到[rubi em]身旁，沿着[rubi eir]的[if (rubihascock) {肉棒|阴唇}]挑逗地舔了一下，让[rubi eir]的热意在你舌尖蔓延。[rubi Eir]双腿发颤，你一路向上，细细照顾着[rubi em]的[if (metric) {每一处|每一寸}]，直到抵达[rubi eir]鼓胀的[if (rubihascock) {睾丸|阴蒂}]，并用双唇含住[if (rubihascock) {它们|它}]。");
         outputText("[pg]毕竟，[rubi Ey]向来喜欢被你这样逗弄；当你的舌头卷过[rubi eir][if (rubifur) {最敏感的部位|敏感肌肤}]时，[rubi ey]在你口中已经一阵阵悸动，让鲁比那[if (rubihascock) {可爱|诱人的女性}]滋味充满你的感官。没过片刻，[rubi eir]的欲液便滴到你的[if (rubihascock) {[chest]|脸上}]，黏热地沾在你的[skindesc]上。这正是你待会儿需要的东西，于是你温柔地[if (rubihascock) {亲吻[rubi eir]肉棒的顶端|含吮[rubi eir]的阴蒂}]，感谢鲁比的好意，而[rubi ey]始终急切地在你的唇上磨蹭。");
         outputText("[pg]不过，你的[if (hascock) {[cock]|[vagina]}]也在催促着你把注意力转回来，于是你最后一次卷动舌尖，[if (singleleg) {向后挪开|站起身来}]，让鲁比在失去你的触碰后无助地颤抖着。[rubi Eir]的[if (!rubihascock) {另一处}]穴口随着[rubi eir]臀部每一次摇动，从[rubi eir]的裙摆下若隐若现；只消瞥见[rubi eir]可爱的屁股，你便忍不住[if (hascock) {用手指顺着自己的肉棒来回抚弄，催促它完全硬挺起来|将手指探入阴唇之间，沾满自己的淫液}]。鲁比留在你[if (rubihascock) {胸口|脸颊}]上的那份体液依旧黏滑，很快便与你自己的体液混在一起，直到你们交融的爱液在你的指尖泛起湿亮的光泽。");
         outputText("[pg][rubi Ey]浑身一紧，你把它涂抹在[rubi eir]入口周围，按摩着那圈紧绷的肌肉，直到[rubi ey]放松到足以让你将指尖探进[rubi eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1010) > 1 ? "逐渐适应的" : "") + "深处。随着你越陷越深，石板上传来的蹄声让你屏住了呼吸。你们谁也不敢动，甚至不敢喘气，直到那声音终于渐渐远去。想到自己可能会被人撞见这副模样——堂堂英格纳姆的勇者，在特尔阿德雷肮脏的后巷里，手还插在" + (get_player().mf("male","female") == rubiMF("male","female") ? "另一个" : "一个") + "[rubi boy]的屁股里——一股[if (cor < 25) {羞耻的|难以忍受的}]热意便涌上心头。而从鲁比大腿间那[if (rubihascock) {饱胀跳动的肉棒|闪着水光的湿意}]来看，[rubi ey]也有同样的感觉。");
         outputText("[pg]随着你一点点深入，鲁比喉咙里漏出一声呻吟。你[if (rubihascock) {摸索着寻找[rubi eir]前列腺|用另一只手揉弄[rubi eir]阴蒂}]，挑逗着这个喘息不止的恶魔[rubi boy]，直到[if (denial) {[rubi ey]呜咽起来[if (rubihascock) {，你的另一只手包住[rubi eir]憋得发胀的睾丸|，满是快感。直到[rubi ey]几乎要到达顶点时，你才把手指往下探，让它们滑进[rubi eir]空虚的入口}]，而你提醒[rubi em][rubi ey]不许高潮。[rubi Eir]双腿发颤，哪怕只是最轻微的触碰也会让[if (rubihascock) {[rubi eir]肉棒悸动|[rubi ey]在你身上收紧}]，但即使你[if (rubihascock) {一遍遍抚弄[rubi em]|将[rubi em]彻底填满}]，[rubi ey]也没有失控|[rubi eir][if (rubihascock) {肉棒猛地颤抖，把[rubi eir]精液洒在石地上|身体颤抖着，每一下哆嗦都紧紧夹住你}]}]。当你夸奖[rubi eir][if (denial) {克制|热切}]时，[rubi Ey]羞涩地笑了笑；而你从[rubi em]体内缓缓退出时，[rubi ey]依然浑身发抖，早已靠着木箱瘫软下去，努力喘匀呼吸。刚才那番表演已经把你撩得够呛，接下来[rubi Ey]确实需要好好喘口气。即便如此，当你掀起[rubi eir]裙子、让[rubi em]暴露在外时，[rubi ey]仍然诱人地扭动着身体。");
         if(get_player().hasCock())
         {
            doNext(exhibitionistAnalCock);
         }
         else
         {
            doNext(exhibitionistAnalDildo);
         }
      }
      
      public function dressUpRouter(param1:String) : void
      {
         clearOutput();
         rubiSprite();
         if(param1 == "Suitclothes")
         {
            putOnASuitYouSlut();
         }
         else if(param1 == "A Waitress\'s Uniform")
         {
            putRubiInAWaitressUniform();
         }
         else if(param1 == "Rubber Fetish Clothes")
         {
            rubiHasARubberFetish();
         }
         else if(param1 == "A Green Adventurer\'s Outfit")
         {
            goOnAnAnalAdventureRubiNotReallyJustAnAdventurersOutfit();
         }
         else if(param1 == "A Tube Top")
         {
            putOnATubeTopYouWhore();
         }
         else if(param1 == "A Sheer Bodysuit")
         {
            putOnMyBodysuitYouWhore();
         }
         else if(param1 == "A Long Ballroom Dress")
         {
            giveRubiALongDressToHideHerHideousBody();
         }
         else if(param1 == "A Dashing Outfit With Tight Leather Pants")
         {
            putOnADashingOutfitYouWhore();
         }
         else if(param1 == "A Skimpy Nurse\'s Outfit")
         {
            rubiPutsOnNursesClothesSoSheCanCheckYourTemperature();
         }
         else if(param1 == "Slutty Swimwear")
         {
            putOnSluttySwimwearYouSkank();
         }
         else if(param1 == "A Bimbo Minidress")
         {
            putOnADressYouBimbo();
         }
         else if(param1 == "Bondage Straps")
         {
            putOnBondageStrapsYouBondageTrap();
         }
         else if(param1 == "An Inquisitor\'s Corset")
         {
            whyTheFuckIsRubiWearingAnInquisitorsCorset();
         }
         else if(param1 == "A Risque Waitress\'s Uniform")
         {
            putOnAWaitressUniformYouWhore();
         }
         else if(param1 == "An Adventurer\'s Outfit")
         {
            goOnAnAnalAdventureRubiNotReallyJustAnAdventurersOutfit();
         }
      }
      
      public function dontCareAboutNoCheatingRubis() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你耸耸肩。这其实不关你的事，不是吗？你想跟谁上床都可以，她也一样。");
         outputText("[pg]你站起身离开面包店，决定继续在特尔阿德雷逛逛。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dildoFuckRubi() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("rubi-dildo-fuck");
         clearOutput();
         rubiSprite();
         if(!get_player().hasCock())
         {
            outputText("你没有能好好操鲁比一顿的家伙事儿，但你倒是有一样东西。");
         }
         else
         {
            outputText("虽然你确实有能好好操鲁比一顿的家伙事儿，但你更想用点别的。");
         }
         outputText("你从[inv]里取出地精制造的假阳具，鲁比的眼睛立刻睁大了。[say:哇，][rubi ey]说着，伸手去摸它。[rubi Ey]双手沿着它的全长抚过，对它的颜色、形状和尺寸惊叹不已。");
         outputText("[pg][say:我……我们可以用它吗？]鲁比忐忑地问道。你点点头，[rubi eir]脸上绽开的笑容只能用狂热来形容。你们俩迅速开始脱衣服，直到彼此都一丝不挂。");
         outputText("[pg]你先把假阳具用在自己身上，让顶端沿着你的身体滑动，同时它开始分泌那种美妙的催情物质。");
         if(get_player().hasVagina())
         {
            outputText("你迅速把顶端抵进你的小穴，先让它尝尝接下来要享用的滋味。短暂的接触就足以让你因快感微微颤抖。");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你让假阳具顺着身体一路游移，直到来到乳房前；你带着一丝笑意，把顶端直接插进一侧乳头，享受着乳房因欲望而胀大的感觉。另一侧乳头也如法炮制，来回折腾了好一会儿。");
         }
         outputText("最后，你把假阳具送到嘴边，舔去上面的液体，急切地吞下地精的性药。");
         outputText("[pg]鲁比屏息凝神地看着，你看得出[rubi ey]正急切地等着[rubi eir]那一轮。你四肢着地，爬到" + rubiMF("him","her") + "身上，把假阳具抵在[rubi eir]皮肤上，让药效尽情发挥。[rubi Eir]的皮肤泛起潮红，[rubi ey]也本能地弓起[rubi eir]脊背。");
         outputText("[pg]你很喜欢它在鲁比身上产生的效果，于是放慢动作，先把顶端抵上那双艳丽的宝石红嘴唇，让[rubi eir]尝尝滋味。");
         if(!rubiBimbo())
         {
            outputText("那双唇颤抖着分开，[rubi eir]的舌头探出来，舔尝着假阳具。");
         }
         else
         {
            outputText("那双唇轻易分开，[rubi eir]的舌头长长地舔了一口，只为尝尝假阳具的味道。");
         }
         outputText("[rubi Ey]显然觉得很合口味，因为[rubi ey]立刻用[rubi eir]嘴唇含住顶端，像对待真正的肉棒一样吮吸、吞吐起来。");
         outputText("[pg]你不得不把它从鲁比嘴里拽出来，并告诉[rubi em]有个办法能让你们俩都从中爽一爽。你催促鲁比躺下，然后伸手向下，把假阳具的顶端抵在");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
         {
            outputText("[rubi eir]紧窄的后穴上");
         }
         else
         {
            outputText("[rubi eir]紧窄的小穴上");
         }
         outputText("，起初那里还有些抗拒，但药效稍一发挥，它就顺利滑了进去。假阳具没入体内时，鲁比甚至轻轻咕哝了一声。");
         outputText("[pg]你也躺下来，把另一端对准你的[vagOrAss]，让它滑入其中。药效彻底发作，暖意向外扩散，你的全身都被欲望点燃。");
         if(get_player().hasVagina())
         {
            outputText("你的[clit]硬了起来，渴望着被关注。它从你的褶缝间探出头来，像一只害羞又淫荡的小妖精。");
         }
         if(get_player().hasCock())
         {
            outputText("与此同时，[eachCock]也硬了起来，随着药效侵袭而阵阵悸动。");
         }
         if(get_player().lactationQ() > 0)
         {
            outputText("随着暖意蔓延到全身，连你的乳房也没被放过。你的乳头变硬，开始渗出乳汁，乳汁顺着身体两侧淌下，被身下的软垫吸收进去。");
         }
         get_player().cuntChange(30,true,true,false);
         outputText("[pg]你扭动着靠近鲁比，任由假阳具在你们两人体内更深地[if (metric) {滑入|寸寸挪入}]。你的小恶魔搭档随着每一下细微动作都[say:哦哦]、[say:啊啊]地叫着。你感觉到这玩具正随着你们更多体液渗入而变得更粗。想要更多刺激的你伸手抓住玩具中段，前后摇动，同时操弄着你和鲁比。");
         outputText("[pg]热意越发滚烫，你的身体随之颤抖。你感觉全身烫得像在燃烧，而唯一能浇熄这团火的办法就是高潮。鲁比紧抓着枕头，在粉色假肉棒上前后磨动，这只会让你体内的火烧得更旺。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0)
         {
            outputText("[pg]在一瞬间的清醒中，你抬起头直直看向鲁比，大声命令[rubi ey]在这一切期间最好不准高潮，否则你会很不高兴。[rubi Eir]的眼睛睁大了，[say:什——什么？我需要高潮，" + get_player().mf("sir","miss") + "！我的身体，好烫！]你低吼着说这是明令禁止的，[rubi ey]最好学会控制[rubi em]自己，否则后果自负。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
         {
            outputText("[pg][rubi Eir]的身体颤抖着抽搐起来，[rubi eir]的");
            if(!rubiIncubus())
            {
               outputText("小鸡巴");
            }
            else
            {
               outputText("恶魔鸡巴");
            }
            outputText("抽动起来，一股股精液喷射到[rubi eir]的肚子、胸口和脸上。在满脑子都是性爱的恍惚中，[rubi ey]急切地吞下所有落进[rubi eir]嘴里的东西，还用[rubi eir]的手指把剩下的也收集起来，一并咽了下去。");
         }
         else
         {
            outputText("[pg][rubi Eir]的身体颤抖着、抽搐着，虽然你看不见也感觉不到，但你确信[rubi eir]的小穴正紧紧夹住假阳具，因为它突然变得很难再插进[rubi em]体内了。随着一声高潮般的尖叫[say:哦，太棒了！太棒了！]，以及喷涌而出的淫液，鲁比筋疲力尽地瘫倒下去。");
         }
         outputText("[pg]但你还没结束。你疯狂地把假阳具越抽越快。你能感觉到有什么东西正在你体内涌起，那东西足以浇灭在你全身燃烧的欲火。很快，你们之间的双头阳具膨胀得太大，已经没法好好抽插，于是你近乎绝望地把手伸向");
         if(get_player().hasCock())
         {
            outputText("[eachCock]，热切地撸动着，迫切地渴望释放。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[clit]，疯狂地揉弄着，迫切地渴望释放。");
         }
         else
         {
            outputText("你的[chest]，用力揉弄着乳头，迫切地渴望释放。");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你的手指轻易地滑进每颗乳头里，像小鸡巴一样进进出出地抽动着。");
         }
         if(get_player().get_gender() == 0 && get_player().biggestTitSize() == 0)
         {
            outputText("你的双手在全身上下游走，从光裸的下体到乳头，甚至穿过头发，只为寻找什么能带给你渴望到极点的释放。");
         }
         outputText("[pg]终于，仁慈地，体内涌起的高潮像海啸般席卷了你，浇灭了你体内燃烧的欲火。你的嘴唇扭成一个[say:哦]的形状，一声悠长的呻吟从唇间逸出。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]抽动着、颤抖着，向你的身体射出好几股精液，");
            if(get_player().cumQ() < 250)
            {
               outputText("乱糟糟地溅得到处都是");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("薄薄地覆在你身上");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("在你身上覆上厚厚一层精液");
            }
            else
            {
               outputText("在你身上覆上厚厚一层浓烈的精液");
            }
            outputText("。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "紧紧夹住那巨大的入侵者，此刻它感觉就像一根巨大的钢棒牢牢卡在你体内；一股淫液从你的下体喷涌而出，把本就滑腻的假阳具和鲁比都涂得一片湿滑。");
         }
         if(get_player().lactationQ() > 0)
         {
            outputText("高潮的海啸席卷你的乳房，令它们颤抖摇晃，甜香的乳汁喷得你自己、鲁比和沙发上到处都是。");
         }
         outputText("[pg]你筋疲力尽地瘫在那里，鲁比也一样，仿佛你们都害怕一动就会再次唤醒那根怪物般的假阳具。不过，伴随着满足的叹息，你还是坐起身，小心地把正在缩小的假阳具从你们两人体内拔了出来。一股粉红色、类似精液的液体从你们被折腾过的穴口中流出，在你们之间汇成一滩。");
         outputText("[pg]鲁比揉了揉[rubi eir]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
         {
            outputText("小穴");
         }
         else
         {
            outputText("肛穴");
         }
         outputText("，脸上带着一丝微笑，说道，[say:嗯，还挺有意思的。]你听着这句轻描淡写到极点的话，忍不住笑了出来，然后站起身，也把鲁比从沙发上扶了起来。");
         outputText("[pg]你们两人一路漏着粉色精液走向浴室，快速一起冲了个澡，随后开始清理你们玩乐留下的痕迹。等一切都收拾得足够干净后，你给了鲁比一个轻吻，心满意足地回了营地。");
         saveContent.hadSex = true;
         get_player().orgasm("Generic");
         rubiAffection(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,609) > 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,608,FlagDict_Impl_.arrayReadInt(_loc1_,608) + 2);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function dateIntro(param1:Function) : void
      {
         clearOutput();
         rubiSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1007) == 0)
         {
            outputText("你忽然有了个主意。虽然你和鲁比聊过天，也在[rubi em]工作时逐渐了解了[rubi em]，但你其实还没和[rubi em]去过别的地方。你想了想，便问鲁比想不想一起出去走走，也许可以去买点吃的，顺便聊聊天。");
            outputText("[pg]鲁比的眼睛一下亮了起来，[rubi ey]用力点头。[say: 像约会那样？当然！我一直都想和你约会，可你总是忙着履行勇者的职责什么的……我一直没勇气开口问你！]鲁比挽住你的手臂，紧紧贴着你。[say: 那我们要去哪儿？]");
         }
         else
         {
            outputText("看着鲁比这样盛装打扮，你觉得也许是时候再来一次约会了。你开口一问，鲁比果然开心地叫了一声，答应了下来。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1007,FlagDict_Impl_.arrayReadInt(_loc2_,1007) + 1);
         if(param1 == iceCreamDate)
         {
            if(get_player().get_gems() < 2)
            {
               outputText("[pg]你很想带鲁比出去吃点甜点……但你现在非常确定自己根本付不起钱。");
               outputText("[pg]说真的，你可是勇者啊。不该穷成这样的。");
               menu();
               addButton(0,"下一步",rubiAppearance);
               return;
            }
         }
         param1();
      }
      
      public function cookingDate() : void
      {
         outputText("[pg]<b>瑟德忘了写这一段！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function closetOption(param1:String, param2:String) : void
      {
         var arg:String;
         var _g:Rubi;
         outputText("[pg-]" + param2);
         _g = this;
         arg = param2;
         addNextButton(param1,function():void
         {
            _g.dressUpRouter(arg);
         });
      }
      
      public function chocoRubiMassage() : void
      {
         get_images().showImage("rubi-get-massage");
         clearOutput();
         rubiSprite();
         outputText("你查看了[rubi eir]的用品，觉得在鲁比的\"水疗\"里被好好宠上一天，正是你现在需要的。你让[rubi em]把你领到[rubi eir]床边，路上[if (rubihascock) {瞥见鲁比下装里支起的小小帐篷|花了片刻欣赏[rubi eir]有型的屁股轻轻摇摆}]。[rubi Ey]似乎没注意到你偷看的视线，但[rubi ey]还是红了脸，或许是在[rubi ey]带你走向[rubi eir]房间角落时，自己也陷入了不那么纯洁的念头。");
         if(!get_player().isNaked())
         {
            outputText("[pg][say:宝贝，做这个你得……呃，先把装备脱下来，]鲁比一边指示，一边拿着一瓶装满闪光液体的瓶子，在房间里轻快地走来走去。你看着[rubi eir]兴奋的表情，疑惑地朝[rubi em]挑起眉，等到[rubi ey]开始咬住[rubi eir]下唇时，你才");
            if(get_player().cor >= 66)
            {
               outputText("开始充满挑逗地脱下衣物，把这个简单的动作变成一场诱人的表演，[if (rubihascock) {惹得鲁比衣服底下那根小小的硬挺不受控制地抽动|让鲁比的目光完全无法从你身上移开}]。等你结束这番淫荡挑逗时，[if (rubihascock) {顶端已经渗出一小片湿痕|你不禁注意到[rubi eir]衣服上那一小片湿痕}]。");
            }
            else if(get_player().cor >= 33)
            {
               outputText("没怎么停顿，也没搞什么花样就脱掉了衣服。鲁比故意把[rubi eir]头转开，但你还是能看见[rubi em]正用眼角偷偷瞄你[if (rubihascock) {，而且[rubi eir]的硬挺似乎比片刻前更大、更硬了}]。");
            }
            else
            {
               outputText("让[rubi em]转过身去，自己再脱衣服。你飞快甩掉衣服，问[rubi em]接下来该怎么做，同时用一只手遮住自己的[chest]和胯间");
               if(get_player().biggestCockArea() >= 40 || get_player().biggestTitSize() >= 8)
               {
                  outputText("，虽然也没多大用处");
               }
               outputText("。");
            }
         }
         outputText("[pg]鲁比礼貌地在你们之间隔着一条毛巾，你则趴着爬上床，把头枕在一只羽绒枕上。蓬松的布料屏障铺在你的[butt]上，不过你的" + rubiMF("柔美的男朋友","女朋友") + "特意把它折好，让你的[legs]完全露在外面。盒子被放到你的[face]前并打开。里面是一份裹着糖衣、满是果香的宝物——巧克力草莓。鲁比纤细的手指拈起一颗诱人的甜点，轻轻抵进你顺从张开的双唇；甜美的滋味滑上你的舌头，随即绽放出一阵阵浓郁的风味。你心满意足地哼了一声，吞下这份糖果般的礼物，已经感觉比刚才放松了许多。剩下的也触手可及，你慵懒地继续享用起来。");
         outputText("[pg]与此同时，你听到鲁比的衣服掉落在地的声音。你不知道你还能从" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 3 ? "这个性感的小伪娘" : "[rubi em]") + "那里期待些什么。当你转头看向[rubi em]时，你看到[rubi em]为了你精心打扮了一番。[rubi Ey]穿着一条开裆内裤，紧紧贴着[rubi eir][if (rubihascock) {" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) < 3 ? "小巧的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,608) < 8 ? "硕大的" : "巨大且被撑开的")) + "阴囊，同时让[rubi eir]娇嫩、勃起的阴茎自由地悬挂在外面，你一看到它，它就兴奋地向上弹起|大腿，[rubi eir]娇嫩的阴唇暴露在外，在光线下闪闪发光}]。一件蕾丝紧身胸衣紧贴着[rubi eir]苗条的躯干，微微收紧了[rubi eir]腰部，并放大了[rubi eir]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) > 6 ? "本就令人印象深刻的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 3 ? "几乎不存在的" : "")) + "胸部，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1004) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) < 3 ? "让[rubi em]看起来更加女性化" : "让[rubi em]比以前更加迷人") + "。");
         outputText("[pg]" + get_player().mf("咯咯笑着","微笑着") + "表示赞赏，你舔掉上唇上半融化的巧克力。你的目光又掠回[rubi eir] [if (rubihascock) {肉棒，正好看见一滴透明的前液在[rubi eir]可爱小肉棒的龟头上凝成珠|闪亮的阴部褶皱，毫不掩饰目光中的饥渴，想象着自己[if (hascock) {整根插进[rubi em]体内|夹在[rubi eir]大腿之间}]}]。鲁比有些害羞地夹紧[rubi eir]膝盖，但[rubi ey]还是鼓起勇气爬上床，翘臀落在你的身上。当然，你们几乎全裸的身体之间还隔着那条蓬松的白毛巾，勉强维持着贞洁。[rubi Eir]的重量清晰可感，却并不让人不舒服；[rubi ey]几乎立刻开始按揉你的肩膀，一边捏着右肩，一边用[rubi eir]左手打开一瓶精油的瓶盖。");
         outputText("[pg]噢——好凉！[rubi ey]把那滑溜的油液倒满你的背脊，顺着脊背揉开；[rubi eir]双手与湿滑液体之间的温差让你不由得一颤。等你的上半身被充分涂满后，[rubi Ey]把瓶子放到一旁，歉意地说：[say:抱歉，宝贝，我马上就让你暖起来。]从[rubi eir]的语气听来，[rubi ey]似乎真心在为这个小失误感到内疚；可当[rubi eir]的手指开始揉捏你的[skinfurscales]时，一切立刻都被原谅了。鲁比用[rubi eir]那双纤柔的手掌替你放松肌肉，你忍不住呻吟出声。[rubi Eir]的触碰像带着电流，每一次接触都释放出你自己都没察觉到的紧绷。精油让整个过程更加顺滑，也让触感被进一步放大，并在两具贴得如此近的身体热度下渐渐变得温暖。");
         outputText("[pg][rubi ey]为了取悦你而用上力气，发出轻轻的闷哼；这个棕发的柔美身影俯下身去处理一处特别顽固的肌肉结，无意间让[rubi eir] [if (rubihascock) {[rubi eir]肿胀的器官连同隔在中间的布料一起压进你的臀缝|身体贴向你，[rubi eir]兴奋时温热湿润的热意透过你的毛巾渗来}]。你们同时大声呻吟起来——[rubi em]是因为[rubi eir]最敏感、最色情的部位受到了挤压，而你则是因为[rubi eir]双手带来的舒缓。你慢慢把另一颗草莓送到唇边，开始舔舐、吮吸它的尖端，一点点融化外层的巧克力，直到红色的尖尖露出来，又挑逗般地在唇间进进出出。鲁比几乎承受不住这样的画面。[rubi Ey]呼吸沉重，几乎克制不住自己想隔着毛巾顶弄你的冲动。");
         outputText("[pg]鲁比呜咽着，[say: 我、呃……嗯嗯，[name]，我要、要忍不住了，]却没有停下。[rubi Eir]尾巴慢慢在你的[leg]上蹭着，[rubi ey]努力按住[rubi eir]不听话的腰，可它们还是一次又一次地抽动、颤抖着，压得[if (rubihascock) {[rubi eir]滚烫的小家伙抵进毛巾里|更用力地贴着你，想寻求些慰藉}]。你整个人彻底放松下来，而[rubi ey]却绷得比弹簧还紧。");
         outputText("[pg]你要让[rubi em]释放出来，还是强迫[rubi em]继续全都憋着？[rubi Ey]刚才可是乖得不得了……");
         saveContent.hadSex = true;
         get_player().changeFatigue(-40);
         dynStats(DynStat.Lib(-1),DynStat.Lust(5));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,832,FlagDict_Impl_.arrayReadInt(_loc1_,832) + 1);
         menu();
         addButton(0,"释放",releaseRubiMassage);
         addButton(1,"憋住",bottleUpRubiMassage);
      }
      
      public function cheatingRubi() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你在一张桌边坐下，满心期待鲁比坐到你腿上……但她始终没有出现。你在店里四处张望找她，可还是不见人影。你叫住看起来一脸疲惫的犬族[if (nofur) {女孩|兽化人}]女侍迪娅，询问她同事的去向。");
         outputText("[pg]她烦躁地叹了口气，说道，[say:我不知道，她又跑了，就跟她平时跟你出去一样。有个男人进来了，她一下子笑得花枝乱颤，然后他们就一起走了。你要是见到她，告诉她今天的小费又全归我了。]说完，她转身去招呼另一桌。");
         outputText("[pg]所以，你那个被傻妞化的荡妇在跟别人约会？你打算怎么办？");
         menu();
         addButton(0,"去找她",findBimboCheatster);
         addButton(1,"不关心",dontCareAboutNoCheatingRubis);
      }
      
      public function chatWithRubi() : void
      {
         clearOutput();
         rubiSprite();
         rubiAffection(2);
         if(rubiAffection() < 15)
         {
            outputText("你决定不点任何饮品，而是趁[rubi ey]有空的时候，和你的女侍鲁比聊聊天。你们聊了些轻松愉快、却无关紧要的话题。鲁比说起自己在一个遥远小镇长大的事，那是个货真价实的人类村庄，后来遭到了恶魔袭击。[rubi Ey]曾在野外生活过一段时间，期间喝下了太多瓶神秘的牛奶，结果长出了[rubi ey]现在这条尾巴。后来，[rubi Ey]终于找到了特尔阿德雷，并被三位好心的雪貂兽人收留。[rubi Ey]带着怀念的语气谈起家乡，[rubi eir]绿色的眼睛一时间泛起出神的光，随后[rubi ey]才猛地回过神来。");
            outputText("[pg][rubi ey]向你告辞，转身去招呼其他桌的客人。你也觉得现在正好可以回营地了。");
         }
         else if(rubiAffection() < 30)
         {
            rubiAffection(8);
            outputText("你决定不点任何饮品，而是趁[rubi ey]有空的时候和鲁比聊聊天。你们聊了些轻松愉快、却无关紧要的话题。鲁比花了些时间讲述[rubi eir]在特尔阿德雷安全范围之外生活的经历。[rubi Ey]从没被那些形形色色的生物抓住过，但也有过几次险些出事的经历。不过，[rubi Ey]也遇到过好几位帮助过[rubi em]的人。[rubi Ey]对一位在不远处经营农场的犬兽人赞不绝口，也提到过一位在附近湖边捕鱼的水獭女孩。[rubi Ey]笑着回忆那位水獭女孩做饭有多好吃，还说直到现在，[rubi ey]都找不到一份像样的鱼排。");
            outputText("[pg]最后你们实在没什么话题可聊了，于是你向[rubi em]告辞，返回了营地。");
         }
         else if(rubiAffection() < 100)
         {
            outputText("你决定不点任何饮品，而是趁[rubi ey]有空的时候和鲁比待在一起。你们聊了些轻松愉快、却无关紧要的话题。鲁比花了些时间讲述[rubi eir]和三位雪貂兽人养父母一起生活的事。听起来是两男一女，而且三人都是恋人。鲁比几年前被他们收养，虽然[rubi ey]后来已经搬了出去，但[rubi ey]仍然和他们保持着联系。[rubi Ey]红着脸告诉你，有时[rubi ey]被那三个人连续好几个小时的欢爱声吵得睡不着。");
            outputText("[pg]最后你们实在没什么话题可聊了，于是你向[rubi em]告辞，临走前在鲁比脸颊上亲了一下，然后返回营地。");
         }
         else if(rubiBimbo())
         {
            outputText("你决定不点任何饮品，而是趁[rubi ey]有空的时候和鲁比待在一起。你们聊了些轻松愉快、却无关紧要的话题。鲁比花了些时间谈起特尔阿德雷的时尚潮流，以及它们和[rubi eir]家乡村子的衣着风格有多么不同——那可是个货真价实的人类村庄。[rubi Ey]提到，“家乡”那边每个人都穿得保守得很，完全不像这里这种性感又大胆露出身体的流行服饰。鲁比甚至说，[rubi ey]很庆幸多年前恶魔发动了那场袭击，这样[rubi ey]才有机会来到这里，穿上火辣的新衣服，拥有新的身体，开始全新的生活。");
            outputText("[pg]最后你们实在没什么话题可聊了，于是你向[rubi em]告辞，临走前给了鲁比一个热烈的唇吻，然后返回营地。");
         }
         else
         {
            outputText("你决定不点任何饮品，而是趁[rubi ey]有空的时候和鲁比待在一起。你们聊了些轻松愉快、却无关紧要的话题。鲁比花了些时间谈起[rubi eir]过去的村子，那是个货真价实的人类村庄。那里的生活很不错，有许多农场提供食物，也几乎没什么腐化需要应对。村里也有一些带着非人特征的居民，通常都是他们自愿获得的，但大多数人仍是纯血人类。几年前，一支由梦魔、魅魔和小恶魔组成的分队袭击了那里，一切都变了。鲁比和少数几个人平安逃了出来，但在途中走散了。据鲁比所知，其他人不是死了，就是在之后被腐化了。");
            outputText("[pg]最后你们实在没什么话题可聊了，于是你向[rubi em]告辞，临走前吻了鲁比的嘴唇一下，然后返回营地。");
         }
         if(rubiAffection() >= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) == 0)
         {
            doNext(specialRelationship20scene);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function buyRubiMilk() : void
      {
         clearOutput();
         rubiSprite();
         if(rubiAffection() < 30)
         {
            outputText("你招呼鲁比过来，告诉[rubi em]你想点些牛奶。[rubi Ey]点点头，很快你就端着一杯闻起来香甜的牛奶。[say: 我们每天都拿新鲜的，]你喝下一口时，[rubi ey]说道。味道相当不错。你一口气喝完，发现面前又放上了一杯。[say: 免费续杯哦，亲爱的。]");
            outputText("[pg]接下来的几杯你喝得慢了些。每当鲁比过来给你续杯时，你都会和[rubi ey]聊上几句。过了一会儿，你发现自己对[rubi em]又熟悉了一些。感觉已经够饱了，你便告辞，返回营地。");
         }
         else if(rubiBimbo())
         {
            outputText("你招呼鲁比过来，告诉她你想点些牛奶。她点点头，很快你就端着一杯闻起来香甜的牛奶。[say: 我们每天都会拿新鲜的哦，]她一边说一边咯咯笑着，看你喝下一口。味道相当不错。你一口气喝完，发现面前又放上了一杯。[say: 免费续杯哦，宝贝。]");
            outputText("[pg]接下来的几杯你喝得慢了些。每当鲁比过来给你续杯时，你都会和她聊上几句。没过多久，她就坐到了你腿上，一边听你讲糟糕的笑话一边咯咯直笑。过了一会儿，你告辞离开，返回营地。");
         }
         else
         {
            outputText("你招呼鲁比过来，告诉[rubi em]你想点些牛奶。[rubi Ey]点点头，很快你就端着一杯闻起来香甜的牛奶。[say: 我们每天都拿新鲜的，]你喝下一口时，[rubi ey]说道。味道相当不错。你一口气喝完，发现面前又放上了一杯。[say: 免费续杯哦，宝贝。]");
            outputText("[pg]接下来的几杯你喝得慢了些。每当鲁比过来给你续杯时，你都会和[rubi ey]聊上几句。没过多久，[rubi ey]就坐在你身边，听你讲糟糕的笑话时笑个不停。过了一会儿，你告辞离开，返回营地。");
         }
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 3);
         rubiAffection(3);
         get_player().refillHunger(7);
         get_player().modThickness(100,1);
         if(rubiAffection() >= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) == 0)
         {
            doNext(specialRelationship20scene);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function breakUpWithRubi() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你认真想了很久，然后难过地叹了口气。你直视着鲁比的眼睛，解释说你无法和一个想背叛伴侣的女人在一起。泪水在她眼中涌起，她抽了抽鼻子，但还是对你点了点头。");
         outputText("[pg]沉默片刻后，她红宝石般的嘴唇中逸出一声微弱的低语，[say: 滚。出去。]你耸耸肩站起身来，可当你正要离开房子时，鲁比尖厉的声音从身后追了上来。[say: 你这个怪物！我爱你，才让你把我变成这样的！我本来可以，就是，接受那些结、结果，但看来英雄大人接受不了！你真是卑——]她被那被傻妞化搅得一团糟的脑子卡住了。[say: 你简直卑鄙透顶，]她最后带着一抹假笑说道。");
         outputText("[pg]说完，她在你身后重重摔上了门。好吧，事情本来可以处理得更好。你恼火地叹了口气，返回自己的营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,621,-2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,605,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bottleUpRubiMassage() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你把草莓咬成两半，含混地说：[say: 不，还不行。就让它继续积攒着吧。][rubi Ey]委屈地呜咽起来，但你歪了歪头，说道：[say: 来嘛，为我忍住。就是，别泄出来……来，从那儿下来，到床上陪我。我们可以抱在一起，让你稍微放松一下。]");
         outputText("[pg]你拍拍身旁靠近臀侧的床铺，扶着鲁比依偎到你身边，[if (rubihascock) {小心确保自己不会不慎蹭到[rubi eir]勃起——既然你已经让[rubi em]忍了这么久，就没必要让[rubi em]一下子全泄出来|把[rubi em]搂紧，让[rubi ey]在你身旁偎过来。以[rubi ey]现在这副被撩拨得不行的样子，你担心再多一点刺激都会让[rubi em]越过临界}]。[rubi Ey]慢慢放松下来，靠在你的肩头；你和[rubi em]接了个吻，然后把剩下的草莓喂给[rubi em]吃。");
         outputText("[pg][rubi Ey]感激地说道，[say: 谢谢，宝贝，]尽管[rubi eir]身体仍因近乎发烧般的欲望而发热，但[rubi ey]一时半会儿是不会高潮了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,609,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,608,FlagDict_Impl_.arrayReadInt(_loc1_,608) + 1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function barDate() : void
      {
         var _loc1_:* = null as IMap;
         rubiSprite();
         outputText("[pg]你仔细想了想能去哪儿。你的同伴穿得还不太适合去吃什么高级晚餐，不过你觉得可以去本地酒馆喝上一两杯。你搂住鲁比的腰，两人一起走上特尔阿德雷的街头。你们穿过一条又一条街，直到来到本地酒馆——\"湿身婊酒馆\"。");
         outputText("[pg]你和约会对象一起溜了进去，在吧台边找了个位置坐下。酒保走到你们这边时，鲁比脸一下子红了，问道：[say: 呃，我能来一杯海滩性爱吗？] 你暗自笑了笑，也点了一杯一样的。酒保点点头，开始调制两杯酒。与此同时，鲁比转过身坐在高脚凳上，打量起酒馆里的其他人。");
         outputText("[pg][say: 这地方真不错，]在你也转过身时，[rubi ey]评论道。[say: 几乎所有人迟早都会来这儿。这里特别适合观察来来往往的人。看，瞧瞧那两个，][rubi ey]说着，指向一对年轻的蜘蛛变形种女性。[say: 我刚开始来酒馆的时候，她们甚至还不认识呢。我看到了她们第一次见面、第一次约会，还有之后好几次约会。她们真是可爱的一对，不是吗？]");
         outputText("[pg]你顺着鲁比的视线望去，看见那对女孩依偎在长椅的一侧。个子小些的那个一边喝着饮料，一边把脸蹭进个子高些的那个胸口。鲁比满足地笑了笑。[say: 真爱，真浪漫啊。]");
         outputText("[pg][say: 两杯海滩性爱，]你身后传来酒保的声音，你们俩转过身，发现两杯酒已经摆在面前。鲁比抓起[rubi eir]那杯举起来，[say: 为真爱干杯！]");
         outputText("[pg]你也举起自己的酒杯，和鲁比的杯子轻轻一碰，然后喝了一口。鲁比又评论起其他几位客人，大多是在说他们的感情生活。看来在鲁比遇见你之前，[rubi ey]一直太害羞，不敢和任何人约会，只能通过旁观别人来寄托自己的幻想。鲁比能指出这么多幸福的情侣，倒是让人意外，当然，心碎的故事也同样不少。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1009) == 0)
         {
            outputText("[pg][say: 宝贝……谢谢你为我做的这一切。我知道你忙着拯救世界什么的，已经够焦头烂额了，但还是谢谢你，]鲁比突然说道，把[rubi eir]头靠在你的肩上。[say: 我希望有一天，也有人看见我们，然后想起我以前想到的那些事。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1009,FlagDict_Impl_.arrayReadInt(_loc1_,1009) + 1);
         }
         outputText("[pg]几杯酒下肚后，鲁比对你变得相当热情，几乎坐到了你腿上，而你们像往常一样聊着酒馆里的其他客人。你有些担心地对[rubi em]笑了笑，提议说也许[rubi ey]已经喝得够多了。[rubi Ey]先是不以为意地挥了挥[rubi eir]手，下一刻却差点从高脚凳上摔下去。等[rubi em]自己坐稳之后，[rubi ey]才简短地向你点了点头。[say: 也许我们还是回去比较好，][rubi ey]提议道。");
         outputText("[pg]你点头表示同意，搂住鲁比的肩膀，让[rubi em]贴近自己，然后开始往[rubi eir]住处走去。路程并不远，但鲁比一路上都兴致勃勃，怎么也管不住[rubi eir]的手。");
         outputText("[pg]等你们走进鲁比的卧室时，[rubi eir]的嘴唇已经和你的紧紧贴在一起。[say: 那么宝贝，我们要拿这个怎么办呢？]");
         rubiSexMenu();
         setExitButton();
      }
      
      public function approachRubiScenes() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         get_images().showImage("rubi-at-cafe");
         clearOutput();
         rubiSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,607) == 0)
         {
            outputText("你在一张桌旁坐下，没过几秒，一个年轻女孩就来到你身边。她用手指勾住耳边，把黑色短发拨到后面，又把一支铅笔夹在耳后。她抚平粉白女侍制服的前襟，朝你露出一个活泼的笑容。[say: 嘿，亲爱的，欢迎来到特尔阿德雷面包店，我是鲁比，]她说着，微微行了个屈膝礼。[say: 如果你想要糕点或其他东西，直接去柜台就好，他们会为你服务。如果你需要喝点什么：牛奶、茶或咖啡，只要招呼我一声，我很乐意帮忙。]");
            outputText("[pg][say: 我们的牛奶配曲奇和布朗尼特别棒，而且每天都是新鲜送来的。想喝热的还是冷的都可以，按你喜欢的来。我们这里也有几种不错的茶和咖啡。喝了能让压力慢慢消散。总之，这是今天的菜单，]她递给你一张小纸菜单，你注意到她修得完美的指甲上涂着淡蓝色指甲油。[say: 需要什么就叫我一声！]她说完便转身去给另一桌客人重复同样的介绍，黑色高跟鞋踩在石地板上，发出悦耳的嗒嗒声。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,607,FlagDict_Impl_.arrayReadInt(_loc1_,607) + 1);
         }
         else if(rubiAffection() < 30)
         {
            outputText("你在一张桌旁坐下，没过几秒，鲁比就拉了把椅子坐到你身边。");
         }
         else
         {
            _loc2_ = [1];
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,612) == 1)
            {
               _loc2_[int(_loc2_.length)] = 2;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,613) == 1)
            {
               _loc2_[int(_loc2_.length)] = 3;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,614) == 1)
            {
               _loc2_[int(_loc2_.length)] = 4;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,615) == 1)
            {
               _loc2_[int(_loc2_.length)] = 5;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,616) == 1)
            {
               _loc2_[int(_loc2_.length)] = 6;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,617) == 1)
            {
               _loc2_[int(_loc2_.length)] = 7;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,618) == 1)
            {
               _loc2_[int(_loc2_.length)] = 8;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,619) == 1)
            {
               _loc2_[int(_loc2_.length)] = 9;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,620) == 1)
            {
               _loc2_[int(_loc2_.length)] = 10;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,625) == 1)
            {
               _loc2_[int(_loc2_.length)] = 11;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1012) == 1)
            {
               _loc2_[int(_loc2_.length)] = 12;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1013) == 1)
            {
               _loc2_[int(_loc2_.length)] = 13;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,604) >= 100)
            {
               _loc2_[int(_loc2_.length)] = 14;
            }
            _loc3_ = int(_loc2_[Utils.rand(int(_loc2_.length))]);
            if(_loc3_ == 1)
            {
               outputText(rubiMF("他","她") + "穿着[rubi eir]平常那套女侍制服：粉色上衣和短裙，外面罩着带花边的白色围裙。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("鲁比的乳房把紧身上衣撑得紧绷绷的，仿佛随时都会崩开一颗扣子。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 9)
               {
                  outputText("你注意到鲁比的姿势有些不自然，直到[rubi ey]坐下时，你才瞥见[rubi eir]裙子里微微隆起的一块。");
               }
            }
            else if(_loc3_ == 2)
            {
               outputText(rubiMF("他","她") + "今天穿得不一样，没有穿平常的女服务生制服，而是换上了一套职业感十足的黑白西装，领带系得松松垮垮，不过[rubi ey]依然戴着女服务生发箍");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,988) > 0)
               {
                  outputText("就在角的后面");
               }
               outputText("。从某种性感的角度看，[rubi ey]就像个穿着男朋友衣服的女孩");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("，不过[rubi eir]胸部很丰满，衣服没法完全扣上，反倒让[rubi ey]看起来像个性感秘书");
               }
               outputText("。");
            }
            else if(_loc3_ == 3)
            {
               outputText("[rubi Ey]今天穿得不一样，没有穿平常的女服务生制服，而是换上了紧身黑色橡胶上衣，搭配短裙和长袜。这身衣服上开出的洞大胆地露出了鲁比的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) > 0)
               {
                  outputText("黑色的");
               }
               outputText("乳头，它们在微凉的空气中精神地挺立着。橡胶带在这身衣服奇怪的位置交错缠绕，整套装束看起来就像出自玛瑞斯众多恋物地牢中的某一个。这套衣服把视线都引向了[rubi eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("傲人的胸部，还让[rubi em]看起来有点像是那种人们会在寂寞夜晚买来作伴的橡胶娃娃。");
               }
               else
               {
                  outputText("相对平坦的胸口，不过配上[rubi eir]身材的其他部分，实在很难把[rubi em]想象成女人以外的样子。");
               }
            }
            else if(_loc3_ == 5)
            {
               outputText("[rubi Ey]今天穿得不一样，没有穿平常的女服务生制服，而是换上了一件霓虹粉色抹胸和一条小得可怜的牛仔短裤。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("[rubi Eir]乳房把抹胸的布料绷得紧紧的，仿佛稍有不慎就会挣脱出来。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 4)
               {
                  outputText("[rubi Eir]胯间那一大块隆起却怎么也藏不住，你有时会看到鲁比在桌与桌之间走动时，把记事本压在[rubi eir]裆前遮挡。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("[rubi Eir]的隆起至少藏得很好。你确信，只有眼力够老到的人，或者知道该看哪里的人，才会注意到鲁比那小小的一包。");
               }
            }
            else if(_loc3_ == 6)
            {
               outputText("[rubi Ey]今天穿得不一样，没有穿平常的女服务生制服，而是换上了一件近乎透明的连体紧身衣，从胯部一直包到脖子。蕾丝装束上点缀着花朵和旋转的彩色纹饰，并巧妙地遮在关键位置。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 9)
               {
                  outputText("不过，这身衣服这么紧，[rubi em]几乎不可能藏住[rubi eir]那惊人的家伙。鲁比的鸡巴直直向上顶起，从[rubi eir]胯间一直到[rubi eir]肚脐附近鼓出一道隆起。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("不过，这身衣服这么紧，你能看见[rubi eir]那小小的一包被收好的位置透出一丝轮廓。你不禁好奇，还有多少顾客也注意到了这一点。");
               }
            }
            else if(_loc3_ == 7)
            {
               outputText("[rubi Ey]今天穿得不一样，没有穿平常的女服务生制服，而是换上了一条优雅的亮片舞会礼裙。");
               if(rubiBimbo())
               {
                  outputText("[rubi Ey]甚至还给这条裙子加上了假宝石，并在侧边开了一道高衩，好露出[rubi eir]的腿。");
               }
               outputText("你被这份优雅与肉欲交织出的惊艳模样震住了。你确信[rubi ey]出现在高级舞会上一定很合适，但在这家面包店里，[rubi ey]显得格格不入，尤其还扮成了女服务员。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) <= 1)
               {
                  outputText("这条裙子肯定配了带垫的胸罩，因为看到鲁比居然有了胸部，你不禁有些惊讶。虽然不大，却很好地衬托出了[rubi eir]女性化的身段。");
               }
            }
            else if(_loc3_ == 8)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一件宽松的白色丝质衬衫和紧身黑色皮裤。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("配上[rubi eir]丰满的胸部，[rubi ey]看起来活像个大胸女海盗。[rubi eir]胸口把上衣撑得紧绷绷的，你敢肯定，只要呼吸稍微不对，就会有一颗扣子飞到房间另一头去。");
               }
               else
               {
                  outputText("不过，配上[rubi eir]相对平坦的胸膛，你不禁怀疑这是不是让[rubi em]看起来有点太像男人了。虽然是个阴柔的男人，但终究还是个男人。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) >= 9)
               {
                  outputText("[rubi Eir]那根尺寸可观的肉棒显露无遗，让[rubi eir]颇为难堪——它在一条裤腿上撑出了一道一路向下的隆起。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("好在考虑到[rubi eir]那话儿相对较小，即使衣服这么紧，[rubi eir]胯间的隆起也依然被很好地藏了起来。");
               }
            }
            else if(_loc3_ == 9)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一条紧身的白色连衣裙，胸前口袋上印着红十字，头上还戴着一顶同样带有红十字的小白帽。[rubi Ey]看起来就像那种会出现在你下流梦境里的护士，你不禁好奇，今天有多少面包店的顾客会被鲁比这副古怪却性感的模样弄得不知所措。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("鲁比丰满的胸部把布料撑得紧绷，也把裙子进一步往[rubi eir]身上拉高，露出了更多[rubi eir]的双腿和屁股。");
               }
            }
            else if(_loc3_ == 10)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一套小得离谱的黑色比基尼。这泳装确实可爱，鲁比穿起来也性感得要命，但你还是忍不住觉得，这更适合去海滩玩上一天，而不是在面包店里工作。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("鲁比惊人的乳沟随着每一次动作都像是要从小巧的比基尼上衣里溢出来。看着面包店里一张张通红的脸，你不禁怀疑这种事是不是已经发生过了。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) <= 1)
               {
                  outputText("这件上衣反而更突出了鲁比相对平坦的胸膛，不过配上[rubi eir]身体其他部位的线条，[rubi ey]看起来依然非常有女人味。");
               }
            }
            else if(_loc3_ == 11)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一条短得离谱的粉色无肩带迷你裙。上半截勉强才盖住[rubi eir]的乳头，你确信[rubi ey]肯定得不停调整它，免得走光。下摆也短到只要[rubi ey]往前一弯腰，站在[rubi em]身后的人就一定能大饱眼福。总之，鲁比看起来像是准备去城里享受夜生活，而不是来端盘子上班的。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("[rubi Eir]的裙摆高得离谱，让你不时瞥见[rubi eir]果然没穿内裤的胯间，以及其中那诱人的东西。你不禁想，今天有多少人会在饮料之外额外收获一份惊喜！");
               }
            }
            else if(_loc3_ == 12)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一串皮带和挂钩。数条皮带交错缠过[rubi eir]的身体，用更宽、更柔韧的带子遮住关键部位。你不禁怀疑这种衣服到底能有多舒服，而就在这时，你注意到鲁比趁[rubi ey]以为没人看见时，把勒进屁股缝里的布带扯了出来。鲁比到底是怎么穿着这身继续在面包店工作的，你恐怕永远都不会明白。");
            }
            else if(_loc3_ == 13)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一件紧身的红金色束腰，吊袜带连接着一双透明的黑色长袜。束腰确实把鲁比天生女性化的身材衬得更加动人，不过你很难想象这会有多舒服。那双不透肤的黑色长袜一直延伸到[rubi eir]大腿处，背面嵌着金色的束腰花纹，一路通向一对蝴蝶结；鲁比走动时，它们也轻快地晃动着。");
            }
            else if(_loc3_ == 14)
            {
               outputText("[rubi Ey]今天的打扮和平时不同，[rubi ey]没穿那套常见的女服务员制服，而是换上了一个被改得面目全非的版本。围在[rubi eir]腰间的裙子简直会被误认成腰带，而围裙——也是唯一遮住[rubi eir]上半身的东西——也没长到哪里去。只要鲁比迈出一步，或者朝任何方向弯一下腰，视野范围内的任何人都一定能清楚看见[rubi eir]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText(rubiCock(33) + "，套着一只可爱的粉色小荷叶边阴茎套");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
               {
                  outputText("，而");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
               {
                  outputText("被一条粉色内裤包裹住的女性阴阜");
                  if(rubiBimbo())
                  {
                     outputText("修剪整齐的女性阴阜，毫无遮挡地暴露在空气中");
                  }
               }
               outputText("。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("鲁比的胸部本就很大，露出相当明显的侧乳，仿佛随时都会从衣服里溢出来。看看有些客人涨红的脸，这种事恐怕已经发生过了。");
               }
               outputText("这身打扮虽然大胆暴露，但显然是鲁比在遇见你之前绝不会穿的。看来[rubi Ey]现在真的很适应[rubi eir]身体了！");
            }
            outputText("[pg][rubi Ey]把平常那份菜单递给你，说道：[saystart]");
            if(rubiBimbo())
            {
               outputText("那个，菜");
            }
            else
            {
               outputText("菜");
            }
            outputText("单在这儿，宝贝。想好要点什么，准备好了就叫我。[sayend] [rubi Ey]站起身，走去收拾附近的一张桌子，[rubi eir]红色桃心尾巴在[rubi em]身后风情十足地摆动着。");
            if(_loc3_ == 4)
            {
               outputText("[rubi Ey]今天穿得不太一样，没有穿平常的女服务生制服，而是换上了一件宽大的绿色束腰外衣，穿在[rubi em]身上看起来更像一条裙子，下面配着棕色紧身裤，头上还戴着一顶尖尖的绿帽子。[rubi eir]腰间除了平常的记事本，还挂着一把木剑。要是鲁比更有男子气概一点，你或许会觉得[rubi ey]像是什么冒险者，但实际上，[rubi ey]看起来就只是个戴着奇怪帽子的普通女孩。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,984) >= 4)
               {
                  outputText("从某种奇妙的角度来说，[rubi ey]看起来像是个冒险者，只不过倒霉地中了女巫的诅咒。");
               }
            }
            if(_loc3_ == 1)
            {
               outputText("[pg]当[rubi ey]弯下腰时，你清楚地看见了[rubi eir]的裙底，");
               if(rubiBimbo())
               {
                  outputText("惊讶地发现[rubi ey]底下什么都没穿，把[rubi eir]的肛门");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
                  {
                     outputText("和湿漉漉的小穴");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
                  {
                     outputText("和软垂的阴茎");
                  }
                  else
                  {
                     outputText("、湿漉漉的小穴和软垂的阴茎");
                  }
                  outputText("全暴露给[rubi em]身后的人看");
               }
               else
               {
                  outputText("兴奋地看到鲁比选的粉色蕾丝内裤紧贴着[rubi eir]柔软的屁股");
               }
               outputText("。");
            }
            else if(_loc3_ == 8)
            {
               outputText("[pg]当[rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，被那条紧身皮裤衬得格外明显。");
            }
            else if(_loc3_ == 15)
            {
               outputText("[pg]当[rubi ey]弯下腰时，你正好看进[rubi eir]那件裙子般的束腰外衣下面，欣赏到[rubi eir]圆润的屁股在深色紧身裤的勾勒下显得格外诱人。");
               if(rubiBimbo())
               {
                  outputText("你甚至还瞥见裆部有一片湿痕，水迹顺着双腿往下流，[rubi ey]想必很难遮掩……当然，前提是[rubi ey]还愿意遮掩的话。");
               }
            }
            else if(_loc3_ == 7)
            {
               outputText("[pg]当[rubi ey]走向另一张桌子时，鲁比前后摇摆起来，仿佛正和一位看不见的舞伴共舞。");
               if(rubiBimbo())
               {
                  outputText("随后[rubi ey]开始扭动屁股，还做出拍屁股的动作，彻底破坏了那股优雅的氛围。");
               }
            }
            else if(_loc3_ == 9)
            {
               outputText("[pg]当[rubi ey]弯下腰时，你清楚地看见了[rubi eir]的裙底，");
               if(rubiBimbo())
               {
                  outputText("惊讶地发现[rubi ey]底下什么都没穿，把[rubi eir]的肛门");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
                  {
                     outputText("和湿漉漉的小穴");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
                  {
                     outputText("和软垂的阴茎");
                  }
                  else
                  {
                     outputText("、湿漉漉的小穴和软垂的阴茎");
                  }
                  outputText("全暴露给[rubi em]身后的人看");
               }
               else
               {
                  outputText("兴奋地看见鲁比选的荷叶边白色内裤紧贴着[rubi eir]柔软的屁股");
               }
               outputText("。");
            }
            else if(_loc3_ == 3)
            {
               outputText("[pg]当[rubi ey]弯下腰时，你清楚地看见了[rubi eir]的裙底，");
               if(rubiBimbo())
               {
                  outputText("惊讶地发现[rubi ey]底下什么都没穿，把[rubi eir]的肛门");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
                  {
                     outputText("和湿漉漉的小穴");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
                  {
                     outputText("和软垂的阴茎");
                  }
                  else
                  {
                     outputText("、湿漉漉的小穴和软垂的阴茎");
                  }
                  outputText("全暴露给[rubi em]身后的人看");
               }
               else
               {
                  outputText("兴奋地看见一条半透明的橡胶内裤紧贴着[rubi eir]柔软的屁股");
               }
               outputText("。");
            }
            else if(_loc3_ == 2)
            {
               outputText("[pg]当[rubi ey]弯下腰时，尽管这条裤子的剪裁并不怎么衬身材，你还是清楚地看见了[rubi eir]的屁股。");
            }
            else if(_loc3_ == 5)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，被紧身牛仔短裤衬得格外显眼。");
            }
            else if(_loc3_ == 10)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，被紧身比基尼泳裤衬得格外显眼。");
            }
            else if(_loc3_ == 11)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的裙底，");
               if(rubiBimbo())
               {
                  outputText("惊讶地发现[rubi ey]底下什么都没穿，把[rubi eir]的肛门");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
                  {
                     outputText("和湿漉漉的小穴");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
                  {
                     outputText("和软垂的阴茎");
                  }
                  else
                  {
                     outputText("、湿漉漉的小穴和软垂的阴茎");
                  }
                  outputText("全暴露给[rubi em]身后的人看");
               }
               else
               {
                  outputText("兴奋地看见一条可爱的小丁字裤嵌在[rubi eir]柔软的屁股缝里");
               }
               outputText("。");
            }
            else if(_loc3_ == 6)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，被紧身蕾丝连体衣衬得格外显眼。");
               if(rubiBimbo())
               {
                  outputText("你甚至瞥见裆部有一片湿痕，这肯定藏都藏不住……前提是[rubi ey]还愿意费心去藏的话。");
               }
            }
            else if(_loc3_ == 12)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，一条粗厚的皮带像丁字裤一样从[rubi eir]臀缝间穿过，把它衬得格外显眼。");
            }
            else if(_loc3_ == 13)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]的屁股，被金色蕾丝边的红色内裤衬得格外显眼。");
            }
            else if(_loc3_ == 14)
            {
               outputText("[pg][rubi ey]弯下腰时，你清楚地看见了[rubi eir]那条不像样的裙子底下，");
               if(rubiBimbo())
               {
                  outputText("惊讶地发现[rubi ey]底下什么都没穿，把[rubi eir]的肛门");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) == 0)
                  {
                     outputText("和湿漉漉的小穴");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
                  {
                     outputText("和软垂的阴茎");
                  }
                  else
                  {
                     outputText("、湿漉漉的小穴和软垂的阴茎");
                  }
                  outputText("全暴露给[rubi em]身后的人看");
               }
               else
               {
                  outputText("兴奋地看到一条粉色荷叶边内裤紧贴着[rubi eir]柔软的屁股");
               }
               outputText("。");
            }
         }
         outputText("[pg]你看了看菜单……你想要什么？\n------------------------\n牛奶：3 宝石\n茶：6 宝石");
         menu();
         if(get_player().get_gems() >= 3)
         {
            addButton(0,"牛奶",buyRubiMilk);
         }
         else
         {
            addButtonDisabled(0,"牛奶","你买不起牛奶。");
         }
         if(get_player().get_gems() >= 6)
         {
            addButton(1,"茶",getTeaFromRubi);
         }
         else
         {
            addButtonDisabled(1,"茶","你买不起茶。");
         }
         addButton(2,"聊天",chatWithRubi);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) >= 1)
         {
            addButton(3,"鲁比的住处",rubisFuckingHouseYouPervert);
         }
         else
         {
            addButtonDisabled(3,"鲁比的住处","也许你再多花点时间陪她……");
         }
         addButton(14,"返回",get_telAdre().bakeryScene.bakeryuuuuuu);
      }
      
      public function anallyTrainYourBitchBoySlutHowToBeAnalForDCL() : void
      {
         clearOutput();
         rubiSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1010,FlagDict_Impl_.arrayReadInt(_loc1_,1010) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1010) == 1)
         {
            outputText("你在鲁比身旁的沙发上坐下，随意闲聊起来。几分钟后，你们俩已经惬意地靠在软垫上笑成一片，从特尔阿德雷的生活聊到你的冒险经历，什么都聊。最后话题又绕回了性上面，以及以[rubi em]现在的情况来说，你对[rubi em]似乎有点太难应付了。");
            outputText("[pg]鲁比明显咽了口唾沫，点点头，[saystart]我忍不住啊，宝贝。你那根肉棒看起来实在是");
            if(rubiBimbo())
            {
               outputText("太");
            }
            outputText("美味了，可我怕它太大了！我不可能把那整根都塞进身体里……至少没法舒服地塞进去。[sayend]");
            outputText("[pg]你皱起眉。你当然不想弄疼[rubi em]，但这情况总不至于无解吧？这里毕竟是玛瑞斯，什么东西连带它妈都有巨大的阴茎。你开口断言，这个问题一定会有解决办法。");
            outputText("[pg]你身旁那个可爱的恶魔变形种露出一瞬间不好意思的神情，然后说道：[say: 嗯，我可能、也许……已经先想到这点了……]你有些困惑，问[rubi ey]这话是什么意思。鲁比没有解释，而是站起身，牵住你的手，把你带进[rubi eir]的卧室。之后[rubi ey]在床边跪下，伸手探到床底下，拖出一个黑粉相间的大箱子。");
            outputText("[pg]鲁比停顿了一会儿，深吸一口气让[rubi em]自己镇定下来，然后打开箱子。箱子里整整齐齐摆着一大堆假阳具、按摩棒、震动棒，以及各种其他阳具形状的玩具，种类多得惊人。它们形状和尺寸各不相同，从粉色小震动棒，一直到像鲁比胳膊一样大的巨型马形假阳具，应有尽有。鲁比的皮肤泛起红晕");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
            {
               outputText("，或者说至少变得更红了");
            }
            else
            {
               outputText("，在你还能看见的那点皮肤上");
            }
            outputText("，而[rubi ey]则双膝内扣地坐在箱子后面。");
            outputText("[pg][say: 嗯，这些东西其实我已经有一阵子了。我本来想着，也许可以慢慢适应到你那种尺寸，但我还一个都没真正用过。你会……你会想让我用吗？] [rubi ey]一边轻轻扭动着身子，一边问道。");
            outputText("[pg]你扫视着箱子里琳琅满目的色情玩具。好吧，如果这能把[rubi em]撑到足以让你终于把肉棒插进去，那又有什么不行呢？你点点头，出声表示赞同这个计划。鲁比笑了笑，站起身冲进衣柜，[rubi eir]的恶魔尾巴在[rubi em]身后兴奋地甩来甩去。");
            outputText("[pg]你挑起一边眉毛，心想[rubi ey]到底能在里面折腾些什么。几分钟后，[rubi ey]回来了，身上穿着一件透明、布料少得可怜的黑色情趣睡衣。[say: 好了，我看起来怎么样？] [rubi ey]一边问，一边转了个圈。随着[rubi ey]转身，情趣睡衣的下摆飘了起来，露出[rubi eir]光裸的屁股和胯间");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("，[rubi eir]的肉棒诱人地晃动着");
            }
            outputText("。");
            outputText("[pg]你舔了舔嘴唇，承认[rubi ey]看起来确实诱人得足以让人想狠狠干上一场。鲁比咯咯笑了起来，迈着小碎步走过来，在你脸颊上亲了一口。[say: 嗯，我[b:就是]这个意思……不过在那之前，我还得先做点准备，] [rubi ey]说着，从箱子里拿起一根小号、人类尺寸的假阳具，还有一瓶你猜大概是润滑液的东西。[say: 我就顺便给你来点小表演吧。可不能让我一个人把乐子都占了。]");
            outputText("[pg]鲁比催你坐到床沿上，而[rubi ey]则稍稍退开，在铺满房间的柔软地毯上躺下。暂时把假阳具和润滑液放到一边后，[rubi eir]的双手游走过[rubi eir]柔嫩的身体，在[rubi eir]的" + rubiChest() + "和");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) == 1)
            {
               outputText("黑色的");
            }
            outputText("乳头上稍作停留；那两颗乳头直直挺起，绷在情趣睡衣薄透的布料上。鲁比柔软的双唇间逸出一声轻喘，[rubi ey]捏住一颗");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1003) == 1)
            {
               outputText("乌黑的");
            }
            outputText("乳头，另一只手则轻轻滑到[rubi eir]大腿之间，抚弄着[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText(rubiCock());
            }
            else
            {
               outputText("很快湿润起来的小穴");
            }
            outputText("。");
            outputText("[pg]不过，[rubi Eir]的手并没有在那里停留多久，因为[rubi ey]似乎急着要进入正戏。抚弄了一会儿后，鲁比把[rubi eir]的手指抬到[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 2)
            {
               outputText("猩红色的");
            }
            else
            {
               outputText("暗黑色的");
            }
            outputText("嘴唇边，舔去");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("前液");
            }
            else
            {
               outputText("淫液");
            }
            outputText("，面带微笑地把上面的东西舔干净。[rubi Eir]刚清理过的手指伸向旁边那瓶润滑液。[rubi ey]往掌心里挤了一大把，浓郁的覆盆子香气似乎顿时弥漫开来，惹得你的鼻翼微微抽动。有香味的润滑液？");
            outputText("[pg]鲁比用[rubi eir]另一只手抓住假阳具，把它送到[rubi eir]唇边，慢慢含了进去。没过几秒，那根小巧、软晃晃的假阳具就深深没入这个恶魔变体的喉咙里；等它再被抽出来时，表面已经沾满唾液，闪闪发亮。鲁比又抓了一把覆盆子味的润滑液，给覆盖在假阳具上的湿滑黏腻又添了一层。随后，[rubi ey]稍稍犹豫了一下，把它放低到[rubi eir]双腿之间，让假阳具那海绵般、蘑菇状的龟头抵向[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) != 1)
            {
               outputText("湿滑小穴");
            }
            else
            {
               outputText("饥渴屁眼");
            }
            outputText("。");
            outputText("[pg]随着假阳具的顶端滑入[rubi eir]紧窄的穴口，鲁比的嘴唇也张成了O形。你挪到床沿，目光被眼前这一幕牢牢吸住。面对这样香艳的表演，你并不意外自己也开始被撩得兴奋起来。你爱人那条恶魔般的尾巴向前轻摆，缠上假阳具；鲁比则把它压得更深，[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) != 1)
            {
               outputText("小穴");
            }
            else
            {
               outputText("肛穴");
            }
            outputText("紧紧吸住那件玩具，让你觉得简直像虎钳一样。");
            outputText("[pg]眼前这个可爱的小家伙轻轻呻吟着，随着更多假阳具被压入体内，直到[rubi ey]发现它已经完全顶到底，抵上了假阳具宽大的外扩底座。鲁比柔软的玫瑰色嘴唇向上弯起，露出得意的微笑。[rubi Eir]手和尾巴重新牢牢抓住那根假肉棒，然后[rubi ey]将[rubi eir]臀部抬起几[if (metric) {厘米|英寸}]，又猛地坐回假阳具上。");
            outputText("[pg]你咬住嘴唇，感觉[eachCock]把你的[armor]顶得发紧，于是闭上眼片刻，任由想象接管一切。你想象着鲁比跨坐在你赤裸的身体上，你的双手沿着[rubi eir]的身体向上游走。插入爱人体内、来回抽送的感觉像一阵新鲜空气般席卷了你。鲁比的臀部在你身上旋动，你能感觉到一股强烈的冲动正在体内积聚……");
            outputText("[pg]鲁比突然发出一声呻吟，把你拉回现实。你猛地睁开眼，视线锁定在这个恶魔" + rubiMF("男孩","女孩") + "纤细的身躯上，那身体正剧烈颤抖着。[rubi Eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText(rubiCock() + "已经高高挺立，随着鲁比在假阳具上抽插[rubi emself]而上下跳动");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
            {
               outputText("，而[rubi eir]的");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
            {
               outputText("阴唇因欲望而泛红发亮，仿佛在渴求被好好关注");
            }
            outputText("。鲁比的叫声越来越响，[rubi eir]双唇分开，舌头也垂了出来，喘息着汲取空气。你看得出来，[rubi ey]正在逐渐逼近某个时刻，而且那股势头相当猛烈。");
            outputText("[pg][rubi Eir]的臀部旋转、摇摆，卖力地让[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("后庭");
            }
            else
            {
               outputText("肉穴");
            }
            outputText("里塞满了鸡巴，哪怕那只是假的。这个纤细而阴柔的恶魔嗓音里充满了淫欲的狂热，几乎能在弥漫四周的温热空气中触碰到。每一声近乎高潮的音调从[rubi eir]喉咙里钻出来，都仿佛滴淌着愉悦，扭动着钻进你的耳中，也让你的身体染上了[rubi eir]的激情。");
            outputText("[pg]不过最终，鲁比还是撑不住了。[rubi Eir]的肌肉猛地收缩，双臂收拢挡在[rubi eir]胸前，仿佛[rubi ey]突然意识到自己身上的内衣有多么暴露。[rubi Eir]那双诱人的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) != 2)
            {
               outputText("光裸");
            }
            else
            {
               outputText("覆着毛发的");
            }
            outputText("双腿一软，其中一条还疯狂抽动，迫使[rubi em]把自己完全贯穿在那根仿制的肉棒上。在四肢痉挛与突如其来的羞怯交织的混乱中，鲁比几乎喘不过气来；只要[rubi ey]不是在呻吟着索求更多，就会发出细小的急促喘息。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("[pg]鲁比的鸡巴也随之痉挛，猛地向空中喷出一股珍珠白的精液。然而这并没有在一发之后停下，反而把[rubi eir]胯间变成了某种淫靡的喷洒器，将附近几乎所有表面都溅满了[rubi eir]的淫液。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 0)
            {
               outputText("[pg]你清楚地看见鲁比的胯间，[rubi eir]的阴唇紧紧收缩在那根人造入侵物周围，[rubi eir]的阴蒂一度陷入肉中，随后又立刻顶了出来。[rubi Eir]那颗小小的爱钮就这样脉动了好几次，每一次都比上一次更加慵懒。");
            }
            outputText("[pg]随着[rubi eir]的高潮逐渐平息，鲁比瘫靠回墙上，那根小巧的人形假阳具也趁机从[rubi eir]的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("肛穴");
            }
            else
            {
               outputText("小穴");
            }
            outputText("里滑出一半，仿佛要从那甜美的肉质牢笼中挣脱出来。你纤细的爱人口中逸出一声长长的叹息。[rubi Ey]显然已经筋疲力尽，却也因这场狂喜的释放而心满意足。");
            outputText("[pg]你从床上下来，走上前去查看这场偷窥幻想的主角；[rubi eir]的双眼半闭着。[rubi Ey]朝床上示意，低声说道：[say:我想我需要休息一下了。]你咧嘴一笑，顺从了这位乖顺的爱人，将[rubi em]抱起来，任由假阳具彻底滑落出来，然后把[rubi em]抱到床边，放在床单上。鲁比低声表达着[rubi eir]的谢意，抱住一个格外蓬松的枕头蜷了起来。");
            outputText("[pg]你转身正要离开房间，却又看见了那个玩具箱。你俯下身，在箱子里翻找，直到你发现了它……一枚闪亮的金属肛塞，底端还镶着一颗宝石。你脸上浮起狡黠的笑容，取出肛塞，悄悄钻到鲁比身后的床上。[rubi Ey]因你的靠近轻轻哼了一声。你用一只手沿着[rubi eir]的身体抚过，探到[rubi eir]两腿之间，将一根手指滑入[rubi eir]微微张开的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("屁股");
            }
            else
            {
               outputText("小穴");
            }
            outputText("。");
            outputText("[pg]当鲁比转过头，想问你在做什么时，你坏笑着把肛塞塞进了[rubi em]体内。鲁比双眼紧闭，[rubi ey]忍住一声呻吟，任何疑问或想说的话都被抛到了脑后。你贴着[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 0)
            {
               outputText("耳朵");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 1)
            {
               outputText("猫耳朵");
            }
            else
            {
               outputText("覆着羽毛的耳朵");
            }
            outputText("低声说，[rubi ey]应该让那东西在里面待上几个小时，好确保这次训练真正见效。鲁比回给你一个浅浅的微笑，又在你脸颊上轻轻一吻，随后钻进被窝小睡片刻。");
            outputText("[pg]你觉得这也是离开的最佳时机，于是走出公寓，回到了营地。");
            dynStats(DynStat.Lust(20 + get_player().lib / 5),DynStat.NoScale);
         }
         else
         {
            outputText("你再次提起训练鲁比屁股的事。[rubi Ey] 抬头看向你，脸上带着有些羞怯的笑容，坦白道：[say: 我就盼着你会这么说呢，宝贝。其实我自己也偷偷练了一点。我……嗯，我一直痒得不行，想把你那根大家伙塞进我身体里。]");
            outputText("[pg]你咧嘴一笑，说只要训练得够多，也许很快 [rubi ey] 就能做到了。");
            outputText("[pg]鲁比从沙发上站起，慢慢朝卧室走去，[rubi eir] 臀部和尾巴扭出诱人的弧度，你很确定那是在邀请你。你也站了起来——不止一种意义上——然后迅速跟上这个恶魔般的小妖精。你们走进卧室后，[rubi Ey] 朝那张柔软的床示意了一下，说道：[say: 你先随便坐。我去换点……不那么舒服的东西，]");
            outputText("[pg]脸上还挂着傻笑的你，在鲁比的床边坐下。那是一张蓬松的白色大床，上面铺着淡紫色的床罩。你找了个舒服的姿势坐好，而你那有着恶魔尾巴的情人则消失在浴室里。差不多十分钟后，[rubi ey] 重新出现，倚在门口摆出姿势。");
            outputText("[pg][rubi ey] 抬起一只手臂倚在门框上，展示着 [rubi eir] 身上那件粉蓝色的娃娃裙。这件轻薄又暴露的透明内衣几乎遮不住鲁比的身体，事实上，[rubi eir] 的 [rubi breasts] 完全敞露着，只被一圈三角形的白色蕾丝框住。娃娃裙波浪状的下摆垂得很低，却还不足以遮住 [rubi eir] 的胯间。鲁比的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText(rubiCock());
            }
            else
            {
               outputText("甜美的小穴");
            }
            outputText("就这样大方地展现在你眼前，而且全都是为了你。鲁比的妆容一点也不低调，鲜红的嘴唇配上一层淡淡的银色眼影，既让 [rubi eir] 的双眼更加醒目，又不会和这身衣服冲突。最后点缀这身打扮的，是一双白色渔网袜，沿着 [rubi eir] 的双腿一路向上，停在大约大腿中部的位置。");
            outputText("[pg]你饥渴地舔了舔嘴唇。[say: 哦？]鲁比问道，向你款款走来。[rubi eir] 每一步时臀部摇曳的样子，都让你的心微微一颤。[say: 你想不想，][rubi ey] 俯下身，[rubi eir] 半阖的眼睛让 [rubi em] 看起来格外撩人。[rubi Eir] 的嘴唇擦过你的唇，只是短短一瞬的接触，却依然带来触电般的感觉。[say: 来，][rubi ey] 撅起嘴唇，与你的唇贴合在一起，化作一个湿热而缠绵的吻，吻得你几乎喘不过气。[say: 尝尝？][rubi ey] 终于说道，离开你的嘴时发出一声细小而娇柔的喘息。");
            outputText("[pg]鲁比退开时，你仍有些喘不过气，而 [rubi ey] 则咯咯笑了起来。[say: 抱歉啦，宝贝，你刚才看起来太入迷了。我实在忍不住想逗你一下。]你笑了笑，随后伸手环住 [rubi eir] 的腰，轻而易举地把 [rubi em] 拉到自己腿上。你们的嘴唇再次贴合，鲁比在你的怀抱中几乎融化。没有遇到任何抵抗，你的舌头侵入了这个" + rubiMF("恶魔","女恶魔"));
            outputText("的口中，探索着每一[if (metric) {厘米|英寸}]，并与鲁比的舌头纠缠在一起。");
            outputText("[pg]当你们分开时，这次轮到鲁比喘不过气了。[rubi Eir] 的嘴微微张着，眼睛也闭了好几秒，直到你轻轻的笑声才让 [rubi em] 回过神来。鲁比的脸颊");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 0)
            {
               outputText("变得通红");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,994) == 3)
            {
               outputText("变成了鲜明的紫色");
            }
            else
            {
               outputText("现在本该羞得通红，要不是有一层细密的毛发遮着的话");
            }
            outputText("，[rubi ey] 这才回过神来。[say: 呵呵……看来这是我活该。]");
            outputText("[pg]鲁比坐在你的腿上，笨拙地与你对视了一会儿，随后 [rubi ey] 似乎终于想起自己一开始为什么要邀请你回到这里。[say: 对了，对了！我想现在该继续来一点[i:训练]了，][rubi ey] 说道，并把那个词咬得格外重。鲁比从你腿上扭身滑下，从床底取出那个黑粉相间的玩具箱。你那少女般的小情人打开箱盖，在里面翻找起来，直到 [rubi eir] 眼睛一亮。");
            outputText("[pg][rubi ey] 从箱子里拿出的东西，也让你不由得睁大了眼睛。那是一根[if (metric) {三十厘米|十二英寸}]高、紫黑斑驳的马屌。但最让人在意的还不是这个……而是那根摇晃的假阳具底部上方那块圆鼓鼓的区域。那东西让你想起了犬科动物的肉结。");
            outputText("[pg]鲁比举起它，笑得灿烂。[say: 这家伙肯定能派上用场！你看，它这里有个小气泵，] [rubi ey]说着，举起一个小巧的手持气泵，气泵通过一根长管连在假阳具上。[say: 它能把底部的肉结充起来……肯定会把我给你撑得大大的，宝贝。] 鲁比咯咯笑着，把假阳具放在你面前的地板上，又眨眨眼把气泵递给你。[say: 你拿着这个，想什么时候捏一下都行，好吗？现在先把这道美味热身好。]");
            outputText("[pg][rubi Ey]从箱子里取出一只瓶子。那看起来像个小小的密封酒壶，上面画着一个笑眯眯、而且全身赤裸的地精。[say: 这是我前几天去地精市场买这件小娃娃裙时看到的一个润滑液牌子。据说它能帮上“撑开”这方面的忙，] 鲁比解释着，拔开酒壶的塞子。[rubi Ey]把它倒在那根橡胶大屌上，让大量焦糖色的液体泼洒在张开的顶端。");
            outputText("[pg]桃子和酒精的气味弥漫开来，让你想起桃子味烈酒，又或许是桃子玛格丽塔。光是这股香味就几乎令人沉醉。鲁比把那瓶润滑液放到一边，用[rubi eir]修剪精致的手指沿着马屌一路抹过，把那层厚厚的果香液体涂开，直到整根都被覆盖。[rubi Ey]又往[rubi eir]掌心倒了一大团散发着桃子玛格丽塔香气的润滑液，俯身把它抹在[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("肛穴");
            }
            else
            {
               outputText("小穴");
            }
            outputText("，确保涂满每一[if (metric) {处|寸}]。你甚至确信自己看到有几根手指探进了[rubi eir]的洞里。");
            outputText("[pg]一切都准备妥当后，鲁比站起身，悬在那根假阳具上方。[rubi eir]一只沾满润滑液的手向前伸来，把你拉近，另一只手则探到[rubi em]身下，确认假阳具的位置没错。就在[rubi ey]把[rubi em]自己沉坐到那根橡胶马屌上时，[rubi Eir]的双唇再次贴上你的嘴。紧接着，你听见了鲁比有史以来最热烈的一声呻吟，尽数灌进你的口中。");
            outputText("[pg][say: 嗯，天啊，] [rubi ey]惊呼道，你们的嘴唇彼此分开。[say: 它好[i: 大！]] 鲁比又向下吞进了[if (metric) {几厘米|几英寸}]，[rubi eir]的表情介于痛苦与狂喜之间。[rubi Ey]从你身边稍稍退开，让你足以看清那根正贯穿你爱人的巨大湿滑肉棒。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("[pg]鲁比的[rubi cock]抽动了一下，从半硬的状态中挺起。不到一分钟，它就笔直竖了起来，在覆盖着你爱人身体的淡蓝色透明薄纱下顶出一座显眼的小帐篷。");
            }
            else
            {
               outputText("[pg]");
            }
            outputText("鲁比又花了差不多一分钟，才把那根肉棒完全吞下——这本身就已经是个惊人的壮举……可当然，还有那个肉结。即便现在它还没充气，你也不确定你这位恶魔般的小狐狸精能不能承受得住。事实上，[rubi ey]和它较劲了好一阵，直到你凑过去，在[rubi eir]耳边低声说起鼓励的话。那些下流的话语告诉[rubi em]，等那个");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("屁股");
            }
            else
            {
               outputText("小穴");
            }
            outputText("被好好调教过之后，你会怎么对待它。");
            outputText("[pg]不需要更多鼓励，鲁比把[rubi em]自己压得更深。在[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("肛穴");
            }
            else
            {
               outputText("小穴");
            }
            outputText("几乎被撑到极限时，[rubi Eir]的眼睛愉悦得向上翻去。最后，随着肉结彻底挤进到位，[rubi ey]如释重负地叹了一声。[say: 噢……操，太大了，] [rubi ey]尖叫着，[rubi eir]的身体明显颤抖起来。鲁比的舌头耷拉出来，一点唾液顺着[rubi eir]的下巴滴下。");
            outputText("[pg]鲁比的呼吸变得越来越急促，[rubi ey]在假阳具上扭动着[rubi eir]的臀部。急促而原始的呻吟从[rubi eir]唇间逸出。你从没见过[rubi em]如此兴奋。也许是润滑液里有什么成分，又或许[rubi ey]真的只是个喜欢被人看的露出癖，靠着为你上演这场表演来获得快感。不管怎样，你倒也没什么可抱怨的，尤其是当[rubi eir]的双手突然伸向你的[armor]，发疯似的摸索着里面藏着的奖品时。");
            outputText("[pg]你向来不愿让人失望，尤其不愿让这么饥渴的骚货失望，于是你尽快脱去衣物，重新在鲁比面前摆好姿势。[EachCock]立刻精神抖擞地弹起。[rubi Ey]毫不浪费时间。[rubi ey]俯身向前，一只手握住根部，另一只手则把[cockHead biggest]引向[rubi eir]的嘴边。");
            outputText("[pg]当恶魔变形者的舌头触碰到你时，一股温热的感觉涌遍全身。那舌头柔软而湿润，像浪潮一样绕着你龟头的顶端打转。一道饥渴难耐、欲求不满的浪潮。随即，一双嘴唇包住了你巨大的阳具，像虎钳般紧紧夹住。鲁比吮吸着，仿佛把你全身的血液都吸引到了肉棒顶端，将冲击你大脑的所有快感放大了百倍。");
            outputText("[pg]当你两腿之间那个放荡的骚货卖力服侍时，你注意到[rubi eir]假阳具的小气泵就躺在你身旁。你的脸上浮现出一抹邪恶的笑意。鲁比闭着眼，[rubi eir]脑袋在你的[cock biggest]上上下起伏，根本没注意到你把它拿了起来。不过，当你轻轻捏了一下气泵时，[rubi ey]立刻就察觉到了。毫无疑问，牢牢卡在[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("肛门");
            }
            else
            {
               outputText("小穴");
            }
            outputText("里的肉结刚才稍稍胀大了一圈。鲁比的眼睛一下睁大，[rubi ey]抬眼看向你，嘴里塞满了肉棒，含混地呻吟着什么，你完全听不懂。");
            outputText("[pg]你想知道[rubi ey]是不是还想让你再按一次气泵。于是你照做了。鲁比的嘴在你的肉棒周围震动着，[rubi ey]呻吟得更大声，[rubi eir]双眼开始向上翻去。又按了一下。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("你能感觉到爱人的阴茎抵着你的腿绷紧，渴望着释放。你随意地用脚抵住它，感觉到上面已经从头到尾覆着一层滑腻的前列腺液。");
            }
            outputText("鲁比眼中浮现出恳求的神色。你举起气泵，问[rubi em]是不是还想让你再用一次。[rubi Ey]迅速点了点[rubi eir]头表示同意，又把你的[cock biggest]含得更深，以此再次表明[rubi eir]的意思。");
            outputText("[pg]你快速按了一下，接着又按了第二下，也是最后一下。鲁比那");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 0 || rubiBimbo())
            {
               outputText("绿色");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,993) == 1)
            {
               outputText("紫色");
            }
            else
            {
               outputText("闪亮的黑色");
            }
            outputText("眼睛紧紧闭上，[rubi ey]沉入一场足以融化大脑的高潮。[rubi Eir]全身都在颤抖，从蜷起的脚趾一直到抽搐着、涂着指甲油的手指。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) > 0)
            {
               outputText("甚至，不，<i>尤其是</i>[rubi eir]的阴茎也抽搐痉挛着向上弹起，一团团黏稠的白色浆液溅在鲁比娃娃裙的内侧，随后又滴落到[rubi eir]两腿之间的地板上，迅速积成一滩。");
            }
            outputText("[pg]你也没能撑太久。即使鲁比正经历着那场足以改变心智的高潮，[rubi ey]仍继续吮吸舔弄你的大肉棒，直到你感觉到狂喜的温热火焰在血管中蔓延。你想象着终于把这根厚实的肉棒插进鲁比的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) > 0)
            {
               outputText("屁股");
            }
            else
            {
               outputText("小穴");
            }
            outputText("，让[rubi em]因你的动作而尖叫，而不是因为一根毫无生气的假阳具。你想象着那位" + rubiMF("demon","demoness") + "又热又湿的肉壁紧紧夹住你，把你榨得一滴不剩。");
            outputText("[pg]这已经足够将你推过临界点。你抓紧床上柔软的床单，强忍住自己的呻吟。你体内的热度不断攀升，集中在那根半埋进鲁比喉咙里的肉棒上。你能感觉到快感越来越强烈，也竭力想要压住它，却毫无用处。伴随着一声粗重的闷哼，你射了出来，一股又一股珠光般的精液喷进爱人的喉咙深处。[rubi Ey]急切地全都吞了下去，努力不浪费一滴。");
            outputText("[pg]鲁比终于把[rubi eir]脑袋往后退开，正好赶上最后两股精液喷在[rubi em]脸上。不过，[rubi Ey]只是朝你露出一个撩人的笑容，然后用[rubi eir]手指把剩下那团甜美的精液抹起来，舔了个干净。你彻底脱力地倒回床上。你本没想到事情会变成这样。当然，你也并不抱怨就是了。");
            outputText("[pg]你听见轻轻“啵”的一声，很快鲁比也上了床，来到你身边。[say:嗯，我很高兴你喜欢，宝贝，][rubi ey]一边说，一边还在舔净[rubi eir]双手。[say:希望我们很快还能再来一次。][rubi Ey]用一只手臂搂住你，渐渐睡去。刚才那场激烈的扩张训练显然把[rubi ey]累坏了。");
            outputText("[pg]你陪着[rubi em]待了足足十分钟，才从[rubi eir]怀里抽身出来，把一个枕头塞到你原来的位置，鲁比感激地抱住了它。你转身准备离开房间时，又看到了那个玩具箱。你弯下腰，在箱子里翻找，直到发现了它……一个又粗又大的黑色橡胶肛塞。你把肛塞取出来，脸上浮起狡黠的笑，然后悄悄溜到鲁比身后的床上。[rubi Ey]感觉到你靠近，轻轻哼了一声。你用手沿着[rubi eir]身体抚过，探进[rubi eir]两腿之间，把一根手指滑入[rubi eir]微微张开的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,990) == 1)
            {
               outputText("屁股");
            }
            else
            {
               outputText("小穴");
            }
            outputText("。");
            outputText("[pg]当鲁比转过头，想问你在做什么时，你坏笑着把肛塞塞进了[rubi em]体内。鲁比双眼紧闭，[rubi ey]忍住一声呻吟，任何疑问或想说的话都被抛到了脑后。你贴着[rubi eir]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 0)
            {
               outputText("耳朵");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,998) == 1)
            {
               outputText("猫耳朵");
            }
            else
            {
               outputText("覆着羽毛的耳朵");
            }
            outputText("低声说，[rubi ey]应该让那东西在里面待上几个小时，好确保这次训练真正见效。鲁比回给你一个浅浅的微笑，又在你脸颊上轻轻一吻，随后钻进被窝小睡片刻。");
            outputText("[pg]你觉得这也是离开的最佳时机，于是走出公寓，回到了营地。");
            get_player().orgasm("Dick");
         }
         saveContent.hadSex = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptRubi() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你伸出双臂，把他拉进怀里抱住。你告诉他，不管他生来有怎样的性器，你都喜欢他。");
         outputText("[pg]他抹去眼角的泪水，笑了起来，紧紧抱住你。[say: 哦，感谢玛莱，我还担心你知道以后会讨厌我呢。]");
         outputText("[pg]你有些好奇，怎么会有人讨厌像他这样可爱又活泼的人，于是把这想法告诉了他。他稍稍从你怀里退开，笑容变得更灿烂了。");
         outputText("[pg][say: 我——谢谢你，[name]。只是别把我的秘密告诉别人，好吗？我在这里的生活已经够复杂了，没必要再添麻烦。]你点点头，发誓会替他保守秘密。");
         outputText("[pg]鲁比最后又抱了你一下，然后朝面包店走去，恶魔般的尾巴在身后开心地甩动着。[say: 回头见……宝贝，]他说着，像是在试着适应这个称呼。你笑了笑，继续踏上回营地的路。");
         rubiAffection(3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function NTRbimboBitchResolution() : void
      {
         clearOutput();
         rubiSprite();
         outputText("你看着鲁比，说你们绝对得谈谈刚才发生的事。");
         outputText("[pg]她点点头坐下，拿起屋里随处可见的一只淡粉色软垫遮住赤裸的身体。[say: 就是，我知道……我真的不该那样。我爱你，宝贝，我真的爱你。可自从……变成这样以后，]她把软垫拿开一秒，低头示意自己那副火辣的身材，[say: 就是……]她咬住嘴唇，陷入沉思，绞尽脑汁想找出合适的话来。");
         outputText("[pg][say: 我爱这具身体，也爱你把它给了我……可是它有需求，你懂吗？我一想到你，想到其他人，就会变得好热，我就是控、控不、我没法阻止自己。那家伙对我一点意义都没有，我才刚认识他而已。就是，我真的希望你能一直陪在我身边，你懂吗？我们可以解决这些……欲望，]她在这个词上拖长了声音，[say: 每天都解决。或者一天好几次……可我们做不到。你是勇、勇者、那个英雄大人，而我只是这座城里的一个女侍。就是，我真的不能耽误你的使命。]");
         outputText("[pg]她盯着你的脸看了一会儿，又咬住那红宝石般的嘴唇，然后说道，[say: 就是，如果你想的话，我绝对会努力控、努力忍住自己的。这里的性感小玩具比地精的藏宝室还多。要是你想让我只属于你，我肯定会坚持住。可如果你不这么想……我觉得有根真正的鸡巴可以舔，或者有个小穴可以吃，这些欲望肯定会更容易控制。]");
         outputText("[pg]鲁比紧紧抱住软垫，看来她的话已经说完了。那么你要怎么回应？");
         outputText("[pg]你可以拒绝她，禁止她再见其他人。也可以答应她，让她和任何人上床。你也可以直接跟她分手。又或者，也许还有第四个选择……");
         menu();
         addButton(0,"不行",noBimboNTR);
         addButton(1,"可以",yesBimboNTR);
         addButton(2,"分手",breakUpWithRubi);
         addButton(3,"拉皮条",pimpOutRubi);
      }
   }
}

