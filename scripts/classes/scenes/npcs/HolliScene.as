package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
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
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._HolliScene.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class HolliScene extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var jojoAssisting:Boolean;
      
      public var globalSave:Boolean;
      
      public function HolliScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         jojoAssisting = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "holli";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function vaginalDomHollisTentacruels() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         outputText("你扭着身子走向你最喜欢的触手树，指尖划过霍莉的乳沟，喉间发出低低的轻哼，[say: 我现在有点兴致。帮我个忙，把你的那些“小”朋友叫下来玩玩，好吗？] 你声音里的命令意味让人很难把这当成真正的询问。霍莉那双漆黑而污秽的眼睛里带着一点恐惧，温顺地点了点头。一阵绿色的阳具状触手雨从上方茂盛的树冠中倾泻而下，懒散地悬在你身后，其中几根却像察觉猎物的蛇一样弓了起来。你用手托住这只被固定住的宠物的下巴，将她的头微微抬起，让她与你四目相对。");
         outputText("[pg][say: 乖宠物，]你柔声哄道，松开她并转过身去，特意催眠般地摆动你的 [hips]，提醒她接下来会得到什么。最近的一根触手朝你摇摆过来，亲昵地蹭着你的 [skinfurscales]。你抬起手掌托住它，掌心沿着下侧滑过，同时褪下你的 [armor]。这根阳具状藤蔓像一只亲人的宠物般急切地在你身上磨蹭，清澈的树液却从它顶端湿润的细缝中渗出。你在那泛紫的尖端后方握住它，向后一拉，把它拖向霍莉。");
         outputText("[pg]这个恶魔树妖不确定地歪了歪头，面对着属于她自己的亵渎雄性器官。你把那根长茎放进她沉甸甸的乳房之间，退后一步欣赏自己的杰作。那根藤茎愉快地扭动起来，开始在她的乳沟中滑动，亲昵的力道把她的身体都顶得微微后仰。霍莉倒吸一口气，惊讶于自己的失控，以及这场像自慰般的乳交。她的眼睛都快对到一起，试图盯住它，看着它从乳间顶出，泛紫的尖端在行程最高处抵上她的下巴。你把那根肉茎往后抽动了几尺以作鼓励，那根跳动的灵活阴茎便猛地穿过她的双唇。");
         outputText("[pg]一声含混的呻吟从这树妖母狗被塞满的嘴里漏出，伴随一阵颤抖，让她的乳房跟着晃动。你轻快地走到她身边，在她耳边低语，[say: 把那根给我弄得湿一点，好吗，宝贝？]");
         outputText("[pg]霍莉再次呻吟，这一次声音大到几步之外都能听见。你旋身离开，在那片闲置的绿色肉棒森林中轻盈穿行。它们似乎比之前更大了一些——或许是更加充血了。霍莉体内奔流的欲望一定正扩散到她所有的肢端，哪怕是这些离本体很远的也不例外。你又抓住两根，转身面对这个嘴里被占满的神孽。她双眼半闭、神情恍惚，不过她肯定能感觉到，你掌心的热度正暖着她那两根肉棒的下侧。");
         outputText("[pg]一个邪恶的念头浮上心头，你毫不犹豫地付诸行动，松开其中一件战利品，把那根沾满唾液的肉茎从霍莉嘴里撬出来。她急促地喘了一口气，正好又被一根新的肉棒堵住，刚吸入的新鲜空气立刻化作带着颤音的呜咽呻吟，震过这根新肉棒。你把那根润滑充分的阳具拽到自己的阴阜下方，抵进你的 [vagina]。尽管它很粗，顶端却圆润饱满，几乎像抹了黄油般顺滑地滑入你体内。在那撑开的冠部后方，蠕动的肉管开始施加温柔的压力，四处抽甩着，试图进一步进入你。你更加放松，任由它刺得更深，一直顶到你毫无防备的宫颈。");
         get_player().cuntChange(25,true,true,false);
         outputText("[pg]这相当费力，但你还是设法全程站稳。你抚摸着剩下那根肉棒，一阵不由自主的颤抖掠过全身。你咳了一声清清嗓子，带着挑逗问道，[say: 嘴里塞得开心吗，亲爱的？] 她点了点头，动作带得那根垂着的肉茎左右摇晃。[say: 很好，继续吸，也别让夹在我腿间的触手闲着。你要把我送上一次舒服又湿透的高潮。]");
         outputText("[pg]霍莉又点了点头，这次更加热切。插在你 [vagina] 里的触手稍稍后退，但只是一瞬。它带着报复般的劲头重新冲回你的小穴，狠狠向上贯入。你倒吸一口气，[say: 噢——哦！慢……慢一点！]");
         outputText("[pg]那根触手肉棒抽插得更快了，随着动作，表面沾上的湿润也越来越多。你懊恼地低吼一声，把鸡巴从霍莉嘴里拽出来，横着狠狠抽在她脸上。她因疼痛和震惊倒抽一口气。你两腿之间，那过分急切的动作停了下来。你手里，那根滑腻的肉棒还想扭动着挣脱。你用力一捏，它便止住了叛逆的动作，免得把自己弄伤。");
         outputText("[pg][say: 我说了，慢一点，]你说着，又用沉重的肉棒抽打为这句话加上重音。霍莉恼火地动了动下巴，却在你钢铁般目光中的怒火前垂下了眼。[say: 这才像话。现在，你们俩亲一亲，和好吧。]你把那根娇嫩的肉棒又塞回她的嘴洞里，命令道：[say: 驾，小马驹——你还有个[master]要伺候呢。]");
         outputText("[pg]下方的起伏动作重新开始，这次变成了令人愉快的缓慢节奏。你满足地叹了口气，终于能享受这场慢吞吞的性交了。你揉捏着自己的[fullChest]");
         if(!get_player().hasFuckableNipples() && get_player().lactationQ() < 50)
         {
            outputText("，并格外照顾自己的[nipples]，配合着每一次在你小穴里迟缓推进的节奏拉扯它们。");
         }
         else if(get_player().lactationQ() >= 50)
         {
            outputText("，并在那");
            if(get_player().lactationQ() < 150)
            {
               outputText("喷溅");
            }
            else if(get_player().lactationQ() < 800)
            {
               outputText("喷洒");
            }
            else if(get_player().lactationQ() < 2000)
            {
               outputText("涌出");
            }
            else
            {
               outputText("浓稠喷泉");
            }
            outputText("般的乳汁随着每一次拉扯流出时发出叹息，节奏正好配合着你小穴处迟缓的抽插。");
         }
         else
         {
            outputText("，并把手指按进自己的[nipples]里，随着触手迟缓抽插的节奏操弄它们。");
         }
         outputText("一声响亮的呻吟从你口中逸出，你挺动[hips]迎向那根起伏的藤蔓。你的身体对更多快感的渴求无与伦比，但你仍像控制这名树妖一样，高效地控制着自己。");
         outputText("[pg][say: 把两根触手伸过来，霍莉。我想看看你被自己的种子糊成面具是什么样子。]霍莉淡绿色的皮肤羞得更深了，几乎和她翠绿色的头发一样深，但两根触手还是像变魔法般出现在你身旁。它们的顶端张开，泛着紫色，宽度足有一根半棒身那么粗，正渗出清澈滑腻的先液树汁。你碰了碰其中一根的尖端，见它又冒出一团新鲜润滑液，不禁咯咯笑了起来。它在你手里光滑又湿滑，正适合手交。你开始撸动这两个新来的家伙，小心地让它们正对着霍莉的脸。可怜的女人嘴里塞满了鸡巴，一根肉棒深深插在你的小穴里，另外两个肿胀的龟头离她毫无遮挡的脸也不过几英寸。发生了这么多事，她还能思考，简直是个奇迹。");
         outputText("[pg]霍莉的触手此刻动得更快，开始更加用力地撞击你，带着越来越高涨的热情活塞般抽送。你任由它这么做——到了这时，你已经湿得发疼，而一场快速又炽烈的性交正是你的[vagina]所需要的。[say: 再用力点！]你催促道，而你听话的树妖婊子照做了。顶端粗大的藤蔓撞上你的子宫颈，用它粗壮的长度将你的甬道完全填满。它的棒身向上弓起，碾过你的[clit]");
         if(get_player().getClitLength() >= 3.5)
         {
            outputText("，片刻后又缠上去，拉扯着它");
         }
         outputText("。");
         outputText("[pg]霍莉叫道：[say: 嗯嗯呃……咕唔嗯……咕唔嗯唔嗯！]");
         outputText("[pg]她……什么？你体内深处那一阵明显的膨胀感提醒了你她想说什么——她快要射了。好吧，你自己也差不多了，而没有什么比一场好戏更能把你推过临界点。你更快地撸动手里的肉棒，看着它们紫色的顶端剧烈鼓胀开来，宽得让你不得不把手挪到顶端后方，脸上露出笑意。先列腺液的飞沫溅到地面上，而霍莉的双颊也被嘴里那根过度充血的粗物撑得鼓了起来。");
         outputText("[pg]你在她耳边低语：[say: 来吧，婊子，射吧。]你更快地套弄她，快到双臂都因用力而开始发酸。[say: 为[master]射出来，来吧。把你漂亮的脸和头发全都糊满精液。把那些下流的浓精全都泵进你喉咙里。]霍莉的眼睛开始翻白，你用沙哑的嗓音低低地咕哝道：[say: 射进我的骚穴里，小婊子。]");
         outputText("[pg]触手彻底僵硬起来，完全坚挺得发硬。肿胀的顶端一阵阵跳动，精液的鼓包沿着它们后方的长度起伏推进，最终爆发出来。你牢牢握住它们，引导它们扫过这名恶魔树妖惹眼的脸庞，把她埋进厚厚的白浊之中。她闪亮的绿色头发很快像戴上了一顶雪白的帽子，浓稠的精液顺着她的眼睛滴落到胸前。精液毫无阻碍地从霍莉的鼻孔里流出，她的喉咙则不停吞咽着这一切，可不管她吞得多努力，似乎都完全跟不上。");
         outputText("[pg]与此同时，一股温热的浪潮涌入你的子宫，轻易穿过你毫无抵抗的宫颈入口注射进去。其中一些从两侧溢出，进一步润滑着你的甬道。它像炸弹一样引爆了你，你向后倒在地上，努力把你的[hips]抬得更高。在重力的帮助下，精液更快地灌满你的子宫。你不由自主的肌肉痉挛带来的紧绷收缩也帮不上忙。恰恰相反，你的身体反而把更多精液锁在里面，逼得你又承受了几股直冲你已被塞满的生殖系统的精液喷发。");
         outputText("[pg]那根仍在喷射的肉棒开始抽离，拖着它过大的龟头穿过你敏感而颤抖的入口。途中它撞上你娇嫩的阴蒂，又用一股新鲜精液把它浸透。随后它升回树冠之中，只留下那一大滩白浆，让你的[vagina]除此之外变得空空荡荡。你满足地哼了一声，试着站起来。你的[legs]摇晃着发软，让你又跌回");
         if(get_player().wetness() < 4)
         {
            outputText("地上");
         }
         else
         {
            outputText("你喷潮高潮留下的湿迹里");
         }
         outputText("。第二次，你才站了起来。霍莉一片狼藉。她从肩膀往上全都覆着一层白浊，身体其余部分也挂着一缕缕精液，像猥亵的圣诞装饰一样垂着。在你周围，一小滩一小滩的精液正迅速渗入荒芜的土地——其他每根触手都和它的兄弟们一起爆发了，只是你没去理会，它们只能徒劳地喷射。");
         outputText("[pg]你在霍莉脸颊上轻轻一吻，品味着那味道，说道：[say: 好女孩。]随后，你穿好衣服，尽量不去在意大腿之间黏湿的挤压感。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,595,FlagDict_Impl_.arrayReadInt(_loc1_,595) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         fertilizeHolli(false);
         get_player().slimeFeed();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function treePhaseFourGo() : void
      {
         clearOutput();
         outputText("一个陌生的女声喊出了你的名字，嗓音尖细而婉转。你毫不犹豫地回应了呼唤，穿过营地一路走向边缘——那棵腐化的性爱树曾经生长的地方。是有妖精被它抓住了吗？那么小的生物，恐怕还没能挣脱，就会先变成触手上的套子吧。即便如此，你还是加快脚步，握紧了你的[weapon]。你很清楚，动听的声音并不总是配得上善良的性情——无论是在英格纳姆，还是在玛瑞斯。");
         outputText("[pg][say: 哦，[name]！你在哪儿呀——？]那个声音娇声呼唤着。你转过弯，眼前的景象既熟悉又令人心悸。在一截宽大的、看起来十分古老的树干中央，站着一个女人。她从木头中央的裂缝中探出身来，看起来和常人一样由血肉与骨骼构成。然而，她显然是某种恶魔。腐化的痕迹在她棕金色的眼睛里最为明显，将眼白染成一片纯黑。上方，一对扭曲的橡木角从她额前生出，分开了她那丰盈的深绿色卷发。她的皮肤呈淡淡的翡翠色，光滑得像抹了黄油的玻璃；双唇丰润微噘，弯成一抹了然的笑意。");
         outputText("[pg][say: 你好呀，小可爱，]这位绿意盎然的魅魔娇声说道，故作羞怯地把双臂交叠在沉甸甸的G罩杯巨乳前，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) > 0)
         {
            outputText("你喜欢喂养我吗？你真该看看你在我体内射出来时的表情。你的眼睛都翻上去了，嘴巴也傻傻地张着。你知道那让我想做什么吗？");
         }
         else
         {
            outputText("你喜欢看着我成长吗？你本该喂养我的。没有合适的养分，成长起来可辛苦多了。你知道我在等待的那段时间里都在想些什么吗？你知道那让我想做什么吗？");
         }
         outputText("[sayend]");
         outputText("[pg]你茫然地摇了摇头。这个女孩简直像是那位腐化女神的姐妹，一个由欲望与压抑渴念孕育而生的恶魔双生子。她的突然出现，直到现在你还没完全缓过神来。");
         outputText("[pg][say: 那让我更想狠狠地干你。让我想一次又一次地占有你，用所有可能的方式，把你送上快感的巅峰，让你对那份快感渴求到胜过一切，永远都不想离开，]这位恶魔树妖一边解释，一边抬起一只手拨开挡住视线的一缕卷发。她另一只手仍小心地横在光亮的杏色乳头前，但你还是迅速瞥见了一眼。她咯咯笑了起来，胸前的巨乳随着呼吸轻轻晃动，同时承诺道：[say: 母亲大人玛莱创造了我，把我作为送给你的礼物。你的专属侍从。我的名字是霍莉辛西娅，不过你可以叫我霍莉。我可是你专属的精液盆栽！而且我看得出来，你已经相当迷上我了，对吧？]");
         outputText("[pg]你立刻把视线抬回她那奇异颜色的眼眸，正好赶上她放下另一只手。当然，当你想再往下瞄时，她又已经用双手遮住了乳头。");
         outputText("[pg][say: 啧啧，想看这些的话，你得先陪我玩才行……我离不开我的树，至少还得好几年，所以你得好好让我保持……温暖，]她娇声低语。下方，你发现那朵熟悉的花仍然存在，只是比起从前的盛景，如今显得几乎有些娇小。它现在安卧在女人双腿之间，正处在她身体重新融入木纹的位置上方，花瓣合拢成一个矜持的花苞。");
         outputText("[pg]恶魔树主动提议道：[say: 来吧，让我们一起满足彼此的欲望。如果不是现在，那就等几个小时之后，等你又为了那些毫无意义的事到处奔波，弄得自己……欲火难耐的时候。还有……如果你求得好听点，我甚至可以在你休息时帮你守夜。低等生物总是那么容易被诱捕、被玩弄。]");
         outputText("[pg]好吧……你现在手上多了一个恶魔植物女人；按你故乡的传说来说，就是一位树妖。只要你别站得太近，她看起来倒是无害，而且确实相当诱人。现在该怎么办？");
         outputText("[pg][b:（霍莉辛西娅已添加到追随者菜单！）]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,596,4);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,597,0);
         dynStats(DynStat.Lust(15));
         treeMenu(false);
      }
      
      public function treeMenu(param1:Boolean = true) : void
      {
         var _g6:Camp;
         var backFunc2:Function;
         var _g5:HolliScene;
         var destroyFunc2:Function;
         var _g4:HolliScene;
         var backFunc1:Function;
         var _g3:HolliScene;
         var destroyFunc1:Function;
         var _g2:HolliScene;
         var backFunc:Function;
         var _g1:HolliScene;
         var destroyFunc:Function;
         var _g:HolliScene;
         var _loc2_:int = 0;
         if(param1)
         {
            clearOutput();
         }
         holliSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,923) > 0)
         {
            outputText("那棵恶魔树还在这里，从树中探出的那张脸即使隔着一段距离，也依旧用恶狠狠的目光瞪着你。看来它可不会轻易原谅你。");
            menu();
            addButton(0,"战斗",fightHolli);
            if(get_player().hasKeyItem("Jojo\'s Talisman") && !get_jojoScene().campCorruptJojo())
            {
               addButton(1,"叫乔乔",callDatJojo);
            }
            addButton(14,"返回",playerMenu);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 1)
         {
            if(param1)
            {
               outputText("那株幼芽看起来和你最初发现它时差不多。它只是一株简单的绿叶嫩枝，高度大约到你的膝盖。它看上去健康而茁壮，长着几十根枝条和油亮的绿叶。仔细看的话，可以发现叶片背面的脉络泛着紫色，还随着腐化的力量轻轻搏动。你可以轻而易举地毁掉它。");
            }
            menu();
            _g = this;
            destroyFunc = destroyDatFukkinTree;
            _g1 = this;
            backFunc = function():void
            {
               _g1.treeMenu();
            };
            addButton(0,"烧掉它",function():void
            {
               _g.holliDestroyPrompt(destroyFunc,backFunc);
            });
            addButton(14,"不管它",playerMenu);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 2)
         {
            if(param1)
            {
               outputText("你面前是一株来历可疑、约有腰高的大型植物。一朵巨大的紫色花朵顶在粗壮的中央茎秆上，那朵淫秽的花在各方面都显得十足女性化，甚至有着形似阴蒂的凸起，以及湿润、微微张开的唇瓣。在那条中央通道里，你能看到一大簇蠕动的雄蕊，环绕着一根更粗大、顶端张开的茎柱。从开口处飘出的气味甜美而带着花香，却无疑充满性意味。它看起来就像一件有机的性爱玩具，而且显然已经被腐化。只要你不让它继续长大，现在要除掉它并不难。");
            }
            menu();
            if(get_player().hasCockThatFits(100) && get_player().get_lust() >= 33)
            {
               addButton(0,"操它",fuckFuckingFuckFlowerP2);
            }
            else
            {
               addButtonDisabled(0,"操它");
            }
            if(get_player().hasVagina() && get_player().get_lust() >= 33)
            {
               addButton(1,"骑上雄蕊",rideDatFuckingFukkFlowerP2);
            }
            else
            {
               addButtonDisabled(1,"骑上雄蕊");
            }
            _g2 = this;
            destroyFunc1 = destroyDatFuckingPlantAtP2;
            _g3 = this;
            backFunc1 = function():void
            {
               _g3.treeMenu();
            };
            addButton(10,"毁掉它",function():void
            {
               _g2.holliDestroyPrompt(destroyFunc1,backFunc1);
            });
            addButton(14,"不管它",playerMenu);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 3)
         {
            if(param1)
            {
               outputText("那株熟悉的植物已经长成了一棵颇具规模的树，不过你怀疑它还远没有停止生长。它伸展着树冠，披满漂亮的绿叶。可惜，即使从下方看，你仍能辨认出叶片背面那些腐化的脉络。那朵阴道般的花仍在，而且正盛放着，如今直径已有数英尺，几乎在不断滴落水分。树干稍往上，有一对小小的、差不多B罩杯的乳房从树皮里鼓了出来。它们光滑柔软得惊人，还渗出甜香的树液，让你的舌头忍不住想尝上一口。在上方的树冠中，触手藤蔓懒散地扭动着，不过并没有表现出任何攻击性。");
            }
            menu();
            if(get_player().hasCock() && get_player().get_lust() >= 33)
            {
               addButton(0,"干花",fuckTheFlower);
            }
            else
            {
               addButtonDisabled(0,"干花");
            }
            if(get_player().hasVagina() && get_player().get_lust() >= 33)
            {
               addButton(1,"骑触手",rideTheWalrusP3);
            }
            else
            {
               addButtonDisabled(1,"骑触手");
            }
            addButton(2,"喝树汁",drinkThePlantGirlsSap);
            if(get_player().hasPerk(PerkLib.Dragonfire) || get_player().hasPerk(PerkLib.FireLord) || get_player().hasPerk(PerkLib.Hellfire) || get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) || get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
            {
               if(param1)
               {
                  outputText("[pg]你可以用超自然火焰把它烧掉，但那肯定会让你很累。");
               }
               _g4 = this;
               destroyFunc2 = torchP3Tree;
               _g5 = this;
               backFunc2 = function():void
               {
                  _g5.treeMenu();
               };
               addButton(10,"烧掉它",function():void
               {
                  _g4.holliDestroyPrompt(destroyFunc2,backFunc2);
               });
            }
            else
            {
               addButtonDisabled(10,"烧掉它","只有超自然火焰才能把它烧掉。");
            }
            addButton(14,"不管它",playerMenu);
         }
         else
         {
            if(param1)
            {
               outputText("你走到营地边缘，来到那棵熟悉的恶魔树前。你一靠近，树皮便像一对丝绸帘幕般裂开，一个女性形体从树内显露出来。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 1)
               {
                  outputText("[pg][saystart]欢迎回来，[name]。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) > 0 && Utils.rand(4) == 0)
                  {
                     outputText("你想再给我授一次粉吗？我的花已经准备好了，正等着你呢……");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) > 0 && Utils.rand(3) == 0)
                  {
                     outputText("你想再用我的触手吗？没有你，它们一直躁动不安呢……");
                  }
                  else if(Utils.rand(2) == 0)
                  {
                     outputText("你是来喝点什么的吗？我为你积攒了许多花蜜。喝上一口肯定能让你清爽不少……");
                  }
                  else
                  {
                     outputText("我该如何服侍你？来吧，给我一个命令，好让我替你完成它。");
                  }
                  outputText("[sayend]");
               }
               else
               {
                  outputText("[pg][saystart]欢迎回来，[name]。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) > 0 && Utils.rand(3) == 0)
                  {
                     outputText("你想再给我授一次粉吗？园艺真是累人的活儿，不过也很有回报……");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) > 0 && Utils.rand(2) == 0)
                  {
                     outputText("你是回来继续玩的吗？我的触手已经躁动得不行了。");
                  }
                  else if(Utils.rand(2) == 0)
                  {
                     outputText("你是来喝点什么的吗？我为你积攒了许多花蜜。像你这样饥渴的冒险者，肯定需要喝上一口，对吧？");
                  }
                  else
                  {
                     outputText("想玩吗？来吧，尝尝母亲大人玛莱最出色的造物。");
                  }
                  outputText("[sayend]");
               }
               get_akky().locationDesc("霍莉");
            }
            menu();
            addNextButton("外貌",holliAppearance);
            addNextButton("交谈",holliTalkMenu);
            addNextButton("性爱",holliSexMenu);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 0)
            {
               addButton(4,get_camp().isGuard("Holli") ? "停止守卫" : "守卫营地",askHolliToWatch);
               _loc2_ = get_player().itemCount(get_consumables().SUCMILK) + get_player().itemCount(get_consumables().P_S_MLK) + get_player().itemCount(get_consumables().IZYMILK) + get_player().itemCount(get_consumables().M__MILK) + get_player().itemCount(get_consumables().SHEEPMK);
               if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDHO) == 0)
               {
                  addButton(10,"藤蔓",get_game().swamp.alrauneScene.askHolli).hint("知道该怎么解决这个吗？");
               }
               else if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
               {
                  addButton(10,"治愈藤蔓",get_game().swamp.alrauneScene.holliSolution).hint("终于，你可以把这件事了结了。").disableIf(!(get_player().hasItem(get_consumables().SLIMYCL,5) && get_player().hasItem(get_consumables().PURHONY,3) && get_player().hasItem(get_consumables().SNAKOIL,3) && _loc2_ > 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) == 1),"你还没有满足她的要求：五块黏滑布料，纯蜂蜜和蛇油各三瓶，以及任意来源的三份乳汁，此外还要喂饱她。");
               }
            }
            else
            {
               addButton(4,"守卫中",askBrokenHolliToGuard);
               if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDHO) == 0)
               {
                  addButton(10,"藤蔓",get_game().swamp.alrauneScene.askHolli).hint("知道该怎么解决这个吗？");
               }
               else if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
               {
                  addButton(10,"治愈藤蔓",get_game().swamp.alrauneScene.holliSolution).hint("终于，你可以把这件事了结了。").disableIf(!get_player().hasItem(get_consumables().SLIMYCL),"你没有她需要的东西。");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) != 0 || saveContent.fruitsEaten != 0)
            {
               addButton(5,"吃果实",eatHolliFruit).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) == 0,"这里没有果实可供你食用。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1087) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
            {
               addRowButton(1,"帮农场",helpWithFarm);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) > 0)
            {
               addRowButton(1,(saveContent.growingGlades ? "减少" : "增加") + "林地",holliAskGlades).hint("请霍莉" + (saveContent.growingGlades ? "停止" : "开始") + "培育更多腐化林地。");
            }
            _g6 = get_camp();
            addButton(14,"离开",function():void
            {
               _g6.campFollowers();
            });
         }
      }
      
      public function torchP3Tree() : void
      {
         clearOutput();
         outputText("够了！这东西不能再继续长在你的营地里了，而你正好有办法除掉它：火。");
         if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            outputText("你闭上眼集中精神，汇聚自身能量，将超自然的火焰倾泻到那东西身上。");
         }
         else if(get_player().hasPerk(PerkLib.FireLord))
         {
            outputText("你吸了口气，鼓起胸膛，搅动美洲豹恶魔馈赠中残存的火种。你引出一颗巨大的松绿色火球，呼气将它射向那棵树。");
         }
         else
         {
            outputText("你吸了口气，鼓起胸膛，搅动你那火焰馈赠中的余烬。你引出一颗巨大的火球，呼气将它射向那棵树。");
         }
         outputText("它像火把一样烧了起来，只是火势比你预想中更快开始衰退。你哼了一声，又重复了一遍，将新的烈焰叠加在先前的火焰之上；你把全部注意力都投入这场新的大火，用你全部的");
         if(get_player().hasStatusEffect(StatusEffects.KnowsBlackfire) || get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            outputText("魔法意志");
         }
         else
         {
            outputText("吐息");
         }
         outputText("。");
         outputText("[pg]这一次，它总算稳稳烧了起来。树在化为灰烬前，充当了好几个小时的方便火炬，却留下浓厚而呛人的烟雾，久久才散去。至少那株讨厌的植物终于彻底没了。");
         get_player().changeFatigue(100);
         get_player().upgradeBeautifulSword();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,598,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function toggleBrokenHolliGuard() : void
      {
         var _g:HolliScene;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,602) == 0)
         {
            outputText("[say: 好吧，那我就能找点乐子了，] 霍莉一边说，一边期待地搓着手掌。");
            outputText("[pg]你觉得，有你的宠物女恶魔去对付这片土地上那些较弱的小崽子，你应该能睡得更安稳些。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,602,1);
         }
         else
         {
            outputText("[say: 好吧，他们就归你处置了，要打要玩随你，] 霍莉眨了眨眼说道。你瞪了她一眼，她耸耸肩回应。[say: 怎么了？我懂的！你们凡人睡着的时候根本没法打架。]");
            outputText("[pg]一个警告的眼神就让她立刻闭上了嘴。要是能让她开口前先动动脑子就好了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,602,0);
         }
         menu();
         _g = this;
         addButton(0,"下一步",function():void
         {
            _g.treeMenu();
         });
      }
      
      public function threatenHolli() : void
      {
         clearOutput();
         outputText("你龇牙低吼，威胁说，如果这个长着树皮的婊子在你礼貌开口之后还不肯派上用场，你就把她烧成灰。");
         outputText("[pg][say: 你拿火来威胁我？！现在？[name]，你本可以把我的幼苗连根拔起，丢进火里。你本可以点起一堆篝火，把我的花烧成灰烬。你甚至本可以在我的树还年幼时召来魔法，把它付之一炬。现在？我的树皮比铁还坚硬，并且充盈着一位焕发活力的女神的力量。在玛莱把这么多时间和能量投入到送给你的礼物之前，你有很多机会摆脱我。可现在若想毁掉这样一份私人赠礼，就会引来她的注意……还有她的怒火。]");
         outputText("[pg]这话确实很有说服力。");
         if(get_player().level < 30)
         {
            outputText("尽管你很强大，玛莱很可能仍然超出你的能力范围。也许你暂时还是该别理这个恶魔。");
         }
         else
         {
            outputText("玛莱眼下很可能仍在你能力之外，不过……你觉得，如果你能做出足够可信的威胁，她或许不会把你逼得太紧。");
         }
         outputText("[pg][say: 现在，我希望你能安心地知道，无论如何，我都会牢牢待在我的树里。当你试图入睡时，看着这片土地上的害虫爬过你的铺盖，正好可以作为你无礼行径的补偿。]");
         if(get_camp().campGuarded())
         {
            outputText("[pg]随便吧。她想看到那一幕还得等很久；你的后方已经有人看着了。你做了个不屑而明确的手势，把这个沾沾自喜的树栖恶魔留在身后。");
         }
         outputText("[pg]<b>也许下次她拒绝守卫营地时，你就该直接扇她一巴掌，然后照样赌一把运气。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,924,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stayQuietWhileAmilyBitchesAboutFuckingArborday() : void
      {
         clearOutput();
         outputText("艾米莉又斥责了你好一阵，随后盯着你看。你刚要开口，她又一次打断了你。");
         outputText("[pg][say: 我不会再待在这里了。也许等你搬走，或者把这里清理干净之后，我会回来……也可能不会。我想，这取决于你还要坚持带多少恶魔回家，还要跟它们上床。]");
         outputText("[pg]她冷冷地转过身离开，尾巴从你身边甩过。你不禁琢磨，她最后那番话到底有几分真心。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,599,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,173,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         if(get_player().get_pregnancyType() == 11)
         {
            get_player().knockUpForce(4,get_player().get_pregnancyIncubation());
         }
         doNext(playerMenu);
      }
      
      public function slapDatHo() : void
      {
         var output1:Boolean;
         var _g:HolliScene;
         clearOutput();
         outputText("你一巴掌拍在树中荡妇的大腿上，震得她全身荡起一阵波动；她冷笑着看着你，确信她先前暗示过的事——在她和她母亲之间，只有蠢货才会动手——足以阻止你用武力把她移除。如果你足够强大，也许仍然能办到，但……她体内正流淌着一位恶魔“女神”的能量。在诉诸公开对抗之前，你最好<b>非常</b>确信自己有把握，否则你的营地可能会变得无法居住。");
         outputText("[pg][say: 你想要什么，肉块？来玩的吗？]");
         menu();
         addButton(0,"砍倒她",cutHerDown);
         if(get_player().hasKeyItem("Jojo\'s Talisman"))
         {
            addButton(1,"叫乔乔",callDatJojo);
         }
         _g = this;
         output1 = true;
         addButton(4,"无视",function():void
         {
            _g.treeMenu(output1);
         });
      }
      
      public function slapAmilysWhoreFace() : void
      {
         clearOutput();
         outputText("你一巴掌扇在艾米莉的");
         if(get_amilyScene().amilyFurry())
         {
            outputText("鼻子上");
         }
         else
         {
            outputText("脸上");
         }
         outputText("[pg][say: 我做什么、和谁做，跟你没关系，]你说道。[say: 如果我们经历了这么多之后，你还是不相信我不会落入恶魔的圈套，那也太糟了。]");
         outputText("[pg]她看起来既受伤又愤怒，但更多的是难过。[say: 对不起，]");
         if(get_amilyScene().amilyFurry())
         {
            outputText("鼠-");
         }
         outputText("女孩眼中噙着泪水，说道，[say: 但我确实不相信。再见。]");
         outputText("[pg]她没有再说一句话，转身收拾好自己的东西，离开了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         doNext(playerMenu);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rideTheWalrusP3() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你抬眼看向藏在上方枝叶间的触手，它们在树冠里穿行，彼此淫靡地扭缠着。你把[armor]脱成一堆没用的东西，裸露出身体，诱人地捧起自己的[chest]，朝树上吹了声口哨。你的呼唤似乎全落在了聋子耳中；那些旋动的藤蔓依旧待在高处。它们竟然无视了你这具美味的女性肉体！你有些恼火，重重走到树干上的花朵前，一拳捅了进去。新鲜的液体喷涌而出，洒在你的护甲上，迸散出一股甜腻而带着麝香味的润滑液。你用手指在那柔韧的植物小穴里盲目摸索，每当柔软的腔壁紧紧夹住你的手臂时，你都会忍不住咯咯发笑。不管这东西是什么，它显然能感受到快感。");
         outputText("[pg]为了挑逗它，你不停抽送，直到清澈黏液像瀑布一样顺着树皮淌下，里面厚重的褶皱紧紧夹住你的前臂。内部更小的触手缠上你的指尖，像把它们当成小肉棒一样无意识地套弄着。你露出坏笑，故意慢吞吞地把手臂抽出来，无视那股想把你吸回去的饥渴吮力，也不理会追着你探出的扭动卷须。现在你已经让这只堕化生物变得更能共情了，你向上方的藤蔓张开双臂，呼唤它们：[say: 来吧，下来玩玩。我们都想要这个。]");
         outputText("[pg]这一次，卷须们确实有了反应，它们在你周围围成一圈垂落下来，抬起紫色而胀大的尖端嗅闻着空气。至少看起来是这样——你也不确定一根能卷曲的阴茎究竟怎么闻得到你，但它们蹭上你沾满淫液的手腕，仿佛被小穴的麝香味灌醉了一样。你温柔地握住其中一根，欣赏着那光滑的茎身，以及点缀其上的细小血管般纹理。作为回应，它挤出一团清澈的先列腺液，沿着下侧缓缓滚到你的掌心。你笑得更开了，把它拉低到你女性三角地带的交界处，在自己逐渐湿滑的唇瓣上来回摩擦。你炽热淫液的触碰似乎让这些懒洋洋的鸡巴蛇精神一振，它们齐齐开始缠上你的四肢，朝你的腰胯和沾污的手臂聚拢过来。");
         outputText("[pg]你甜甜地叹了口气，张开双臂，任由这些意外灵巧的触须占有你。一根触手缠过你的腰腹，向下探向已经被它宣示主权的[vagina]，以温柔却紧实的力道箍住你。三根翠绿藤蔓勾住你的腋下，其中两根在湿漉漉的一侧，另一根则缠住你干燥、没有气味的手臂。它们真的很喜欢阴户的味道，哪怕那味道来自它们自己。一大团藤蔓聚集在你的[legs]周围，等它们把你牢牢缠住，整群便开始把你举了起来。担忧的颤栗掠过你的胃部，但[vagina]里缓慢而温柔的顶弄，很大程度上安抚了你的不安。另一根更小的肉棒绕着它幸运的兄弟打转，尖端执拗地抵在你的[clit]上，而第一根则慢慢侵入你体内。");
         get_player().cuntChange(15,true,true,false);
         outputText("[pg]你的[nipples]硬了起来；究竟是因为被插入、满溢的性爱气味，还是那些抚摸身体的藤蔓，你也说不清。又有几圈植物肉棒环绕住你，多到让你开始怀疑，蛇的猎物被光滑的 coils 紧紧缠住、贴合身体每一处曲线时，是否就是这种感觉。那根被你引入[vagina]的触手开始缓慢抽动，以近乎精细的慢速操弄你。湿滑肉茎的表面被你的欲望润得发亮，在你体内愉悦地蠕动，做出一连串不自然的旋转，仿佛一场怪异的芭蕾，让你觉得自己正坐在性快感的龙卷风顶端。再加上无数圈藤蔓滑过你敏感的乳头，你仰起头，毫不压抑地发出欢愉的呻吟。");
         outputText("[pg]一根勤快的器具向后仰起，随后猛地刺过你张开的嘴唇，越过你乱动的舌头，深深捅进你的喉咙。这一下堵住了你的声音，把呻吟变成微弱的“唔嗯”，而当那根扭动的肉棒插得更深时，连这点声音也彻底断掉。它先把露在外面的粗大部分绕过你的头，遮住你的视线，接着又向下缠住你的脖子。它很快收紧，把你被侵犯的喉咙勒得更紧，变成供它抽插的肉棒套。成股绳状的植物精液顺着那条管道般的肉棒向下推进，把它撑胀到你能在舌头上感受到它从体内经过的程度。你尝不到那东西的味道，因为它正直接注入你的肚子里，但你能感觉到它流过你的身体，用温热黏稠的植物精液把你灌满。");
         outputText("[pg]与此同时，在下方，你湿透的小穴正随着缓慢而规律的插入发出淫靡的黏响。其他触手也像虫子一样向前蠕动，先是一根，接着又一根，找到了进入你松开的阴户的路。你被撑开到几乎有些难受，但三根肉棒以不同节奏进进出出，在你敏感的肉壁上和彼此之间扭动滑行，快感很快淹没了不适。你在束缚中扭动，[vagina]屈服于它们无情而毫不犹豫的占有；你呻吟着，声音被堵得模糊不清，双眼向上翻去。你的双手漫不经心地开始抚摸最近的肉棒，很快便彻底沉溺在它们的爱抚之中。");
         outputText("[pg]你被吊在树上，时间长得仿佛没有尽头。尽管一根阴茎从喉咙一路顶到肚子里，你却不知为何仍能呼吸；你的小穴被彻底侵犯，而你的双手仿佛自有意志般照料着那些尚未满足的肉棒。又或者，你只是享受被这么多雄性肉体包围，一边取悦它们，一边被当作渴求精液的泄欲肉洞。也许是精液里的某种东西，也许是你承受的一次次高潮，让你的脑袋变得昏沉。当第一根占有你阴户的触手胀大并释放出它的精液时，你短暂地失去了意识。");
         outputText("[pg]视线朦胧而摇晃，你睁开眼，看见一个颠倒的世界。你仍被悬在触手之间，身体彻底覆盖着象牙白的精液。道道白浆从你身上滴落，你漫不经心地捏了捏一根触手；当它又挤出新鲜样本，把你浸得更湿时，你含着喉咙里的肉棒咯咯笑了起来。你的肚子里满是精液和扭动的卷须，任何有幸透过束缚瞥见的人都能看得一清二楚。从另一侧进入的至少两根肉棒缠成肛门里的双螺旋，借着顺着你[butt]流下的大量精液润滑着通道。你再次颤抖，四肢几乎没剩下力气，连高潮也虚弱无力。那场高潮和你一样疲惫而衰弱，与一开始那种美妙感受相比，几乎不值一提。");
         outputText("[pg]你在无声的快感中承受着这一切，眼神空洞而恍惚。你的大脑停摆，身体只是软弱地垂着。至于那些触手，则继续以近乎不健康的热情占有你，你的身体被越来越多精液糊满，直到在滴落的白浆和起伏的蛇形轮廓之下，几乎看不清你的身形。之后到来的高潮可怜又凄惨，只是快感的微弱标点，甚至无法驱使你懒散无力的肌肉动弹一下。");
         outputText("[pg]不知过了多久，你被放回地面，又被喷上一层新鲜的种子。你在那里躺了一会儿，直到终于能喘匀气，也能在不感到疼痛的情况下移动。当你开始试着清理时，你发现那摊精液已经完全不见了，大概是被这棵树饥饿的根重新吞了回去，剩下的唯一污迹就是你湿透的[skindesc]。你穿好衣服，带着几分醉意踉跄离开，[vagina]又酸又痛，还在不断渗出液体。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-5));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) < 1000)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,597,FlagDict_Impl_.arrayReadInt(_loc1_,597) + 5);
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,595,FlagDict_Impl_.arrayReadInt(_loc1_,595) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rideDatFuckingFukkFlowerP2() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你脱下[armor]，缓缓靠近那只泛着紫罗兰色的生物。你刚走到几英尺之内，花朵的球茎便朝你倾斜过来，花瓣和内部的雄蕊一起微微扭动。甚至有几根像渴望触碰的指尖一样朝你伸来，因为用力而轻轻颤抖，随后又滑回里面。看到这一幕，你[vagina]里隐隐的胀痛变得更加灼热，身体也因即将到来的交合而兴奋得发烫。你将谨慎抛到脑后，自信地摆动着[hips]向前走去。是时候接受授粉了。");
         outputText("[pg]你抓住这株植物，把它拉到自己的阴阜前，轻轻叹了口气。丝滑柔软的花瓣贴平在你的大腿上，瓣尖卷起，触到你[butt]的两侧，并用润滑的水汽将其打湿。你松开手，花朵却牢牢贴住你的[hips]，坚定地拥抱着你，同时它的雄蕊开始在你的阴户上游走。慢慢地，一根大胆的触须探入你的阴唇之间，钻进那条早已准备好被蠕动快感填满的湿滑通道。最初那几下试探性的触碰，便让一缕新鲜液体涌出。受到成功鼓舞，雄蕊的兄弟们也加入了这场湿滑的派对，刺入你的小穴，并立刻在你的内壁上旋转游走。");
         outputText("[pg]突如其来的感官冲击毫不留情地驱使着你，你仰面摔倒在地，但那朵花也跟着你一起倒下，仍牢牢咬在你的[hips]上，完全没有松开的迹象。旋转的触须在你体内扭成一场极乐的龙卷，而那股快感，那可怕而无法阻挡的快感，把你的肌肉绞得紧绷成结。它们本能地抽搐着，将你的下唇抬得更高，仿佛这样就能让贯入变得更深。其中一根触须缩了回去，带出一股湿滑的淫液。随后，它缠上你的[clit]，在那颗过分敏感的小核上越收越紧，紧得仿佛随时都会胀开。");
         if(get_player().getClitLength() > 4)
         {
            outputText("你沉甸甸的嗡鸣蒂大得惊人，柔韧的植物肉棒有足够的空间缠绕其上。如果你能看见的话，你的阴蒂看起来简直就像一根拐杖糖（前提是其中一组条纹正在给下面那根糖棒撸动）。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("[EachCock]很快都有了自己的搭档，一根沾满淫液的藤蔓缠绕其上，沿着它的粗茎套弄盘旋。");
         }
         outputText("[pg]无处安放的双手在你的[skinfurscales]上游移，滑向你的");
         if(get_player().bRows() > 1)
         {
            outputText("最下面一排乳房，托住它们，又一路揉捏到最上面一排乳房");
         }
         else
         {
            outputText("[chest]");
         }
         outputText("，爱抚着");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("它们的");
         }
         outputText("隆起，同时寻找因欲望而绷紧的[nipples]。它们似乎几乎和小小的阴蒂一样敏感，而你一找到它们，就立刻开始缓慢地打着圈揉弄；每当某股格外强烈的快感贯穿你这具被愉悦折磨的身体时，你还会偶尔拉扯、扭动它们。");
         if(get_player().lactationQ() > 50)
         {
            outputText("紧接着，它们开始一个接一个地");
            if(get_player().lactationQ() < 150)
            {
               outputText("渗出");
            }
            else if(get_player().lactationQ() < 500)
            {
               outputText("流出");
            }
            else
            {
               outputText("喷涌出大量");
            }
            outputText("乳汁。");
         }
         outputText("你毫不掩饰地愉悦呻吟着，两声呻吟之间，嘴巴还会无意识地张成幸福的“o”形。如果家乡的朋友们现在能看见你，看见你在泥地里扭动，脸上满是单纯而兽性的快感，或许最糟的是，还在和一株植物交合，你恐怕会因");
         if(!get_game().ceraphScene.hasExhibition() && get_player().cor + get_player().lib < 150)
         {
            outputText("羞耻");
         }
         else
         {
            outputText("欲火焚身");
         }
         outputText("。");
         outputText("[pg]这个念头竟然还牢牢留在你饱受冲击的意识里，而你随即迎来一场足以击溃理智的高潮；双眼狂乱上翻，全身每一块肌肉都在同一次狂喜的抽搐中绷紧。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]在释放中爆发，将沉甸甸的精液一股股射进花瓣里，与此同时，你");
         }
         else
         {
            outputText("你");
         }
         outputText("颤抖的小穴早已湿透，将你最后一波淫液化作一阵湿淋淋的");
         if(get_player().cumQ() < 50)
         {
            outputText("细雨");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("水流");
         }
         else if(get_player().cumQ() < 750)
         {
            outputText("喷溅");
         }
         else
         {
            outputText("洪流");
         }
         outputText("。你体内的触手蜷作一团，慢慢从被精液糊满的小穴里退出来，尽可能从你过度敏感的蜜穴中刮出更多液体。缠在你[clit]上的束缚松开了，这当然又在你的阴户里激起一整波层层荡开的快感收缩。");
         get_player().orgasm("VaginalAnal");
         outputText("[pg]这一切让你神魂颠倒，身体慢慢放松，重新沉回地面。那朵交合花肉眼可见地吞咽着你的淫液，茎上鼓起了一块。它带着饥渴的啵声脱离开来，在彻底缩回之前，它的黏液还一瞬间在你和植物之间拉成了丝网。那株堕化的绿植动作渐渐慢了下来，恢复成先前平静张开的状态，朝向天空。你能看见里面那些触手般的雄蕊仍在扭动，但它们现在似乎有些无力。你的[vagina]因回想起它们的爱抚而抽动，你不禁想着下次什么时候再来享用这份奇妙的馈赠。");
         dynStats(DynStat.Cor(1));
         get_player().changeFatigue(5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,595,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) < 1000)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,597,FlagDict_Impl_.arrayReadInt(_loc1_,597) + 4);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function reset() : void
      {
         saveContent.askedGlades = false;
         saveContent.growingGlades = false;
         saveContent.fruitsEaten = 0;
      }
      
      public function recruitJojoToCamp() : void
      {
         clearOutput();
         outputText("当你邀请乔乔与你共享营地时，他热切地点了点头。[say: 好主意。失陪一下，我想先试着净化那个生物生长过的地方，然后再去取我的东西。]");
         outputText("[pg]他利落地一鞠躬，随后告辞离去。");
         get_player().createStatusEffect(StatusEffects.PureCampJojo,0,0,0,0);
         outputText("[pg](获得关键物品：霍莉的灰烬)");
         get_player().createKeyItem("Holli\'s Ashes",0,0,0,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noPlzDontFuckWithFarm() : void
      {
         clearOutput();
         outputText("[say: 真是个善变的凡人，] 她叹了口气。[say: 不过我是个仁慈的女神。只要你……完成了仪式，随时都可以来求我。]");
         treeMenu(false);
      }
      
      public function makeUpSomething() : void
      {
         clearOutput();
         outputText("你任由艾米莉把这通怒火发泄完。她喘着气，双臂抱胸，盯着你看，像是有一半期待你开口，又有一半以为你只会目瞪口呆地站在那儿。");
         outputText("[pg]你吸了口气，准备开始解释，而她试图打断你。你用近乎恳求的眼神看着她，她停了下来。尽管那棵树的本质令人厌恶，她还是认为你至少该有一次解释的机会。");
         outputText("[pg]你急中生智，当场编了个故事。你告诉她工厂里发生的事，并解释说，玛莱虽然已经被腐化，却给了你一个无法拒绝的提议。作为不毁掉你和营地的交换，你必须不断取悦那棵怪物般的树。你告诉她，你还不够强大，没法正面对抗玛莱本人，所以眼下只能陪她玩这场令人不安的游戏。");
         outputText("[pg]艾米莉眯起眼睛，低下头，审视着你的说辞。有那么一瞬间，你以为她会当场揭穿你的谎言，但她只是叹了口气。[say: 这对我来说很难相信，但就算你见过玛莱，也接触过那棵恶心的树，你仍然没有被腐化。我选择接受这个借口，[name]。希望我的信任没有放错地方。但如果你是在当着我的面撒谎，而且没有腐化的污秽扭曲你的想法，只是为了把这个恶心的东西留在这里供你发泄……那你比某些恶魔还要糟糕。我接受不了。我绝不会接受。]");
         outputText("[pg]你松了口气，向她保证自己说的都是真的。她露出一个勉强而悲伤的微笑，然后离开了。你的心揪了起来，不禁怀疑这样的谎言到底值不值得。你尽力把这些念头甩出脑海。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2653,1);
         doNext(playerMenu);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function level4RideHollisTentacruels() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         outputText("你心照不宣地坏笑着，向霍莉提议让她带你“骑一程”……如果她懂你的意思的话。这让那位欣喜的恶魔树妖开心地鼓起掌来，她立刻开始帮你脱衣服；热切的触手从树上垂下，又像搜寻猎物的蛇一样拱起。你以女神般的耐心任由她脱下你的[armor]，当黏着的装备从你早已急不可耐的下身剥离时，你微微一颤。");
         outputText("[pg][say: 哦，你一定会爱上这个的，[name]，]恶魔树如此保证道，[say: 只要躺进我的触手里，让我来动就好。你会舒服到再也不想离开。]");
         outputText("[pg]你不耐烦地把双臂抱在[chest]前，点了点头，等她把那些阳具般的卷须摆好位置。可你完全没料到，半打触手猛地抽过你的身前，另一束则扫开你的[legs]，把你转得脸朝下看向地面，整个人横躺在一张绷紧、用力支撑的触手床上。更多触手从你身上、身下和周围缠绕过来，紧紧勒住你的手腕和[feet]。它们把你的四肢拉开，而其他能抓握的植物则垂下来支撑住你，不时绕着你打圈，湿润的表皮轻易地滑过你的[skinfurscales]。都这样了，她甚至还没开始操你！");
         outputText("[pg]你想抬头瞪她，可一仰脸，迎面而来的却是一整张花朵小穴。你打着喷嚏，摇摇头想挣开，但此刻你根本控制不了自己的姿势。你唯一做到的，就是把雌性的黏液抹得满脸都是，又让鼻尖沾上一层新鲜花粉，惹得你再次一阵狂打喷嚏。[say: 这才不是我啊——啊啊——阿嚏！……想要的！]你大吼道，然而一片厚实而搏动的褶瓣很快就要遮住你的嘴。");
         outputText("[pg]一只手居高临下般拍了拍你的头，霍莉答道：[say: 亲爱的，一点前戏又不会伤着谁。我只是觉得，让你尝尝我的花粉，也许能让你更享受一点。玛莱说它对哺乳动物有些有趣的效果。]那只手及时移开，随即她的声音宣布道：[say: 好了，回到正题！]");
         if(get_silly())
         {
            outputText("她接着足足唱了十分钟杰克·斯派洛的精彩冒险，然后又像什么都没发生过一样继续下去。");
         }
         outputText("[pg]一滴滚热的液体滴到你的[butt]上，片刻后，又有更大一滩先列腺液溅落下来。你在束缚中扭动，想设法看一眼，却被一阵眩晕夺走了任何成功的机会。你晕乎乎地倒回那湿漉漉的花朵小穴上，无意间又从一个位于人类阴蒂位置的凸起处吸入了更多花粉。它已经不怎么刺激了，事实上，闻起来还挺好。你忘了正落到[butt]上的先列腺液，凑近那个形似阴蒂的花粉释放器，又嗅了一口。感觉还挺不错，只是它让你口水分泌得厉害——唾液甚至像河水一样从你呆滞张开的嘴里淌出来，直到你意识到自己在做什么，才合上嘴巴，拼命吞咽。");
         outputText("[pg]一阵强烈程度宛如烟火爆开的快感在你的下体唇瓣间炸开，把你从药物般的恍惚中震醒。胀痛的饱满感从你的[vagina]向外扩散，伴随着一阵阵痉挛般的愉悦；这一切来自两件工具，它们彼此缠绕成螺旋状。它们像一根巨大的肉棒般操弄着你，以强劲有力的抽插顶向你的子宫颈，把你的[legs]弄得软成一滩。大量淫液溅洒在你身下的荒地泥土上，而那对并排的肉茎继续蹂躏你，越来越多的雌性体液汩汩涌出。你湿得简直像每一次挺入都在喷水，没过多久，身下就形成了一滩水洼，并随着每一次活塞般对[vagina]的深顶而不断扩大。");
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]花朵上鲜艳的紫、粉与红变得更加明亮浓烈。霍莉什么时候学会生物发光了？你勉强压住一声傻笑，结果只发出一声哼哧，然后转向那枚鲜红、沾满花粉的花苞。你几乎不需要任何鼓励，就张大嘴把它吞入口中，可前几次还是没对准，反倒把那些东西结结实实地抹了满脸。花粉美味极了，而当你把它舔干净时，又得以品尝到下方更甜的花蜜。你的唾液从茎身流下，沿着内侧唇瓣垂成一道水帘，毫不受你灵巧嘴唇的阻碍。与此同时，你还察觉到");
         if(get_player().lactationQ() == 0)
         {
            outputText("有乳滴正从你的乳头滴落。你是什么时候开始泌乳的？");
         }
         else
         {
            outputText("有稳定的乳流正从你的乳头喷涌而出。你什么时候泌乳得这么厉害了？");
         }
         outputText("[pg][say: 操奶子的玛莱啊！这玩意儿让你湿成这样了，对吧？而且还是两头一起湿！]霍莉欢呼道。她的手抓住你的头，把你更深地按进她的阴户里；你会意后，开始舔舐并发出含糊的哼声。你的口水让本就湿滑凌乱的小穴变成了一条泛着泡沫的河床，当然，其中一部分额外的湿意也来自里面。有时你会吞下一股格外美味的喷涌；有时你的嘴里已经满是唾液，再也容不下更多液体，便一边吮吸那敏感的小凸起，一边把滑腻的液体喷洒在它周围。恶魔树女咯咯笑道：[say: 好姑娘……我打赌这样还能再塞两根触手进你身体里，说不定还能尝尝母亲大人一直念叨的那种甜甜的哺乳动物奶水。]");
         outputText("[pg]一组末端像捕虫瓶的根须从下方泥泞的水洼中钻出，在你的乳流里欢快地扭动着向上爬。它们没花多久就找到了你的[nipples]，并吸附了上去。事实上，它们几乎立刻开始吸吮，以令人舒适的断续节奏深深抽吸、制造真空。你不断漏奶的乳头猛烈地开始喷乳，几乎不费力就涌出惊人的奶量，被这个植物荡妇开心地吸了个干净。她评价道：[say: 这……嗯……真不错，]随后开始喘息，显然很享受你那迷糊又湿乱的口交尝试，以及她的触手双管齐下操弄你被塞得满满的小穴所带来的感觉。");
         outputText("[pg]被唾液浸透的阴蒂在你嘴里膨胀起来，植物女人达到高潮时，下方的褶瓣间涌出一股液汁洪流。在你的肉穴里，其中一根植物肉茎痉挛着从它的同伴上解开螺旋，滑出你温暖、流着乳白液体的小穴，把最后一股精液喷洒在你汩汩流淌的下体唇瓣上。另一根取而代之，紧接着，第一根怪物般的阳具也喷出它自己浓稠的爱液，同样抽离出来，用一波精液糊满你。又一次，一根新鲜的肉棒钻进你湿透的性器，如此循环一遍又一遍地重复——一根射精、抽出，然后被替换。接着，另一根又顶上来。你的[vagina]被如此高效地轮番接力，以至于你在这场子宫内射精雨中高潮了，润滑液呈扇形喷洒到下方，而你的臀部只能徒劳地扭动。");
         outputText("[pg]从你乳头喷出的奶水骤然加倍，喷涌的速度快到把那些瓶状根须都从你的[chest]上冲开，下方的水洼也变得更深，逐渐化作一片白浊，就像你被精液糊满的下身一样。一团粉色的欲望云雾笼罩了你的大脑，高潮刚一退去，你就立刻继续舔食那湿润、黏腻的小穴。不知何时，触手又把第三根插入物加入轮换，把你又咸又滑的阴户撑得更开。花朵的色彩变得鲜艳到难以用语言形容，整个世界似乎旋转得太快，已经没有上下之分，只剩舔舐、高潮和喷水。");
         outputText("[pg]<b>一小时后……</b>");
         outputText("[pg]你醒来时，发现自己浑身沾满了女汁和精液，躺在树根处。霍莉不见踪影，十有八九是躲在树皮后面休息去了。她把你折腾得够呛——");
         if(!get_player().isBiped())
         {
            outputText("如果你有腿的话，接下来一周走路都会像罗圈腿一样。");
         }
         else
         {
            outputText("接下来一周你走路都会像罗圈腿一样！");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(2),DynStat.Cor(1));
         fertilizeHolli(false);
         get_player().slimeFeed();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,595,FlagDict_Impl_.arrayReadInt(_loc1_,595) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function letZeFuckingSproutLive() : void
      {
         clearOutput();
         outputText("低头看着这株树苗，你压下了怒火。它或许受到了腐化，但至少到目前为止还没有伤害你。你轻轻拍了拍它最上方的叶片，任由它待在那里。反正它又不会跑到哪儿去。");
         outputText("[pg](<b>“植物”已添加到你的物品菜单</b>。它还太小，暂时看不出会长成什么。你现在可以随时把它移除。)");
         doNext(playerMenu);
      }
      
      public function holliTalkSeedsReject() : void
      {
         clearOutput();
         outputText("你猛地移开视线，踉跄着向后退去。你不知道自己究竟做了什么，[if (cor < 66) {也许你甚至|但你实在}]不在乎——你现在只必须立刻离开她，管它什么种子不种子。");
         outputText("[pg]当你从她的树边退开时，听见霍莉在身后呼唤你。[say:[if (hollidom) {你会回到我身边的，[name]。你抗拒不了。|求你了，[name]！过来，让我把一切都变好！}]");
         outputText("[pg]你尽力捂住耳朵，努力不去想任何事。也许只要你足够用力，就能把这一切彻底忘掉。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function holliTalkSeedsEmbrace() : void
      {
         clearOutput();
         outputText("你呼出一口气，身体也随之平静下来。此刻，树妖的怀抱看起来简直是世上最舒适的地方，于是你[if (singleleg) {滑|迈}]上前去，投入她的双臂。她的肌肤触碰到[if (hasplainskin) {你的肌肤|你的[skindesc]}]时，喉间吐出一声轻柔的满足低吟，而你也忍不住发出同样满足的叹息。");
         outputText("[pg]但她的拥抱并没有让你疲倦，反而温暖得令人兴奋。血液涌向你的下身，你的脸开始发烫；甚至在她的藤蔓沿着你身体两侧蜿蜒而上、轻抚你的身躯之前，期待感就已经撩拨着你的神经。你感觉有一双手托住你的下巴，引导你的视线向上、向上、再向上，直到与你的目光相交。");
         outputText("[pg]那对旋动的黑色深潭将你彻底迷住。[say:[if (hollidom) {分享我的馈赠吧|请让我取悦你}]，[name]。把你的精种给我。]你短暂地想了想，如果真有哪怕一丁点的自己想要拒绝这请求，你是否真的做得到。");
         dynStats(DynStat.Lust(50));
         holliSexMenu();
         button(14).hide();
      }
      
      public function holliTalkSeeds() : void
      {
         clearOutput();
         outputText("你这才意识到，自己一直都是吃完霍莉的果实后就把果核随手丢掉，可那些果核里有种子。更何况，她会结出果实这件事本身就意味着她正在以某种方式扩散自己；但除了她在你营地周围催生出的普通植被之外，你从未见过任何哪怕稍微接近她或她那棵树的存在。");
         outputText("[pg]树妖似乎察觉到了你声音里的几分担忧，回答道：[say:不必担心，勇者，你正在滋养这片土地。]她说话时，声音中带着[if (hollidom) {一丝嘲弄|令人安宁的平静}]，[if (hollidom) {但|而}]你发现自己正慢慢屈服于那种甜腻的影响。[say:你的努力并没有白费，这点你大可放心。你配得上母亲大人的慈爱。]");
         outputText("[pg]在你看来，她像是在回避问题。你摇了摇头，要求她给出一个明确的答案——那些种子最后会怎么样？");
         outputText("[pg]霍莉辛西娅微微一笑。[say:它们回归大地，你的力量也融入其中。我们的伟大母亲接纳一切献礼。她就是土地，而行走于其上的一切都属于她。哦，不过我想你要的答案应该比这更具体些。嗯。我记得凡人之中有句谚语，“当一个人种下一棵明知自己永远无法坐在其荫下乘凉的树时，他才开始真正领悟生命的意义。”大概就是这个意思。]");
         outputText("[pg][if (cor < 66) {你的心脏猛地一紧，呼吸也稍稍急促起来|某种遥远的不祥预感压在你心头}]。她是什么意思？");
         outputText("[pg]霍莉噘起嘴，眨了眨眼。[say:别担心，[name]，什么都不用担心。过来吧，我会安慰你的。]她向两侧张开双臂，朝你露出温暖的笑容。");
         menu();
         addNextButton("拥抱",holliTalkSeedsEmbrace).hint("一切都很好。");
         addNextButton("拒绝",holliTalkSeedsReject).hint("你现在不能留在这里。");
      }
      
      public function holliTalkRooted() : void
      {
         clearOutput();
         outputText("她这一生——尽管这段时间或许很短——都待在这同一个地方。你很难感同身受，但你想，处在她那样的位置上，或许会感到孤独，或渴望逃离。她会吗？");
         outputText("[pg]作为回应，这位恶魔树妖只是咯咯一笑。[say:不，一点也不。[if (hollidom) {如果我不高兴，我自然会让你知道|我从没想过要离开你}]。]她转向一侧，似乎在打量自己树上的一根旁枝。她看起来并没有继续解释的兴趣，但你仍然好奇，于是又问了一遍，这次更明确地问起她对此的感受。");
         outputText("[pg][say:嗯？]她扬起眉毛，看起来她可能真的不明白你的意思。她难道真的从不会因为无法移动而难过吗？不会因为不能和你营地之外的任何人说话而难过吗？不会因为与世界隔绝而难过吗？");
         outputText("[pg][say:啊。不，我并不会为此难过，因为我并没有与任何东西隔绝。]她轻哼一声。[say:[if (hollidom) {听你这么说甚至还有点好笑——情况恰恰相反。[i:你]能感受到身边的大地吗？[i:你]能向外伸展枝条，让手指无形地拂过这片土地吗？|别担心我，我可是相当紧密地连结着。连结着大地，连结着玛莱，也在可能的时候，连结着[i:你]。}]]她露出一个俏皮的坏笑。[say:相信我，[name]，我并不孤独，不过这并不代表我不会喜欢你的“陪伴”。]");
         doNext(holliTalkMenu);
      }
      
      public function holliTalkReproduction() : void
      {
         clearOutput();
         outputText("霍莉一直很执着地想要你的“体液”，但" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,601) != 0 ? "她从来没产出过枝头果实以外的东西" : "这事从没结出过成果") + "。她真的不会怀孕吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,601) != 0)
         {
            outputText("[pg]她叹了口气。[say:不，[name]，我不能以你想要的那种方式繁衍，]她说道，不过你看不出她脸上的神情究竟是失望还是恼怒。[say:我与你并非同类。我所能献上的只有我的丰饶，若它不合你的心意，那[if (hollidom) {就是你的问题|我也很乐意用别的方式取悦你}]。]");
         }
         else
         {
            outputText("[pg]她露出一抹坏笑。[say:不是吗？] 她抬起手，满怀爱意地轻抚着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) > 0 ? "一颗挂在她枝头的饱满果实" : "自己的一根枝条") + "。[say:你的供奉没有白费——它们滋养我、壮大我的力量，并" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) > 0 ? "" : "且假以时日，也能") + "让我为你结出果实。它们是我的献礼，是女神赐予你的礼物。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,601,1);
         }
         outputText("[pg]好吧，这仍然留下了许多没有回答的问题。它们长得有多快？整个过程究竟是怎样的？她一次能结出多少？她会享受这种“孕育”吗？");
         outputText("[pg][say:是的，我会，]她回答道，眼中闪着灵动的光。你等了片刻，但她的表情清楚表明，她要么不愿回答其他问题，要么根本无法回答。不过……你心底还残留着一个挥之不去的念头。严格来说，它们难道不算是你的孩子吗？");
         outputText("[pg]霍莉只是出乎意料地欢快笑了起来，用一只手掩住嘴。看来你是得不到更多细节了……");
         doNext(holliTalkMenu);
      }
      
      public function holliTalkMenu() : void
      {
         var _g:HolliScene;
         clearOutput();
         outputText("你想和这位恶魔树妖聊什么话题？");
         menu();
         addNextButton("玛莱",holliTalkMarae).hint("问问她关于自己始祖的事。");
         addNextButton("魔法",holliTalkMagic).hint("她究竟是怎么做到那些事的？");
         addNextButton("扎根",holliTalkRooted).hint("她可曾希望自己没有被束缚在那棵树上？");
         addNextButton("繁衍",holliTalkReproduction).hint("问问枝条与树木的事。");
         if(saveContent.fruitsEaten >= 5)
         {
            addNextButton("种子",holliTalkSeeds).hint("你扔掉的果核最后会怎样？");
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.treeMenu();
         });
      }
      
      public function holliTalkMarae() : void
      {
         clearOutput();
         outputText("霍莉第一次来到你身边时，曾提到她是玛莱送来的礼物，可她真的认识自己的母亲吗？");
         outputText("[pg][say:我现在这个样子，可没法去见她，]她说道。[say:被束缚在这棵树上终究还是有其限制。我想我的确想见见母亲大人，虽说她这些日子有点……“喜怒无常”。]");
         outputText("[pg]那么，她一开始又是怎么知晓女神意志的？她能以某种方式与女神交流吗？");
         outputText("[pg]她微微一笑。[say:嗯……是的。从某种意义上说，我们能够交流。我是她的女儿，自诞生起便与她相连。母亲大人玛莱就是世界本身，是万物的源泉，即便已经转变，她的卷须依然深深扎根。我不过是枝头的一枚嫩芽，但地下还有更多更多。若你知晓自己行动所带来的全部后果……]她的神情变得甜美，近乎甜腻，却让你莫名感到不安。[say:那么，你就再也不会想离开我身边这片舒适之地了，]她说完，声音里满是感官的诱惑。");
         outputText("[pg]突如其来的触碰让你一颤，低头一看，只见一根挑逗的卷须正沿着你的侧身蜿蜒而上。");
         outputText("[pg][say:不过，先再靠近一点点，就是个很美妙的开始了……]");
         doNext(holliTalkMenu);
      }
      
      public function holliTalkMagic() : void
      {
         clearOutput();
         outputText("霍莉辛西娅似乎拥有一种不可思议的能力，能够孕育新的生命，你很好奇这一切究竟是如何运作的。她是在使用某种魔法吗？");
         outputText("[pg]她思索了你的话片刻，脸上带着一丝困惑。[say:嗯，]她说道，[say:也不完全是。我又不是什么古板的老巫师——我只是知道该怎么做而已。]");
         outputText("[pg]那她有没有办法教你做些类似的事？");
         outputText("[pg]她对你微微一笑[if (hollidom) {，只是眼中带着些许嘲弄|，笑容甜美}]。[saystart][if (hollidom) {怎么，我还不够让你满意吗？|恐怕不行，[name]。}]这么说吧，那并不是我能够给予你的天赋。也许如果你本来就具备某种能力，我还能引导你，但现在这样……我无能为力。");
         outputText("[pg]而且，[sayend]她柔声说道，[say:我更愿意把我们共处的时间用来和你做爱。]说完这句大胆的宣言，她挺了挺胸，一根手指向后弯起，搭在脸颊上。");
         doNext(holliTalkMenu);
      }
      
      public function holliSprite() : void
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596))
         {
            case 1:
               spriteSelect(SpriteDb.get_s_holliSapling());
               break;
            case 2:
               spriteSelect(SpriteDb.get_s_holliFlower());
               break;
            case 3:
               spriteSelect(SpriteDb.get_s_holliTree());
               break;
            case 4:
               spriteSelect(SpriteDb.get_s_holli());
         }
      }
      
      public function holliSexMenu() : void
      {
         var _g:HolliScene;
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 0)
         {
            addButton(0,"干霍莉",fuckHolliInZeFlowerPuss).sexButton(1);
            addButton(1,"骑乘触手",level4RideHollisTentacruels).sexButton(2);
         }
         else
         {
            addButton(0,"干霍莉",holliGetsDickDommed).sexButton(1);
            addButton(1,"触手开干",fullOnTentacleTasticGangBangForHolli).sexButton(1).disableIf(get_player().countCocksOfType(CockTypesEnum.TENTACLE) < 10,"你的触手肉棒还不够多。");
            addButton(2,"骑乘霍莉",vaginalDomHollisTentacruels).sexButton(2);
         }
         addNextButton("喝树液",haveAMapleSyrupSnack);
         _g = this;
         setExitButton("返回",function():void
         {
            _g.treeMenu();
         });
      }
      
      public function holliPlaysWithPenisesBadEnd() : void
      {
         clearOutput();
         outputText("那名年轻的棕发女子从旋转的传送门中走出，身后的涡流随即崩塌。她环顾这片被轰击得焦黑开裂的土地，惊讶地发现不远处竟有两棵树；尽管这里缺水、尘土弥漫，它们看上去却依旧健康。起初她还有些戒备，但当她小心靠近，看见最左边那棵树的枝头挂着巨大多汁的果实时，便改变了主意。棕发姑娘觉得，在动用自己的储备之前，先收集并利用能找到的东西<i>确实</i>是明智之举，于是开始朝那两棵奇异的树走去。");
         outputText("[pg]当她走近时，两棵树外层的树皮都顺滑地分开，露出其中的人形身影。其中一位丰满的绿色角美人从结果的树上踏下，向这位邻家女孩般的姑娘伸出双臂，表示欢迎。");
         outputText("[pg][say:你好！你一定就是新的勇者了！我是霍莉辛西娅，是侍奉这片土地女神玛莱的树妖。我在这里扎根，是为了支援那些被迫穿过传送门的人，好让他们站稳脚跟，更好地抵抗恶魔。虽说我确实需要你帮忙守住我的果园，但我仍会尽我所能帮助你。]");
         outputText("[pg]棕发姑娘平静地看着这位树妖。[say:你能怎么帮我？更重要的是，我又该怎么帮你？]");
         outputText("[pg]霍莉指向第二棵树，那道身影始终沉默不语。那是一个");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("男性的轮廓，身上长着");
         }
         else
         {
            outputText("女性的轮廓，却依然长着");
         }
         outputText(get_player().multiCockDescript() + "，正挺立着，硬如钢铁；棕发姑娘脸上一红，移开了视线。");
         outputText("[pg][say:别害羞，勇者，]树妖调笑道。[say:我的同伴就能回答你的两个问题。]她抬手伸向那沉默身影的树枝，折下一根结实的枝条，使那棵树像是吃痛般颤抖起来。树妖将枝条从掌中拉过，木头随之变直，嫩枝与叶片则移动并聚集到顶端附近。[say:拿着这个。我给它注入了一点我的魔力；若你需要食物，可以用它轻点植物，让它结果，或交出花蜜。我也注意到你实在是手无寸铁；在你找到更好的武器之前，它姑且能当一根不错的棍棒。]");
         outputText("[pg]棕发姑娘礼貌地接过递来的手杖，霍莉继续说道。[say:至于你该如何帮助我们……别觉得我太冒昧，但我们最需要的是能量。若你愿意把一部分精力借给我们，那会帮助我们保持强盛。]");
         outputText("[pg][say:那我要怎么做？]最新的勇者反问道。");
         outputText("[pg]树妖再次指向同伴的[cocks]，让棕发姑娘微微张大了嘴。[say:我想不出有多少方式能比这更好地证明你的活力，]霍莉柔声说道。[say:你不必觉得欠了我们什么，但若你愿意分享自己，我们会非常感激。说实话，我是不是也在你眼里看见了一丝渴望？来吧，和[him]结合一会儿，让脑子清醒清醒。]");
         if(get_player().smallestCockArea() > 36)
         {
            outputText("树妖说话间，那沉默身影的[cock smallest]颤动起来，开始缩小，变成适合[him]未来情人的尺寸。");
         }
         outputText("[pg]棕发姑娘又犹豫了一阵，但随后似乎下定了决心。她静静解开衣物，袒露出身体：一对C罩杯的乳房、纤细的腰肢、宽阔的臀部，以及一捧健康圆润的屁股肉。");
         outputText("[pg][say:啊，你没什么好害羞的，我的宠儿，]树妖低声说道。她向新的勇者伸出一只手，随后将她拉近树中的身影。几根树枝从树冠垂下，在棕发姑娘身后形成一张粗糙的座椅；当她紧张地坐上去时，树枝便将她的胯部拉向那根悸动的肉棒。");
         outputText("[pg][say:我不太确定……]姑娘刚开口，霍莉便咧嘴一笑，推着她临时做成的秋千向前，把勇者的小穴贯穿在[cock smallest]上。[say:啊！]她尖叫起来，树枝则配合着它们主人的快感，自行开始摇摆。一小缕鲜血透过叶片渗出，滴落到地上。");
         outputText("[pg][say:哦，玛莱！一位处女选择将自己的纯洁分享给卑微的树妖！]霍莉娇声说道。[say:你的处女膜已经撕裂，夺走了你的贞洁，但我们必须让这第一次值得铭记！]棕发姑娘只能喘息着、睁大眼睛回应。与此同时，霍莉的阴蒂肿胀并拉长，长成一根勃起的绿色阴茎，顶端覆着萼片。萼片张开，露出这位植物女人新生的龟头；她走到年轻勇者身后，从后方抚摸她的乳房。[say:可爱的年轻英雄，请接受我对你奉献的谢意，并让这片土地的祝福填满你。]");
         outputText("[pg][say:不、不……啊！]棕发姑娘尖叫起来；下一次秋千荡回时，霍莉的肉棒滑进了她被先列腺液润滑的小穴。这个被破了身的处女胡言乱语、口水直流，在来回摇摆中被两根阴茎一同撑开穴口；她荡动时，二者向相反方向摩擦，一根抽出，另一根便更深地滑入。第一次高潮袭来时，姑娘浑身发抖、僵在原处；可即便她的神经已敏感不堪，并哭喊着请求喘息，树枝仍继续让她在两位情人之间摇摆。");
         outputText("[pg]到那女孩迎来第三次高潮时，她的伴侣们也已绷紧到了临界点；随着一阵颤抖，摇晃的枝条也停了下来，那个沉默的身影在无声的狂喜中张开[his]的嘴，射精了，");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("用[his]未使用的男子气概中喷出的废弃种子喷洒在女孩的肚子和乳房上，并且");
         }
         outputText("又将勇者的小穴灌满了精液，多到从她被撑开的穴口中倾泻而出，而霍莉仍在不停抽插。");
         outputText("[pg]树妖自己很快也发出一声叫喊，在高潮来临时把奶子压上那棕发女孩的后背。一个鼓包沿着绿色肉棒向上推进，没入勇者那被操得狼狈不堪的小穴里，随后一缕金色树液顺着霍莉的肉棒漏了回来。树妖抽身而出，擦干净自己的阳具，将它折回花苞之中；它逐渐收缩、变小，直到最后只剩下她的阴蒂。那个沉默身影的枝条把女孩放回地面，[his]那根始终勃起的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("在她的乳房上滴下余韵未尽的精液。");
         outputText("[pg][say:谢谢你，勇者，]霍莉提示道，女孩的双眼猛地睁开。[say:处女的第一次是无价的；我实在忍不住也要分一杯羹。你的生命力之礼已被接受。尽管取走你想要的果实吧，带着我们的祝福离开。]");
         outputText("[pg]棕发女孩神情恍惚，挣扎着站起身来，因骨盆刚才承受的冲撞而摇摇晃晃。[say:呃……不客气。只要能抵抗恶魔，我很乐意……尽我所能地帮忙。]那个沉默身影的[cock smallest]抽搐了一下，挤出最后一滴精液，女孩望着那根肉棒，眼神有些依依不舍。她摇摇头打断自己的白日梦，穿好衣服，拾起法杖，又采了几枚果实，随后踏入外界，消失在无处不在的红尘之中。");
         outputText("[pg][say:头脑简单的蠢货，]霍莉朝着新任勇者渐行渐远的背影啐道，一边抚弄着伴侣勃起的肉棒。[say:我真想看看她会在何处、又会在何时扎根。不过，我倒好奇，在我的种子把一切吸收干净之前，你的精液会不会先让她怀上？]");
         get_game().gameOver();
      }
      
      public function holliGetsDickDommed() : void
      {
         clearOutput();
         outputText("你把[armor]扔到一边，露出你的[cocks]。霍莉的目光锁定在[oneCock]上，全部注意力都痴迷地集中在那一根阳物上。你握住自己的雄性器官，上下晃动着拍向另一只手掌。性器撞击的沉闷拍打声在周围岩石间回荡，每一下都让你阴茎根部泛起一阵舒适的快感。没过多久，你就彻底勃起，硬得发胀，随着每一次心跳不由自主地弹动。");
         outputText("[pg]霍莉向前探身，被眼前的景象迷住了。她弯下身观看这场表演，头和肩膀从意外柔韧的树皮中滑出。她沉甸甸的乳房在身下摇晃，没有任何束缚。树液般的湿意像晨露一样附着在她杏仁色的乳头上，凝成小滴落在荒芜的地面。她的乳尖已经硬挺起来，被某种相当于血液的奇异物质充盈。同样，树妖的花朵也完全盛放，鲜艳的花瓣敞开着，仿佛在欢迎你。不断分泌的润液让湿滑的唇瓣在光线下像钻石般闪烁，直到主人的阴影遮住了那片光亮。");
         outputText("[pg]霍莉从树里探出身子，伸手去够[oneCock]，却在差一点碰到时停了下来。[say: 可以让我取悦它吗，求你了？]她满怀期待地仰望着你，就像等着被赏颗糖的孩子。");
         outputText("[pg]只要她继续乖乖听话，你并不介意让她舔上几下。你朝这位黑眼美人点点头，向前挺身，把你的[cockHead biggest]直直顶到她柔软的嘴唇上。霍莉惊讶地轻叫一声，伸手抓住，用灵巧的手指牢牢握住你的[cock biggest]。她正要亲吻它，你却又向前一挺。她还没来得及反应，前面几寸就已经没入了她的口中。这一次，她只能发出含糊的呻吟，双唇被肉棒彻底塞住。随着她开始接受自己的角色，惶乱的声音也渐渐平息，轻轻地让你的[cock biggest]滑下去，尽可能多地含住");
         if(get_player().biggestCockArea() > 80)
         {
            outputText("，下巴被撑得淫靡不堪");
         }
         outputText("。");
         outputText("[pg]你夸奖她成功应付了你的肉棒，同时用温柔却不容抗拒的力道按住她的后脑。你的肉棒被惬意的体温包裹着，深深地被吞下");
         if(get_player().biggestCockArea() <= 80)
         {
            outputText("，一直吞到你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("[sheath]");
            }
            outputText("。");
         }
         else
         {
            outputText("，一直吞到霍莉鼓胀的脖颈所能承受的最深处。");
         }
         outputText("她咕噜作响，这个魔化树妖扑闪着长长的睫毛，抬头望进你的眼睛，因自己的服从而幸福得眼里闪着光。你扭动胯部，让你的[cock biggest]在她的嘴和喉咙里搅动。堕化树妖的舌头按摩着你整根肉棒的下侧，用细微的湿润与毫无阻滞的压力包裹着你。");
         outputText("[pg]翻涌的性快感开始在你体内堆积，让你的");
         if(get_player().balls > 0)
         {
            outputText("[sack]绷紧得像要爆开");
         }
         else
         {
            outputText("身体绷得像调得过紧的吉他弦");
         }
         outputText("。霍莉向后退开，让你不快地低吼出声；但她刚一抽离，双手便立刻合拢在湿滑的肉棒上，开始用有力的动作上下套弄。她的嘴重新含住你的[cockHead biggest]，舌头绕着它打转，同时上下吞吐，把你最敏感的部位困在汹涌的快感之中。");
         outputText("[pg]你掐住这个饥渴吸吮肉棒的家伙的脖子，将她推回树里，在你的[cock biggest]喷发之前放开它。只差一点——你硬得发胀，肉棒一跳一跳，肌肉不受控制地收紧，已经逼近边缘。霍莉被迫回到原位，发出一声噎住般的抗议，却没有挣扎，畏惧着你的怒火。你放开这个饥渴的荡妇，她毫发无伤，却被粗暴的对待教训了一番。你的精液注定要灌进她的小穴，而不是浪费在她那放荡的出声洞里。");
         outputText("[pg]你迈步上前，将坚硬的肉棒深深顶进霍莉腰间湿滑的花朵里。");
         if(get_player().biggestCockArea() > 80)
         {
            outputText("当那粗大的尺寸被强行塞入她体内时，它微微弯曲，朝下探去，深入树干之中。");
         }
         outputText("霍莉瘫倒在你的[chest]上，虚弱地抽搐着，呼吸急促。[say: 操，太爽了！]她喘息着，把脸颊蹭进你的锁骨，双手在你的肩上游走。你用飞快的动作毫不留情地挺入她花朵般的丘丘。每一次抽插到顶点，淫液都会沿着你的肉棒四周喷溅而出，洒落在周围的地面上。你抓住霍莉深绿色的头发，将她往后扯。她的脸被快感弄得一塌糊涂，嘴巴和眼睛都在不协调地抽动。");
         outputText("[pg]你用力亲吻你的植物宠物，而她屈服于你强势的支配，在你手中软得像泥。她的身体贴着你颤抖，随即在你的唇间呻吟起来，忘了继续接吻，因为高潮正撕扯着她脆弱的类人半身。蜜液顺着你的[legs]持续滴落，甜腻又润滑的液体让空气中充满花香般的雌性麝香。你从她不停吐出呻吟的嘴边退开，将她抱在怀里，看着她高潮。树妖内壁愉悦的爱抚带着柔韧的压力收紧，缓慢的波浪在你的[cock biggest]上层层滚过，饥渴地吸吮着你，准备迎接精液。");
         outputText("[pg]突如其来的高潮把你自己都吓了一跳。前一刻，周围交合的肉壁还带来血脉贲张的狂喜；下一刻，欲望便像爆发的火山般从你的[cocks]中沸腾喷出，喷泉似的液体冲天而起。");
         if(get_player().cockTotal() > 1)
         {
            outputText("多余的精液从下方喷到霍莉颤动的乳房上，在翠绿色的山丘上点染出一片片白色。");
            if(get_player().cumQ() >= 500)
            {
               outputText("持续不断的喷溅没多久就把它们染成了白色，混着她黏稠的树液，从乳头尖端滴落下来。");
            }
         }
         if(get_player().cumQ() > 1000)
         {
            outputText("一缕精液从女恶魔的入口处流出，不知怎的逃过了那股强烈的吮吸。");
         }
         if(get_player().cumQ() > 2000)
         {
            outputText("片刻之后，那一缕细流变成了河流。");
         }
         if(get_player().cumQ() > 3000)
         {
            outputText("你敢肯定，她的树干里一定已经被精液塞得满满当当。");
         }
         if(get_player().cumQ() > 5000)
         {
            outputText("随着压力飙到顶点，一股精液喷泉猛地喷出，以最狼藉的方式证实了你的猜想。");
         }
         outputText("霍莉的触手也和她一起高潮，漫无目的地将她的种子一道道喷向树冠。大部分都粘在她的枝条和叶片上，但还有少量淌落下来，溅到地面。其中一滴落在你的手背上。你皱了皱眉，把手按到这位树女嘴边。她毫不犹豫地把你舔干净，仍沉浸在高潮后的恍惚中。");
         outputText("[pg]你从大张着的花盆中抽身而出，欣赏着自己劳作的成果。霍莉喘息着说道：[say:谢、谢谢你，[name]……太舒服了……]");
         outputText("[pg]你勾了勾手指，指向糊在你[cock biggest]上的精液与花蜜泥浆。她会意地向后探出身子，张大了嘴。这个变得温顺许多的植物女人把你的肉棒仔仔细细清理了一遍。她把一切都吞了下去，然后退开，低声说道：[say:如果你什么时候还想再来一轮……我的花就是你的。]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(1));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,594,FlagDict_Impl_.arrayReadInt(_loc1_,594) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         fertilizeHolli();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function holliFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) >= 4)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) == 0;
         }
         return false;
      }
      
      public function holliDestroyPrompt(param1:Function, param2:Function) : void
      {
         clearOutput();
         outputText("即便你已经下定决心，看着这株奇异的植物，你还是忍不住怀疑自己是否真的该把它彻底除掉。你确定自己真的想这么做吗？");
         doYesNo(param1,param2);
      }
      
      public function holliAskGlades() : void
      {
         var _g:HolliScene;
         clearOutput();
         if(!saveContent.askedGlades)
         {
            saveContent.askedGlades = true;
            outputText("你注意到营地里的恶魔树妖与森林中的腐化林地绝不只是略有相似，于是决定向她询问此事。");
            outputText("[pg][say: [if (hollidom) {真是艺术品，不是吗？|玩得开心吗？}]]她微微一笑，[if (hascock) {她的花朵绽放开来，花瓣邀请般舒展，已经滴落着花蜜|她光滑卷曲的藤蔓轻轻拂过你的脸颊}]。她身上飘来的甜美花香里藏着一丝情欲气息，第一口吸入便让[if (lus < 33) {你体内的欲望涌动起来，在你的[skinshort]下发烫|你的脑海被欲望蒙住，身体只想扑[if (hascock) {进|到}]她[if (hascock) {等待着你的褶缝里|扭动的肉茎上}]}]。当你呼出这口气时，那阵恍惚才稍稍散去，足以让你想起自己为何而来。");
            outputText("[pg][say: 想要更多？[if (hollidom) {也许我可以……|我很乐意。}]]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) == 0)
            {
               outputText("[pg][if (hollidom) {她招手让你靠近，她的香气在你鼻尖发痒[if (singleleg) {，随着你靠近越发明显|，每走一步都更浓}]。[say: 但如果你连照顾我都记不住，又怎么照顾我们的孩子呢？]|霍莉紧张地环顾四周，似乎又缩回了自己的树里。[say: 但没有你的帮助……][if (hascock) {她的花朵颤动起来|她的几根藤蔓扭动起来}]，透着诱人的意味，而你很确定自己知道她需要什么。[say: 如果没有受精，我就没有力气做到那种事，]她承认道，翡翠般的肌肤泛成深绿，你只能认为那是在脸红。}]");
               outputText("[pg]看起来[if (hollidom) {她是不会在这件事上让步了|她并没有说谎}]，所以你别无选择，只能暂时放下这个话题。");
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) != 0)
               {
                  outputText("[pg]你一表示同意，霍莉便愉悦地哼了一声。[say: 你只要开口就行，[name]。]");
                  outputText("[pg]有那么一瞬间，你怀疑她是否真有自己声称的那般能耐，但你[feet]下方传来的不祥震动立刻打消了这些疑虑。她的树发出嘎吱与呻吟般的声响，那声音你很确定不该由植物发出；你匆匆瞥向地面，发现营地周围本就稀疏的草木正在枯萎，消失进泥土里。等她终于停下时，你担心周围已经只剩干裂的土地，与霍莉鲜活的翠绿形成了刺眼的对比。");
                  outputText("[pg][say: 好好享用吧，[name]。]看到你的表情，她在自己的树中扭动了一下，这位恶魔般的植物女神流露出你从未见过的歉意。[say: 对不起……要让它们长出更多，并不容易。]");
                  outputText("[pg]你转身离开时，霍莉[if (hascock) {张开花瓣，让花蜜从她手中滴落|抚摸着自己的一根藤蔓，让球状顶端在她手中膨胀起来}]。[say: 也许让我受精会有帮助……]");
                  outputText("[pg]你[i:确实]得到了你想要的……大概吧。");
                  saveContent.growingGlades = true;
               }
               else
               {
                  outputText("[pg]她招手让你靠近，她的香气在你鼻尖发痒[if (singeleg) {，随着你靠近越发明显|，每走一步都更浓}]。[say: 让土地在腐化中繁盛，全都为了你自己的享乐……我喜欢你的想法，勇者。]");
                  outputText("[pg]霍莉满足地叹息一声，俯身靠近，[if (hashair) {揉乱你的头发|拍了拍你的头}]，用的东西你只能希望是她的手[if (short) {——不过考虑到你的体型，你很确定那不是|}]。就在你怀疑她究竟会不会帮忙时，脚下的地面开始隆隆震动，几乎把你[if (singleleg) {撞倒|震得站不稳}]。她的根须在土壤下鼓胀、呻吟，周围的土地在她催生新生命时变得干涸。等一切终于停止时，周围唯一的绿意只剩霍莉自己，枯败荒芜的土地威胁般逼近你的营地。");
                  outputText("[pg][say: 完成了，[name]。]看到你的表情，她又补上一句：[say: 看来你只能更经常给我浇水了。]");
               }
               outputText("[pg]你[i:确实]得到了你想要的……大概吧。");
               saveContent.growingGlades = true;
            }
         }
         else
         {
            registerTag("growth",TagFun_Impl_.fromBool(saveContent.growingGlades));
            outputText("[pg]你问霍莉，她是否[if (hollidom) {不介意为你[if (growth) {少培育一些|多培育一些}]|愿意为你[if (growth) {开始|停止}]培育}]腐化林地。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) != 0)
            {
               outputText("[pg]霍莉[if (growth) {似乎对你的命令并不高兴，但也不敢违抗你|立刻高兴起来。[say: 当然可以，[name]。]}]");
               outputText("[pg]地面震颤了一秒[if (growth){，随后她再次缩回自己的树里。|。[say: 玩得开心！]}]");
            }
            else if(saveContent.growingGlades)
            {
               outputText("[pg][say: 我为什么要那么做？]她低头看了你一眼，叹了口气。[say: [if (!hollifed) {也许等你表现出更多虔诚之后，我才会愿意无视你这亵渎的请求。|不过，既然我是位仁慈的女神，我就准许你的请求。}]]");
               outputText("[pg][if (hollifed) {地面震颤了一秒。|霍莉消失进自己的树里，只剩眼睛还露在外面。}] [say: 现在走吧。]");
            }
            else
            {
               outputText("[pg][if (!hollifed) {[say: 我可以那么做。]她低头看了你一眼，叹了口气。[say: 也许等你表现出更多虔诚之后，我才愿意听听你的请求。]|[say: 这样的请求，我怎么可能拒绝呢？]}]");
               outputText("[pg][if (hollifed) {地面震颤了一秒。[say: 就当它已经完成了。]|霍莉消失进自己的树里，只剩眼睛还露在外面。[say: 现在走吧。]}]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) != 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) != 0)
            {
               saveContent.growingGlades = !saveContent.growingGlades;
            }
         }
         _g = this;
         doNext(function():void
         {
            _g.treeMenu();
         });
      }
      
      public function holliAppearance() : void
      {
         var _g:HolliScene;
         clearOutput();
         outputText("容纳着霍莉辛西娅的那棵树就矗立在你面前，像一尊高耸的巨人立于这片大多灰暗荒凉的废土之中。从远处看，它似乎无害，但绿叶中搏动的紫色脉络暴露了它的真实本性。就算没有那些脉络，巧妙伪装在枝叶间的触手也足以说明一切！");
         outputText("[pg]不过，你的注意力很快就被霍莉本人吸引过去。这位树妖般的魅魔浑身散发着性爱的气息，整个身体都像是在预示即将到来的欢愉。沉甸甸、滴淌着液体的乳房和完全舒展开的雌花占据了她的身形，但你还是把视线抬到她的眼睛上，凝视着霍莉金棕色的瞳孔与黑色的巩膜。那双眼睛摄人心魄，让你不由自主地打了个寒战，[if (hollidom) {而你能看出她很喜欢自己对你造成的这种影响|但当你与她对视时，它们又稍稍柔和下来，证明了她对你的忠诚}]。翠绿的长发衬托着她美丽的脸庞，一对木质犄角从她的前额生出，赋予她一种异域而近乎神话的气质。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) > 0)
         {
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) == 1 ? "一颗硕大的紫色果实" : Utils.Num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600)) + "颗硕大的紫色果实") + "挂在霍莉的枝头，在微风中轻轻摇曳。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) == 1 ? "它看起来" : "它们看起来") + "多汁而成熟。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,601) > 0 ? "你内心某个极小而奇怪的角落，竟为能和这位树女一起孕育出这样的东西感到自豪。" : ""));
         }
         _g = this;
         doNext(function():void
         {
            _g.treeMenu();
         });
      }
      
      public function holliAndGenderlessSittingInATree() : void
      {
         clearOutput();
         outputText("高大健壮的旅人穿过传送门，身后旋转的色彩随即消散成空无一物的空气。迎接他的是一片被摧残过的赤红大地，而且态度并不友好；一团被风卷起的尘土扑了他满脸，呛得他连连咳嗽、 sputtering。男人眯起泪眼向四周张望，想找个能稍微挡风、让他辨明方位的地方；附近有两棵瘦巴巴的树，似乎正合适。");
         outputText("[pg]不过，等他走近之后才发现，有这种想法的并不只有他一个：已经有两个身影倚在树上。两者都一丝不挂，其中一个是个美艳的女人，只是皮肤发绿，头上长角；另一个看起来则是");
         if(!get_player().isFurryOrScaley())
         {
            outputText("[skintone]色的");
         }
         else
         {
            outputText("覆盖着[skinfurscales]");
         }
         outputText("，身体缠绕在树上，让人完全无法判断其性别。不……并不是缠在树上，而是从臀部以下都嵌进了树里！");
         outputText("[pg][say: 喂，陌生人！]绿皮肤的女人喊道。[say: 到我们的树下躲一会儿吧，避避这讨厌的沙尘暴！]");
         outputText("[pg]旅人谨慎地点点头，走进宽阔的树冠阴影下。[say: 你们两个是谁？这位“树桩子”又是怎么回事？]");
         outputText("[pg]绿皮肤的女人笑了起来。[say: 我们是树妖，由这片土地的女神玛莱安置在此。]仿佛是在印证她的话，树冠上的枝条垂落下来，挡住了肮脏的红色风沙。[say: 我是霍莉辛西娅，她的长女。我已经成熟到足以离开自己的树，在外行走……而“树桩子”还没有。至于你呢？]");
         outputText("[pg]陌生人想了想，然后回答道。[say: 我在丛林里迷了路，被一个叫英格纳姆的地方来的村民发现了。除了野外求生，我没什么本事，家里也没人等我回去，所以我就答应成为他们的“勇者”，穿过了传送门。]");
         outputText("[pg][say: 啊，是这样吗？我们一直在等你。我母亲吩咐我们为新的勇者提供补给和她的祝福。如你所见，最近有些干旱；我们没有果实可以给你。不过，如果你愿意的话……]霍莉伸手探向头顶的树冠，从同伴的树上拉下一根枝条。枝条咔嚓一声断裂开来，木屑四溅；那个沉默的身影颤抖了一下，陌生人也不由得皱起了脸。树妖把枝条从手中捋过，树皮与木质随之移动、拉直，变得平整。细枝和叶片聚拢到末端，霍莉把做好的木杖插进赤红地面的一道裂缝里。[say: 你离开时把它带上。里面有我母亲的魔法，你可以用末端轻点植物，让它结果，或是流出花蜜。]");
         outputText("[pg][say: 那祝福呢？]陌生人问道。");
         outputText("[pg][say: 嗯……]霍莉垂下眼帘，羞涩地笑了笑。[say: 如果你想要，那也是你的，不过授予的方式会更私密一些。你愿意……和我同寝吗？就在这里，在我的树荫下？你与我共享的活力和精力，也会帮助我们从干旱中恢复过来。]");
         outputText("[pg]陌生人缓缓点头。[say: 那你的伙伴怎么办？]");
         outputText("[pg]霍莉开始替这位未来的情人脱衣服。[say: [name]有点古怪。它没有可供我们交合的性别。通常来说，我们可以选择显现为男性、女性，或两者兼具……[name]选择两者都不是，并且背弃了整个性爱交合这回事——无论是象征意义上，还是字面意义上。]");
         outputText("[pg][say: 真有原则，]旅人嘟囔着，脱下最后一件衣物。[say: 它一定经常无聊吧。]");
         outputText("[pg][say: 的确如此，]霍莉表示赞同。[say: 但当你做出选择，就得接受后果。不是吗？]树妖把旅人拉到自己身上；当他抚摸她的乳房并进入她体内时，她开始呻吟起来。她那沉默哨卫的双眼随着这对情人望向地面，而");
         if(get_player().hasScales())
         {
            outputText("它的鳞片因兴奋而一阵颤抖");
         }
         else if(get_player().hasFur())
         {
            outputText("它的毛发开始因兴奋而竖起");
         }
         else
         {
            outputText("情欲的红晕染上了它的[skinfurscales]");
         }
         outputText("……");
         get_game().gameOver();
      }
      
      public function helpWithFarm() : void
      {
         clearOutput();
         outputText("你问她，身为植物女神，能不能帮帮你最近得到的那座农场。");
         outputText("[pg][say: 啊，是啊，] 霍莉轻吐气息。[say: 那片夹在我和母亲之间、青翠又规整的小地方。对我来说，它感觉明亮又冰冷……在那里生长的生命满是淀粉，乏味得很。全是空热量。] 你等着她心不在焉地哼着小调。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1108) == 0)
         {
            outputText("[pg][say: 我倒是可以帮帮你那块无聊的小地，] 霍莉终于露出一抹坏笑，随后闭上眼睛，开始慢慢抚弄自己的花朵。[say: 可是啊……你已经很久没有好好给我施肥了。一个女神若是没有沐浴在崇拜之中，你又怎么能指望她祝福你的作物呢？] 你翻了个白眼。你大概猜得到，为了让这个存在出手相助，自己得做些什么。");
            treeMenu(false);
         }
         else
         {
            outputText("[pg][say: 我可以帮你处理，] 她终于说道。[say: 但要滋养这种乏味的东西可得花些力气。我能让你的农产品长得更好，但只能一次，而且效果不会永远持续。你想要吗？]");
            menu();
            addButton(0,"是",doFarmFuckery);
            addButton(1,"否",noPlzDontFuckWithFarm);
         }
      }
      
      public function haveAMapleSyrupSnack() : void
      {
         clearOutput();
         outputText("你带着饥渴的笑容走向霍莉，笑容挂在你的[face]上，你舔着嘴唇，用毫不掩饰的欲望注视着这个树栖荡妇。当然，你的目光锁定在她沉甸甸的胸部上，以及那肿胀滴水的乳头上。当你盯着看时，它们渗出甜美的汁液；这个恶魔似乎渴望感受到你的嘴唇贴在她那光滑、杏色的乳蕾上。看着你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 0)
         {
            outputText("一副心知肚明的样子，霍莉问道，[say: 是来找点小提神的吗？好吧，尽情畅饮我的花蜜吧，[i:勇者]。]最后那个词里满是恶意与嘲弄。");
         }
         else
         {
            outputText("满脸急切，霍莉问道，[say: 想来点小提神的吗？它们胀得厉害，我相信对你来说会是份清爽的小点心。]");
         }
         outputText("[pg]你低低咆哮一声，手臂沿着她身侧探入，绕到她背后，将她向前拉了出来。霍莉惊讶地倒吸一口气，却没有挣扎。一滴糖浆般的树汁溅到你的[armorname]上，从树妖甜美的乳房里更快地淌出。你伸长脖子，把其中一只含进嘴里，立刻开始吮吸。那液体与其说像奶，不如说更像枫糖浆，而且效力强得在你舌尖上噼啪作响，滋味浓烈地爆开。你用空着的手挤压那圆润的乳房，让流量变得更大。");
         outputText("[pg]霍莉倒吸一口气，[say: 别那么用力！]");
         outputText("[pg]你抬头看着她担忧的神情，眨了眨眼，然后咬住那敏感的乳头，力道刚好让她痛得吱了一声。恶魔的身体在你掌中扭动，但你的手臂环着她的后腰，而她的身体又与树连为一体，根本无处可逃。你轻易就制住了她，任由自己充分品尝她的美味。随着不断流出的花蜜被你一口口吞下，你的喉结上下滚动，喉咙也像先前的舌头一样微微发麻。很快，你全身都像被能量点燃，而这时你才刚吸完第一只乳房。");
         outputText("[pg]乳头从你唇间弹出，带出一阵微弱的“奶”雾；它的主人轻轻颤抖着，花朵贴着你的[legs]绽开，无力地抓握着。你把原本用来束缚她的手臂稍稍下移，捏住霍莉可爱的小屁股。她光滑的肌肤握在手里触感完美，不过你能感觉到再往下一点，她的肉体就与树木相连，变得相当粗糙。真古怪。");
         outputText("[pg]你很快就厌倦了抚弄这骄傲生物的身体，转而继续从源头直接饮用她的珍宝，饥渴地吮吸着，加快这个过程。你能听见上方霍莉的喘息声，而她湿滑的花瓣在你的[hips]上研磨，更为空气增添了几分情色。你自己的血液也泵动得更快更猛，让你的[skin]泛起热意。你越喝越深，意识到自己正鲜活无比，彻彻底底充满了能量。你咽下霍莉最后的糖浆，身体微微一颤，从你们共享的亲密拥抱中抽离出来。");
         get_player().refillHunger(10);
         outputText("[pg]霍莉正在发抖，下方不断渗出润滑液，淡绿色的肌肤几乎泛成紫色。沉重的眼睑半掩着放大的瞳孔，她急促地喘息着……看来她竟然能靠这样达到高潮，但显然还想要更多。");
         outputText("[pg]也许下次吧。你走开了，已经得到了自己想要的东西。");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(15),DynStat.Cor(1));
         get_player().changeFatigue(-60);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function girlsGetANiceManToBadEnd() : void
      {
         clearOutput();
         outputText("那个看起来瘦弱得像杂草的年轻男人，从传送门那旋转的紫色水池中迈了出来。随着那混沌光芒投下的闪烁阴影逐渐退去，迎接他的是一片繁茂的林间空地，让人想起英格纳姆的荒野……只不过，树上还编织着一具具赤裸的身体，长着各种各样、随机分布的勃起兽类肉棒、丰满的乳房、湿漉漉的小穴，以及一片片光滑颤动的肌肤——偶尔一棵树甚至四者俱全。他打量着这片淫靡的绿意，寻找继续前进的办法，而他舒适的裤子里也开始支起一顶帐篷。");
         outputText("[pg][say:欢迎来到玛瑞斯，勇者，]一个声音从年轻人身后传来。他转过身，因羞耻与兴奋而涨红了脸。一张美丽的绿色脸庞从如今空荡荡的传送门框旁的阴影中望着他，深色的眼眸之上生着弯曲的角。她向年轻男人迈步走来时，摇晃的乳房和裸露的阴户显露出她同样一丝不挂。他摆出一副外行的拳击架势，可裤裆里的隆起却反而更明显了。");
         outputText("[pg][say:报、报上名来！]他结结巴巴地喊道。[say:是友是敌？]");
         outputText("[pg][say:噢，请把手放下吧，]那女人回答道。[say:我不是想挑战你，英雄，而是来帮助你。这里是树妖林地，由这片土地的女神玛莱安置于此，用来救助那些通过传送门来到这里的人。我是霍莉辛西娅，她的女儿。]");
         outputText("[pg][say:这……好吧，倒是解释了那些树里的人。不过他们为什么全都光着身子？]");
         outputText("[pg]霍莉低头瞥了一眼他勃起的阴茎——此刻正透过裤子渗出一小片先列腺液的湿痕——然后挑起一边光滑的绿色眉毛。[say:你们村里的裁缝经常给树木量身定做衣服吗？]年轻男人又一次脸红了，放下一只手挡在自己的肉棒前，试图遮住树妖的视线。[say:先把你的问题放一放，]她继续说道。[say:我奉母亲之意，为你的旅途提供装备和补给，作为她送给你的礼物。不需要任何报酬，不过若你想表达感激，我们当然也可以接受。]她又意味深长地瞥了一眼他遮住的胯下，随后走向林地里最大的两棵树。");
         outputText("[pg]左边那棵树不像其他同类一样有赤裸的住客，不过它看起来比任何一棵都更加古老粗壮；右边那棵的枝条则被看起来多汁的果实压得低垂。右边树中的身影被扭成一个淫靡的姿势，它的");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("[chest]被藤蔓托住，朝年轻男人挺出，");
         }
         else
         {
            outputText("胸口被细密的藤蔓网交错缠绕，");
         }
         outputText("双腿被抬高并分开，展示出一个");
         if(get_player().balls > 0 && get_player().ballSize > 10 && get_player().get_gender() == 3)
         {
            outputText("[cocks]，下方晃荡着[aballs]。");
         }
         else if(get_player().balls > 0 && get_player().ballSize <= 10 && get_player().get_gender() == 3)
         {
            outputText("[cocks]和[balls]，微微垂在一个[vagina]上方。");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("[cocks]和一个[vagina]。");
         }
         else
         {
            outputText("一个湿漉漉、不断淌液的小穴，简直像是在渴求被填满。");
         }
         outputText("虽然那身影的双眼被遮住了，但她的嘴却一刻不停地动着，咬着、舔着自己的嘴唇，仿佛正被超乎寻常的欲望折磨着。霍莉向那年轻人招手，示意他走向这棵树。");
         outputText("[pg]他走近时，树妖伸手探向树冠，扯下一根结着果实的树枝；树枝顺滑地折断，那具裸体身影随之一颤，激起一阵震动传遍了");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("[chest]");
         }
         else
         {
            outputText("藤蔓");
         }
         outputText("。霍莉从枝梗上摘下果实，扔给那个年轻人。[say:吃了它，]她命令道。就在他狐疑地打量着果实并咬下一口时，树妖把断枝的一端夹到自己双腿之间，开始缓缓抽拉，做出一根光滑笔直、沾满她分泌物的手杖。年轻人的肉棒在裤子里怦怦跳动，他一边分心咀嚼，一边看着她表演：细枝与叶片逐渐变形，聚成一簇，从霍莉心形的屁股后方伸出。霍莉抽出新生的手杖递给他，露出会意的微笑；他碰到她被小穴打湿的手时，肉棒又从布料的牢笼中喷出一团先列腺液。");
         outputText("[pg][say:如果你感到饥饿或口渴，就把带叶的一端放到最近的植物上，它会促使植物结果，或流出花蜜。这根手杖灌注了我母亲——女神的力量。它应该相当坚韧，在你找到更好的武器前，也足以充当武器。你也可以带走尽可能多的果实。]");
         outputText("[pg]年轻人满怀敬意地握着手杖。[say:我不……我不知道该怎么感谢你为我做的这一切。]");
         outputText("[pg][say:我之前不是已经告诉过你了吗？]霍莉反问道。[say:我们已经知道你该如何感谢我们了。与我们分享你的生命力，帮助我们的种族繁荣。]树妖露出一抹狡黠的微笑，伸手探向她那淫靡的同伴，");
         if(get_player().ballSize > 10 && get_player().balls > 0)
         {
            outputText("托起那对沉甸甸的睾丸，露出一个湿漉漉、迫不及待的小穴。");
         }
         else
         {
            outputText("分开阴唇，露出里面那迫不及待、不断收缩的穴口。");
         }
         outputText("[pg][say:哦、哦天啊，真的吗？]年轻人呻吟道。[say:我是说……我很感激地献上我的谢意。]他笨拙又滑稽地几乎把衣服扯下来，露出精瘦的身躯和坚硬如铁、滴着液体的肉棒。他走到树前，对准那湿淋淋的洞口，然后俯身向前，龟头伴随着轻微的“啵滋”声挤过入口。那沉默而失明的身影惊讶地张开嘴，随后又羞涩地笑着合上；她的枝条也在爱人身边垂得更低，像是在模仿拥抱。");
         outputText("[pg][say:她喜欢你，]霍莉在年轻人身后轻声说道。[say:如果你愿意，可以随意玩弄她的身体。那会让她高兴的。]");
         outputText("[pg]这位初尝情爱的年轻人已经急切地抽插起来，");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("伸手抓住两把乳房，用拇指抚过一枚乳头，看着那");
            if(get_player().get_gender() == 2)
            {
               outputText("女人");
            }
            else
            {
               outputText("双性人");
            }
            outputText("的嘴在 bliss 中一张一合。");
         }
         else
         {
            outputText("俯下身亲吻[woman/hermaphrodite]光滑的胸膛，使她愉悦地弓起背来。");
         }
         if(get_player().hasCock())
         {
            outputText("他紧张地向下瞥了一眼，一只手滑向她的[cock smallest]。[say:只要是妹子的，就不算搞基，]他喃喃自语，随后开始生涩地套弄，手指沿着尿道口拨弄，从颤抖的伴侣身上逼出一股先列腺液。");
         }
         else
         {
            outputText("他的手滑向她湿淋淋小穴上方的[clit]，从两人湿滑交合处沾起一些起泡的润滑液，");
            if(get_player().getClitLength() < 6)
            {
               outputText("他把它抹在那颗小肉粒上，然后开始用一根手指沿着下侧上下描摹。");
            }
            else
            {
               outputText("他把肿胀的器官涂满润滑液，像对待鸡巴一样卖力地套弄起来。");
            }
            outputText("[say:舒服吗？]他问道，同时加快了抽送的节奏。");
         }
         outputText("仿佛是在回应，");
         if(get_player().get_gender() == 2)
         {
            outputText("女人");
         }
         else
         {
            outputText("双性人");
         }
         outputText("在树上弓起背来，她的[vagina]紧紧夹住他的家伙");
         if(get_player().hasCock())
         {
            outputText("；");
            if(get_player().balls > 0)
            {
               outputText("她的蛋蛋紧缩贴近身体，并且");
            }
            outputText("她颤抖的阴茎");
            if(get_player().cockTotal() == 1)
            {
               outputText("抽动着");
            }
            else
            {
               outputText("抽动着");
            }
            outputText("，眼看就要高潮");
         }
         outputText("。");
         if(get_player().hasCock())
         {
            outputText("[pg]年轻人意识到接下来会发生什么，眼睛短暂地睁大，随即紧闭双眼，准备迎接预料中的喷射。可什么都没落下来，他又偷偷看向自己的爱人；几根藤蔓已经从她的树冠上垂下，将她的阴茎转向");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("她自己的脸；");
            if(get_player().biggestCockArea() < 20)
            {
               outputText("精液喷涌而出，又沿着她的[chest]淌下，积在两人交叠的腿间，并与环绕在她阴道口的黏滑润滑液混在一起。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("量多得惊人，等她高潮结束时，伴侣的双腿和她的树干都覆上了一层乳白色精液的光泽。");
               }
            }
            else if(get_player().biggestCockArea() < 80)
            {
               outputText("她嘴里如今塞满了龟头，她一边急切地吞咽，一边同样猛烈地喷射，唇角垂下道道白液。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("精液的浪潮不停涌来，灌入她体内，把她的肚子撑得鼓胀起来，直到那圆滚滚的隆起把阴茎从她嘴边顶开，剩下的精液便落在她的[chest]上。");
               }
            }
            else
            {
               outputText("她的身体在自己那根巨大阳具面前显得格外娇小，一团团精液射进她的树冠，在叶片和枝条间四处飞溅。");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("这名产量过剩的双性人从体内挤出如此多的精液，很快整片树冠都被染成白色，还不断滴落，仿佛置身热带雨林。");
               }
            }
         }
         else
         {
            outputText("[pg]一股");
            if(get_player().wetness() < 3)
            {
               outputText("喷涌");
            }
            else if(get_player().wetness() < 4)
            {
               outputText("奔流");
            }
            else
            {
               outputText("洪流");
            }
            outputText("的高潮淫液从她的小穴倾泻而出，她的嘴因快感而大大张开。围绕着年轻男人的树枝似乎向内合拢，把他推向她。明白了她的意思，他俯身吻住自己的爱人；她的舌头放纵地探入他口中，身体在痉挛中颤抖，[vagina]紧紧榨弄着他的肉棒。");
         }
         outputText("被她淫荡的表现逼过了极限，年轻男人呻吟着浑身一颤，开始释放积攒已久的存货。他倒在伴侣湿滑的");
         if(get_player().cockTotal() == 1)
         {
            outputText("阴茎");
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("阴茎们");
         }
         else
         {
            outputText("胸口");
         }
         outputText("上，整个人瘫软下来，嘴巴微张，阴茎一阵阵喷射，把她的阴道灌满。");
         outputText("[pg][say: 啊……啊，对不起！]他回过神来，伴随着湿黏的声响抽出阴茎。[say: 我忘了拔出来！]");
         outputText("[pg][say: 别担心，]霍莉回答道，手掌拂过那名沉默的");
         if(get_player().get_gender() == 2)
         {
            outputText("女人");
         }
         else
         {
            outputText("双性人");
         }
         outputText("的腹部。[say: 事实上，她似乎很享受，所以想让我赐予你一份祝福。]");
         outputText("[pg]霍莉跪在年轻男人面前，一手握住他湿漉漉、半软的阴茎，迅速含入口中，一直吞到根部。他呻吟起来，而这名树妖微微一笑，她的舌头变细，顺着他的尿道探入，随后鼓起，送入了某样东西。");
         outputText("[pg][say: 噢，疼，]她抽身离开时，他说道。[say: 那是什么？]");
         outputText("[pg][say: 我母亲力量的一颗种子。这片土地上有许多生物会试图通过挑起你的欲望来击垮你，而这颗种子会吸收你多余的热情，保护你的安全。]");
         outputText("[pg][say: 哇，太厉害了！]年轻人惊呼着，收拾起自己的衣服、法杖和一些干净的水果。[say: 你们真是太棒了……真的谢谢你们为我做的一切。等我打败那些恶魔，我一定会再回到这里来的！]他挥了挥手，穿过树林离开了。");
         outputText("[pg]霍莉一直望着他，直到他的身影消失不见。[say: 要是有什么事好得不像真的……那它多半就不是真的。蠢货。]她转向树中的身影，对方正深深地皱着眉。[say: 哎呀……我刚才只是随口撒谎而已，不过你<b>真的</b>喜欢他吗？好吧，你会再见到他的——等他发芽，并与玛莱的根系相连的时候。与此同时，我也很想看看，一个纯种人类男人和你这样曾是人类的树妖所生下的孩子，会变成什么样子。我很好奇，它的树会不会比你已经生下的那些小恶魔和兽类后裔的树更有意思？]");
         get_game().gameOver();
      }
      
      public function get_debugName() : String
      {
         return "霍莉";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getASprout() : void
      {
         var backFunc:Function;
         var destroyFunc:Function;
         var _g:HolliScene;
         clearOutput();
         holliSprite();
         outputText("在营地边缘，你发现有些植物开始发芽。荒芜废土上坚硬的地壳裂开破碎，冒出一株绿叶嫩芽。它只长到你的膝盖高，但看起来健康而幼嫩。也许它还会长得更大？一根主茎支撑着大部分重量，十几根枝杈从上面分叉而出，托着一簇簇闪亮的绿叶。");
         outputText("[pg]你短暂地疑惑，这种东西究竟是怎么在这样的土壤里扎根，还能长得这么好的；但随后你想起了那位腐化女神，玛莱。她是不是提过，她的根系遍布这个世界？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) == 2)
         {
            outputText("她甚至承诺过要在你的营地里种一棵树……");
         }
         outputText("你凑近一看，发现叶片背面有紫色的脉络，正随着某种液体一下一下地搏动——那只能是浸透了这个世界大部分区域的污秽液体。等它完全长成，也许会把腐化扩散到你的营地里。");
         outputText("[pg]<b>你要摧毁它吗？</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,596,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,597,0);
         menu();
         _g = this;
         destroyFunc = destroyDatFukkinTree;
         backFunc = letZeFuckingSproutLive;
         addButton(0,"是",function():void
         {
            _g.holliDestroyPrompt(destroyFunc,backFunc);
         });
         addButton(1,"否",letZeFuckingSproutLive);
      }
      
      public function fullOnTentacleTasticGangBangForHolli() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         outputText("你脱下[armor]，把那团扭动不止、蠕动着的卷须暴露在这位树妖荡妇面前。她用一只手掩住嘴，吐息道：[say:天啊，母亲大人玛莱可真会挑人，不是吗？]");
         outputText("[pg]你对自己植物般的肉茎施加了相当强的控制，向前伸出其中一根。那根阳具般的触手猛地窜出，在一瞬间堵住了这棵烦人的树。霍莉发出一声被噎住般的[say:呃、咕！]，身体向后撞进树上的入口，双眼对到一起，盯着从她唇间伸出的绿色长蛇。你强行塞进去的紫意肉棒尖端被她的嘴包裹着，感觉很不错，但你觉得她的喉咙会更舒服。你的触手肉具伸展开来，以超自然的灵活性继续变长，把新鲜的肉体推进霍莉的咽喉，让她的喉管被你的长度顶出形状。她的食道本能地试图吞下这道阻塞，而这正合你意。紧窄的口腔快感让你把一滴滴先列腺液直接渗进她的肚子里，但你离射精还远得很。毕竟，你还有九根阴茎，离满足还差得远。");
         outputText("[pg]霍莉伸手去碰那根打头阵的阳具。你不确定她是想把它拔出来，还是想替它按摩，但她的双手明明可以派上更好的用场。两根卷须猛然弹出，如长矛般向前刺去，在她来得及打扰嘴里那根忙碌的肉棒之前，就缠住了树妖的双臂。它们用温热的肉棒血肉紧紧缠绕她的肢体，并绷得笔直。不管她怎么挣扎，那些压迫性的阴茎都牢牢束缚着她。你把那两根忙碌的触手推得更用力，迫使它们爬得更高。它们的顶端顶进她的手指之间，又继续穿过去，让这位女恶魔结结实实地握住了你敏感的卷须。");
         outputText("[pg]被污染的树妖看向你，向你投来灼热的目光，开始按摩那三根忙碌的肉棒。她热切地抚弄着手里的两根。那根插进她嘴里的阴茎则得到了相当熟练的口交服务。霍莉的舌头以非人的技巧在下侧游走，用娼妇般高超的本事触碰着棒身上每一处敏感区域。你稍稍放松了对她双臂的束缚，好让她更好地服侍你，而她没有让你失望；现在能碰到你更多的部位，她的手活变得更快，也更热切。");
         outputText("[pg]到了这时，你已经开始有些面红耳热。三重快感相当强烈，强到你那一整束剩下的植物肉棒都在疯狂挥舞");
         if(get_silly())
         {
            outputText("，像充气舞臂一样乱甩的管状肉茎");
         }
         outputText("。在这场树木般爱抚的狂欢下方，霍莉湿滑的花瓣已经完全张开。你甚至能看见她的内部正贪婪地抽动。它带着跃动的饥渴一开一合，鲜活地充血鼓胀。你注视着这一切时，你的第四根肉棒竟自发地向前刺出，不需要你的引导，径直射向那个欢迎它的洞口。它像导弹一样撞了上去。转眼之间，两英尺长的肉棒便消失不见，被那朵小穴之花无底般的深处吞没。女液沿着入侵的肉棒四周喷涌而出，而她屈服于这四重交合时，那被堵住的呻吟也透过嘴里的肉棒震颤传来。");
         outputText("[pg]霍莉的双手开始发亮，覆满了你的先列腺树液。其余六根阴茎也同样滴淌着液体，充斥着久被压抑、毫无节制的欲望。你打量着她，决心为每一根都找到归宿。这个掺着叶绿素的女孩颤抖起来，她巨大乳房的晃动替你回答了问题。第五根绿色肉棒从你的下体肉束中猛然窜出，朝那颤抖的乳沟射去，转瞬间便跨过了中间的距离。它恰到好处地嵌入霍莉乳肉形成的深沟，立刻开始抽动。那片乳肉之海随之摇晃，你的触手每一次穿过那条谷地，都会让它淫靡地震颤。你自己的先列腺树液很快把这道乳沟变成一片潮湿、黏稠、沾满肉棒气味的泥沼。顶端向下弯曲，压在她一枚杏仁状乳头上，把其中糖浆般的乳汁涂抹在那逐渐硬起的小尖上。");
         outputText("[pg]这位恶魔树妖被肉棒淹没，被阴茎支配。她的双眼因快感翻白，整个身体都开始在欢愉的痉挛中颤抖。上方的枝叶也加入她高潮般的扭动，叶片沙沙作响，听起来简直像正在承受狂风暴雨。她的藤蔓触手平日里总是安分地待在上方，此刻却垂落下来，茫然地把树液喷洒到地面上。霍莉双腿下方的树皮因她喷涌的花蜜而闪闪发亮。插在她花中的触手正被她柔嫩的褶皱挤压、抚慰、绞榨。更上方，你那根插进乳沟的卷须则被糖浆般的乳“汁”溅满，使她的乳沟变得更加顺滑、更加湿润，也更适合被你蹂躏。");
         outputText("[pg]你从剩下那束尚未占用的肉茎中又放出第六根阴茎。它和兄弟一起猛地钻进那条糖浆般、满是树液的小谷地里，你开始一边双重乳交，一边让两根肉棒彼此摩擦，两根肉棒同时蹭磨着对方和湿透的乳房。霍莉因这全新的感觉虚弱地一颤，但除此之外，她似乎依旧像昏过去了一样。好吧，除了她的双手——她仍尽职尽责地套弄着你的第二和第三根肉棒，随着动作把越来越多的先列腺液挤到自己的掌心。你享受得厉害，甚至开始渴望更多刺激，于是轻而易举地扭转自己的肉棒，让它们一圈圈缠绕上霍莉被充分使用的身躯。那根插喉的肉棒缠上她的脖颈与肩头。插进小穴的阴茎则被你绕上来，环过她的腰间轻抚。两根乳交中的肉棒闲暇时各自圈住她的一只乳房。她被阴茎包围，被只有它们才能给予的快感灌得迷醉，身体沦为供你抽插、摩擦的自慰器具。");
         outputText("[pg]这体验固然强烈，甚至称得上美妙，但你还有四根阳具需要照料，而她残余的人形已经没剩多少可供你玩弄。就在这时，那些垂落的触手吸引了你的目光。它们并非全都像你的一样带着阳具的形状。有些相当不同……中空而湿润。你放出剩下的四根阴茎去探查这些新来的东西；当它们试探着那些滑腻入口时，迎接你的快感来得既迅猛又强烈。这些是小穴触手！四根尚未满足的阴茎齐齐挺入，陷进呈到面前的吸吮湿洞里。事实证明，霍莉的管状小穴与你充满雄性的绿色肉茎简直天作之合——它们带着亵渎的欢愉吞噬着你的阳具，轻而易举地一尺接一尺咽下那跳动、肿胀的肉。");
         outputText("[pg]你被一场快感的狂欢彻底淹没。它从你的胯间一波波扩散开来，沿着脊柱向上翻涌成浪。随后浪潮拍上你的大脑，就像你体内某个开关被扳下，你陷入了狂乱。你的每一根触手都开始越动越快，以迅速而沉重的抽送刺入各自选定的孔穴——无论是手指、乳沟、嘴巴，还是小穴。你凶狠地重击着每一个洞。每次挺入都有体液喷溅出来，洒落在地。你分不清那是你的还是她的，只知道空气里充满了放纵交合的气味与声响。");
         outputText("[pg]一股庞大的兴奋感在你纤弱的身躯里汹涌升起，面对它，你只觉得自己微不足道，仿佛这具身体太小、太简单，根本承受不住如此折磨般强烈的快感。随着极乐不断堆积，你的阴茎们自行抽动、挺进，眼睛也翻了上去。霍莉在被彻底操弄时，用一双因快感而迷离呆滞的眼睛看着你；当她看到你的 [hips] 开始颤抖、高潮将你吞没时，嘴角还微微扬起。");
         if(get_player().balls > 0)
         {
            outputText("你的 [balls] 紧紧缩向胯间，阵阵收压，规律地排出沉重的精液。");
         }
         outputText("[pg]精液在你的每一根工具里撑起球状的鼓包，从根部一路奔涌穿过肉茎。霍莉柔软的身体也被漂亮地撑胀，那些鼓起的形状挤压着她被触手缠住的身躯。额外的压迫甚至让她的乳房喷出一道糖浆般的液体。最先进入她体内的那一发从她口中通过，把她的下颌撑到极限。那团鼓胀的精块撑开她的喉咙，沿着食道滑下，最终从你张开的、泛紫的龟头中冲出，在她等待着的腹中炸开。她的双眼困惑地睁大，腹部被精液塞满，却连一滴咸味都没能尝到。");
         outputText("[pg]当那些满载精液的鼓包继续向前推进时，你的身体已经挤出了下一轮");
         if(get_player().cumQ() > 500)
         {
            outputText(",又一轮");
         }
         if(get_player().cumQ() > 1400)
         {
            outputText("……再一轮");
         }
         outputText("。又一发精液抵达你其中一根龟头，你从一根被她手握着的肉茎里射出黏稠的一发，喷进霍莉的头发。另一边也紧随其后，将一股乳白色浓浆喷到她脸上，几乎用精液把这树妖的眼睛粘得睁不开。两根夹在乳间抽送的藤茎接着射精。第一根几乎看不见，因为它深深埋在她那对迷人的G罩杯之间，但你能感觉到。温热在她乳间漫开，带着微妙的湿润热意，让你的另一根触手射得更加猛烈。它喷得力道十足，精液撞上她的脖颈和下巴又反弹下来，落在她乳房顶端，将两团乳肉都镀上一层白浊。");
         outputText("[pg]当你的精液灌入霍莉的阴道时，她又一次高潮，花瓣也随之被微微撑变了形。她的小穴触手同样被你高潮的力量撑开，因在内部爆发的精液鼓包而胀大。精液和爱液从那些数不清的小穴里滴落——足足五个。那些小穴可不只是被动地塞满而已。它们在自身极乐的时刻仍饥渴地按摩着你，甚至生出些许吸力，从你的 [balls] 里榨出更多精液。你胜利般咆哮，十根同时猛顶，在快感余韵中把它们尽可能深地推进各自选定的位置，一边喷射一边颤抖。");
         outputText("[pg]过了一会儿，你才回过神来。你那无数触手已经缩回胯间，不过其中相当一部分都沾着明显的雌性气味。霍莉瘫靠在她的树里，身上覆着一层珍珠般的光泽，只可能是你的浓稠精液。她喘息着，精液毫无阻碍地从她体内流出、淌过身体，甚至还从树冠上滴落。");
         outputText("[pg]你舒展肩膀，活动开僵硬的关节，走到这个困惑的精液容器面前说道，[say: 小花，这才叫播种。] 霍莉浑身一颤，从小穴里喷出一股你的白浊。你笑了笑，穿好衣服后离开，感到无比餍足。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.4),DynStat.Sens(-3),DynStat.Cor(1));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,594,FlagDict_Impl_.arrayReadInt(_loc1_,594) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         fertilizeHolli();
         fertilizeHolli();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckTheFlower() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你暗自一笑，像蛇挣脱无用旧皮一样脱下你的[armor]，把自己暴露出来。当然，那棵树没有任何反应——它只是一棵树，对吧？于是，你带着几分得意（不止一种意义上），悄悄靠近那朵花，打算用最痛快的方式发泄一下郁闷。花瓣依旧是紫罗兰般的颜色，闪着你早已习惯的湿润光泽，仿佛只要你一靠近，它就会凭空渗出水分。里面的褶皱看起来更柔软了些，虽然也更红了一点，还不断滴落着香甜的花蜜。");
         outputText("[pg]你俯下身闻了闻——毕竟，稍微来点前戏也不错。那花朵小穴的气味辛辣而甜腻，浓烈得无可否认。空气中肉眼可见地蒸腾着这株木质小穴散发出的蜜甜热意，你闭上眼，好更仔细地品味它。那气味里有一股鲜明的雌性底调，甜腻得黏在你的鼻腔里，让你的腰胯间泛起一阵愉快的酥麻。");
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]里也渐渐湿润起来，但你现在正专注于自己的雄性一面。你那被冷落的小穴只能先等着了。");
         }
         outputText("你的额头冒出一层炽热的汗意，但这究竟是源于你自己的兴奋、植物的热度，还是它汁液里的某种化学物质，你也分不清。");
         outputText("[pg]你还没来得及退开，就听见有什么东西以闪电般的速度撕裂空气，嘶嘶声直撞耳膜。几乎同一时间，触手（雄蕊？）猛地缠住你的脖子、头部和耳朵，瞬间绷得笔直。你的[face]被粗暴地拽进那湿亮的洞口，柔软的花瓣褶皱把糖浆般的甜腻抹满你的鼻子和嘴。你一边挣扎着想要脱身，却又忍不住更深地吸入那股气息；而每一次挣动、每一次喘息，[eachCock]都变得更热、更硬，因触感的饥渴而搏动。随着时间推移，你挣扎的动机也从逃脱变成了交媾。比起逃走，你更在乎的是把鸡巴插进这个芳香的肉壶里。");
         outputText("[pg]你发疯般把那些鞭子似的藤蔓从脸上抓开，随后在拉力突然松脱时向后倒去，整个人翻滚着摔倒在地。你仰面重重落下，喘息不止，却立刻试图起身，因为胯间那白热的欲望正驱使着你。你攀向自己的[feet]时，触手从上方垂落下来，绕过你的手臂，缠住你的肩膀，甚至搭上你的[chest]。它们在你站稳[feet]之前就把你吊了起来，另一根藤蔓则将你的手腕反绞到身后，牢牢束缚住。你愚蠢地向前挺动腰臀，挣扎着想要够到那植物皱起的开口，但这番尝试毫无结果。");
         outputText("[pg]你绞尽脑汁地想办法，片刻后却暂时接受了自己的处境，沉甸甸地瘫在那些强韧的纤维触手中。也许这正是那反常生物想要的；你一放弃掌控，那些卷须便把你荡得更近，近到让[oneCock]能亲上那温暖湿润的洞口。惯性又把你带离更大快感的许诺，只留下你的" + get_player().cockDescript(_loc1_) + "顶端被润滑液和它自身沉甸甸的快感液珠浸得湿滑。等你荡回来时，有几寸幸运地嵌了进去，你发现自己不由自主地呻吟出声。");
         outputText("[pg]你被来回摆荡，被一副灌木编成的吊带高高悬着，仿佛它就是存心要挑逗你。起初，你尝到天堂的滋味，却只有你的" + get_player().cockHead(_loc1_) + "能感受到。随后，你又被晾在风中，唯一的性刺激只剩凉风掠过你湿润的顶端。一次又一次，那株植物反复撩拨你，直到你失去了时间感。你身上最像钟表的东西，只剩[balls]里轻柔的搏动，以及那逐渐增强的胀痛。啊，真是疼得要命！你感觉自己绷得像一根正在调音的竖琴弦，可那乐师却只是一味转紧弦轴，不断加压，直到你觉得自己就快断掉。你唯一的慰藉，是花朵甜吻带来的片刻极乐；那令人兴奋的快感，正慢慢变成一种难熬的痛苦地狱。");
         outputText("[pg]在一次格外不知羞耻的呻吟中，你意识到自己每次钟摆般荡过去时都插得更深了一点。幸运的是，这棵腐化之树的木质欲望想必也像你一样不断高涨；又经过几次缓慢的摆荡后，你的" + get_player().cockDescript(_loc1_) + "已经滑入了四分之三");
         if(get_player().cockArea(_loc1_) >= 150)
         {
            outputText("，顺着树干滑下去，就好像它整个内部都是一个等着被插的大号小穴");
         }
         outputText("。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的其他阴茎");
            if(get_player().cockTotal() > 2)
            {
               outputText("摩擦着");
            }
            else
            {
               outputText("摩擦着");
            }
            outputText("湿润的外层花瓣，感官上无比撩人，同时把透明的先列腺液滴洒在花瓣上。");
         }
         outputText("啧溜——你滑了出来。咕啵——你又滑了进去，这一次一直没到");
         if(get_player().hasSheath())
         {
            outputText("鞘");
         }
         else
         {
            outputText("根部");
         }
         if(get_player().balls > 0)
         {
            outputText("，你咕噜作响的睾丸拍打着花朵边缘");
         }
         outputText("，还伴随着一小股甜腻润滑液喷出。");
         outputText("[pg]你已经被撩拨得太久，哪怕只是这短暂的、柔软湿滑又紧致的触感，也让你的身体一阵绷紧，温热的快感在体内不断攀升。你尽可能用[legs]缠住下方的树干，任由快感吞没自己；每当藤蔓把你拉开，你就把你的" + get_player().cockDescript(_loc1_) + "狠狠顶向那瓣片包裹的小穴。你像恶魔的宠物一样发情抽插，被快感和欲望折磨得半疯，强烈到足以压倒一切理智。狂喜如吞没一切的潮水般涌上来，把你的视野染成粉红；你双眼上翻，[eachCock]也随之胀粗。");
         outputText("[pg]精液以异乎寻常的力道从你的[cocks]中喷射而出，把花朵内部涂满白浊");
         if(get_player().cockTotal() > 1)
         {
            outputText("，而你的多根巨物则让紫色花苞的外侧也淋满了乳白精浆");
         }
         outputText("。");
         if(get_player().cumQ() > 500)
         {
            outputText("一股股珍珠般的精液从你的射精口猛然涌出，多到足以装满一只小瓶，被你因高潮而颤抖的深处肌肉推送进树干里；你甚至发誓，能听见自己抽插时发出的湿响声调变高，被这被灌满的腔体改变了音色。");
         }
         if(get_player().cumQ() > 1500)
         {
            outputText("一波浓稠的黏液从你仍在抽动的肉棒下方涌出——你已经把这棵树灌得超过了它的容量，而你[feet]下方正在形成的厚厚水洼，就是你雄风的最好证明。");
         }
         if(get_player().hasVagina())
         {
            outputText("你那饥渴的小穴在这场交合中被冷落了太久，此刻也颤抖着，随之");
            if(get_player().wetness() < 4)
            {
               outputText("渗出");
            }
            else
            {
               outputText("喷洒");
            }
            outputText("了你自己的雌性淫液，仿佛也在共鸣。");
         }
         outputText("仿佛过了永远那么久，从你饱受摧残的肉棒中喷涌的精种终于停止流淌。随着你的分身软下来，触手将你荡开，轻轻把你放到地上。");
         outputText("[pg]你叹了口气，精疲力尽，体内的精液也被榨得一干二净。真是爽翻了！经历了那场折腾之后，你的[armor]很容易就穿了回去，只是肌肉还有些酸痛。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         get_player().changeFatigue(5);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) < 1000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,597,FlagDict_Impl_.arrayReadInt(_loc2_,597) + 5);
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,594,FlagDict_Impl_.arrayReadInt(_loc2_,594) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckPlantGrowsToLevel2() : void
      {
         var backFunc:Function;
         var destroyFunc:Function;
         var _g:HolliScene;
         clearOutput();
         holliSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,596,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,597,0);
         outputText("藤蔓吱嘎作响、绷断碎裂的声音把你的注意力引向营地一角，那株小植物就在那里生长。你立刻朝那个方向冲去，举起你的[weapon]，以防需要战斗。还没等你绕过中间最后一块大石，那阵剧烈的声响就已经平息，只留下你疑惑到底发生了什么。好吧，你并不用等太久——你飞快绕过障碍，在眼前的景象前猛地停住，脚下滑出一段距离。");
         outputText("[pg]原本那株像小树一样的幼苗，如今已经变成了一朵齐腰高、色彩与形态都异乎寻常的花。中央的茎比之前粗壮了许多，虽然那些熟悉的叶片仍在，而且数量更多了，但真正吸引你目光的，是顶在植株上的那朵淫猥花朵。鲜艳的紫色花瓣展开成直径两英尺的圆面，向内弯曲成一个巨大的中央花苞时泛起虹彩。在那处腔体里，数十根雄蕊环绕着中央的花柱，花柱末端圆润地张开，表面斑驳；这些植物器官正以你从未见过的方式蠕动着。它们看起来……很色情。比起花朵，更像是该长在胯间的东西。你注视着它，鲜艳的花瓣逐渐湿润，表面被花蜜浸得光滑发亮，那花蜜甜腻而温暖，甚至让花朵上方的空气都化作一片令人迷醉的雾气。");
         outputText("[pg]你的皮肤泛起潮热，身体对这株幼芽明显的性诱惑产生了反应。你意识到，它想让你操它。");
         if(get_player().get_gender() == 0)
         {
            outputText("它可真倒霉！你才不会把时间浪费在生殖器这种蠢东西上。");
         }
         outputText("这是玛莱所谓的礼物吗？");
         if(get_player().get_gender() > 0)
         {
            outputText("嗯，你倒是可以试试看……光是待在它旁边，就似乎会让你慢慢兴奋起来。");
         }
         outputText("当然，摧毁它才是最安全的选择。");
         dynStats(DynStat.Lust(33),DynStat.NoScale);
         if(get_silly())
         {
            outputText("[pg]<b>怎么办？</b>");
         }
         else
         {
            outputText("[pg]<b>你要怎么做？</b>");
         }
         menu();
         if(get_player().hasCockThatFits(100) && get_player().get_lust() >= 33)
         {
            addButton(0,"操它",fuckFuckingFuckFlowerP2);
         }
         else
         {
            addButtonDisabled(0,"操它");
         }
         if(get_player().hasVagina() && get_player().get_lust() >= 33)
         {
            addButton(1,"骑上雄蕊",rideDatFuckingFukkFlowerP2);
         }
         else
         {
            addButtonDisabled(1,"骑上雄蕊");
         }
         _g = this;
         destroyFunc = destroyDatFuckingPlantAtP2;
         backFunc = playerMenu;
         addButton(10,"摧毁它",function():void
         {
            _g.holliDestroyPrompt(destroyFunc,backFunc);
         });
         addButton(14,"什么都不做",playerMenu);
      }
      
      public function fuckHolliInZeFlowerPuss() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你露出会心一笑，把你的[armor]扔到一边，说道：[say: 开始吧。][EachCock]从你身上硬挺而骄傲地翘起，直指面前那位令人着迷的女人。她从树上的栖身处俯下身，左右转动肩膀，让自己浅绿色的丰满胸部来回晃动，低垂的硕大乳房上还挂着一缕缕糖浆。");
         outputText("[pg][saystart]那就过来吧，");
         if(get_player().get_tallness() < 84)
         {
            outputText("小");
         }
         else
         {
            outputText("大");
         }
         outputText("[boy]，[sayend]这个树上的荡妇用沙哑的娇声提议道：[say: 我给你准备了点甜头。]她捏住自己的乳头，喘息起来，深色的甜汁湿漉漉地滴进土里，同时招手示意你靠近。");
         outputText("[pg]你自信地挺着阳具上前，把勃起的肉棒压进那道喷涌糖浆的沟壑里，弄得自己身上到处都是液体。湿黏的挤压声传入耳中，[oneCock]被那对晃动的G罩杯包裹住；当那两团沉甸甸的乳球抬起、沿着你敏感的棒身摩擦时，一缕缕琥珀色的液体在你的胯间与它们之间拉开丝线。");
         if(get_player().cockTotal() > 1)
         {
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根阴茎偏");
            }
            else
            {
               outputText("你其余的阴茎偏");
            }
            outputText("向一侧，在黄油般光滑的肌肤上滑过时，把那黏液抹出一道道痕迹。");
         }
         outputText("恶魔树妖的手伸向下方，去");
         if(get_player().balls > 0)
         {
            outputText("托住你的[balls]，轻轻揉捏你的阴囊");
         }
         else
         {
            outputText("轻柔地爱抚你的");
            if(get_player().hasSheath())
            {
               outputText("鞘");
            }
            else
            {
               outputText("胯间");
            }
         }
         outputText("，像是在鼓励你。你则将[hips]向上顶起，更好地把自己的肉棒送到她面前享受爱抚。");
         outputText("[pg]这位动弹不得的美人幸福地叹了口气");
         if(get_player().cockArea(_loc1_) < 100)
         {
            outputText("俯身亲吻顶端，张开亮泽的绿色唇瓣将它吮入口中，吸吮的力道恰到好处，让你的" + get_player().cockHead(_loc1_) + "泛起淫靡的暖意。");
         }
         else
         {
            outputText("沿着你巨大高耸的肉棒上下亲吻，用亮泽的绿色唇瓣把你的尿道凸起舔得涎水淋漓，让那里更加湿得一塌糊涂。");
         }
         outputText("你抓住她双乳的边缘用力挤压，让它们紧紧夹住自己，并上下滑动。植物女闪闪发亮的金色眼眸与你对上；在她取悦你的" + get_player().cockDescript(_loc1_) + "时，她的双手覆到你的手背上，帮你完成这场快速的乳交。");
         outputText("[pg][say: 来吧，让我尝尝味道，]这个饥渴的荡妇低声鼓励道，拍了拍自己的双乳，让它们在你周围晃动，震颤传遍你的肉棒。当你开始让那对乳房在你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸");
         }
         else
         {
            outputText("胯间");
         }
         outputText("，湿漉漉地拍打着你。很快，她柔软胸乳那滑腻的触感就让你急切地抽动起来，淌下一道道滚热的先列腺液。你随时都要射出来了，体内那股灼热的快感也越扩越远。那双金黑相间的眼睛恳求般望向你，苍绿色的脸颊饥渴地凹陷下去；你欣快地释放出来，弓起背脊，把那对沉甸甸的乳房沿着你的整根肉棒压下去。");
         outputText("[pg]一股精液像喷泉一样射向");
         if(get_player().cockArea(_loc1_) >= 100)
         {
            outputText("空中，在那里停留片刻后，又洒落到植物女孩叶色的头发和脸上，形成一层薄纱般的罩幕。");
         }
         else
         {
            outputText("她的嘴里。她一边被你灌入滚热的浓精，一边发出响亮的吞咽声，努力把它咽下去。吞了几口后，她向后仰去，任由你把精液射向空中，好让它落满她的脸和头发，化作一层薄纱般的罩幕。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("你不断喷出一股股浓稠的精液，直到她的身体和树干都被黏液涂满；然后你又射了更多，到处溅洒，直到她看起来与其说是妖精生物，不如说更像一挂黏糊糊的瀑布。");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("不知不觉间，你们俩周围已经积起一片小湖，还有一条小河顺着坡道从营地流走。");
         }
         outputText("黏糊糊的颜射之下露出一个恶作剧般的笑容，紧接着，一条长得不自然的舌头伸了出来，把一团团精液卷进树妖饥渴的嘴里。等她终于能再次看清东西时，女孩捏了捏自己的乳房，亲昵地亲吻你的肉棒，几乎像是在崇拜它一样，用又湿又甜的舌舔侍奉着它。");
         outputText("[pg]你带着满足的叹息松开拥抱，欣赏着自己肉棒此刻的模样：它滴着乳白色的浆液，还在高潮后愉悦的余韵中微微跳动。欲望带来的压力已经减弱了，尽管你的[balls]里仍残留着一丝骚动，而且你依旧相当坚挺。");
         outputText("[pg]苍白的双手伸出来抚弄你，接触到你的同时，树女孩用安抚般的声音问道：[say:射出那么多种子之后，你居然还硬着？哎呀呀……你可真有一株特别的小树苗。把它放进一个舒服又肥沃的花盆里，好不好？]");
         outputText("[pg]你翻了翻白眼，随意地摸了摸下巴……你有没有时间——哇，喂！几十条触手从上方垂落下来，合力发动攻击，齐齐撞上你的背。单独一条来看，它们并不算强，但合在一起的冲击力仍然重得让你踉跄向前，直接撞进霍莉的");
         if(get_player().get_tallness() < 60)
         {
            outputText("乳房");
         }
         else
         {
            outputText("怀抱");
         }
         outputText("。[EachCock]没有痛苦地撞上树皮，而是滑进了某个温暖湿润、跳动又柔顺的地方。那是一个黏人而紧致的包裹，轻柔地在你的性器");
         if(get_player().cockTotal() > 1)
         {
            outputText("周围起伏，以非同寻常的热切揉弄着你那一束肉棒");
         }
         else
         {
            outputText("周围起伏，以非同寻常的热切揉弄着你的家伙");
         }
         outputText("。当你敏感的性器被迫插进那销魂的小穴时，你恼火的闷哼立刻消失无踪；与此同时，柔软的乳房压在");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("你的乳房上");
         }
         else
         {
            outputText("你的[chest]上");
         }
         outputText("，你索性放弃挣扎，直接吻上树妖的嘴唇，还因恼火而粗暴地咬住她的下唇。");
         outputText("[pg]霍莉剥夺了你的选择，但如果非要做，那也得按你的规矩来。你的手指沿着她臀部与树干之间的缝隙探入，摸到一只紧实翘挺、正好能抓住的小屁股。随后，你把胯部向后一拉，仍咬着她的嘴唇，猛地一挺到底，将你的[cocks]狠狠送进她那淌着黏液、灌满花蜜的小穴。你松开她的嘴唇，带着威胁意味对她低吼，像野兽般卖力地耕弄着她的田地。");
         outputText("[pg][say: 爽、爽死了！噢噢……]霍莉呻吟着，紧紧攀住你，冲你噘起下唇，[say: 占有我！给我播种！求你给我播种吧，[name]！]");
         outputText("[pg]树妖那可怜兮兮的床笫软语让你烦躁地低吼一声，随手拧了下她的乳头，把她的哀求变成一声尖细的呜咽。与此同时，湿滑的外层花瓣已经在你的[hips]周围舒展开来，又在你的[butt]后方整齐合拢。这限制了你的动作幅度，但要好好捣弄这只小穴，你也不必退得那么远。你把她干得更快、更狠，每一下都重重撞进那紧窄的肉穴，震得上方的树叶沙沙作响。每次胯部相撞，她都会把甜美花蜜喷洒到你的[legs]上；很快，她那迎合你的内壁就不受控制地颤抖起来，甚至在每一次吞没肉棒的挺入中，喷出一股股芬芳的花蜜。");
         outputText("[pg]霍莉那带着黑环的眼睛向上翻去，嘴唇无声地颤抖。光是这副景象就足以逼出你自己的释放；你将[balls]中的精液尽数倾泻进那颤动的蜜罐里。你再次吻住她，享受着这一刻，胯部随着她肌肉的收缩缓缓抽送，将更多种子挤进她的沟壑。原本束缚着你的花瓣大大张开，滴下同样湿润的液体，凝成大滴往下淌。这一刻就像雨中的泥地摔跤一样狼藉，是一场污秽又飞溅四溢的性爱狂潮。");
         outputText("[pg]等你彻底播完种，你踉跄着抽身退开，欲火被榨得一干二净，只觉得体内除了尘土什么都不剩。那朵花……简直把你吸干了！一阵少女般的咯咯笑声把你从恍惚中唤醒，你看到霍莉已经恢复过来，花瓣也重新合拢，只是胸前双乳仍无遮无掩地晃着。");
         outputText("[pg][say: 献给我高贵勇者的一杯饮品，]她讽刺地说道，抬起一只乳房。你感激地享用了她递来的甘露；那液体让你疲惫的身体重新焕发活力，恢复到先前的状态，丝毫没有留下不适。");
         outputText("[pg]你穿好衣服准备离开时，霍莉噘着嘴，竭尽所能地诱惑你，但你总不能整天待在营地里做爱。也许等你打败恶魔之后，可以回来试试那永不停歇的交配区……");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,594,FlagDict_Impl_.arrayReadInt(_loc2_,594) + 1);
         fertilizeHolli();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckFuckingFuckFlowerP2() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(100);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你解开[armor]，带着唯一的念头走向那株脉动的植物：操它。看到[eachCock]的瞬间，花瓣便愉快地颤动起来，表面立刻闪着湿润的光，为了取悦你而变得滑腻潮湿。你俯下身，吸入那花香甜美却又撩人的气息，任由它轻挠你的鼻腔，同时漫不经心地抚弄着[oneCock]。你的男性器官很快进入了你最喜欢的状态——坚硬而敏感，随时准备不顾一切地插进最近那组湿润的唇瓣里。与此同时，你能看到花瓶般的花腔内，那些扭动的卷须正饥渴地挥舞着。");
         outputText("[pg]你觉得有趣地笑了起来；既然它如此应得这份浓稠的款待，你又凭什么拒绝呢？你松开自己的" + get_player().cockDescript(_loc1_) + "，伸手绕过柔软的花瓣，摸向更坚硬的中央花苞，将自己从蜜汁般的拥抱中滑入那脉动着、布满触须的花芯。多汁的温暖包裹住你的肉棒，天鹅绒般柔软的腔室立刻收紧，而花瓣也向内合拢，彼此交叠，直到形成一条足以将你整根吞下的管道。轻柔的吸力开始有节奏地拉扯你的" + get_player().cockHead(_loc1_) + "，让你在里面胀得更大，也更加敏感。紧接着，你先前看到四处涌动的细小卷须伸了上来，开始按摩你的肉棒，像细小而蜿蜒的蛇一样滑过你的皮肤。");
         outputText("[pg]这足以让你的[legs]发颤，你慢慢滑倒在地。那朵花如今已紧紧闭合成一个球茎，吮吸得足够用力，即使你躺下也依旧牢牢咬住你不放。这让茎秆弯折了下去，但这株韧性十足的植物似乎轻松承受住了这份拉扯。一缕缕透明黏液从紧密的封口处渗出，顺着你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("[legs]");
         }
         outputText("流下，汇成一摊黏糊糊的液体。你开始呻吟，抓住茎秆，上下套弄着这层鞘，把这株植物当成它本就该成为的肉棒玩具来使用。淫靡而湿润的挤压声在空气中响起，");
         if(get_player().cor < 33)
         {
            outputText("你怯生生地环顾四周，希望自己没有引来观众。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你担忧地瞥向四周，既希望又害怕有人撞见这一幕。");
         }
         else
         {
            outputText("你环顾四周，希望有人能撞见你正在上演的这场性感表演。");
         }
         outputText("[pg]此刻你在难以忍受的欲火和无可否认的快感中喘息不止，彻底抛开了一切体面，转而疯狂抽插，[hips]一次次弹离地面数寸。花朵内部对你的" + get_player().cockDescript(_loc1_) + "而言，简直是湿滑如丝的天堂，一个仿佛能带来无尽快感、不断吮吸挤压的小穴。在那贪婪的喉腔深处，无数触须扭动缠绕，最长的几根环住你的根部");
         if(get_player().hasSheath())
         {
            outputText("，在你被侵犯的鞘内");
         }
         outputText("。大量血液被困在你的" + get_player().cockDescript(_loc1_) + "里，让它变得前所未有地粗大坚硬，随着每一次心跳都在束缚中顽强地抽动。");
         outputText("[pg]其中一根触须在你的" + get_player().cockHead(_loc1_) + "周围绕了一会儿，随后几乎没有任何预兆或停顿，便猛地向前刺入你脆弱的马眼。突如其来的贯入并没有带来你预想中的疼痛，反倒彻底颠覆了你的认知。真要说的话，那感觉甚至有点舒服……就像有一根温暖湿滑的手指，从内向外抚摸着你的阴茎。它在你体内进进出出，从里面套弄你，一边在你体内爱抚，一边把快感钻进你的核心。你因为抽插花苞的用力，以及不断高涨的欲望浪潮而浑身发烫，身体开始痉挛般抽搐。");
         outputText("[pg]随着你的阴茎膨胀得更大，内部的吸力骤然增强。你发出一声野兽般快意的吼叫，弓起背，双手把自己的" + get_player().cockDescript(_loc1_) + "尽可能深地推进植物的喉腔里。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]咕噜作响，那声音出奇地愉悦，并紧紧贴在你的胯间。");
         }
         outputText("在你体内，你能感到喷涌而出的滚烫液体轰然爆发，用液态的高潮极乐融化前方的一切。当那根插入尿道的触须从你湿滑狼藉的肉缝中抽出时，一声低吟从你唇间迸出，紧接着翻涌起泡的精液也随之奔流而出，冲进那甜美吮吸的花蜜壶中。");
         if(get_player().cumQ() > 500)
         {
            outputText("你毫不停歇地倾泻出丰沛的精华，而这株植物立刻开始吞饮，茎秆被一团团圆滚滚的精液撑得鼓起，并把它们送入地下。");
         }
         if(get_player().cumQ() > 1500)
         {
            outputText("很快，那细小的茎秆便再也吞不下全部。精液先是在你的家伙根部周围泛起泡沫、喷溅了一阵，随后真正如潮水般涌出，将你浸得湿透。");
         }
         outputText("[pg]你满足而略显疲惫地瘫倒下来，松开了被你灌满的小穴花。它缓慢而吃力地从你高潮后胀大的肉棒上退开，边退边将上面的精液清理干净。它的茎秆上能看见明显的吞咽动作，一个圆鼓鼓的球茎沿着茎秆滑向地下。等茎秆完全挺立起来后，花瓣重新绽放成花，紫色花瓣上那层乳白色的光泽，成了你们这场幽会唯一的痕迹。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,594,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) < 1000)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,597,FlagDict_Impl_.arrayReadInt(_loc2_,597) + 4);
         }
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function flowerGrowsToP3() : void
      {
         var backFunc:Function;
         var destroyFunc:Function;
         var _g:HolliScene;
         clearOutput();
         holliSprite();
         outputText("你又一次听见营地角落里传来奇怪的声响——就是你任由那株污秽灌木生长的那个角落。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) > 0)
         {
            outputText("刚才那番交媾大概只是让它长得更快了。");
         }
         outputText("木头在新重量下弯曲、吱嘎作响的独特声音传入你耳中，而你还没来得及走到那株植物跟前，就已经看见一片枝叶冠盖正朝天空伸展。<b>它已经长成了一棵小树，有树皮，有叶子，什么都有了！</b>你警惕地绕过一块古老立石，想看得更清楚些。");
         outputText("[pg]你首先注意到，那朵阴道状的触手花还在，固定在树侧大约齐腰的位置。它看起来更大了，花瓣巨大而光亮，毫无疑问比以前更能吞下肉棒。这棵树目前还不算粗。你顺着光滑无节的树干继续往上看，见到了最令人惊讶的东西——一对杏仁色的乳头，长在木头上两个小小的、像乳房一样的隆起上。这些圆鼓鼓的突起处，树皮比周围更光滑也更浅。其中一个上面，一缕树汁已经凝成了沉甸甸的一滴，闻起来很甜，像枫糖浆。");
         outputText("[pg]一团湿润的东西落进你的头发里，打断了你的观察。你小心翼翼地用手指碰了碰那块湿处，沾到了一种浓稠黏滑的液体，隐约带着麝香味……还有咸味……是精液！你猛地缩了回去，抬头正好看见半打触手在枝丫间蜷动，彼此摩擦，那场面只能形容为一场充满肉棒欲望的互蹭乱交。好吧，你的小宠物植物正在长大。现在可没什么简单办法能把它除掉了");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,596,3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,597,0);
         menu();
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            addButton(0,"干花",fuckTheFlower);
         }
         else
         {
            addButtonDisabled(0,"干花");
         }
         if(get_player().hasVagina() && get_player().get_lust() >= 33)
         {
            addButton(1,"骑触手",rideTheWalrusP3);
         }
         else
         {
            addButtonDisabled(1,"骑触手");
         }
         addButton(2,"喝树汁",drinkThePlantGirlsSap);
         if(get_player().hasPerk(PerkLib.Dragonfire) || get_player().hasPerk(PerkLib.FireLord) || get_player().hasPerk(PerkLib.Hellfire) || get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) || get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            outputText("，不过如果你下定决心，应该可以用魔法火焰把它烧掉");
            _g = this;
            destroyFunc = torchP3Tree;
            backFunc = playerMenu;
            addButton(10,"烧掉它",function():void
            {
               _g.holliDestroyPrompt(destroyFunc,backFunc);
            });
         }
         else
         {
            addButtonDisabled(10,"烧掉它","你觉得你可以用魔法火焰把它烧掉。");
         }
         outputText("。");
         outputText("[pg]<b>你要怎么做？</b>");
         addButton(14,"不管它",playerMenu);
      }
      
      public function fightHolli() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,923,1);
         holliSprite();
         jojoAssisting = false;
         startCombatImmediate(new Holli());
      }
      
      public function fertilizeHolli(param1:Boolean = true) : void
      {
         var _loc3_:* = null as IMap;
         var _loc2_:Number = 20;
         if(param1 && get_player().hasCock())
         {
            _loc2_ += get_player().cumQ() / 300;
            if(_loc2_ > 40)
            {
               _loc2_ = 40;
            }
            if(get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               _loc2_ += 10;
            }
            if(get_player().hasPerk(PerkLib.FerasBoonAlpha))
            {
               _loc2_ += 10;
            }
            if(get_player().hasPerk(PerkLib.ElvenBounty))
            {
               _loc2_ += 2;
            }
         }
         if(!param1 && get_player().hasVagina())
         {
            _loc2_ += get_player().totalFertility() / 5;
            if(_loc2_ > 40)
            {
               _loc2_ = 40;
            }
            if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
            {
               _loc2_ += 10;
            }
            if(get_player().hasPerk(PerkLib.FerasBoonBreedingBitch))
            {
               _loc2_ += 10;
            }
            if(get_player().hasPerk(PerkLib.ElvenBounty))
            {
               _loc2_ += 2;
            }
         }
         if(_loc2_ >= Utils.rand(101))
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,600,FlagDict_Impl_.arrayReadInt(_loc3_,600) + (1 + Utils.rand(Math.floor(_loc2_ / 10))));
         }
      }
      
      public function enjoyYourBadEndBIYAAAATCH() : void
      {
         clearOutput();
         outputText("那恶魔胜利地尖啸着，将你战败的身体高高举起，开始摇晃起来。");
         if(jojoAssisting)
         {
            outputText("乔乔丢下手里的柴火，试图攻击她，但她用一根树枝狠狠将他扫到一旁，打得他捂着肚子，一边干呕一边踉跄退开；她又把注意力转回到你身上，完全被你吸引住了。她渗出的树液成股流淌，在逐渐熄灭的火焰中修复着伤口。");
         }
         outputText("[say:哦，我的小肉块……]霍莉用危险的语气柔声说道。[say:我之前说得还不够清楚吗？你存在的意义就是崇拜我。既然你不肯把心献给我，那我就只好收下你的身体。]一根花藤从她上方的枝条间垂落，滑进你的嘴里，开始将花蜜滴进你的喉咙。你被迫在喝下去和溺死之间选择，只能不情不愿地吞咽，每咽下一口都觉得头脑更加昏沉。");
         if(get_player().get_gender() == 1 || Utils.rand(2) == 0 && get_player().hasCock())
         {
            outputText("[pg]她胡乱地剥下你的[armor]，粗暴地拉扯撕裂，在你的[skinfurscales]上留下了深深的勒痕，然后才将其解开。[OneCock]暴露在外，她低下头，嘴唇凑向[cockHead biggest]，然后");
            if(get_player().cocks[get_player().biggestCockIndex()].cockThickness > 6)
            {
               outputText("把下巴张得大得让你不禁皱起脸，");
            }
            outputText("一口将你吞没。霍莉的舌头舔弄着你的尿道口，她只抬眼看了你一瞬，确认你正在看。");
            outputText("[pg]一旦抓住了你的注意力，她便含着你的肉棒露出一个令人放松戒心的微笑……直到你感觉末端传来一阵刺痛。一根细小的茎滑进你的尿道口，你惊恐地僵住了。霍莉的眼中因你的不适而闪着愉悦的笑意，她开始用双唇沿着你的[cock biggest]上下套弄，每当那插入物刮过你的体内、让你一阵抽搐时，她就含着它轻声发笑。内外同时的刺激只持续了几分钟，你被药性弄得昏沉的脑袋就已逼近高潮边缘，阴茎也急切地抽动起来。霍莉察觉到这一点，停下当前这次下压，再次注视着你。");
            outputText("[pg]你被快感蒙住的双眼瞪着她的脸，足足过了几分钟，那即将到来的高潮才以冰川般缓慢的速度退去——当恶魔判断你已经足够平静后，");
            if(get_player().biggestCockLength() > 24)
            {
               outputText("她的脖子怪异地起伏、伸长，她的脑袋开始以惊人的速度沿着你那根足有" + Utils.num2Text(Math.round(get_player().biggestCockLength())) + "长的肉棒一路下移，同时把那根茎也往里推。");
            }
            else
            {
               outputText("她猛地一下将头吞到你肉棒根部，连那根茎也一并带了进去。");
            }
            outputText("整个[cock biggest]被刺入、又被吸进她湿热紧裹的喉咙，这感觉把你重新推向边缘，甚至变成了霍莉必须赶在你的神经爆发前吞到底部的一场竞赛。她湿润的双唇淫靡地啪嗒一声撞上你的胯部，但她的舌头仍继续深入你的体内，直到抵达你的前列腺才停下。一小块凸起沿着细茎射出，强行穿过你的尿道口进入阴茎，嵌进你的腺体里。等它就位后，霍莉才抽回嘴和舌头，接着用手握住你的肉棒，激烈地为你套弄起来。");
            outputText("[pg]这实在太过火了；你的高潮如洪水般涌来");
            if(get_player().balls > 0)
            {
               outputText("，你的[balls]也向身体收紧，准备倾泻而出");
            }
            outputText("。你的眼睛向上翻去，身体一次又一次绷紧，却什么也没有射出来。当这场干性高潮结束时，你开始感觉到前列腺上传来一股压力。");
            outputText("[pg]霍莉微微一笑。[say: 没错，我的玩具……浇灌我的小种子。让它长大。] 肿胀感越发强烈，前列腺上的压力又逼出一股液体，让你浑身一颤……而它同样没能见到天日。每一次小小的高潮都会让肿胀加剧，而这又会引发下一次。当你感觉前列腺能产出的东西已经到了极限，拼命盼着能喘口气时，那里忽然像被一整只针插垫扎满般刺痛，随后一阵颤动的暖意与生长感弥漫开来，痛苦又愉悦的喷射再次开始。你终于能感觉到一股压力开始沿着你的肉棒上升，预感到释放即将到来。它一点点逼近，越来越近，直至顶端，仿佛第一滴就要探出头来。你低头看去，霍莉也与你一同望向那里，看到的却是……一个小小的绿色突起。她笑着俯下身，小心翼翼地吻了吻它；一道清晰可见的震颤顺着你的身体传回去，你的前列腺热得像要烧起来。嫩芽从你的[cock biggest]末端猛然爆开，化作一根肉质触手在空中抽动，带得你的阴茎疯狂摇摆，并从末端裂开的缝隙里滴淌着你的精液。此刻，你能感觉到体内还有更多嫩芽，");
            if(get_player().balls > 0)
            {
               outputText("朝另一个方向迁入你的[balls]，缠住并渗入其中，用同样的暖意将它们填满，随后从内向外顶压着你的阴囊。");
            }
            else
            {
               outputText("探索着你身体的深处，又蜷回到你的[skin]表面。");
            }
            outputText("当嫩芽硬生生钻出时，你一阵反胃；它们从你的胯下爬出，沿着你的[legs]外侧向下蔓延，扎根进干燥的泥土里。嫩枝变粗，成了纤维般的根须，形成一截支撑着你的树干，把你推得更靠近霍莉，也更低地贴向地面，直到你那不断扭动、顶端长着触手的肉棒，正好对准她的小穴之花，并处在她随手可及的位置。");
            outputText("[pg][say: 愚蠢的小肉块，]恶魔居高临下地对你微笑，[say: 我<b>就是</b>玛瑞斯。这片土地上诞生的一切，都有我的一部分。现在，你也一样。] 在她无声的命令下，你的卷须伸向霍莉的下体，拖着你的[cock biggest]进入她湿润而丰饶的深处，而她则用双臂环住了你……");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(5),DynStat.Sens(20));
            menu();
            addButton(0,"下一步",holliPlaysWithPenisesBadEnd);
         }
         else if(get_player().hasVagina())
         {
            outputText("[pg]她不耐烦地扯住你的[armor]，撕开扣带，把它从你身上剥下，露出你的胯下。她抚过你两腿之间，低声呢喃道：[say: 哦，我的宠物，我们要在你这道小犁沟里种下美丽的东西。]她把你举过头顶");
            if(get_player().isTaur())
            {
               outputText("，并将你转了个身");
            }
            outputText("，随后恶魔把脸埋进你的[vagina]，用她湿润而灵活的舌头刺入其中。");
            outputText("[pg]突如其来的插入让你惊叫出声，但霍莉既不放松也不拖延，越过敏感的入口，直入你的小穴深处，顶到宫颈时带来一阵刺痛。你不安地低头看向恶魔，而她以恶魔般的笑容迎上你的目光。又是一顶、一夹，她的舌头便滑过通往子宫的门槛，让你的身体不由自主地绷紧。");
            outputText("[pg]霍莉的舌头探入你体内深处，她愉快地哼着声。突然，你感觉一个小小的鼓包穿过你的入口，片刻之后，恶魔的舌头抽了出去。她重新直起身，与视线平齐，你的好奇心越发强烈——刚才那个鼓包是什么？她没有回答，只是轻柔地吻上你的嘴唇，并把你的头发从脸上拨开。[say: 现在才到有趣的部分。]");
            outputText("[pg]有什么东西");
            if(!get_player().isGoo() && !get_player().hasTailInsteadOfLegs())
            {
               outputText("滑入你的双腿之间，并且");
            }
            outputText("在你的[vagina]口试探着。一根阴茎般的卷须滑到位置上；方才恶魔用舌头探弄你时，你完全没注意到它。它急切地抵着入口，想要进入。被她的花蜜弄得神志混沌、四肢发软的你，根本无力阻止；它在你润滑充分的阴唇间穿行，带来柔软顺滑的摩擦，逼得你口中逸出一声叹息");
            if(get_player().hasCock())
            {
               outputText("，也让[eachCock]流出一团先列腺液");
            }
            outputText("。");
            outputText("[pg]霍莉看着你身体的背叛，淡淡一笑，随着你放荡的喘息节奏抽动触手。几分钟之内，她的脸色绷紧，你的小穴也被厚重的液体压力灌满。触手抽离时擦过你的阴唇，带出滚烫黏稠的树液，又激起最后一阵潮热。你脸上的表情一定泄露了些许它离开时的失落，因为恶魔捧住你的脸，把你拉得更靠近她。");
            outputText("[pg][say: 哦，我的小玩具……你该不会以为我们已经结束了吧？]她说话时，你从眼角看见另一根卷须垂落到位，紧接着又是五根。尽管理智告诉你不该如此，你的眼睛和嘴仍不由自主地张大，露出期待的笑容；随后，当霍莉下一根粗糙树皮般的树状肉棒挤入你滴着液体的小穴时，你又化作一声呻吟。");
            outputText("[pg]这根触手同样在你之前先达到了高潮，将新一股滚烫黏稠的胶液射入你被填满的小穴，让你感到满胀。它喷涌而出时，霍莉短促地叹了口气，软软地倚到你身上，把柔软的乳房贴上你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("");
            }
            else
            {
               outputText("胸口");
            }
            outputText("。恶魔抬起头，沉重地喘息着。[say:别担心，爱人。等轮到你的时候，你也会这样的。]她抱着你，用那双诡异的漆黑眼眸望进你的眼睛，似乎在等待着什么；随着你起伏的身体渐渐平静下来，她轻抚着你的[hair]。当你的思绪越来越能从被贯穿的快感中抽离出来时，意识也一点点回到你身上。霍莉射出的湿滑而柔软的压力，正随着它从你被撑开的小穴里渗出而逐渐退去；但在它离开后，却留下了一种较轻微、却实实在在的触感。");
            outputText("[pg]你的思绪被打断，又一根粗糙的触手猛地插进你的[vagina]，快感灌满脑海，将理智驱逐殆尽。绿色恶魔再次抽送到高潮，也再一次把你逼到近乎崩溃的边缘，却总是在你真正到达顶点前灌入一股新的黏液，然后抽出射空的触手，换下一轮把你牢牢按住。经过霍莉那些令人难耐的停顿，以及第四、第五根触手的树液浸润，你小穴里的感觉仍在持续变化；等第六根进入时，那里的肉壁仿佛变厚了，紧紧裹住霍莉附肢的柱身，每一寸都像你的[clit]和入口曾经那样敏感，折磨得你全身颤抖。恶魔咬住下唇，这根卷须也随之高潮；当它滑出时，你感觉小穴的内壁仿佛也跟着一起被拖了出来。伴随啵的一声，有什么东西脱离而出。你低头一看，只见一朵肉质、鲜红的花瓣花苞正从你的入口舒展开来。霍莉的眼中闪着兴奋的光，她松开了抓住你的一只手，而你也本能地伸手去触碰从你性器中冒出的植物。最轻微的一抚，都会让近乎高潮的痉挛沿着你小穴内侧一路冲上脊椎根部，而那朵花则滴落着润滑液。");
            if(get_player().hasCock())
            {
               outputText("[OneCock]沿着柱身滴下先列腺液，落到那朵花上，引发又一阵痉挛，也让你的肉棒再次喷涌。看着你被自己失控的体液不断刺激，霍莉笑了起来。");
            }
            outputText("[pg][say:你已经变成一朵多漂亮的花了，我的宠物。]恶魔用最后一根卷须的尖端描摹你新生的花瓣，摧毁了你对肌肉的控制，让你无力地被她握在掌中。霍莉贴近你的身体，将那根卷须缓缓滑入，沿着你绽满花瓣的小穴内侧拖曳而过；那里收缩着，完美贴合入侵者，让你在新生而敏感的阴道每一寸紧窄处都被刺激时，眼睛不由得向上翻去。仅仅两次抽送，你便抵达了顶点，恶魔把你按向她的胸口，同时开口道。[say:如我承诺的那样，现在轮到你了。]");
            outputText("[pg]霍莉的嘴唇猛地贴上你的，用一个吻将你锁住，这吻带着滑腻的花蜜和恶魔般的能量，穿过你的喉咙和躯干，向下直达你的腹股沟，与她喷射的肉棒触手升起的能量汇合。当你的身体在你毁灭性的、渴望已久的高潮中颤抖时，你阴道后部的压力痛苦地膨胀并扩大，沿着你的肉壁向你的入口冲去。当这种感觉重见天日时，霍莉抽身离去，无数属于你自己的长触手从你的小穴和从中生长出来的滑腻粘稠的花瓣之间的缝隙中蜿蜒而出，顺着你的腿向下，顺着你的躯干向上，钻进土壤，并且");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("缠绕在你的乳房周围和下方，将它们永久托起前挺，摆成淫靡的展示");
            }
            else
            {
               outputText("在你的胸前勾勒出一张由纤细常春藤交错而成的格网，垂在你的[nipples]上方恰到好处的位置，稍有一阵强风就会把它们拖拽着擦上去");
            }
            outputText("，然后继续越过你的背部，向上到达你的脖子。触手变粗并成倍增加，用一层年轻的树皮和叶芽包裹住你的前臂和下半[legs]，霍莉的触手松开了你，因为你的触手接管了将你固定在原地的职责，以接受她强加给你的任何快感。当生长平息时，你被留下了一个淫荡的姿势，悬在离地几英尺的地方，双臂举过头顶，背部拱起，以纪念你不可思议的高潮，");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("乳房被藤蔓托住并挤在一起，");
            }
            if(!get_player().hasTailInsteadOfLegs() && !get_player().isGoo())
            {
               outputText("大腿被大大分开，");
            }
            outputText("而你滴着花蜜的花朵性器与[clit]一同暴露在外");
            if(get_player().hasCock())
            {
               outputText("和[eachCock]");
            }
            outputText("不断晃动，永远保持在半勃起的状态。");
            outputText("[pg]包裹着你的幼树在恶魔的一个手势下弯向霍莉，她俯身靠近你。[say:可爱的小玩具……你从一开始就没有机会。我就是玛瑞斯。这个世界上的一切，都有我的一部分。现在，你体内也有了。]这位翠绿的女人阴沉地笑着，藤蔓覆上你的眼睛，让你陷入黑暗。当有什么东西开始顶向你的小穴时，她低声呢喃道，[say:不过，你不会寂寞的……]");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(5),DynStat.Sens(20));
            menu();
            addButton(0,"下一步",girlsGetANiceManToBadEnd);
         }
         else
         {
            get_player().orgasm("Anal");
            dynStats(DynStat.Lib(5),DynStat.Sens(20));
            outputText("[pg]她毫不怜惜地扯下你的[armor]，匆忙之中甚至扯断了扣带。看到你赤裸的胯间，她挑了挑眉，但霍莉并没有停顿太久。[say:我单纯的小玩具……要是抵御这片土地的腐化真有那么容易，恶魔们明天就会被推翻了。]恶魔改变了计划，将你转过身去，把一根手指滑进你的臀缝之间，俯身靠近。");
            if(get_player().ass.analWetness > 0)
            {
               outputText("你堕落的本性背叛了你，那道湿滑的臀缝大大张开，你贪婪而湿润的肛门几乎是在欢迎恶魔整只手进入，将它吞没进去，让你因被压抑的愉悦而发颤。[say:哦，母亲啊！看来这对你来说并不是什么新课题，对吧？我的小娼妇，在我填满你的时候，你会乞求、会呻吟吗？]");
            }
            else if(get_player().analCapacity() < 30)
            {
               outputText("她费了些力气，才把手强行推进你紧缩的穴口。[say:那我们就把这里当作突破口好了。进展也许会慢一点，但旅程本身就是乐趣的一半。]");
            }
            else
            {
               outputText("尽管你紧紧夹住，但你松弛的穴口完全无法阻碍恶魔的探索。[say:啊，你里面可真宽敞！我想我就直接搬进去好了。]");
            }
            outputText("[pg]你身后的霍莉眼神因专注而变得更加幽暗；当你感觉她的附肢在你的肛门里膨胀、扭曲时，你不由得战栗扭动。恶魔的指尖向两侧撑开，迫使你的肛门大大张开，而她的手也开始拉长，把手掌的宽度更深地推入你的穴口。");
            get_player().buttChange(20,true,true,false);
            outputText("在一分多钟痛苦而亲密的刺激与扩张后，霍莉的脸扭成一副狰狞的表情，手臂上也开始青筋暴起。她胸口鼓起一个小小的隆包，短暂地把乳房顶向你，随后穿过她的肩膀。那东西顺着她的手臂滑下，在手腕处停了一瞬，似乎撞上了你因恐惧而本能收紧的[asshole]，接着伴随一阵疼痛的推进，消失在你的后身里。隆包滑过最后几寸，抵达她手掌末端时，她轻轻叹息，而你的下半身也被一股暖意灌满。");
            outputText("[pg][say:这是我给你的礼物，]恶魔低声说道，同时把自己从你体内抽了出来。她退出时，你越过肩头看见她的手被拉长到原来的两倍，掌心一道裂口中渗出黏稠的液体，与你那被折腾过的直肠里仍在滴流的开口如出一辙。那只变形的手慢慢恢复成可辨认的形状，但霍莉的阴阜上又开始鼓起另一个隆包。");
            outputText("[pg][say:啊……啊、啊啊！]她呻吟着，身体颤抖着把那团生长物挤了出来。[say:给、给你，我的玩具——我做出了开启你身体的完美钥匙。]");
            if(get_player().ass.analWetness > 0)
            {
               outputText("无论你怎么努力，都没法把视线顺着后背看得足够远，弄清这恶魔到底对你做了什么。不过，当她把一根几乎和她腿一样粗的肉茎抵上你的[butt]，并将前端探进你湿润而顺从的肛门时，答案便不言自明。尽管不愿承认，想到自己将被如此彻底地填满，你还是期待得浑身一颤。");
            }
            else if(get_player().analCapacity() < 30)
            {
               outputText("霍莉将一根细长阴茎那鲜艳肿胀的龟头斜斜探入你的视野，惊得你的下巴几乎贴上锁骨。看它沿着她胸口伸出的长度，几乎有一英尺半长，还把黏稠的树液滴得你满背都是。恶魔露出扭曲的笑容，沿着你的脊背把它一路推向你的[butt]，然后猛地顶向那个洞口。");
            }
            else
            {
               outputText("恶魔贴上你的后背，乳头擦过你的皮肤，同时把她新长出的东西塞进你的大腿之间。你低头望去，可以看见一根粗大的绿色肉茎从你胯间探出，闪着湿亮的光，还滴落着黏稠的黏液。霍莉又呻吟一声，把它从你双腿之间抽回，接着掰开你的臀瓣，将它猛地插进你的[asshole]。");
            }
            outputText("她那根东西上渗出的树液涂满了你的甬道，");
            if(get_player().ass.analWetness > 0)
            {
               outputText("与你自己的润滑液混在一起，]让她的抽送更加顺畅。霍莉的节奏很快加快，没过多久，你便能感觉到她在你体内抽搐，正逐渐逼近高潮。");
            }
            outputText("[pg][say:哦、哦，我的小玩具，兴奋起来吧，]她喘息道。[say:我马上就要赋予你在这个世、世界上的意义了！]随着恶魔一声尖叫，霍莉的肉茎猛烈喷发，又一波液态暖流灌满了你。她喘着气趴在你背上休息时，你的[asshole]因欲望而发痒；而你自己迟迟未至的高潮却始终悬在触不到的地方，折磨得你几乎发疯。你的恶魔情人将那件迅速瘪下去的工具从你后身抽出，");
            if(get_player().ass.analWetness > 0 || get_player().analCapacity() > 30)
            {
               outputText("让她灌进去的液体沿着你的[legs]泼洒而下。");
            }
            else
            {
               outputText("而你曾经紧致的褶口则本能地尽力收紧，把霍莉的灌注物牢牢困在体内，只漏出寥寥几缕。");
            }
            outputText("霍莉双腿间新长出的肉茎开始萎缩，像被剪下的花一样枯萎、发褐。她带着几分淡淡的嫌恶把它从自己身上拔下，随手丢到一旁，它很快便碎裂成渣。");
            outputText("[pg]你肚腹里的液体开始交融，令皮肤");
            if(get_player().isFurryOrScaley())
            {
               outputText("在你的[skinfurscales]下方");
            }
            outputText("传来令人不安的针刺感。那感觉很快集中到你的胯间，恐慌也随之加剧；当束缚着你的卷须把你从恶魔之树旁推开时，好奇终究压过了恐惧。你再次回头望去，试图看清发生了什么。就在你努力观看时，数百下细小而尖锐的刺痛传来，一些小藤蔓从你臀部下方的身体里开始探出。藤蔓向地面靠近时彼此融合、缠绕成粗壮的枝干，深深扎进泥土，将你固定在原地。它们接入连接着恶魔玛莱与霍莉的根系之网时，你体内的欲望也随之高涨，胯间同样开始肿胀。又一簇细藤从你的腹股沟钻出，向上生长成格状结构，将你的双臂牢牢绑住，");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("叠放在你的胸口上");
            }
            else
            {
               outputText("弯折在身体两侧，双手搭在你的[chest]上");
            }
            outputText("。它们继续越过你的脸，伸到你头顶上方，形成一片类似霍莉自身的树冠。无论你如何挣扎，等它们停止生长时，你已经动弹不得，被锁在一个颇具艺术感的姿势里：头越过肩头回望，[ass]高高挺出");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("，乳房从两侧袒露出来，");
            }
            outputText("而你的[legs]则被臀瓣下方一截粗壮的树干遮掩住。");
            outputText("[pg][say:真可爱，]霍莉赞叹道。[say:你会成为一件很不错的装饰。]这个恶魔将一根手指插进你仍在滴液的肛门，抚弄着括约肌内侧，煽动着你由魔力驱使的欲望。[say:我甚至可能偶尔同意用你来发泄一下……如果我找不到更有趣的幽会对象的话！]她残忍地笑了一声，从你体内抽身而出，退回自己的树中，只留下你盯着她的树皮，欲火闷烧，却又无力满足它。");
            dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
            menu();
            addButton(0,"下一步",holliAndGenderlessSittingInATree);
         }
      }
      
      public function eatHolliFruit() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         clearOutput();
         outputText("你伸手探进霍莉的枝叶间，摘下");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,600) == 1)
         {
            outputText("那颗果实");
         }
         else
         {
            outputText("其中一颗果实");
         }
         outputText("。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,601) == 0)
         {
            outputText("霍莉朝你微笑着问道，[say: 享受咱们结合结出的果实吗？]");
            outputText("[pg]你惊得差点把那颗紫色梨子掉在地上……这东西是因为……因为做爱才长出来的？那个堕落的女人对你点点头，解释道：[say: 不然你以为呢？我会怀孕？我可是棵树。我们结果时，就是字面意义上的结果。]霍莉微微一笑，鼓励你道：[say: 来吧，尝尝看。它们应该很好吃……当然，我自己没吃过就是了。][pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,601,FlagDict_Impl_.arrayReadInt(_loc1_,601) + 1);
         }
         outputText("你咬下一口，甜美的汁液仿佛在果肉中爆开，顺着你的下巴流了下来。它吃起来像甜点一样，你开心地大口啃了起来。转眼间，你手里就只剩下果核。你把它扔掉，擦干净你的[face]。该死，真好吃！");
         get_player().refillHunger(25);
         if(Utils.rand(2) == 0 && get_player().cockTotal() > get_player().countCocksOfType(CockTypesEnum.TENTACLE))
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc3_].get_cockType() != CockTypesEnum.TENTACLE)
               {
                  _loc2_[int(_loc2_.length)] = _loc3_;
               }
               _loc3_++;
            }
            _loc3_ = int(_loc2_[Utils.rand(int(_loc2_.length))]);
            outputText("[pg]你的" + Utils.num2TextOrdinal(_loc3_ + 1) + "根阴茎发痒，你随手挠了挠。就在这时，它开始越变越长，一直垂到地上，你才意识到不对劲。你拉开[armor]低头一看，发现你的" + get_player().cockDescript(_loc3_) + "已经变成了一条触手！在你的注视下，它又缩短回去；除了紫色的龟头以外，它通体呈绿色，而且迹象表明，你似乎可以随心所欲地让它伸长。<b>你现在拥有");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
            {
               outputText("了又一根");
            }
            outputText("触手肉棒！</b>");
            get_player().cocks[_loc3_].set_cockType(CockTypesEnum.TENTACLE);
            get_player().cocks[_loc3_].knotMultiplier = 1.3;
            dynStats(DynStat.Sens(3),DynStat.Lust(10));
         }
         _loc3_ = 600;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
         dynStats(DynStat.Cor(1));
         if(get_player().get_tou100() < 50)
         {
            dynStats(DynStat.Tou(1));
         }
         if(get_player().get_str100() < 50)
         {
            dynStats(DynStat.Str(1));
         }
         _temp_1.fruitsEaten += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkThePlantGirlsSap() : void
      {
         clearOutput();
         dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(15),DynStat.Cor(1));
         get_player().changeFatigue(-50);
         outputText("你觉得自己需要提提神，于是蹦跳着来到树乳房前，仔细打量起来。它们挺翘而圆润，尽管周围的树皮粗糙，表面却十分光滑。你碰了碰其中一只，触感温暖、柔软，而且细嫩得不可思议，简直就像真正的乳房一样。你揉弄那只树奶时，一小滴液珠在树乳上凝结，滴落到地面，散发出浓郁的枫糖浆气味。你为此轻笑一声，用手指绕着那杏仁色的突起摩挲，沾起一点液体。指尖入口，有种令人安心又熟悉的甜味；当你把黏糊糊的手指从唇边拿开时，你毫不掩饰地带着饥渴看了回去。");
         outputText("[pg]经过你的检查后，树的乳头看起来更大也更硬了。你将其中一颗含入口中，它立刻在你饥渴的舌头上释放出一缕琥珀色糖浆。甜味让一阵战栗沿着你的脊背窜过，含糖的愉悦感随着吞饮涌入身体，为你注入活力。可惜的是，树乳里的美味很快就被吸空了，你只好挪到另一边。你双臂环住树干稳住身体，一边用力吮吸");
         if(get_silly())
         {
            outputText("，你可真是个抱树狂");
         }
         outputText("。浓稠的“乳汁”很快就让你的身体充满能量，虽然它几乎刚开始就见了底。");
         outputText("[pg]事情结束后，你用手臂擦了擦微微发黏的嘴，叹了口气，欣赏着如今变小了些的乳房上那一抹淡淡的红晕。整件事都诡异得要命，但吃完这顿点心后，你又和往常一样精力充沛了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontRecruitJojoToCamp() : void
      {
         clearOutput();
         outputText("你没有开口，任由乔乔独自返回森林。");
         outputText("[pg](获得关键物品：霍莉的灰烬)");
         get_player().createKeyItem("Holli\'s Ashes",0,0,0,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function domUpSomeHolli() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1108,1);
         outputText("你大摇大摆地走到树前，把手按在霍莉旁边的树皮上。她瞥了你一眼，打趣道：[say: 你是想吓唬我吗？] 这名树妖讨好似的咧嘴一笑。[say: 我可是恶魔女神的分枝。你恐怕没把这事想清楚。]");
         outputText("[pg]你一巴掌拍在另一侧，直视着她那双奇异的金黑色眼睛，斩钉截铁地告诉她：从现在起，她必须听候你的差遣，并满足你任何一时兴起的要求。她以为自己还有选择，那不过是幻觉罢了。");
         var _loc1_:Number = get_player().level;
         _loc1_ += get_player().get_tallness() / 12;
         if(get_player().horns.value > 0)
         {
            _loc1_ += 3;
         }
         if(get_player().cor > 66)
         {
            _loc1_ += 2;
         }
         if(_loc1_ < 20)
         {
            outputText("[pg]霍莉翻了个白眼，退回自己的树心之中，树皮形成的“唇瓣”缓缓合拢，发出不祥的吱嘎声。你抓住它们，试图把它们硬掰开，可它们仍不可阻挡地向彼此靠拢。在木头即将夹碎你手指的前一寸，你松开了手，不由得想起故乡有棵树，竟能靠生长把石头撑裂。这个恶魔树妖的家已经对你关闭了。也许，如果你再有威慑力一点，这招就能奏效了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg]慢慢地，恶魔树妖的眼睛睁大，露出更多漆黑的巩膜，她审视着你那迫人的姿态。她咬住下唇，不安地轻咬着，琥珀色的瞳孔来回游移，寻找着任何一丝弱点。你毫无预兆地朝她脸上吹了口气，见她一颤，便笑出了声。她的双手在腹前交叠，不由自主地抓紧自己苍翠色的肌肤。");
         outputText("[pg][say: 好吧，] 被吓住的树妖荡妇叹了口气，[say: 你说得对……反正这也是玛莱的安排。我本来就是给你的奖赏——一个奴隶荡妇，在她来带走你之前，服从你、取悦你。] 霍莉抱住自己的胸口，徒劳地试图承受自信被击碎的打击。[say: 你想让我做什么？不管是什么，我都会服从。] 她垂下目光望向地面，等待你的吩咐。");
         outputText("[pg]结果不错。<b>霍莉的自信已经被击垮。从今往后，她会乖乖服侍你。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,682,1);
         treeMenu(false);
      }
      
      public function doFarmFuckery() : void
      {
         clearOutput();
         outputText("霍莉闭上眼睛，轻轻哼唱。那声音仿佛在你的骨头里回荡，你感觉脚下的地面不安地蠕动起来。霍莉的根须沉重地挪动着，你听见新生的根芽噼啪作响，急切地钻入土中，汲取水分。随着你脚下那些预兆般的声响持续不断，树女人睁开眼，懒洋洋地朝你咧嘴一笑。");
         outputText("[pg][say: 已经开始了。希望你和你的小狗狗会喜欢我做的事！]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1087,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function destroyDatFukkinTree() : void
      {
         clearOutput();
         outputText("你俯下身，开始仔细地在这株污秽树苗周围挖掘。它有一条主根，似乎一直向下延伸，没有尽头；但当你挖出半英尺长的主根后，便一把抓住它猛力拉扯。起初，你的用力似乎完全没被这株植物放在眼里，叶片只是在你手中摇晃挣扎，沙沙作响。然后，突然之间，它伴随着一声猛烈的啪响断开了。你连滚带翻地摔了出去，紧紧把那株魔性植物抱在自己的[chest]前。你叹着气低声抱怨，爬起身来，把这只长满绿叶的恶魔扔进火堆里。");
         outputText("[pg]火星与烟雾冒了出来；火焰变得低矮而发紫，艰难地试图吞噬这株顽强的植物。枯萎的火苗慢慢变弱，看上去几乎就要熄灭；你赶忙往那将熄的火堆里添柴，免得它彻底灭掉。你添进去的每一块干木头似乎都起了作用，很快，那种足以吞噬一切的灼热红光又回来了。植物的茎干枯萎下去，化作焦黑的灰烬。");
         outputText("[pg]你心里升起一丝希望，觉得自己不会再看到那种植物冒出来了。");
         get_player().upgradeBeautifulSword();
         dynStats(DynStat.Cor(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,598,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function destroyDatFuckingPlantAtP2() : void
      {
         clearOutput();
         outputText("你知道，放任这东西继续生长，只会威胁到营地的安全。你叹了口气，拖着步子走向补给，收集了一些干柴，堆在这片入侵的枝叶周围。那株植物仿佛知道你接下来要做什么，开始左右摇摆，花瓣惊慌地颤抖。然而你心意已决，这株植物必须死。你从篝火里抽出一根燃烧的木柴，点燃柴堆。看着火焰缓缓吞噬那株逐渐枯萎的恶魔植物，你心里稍微好受了些。");
         outputText("[pg]火焰摇曳，带着烟雾的紫色火星窜入空中，遮蔽了天空。你咳嗽着后退几步，等待大火自行熄灭，只剩下一地灰烬。你有种预感，应该不会再看到更多那种植物了……希望如此。");
         get_player().upgradeBeautifulSword();
         dynStats(DynStat.Cor(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,598,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defeatHolli() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         get_player().upgradeBeautifulSword();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,598,1);
         if(!jojoAssisting)
         {
            outputText("筋疲力尽的魅魔神裔缩回自己的树中，不愿让你看到她战败的模样。她的力量被压制后，你可以放心地");
            if(get_player().get_weaponName() != "large axe")
            {
               outputText("取来斧头，然后");
            }
            outputText("朝她的树干砍去，费力地剥开树皮，在树身上砍出楔形缺口，试图伐倒这个怪物。这个过程花了将近八个小时，但那棵扭曲的树最终还是倒下了。它刚一倒地，便干瘪萎缩，化作灰烬。");
            _loc1_ = 7;
            while(_loc1_ > 0)
            {
               _loc1_--;
               var _temp_1:* = get_game().time;
               _temp_1.hours = _temp_1.hours + 1;
               if(get_game().time.hours > 23)
               {
                  var _temp_2:* = get_game().time;
                  _temp_2.days = _temp_2.days + 1;
                  get_game().time.hours = 0;
               }
            }
            statScreenRefresh();
         }
         else
         {
            outputText("被火熏黑的鼠僧朝你欢呼起来，而魅魔发出呻吟，彻底退回树皮之中。[say: 做得好，[name]！帮我搬引火物，我们就能把这个怪物烧成灰！]");
            outputText("[pg]你虽然疲惫，但也明白现在必须彻底了结此事，于是帮着僧侣把木柴运到树根旁，直到火焰像篝火般熊熊燃起。你们花了好几个小时搬木柴，后来还不得不亲自砍柴，但最终，那棵树只剩下一堆灰烬。");
            _loc1_ = 3;
            while(_loc1_ > 0)
            {
               _loc1_--;
               var _temp_3:* = get_game().time;
               _temp_3.hours = _temp_3.hours + 1;
               if(get_game().time.hours > 23)
               {
                  var _temp_4:* = get_game().time;
                  _temp_4.days = _temp_4.days + 1;
                  get_game().time.hours = 0;
               }
            }
            statScreenRefresh();
            if(!vapulaSlave())
            {
               outputText("[pg]僧侣向你点了点头。恶魔既然已经消失，你或许可以邀请他留在营地——毕竟你们配合得相当不错。你要让乔乔留下吗？");
               menu();
               addButton(0,"是",recruitJojoToCamp);
               addButton(1,"否",dontRecruitJojoToCamp);
               return;
            }
         }
         outputText("[pg](获得关键物品：霍莉的灰烬)");
         get_player().createKeyItem("Holli\'s Ashes",0,0,0,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function cutHerDown() : void
      {
         clearOutput();
         outputText("[say: 你是认真的？你真就这么想被弄坏吗，我的小玩具？]恶魔双臂抱在丰腴的胸前，先前那副挑逗的姿态已经完全不见了。[say: 你知道我的树皮和任何盔甲一样坚硬，对吧？知道玛莱本人——这片土地本身——都在支撑着我，对吧？现在收回那句话，我就让你重新得到我的欢心……前提是你把脸埋进泥里，恳求我赐给你随时取悦我的职责。]");
         if(get_player().get_weaponName() == "large axe")
         {
            outputText("[pg]这是个花招。你取出斧头。树终归是树，你当着恶魔的面，意味深长地用拇指轻轻试了试斧刃。她看见斧头时似乎微微瑟缩了一下，但很快又恢复了镇定。翡翠肤色的魅魔退回自己的树中，直到坚硬的树身中央只剩下她那张铁青的脸。几条树根在你周围破土而出，她的面容也变得凶厉如雷；她想抢先动手！");
         }
         else
         {
            outputText("[pg][say: 所以……你有护甲，还会魔法？就和那些被我碾碎的污秽虫子一样。]");
            outputText("[pg]你的一番话让那翠绿的恶魔勃然大怒，她退回自己的树中；树皮滑过她的身体，直到只剩下她的脸还露在外面。那张脸因愤怒而扭曲，树根从你周围破土而出，她开始发动攻击！");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,923,1);
         jojoAssisting = false;
         startCombat(new Holli());
      }
      
      public function callDatJojo() : void
      {
         clearOutput();
         get_player().removeKeyItem("Jojo\'s Talisman");
         outputText("你取出从鼠僧那里得到的小护身符，琢磨着该怎么用它召唤他。护身符一侧垂着一根细绳；你一拉，便感觉到有针脚松开，护身符的重量也往底部一沉。浓厚翻涌的黄色烟雾开始喷涌而出。天啊，这味儿真冲！你赶在臭味渗进衣服前把它扔了出去，它落地时发出一声回荡的巨响！没过多久，乔乔就从森林边缘出现，朝你喊话。");
         outputText("[pg][say: 抱歉，[name]，但只有这种声音和气味，才能确保你需要我的时候，我能知道并找到你！] 他抬起一块布捂住鼻子，然后举起自己的长杖。[say: 如果你选择和这个恶魔植物生物战斗，我会试着点起火来，限制她再生的能力。要烧掉这么不自然的一棵树需要大量木柴，所以除了把我一直储备的引火物搬过来之外，我恐怕做不了太多。你得负责吸引她的注意力。]");
         outputText("[pg][say: 这是什么？] 恶魔树咆哮着打断了你们的谈话。[say: 先是放出弄脏我空气的愚蠢玩具，现在又说要烧我？！我绝不容忍！] 她丰腴的身体缩回树中，树皮合拢，除了脸之外将她全身都覆盖起来。树根猛烈地破土而出，带着威胁挥舞着。[say: 我要把你们两个都折断！] 乔乔迅速跑去取第一捆木柴，把你留下来承受攻势！");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,923,1);
         jojoAssisting = true;
         startCombat(new Holli());
      }
      
      public function begHolli4Watches() : void
      {
         var _g:HolliScene;
         clearOutput();
         outputText("你咽下自尊，整个人趴伏在地上。你叹了口气，不情不愿地说道：[say: 求你了，霍莉，晚上守卫我的营地吧。我不想被怪物强奸。]");
         outputText("[pg]这个恶魔般的树妖抓住自己的奶子，朝你喷出些树液，嘲弄道：[say: 你得表现得更好一点。我可不觉得你是真心的。你这就像是在走过场……装装样子而已。而且你还没舔我的树根呢；快点。]");
         outputText("[pg]你皱着脸，把脸凑到树根没入泥土的地方，迟疑地伸出舌头。粗糙的树皮上带着污秽泥土的味道……恶心透了。[say: 求你了……]");
         outputText("[pg][say: 不行，还不够。给我绘声绘色地说说，这个小弱虫有多需要我。一个细节都别漏，尤其是晚上被几十根小恶魔肉棒和地精小穴轮番强奸的部分。]");
         outputText("[pg]这实在是……丢脸到了极点！你羞耻得涨红了脸，又在她的树根上舔了更长的一下。你已经不在乎它尝起来有多难吃了，只想赶紧结束这一切！你眨掉眼里的湿意，毫不掩饰地哀求道：[say: 求求你，霍莉女主人。我需要你。我不想被几十只小恶魔塞满。我很弱，我需要你守着我。求求你，求你帮帮我，霍莉女主人。]你用脸颊蹭着她的树根，满怀希望地抬头望去。");
         outputText("[pg][say: 哈。那我就替你看着营地吧。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,602,1);
         _g = this;
         doNext(function():void
         {
            _g.treeMenu();
         });
      }
      
      public function askHolliToWatch() : void
      {
         var _g1:HolliScene;
         var _g:HolliScene;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,602) == 0)
         {
            outputText("你问霍莉介不介意在夜里用她的触手帮忙守卫营地。她翻了个白眼，嘲弄道：[say: 这个嘛，不知道；也许你跪下来求我的话，我会考虑一下。……而且我是说</i>真正<i>地求，要多呜咽几声。还得舔我的树根。毕竟，我总得从这事里捞点好处吧。]");
            outputText("[pg]看起来，只有你肯为她作践自己，她才会帮忙守卫营地。你可以试着用力量压过她、展示你的支配地位，<b>但在这样强势地立威之后，她很可能会表现得乖顺得多。</b>");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,924) > 0)
            {
               outputText("<b> 你也可以直接给这贱屄一巴掌。</b>");
            }
            menu();
            addButton(0,"乞求",begHolli4Watches);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,924) == 0)
            {
               addButton(1,"威胁",threatenHolli);
            }
            else
            {
               addButton(1,"扇她",slapDatHo);
            }
            addButton(2,"立威",domUpSomeHolli);
            _g = this;
            addButton(14,"返回",function():void
            {
               _g.treeMenu();
            });
         }
         else
         {
            outputText("你告诉霍莉，你希望她晚上别再守着了。她笑了起来：[say: 你只是想找机会回来再多求我几次吧？我还以为你该是个狠角色呢，怎么成了个低声下气的小受？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,602,0);
            _g1 = this;
            doNext(function():void
            {
               _g1.treeMenu();
            });
         }
      }
      
      public function askBrokenHolliToGuard() : void
      {
         var _g:HolliScene;
         clearOutput();
         outputText("你提到让她守卫营地时，霍莉低下头问道：[saystart]我是该盯着那些可以榨干的敌人，还是把他们放进营地，让你亲自享受处理他们的乐趣，[name]？我之前一直");
         if(get_camp().isGuard("Holli"))
         {
            outputText("在守夜");
         }
         else
         {
            outputText("在睡觉，没有守夜");
         }
         outputText("。[sayend]");
         menu();
         if(get_camp().isGuard("Holli"))
         {
            addButton(1,"不守卫",toggleBrokenHolliGuard);
         }
         else
         {
            addButton(0,"守卫",toggleBrokenHolliGuard);
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.treeMenu();
         });
      }
      
      public function amilyHatesTreeFucking() : void
      {
         clearOutput();
         holliSprite();
         outputText("你的鼠族同居者气冲冲地走到你面前，脸上的恼火显而易见。");
         outputText("[pg][say: [name]，我看见你和那棵……那棵树做了什么。我还以为那只是森林里常见的那种变态植物，结果里面居然真的有个恶魔？！我简直不敢相信你的判断力会差到这种地步！你知道把自己交给恶魔的人会有什么下场，对吧？你总不至于忘了，它们会强奸遇到的每个人，还会把他们的灵魂吸出来吧？你把那种垃圾带进营地，我现在连安全感都没有了！]");
         outputText("[pg]无论你怎么试图插话，艾米莉根本不给你回答的机会……");
         menu();
         addButton(0,"保持沉默",stayQuietWhileAmilyBitchesAboutFuckingArborday);
         addButton(1,"扇她耳光",slapAmilysWhoreFace);
         if(get_player().get_inte() >= 70 && get_player().isPureEnough(30))
         {
            addButton(2,"编个借口",makeUpSomething).hint("你很聪明，而且看起来明显没有被腐化。你相当确定自己能说服她相信霍莉确实有存在的意义。");
         }
      }
      
      public function amilyComesBack() : void
      {
         clearOutput();
         holliSprite();
         outputText("艾米莉带着行李来到这里，肩上背着包裹，脸上挂着笑容。[say: 我就知道你会做出正确的选择，[name]。我会把我的窝重新安置好的。]");
         outputText("[pg]<b>（艾米莉已重新加入恋人菜单！）</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(playerMenu);
      }
      
      public function JojoTransformAndRollOut() : void
      {
         clearOutput();
         holliSprite();
         outputText("[say: [name]，请过来一下。]");
         outputText("[pg]乔乔正在营地边缘呼唤你。你礼貌地走向这位僧侣。自从你们最初那场颇为激烈的相遇之后，这大概还是他第一次如此直接地找你说话，你不禁有些好奇他想做什么。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) == 0)
         {
            outputText("[pg][say: 也许你直到现在都还没注意到，但传送门所在的地方来了一位有些格格不入的……客人。那棵树里其实藏着一个生物。]他朝那株奇异的植物示意。[say: 我无意中听见它在自言自语。它似乎相信自己是被玛莱安置在这里的，可这种事……任何看见那怪物的人都能明白，它是恶魔，而非女神的眷属。]");
         }
         else
         {
            outputText("[pg][say: 你之前……接触过的那株植物，似乎已经成长起来了。]他朝那位正大胆地从树中探出身来、轻声哼唱的翠绿女人示意。[say: 我本想劝你把这种亵渎之物从营地里清除掉，但它不断对自己重复的一件事让我迟疑了。它似乎相信自己是玛莱的孩子——尽管任何有眼睛的人都看得出，它是个恶魔。]");
         }
         outputText("[pg]你低声打断了他，把这个坏消息告诉乔乔：你最近找到了玛莱，而她已经被严重腐化，灵魂尽失；并且你营地里这株生长物，似乎确实是那棵如今已扭曲的树所分裂出的枝芽。");
         if(get_player().cor < 25)
         {
            outputText("不愿对朋友撒谎，你还承认，她似乎是在你于工厂中的行动之后发生了变化——虽然你当时是想让那些罐槽永久失效，但你造成的泄漏还是把那位冥土之灵推过了临界点。");
         }
         else
         {
            outputText("不过，你省略了造成这场变化的那些具体而不必要的细节。");
         }
         outputText("那位武僧的眼睛因惊讶和揣测而睁大了。");
         outputText("[pg][say: 难以置信……]他脱口而出。[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,594) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,595) == 0)
         {
            outputText("没想到我如今竟必须把玛莱本人也视作敌人。请原谅，但既然这里已经引来了那种存在的注意，对我们来说就不再安全了。眼下我会返回森林。我知道你认为自己的使命让你必须留在这里，但我劝你远离那东西，并在足够安全的距离外监视传送门。");
         }
         else
         {
            outputText("而且就算知道事情可能是这样，你还是选择和它交合？[name]……我不能说自己不失望。这里对我来说已经不再安全了。眼下我会返回森林。");
         }
         outputText("[sayend]");
         outputText("乔乔悲伤地看着你；无论你试图如何辩解，他都只是认命般地摇头。[saystart]如果那生物真是被腐化的大地之灵孕育出的恶魔后代，那么它无疑会很强大，而其母体的怒火也会极其可怕。");
         if(get_player().level < 20)
         {
            outputText("尽管如此，如果你发现自己已到了非得与这个恶魔对抗、否则就会丧命的境地，那就呼唤我吧。我会尽我所能提供援助，虽然我希望那不会是徒劳。");
         }
         else
         {
            outputText("不过，以你这样的凡人所拥有的实力与资源，也许能毁掉她并逃过报复。在你确信胜利之前，我建议不要正面冲突；但如果你非战不可，就呼唤我吧，我会尽我所能相助。");
         }
         outputText("[sayend]说完，他把一枚小小的护身符塞进你手里。");
         outputText("[say: 在那之前，如果你需要我的帮助，就到森林里来找我吧。]乔乔礼貌地鞠了一躬，然后离开了。");
         outputText("[pg](<b>乔乔不再是你的同伴了！</b>)");
         get_player().removeStatusEffect(StatusEffects.PureCampJojo);
         get_player().createKeyItem("Jojo\'s Talisman",0,0,0,0);
         doNext(playerMenu);
      }
   }
}

