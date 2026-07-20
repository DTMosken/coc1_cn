package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Faerie extends BaseContent implements Encounter
   {
      
      public var outfits:IMap;
      
      public var outfit:String;
      
      public var hairColor:String;
      
      public function Faerie()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:IMap = new StringMap();
         if("nude" in StringMap.reserved)
         {
            _loc1_.setReserved("nude","赤裸的身体");
         }
         else
         {
            _loc1_.h["nude"] = "赤裸的身体";
         }
         if("straps" in StringMap.reserved)
         {
            _loc1_.setReserved("straps","纯黑色长袜和皮革裹胸");
         }
         else
         {
            _loc1_.h["straps"] = "纯黑色长袜和皮革裹胸";
         }
         if("leaf" in StringMap.reserved)
         {
            _loc1_.setReserved("leaf","树叶包裹");
         }
         else
         {
            _loc1_.h["leaf"] = "树叶包裹";
         }
         if("petal" in StringMap.reserved)
         {
            _loc1_.setReserved("petal","鲜艳花瓣做成的裹胸和短裙");
         }
         else
         {
            _loc1_.h["petal"] = "鲜艳花瓣做成的裹胸和短裙";
         }
         outfits = _loc1_;
         outfit = "straps";
         hairColor = "pink";
         super();
      }
      
      public function sexMenu() : void
      {
         var _g:Faerie;
         menu();
         addNextButton("口交",faerieOral).hint("品尝一下她甜美的花蜜。");
         if(get_player().hasCock())
         {
            addNextButton((get_player().hasVagina() ? "男方" : "") + "强暴",faerieCaptureHJ).hint("强迫妖精伺候你的肉棒。");
         }
         if(get_player().hasVagina())
         {
            addNextButton((get_player().hasCock() ? "女方" : "") + "强暴",faerieRAEP).hint("让妖精取悦你的小穴。");
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) == 1 && get_player().hasCock() && get_silly())
         {
            addNextButton("舒尔德拉肉棒",faerieShouldraDick).hint("你的肉棒太大了。不过你的幽灵同伴肯定能帮上忙。大概吧。");
         }
         if(get_goreEnabled())
         {
            addNextButton("吃掉",faerieEatingNotVore).hint("享用一点小零食。");
         }
         addNextButton("喂蜂蜜",faerieHoneyFeed).hint("强迫她吃点蜂蜜。").disableIf(!get_player().hasItem(get_consumables().BEEHONY) && !get_player().hasItem(get_consumables().PURHONY) && !get_player().hasItem(get_consumables().SPHONEY),"你没有蜂蜜。");
         addNextButton("释放",letFaerieGo);
         _g = this;
         addNextButton("永不",function():void
         {
            _g.disableFaerieEncounterForGood();
         }).hint("你现在或以后都不会对这个小妖精做任何事，她也会离你远远的。");
      }
      
      public function registerTags() : void
      {
         registerTag("faehair",TagFun_Impl_.fromString(Utils.cnName(hairColor)));
         var _loc1_:String = outfit;
         var _loc2_:StringMap = outfits;
         registerTag("faeoutfit",TagFun_Impl_.fromString(_loc1_ in StringMap.reserved ? _loc2_.getReserved(_loc1_) : _loc2_.h[_loc1_]));
         registerTag("faeisnude",TagFun_Impl_.fromBool(outfit == "nude"));
         registerTag("faeisstraps",TagFun_Impl_.fromBool(outfit == "straps"));
         registerTag("faeisleaf",TagFun_Impl_.fromBool(outfit == "leaf"));
         registerTag("faeispetal",TagFun_Impl_.fromBool(outfit == "petal"));
      }
      
      public function randomizeFaerie() : void
      {
         var _loc1_:WeightedChoice = new WeightedChoice().add("yellow",5).add("red",5).add("violet",5).add("indigo",5).add("pink",5).add("white",5).add("pale blue",5).add("lilac",5).add("orange",5).add("purple",5).add("green",5).add("black",5).add("blue",5).add("lavender",5).add("fuchsia",5).add("saffron",5);
         var _loc2_:WeightedChoice = new WeightedChoice().add("nude",3).add("straps",1).add("leaf",3).add("petal",3);
         hairColor = _loc1_.choose();
         outfit = _loc2_.choose();
      }
      
      public function letFaerieGo() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("你道了歉并放开了她，让她拍打着轻如薄纱的翅膀飞走。她向你道谢，飞到你的唇边，在你的嘴上印下了一个纯洁的吻。她头也不回地飞进了树林……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function heyListen() : void
      {
         clearOutput();
         outputText("在你受了这么重伤的情况下，在如此茂密的树林里跋涉似乎是个糟糕的决定。这样逼迫自己所带来的疲劳让你后悔做出了这样的决定，但突然间，你发现自己被小翅膀的微光所吸引。一只妖精！太好了！你毫不犹豫地冲过灌木丛，跳起来把她从半空中抓了下来。");
         outputText("[pg]小妖精尖叫了一声，发现你时已经来不及躲避了。从她原来的位置突然被拽到你正前方，让她有些头晕目眩。她把一缕火橙色的头发从脸上拨开，对你说道。[say: 你——你干嘛！？]她惊呼道。");
         outputText("[pg]你困惑地皱起眉头。你受伤了，碰到她不是应该已经治好你了吗？");
         outputText("[pg]她茫然地盯着你。[say: 呃，嘿，听着，我觉得你——]她的话被打断了，因为她说的某句话让你陷入了意想不到的狂怒之中。你强迫性地抡起手臂，以你能想到的最快速度把妖精扔了出去。她的尖叫声在几秒钟内响起并消失，因为她穿过森林飞向了远方。");
         outputText("[pg]揉了揉额头，你怀疑是不是伤势让你有些神志不清了。下次冒险前最好还是先处理一下伤口……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gladesScene() : void
      {
         randomizeFaerie();
         registerTags();
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("当你旅行时，一股奇怪而性感的香味飘荡在空气中，将你的注意力引向一个小林地。在里面，许多形状引人遐想的植物以某种诱人的方式呈现出来。无论气味和景象多么刺激，你都没有停留太久，因为你意识到已经有人在这里了。一个小妖精在一些花朵周围飞舞，[if (faeisnude) {赤身裸体，一丝不挂|[if (faeispetal) {穿着稀疏的花叶|几乎没穿衣服，除了[faeoutfit]}]}]。周围花朵的桃色、粉色和红色，加上奇怪的长度和宽度，构成了相当逼真的阴唇图像，甚至在应该是通道的地方微微分开。");
         outputText("[pg]从她滚烫发红的皮肤来看，这个有着[faeHair]头发的小妖精似乎也受到了这种色情氛围的影响——尽管从这么远的地方很难看清楚。你不假思索地[walk]近，继续观察她的行为。她停在其中一朵花上，焦急地摩擦着大腿。她一定把全部注意力都集中在了发情上，以至于没有注意到你。妖精俯下身，把手伸进洞里，拔出来时，手指上沾满了光滑闪亮的黏液。在高兴地舔了几口这种物质后，她把手滑下来，将黏稠的液体拖过肚子，然后涂抹在腹股沟上。");
         outputText("[pg]高亢的呻吟声进一步加剧了这个地方对你下半身的影响，加入她自我安慰的冲动在你的脑海中挥之不去。正当你思考这个问题时，妖精再次俯身想要获取更多黏液，却意外地开始被吸进去。她尖叫着，但那朵花似乎执意要吞噬这个入侵者。[if (hasCock) {想到它的吸力在你的[cocks]上会有什么感觉|它显然是服务肉棒的理想行为}]让你分心了片刻，没有花时间考虑帮助这个可怜的生物，直到她失去平衡，整个上半身滑了进去。");
         dynStats(DynStat.Lust(get_player().lib / 10 + 2));
         unlockCodexEntry(2733,true,false);
         menu();
         addNextButton("帮助她",faerieHelpHer).hint("释放她。");
         addNextButton("操她",faerieFuckHer).hint("你无法忽视你不断增长的欲望").disableIf(!get_player().hasCock());
         addNextButton("离开",faerieLeaveHer).hint("她真倒霉。[if (silly) { 懂了吗？}]");
      }
      
      public function gladesEnabled() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) < 50)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2221) <= 0;
         }
         return false;
      }
      
      public function faerieShouldraDick() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.FaerieFucked))
         {
            get_player().addStatusValue(StatusEffects.FaerieFucked,1,2);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.FaerieFucked,2,0,0,0);
         }
         outputText("[say: 哟，勇者，]你还没来得及问，舒尔德拉就抢先说道。[say: 现在开始强奸妖精了，嗯？别担心，我不会评判你的。但你看起来确实需要一些帮助。一些<b>额外</b>的帮助。]你喜欢这个提议。这能有什么坏处呢？");
         outputText("[pg]你听到舒尔德拉的声音在你的脑海中响起，她开始念诵咒语。你感到有些恶心，把你的[cock]掏出来，带着担忧的期待看着它。她念完了，最后一个奇怪的词在你的脑海中回荡。什么也没发生。");
         outputText("[pg][say: 嘿，你还在听吗？]你手中的妖精不耐烦地问，但你继续无视她。");
         outputText("[pg]没起作用吗？你正要质问舒尔德拉，突然，一种奇怪的压迫感从你阴茎的中间涌起。你的肉棒上开始形成一个小肿块。起初，你感觉就像是在延时摄影中长了一颗痘痘，但随后它被推了出来，变长，并在你的阴茎正上方形成了一个迷你版的[cock]。");
         outputText("[pg][say: 呃，]小妖精抱怨道，[say: 你知道，那太恶心了。你是什么怪胎吗？而且那东西还是太大了！]");
         outputText("[pg][say: 哦，她想要个小一点的？没问题，让我们满足她~]");
         outputText("[pg]你开始怀疑这是否是个好主意。");
         outputText("[pg]伴随着另一阵刺痛的压迫感，第二个更小的阴茎在第一个阴茎的后面形成了，长到大约是它兄弟一半的长度。你现在看起来就像一个畸形的性玩具。妖精在你手中安静了下来，同样带着难以置信、厌恶和变态的好奇心盯着看。");
         outputText("[pg][say: 舞台交给你了，勇者。]");
         outputText("[pg]你咧嘴笑了。");
         outputText("[pg]你把这个小妖精荡妇放低到你阴茎的突起上，把她的小穴压在较大的迷你阴茎上，把她从沉思中拉了出来。");
         outputText("[pg][say: 等、等、等等，停一下，暂停，暂停！我告诉过你那东西太大了！它永远也进不——]一声尖叫打断了她的抗议，因为你把你[cock]上的阴茎尖端推入了她的小穴。该死，她真紧。但真他妈湿，这个小个子婊子。尽管如此，她紧闭的肉壁还是有短暂的窒息感。你像老虎钳一样紧紧抓住她脆弱的身体，坚持不懈地继续按压，慢慢地把她进一步放低到你那有趣的阴茎上，直到她的小屁眼蹭到迷你二号。");
         outputText("[pg][say: 哈啊，哈啊，等等，让我……哦，玛莱……] 妖精的脸扭曲成一种你只能解释为“惊喜”的表情，尽管其中还夹杂着相当程度的痛苦。");
         outputText("[pg]你的轮廓在妖精紧绷的皮肤下清晰可见。你撑开她肚子的样子看起来极其诱人；你的肉棒舰队在期待中抽动着。你等不及她适应了，迅速将她按下，刺穿了她娇小的穴口。");
         outputText("[pg][say: 唔嗯嗯，] 痉挛的妖精发出声音，但仅此而已。一点妖精露水从她紧紧包裹着你双重肉棒的缝隙中渗出。你咕哝了一声，开始像使用活体飞机杯一样操弄她，将她的骨盆撞向你狂怒的勃起。你没想到今天会操妖精的屁股，但你确实这么做了。天哪，双插那个娇小的荡妇感觉就像" + (get_allowChild() ? "同时操两个孩子" : "同时给两个处女破处") + "。");
         outputText("[pg]一双小脚踩在你[cock]上的感觉将你的注意力拉了回来。起初你以为这是某种半吊子的挣扎尝试，但妖精脸上神志不清的表情告诉你并非如此。你试探性地放开了她。果然，你的手一松开妖精，她就开始疯狂地在你的肉棒上弹跳，就像女牛仔一样。你向后靠在一棵树上，让这个小荡妇自己动。你的长度慵懒地上下浮动，上下浮动，就像一个变态的跷跷板，只是帮助那个咯咯笑的女孩在你的双重肉棒上越插越深。");
         outputText("[pg][say: 嘿嘿嘿，呼咿咿~] 她孩子气地叫着。[say: 啊哈哈哈~ 哇哦！老兄，你肚子上，诶嘿嘿，好像有一张脸！呜嘻嘻嘻咿~] 什么？你困惑地低下头。");
         outputText("[pg][say: 别管我，勇者。] 也许你<i>应该</i>在意舒尔德拉从你下腹部对你咧嘴笑的脸，但你快要射了，顾不上那么多了。[say: 嘿，看着就好。]");
         outputText("[pg]你确实看着。你看着她的鼻子改变形状并变长，一寸一寸地向外推，直到它形成了一个细长、拉伸的，对你原本肉棒的拙劣模仿。");
         outputText("[pg][say: 哇啊啊——唔嗯嗯唔！] 细长的长度刺入上下浮动的妖精嘴里，迅速用热烈的吸吮声取代了她迷幻的惊呼。呼，你也能感觉到这个。那个长翅膀的娘们确实知道怎么吸鸡巴。");
         outputText("[pg]你的[cock]很快就浸透了妖精甜如蜜的汁液，帮助这个小女孩在你的双塔上更加肆无忌惮地弹跳，同时还给你口交。你受不了了。这种放荡的烤肉串式交媾，淫荡荡妇紧致的穴口夹紧你的长度，以及她含着你迷你肉棒发出的闷哼声，将你推向了边缘。伴随着一声呻吟，你射了，把一切都释放了出来。");
         outputText("[pg]但什么也没发生。");
         outputText("[pg]你慌了。");
         outputText("[pg][say: 啊哈，抱歉。重新路由中……]");
         outputText("[pg]闸门终于打开了，你绷紧你的小家伙们，把一切都泵入娇小的妖精体内。她飞溅、吐唾沫、挣扎，但你把她按在你的[cock]上，用你的精液填满她小小的子宫、她的屁股、她的肚子、她的一切，直到她危险地肿胀起来。就在你以为她快要爆炸的时候，浓稠的精液流从她紧致的孔口喷涌而出，让她松了一口气。你在高潮中用小妖精自慰，直到最后的精液从你的三根树干中喷射而出。你喘着粗气，瘫倒在树旁。");
         outputText("[pg][say: 诶嘿嘿嘿咿，太棒了！] 迷你荡妇一边大喊，一边解开自己，把她的小拳头举向空中。[say: 老兄，我们必须，比如，再来一次，咿嘻嘻~ 再来一次！] 走着瞧吧。[say: 不过，不是现在。我，呵呵~ 我他妈的饱了！] 她拉长声音说，拍了拍肚子以示强调。又一股精液喷涌而出。");
         outputText("[pg][say: 啊……你能……你能……你能——啊！你能，比如，把我放在什么地方吗？我这样飞不起来。嘻嘻嘻咿~]");
         outputText("[pg]你" + (get_player().cor < 75 ? "站起身，穿好衣服，把被迷晕的妖精抱到一个小树桩上。你离开时，身后传来一声清脆的[say: 拜拜！]，紧接着是一声响亮的呼噜声。" : "耸耸肩，把她扔进灌木丛里，她伴随着一声湿润的<i>啪嗒</i>声落地，紧接着是一声响亮的呼噜声。重新穿好衣服后，你离开了这个地方。"));
         get_player().orgasm("Dick");
         get_game().shouldraFollower.shouldraSleeping(10 + Utils.rand(15),true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieShooAway() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("你挥了挥手，赶走了这只小妖精。她显然受到了这片土地魔法的影响，你不想和她有任何瓜葛。她撅着嘴，转身嗡嗡地飞走了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieRAEP() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         if(!get_player().hasStatusEffect(StatusEffects.FaerieFemFuck))
         {
            get_player().createStatusEffect(StatusEffects.FaerieFemFuck,1,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.FaerieFemFuck,1,1);
         }
         clearOutput();
         outputText("你让小妖精飞近一点调查，然后以迅雷不及掩耳之势，将她从半空中一把抓住。她在你的手掌中扭动，在你的掌控中徒劳地挣扎。你用手指戳弄她的双腿之间，注意到妖精皮肤上泛起的红晕。");
         if(get_player().statusEffectv1(StatusEffects.FaerieFemFuck) == 1)
         {
            outputText("她流出淫液，尖叫着，[say: 放开我啊啊啊啊啊啊，]试图让自己听起来很愤怒而不是发情，但这个小女孩的身体却出卖了她。");
         }
         else if(get_player().statusEffectv1(StatusEffects.FaerieFemFuck) <= 5)
         {
            outputText("她流出淫液，呻吟着，[say: 别逗我了啊啊啊啊啊啊，]尽力向后扭动身体贴着你，仿佛她能以某种方式把自己刺穿在你的手指上。");
         }
         else
         {
            outputText("她尖叫着，向后摇晃着臀部贴着你，呻吟着，[say: 哦哦哦哦，我喜欢你那样做，]将她那小得令人难以置信的爱之豆在你的手指上摩擦。");
         }
         if(get_player().isTaur())
         {
            outputText("[pg]你在小妖精的头上敲了一下，让她短暂地眩晕，然后把她放在一根树枝上。你背对着这个小生物，抬起尾巴，让她能看到你的" + get_player().vaginaDescript(0) + "。气味向她扑面而来，你听到一声高亢的咯咯笑声；显然，这足以让她产生相当强烈的接触性快感。当她把腿滑进你的体内，并用双臂抱住你的[clit]时，你在你的阴唇中感觉到一种奇怪的感觉。[pg]");
            if(get_player().getClitLength() >= 3)
            {
               outputText("小妖精开始像撸鸡巴一样撸你的阴蒂，双臂紧紧抱住你，在你的" + get_player().vaginaDescript(0) + "里滑进滑出。她的动作狂热而不可预测，但却令人难以置信地愉悦。当你的淫液流下时，她开始舔你的[clit]，这只会让她更加兴奋。她兴奋得双腿开始疯狂地踢打，同时一遍又一遍地尖叫着[say: 游啊！游啊！游啊！游啊！]。");
               if(get_player().vaginas[0].vaginalWetness <= 2)
               {
                  outputText("随着液体在她周围渗出，你的" + get_player().vaginaDescript(0) + "泛起涟漪，妖精咯咯地笑得越来越厉害。她更紧地抱住你的[clit]，开始轻轻地啃咬它，这是一种如此奇特的感觉，以至于你突然湿漉漉地高潮了。她的咯咯笑声很快变成了放声大笑，她松开了紧握你阴蒂的手，四仰八叉地掉到地上的一小滩淫液中。[pg]");
               }
               else if(get_player().vaginas[0].vaginalWetness <= 4)
               {
                  outputText("随着液体在她周围喷射，你的" + get_player().vaginaDescript(0) + "泛起涟漪，妖精咯咯地笑得越来越厉害。她更紧地抱住你的[clit]，开始轻轻地啃咬它，这是一种如此奇特的感觉，以至于你突然湿漉漉地高潮了。她的咯咯笑声很快变成了放声大笑，她松开了紧握你阴蒂的手，四仰八叉地掉到地上的一滩淫液中。[pg]");
               }
               else
               {
                  outputText("随着液体在她周围喷洒，你的" + get_player().vaginaDescript(0) + "泛起涟漪，妖精咯咯地笑得越来越厉害。她更紧地抱住你的[clit]，开始轻轻地啃咬它，这是一种如此奇特的感觉，以至于你突然湿漉漉地高潮了。她的咯咯笑声很快变成了放声大笑，她松开了紧握你阴蒂的手，四仰八叉地掉到地上的一大滩淫液中，她那咯咯笑的身体漂浮在水面上，双腿不规则地踢打着。[pg]");
               }
            }
            else
            {
               outputText("小妖精用手在你的[clit]周围摩擦，仿佛被它迷住了。你的身体通过泵出更多的淫液来回应，她高兴地舔着。她开始疯狂地大笑，像敲鼓一样敲打你的阴蒂，不知为何还时不时地大喊[say: 康加舞！]。不过，这种奇怪的服侍感觉不可思议，你感觉到你的爱之通道紧紧地挤压着妖精微小的身体。");
               if(get_player().vaginas[0].vaginalWetness <= 2)
               {
                  outputText("你突然湿漉漉地高潮了。随着液体在她周围渗出，你的" + get_player().vaginaDescript(0) + "泛起涟漪，妖精咯咯地笑得越来越厉害。她的咯咯笑声很快变成了放声大笑，她松开了紧握你内脏的手，四仰八叉地掉到地上的一小滩淫液中。[pg]");
               }
               else if(get_player().vaginas[0].vaginalWetness <= 4)
               {
                  outputText("你突然湿漉漉地高潮了。随着液体在她周围喷射，你的" + get_player().vaginaDescript(0) + "泛起涟漪，妖精咯咯地笑得越来越厉害。她的咯咯笑声很快变成了放声大笑，她松开了紧握你内脏的手，四仰八叉地掉到地上的一滩淫液中。[pg]");
               }
               else
               {
                  outputText("你突然湿漉漉地高潮了。妖精拼命地想抓住你的[clit]，但大量的液体淹没了她，她被冲得在地上打转，掉进了一大滩你的体液中，她那咯咯笑的身体漂浮在水面上，双腿不规则地踢打着。[pg]");
               }
            }
         }
         else
         {
            outputText("[pg]你解开[armor]的下半部分，向妖精露出你发情的阴唇。");
            if(get_player().statusEffectv1(StatusEffects.FaerieFemFuck) < 4)
            {
               outputText("她的情绪立刻从恐慌变成了渴望，她饥渴地舔了舔嘴唇，眼睛死死地盯着你那女性的褶皱。");
            }
            else
            {
               outputText("她睁大了眼睛，就像一个瘾君子看到了毒品。她饥渴地舔了舔嘴唇，在你的手心里摩擦着，准备行动。");
            }
            outputText("你松开了妖精，让这只被小穴迷住的妖精飞向你敏感的下半身。她轻轻地降落，她那微小的手脚在你的外阴上跳跃。你高兴地喘着粗气，");
            if(get_player().vaginas[0].vaginalWetness >= 5)
            {
               outputText("释放出一小股喷流");
            }
            else if(get_player().vaginas[0].vaginalWetness >= 4)
            {
               outputText("滴下淫液");
            }
            else if(get_player().vaginas[0].vaginalWetness >= 2)
            {
               outputText("变得如此湿滑，妖精几乎站不稳");
            }
            else
            {
               outputText("感到自己因渴望而变得湿润");
            }
            outputText("从这微小的触碰中。[pg]");
            if(get_player().getClitLength() <= 0.5)
            {
               outputText("她拨开你的阴唇，露出你那小巧的阴蒂，并调整姿势，将双脚踩进你的体内。她大腿上完美无瑕的肌肤让你再次发出愉悦的喘息。它们紧紧夹住你的" + get_player().clitDescript() + "，用她的阴户在你敏感的表面上摩擦。你扭动着身体，完全沉浸在阴蒂被粗暴摩擦的快感中，无暇顾及那只妖精。她紧紧抱住你，拼命抓牢，因为你的胯部几乎要把她甩出去。在旋转的过程中，她猛地撞回了[clit]，伴随着一声湿润的“噗嗤”声，瞬间被那肉突刺穿。[pg]");
               outputText("妖精紧紧抓着你，一边尖叫一边弹跳，在你的阴蒂上大声高潮，将她自己的体液喷射进你那酸痛的" + get_player().vaginaDescript(0) + "中。那液体让你感到一阵刺痛，你把手指伸进去，将那黏糊糊、甜腻腻的妖精精液涂抹在你的通道里。还没等你深入，你自己的高潮就爆发了，紧紧夹住你的手指，在它们周围泛起涟漪，试图把你的手当成阴茎一样榨取。你的双腿变得软弱无力，迫使你跌坐在[ass]上，快感的浪潮席卷全身，将妖精浸泡在你的淫液中。[pg]");
            }
            else if(get_player().getClitLength() <= 1.25)
            {
               outputText("她着迷地看着你的[clit]变硬，从你的阴唇间探出，像一根小巧的阴茎一样充血发红。妖精转过身，将她娇小的臀部稳稳地坐在你的私处，稍微陷入褶皱中，同时用双腿缠住那根跳动的“肉棒”。她抱住它，将它压在她那微小的乳房之间，上下舔舐，让你因为这最敏感区域意想不到的刺激而呻吟扭动。[pg]");
               outputText("你张开[legs]，小心翼翼地不让妖精掉下来，她松开[clit]站了起来，将她滴水的阴户贴在顶端。快速一插，她就到底了，将臀部压在你的" + get_player().vaginaDescript(0) + "的开口处，她的脚在外部褶皱上滑动，试图保持平衡。你开始开心地前后摇晃，让妖精上下弹跳。她呻吟着，声音可爱且几乎听不见，但却有一种性感，让你那湿透的肉洞变得更湿了。[pg]");
               outputText("她在你身上高潮了，喷出大量的液体，用清澈的妖精体液浸透了你的[clit]和" + get_player().vaginaDescript(0) + "。这感觉令人刺痛，液体渗入你的阴蒂，浸透了你的阴户，增强了每一种感觉。你能感觉到凉爽的森林空气流过你的外阴，似乎在抚摸你，你无法控制自己，将手指插入你的" + get_player().vaginaDescript(0) + "，立刻因为插入而高潮，甚至没有注意到精疲力竭的妖精从巨大的阴蒂上滑落，部分滑入你的小穴。[pg]");
            }
            else if(get_player().getClitLength() <= 4.5)
            {
               outputText("妖精被你不断变大的[clit]迷住了，她抚摸着自己的身体，看着你的爱欲之豆膨胀起来，直到它对她娇小的身躯来说显得过于巨大才停下。她绕着它爬了一圈，对你那如阴茎般雄伟的阴蒂感到敬畏。她抬头看着你，既兴奋又担忧地说，[say:你太……大了。哦，女神啊，我想感受它在我的体内！][pg]");
               outputText("她双手抓住它湿滑的表面，然后跳了起来，抬起下半身，在重力的作用下重重地落在了你" + get_player().clitDescript() + "的顶端。尽管妖精身上湿漉漉的，但顶端还是勉强滑了进去。她尖叫起来，你无法确定那是出于快乐还是痛苦。你推断那一定是快乐，因为妖精正扭动着臀部，抓住你[clit]的其余部分，努力将自己进一步拉下这根女根。她的肚子开始变形，在腹部显现出圆柱形的凸起，随着你心脏的每一次跳动，阴蒂的脉动让它微微膨胀和收缩。[pg]");
               outputText("过了一会儿，她终于成功地将自己完全刺穿，在你狂跳的心脏通过[clit]传来的震动中高潮颤抖。她的舌头伸了出来，翻着白眼，被这种极度的穿透、痛苦和快感弄得失去了意识。你感觉到她的淫液浸透了你，滑入你的缝隙，让你敏感的阴唇感到一阵刺痛。看着她高潮就足以让你和她一起达到高潮，你" + get_player().vaginaDescript(0) + "的内壁饥渴地夹紧，收缩着，将体液喷洒在躺在那里的妖精身上，她就像一个变态的装饰品一样被刺穿在你的胯部。[pg]");
            }
            else
            {
               outputText("妖精被你肿胀的[clit]迷住了，看着它慢慢勃起，像一根光滑过度敏感的阴茎一样充血。她试探性地摸了摸它，当它抽动着回应时，她倒吸了一口凉气，缩了回去。她带着敬畏的神情转向你，说道，[say:我不可能吃得下这个美丽的怪物，但我知道我能让它感觉很棒！][pg]");
               outputText("她跳到它上面，用她相对轻盈的体重让它在空中弹跳。她全身抱住它，开始在上面摩擦，将她浓稠的妖精汁液涂抹在阴蒂上，每次你因为这种感觉而抽动时，她都会咯咯地笑。你扭动着，在原始的快感中沉沦，你的[legs]在身下发软。你抓住一个树桩，试图稳住自己，但妖精骑乘你[clit]的动作干扰了你的运动能力，你瘫倒在森林的壤土中，在高潮席卷而来时幸福地抽搐着。[pg]");
               outputText("你的[clit]跳动了一下，把这个小女人甩了出去。她滑倒了，在你" + get_player().vaginaDescript(0) + "的表面上乱抓，滑进了你湿透的裂口。她被紧紧地挤压着，在你高潮的湿润中被晃来晃去。妖精的眼睛变成了斗鸡眼，在你腹股沟那滚烫的漩涡中，她变得头晕目眩，晕头转向。[pg]");
            }
         }
         if(get_player().statusEffectv1(StatusEffects.FaerieFemFuck) == 1)
         {
            outputText("当你躺在森林的壤土中恢复时，你看着妖精从你的腹股沟里跌跌撞撞地走出来，抱着头，不停地咯咯笑。她试图装出一副严肃的面孔，但立刻又被一阵大笑所掩盖，[say:嘿嘿，你知道我会被你的女汁弄得飘飘欲仙吗？我的天哪，我以前从来没有这么——嘿嘿嘿嘿——嗨过！就好像我能看到一切。拜托，别让我再这样做了……][pg]");
            outputText("她飞走了，饿着肚子，寻找着可以咀嚼的花朵。");
         }
         else if(get_player().statusEffectv1(StatusEffects.FaerieFemFuck) <= 5)
         {
            outputText("妖精慢慢地把自己从你的" + get_player().vaginaDescript(0) + "里拖出来，咧开嘴笑着，瞳孔放大。她从你身上滑下来，掉在地上，咯咯地笑着，[say:一切感觉都好柔软。嗯，那太好玩了！][pg]");
            outputText("小女人开心地转着圈，宣布道，[say:颜色好像，好亮！哦，天哪，我饿了！回头见，你和你的阴蒂，只是别让我掉进你的小穴里，那会把我弄得一团糟。我觉得我承受不了更多了，否则我一有机会就会爬到你的两腿之间！][pg]");
            outputText("她飞走了，大声喊道，[say:再见，亲爱的！]");
         }
         else
         {
            outputText("妖精从你的小穴里跌跌撞撞地走出来，咯咯地笑着，把身上滑溜溜的女汁舀起来舔掉。她顺着你的身体爬到你的嘴唇上，给了你一个带有小穴味道的吻，开心地喋喋不休，[say:嗯，你的小穴让我感觉好温暖，好想笑！我他妈的太嗨了！女神啊，我也饿了——我要去弄点吃的，然后再回来在你的蜜罐里泡一泡，好吗？][pg]");
            outputText("她飞走了，有些摇晃，散发着女性的性爱和欲望的气息。");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(-2),DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieOral() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_faerie());
         outputText("你用手指拨弄着小妖精，把她的双腿向上抛起，将她的小穴展现在你面前，她惊叫着挣扎起来。当她感觉到你的[tongue]在她大腿间大面积地舔舐时，她的挣扎突然停止了，愉悦的战栗传遍了她的全身。");
         outputText("[pg][say: 嗯……感觉还不赖，]她说着，在你的手中放松下来。你用舌尖戳弄她的腹股沟，顺势拨开了她的阴唇。她的淫液有一种令人愉悦的、让人精神焕发的味道，迫使你继续下去。淡淡的花香混合着情色的味道，令人兴奋。");
         outputText("[pg]妖精呜咽着，脚趾蜷缩，发出微弱的呻吟。你不假思索地用嘴唇夹住她的臀部和大腿，做出亲吻和吮吸的动作。虽然你的舌头和嘴唇的压力让她兴奋不已，但妖精开始对产生的吸力感到恐慌。");
         outputText("[pg][say: 小、小心点！我可没有你以前的伴侣那么大，你可能会把我吞下去的！我可受不了胃酸！]");
         outputText("[pg]意识到自己的行为后，你弯曲嘴唇，将舌头伸出更多，确保小妖精不会不小心滑进去。她那令人上瘾的味道，让你真的应该小心，不要忘记自己在做什么。你用双手轻轻地握住妖精，用拇指按摩她的身体，让她进一步放松。她幸福的叹息和向后仰起的头表明她对这种情况非常满意。");
         outputText("[pg]妖精的脚踩在你嘴唇上方的肉上。[say: 再来。再用力点。我快到了！]她乞求道。你收回[tongue]，在嘴里擦去她的淫液，然后再次滑出，紧紧地夹在迷你女孩的大腿之间。片刻的停顿让她有机会平静下来，这使得接下来的动作对她来说更加强烈。");
         outputText("[pg]她小小的肺部一次又一次地发出喘息和呻吟。尽管你很享受这个过程，但你还是准备让她高潮。你的嘴唇压下，撅起嘴唇覆盖在她的臀部和胯部。你的舌头滑过，上下移动，并向各个方向戳弄，直到最后她在狂喜中尖叫，将细小的妖精淫液喷射在你的舌头上。这是一种令人精力充沛的奖励，让你的心跳加速。太刺激了！");
         outputText("[pg]你亲吻她小小的妖精小穴，再次吸吮了一点那种美味的花香，看着她在你舒适的手中大口喘气。");
         outputText("[pg][say: 我……我想我们以后应该再来一次。现在，你能把我放在一片又大又好的叶子上吗？]");
         outputText("[pg]你欣然同意，把妖精带到一个舒适的休息点，并向她道别。");
         dynStats(DynStat.Lib(-1),DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieLeaveHer() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("[pg]可以安全地假设，这种腐败和色情的植物并不是为了杀死东西，所以它在意识到她不是肉棒后可能会释放她。你宁愿在变得太热和烦躁之前离开这个地方，更喜欢用其他方法来释放，而不是这个淫荡的林地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieHoneyFeed() : void
      {
         clearOutput();
         outputText("既然你已经把这个小妖精抓在手里了，你对如何处理她有了一个[i: 非常]特别的想法。蜂蜜通常是一种温和的催情剂，但考虑到妖精对液体的亲和力，你真的很想看看她们对它的反应。这个小女人在你的[hand]里挣扎，显然被你盯着她的强烈目光吓坏了。但你不打算伤害她，不，你要给她一个甜蜜的款待。");
         outputText("[pg][say: 呃，嘿，你现在的表情很吓人。我，呃，我希望不会有什么麻烦之类的……]");
         outputText("[pg]你没有回答她的问题，只是简单地将手伸进你空闲的袋子里，让妖精在等待你为她计划的任何事情时，因恐惧而扭动。你慢慢地从包里拿出那瓶蜂蜜，给她上演了一出好戏，让她的脑海中充满了各种可能性，直到标签终于露出来——");
         outputText("[pg][say: 等等，就这？你刚才真把我吓了一跳，但如果只是——]");
         outputText("[pg]你把[if (hasclaws) {爪子|手指}]尖塞进小妖精的嘴里，轻松地填满了它，打断了她的话。她竟然对着你呻吟起来，显然并不介意一点粗暴的对待。但她绝对低估了自己所处的境地。");
         outputText("[pg]当你慢慢地把手指从她张开的嘴里抽出来时，妖精让嘴巴半张着，平静地等待着你的下一步动作。好吧，既然她乐意让你找点乐子，你自然不会客气。你拔掉瓶塞，用[if (hasclaws) {爪子|手指}]挖出一大团蜂蜜，享受了片刻那甜腻的气味，然后把它举到女孩的嘴边。当你再次滑过她的舌头时，她忍不住咯咯笑了起来，当你抽回手指时，你顺势向下拉，摩擦着她粗糙的舌面。");
         outputText("[pg][say: 嗯……味道其实挺不错的，我还能再来一——]");
         outputText("[pg]她的嘴巴应该有更好的用途，所以你迅速再次填满它，开始一勺接一勺地把蜂蜜舀进她等待的嘴里。妖精把这些东西都吃光了，在不知不觉中变得越来越陶醉。");
         outputText("[pg][say: 嗯……我觉得……有点奇怪。那是什么？]");
         outputText("[pg]她现在说话含糊不清，但你连半瓶都没喂完。当你的手指没有任何停止甚至放慢速度的迹象时，女孩脸上开始露出担忧的神色，但此时她想挣脱已经太晚了。");
         outputText("[pg][say: 嘿，你在……*嗝*……你在对我做什么？]");
         outputText("[pg]她的眼睛现在开始有点迷离了，但她对你来说是个如此乖巧的女孩，你觉得你可以对她展现一点仁慈。也就是说，你会让剩下的过程快点结束。当妖精看到你开始把瓶子举向她时，她不知怎么地在四肢中找到了一点力量，再次扭动起来，但远远不足以真正挣脱。");
         outputText("[pg][say: 不……停下，我*嗝*不——行了。求求你。]");
         outputText("[pg]但她的抗议只会让你更容易把瓶子塞进她张开的嘴里，让她安静下来。你慢慢倾斜瓶子，让粘稠的液体流向无助的妖精，她的胸膛在你的紧握下怦怦直跳。然而，当甜美的花蜜终于到达她嘴里时，她幸福地翻了翻白眼，高兴地大口吞咽着蜂蜜。当小妖精完全迷失在快感中时，火热的呻吟声从瓶子周围溢出。");
         outputText("[pg]当她释放时，她的双腿在你的[if (hasclaws) {爪子|手指}]上颤抖，她的湿润很快让她变得如此光滑，以至于你差点让她从你手中滑落。你不确定她是否还有意识，因为她已经完全瘫软了，但她并没有拒绝瓶子，所以你没有停下来。蜂蜜还在流淌，从玻璃瓶里滑出，进入她的喉咙，直到最后一滴。");
         outputText("[pg]终于喂完了，你把瓶子扔掉，它在地上发出咔嗒声。妖精咳嗽着，喷出了一点蜂蜜，但她脸上狂热的笑容证明了她有多享受。对于一个刚刚吞下与自己体重相当的蜂蜜的生物来说，她看起来出奇地健康，但你猜想妖精一定很擅长处理液体。");
         outputText("[pg][say: 呃……]这是她在这个状态下唯一能说出的话，但过了一会儿，她的眼睛重新聚焦，似乎恢复了一些意识。");
         outputText("[pg]你把她放在附近的一根树枝上，但她立刻开始跌跌撞撞，显然无法保持平衡。");
         outputText("[pg][say: 谢谢，朋友，我……*嗝*……你真是个好朋友。我完——全不知道蜂蜜这么好吃……我不会忘记你的。]");
         outputText("[pg]她假装向你敬了个礼，然后试图起飞，结果迅速撞上了一根树干。然而，她恢复得很好，拍了拍身上的灰尘，再次试图飞走，这次成功了，但在她身后留下了一条不规则的、之字形的破坏轨迹。这一幕相当有趣，但你觉得她应该会没事的，毕竟她有着不可思议的耐力。");
         if(get_player().hasItem(get_consumables().BEEHONY))
         {
            get_player().consumeItem(get_consumables().BEEHONY);
         }
         else if(get_player().hasItem(get_consumables().PURHONY))
         {
            get_player().consumeItem(get_consumables().PURHONY);
         }
         else
         {
            get_player().consumeItem(get_consumables().SPHONEY);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieHelpHer() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("你摆脱了内心的燥热，冲过去拯救这个不幸的小生物。你轻轻捏住她的腿，将妖精从淫荡的深处拉了出来，发现她咳嗽不止，迷失了方向。经过短暂的恢复后，她弓起身体面对你。她那无声、尴尬的凝视并没有持续多久，她那像虫子一样扑腾的翅膀无言地传达了她再次飞行的能力。你放开她，她反过来带着尴尬的表情走到你面前。[say: 谢、谢谢！如果不是你，我想我会被憋死的。]");
         outputText("[pg]她焦躁不安地挪动着双腿，然后突然冲到你面前，给了你一个吻，接着迅速飞走。做了一件好事后，你穿过树林往回走。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieFuckHer() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("被激起了如此程度的性欲，现在盯着被困在阴户花里的妖精的[if (faeisleaf or faeispetal) {裙底，}]光溜溜的屁股，你抛开了任何犹豫，加入了这场狂欢。你僵硬的[cocks]跳动着[if (!multicock) {挣脱了}][if (!isnaked) { 你的[armor]}]，你漫步走过去，当[cockey]靠近[if (!multicock) {}]这个不知情的小生物时，你兴奋地抽搐着。[if (multicock) {拿着[if (cocks>2) {最小的一根|较小的一根}]，你|你}]把龟头压在她小巧的屁股上，引起了她的退缩。小妖精惊慌失措，徒劳地踢打着想要把你赶走。与她的意图相反，她所做的一切只是疯狂地用大腿摩擦你的龟头" + (get_player().smallestCockLength() < 3 ? "，她的脚只是轻轻地敲打着你的耻骨" : "") + "。");
         outputText("[pg]虽然她可能处于某种程度的恐惧中，但她早些时候的兴奋提供了充足的润滑，当你在她的双腿之间扭动时，这刺激了你。你把手放在她扭动的四肢上，把它们挤压到你肉棒的两侧，然后向前抽插，让你的[cock smallest]滑过她的腹股沟和屁股。如果你把你的工具完全埋在某个东西里，可能会让你更快地射精，但你的系带推挤着一个小而湿润的小穴和柔软的臀部的感觉绝不令人不满意。话虽如此，这里甜美的气味和色情的氛围驱使你寻求更强烈的刺激。");
         outputText("[pg]你更体贴的一面停下来考虑妖精的安危，但不知不觉中，你已经开始抽插，[if (cockthickness >= 2) {把妖精深深地塞进去——让花朵完全吞没她|把妖精挤在花朵的内壁上腾出空间}]。当你感觉到她还在挣扎时，你必须推断出她不知怎么的并没有窒息，所以没有必要去想她的命运。相反，你的注意力集中在植物肉体紧紧抓住你的独特感觉上，被黏液弄得又热又湿。虽然你无法想象有多少小穴的质地和张力能与此完全相同，但它同样令人惊叹，而且奇怪的是，它让你在肠胃里产生了一种令人眼花缭乱的渴望。你[if (cockthickness < 2) {松开妖精的腿，}]抓住茎干使其保持稳定，无法抗拒用尽全力操这株植物的冲动。几乎听不到这个长着翅膀的小女孩[if (cockthickness >= 2) {在茎干下方的隆起处尖叫，原因很快就清楚了|当她把身体紧紧包裹在你的[cock smallest]上，几乎被推开并沉入深处时，但这种风险很快就被消除了}]。许多细长的卷须覆盖着你的阴茎，以惊人的力量收缩！本能地，你向后踉跄着想要拔出，但那朵花像老虎钳一样夹住了你。[if (cocklength <= 5) {不管你的阴茎有多小，这个洞已经变得太紧了，拔不出来了。}]");
         outputText("[pg]一开始拉扯妖精的吸力现在有节奏地挤奶，你唯一能做的就是安顿下来享受它；然而，卷须抓得太紧了，你担心它可能会切断[if (isgoo) {你的肉棒和黏液团的连接|血液循环}]。当然，它只是想吞噬精液，就像这个世界上的其他东西一样，但痛苦的紧张感仍然让你感到不安。更多的植物纤维穿过你的肉棒，但这些纤维继续延伸，滑出并缠绕在你的根部[if (hasBalls) { 和[balls]}]。它们拉扯并放松，引出一声满意的叹息。无论是黏液中药物的作用还是空气中的某种物质，你都感觉到大量的先列腺液流出。尽管这肯定会让妖精满脸都是，但她的挣扎已经慢了下来。也许她喜欢这样。");
         outputText("[pg]这种拉扯让你不寒而栗；这些卷须正在熟练地完成它们的工作。突然，你的颤抖演变成了狂喜的呻吟。你高潮了，身体紧绷，吸力贪婪地吞噬着喷涌而出的所有精液，你在高潮的顶峰无意识地摇晃着臀部。当这一刻过去时，你感觉你的头脑清醒了一点，受性感蒸汽的影响稍微小了一点，但花朵并没有松开。你试图把那东西拔下来，但它只是继续工作，不舒服地挤奶，让你进一步射精。事实上，你越挣扎，它吸和拉扯得就越厉害。违背你的意愿，你一次又一次地射精——几次背靠背的高潮，让你因为过度劳累而呜咽。[if (cumquantity > 50) {这株植物怎么没有因为它消耗的体积而爆裂，这是一个谜。}]");
         outputText("[pg]最后，收缩缓解了，你轻轻地把花从你非常柔软的[cocktype smallest]上拔下来。[if (cockthickness >= 2) {你不知道妖精的命运，但你不打算在里面摸索来找回她。你所能做的就是希望她喜欢她可能永远无法逃脱的精液缸。|妖精和它一起滑了出来，几乎粘在你的肉棒上，并且覆盖着非常明显的线条，植物的纤维把她绑在那里。当你把她剥下来时，你退缩了，发现她黏糊糊的皮肤在你肉棒目前的状态下令人不快。如此严重地标记她的卷须可能会很痛苦，但[if (guro) {她空洞、死寂的凝视表明她可能淹死在她被淋湿的精液中|她带着一种类似醉酒的呆滞和满足的表情看着你。[say: 我可能什么时候还能再来一回合，性感尤物，]她含糊不清地说}]。叹了口气，你把这堆软绵绵的烂摊子扔到一边。}] 事实证明，这比你预期的要累得多。你站起来，虚弱地跌跌撞撞地走出林地，期待着到达营地休息。");
         get_player().orgasm("Dick");
         get_player().changeFatigue(10);
         dynStats(DynStat.Cor(4));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieFlowerDoNothing() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         outputText("[say:你好，花[if (isfeminine) {女士|先生}]，]她高兴地说着，坐在了你身上。虽然从这个角度你看不见她，但你能感觉到她一边哼着歌，一边抚摸和拨动你头皮上柔软的藤蔓。不知为何，这让人感到相当舒缓。不管她对你的小草甸做了什么，都非常舒服。[say:不要勒紧这些根！要长成漂亮快乐的藤蔓，]她得意地说。虽然不清楚她到底做了什么，但你的\"头发\"感觉更轻盈、更有活力了。");
         outputText("[pg]妖精飞快地跑到你面前，面对面地看着你，咧嘴笑着挥手。[say: 祝你[day]愉快，[if (!isfeminine) {[if (isUnderage) {树苗儿子|植物爸爸}]|草地少女}]！]她转过身，一言不发地飞走了，你也感到神清气爽，准备继续你的旅行。");
         get_player().changeFatigue(-5);
         get_player().growHair(0.2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieEatingNotVore() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_faerie());
         outputText("当你考虑亲密品尝这只小妖精时，你流下了口水。[if (faeisstraps) {你捏住她腿上薄薄的长袜，慢慢地把它们滑下来，让她赤身裸体。你把妖精举到你的脸前，让她悬挂在比你的嘴唇稍高一点的地方|当你把她拉到你的脸前时，妖精在短暂的恐慌中踢打着[if (!faeisnude) {，这让她的临时裙子弹跳起来，让你看到了她那微小的裂口}]}]。她闻起来有花香。当你的[tongue]沿着她的腿滑动，滑到她的大腿内侧时，她的身体颤抖起来。");
         outputText("[pg][say: 啊——啊，我们这是在干嘛？我、我没什么好抱怨的。请温柔点！]她开心地喊道。当你把她的一条腿塞进嘴里时，她本能地试图把它拔出来。她以为这只是个意外，但随着你的牙齿开始用力，这个想法立刻破灭了。");
         outputText("[pg][say: 求求你放开我求求你放开我求求你放开我——]她恐惧地结巴着，当你的牙齿咬碎她的骨头时，她的声音变成了尖锐的惨叫。晶莹剔透的妖精露水顺着她破碎的腿流下，剧痛让她的肌肉失去了力量。甘甜的液体在你的唇间汇聚，与血液混合在一起。当你把她的身体拉开，撕裂仍然连着她腿的血肉时，她再次尖叫起来。");
         outputText("[pg][say: 停下！停下，求求你！我不想死……]恐惧的妖精语无伦次地喊道。她颤抖着，看着你舔干净嘴唇。她的血带着一丝玫瑰色，这很贴切，除此之外，这是一种非常瘦的肉——就像兔子肉一样。你慢慢咀嚼，让味道在舌头上蔓延，仔细品味。顺着手腕流下的血液提醒你，如果耽搁太久，你的大餐就会变凉。你轻轻地咬住她的骨盆，以稳定的速度施加更大的压力。妖精的眼睛再次睁大，在你的掌控中无助地扭动。很快就到了极限，你的牙齿将她的臀部和骨盆咬成了无数有嚼劲的碎片，引出了迄今为止最凄厉的痛苦尖叫。");
         outputText("[pg]你卷起嘴唇，撕开连接她下半身和躯干的血肉，注视着这只妖精生命的最后时刻。她的内脏悬挂在身下，滴落着她的生命力。你把她举过头顶，将这只濒死的生物滑入喉咙。你觉得这是一种柔软而有嚼劲的肉，值得以后再尝一次。");
         get_player().refillHunger(5,true,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieDoNothing() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         if(get_player().nippleLength >= 1)
         {
            outputText("她打量着你，目光停留在你的上半身，发出一声欢呼。她落在你的胸前，暴露的小穴正好贴在你的乳头上。她一只手抓住你头顶上方，另一只手引导着迅速变硬的乳头进入她的双腿之间。当她紧致的通道用力挤压你的乳头时，她发出了愉悦的叹息，那种感觉介于手指捏弄和嘴唇吸吮之间。你自己也高兴地喘着气，你注意到她的腹股沟肌肉有着惊人的控制力，一种波纹般的感觉在你的乳头上荡漾。[pg]");
            outputText("你的乳头开始变得湿漉漉的，就像有人的舌头在周围舔舐一样，但这其实是妖精的爱液滴落下来，有些流到了你的乳房上，有些顺着她的腿流下。她开始在你身上挺动，你注意到她的阴蒂变硬了，顶在你的软肉上。你用空闲的手抓住乳头周围的区域，更用力地挤压，迫使更多的部分进入她体内。[pg]");
            if(get_player().biggestLactation() > 1)
            {
               outputText("一股乳汁射入她体内，让妖精呻吟起来。她用充满情欲的细长眼睛抬头看着你，双腿夹紧，想从你身上榨取更多。[pg]");
            }
            outputText("最终你们都找到了节奏，很快她就大声呻吟起来。");
            if(get_player().hasVagina())
            {
               outputText("你用另一只手开始抚弄你的" + get_player().vaginaDescript(0) + "，将自己轻柔的呻吟与她的交织在一起。");
            }
            else if(get_player().hasCock())
            {
               outputText("你用另一只手开始套弄你的[cock]，将自己轻柔的呻吟与她的交织在一起。");
            }
            outputText("几个幸福的瞬间后，她浑身一颤，你感觉到她在你的乳头周围不受控制地痉挛。");
            if(!get_player().isGenderless())
            {
               outputText("不久之后，你也加入了她的行列。");
            }
            outputText("妖精瘫软下来，盘旋着落到地上，轻轻地坠落，在余韵中仍然抽搐着。你小心翼翼地后退，离开了她。");
            if(get_player().biggestLactation() > 1.5)
            {
               outputText("[pg]大量的乳汁从她玫瑰色的幽谷中流出。");
            }
            get_player().orgasm("Tits");
            dynStats(DynStat.Lib(-2));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().hasVagina() && get_player().getClitLength() >= 1 && get_player().getClitLength() <= 4.5 && Utils.rand(2) == 0)
         {
            outputText("她脸上露出一丝微笑，飞落到你的胯部。尽管体型差异很大，她还是开始和你磨豆腐，尽管你的阴蒂已经勃起，她还是把它顶进自己体内。和她相比，它看起来太巨大了。她把一条腿跨在上面，开始把自己刺穿在上面。你紧绷的阴蒂勉强能塞进她体内，对你敏感的肉核来说，那紧致的通道足以让你双腿发软。你踉跄着倒在地上，用拳头抓住她脆弱的身体，粗暴地把她按在你肿胀的阴蒂上。她在痛苦和快乐中哀嚎，同时被挤压和撑开。她痛苦的哭喊加上对你最敏感部位的强烈刺激，让你迅速达到了高潮。[pg]");
            if(get_player().vaginas[0].vaginalWetness >= 4)
            {
               outputText("你用你的淫液把可怜的妖精完全浸透了，浸湿了她的头发和身体。她不堪重负，精疲力竭，你把她扔到地上，喘着粗气。她舔干净了脸周围的液体，但太虚弱了，除了躺在泥土里什么也做不了。[pg]");
            }
            else
            {
               outputText("你浑身颤抖，保持着镇定继续动作，试图乘着高潮的余韵再来一次。最后你低下头，看到妖精的眼睛已经变得呆滞，翻了白眼。她的小穴开始更用力地夹紧你，这证明她处于近乎持续的高潮状态。这种随机的收缩让你很快再次爆发，你经历了一次强烈的高潮，加入了你的妖精同伴。[pg]");
            }
            outputText("时间仿佛停滞了一瞬，你最终平静下来，轻轻地放松了抓握，将筋疲力尽的妖精从你逐渐变软的女性部位上移开。妖精慢慢恢复了意识，向你道谢后飞走了。");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(-1));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().hasVagina() && get_player().getClitLength() > 4.5)
         {
            outputText("妖精飞近你的耳朵，用对另一个人来说如同耳语般的音量说道，[say: 你的身体很性感，女孩，但对我来说太大了。我希望你能找个人帮你解决，这样我就能在一旁看着了。]然后她飞到你面前，可爱地亲吻了你的鼻梁，飞走了。");
            dynStats(DynStat.Lust(5));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("妖精飞近你的乳头，小心翼翼地吸吮着。当你感觉到它在她的嘴里紧紧地皱起，因为她的唾液而感到刺痛时，你舒服地喘着粗气。她让它弹了出来，因为兴奋而肿胀。她的手顽皮地弹了它一下，当你舒服地闭上眼睛时，那种突然的感觉传遍了你的全身。你恢复过来，发现她已经飞到了高高的树上，在逃跑时顽皮地挥着手。");
         outputText("[pg]你皱了皱眉，开始穿衣服，当你发现你的乳头比你记忆中更突出地顶着衣服时，你烦躁地红了脸。");
         var _temp_1:* = get_player();
         _temp_1.nippleLength = _temp_1.nippleLength + 0.25;
         if(get_player().nippleLength > 3 || get_player().biggestTitSize() <= 2)
         {
            outputText("值得庆幸的是，这似乎是暂时的。");
            var _temp_2:* = get_player();
            _temp_2.nippleLength = _temp_2.nippleLength - 0.25;
         }
         dynStats(DynStat.Sens(1),DynStat.Lust(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieCatch() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         if(get_player().get_spe() - get_player().statusEffectv1(StatusEffects.FaerieFucked) * 5 < 50)
         {
            outputText("[pg]尽管她放松了警惕，但你[hand]的突然冲刺还是引起了她的一声尖叫，她以最快的速度飞走了。你太慢了！");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]妖精对你的意图毫无察觉，她拍打着翅膀飞近，直到你以迅雷不及掩耳之势将她从半空中一把抓住。她惊叫着，痛苦地扭动着，而你现在得好好想想该拿她怎么办了。");
            sexMenu();
         }
      }
      
      public function faerieCaptureHJ() : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         if(get_player().hasStatusEffect(StatusEffects.FaerieFucked))
         {
            get_player().addStatusValue(StatusEffects.FaerieFucked,1,2);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.FaerieFucked,2,0,0,0);
         }
         clearOutput();
         if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
         {
            outputText("你紧紧地抓住她，责备她用那诱人的[if (faeisnude) {裸体|暴露衣着}]来挑逗你；在这个地方，被激起性欲可是个麻烦事。你不能就这么放着不管，所以你决定让她为这个问题负责。");
            outputText("[pg]她抬头看着你，咽了口唾沫，然后默默地点了点头，不愿或无法反抗你的命令。");
         }
         outputText("你松开她，她悬停在半空中，似乎在思考这最后一次逃跑的机会。她叹了口气，再次抬起头，脸红得厉害，降落在你的臀部，低头看着你腹股沟" + get_player().clothedOrNakedLower("处的凸起") + "。当她" + get_player().clothedOrNakedLower("钻进你的" + get_player().get_armorName(),"爬到你身上") + "，爬过你敏感的大腿向你的[cocks]移动时，你忍不住笑了起来。[pg]");
         if(get_player().isTaur())
         {
            outputText("小妖精爬到了你的[cock]上");
            if(get_player().cockTotal() > 0)
            {
               outputText("最大的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
            }
            outputText("并在上面爬行了一会儿，习惯了它的形状，深深地吸入它麝香般的气味。她用身体缠住你，开始在你坚硬的肉棒上上下摩擦。当她移动时，她那微小的缝隙里流出长长的淫液，用你无法插入的小穴挑逗着你。随着妖精继续在你周围移动，先列腺液开始稳定地从你的顶端渗出，她轻声呻吟着，暴露了她内心的渴望。[pg]");
            outputText("你的身体开始自然地前后抽动，试图去操那并不存在的母马。你能感觉到妖精在滑动，直到她更紧地抓住你，但这只会让你抽动得更厉害。她意识到自己的错误时已经太晚了，她试图松开自己，但你狂野的挺动让她向前飞了出去。[pg]");
            outputText("她撞到了你的[cocks]末端并抓住了它。她的脸压进了你的尿道，她那细小的双腿缠绕在顶端。随着高潮的临近，你那狂乱挥舞的肉棒开始变得更大，但妖精并没有注意到，她正开心地喝着你的先列腺液。[pg]");
            if(get_player().balls == 0)
            {
               outputText("你那微小的精液水珠直接进入了她张开的嘴里，她高兴地吸了下去，然后吧唧一声掉在了浸满先列腺液的地上。[pg]");
            }
            else if(get_player().cumQ() < 50)
            {
               outputText("你的精液直接溅到了她的脸上，她迅速地把它吸了进去。她吧唧一声掉在了浸满先列腺液的地上，而你的阴茎则不时地滴下精液落在她的头上。[pg]");
            }
            else if(get_player().cumQ() < 200)
            {
               outputText("你的精液冲刷着她的脸，她失去了对你[cocks]的抓握。她吧唧一声掉在了浸满先列腺液的地上，你周期性地喷射出新鲜的精液喷在她身上。[pg]");
            }
            else
            {
               outputText("你的精液撞击在她的脸上，她从你的肉棒上被推落到浸满先列腺液的地上。你的[balls]像水管一样继续泵出精液，直到她几乎在里面游泳。[pg]");
            }
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-0.5));
            if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 10)
            {
               outputText("妖精打了个嗝，又咯咯笑了起来，然后抬头瞪着你，用有些涣散的目光指责你，问道：[say: 你知道我们喝精液会醉吗？因为我非常努力地不想变成这样。][pg]");
            }
            else if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
            {
               outputText("妖精打了个嗝，醉醺醺地笑了起来，拍着你的[leg]的侧面，含糊不清地说：[say: 哦，以玛莱丰满的乳房起誓！我正需要这个。你觉得你还能再抓到我吗？我喜欢你的精液涂满我身体的感觉。][pg]");
            }
            else
            {
               outputText("妖精打了个嗝，开始公然自慰，喘着气，开心地含糊不清地说：[say: 是的，我——喘气——感觉棒极了！嗯嗯嗯，这让我的小穴变得好敏感。我要飞回家，把它塞满，然后玩我的阴蒂，直到我睡着！][pg]");
            }
            if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
            {
               outputText("她舔了舔手指，在地上打滚大笑：[say: 嘿嘿，谁在乎呢！我很高兴！哇哦！][pg]");
            }
            outputText("妖精起飞了，身上还在滴水，飞行路线也不怎么直……");
         }
         else
         {
            outputText("妖精够到了你肿胀的阴茎，并且");
            if(get_player().hasKnot(0))
            {
               outputText("爬上了你的[knotword]，双腿缠绕在较窄的阴茎干上以保持平衡。你能感觉到她的脸颊贴在你[cockanimalityadj]解剖结构隆起的地方，用你那大得根本无法插入的女性特征挑逗着你。");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("爬上了你的[cock]，挂在你的包皮环上，双腿尽可能地缠绕在你那马一样的雄性器官上。");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("爬上了你的[cock]，紧紧抓住那些腐化的结节和突起，双腿穿插其间，紧紧地夹住你。你能感觉到她湿润的裂口贴在一个特别敏感的突起上，用你永远无法插入的微小阴户挑逗着你。");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("爬上了你蠕动的[cock]，双腿紧紧缠绕着它，它因兴奋而扭动翻腾。它不受控制地卷曲起来，像动物一样把紫红色的龟头在她的脸上蹭来蹭去。她轻轻捏了捏它，然后舔了一口。");
            }
            else
            {
               outputText("爬上了你坚硬的阴茎，双腿紧紧缠绕着它，在你身上找到了一个栖身之处。你能感觉到她湿润的裂口摩擦着你敏感的皮肤，用你永远无法插入的微小阴户挑逗着你。");
            }
            outputText("你体内的肌肉下意识地收缩，挤出了一滴先列腺液，顺着流进了妖精的[faeHair]头发里，浸湿了她的头和脸。你看不见她的反应，但你能感觉到液体在她的身体和你之间渗出，在她摩擦和顶弄你时起到了润滑作用。微弱而沉闷的呻吟声从" + get_player().clothedOrNakedLower("你的[armor]","她的嘴里") + "传出，表明她身体的某一部分正在享受这项任务。[pg]");
            outputText("虽然她一次只能刺激你几英寸的地方，但感觉真的很好——比预想的还要好，一股即将释放的暖流在你体内积聚。" + get_player().clothedOrNakedLower("你意识到自己至少应该脱掉部分衣服，但为时已晚。你还没来得及做任何事就射了，精液溅满了你的[armor]，在裤裆处留下了一大块湿斑。你能感觉到它滴回到你和妖精身上，随着更多的精液喷射而出，这个小女孩被精液浸透，湿斑也越来越大","幸好你的下体是露在外面的，否则你就会射在裤子里了。你射了，精液溅了妖精一身。这种情况一直持续到这个小女孩被精液浸透为止") + "。");
            if(get_player().cumQ() > 250)
            {
               outputText("你无法控制地射精了，" + get_player().clothedOrNakedLower("你后悔自己的生育能力，因为你的身体把你的[armor]内部涂满了黏糊糊的白色液体。","把地面涂满了黏糊糊的白色液体。") + "");
               if(get_player().cumQ() > 500)
               {
                  outputText("你释放的证据在你周围形成了一个水坑，你的双腿发软，你");
               }
               else
               {
                  outputText("你的双腿发软，向后倒去，你");
               }
            }
            else
            {
               outputText("你");
            }
            outputText("看着你湿漉漉的腹股沟蠕动着，妖精释放了你积聚的压力，然后爬了出来。她从头到脚都沾满了黏糊糊的白色精液，正吧唧吧唧地舔食着。[pg]");
            outputText("她从你身上滚下来，踉跄了一下，然后一屁股坐在你旁边，露出她可爱的小屁股");
            if(get_player().cumQ() > 500)
            {
               outputText("在精液里");
            }
            outputText("，醉醺醺地咯咯笑着。");
            if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 10)
            {
               outputText("妖精打了个嗝，又咯咯笑了起来，然后抬头瞪着你，用有些涣散的目光指责你，问道：[say: 你知道我们喝精液会醉吗？因为我非常努力地不想变成这样。][pg]");
            }
            else if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
            {
               outputText("妖精打了个嗝，醉醺醺地笑了起来，拍着你的[leg]的侧面，含糊不清地说：[say: 哦，以玛莱丰满的乳房起誓！我正需要这个。你觉得你还能再抓到我吗？我喜欢你的精液涂满我身体的感觉。][pg]");
            }
            else
            {
               outputText("妖精打了个嗝，开始公然自慰，喘着气，开心地含糊不清地说：[say: 是的，我——喘气——感觉棒极了！嗯嗯嗯，这让我的小穴变得好敏感。我要飞回家，把它塞满，然后玩我的阴蒂，直到我睡着！][pg]");
            }
            if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
            {
               outputText("她舔了舔手指，在地上打滚大笑：[say: 嘿嘿，谁在乎呢！我很高兴！哇哦！][pg]");
            }
            outputText("妖精起飞了，身上还在滴水，飞行路线也不怎么直……");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-0.5));
            if(!get_player().hasStatusEffect(StatusEffects.Jizzpants) && get_player().get_armor().get_name() != "nothing" && get_player().get_armor() != get_armors().GOOARMR)
            {
               get_player().createStatusEffect(StatusEffects.Jizzpants,1,0,0,0);
            }
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               outputText("[pg]幸运的是，你的精液被覆盖在你身上的蓝色粘液吸收了。");
               get_game().valeria.feedValeria(get_player().cumQ() / 10);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         var alt1:Boolean;
         var _g1:Faerie;
         var alt:Boolean;
         var _g:Faerie;
         randomizeFaerie();
         registerTags();
         spriteSelect(SpriteDb.get_s_faerie());
         if(get_silly() && get_player().get_hp100() < 50 && get_player().get_armor() == get_armors().ADVCLTH)
         {
            heyListen();
            return;
         }
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2733) == 1 && get_player().hair.type == 10 && get_player().hair.hasFlowers())
         {
            outputText("在灌木丛中跋涉时，你放慢了脚步，欣赏着周围的环境。旅途中的片刻喘息能让你迅速恢复精力，同时也能让你更透彻地感知周围的一切。然而，就在你逗留的时候，一只妖精飞了过来。乍一看，她和其他妖精没什么不同，有着像[if (!faeispetal) {花瓣一样的}][faeHair]头发，[if (faeisnude) {身体赤裸，就像大自然创造她时一样|身体大半赤裸，只穿着[faeoutfit]}]，她似乎被你头上装饰的花朵吸引了。你觉得她应该没有恶意；你要怎么做？");
            menu();
            addButton(0,"赶走",faerieShooAway).hint("把她挥开，你对她想干的事没兴趣。");
            addButton(1,"什么都不做",faerieFlowerDoNothing).hint("随她去吧，她没有恶意。");
            addButton(2,"抓住",faerieCatch).hint("趁她靠近时抓住她。");
            _g = this;
            alt = true;
            addButton(4,"别再来了！",function():void
            {
               _g.disableFaerieEncounterForGood(alt);
            });
         }
         else
         {
            outputText("一只比你的中指稍微高一点、粗一点的妖精在空中飞舞。她娇小的身躯和少女般的[faeHair]波波头非常可爱，但她的[faeoutfit]却激起了你内心更原始的反应。她那轻盈、半透明的红色翅膀让她能平稳地悬停在半空中。");
            if(get_player().cockTotal() > 0 && (get_player().biggestTitSize() <= 2 || Utils.rand(2) == 0))
            {
               outputText("[pg][if (isnakedlower && hasCock) {她很容易就注意到了你那毫无遮掩的生殖器。|她飘近时上下打量了你一番，然后做了个鬼脸。}] [say: 呃，[if (isUnderage) {男孩|男人}]的玩意儿！]妖精惊呼道，然后像受惊的小鸟一样转身逃跑。");
               if(Utils.rand(get_player().get_spe() / 2) + get_player().statusEffectv1(StatusEffects.FaerieFucked) > 15)
               {
                  if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 5)
                  {
                     outputText("你条件反射般地猛扑过去，将她从半空中一把抓下，巨大的力道让她一阵晕眩。在短暂的迷失方向后，她沮丧地扭动挣扎起来。[say: 放开我，你这个坏蛋！]");
                     outputText("[pg]这只小妖精身上的某种特质吸引了你，但现在她已经在你手里了，你要怎么做？");
                  }
                  else if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 10)
                  {
                     outputText("你相当轻松地把她从空中抓了下来，注意到她的反应比其他同类要迟钝得多。她扭动着身子，哀求你：[say: 求求你别再把我弄得满身是精液了……我会醉得很厉害，之后会觉得自己更像个荡妇。我不想当荡妇！]");
                     outputText("[pg]看来你以前抓到过这只，也许还不止一次。看着她嘟着嘴脸红的样子，她可能以为又要受到同样的对待了。你该怎么做？");
                  }
                  else if(get_player().statusEffectv1(StatusEffects.FaerieFucked) < 15)
                  {
                     outputText("你轻松地把这只晕乎乎的妖精从空中抓了下来，手掌碰到了她大腿上的一片湿润。她扭动着呻吟道：[say: 不，别再来了！我虽然很想再洗一次精液浴，但是……]她不安地蹭了蹭双腿。[say: 我快受不了了。当你大半天都在自慰，只为了等另一根硬挺的鸡巴路过时，你很难专心照料花朵。]");
                     outputText("[pg]显然她和你一样想爽一发。你要让她再次服侍你吗？");
                  }
                  else
                  {
                     outputText("你毫不费力地把妖精抓在[hand]里，感觉到她湿滑的下体正蹭着你。她黏糊糊的身体和明显的渴望表明你已经用过她很多次了。[say: 来吧，让我爬进你的[if (isnaked) {大腿间|[armor]}]，把自己缠在你的肉棒上！]她哀求道。[say: 我至少只需要一点先列腺液！我会做一个乖乖的妖精荡妇，就让我帮你弄出来吧……]");
                     outputText("[pg]你要让她这么做吗？");
                  }
                  dynStats(DynStat.Lust(get_player().lib / 10 + 2));
                  unlockCodexEntry(2733);
                  sexMenu();
                  return;
               }
               dynStats(DynStat.Lust(get_player().lib / 10 + 2));
               outputText("你条件反射般地猛扑过去想把她从空中抓下来，但只抓到了一团空气，她已经飞升到了树冠里。");
               if(get_player().get_lust100() >= 90)
               {
                  outputText("[pg]你沮丧地痛苦呻吟着。极度渴望刺激的你[if (singleleg) {瘫倒在地|跪倒在地}]开始自慰，妖精的容貌在你的脑海中依然清晰。你脑海中闪过一个画面：你的双拳紧紧抓住妖精的双腿，把她拖向");
                  if(get_player().cockTotal() == 1)
                  {
                     outputText("你的鸡巴");
                  }
                  else
                  {
                     outputText("你的一根鸡巴");
                  }
                  outputText("，对她娇小的身躯来说太大了……这堕落的画面占据了你的脑海，你发现自己疯狂地把精液射得满地都是。");
                  get_player().orgasm("Dick");
               }
               unlockCodexEntry(2733);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("这只妖精看着你，露出了好奇的神色，慢悠悠地飘近。虽然大多数生物不声不响地靠近都会让人紧张，但在这里你却倾向于打消这种顾虑，不过你真的应该放松警惕吗？");
            unlockCodexEntry(2733);
            menu();
            addButton(0,"赶走",faerieShooAway).hint("把她挥开，你对她想干的事没兴趣。");
            addButton(1,"无视",faerieDoNothing);
            addButton(2,"抓住",faerieCatch).hint("趁她靠近时抓住她。");
            _g1 = this;
            alt1 = true;
            addButton(4,"别再来了！",function():void
            {
               _g1.disableFaerieEncounterForGood(alt1);
            });
         }
      }
      
      public function encounterName() : String
      {
         return "faerie";
      }
      
      public function encounterChance() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2221) <= 0)
         {
            return 1;
         }
         return 0;
      }
      
      public function disableFaerieEncounterForGood(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_s_faerie());
         clearOutput();
         if(param1)
         {
            outputText("你告诉妖精永远不要再来烦你。她看起来很伤心，但她知道她正在做出永远不再打扰你的承诺。");
            outputText("[pg]你有一种感觉，你再也见不到她了……");
         }
         else
         {
            outputText("你道了歉并放开了她，让她拍打着轻如薄纱的翅膀飞走。她向你道谢，飞到你的唇边，在你的嘴上印下了一个纯洁的吻。她头也不回地飞进了树林……");
            outputText("[pg]你在心里暗暗记下，决定再也不去抓她了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2221,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

