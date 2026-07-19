package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.Cock;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Measurements;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.places.Bazaar;
   import classes.scenes.places.bazaar._Lilium.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class Lilium extends BazaarAbstractContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function Lilium()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "lilium";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent = new SaveContent(null,null,null);
      }
      
      public function registerTags() : void
      {
         var cockIndex:int;
         var _g:Player = get_player();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         cockIndex = _loc1_;
         registerTag("cock",TagFun_Impl_.fromStringFun(function():String
         {
            return _g.cockDescript(cockIndex);
         }));
         registerTag("s",TagFun_Impl_.fromBool(get_player().cockTotal() >= 2));
         registerTag("learnedname",TagFun_Impl_.fromBool(saveContent.learnedName));
         registerTag("haspaid",TagFun_Impl_.fromBool(saveContent.hasPaid));
      }
      
      public function payForLilium() : void
      {
         clearOutput();
         if(get_player().isGenderless())
         {
            outputText("你跟着女恶魔来到一个僻静的地方。她面带笑容地蹲在你面前，帮你脱下[armor]。当她看到你平坦、毫无特征的胯部时，笑容很快被惊讶和困惑所取代。");
            outputText("[pg]她抬头看看你，又低头看看你的腹股沟，来回看了几次，然后挠了挠头，双臂交叉。[say: 好吧，]她开口打破了尴尬的沉默。[say: 这可不是每天都能见到的。你是出了什么事故吗？我的意思是，我以前也见过缺胳膊少腿的人，但是……]女人的声音渐渐变小，用戴着手套的一根手指轻轻戳了戳你光秃秃的耻骨。[say: 事实上，你知道吗？我真的不想知道是什么把你弄成这样的。]说完，她站起身，抓住你的一只胳膊，把装有你付给她的宝石的小袋子放回你手里。");
            outputText("[pg][say: 听着，很抱歉，但我现在真的没法为你做任何事。如果你的，呃，情况有所改变，再来找我吧。]莉莉姆随后走开了，留下你一个人光着身子。");
            outputText("[pg]真扫兴。");
            doNext(get_bazaar().enterTheBazaar);
            return;
         }
         outputText("你无法否认自己被勾起了兴趣，开始掏出宝石，同时问她能提供什么服务。");
         outputText("[pg][say: 我的乳头和任何小穴一样棒，我的屁股很柔软，而且我的肉棒甚至都为你精心打扮过了，]她说道。[say: 顺便说一句，我叫莉莉姆。]");
         outputText("[pg]你要对她做什么？");
         saveContent.learnedName = true;
         menu();
         payButtons();
         setExitButton("返回",nevermind);
      }
      
      public function payButtons() : void
      {
         var scene2:Function;
         var _g2:Lilium;
         var scene1:Function;
         var _g1:Lilium;
         var _g:Lilium = this;
         var scene:Function = buttFuckTongueJeorb;
         addNextButton("肛交",function():void
         {
            _g.payAndThen(scene);
         }).disableIf(!get_player().hasCock() || !get_player().hasLongTongue(),"此场景需要阴茎和长舌头。").disableIf(get_player().get_gems() < 50,"需要50颗宝石。");
         _g1 = this;
         scene1 = liliumDickRidah;
         addNextButton("骑乘她",function():void
         {
            _g1.payAndThen(scene1);
         }).sexButton(2,false).disableIf(get_player().get_gems() < 50,"需要50颗宝石。");
         _g2 = this;
         scene2 = liliumNippleFuck;
         addNextButton("乳交",function():void
         {
            _g2.payAndThen(scene2);
         }).sexButton(1,false).disableIf(get_player().get_gems() < 50,"需要50颗宝石。");
      }
      
      public function payAndThen(param1:Function) : void
      {
         saveContent.hasPaid = true;
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 50);
         statScreenRefresh();
         param1();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nevermind() : void
      {
         clearOutput();
         outputText("当你对这笔交易产生怀疑时，宝石的叮当声停止了。这次她的提议并没有打动你，你决定离开。女恶魔嗤笑了一声，但还是礼貌地补充道：[say: 别见外，常来啊。]");
         doNext(get_bazaar().enterTheBazaar);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function liliumNippleFuck() : void
      {
         clearOutput();
         outputText("莉莉姆带你来到集市里一个僻静的地方，让你们能享受彼此的陪伴[if (isnaked) {，然后立刻跪在你面前|。她跪在你面前，你脱下[armor]，向她展露你赤裸的身体}]。");
         outputText("[pg]莉莉姆开始用手掌轻轻摩擦你疲软肉棒的侧面。当它在她的手中开始变硬时，她凑近身子，让它在她柔软的脸颊上变得坚挺。你感觉到她湿润的舌头抵在你[cock]的根部，然后开始沿着肉棒的下侧滑动，莉莉姆舔舐着你男性象征的长度，直达顶端。");
         var _loc1_:Array = get_player().cocks;
         var _loc2_:int = get_player().cockThatFits(40);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc1_[_loc2_].get_isPierced())
         {
            outputText("当她的舌头滑过每一个穿孔时，你能感觉到轻微的凸起，当她到达末端时，她用舌尖在你的龟头上轻弹了一下。");
         }
         else
         {
            outputText("当她的舌头结束旅程时，她用舌尖在你的[cock]头上轻轻弹了一下。");
         }
         outputText("[pg]她手里拿着一缕黑发，慢慢地在你的龟头上划过，让你脊背发凉。她显然对你的反应感到高兴，开始用那缕柔软的头发在你的肉棒上上下刷动。你可以看到她腾出一只手放到乳房上，同时继续用柔软的发丝逗弄你的[cock]。起初她只是轻轻地托住并按摩着苍白的肌肤，然后将一根手指滑入她那玫瑰色的乳头穴中。她咬着嘴唇，开始将手指抽插起来。");
         outputText("[pg]你不满足于莉莉姆对你[cock]的挑逗，你抓住她的肩膀，把她推到墙上，这突如其来的动作让她的手指从乳头里拔了出来。你用一只手将[cock]的头部对准她现在滴着淫液的乳房入口，向前挺进。起初有一点阻力，但当你突破阻力，她的乳房包裹住你时，莉莉姆发出了娇喘。遗憾的是，她的乳房不够大，无法让你根部没入，但将部分肉棒在她的胸部抽插同样令人愉悦。柔软的肉丘随着你的抽插而变形，当你拔出时被拉伸，当你挺入时又挤压在一起。莉莉姆的眼神变得迷离，随着你操弄她的乳房，她的喘息声越来越大。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg]你觉得只照顾她的一侧乳房不太公平，于是你抓起你的另一根[cocks]，毫不客气地塞进莉莉姆寂寞的乳头穴里，这额外的插入让她发出一声大叫。现在你的两根肉棒都插在她的乳房里，这让莉莉姆的身体有了额外的支撑，恶魔的身体随着你的每一次挺进剧烈地前后摇晃。你稍微向后退了一点，把她从墙边拉开，以免撞伤她。当你恢复抽插时，你能听到她的呻吟声随着身体的摇晃而颤抖。");
         }
         else if(get_player().tail.type == 3 || get_player().isNaga())
         {
            outputText("[pg]你觉得只照顾她的一侧乳房不太公平，于是你拉起尾巴，毫不客气地塞进莉莉姆寂寞的乳头穴里，这额外的插入让她发出一声大叫。现在你的肉棒和尾巴都插在她的乳房里，这让莉莉姆的身体有了额外的支撑，恶魔的身体随着你的每一次挺进剧烈地前后摇晃。你稍微向后退了一点，把她从墙边拉开，以免撞伤她。当你恢复抽插时，你能听到她的呻吟声随着身体的摇晃而颤抖。");
         }
         outputText("[pg]莉莉姆放弃了稳住身体的尝试，将双手伸向自己的肉棒，开始配合着你的节奏套弄按摩起来。你操弄着莉莉姆滴水的乳头[s]发出的湿润水声和噗嗤声，与她套弄自己肉棒的轻柔声音，加上你的闷哼和她的呻吟，在集市这个偏僻的角落里交织成了一首性爱的合唱。很快，你感觉到下腹部积聚起熟悉的压力，于是加快了抽插的速度；伴随着最后一次巨大的努力，你尽可能深地挺进莉莉姆的乳房[s]里。当你高潮时，一阵狂喜的浪潮从你的头顶席卷至你的[if (hastail) {尾巴|[feet]}][if (multicock) {，你未使用的肉棒也用精液将她浇透}]。她紧致的乳头小穴[s]紧紧包裹着你的[if (multicock) {双龙|肉棒}]，导致你每次将精液射入她体内时，都会有一些精液从她的乳头[s]里喷射出来，剩下的则顺着莉莉姆的肚子和大腿流下。");
         if(get_player().cumQ() >= 700 && get_player().cockTotal() > 1)
         {
            outputText("滚滚精液从你的肉棒中涌出，撑大了她的乳头孔，回流的精液从龟头周围喷涌而出。");
         }
         outputText("[pg]你从她那可供操弄的乳头[s]中抽出的感觉，让莉莉姆自己也达到了高潮，导致她自己的精液从肉棒中喷射而出。精液喷射的轮廓在蕾丝袜的末端清晰可见了一瞬间；当她把袜子填满时，它淫秽地鼓起并滴落，她挤压着自己的肉棒，发出一声响亮的欢愉叫喊。当她喘着粗气跪在你面前，精液从她大张的乳头[s]和浸湿的袜子中滴落时，你拂去她脸上的一缕乱发。她的目光上移与你交汇，你向她眨了眨眼，你们俩都淫荡地笑了起来。");
         outputText("[pg]你重新穿好衣服准备离开；当你回头看时，莉莉姆——仍然坐着并靠在墙上——向你飞吻。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function liliumDickRidah() : void
      {
         clearOutput();
         outputText("莉莉姆带你来到集市外一个僻静的地方。她脱下紧身胸衣和裙子，将蕾丝阴茎套从她的阴茎上滑落[if (!isnaked) { ，而你也急切地脱下自己的[armor]}]。");
         outputText("[pg]你轻轻地将莉莉姆推倒仰卧，然后跨坐在她的腰上。当她用端庄的表情抬头看着你时，你将手移到她挺拔的乳房上，开始对她的胸部进行缓慢的打圈按摩。随着每一次抚摸，你都极其轻微地放松力道，将手指移近她的乳头，直到最后你用食指轻轻地在它们玫瑰色的尖端周围画圈。你可以看到莉莉姆闭上眼睛，享受着你对她身体的抚摸。你轻轻地将一根手指的指尖滑入她每一个诱人的乳头穴中，身下的女人弓起背，试图迫使你的手指更深地进入她起伏的乳房。你咧嘴一笑，将手指从她的乳房上抽离，莉莉姆猛地睁开眼睛，脸上闪过一丝失望的神情。你迅速俯下身，在她深色、撅起的嘴唇上印下一个吻，让你的舌头在它们之间滑入一点点，品尝她的味道。");
         outputText("[pg]你开始慢慢地顺着莉莉姆的身体往下移动。你在她的脖子上留下一串吻痕，然后用舌头舔过她的锁骨。你继续往下，让你的嘴唇轻轻滑过这个恶魔双性人胸部的中央，直到你到达她的肚脐。");
         if(get_player().hair.length >= 15)
         {
            outputText("当你的头发弄痒她的乳头时，你能感觉到莉莉姆在你身下微微颤抖。");
         }
         outputText("首先，你开始用舌尖在她的肚脐周围画圈，接着从她的小腹底部开始长长地舔舐，一直舔到她的肚脐眼。莉莉姆的呼吸开始加快，当你的舌头继续在她肚脐上游走时，她的臀部开始在你身下前后扭动。当你更加意识到那根坚硬的阴茎正戳着你自己的胸膛时，你向后仰起头，留下一条长长发亮的唾液丝，将你的嘴和她光滑的小腹连接在一起。");
         outputText("[pg]你直起身子，将自己置于莉莉姆抽动着的阴茎上方。你的手指分开你[pussy]的阴唇，那里已经因为你自己的情欲而变得湿滑。");
         if(get_player().vaginalCapacity() < 25)
         {
            outputText("你小心翼翼地将自己降在莉莉姆的阴茎上，当龟头挤压你湿润的内壁时，你感到胸口发紧。每一寸都比上一寸更容易，很快你发出一声长长而缓慢的呼气，你的胯部与她的相遇，令人愉悦的充实感席卷了你。");
         }
         else
         {
            outputText("你毫不犹豫地将自己猛地坐到莉莉姆的肉棒上，你的[ass]因为突然的冲击而晃动着。");
         }
         outputText("你将自己拉起，直到恶魔女孩的阴茎只剩下龟头留在你体内，然后再次滑下让她填满你。你在她身上上下弹跳，你的速度和力量随着每一次抽插而增加。每次你的[hips]与她的碰撞，她坚硬的阴茎刺激着你的内壁时，你都会发出一声满足的半呻吟半喘息。莉莉姆自己对更多快感的追求让她的手摸向了自己的乳房，她开始用手指操弄自己的乳头。没过多久，她就用两根然后是三根手指在她张开的乳头穴里疯狂地抽插，你可以看到她翻着白眼，嘴巴微张，证明着流经她身体的兴奋。");
         get_player().cuntChange(14,true,true,false);
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("[pg]你将注意力转向你自己的[allbreasts]，以及它们如何因为你剧烈的抽插而弹跳，当你继续骑乘莉莉姆的阴茎时，你用双手托住你[breasts]的重量。");
            if(get_player().hasLongTongue())
            {
               outputText("你让长长的舌头从唇间伸出，卷住一颗[nipple]轻轻挤压，一阵电流般的快感直达你的核心，又传回指尖。");
            }
            else
            {
               outputText("你开始用两根手指挤压你的[nipple]，一阵电流般的快感直达你的核心，又传回指尖。");
            }
            if(get_player().biggestLactation() > 2)
            {
               outputText("一股强劲的乳汁从你的[nipple]喷射而出，涂满了莉莉姆平坦的小腹。");
            }
            else if(get_player().biggestLactation() >= 1)
            {
               outputText("一小股乳汁漏了出来，滴在你的舌头上，让你尝到了自己体液的味道。");
            }
         }
         outputText("[pg]莉莉姆仍将几根手指插在乳头里，她咬着嘴唇，用力将双乳挤在一起，臀部开始挺动，迎合着你的[hips]。看到她即将高潮，你除了在她的肉棒上上下套弄外，也开始收缩体内的肌肉。莉莉姆突然爆发出的动作让你吃了一惊，她把手从乳房上猛地抽开，粗暴地抓住你的[ass]，手指深深陷入你的臀瓣，试图将你紧紧按在她身上。她的眼睛瞪得大大的，发出一声大叫，你感觉到她将一波又一波恶魔的精液泵入你的体内，淹没了你的[pussy]。莉莉姆双臂垂在身侧，半闭着眼睛，大口喘息着。");
         outputText("[pg]你还没打算放过她，你从她那根疲软的肉棒上抬起身子，收紧下半身的肌肉，尽可能多地把她的精液留在体内，然后转过身，将身体悬停在她的脸部上方。莉莉姆很快就明白了你的意图，当你把灌满精液的小穴降到她嘴边时，你觉得你看到她紧张地咽了口唾沫。你前后摇晃着[hips]，开始将[pussy]在女恶魔的脸上摩擦，她的舌头在你体内像蠕虫一样钻动、挠痒，开始清理你爱穴中她留下的高潮残余。当莉莉姆的舌头温柔地抚弄你的内壁，嘴唇偶尔轻轻吸吮你的阴唇时，你把注意力转向了你的阴蒂。");
         if(get_player().getClitLength() < 2)
         {
            outputText("你开始用一根手指揉捏你的[clit]，这瞬间增强了从你下半身散发出的快感。");
         }
         else
         {
            outputText("你用手指温柔地夹住它，开始从根部到尖端摩擦你的[clit]，每一次抚弄都为你的[pussy]正在享受的舌头服务增添了一波快感。");
         }
         outputText("传遍全身的快感开始增强，你将胯部更用力地在恶魔情人的脸上摩擦，试图让自己达到高潮；突然，你感觉到体内爆发出一阵电流。你全身的肌肉收缩，双臂紧紧抱住身体，向内蜷缩，倒在莉莉姆身上，快感的脉冲传遍全身。你的[nipple]、[clit]、体内和体外、手臂和[legs]的酥麻感达到了顶峰，你咬紧牙关，发出一声短促而压抑的尖叫，宣泄着你的快感。");
         outputText("[pg]你筋疲力尽地瘫倒在一旁，仰面躺在莉莉姆身边。你转头看着她，她也歪着头迎上你的目光。你可以看到她脸上有着同样满足而疲惫的神情，尽管你很确定自己脸上没有精液、女性淫液和晕开的妆容混合在一起。");
         outputText("[pg]休息片刻后，你起身穿好衣服，准备启程返回营地。[say:以后常来啊，]身后传来她的声音。你的脸上浮现出一丝微笑。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         get_player().knockUp(1,418,61);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveLilium() : void
      {
         clearOutput();
         if(!saveContent.learnedName)
         {
            outputText("你拒绝了这个提议，继续在集市里闲逛。");
         }
         else
         {
            outputText("你只是路过，并表达了这层意思，随后继续在集市里漫步。");
         }
         doNext(get_bazaar().enterTheBazaar);
      }
      
      public function get_debugName() : String
      {
         return "Lilium";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getButtonName() : String
      {
         convertOldFlag();
         if(saveContent.learnedName)
         {
            return "莉莉姆";
         }
         return "恶魔";
      }
      
      public function getButtonFunc() : Function
      {
         if(get_game().time.hours >= 17)
         {
            if(!saveContent.learnedName)
            {
               outputText("[pg]你可以看到一个苍白、衣着暴露的女恶魔随意地靠在一栋建筑的墙上。");
            }
            else
            {
               outputText("[pg]你可以看到莉莉姆站在她常待的地方。");
            }
            return approachLilium;
         }
         return null;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function convertOldFlag() : void
      {
         §§push(267);
         if(!(267 is Number))
         {
            throw "Class cast error";
         }
         var _loc1_:int = int(§§pop());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) > 0)
         {
            saveContent.hasMet = true;
            saveContent.hasPaid = true;
            saveContent.learnedName = true;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,0);
         }
      }
      
      public function chooseCock() : int
      {
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function buttFuckTongueJeorb() : void
      {
         clearOutput();
         var _loc1_:Array = get_player().cocks;
         var _loc2_:int = get_player().cockThatFits(40);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = _loc1_[_loc2_].cockLength;
         outputText("你们俩在两栋建筑之间找到了一条僻静的小巷。莉莉姆脱下她的紧身胸衣和裙子[if (!isnaked) {，然后走过来帮你脱下[armor]}]。");
         outputText("[pg]她蹲在你面前，用戴着手套的一根手指沿着你[cock]的底部滑动，挑逗着它，直到它长到" + Measurements.shortSuffix(_loc3_) + "的完全长度。一旦你的雄风勃发，她便转过身，弯下腰靠在墙上，然后调皮地回头看着你，轻轻扭动了一下臀部。你在她身后站定，将你的[cock]滑入她柔软的双腿之间。");
         if(_loc3_ > 8)
         {
            outputText("你能感觉到莉莉姆较小的肉棒正搁在你的[cock]上。");
         }
         outputText("随着每一次抽插，当你滑过莉莉姆的阴唇时，你能感觉到越来越多的女性淫液包裹着你的肉棒，而她的阴茎也因兴奋而变得坚挺。");
         outputText("[pg]最后一次，你慢慢地将[cock]从她的大腿间抽出，让它拍打在她的下背部，你的双手从莉莉姆的臀部移到她珠圆玉润的屁股蛋上。将她掰开，你让你的[cock]顺着股沟慢慢向下滑动，直到龟头抵住她的后庭。你以极其缓慢的速度开始推进。当她的屁股终于吞没你的龟头时，莉莉姆的唇间漏出了微弱的喘息声，紧接着，当你突然将剩下的长度全部挺入时，她发出了一声惊讶的尖叫；你[hips]撞击她屁股的力量将她整个人推到了墙上。");
         outputText("[pg]你微微张开双唇，伸出舌头。它绕过莉莉姆纤细的腰肢，滑过她紧绷的小腹，直到找到目标：她那坚挺的阴茎。你长长的舌头紧紧缠绕住她的肉棒，当舌尖与她的龟头相遇时，你能尝到透过那散发着香气的阴茎套渗出的先列腺液。你开始通过弯曲舌头来按摩这个邪恶双性人的阴茎，同时加快了对她圆润臀部的抽插速度。");
         outputText("[pg]你建立起一种从两面取悦莉莉姆的节奏；挺进，卷曲舌头，拔出，松开，很快她就开始配合你的每一次抽插，有节奏地向后迎合你的动作。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("随着每一次抽插，你的[allbreasts]滑过她汗津津的后背，一阵酥麻感从你的[nipples]蔓延开来。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("每次你将身体贴紧莉莉姆时，从你乳房中流出的乳汁为你们之间增添了更多的润滑。");
            }
         }
         outputText("[pg]莉莉姆的呼吸节奏加快，很快她就开始颤抖，她的阴茎在你的舌头包裹下跳动着。这名恶魔街头妓女的精液喷射在阴茎套的顶端，她发出一声满足的呻吟。当她射精时，她体内的肌肉紧紧夹住你的肉棒，让你全身泛起一阵鸡皮疙瘩，这预示着你即将到来的高潮。你的双膝发软，舌头也失去了对她阴茎套的抓取；湿透的布料随着她的下一次喷射从她的阴茎上飞落，伴随着一声轻微的“啪嗒”声掉在地上。你全身的酥麻感集中在你的[cock]根部，你抓住莉莉姆恶魔尾巴的根部以获得更多的借力，用力将她拉向你，同时大声喘息着，你快感的证明在她的翘臀中爆发。这最后一次抽插迫使她的阴茎喷出额外的一股精液，顺着她的舌头监狱流下，让你最后一次品尝到她的体液。");
         outputText("[pg]莉莉姆喘着粗气，抓住你的双手，将它们绕过她的腰，按在她的肚子上。当你们俩站在那里，在狂喜的余韵中摇摇晃晃时，她向后靠在你身上，导致你一屁股跌坐在你的[ass]上，而这个恶魔女孩则压在你身上；");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你已经没有力气保持站立了。");
         }
         else
         {
            outputText("你发软的双腿暂时失去了让你们俩保持站立的力气。");
         }
         outputText("莉莉姆笑出声来，很快你也发现自己和她一起笑了起来。");
         outputText("[pg]在你们俩都恢复过来后，你起身穿上你的[armor]，向莉莉姆道谢，并开始返回营地。也许你还会洗个澡……");
         get_player().orgasm("Lips");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function approachLilium() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_lilium());
         registerTags();
         var _loc1_:String = "她的额头上长着两根将近一英尺长的角，向上向外延伸，其中一根角上装饰着闪亮的银环。她的黑发松散地盘绕着，披散在裸露的肩膀上，黑色的唇膏和浓重的眼影与她苍白的皮肤形成了鲜明的对比。一件黑色的下胸衣紧紧包裹着她的腰部，让她的乳房暴露在外，长长的黑色手套紧贴着她的手臂，一直延伸到肩膀。她还穿着一条裙撑裙，前面开叉，露出光滑赤裸的双腿，一条尾巴像吊袜带一样缠绕在她的腿上，而她的胯部，尽管她其他地方都暴露无遗，却奇怪地穿着一只蕾丝袜子，里面包裹着一根普通的阴茎。";
         if(!saveContent.hasMet)
         {
            outputText("当你走近那个女恶魔时，她的目光转向了你，她的眼睛在你的身体上游走，仔细地打量着你。你也以同样的方式回应，打量着她的身姿。" + _loc1_);
            outputText("[pg]她对你的评价似乎是正面的，因为她的脸上露出了微笑，并说道：[say: 看起来你手头有不少宝石可以挥霍；想找点乐子吗？]");
            outputText("[pg]怪[i:不得]她会穿成那样站在那里。");
            outputText("[pg][say: 只要50颗宝石，我就是你的了，]她继续说道，并张开双臂以示强调。");
            saveContent.hasMet = true;
         }
         else
         {
            outputText("[if (learnedname) {莉莉姆|一个女恶魔}]站在你面前。" + _loc1_);
            outputText("[pg][say: 又来了？[if (haspaid) {我还以为终于摆脱你了呢！|我还以为你不感兴趣呢！}]][if (learnedname) {莉莉姆|女恶魔}]打趣道，但你能看到她脸上热切的笑容。[say: 这次来是谈生意还是找乐子？我希望两者都有。]");
         }
         if(get_player().get_gems() < 50)
         {
            outputText("[pg][b:你现在没有50颗宝石来支付她的服务。也许下次吧。]");
         }
         menu();
         if(saveContent.learnedName)
         {
            payButtons();
         }
         else
         {
            addNextButton("支付",payForLilium).disableIf(get_player().get_gems() < 50,"需要50颗宝石。");
         }
         setExitButton("离开",leaveLilium);
      }
   }
}

