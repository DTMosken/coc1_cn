package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.BreastStore;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class LatexGirl extends NPCAwareContent
   {
      
      public var lakeDiscovery:Encounter;
      
      public function LatexGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:LatexGirl = this;
         super();
         var _loc2_:Either = OneOf_Impl_.fromA(encounterLeftBehindGooSlave);
         lakeDiscovery = Encounters.build(new EncounterDef("latexGirl",EncounterChance_Impl_.fromFloatConst(0.3),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,654) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,655) > 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,657) == 0;
            }
            return false;
         }),_loc2_,null));
      }
      
      public function useLatexy() : void
      {
         clearOutput();
         outputText("你打算怎么使用你的宠物？");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"用鸡巴操她",malePCDomFucksLatexGoo);
         }
         if(get_player().hasVagina())
         {
            addButton(1,"用小穴支配",femalePCDomFucksLatexGoo);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
            {
               addButton(2,"骑乘黏液鸡巴",femalePCDomFucksLatexGooFuta);
            }
         }
         addButton(14,"返回",approachLatexy);
      }
      
      public function tryToAssertMaleDomWhileLatexGooDrains() : void
      {
         if(get_player().get_str() < 40 || get_player().get_str() / 10 + Utils.rand(20) + 1 < 9)
         {
            maleDirectFeedLatexGooGoneWrong();
            return;
         }
         clearOutput();
         outputText("听到你的命令，她的吸吮力加倍了。那吸吮的热度让你的[cock biggest]在她体内变得更大，用嘈杂的感觉轰炸着你，让你对身体的控制力像微风中的树叶一样消散。你发出一声压抑的呜咽，顺着石头滑下来，轻轻地落在你的[butt]上，停在你那叛逆宠物性感的身体前。她的嘴唇像真空一样紧紧锁住你的腹股沟，伴随着湿润饥渴的吧唧声上下套弄。你迎合着她的服侍弓起背，翻着白眼。当来自你[cock biggest]的快感如此强烈，以至于让之前的高潮显得毫无价值时，还需要视觉做什么呢。");
         outputText("[pg]但这不应该是这样的！你应该在这里占据主导地位，而不是[latexyname]。她应该服侍你，而不是像个地精荡妇一样强迫你。你挣扎着反抗她，抓住[latexyname]的头发向后拉，用尽全力把她从你的肉棒上拉开。她向后摔倒，咳嗽着干呕，她的嘴仍然保持着为你[cock biggest]准备的“O”形。你拍了拍身上的灰尘，挣扎着站起来，居高临下地看着温顺地仰视着你的[latexyname]。[say: 我……我……]她刚开口，你就打断了她，把她翻过身趴下，撅起她丰满的小屁股。你叹了口气，开始提醒她到底谁才是这里的主人，你总是喂饱她，而她却试图那样强迫你……不可接受。你一边说，一边抓住她柔软的屁股蛋，把手指抠进她的后庭，直到她嘴里发出一声轻微的呻吟。[say: 这才像话，]你低吼着，把你的[cock biggest]甩在她的臀瓣之间，在光滑柔软的乳胶屁股上摩擦。");
         outputText("[pg][say: 对不起，[Master]，] [latexyname]温顺地喵喵叫着，但她内心的荡妇开始扭动屁股，她的臀瓣轻轻地挤压着你的男子气概。尽管如此，你还是对她“啧”了一声，开始慢慢摇晃你的[hips]，在你可以揉捏的臀瓣之间摩擦，享受着像名器一样的感觉，甚至当乳胶润滑液开始从[latexyname]的双腿间滴落到地上时，她的身体拼命地宣告着她想被操的欲望。尽管刚才的高潮折磨着你的身体，你还是能感觉到你的欲望在搅动，这也是被[latexyname]试图对你施加的口交攻势所激发的。你用你的[cock biggest]在她的臀瓣之间最后粗暴地挺进一次，然后向后拉，抚摸着自己，直到你的[cockHead biggest]压在她被润滑液弄得湿滑的小穴上。你用肉棒的柱身摩擦着她湿滑急切的肉洞，让她的液体乳胶润滑液溅到你身上，而[latexyname]继续像荡妇一样扭动着屁股，试图引诱你喂她。");
         outputText("[pg]不过，一旦你的[cock biggest]沾满了她阴道的分泌物，变得又滑又亮，你就会再次向后拉，把手指重新抠进[latexyname]的屁股，掰开她丰满的臀瓣，露出她后门那颗紧致的小星星。[Latexyname]喘着粗气，感觉到你的龟头压在她的肛门上，当你的湿透的肉棒毫无阻力地插入她体内的第一英寸时，她张大了嘴巴。你满意地呻吟着，她那像老虎钳一样紧的洞紧紧地挤压着你湿滑的柱身，拼命地、本能地试图排斥入侵的肉棒；但你太滑了，被液体乳胶覆盖着，[latexyname]惊呆了的身体无法抗拒你，你开始一英寸一英寸地滑入她体内，在一次漫长而痛苦的缓慢推挤中，将自己连根埋入。");
         outputText("[pg]一旦你把她插到底，你就停下来，深呼吸，享受着她的肛门对你施加的强烈挤压，陶醉于光滑的乳胶在你沾满粘液的柱身上粗暴摩擦的感觉，无法获得牵引力。你的手指揉捏着[latexyname]柔软的臀肉，像揉面团一样揉捏着她的臀瓣，粗暴地按摩着她的后背，直到她开始在你周围放松下来。[say: 好女孩，]你低语着，向前伸出手抚摸[latexyname]的头发。[say: 真是个好女孩，放松点。接受它……你那么想要它。]");
         outputText("[pg][say: 我-我对不起，[Master]，] [latexyname]重复道，当你把臀部磨向她，把更多的肉棒推入她的屁股时，她哽咽了。[say: 我不是故意的……我会做个好女孩，我保证，]她呜咽着，当你慢慢从她体内拔出，缩回你的肉棒直到只剩下龟头时，她呻吟着。[say: 操我，[Master]，求求你——]她哭喊着，[say: 操我，操我，操我！]");
         outputText("[pg]你抓住她的臀部，猛地向前撞击，一次挺进就再次将自己插到底。[Latexyname]大叫起来，她的声音在远处回荡，你粗暴地捣弄着她的肛门，一次又一次地插入她，直到你能感觉到自己接近极限，你正在锤击的近乎无摩擦的洞太棒了，不容错过。但[latexyname]仍然没有被正确地放在她的位置上。你应该在这里占据主导地位，而不是她。你保护她，喂养她，照顾她，而她仍然认为她可以控制你。不可接受。你推回她体内，强迫自己插到底，然后停下来。你保持完全静止，只是享受着她涂满乳胶的屁股光滑液体的感觉。");
         outputText("[pg][say: 主-[Master]？求你了……] [latexyname]乞求道，恳求地回头看着。[say: 我还是很饿……]");
         outputText("[pg]她一说[say: 饿，]你就发动了攻击。你张开手掌，在[latexyname]的后背上狠狠地打了一巴掌，让她的屁股颤抖起来。你高兴地喘着粗气，因为你打屁股的力量直接穿透了她，让她体内的乳胶在你的[cock biggest]周围疯狂地抖动。[latexyname]透过她玛瑙般的牙齿吸了一口气，但回头看着你的眼神充满了欲望，仿佛她能感觉到你有多近。她再次扭动屁股，几乎是在邀请你。你再次出击，狠狠地打她的屁股，几乎把你们俩都打翻了；然后一次又一次，每次攻击后她屁股的抖动都几乎把你推向边缘。");
         outputText("[pg]最终，你再也受不了了。你感觉到精液在你的[cock biggest]中奔涌，伴随着最后一巴掌，你把自己送上了顶峰。你向后仰起头，向着天空咆哮着你的快感，精液从你的马眼倾泻而出，进入[latexyname]饥渴的屁股，把她乌黑的直肠壁染成白色。当精液从你体内倾泻而出时，[latexyname]淫荡地、饥渴地呻吟着，脸上带着高潮的表情，打屁股的痛苦被你的种子流入她体内的满足感所取代。");
         outputText("[pg]当你的第二次高潮过去后，你软绵绵地从[latexyname]身上滚下来，彻底满足了。你的[chest]起伏着，你平静地叹了口气，闭上沉重的眼皮，渴望休息。但片刻之后，你感觉到光滑的皮肤贴着你的皮肤，[latexyname]蜷缩在你身边，她的脸离你只有几英寸远。你带着淡淡的微笑，伸出手，用手指穿过她的头发，然后把她拉进一个长长的吻中，在你的嘴唇上留下了你自己的味道。");
         if(gooHappiness() < 33)
         {
            outputText("[pg][say: 如果总是这样的话，也许……和你在一起也不是那么糟糕，] [latexyname]低语道。");
         }
         else if(gooHappiness() < 66)
         {
            outputText("[pg][say: 对不起，我太强硬了，[name]。我喜欢服侍你……真的。]");
         }
         else
         {
            outputText("[pg][latexyname]依偎着你，她的头靠在你的[chest]上。[say: 对不起，[name]。我不是故意要强迫你的。我喜欢你这么自信，这么……有统治力的时候。]");
         }
         var _loc1_:int = 30;
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         if(get_player().cumQ() >= 500)
         {
            _loc1_ += 20;
         }
         gooFluid(_loc1_);
         gooHappiness(5);
         gooObedience(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function set_cockType(param1:CockTypesEnum) : CockTypesEnum
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,668,param1.get_Index());
         return param1;
      }
      
      public function setLatexysBustSize() : void
      {
         var arg7:int;
         var _g7:LatexGirl;
         var arg6:int;
         var _g6:LatexGirl;
         var arg5:int;
         var _g5:LatexGirl;
         var arg4:int;
         var _g4:LatexGirl;
         var arg3:int;
         var _g3:LatexGirl;
         var arg2:int;
         var _g2:LatexGirl;
         var arg1:int;
         var _g1:LatexGirl;
         var arg:int;
         var _g:LatexGirl;
         clearOutput();
         outputText("你问[latexyname]是否介意把她的乳房保持在特定的大小。");
         if(gooObedience() < 60)
         {
            outputText("[pg]她双手叉腰，大喊道：[say: 怎么可能！我想让它们多大就多大，想多小就多小！你已经得到了一个性感的乳胶女人，而且她还依赖你的体液——你不需要连我的一切都要微操！]当她意识到自己刚刚把自己描述为“性感”时，她微微脸红了。她肯定比她表现出来的更喜欢这样。");
            gooObedience(-2);
            menu();
            addButton(0,"继续",approachLatexy);
            return;
         }
         if(gooObedience() < 80)
         {
            outputText("[pg]她点点头，随意地" + (gooTitClass(int(gooTitSize())) < 3 ? "用手托起她的乳房，让它们挺立起来" : "用手托起她的乳房，让它们来回弹跳") + "，似乎是为了分散你的注意力。[say: 你想要这些宝贝多大？我可以让它们大到几乎让我动弹不得，也可以让它们像苹果一样小巧挺拔。不过要提醒你一句——当水分充足时，很容易让它们保持小巧，但当体液不足时，想让它们保持巨大是不可能的。如果你喜欢你的性感女奴有巨大的乳房，你就得让我吃饱。]当她意识到自己刚刚称自己为你的性感女奴时，紫色的红晕染上了她的脸颊，所以她试图转移话题。[say: 我说的吃饱，是指做爱。因为，你知道的，我是黏液女孩。]这招不太管用。");
         }
         else
         {
            outputText("[pg]她点点头，脸上带着淫荡的表情，随意地" + (gooTitClass(int(gooTitSize())) < 3 ? "用手托起她的乳房，让它们挺立起来" : "用手托起她的乳房，让它们来回弹跳") + "。[say: 你想让我多大，[Master]？我可以做你的大胸婊子，在自己乳房的重量下几乎无法移动。那样你就会有一座乳胶乳沟山可以玩了。或者，我可以让它们保持像苹果一样小巧挺拔的乳房，刚好能放进你的手里。那样我就会成为你光滑娇小的荡妇了，不是吗？]她为自己顺从、堕落的小脑瓜里涌现的想法而呻吟，并呜咽着说：[say: 如果你想要它们饱满，就让我吃饱，[Master]。没有足够的体液，我无法让它们保持巨大！] [latexyname]看着你，等待着改变自己的命令。");
         }
         menu();
         _g = this;
         arg = 1;
         addButton(0,"A罩杯",function():void
         {
            _g.changeLatexyTits(arg);
         }).disableIf(gooTitClass(int(gooTitSize())) == 1);
         _g1 = this;
         arg1 = 3;
         addButton(1,"C罩杯",function():void
         {
            _g1.changeLatexyTits(arg1);
         }).disableIf(gooTitClass(int(gooTitSize())) == 2);
         _g2 = this;
         arg2 = 4;
         addButton(2,"DD罩杯",function():void
         {
            _g2.changeLatexyTits(arg2);
         }).disableIf(gooTitClass(int(gooTitSize())) == 3);
         _g3 = this;
         arg3 = 8;
         addButton(3,"排球大小",function():void
         {
            _g3.changeLatexyTits(arg3);
         }).disableIf(gooTitClass(int(gooTitSize())) == 4);
         _g4 = this;
         arg4 = 15;
         addButton(4,"篮球大小",function():void
         {
            _g4.changeLatexyTits(arg4);
         }).disableIf(gooTitClass(int(gooTitSize())) == 5);
         _g5 = this;
         arg5 = 24;
         addButton(5,"巨大",function():void
         {
            _g5.changeLatexyTits(arg5);
         }).disableIf(gooTitClass(int(gooTitSize())) == 6);
         _g6 = this;
         arg6 = 35;
         addButton(6,"极其巨大",function():void
         {
            _g6.changeLatexyTits(arg6);
         }).disableIf(gooTitClass(int(gooTitSize())) == 7);
         _g7 = this;
         arg7 = 0;
         addButton(7,"随便",function():void
         {
            _g7.changeLatexyTits(arg7);
         }).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,665) == 0);
         addButton(14,"返回",approachLatexy);
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         outputText("你告诉你的黏液宠物，她要前往湖边，找到一个农场，向在那里工作的女士报到，并听从她的吩咐。“湖”这个词产生了你预期的效果；当你提到那片应许之地时，[latexyname]液态的脸上泛起了喜悦的涟漪。");
         outputText("[pg][say:不许偷偷溜走，]你警告道。[say:我要你努力工作，赚取你将得到的体液。]");
         outputText("[pg][say:如您所愿，[master]，]她叹了口气，然后慢慢地向湖的方向滑去。你觉得，无论是作为工人还是保护者，她都将毫无用处；然而，你怀疑如果惠特尼让她吃得饱饱的，她就能从她身上收获乳胶，这肯定是有价值的，也许一些老式的体力劳动会对这个任性的黏液女孩有好处。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1085,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pureGooRecruitmentStart() : void
      {
         get_game().set_inCombat(false);
         clearOutput();
         spriteSelect(SpriteDb.get_s_latexgoogirl());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,655,1);
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,658,get_monster().skin.tone);
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            get_player().consumeItem(get_consumables().SUCMILK);
         }
         else
         {
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         if(get_player().hasItem(get_consumables().BLACKEG))
         {
            get_player().consumeItem(get_consumables().BLACKEG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_BLKEG);
         }
         outputText("这场混战的刺激对黏液女孩来说太过了，她瘫倒在下半身的黏液中，皮肤蠕动着，努力维持着身体的凝聚。她的表情充满失望，用那双充满希望的大眼睛看着你，伸出一只手，似乎在为她的过度兴奋道歉。");
         outputText("[pg]当你俯身看着被击败的黏液女孩，试图决定该怎么处理她时，她突然向前扑来，用黏糊糊的手臂抱住你，把你的脸拉进她柔软的乳房里。当黏液女孩试图给你一个顽皮的拥抱时，你扭动着身体，显然她还没玩够，这时你的[inv]突然掉了下来！你在混乱中挣脱，你的物品掉在地上发出叮当声，但你惊讶地盯着你携带的黑蛋正好在黏液女孩的头上裂开，将其乳胶物质倒进她的头上，同时你的魅魔乳液也爆开了，将奶油般的乳液喷洒在她[monster.skin]的外表上。你微微睁大眼睛，看着这两种黑白相间的物质渗入她吸收性极强的身体，最终滑向她心形的内核。");
         outputText("[pg]突然，她的动作停止了，两种物质在她的核心周围旋转，像种子被吸进饥饿妓女的嘴里一样被吸了进去。当蛋和乳液在她体内混合时，女孩的嘴唇开始变暗，逐渐变得不透明。伴随着一声沮丧的晃动声，黏液女孩站了起来，转身面对你。她的下唇已经变成了闪亮的缟玛瑙色，撅着嘴，充满恐惧。她把手臂举到脸前，惊恐地看着手臂上慢慢长满黑斑。她开始摇晃，然后倒在地上；她的指尖已经凝固，变成了光滑坚实的物体，有着清晰的指甲，恐惧地抠着海岸。当最后一点乳液旋入她的心脏时，她的乳房变大了，把她脸朝下拖到了地上。");
         outputText("[pg]她扭动着身体，但没能站起来，因为凝固的乳房太重了，无法移动。到目前为止，她的手臂已经凝结成光滑的缟玛瑙色，一直延伸到手肘，她的臀部同样是反光材料制成的深色球体，简直让人忍不住想摸一摸。在下面，她的黏液池正在缩小，向内收缩，同时变得更加不透明。它一分为二，逐渐扭曲缠绕，直到露出两条匀称的小腿，上面是一双娇小的脚。这些几乎瞬间就凝固了——变形正在加速！可渗透的薄膜迅速让位于她颤抖的身体上反光、光滑的乳胶，将黏液女孩塑造成了一个捆绑荡妇湿梦中的形象。随着她的整个身体从液体变成固体，曾经的黏液女孩陷入了昏迷，黑色的眼睑盖住了她坚实的[monster.skin]眼睛。");
         outputText("[pg]担心你可能杀了她，你冲上前去检查她的呼吸。呼！她没事，只是像灯一样熄灭了。你把这个可怜的女孩抱在怀里好一会儿，环顾四周，想找个地方安置她，找个人帮你处理……她对自己做的任何事。看起来你给自己找了个乳胶黏液女孩……或者乳胶女孩……随便啦。把她留在这里似乎很残忍，因为她肯定会被一些可怕的怪物抓走……她回到你的营地会更安全，尽管这可能意味着你要承担一个比你准备好的更长期的项目。");
         menu();
         addButton(0,"带回家",niceGuysTakeLatexHome);
         addButton(4,"留下她",leaveTheLatexGooGirl);
      }
      
      public function pureGooGalRecruitAftermathII() : void
      {
         clearOutput();
         outputText("[say:你想叫我什么就叫什么吧，我的名字不重要。]");
         outputText("[pg]你要给她起什么名字？");
         menu();
         addButton(0,"继续",nameZeLatexGooNice);
         genericNamePrompt();
      }
      
      public function pureGooGalRecruitAftermath() : void
      {
         clearOutput();
         outputText("你把曾经的黏液女孩放在营地一个僻静的地方。在某种程度上，她看起来几乎像个外星人……比以前更像，那时她只是一个有乳房和假发的水状斑点。现在，她身体的每一个方面都是闪亮、反光的乳胶。甚至她的阴道分泌物，自由地滴落，也是液体乳胶，光滑的黑色汁液，一旦离开她的身体，就会慢慢硬化成柔韧的固体。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你不禁想知道，让她用她的汁液包裹你的[cocks]会是什么感觉。");
         }
         outputText("[pg]令人惊讶的是，她有头发，或者说对于一个完全由柔软的无机半固体构成的女人来说，可以算是头发的东西。她的长发垂过肩膀，细长的发丝和她的皮肤一样反光。与她的皮肤不同，乳胶黏液女孩的头发似乎永远是油腻、光滑和润滑的。你犹豫地伸出手去触摸，小心翼翼地抚摸着几根橡胶般的发丝。它们的质地光滑而滑溜，不像你曾经有幸触摸过的任何头发。");
         outputText("[pg][say: 我能感觉到，你知道的。]");
         outputText("[pg]你拼命后退，对这突如其来的话语感到惊讶，以至于你差点一屁股摔在[butt]上。作为回应，咯咯的笑声冒了出来，[say: 抱歉，我不是故意吓你的。]");
         outputText("[pg]你走上前，低头看着现在已经恢复意识的曾经的Goo。她问道，[say:我……我怎么了？我本来……本来……想让你舒服一下的，然后你滑倒了，然后……哦，不！我做了什么！？]她哭喊着，开始触摸她现在变成乳胶的身体。当她修长纤细的手指开始戳弄她新的身体时，她突然退缩了，背部紧紧贴在岩石上，随着恐慌达到顶点，她的身体失去了硬度。乳胶女人的背部渗入她紧贴的巨石，她的身体慢慢溶解。你伸出手想阻止她，但伴随着一声痛苦的断裂声，每一个半固体的伪足都缩回了原位，把她向前摔在她巨大的乳房上。看来她失去了很大一部分可溶的柔韧性。");
         outputText("[pg]她抬头看着你，她那惊恐的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛睁得像餐盘一样大。[say:发……发生了什么？我不……怎么会……哦，不，]她呜咽着，用手捂住脸，悲伤的泪水在她新的身体里颤抖。");
         outputText("[pg]你尽可能温柔地试图告诉她发生了什么：黑蛋和奶从你的[inv]里掉了出来，溅到了——或者说进入了——她的身体，改变了她。她痛苦地呻吟着，双手抱住她宽阔的胸部，浑身发抖，她扭曲的身体在光线下摇晃和闪耀的方式让这个动作变得更加奇妙。你忍不住注意到她的身体是多么性感，看起来多么感官，她的乳胶形态几乎在呼唤你的触摸和爱抚……就在那个身体里的女孩在悲伤和绝望中哭泣时，你提醒自己。");
         outputText("[pg]不过，不知道她的名字，想安慰她并不容易。你坐在她身边，尽可能友好地问她。");
         outputText("[pg][say:名字？我的名字是我灵魂的温暖和被遗忘的海洋的气息……或者说，在你把我变成……这样之前是这样的。我想我现在甚至无法与我的族人正常交流。在你的耳朵里，我没有名字，老实说……我以前的名字可能也只是一个被遗忘的记忆。]一滴孤独的玛瑙色泪珠从她的眼角流下，在她的脸颊上变硬。她抽泣着把它擦掉。");
         menu();
         addButton(0,"继续",pureGooGalRecruitAftermathII);
      }
      
      public function niceGuysTakeLatexHome() : void
      {
         clearOutput();
         if(get_player().get_inte() >= 60)
         {
            outputText("你很快找到了一些木头和一些结实的芦苇来做绳子。你花了不到15分钟就把收集到的材料组装成了一个简陋的拖拉架——一个你必须自己扛的拖拉架。把这堆有着巨大乳房的性感乳胶抬到你的杰作上是一项艰巨的任务，但你勉强做到了。把她拖回营地也不容易，但多亏了你的机智，你省了不少力气。");
            get_player().changeFatigue(20);
         }
         else
         {
            if(get_player().get_str() < 60)
            {
               outputText("你试着举起她，但她太重了！该死！你不可能这样把她带回营地，而且你不能让传送门无人防守那么长时间来等她醒来。你现在必须留下她，等她醒来后再试着找到她。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("你把她扛在肩上，绷紧你强健的肌肉来支撑那些巨大的乳房并保持直立。这项任务很艰巨，但你足够强壮，可以应付任何事情！");
            if(get_player().get_tou() < 40)
            {
               outputText("走到一半，你太累了，无法继续。你可能很强壮，但你没有足够的耐力长期承受这样的重担。你现在必须留下她，等她醒来后再试着找到她。");
               get_player().changeFatigue(30);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("当你到达营地时，你已经上气不接下气了，但你做到了！在所有这些工作之后，你需要一段时间才能喘过气来……你的胳膊和腿仍然因为过度劳累而发热！");
            get_player().changeFatigue(10);
         }
         menu();
         addButton(0,"继续",pureGooGalRecruitAftermath);
      }
      
      public function niceGuysKeepTheirGooGals() : void
      {
         clearOutput();
         outputText("你捏住她的下巴，抬起她的头看着你。你当然会帮她。你怎么能不帮呢？[latexyname]对你的回答喜出望外，她伸出纤细的手臂抱住你，把自己拉起来，光滑的黑色嘴唇紧紧贴在你的嘴唇上。[say:哦，谢谢你！谢谢你！]她哭喊着，再次吻了你。不过，乳胶女孩突然意识到自己做了什么，松开了你，滑回她的岩石上，羞愧地把头转过去。[say:对不起，我只是……谢谢你。我保证不会只成为你的负担！我不知道我能做多少，但只要我在这里……只要你开口，任何事，我保证我会尽力而为。这是我能为你对我这么好而做的最起码的回报。]");
         outputText("[pg]你微笑着，告诉她看到她安然无恙就是足够的回报了。说到这个，她到底需要什么——你现在能帮她做些什么？[say:我以前生存只需要液体，但……没那么多。现在不需要了，][latexyname]说。[saystart]我已经能感觉到我不再像以前那样流失它了……但我仍然渴望……嗯，汁液。我可能靠水就能活下去，但那样我就不健康了。我需要你，嗯，呃……喂我");
         if(get_player().get_gender() == 0)
         {
            outputText("，所以你最好长出一些生殖器");
         }
         outputText("。不过只是偶尔——我保证我也会让你感觉很舒服的！当我……饿了……的时候，我会尽量让你知道，但你要多留意我，好吗？我还没有完全习惯这种新的新陈代谢……[sayend]");
         outputText("[pg]你点点头，告诉她安顿下来，你很快就会回来看看她。");
         outputText("[pg]<b>（[latexyname]已添加到奴隶菜单中！）</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,657,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,662,60);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,663,20);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,100);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nameZeLatexGooNice() : void
      {
         var _loc1_:String = getInput();
         if(_loc1_ == "")
         {
            clearOutput();
            outputText("[b:你必须设置一个名字。]");
            menu();
            genericNamePrompt();
            addButton(0,"继续",nameZeLatexGoo);
            return;
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,656,_loc1_);
         clearOutput();
         if(!nameReact(_loc1_))
         {
            doNext(nameZeLatexGooNice);
            return;
         }
         outputText("[say:我……我想我应该开始习惯它了……习惯这一切。我……谢谢你，朋友。你本来不必带我回这里，不必帮我，但你这么做了。我很感激，真的。但我认为我无法在野外独自生存太久。我一生都是作为Goo生活的，我需要一些时间——也许几年——来重新学习如何独自生存。我知道这个要求有点过分，但你介意我留在这里吗？和……和你在一起？至少直到我能，呃，站稳脚跟，可以这么说，]她说着，双手顺着身体摸到她那双娇小的新脚。");
         menu();
         addButton(0,"留下她",niceGuysKeepTheirGooGals);
         addButton(1,"赶走她",bootOutNiceGoo);
      }
      
      public function nameZeLatexGoo() : void
      {
         var _loc1_:String = getInput();
         if(_loc1_ == "")
         {
            clearOutput();
            outputText("[b:你必须设置一个名字。]");
            menu();
            genericNamePrompt();
            addButton(0,"继续",nameZeLatexGoo);
            return;
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,656,_loc1_);
         clearOutput();
         if(!nameReact(_loc1_))
         {
            doNext(nameZeLatexGoo);
            return;
         }
         outputText("一阵阴云掠过她的眉宇，让她的目光暗了下来。她带着小脾气问道，[say: 好吧，现在怎么办，[Master]？有什么规矩？]她的声音里带着一丝不悦的暗流，很明显她已经对自己的处境有些怨恨了。");
         outputText("[pg]你捏住她的下巴，抬起她的头看着你。");
         if(get_player().cor < 50)
         {
            outputText("耐心地");
         }
         else
         {
            outputText("不耐烦地");
         }
         outputText("，你向她解释说，她不能离开营地。如果她需要水分，最远只能去小溪边。");
         outputText("[pg][say: 我不需要那么多液体了……现在不需要了，] [latexyname] 说道。[saystart]我已经能感觉到，我流失水分的速度不像以前那么快了……但我仍然渴望……嗯，汁液。我可能只靠水也能活下去，但那样我就不健康了。我需要你喂我");
         if(get_player().get_gender() == 0)
         {
            outputText("，所以请长出一些生殖器吧");
         }
         outputText("！只要偶尔……当我饿得难受时，会很明显的……请照顾好我，好吗？[sayend]");
         outputText("[pg]你点点头，告诉她安顿下来，你很快就会回来看看她。");
         outputText("[pg]<b>（[latexyname]已添加到奴隶菜单中！）</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,657,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,662,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,663,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,100);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nameReact(param1:String) : Boolean
      {
         if(param1 == "Fenoxo")
         {
            outputText("[say: 我可能是史莱姆做的，但我没[i:那么]黏糊糊的！]");
            return false;
         }
         outputText("[saystart]");
         var _loc2_:String = param1;
         if(_loc2_ == "Aeris")
         {
            outputText("爱丽丝，嗯？听起来就像那种矫情又讨人厌的家伙才会取的名字！");
         }
         else if(_loc2_ == "Blacky")
         {
            outputText("小黑，是吧？我看起来像匹马还是怎么的？我想也只能这样了，");
         }
         else if(_loc2_ == "Cattleya")
         {
            outputText("卡特莉亚，哈？我不知道我的胸有没有大到能配得上这个名字呢，");
         }
         else if(_loc2_ == "Christmas")
         {
            outputText("Christmas，嗯？真有节日气氛。最大的区别是，我可不只是一年才来一次。");
         }
         else if(_loc2_ == "Fetish")
         {
            outputText("恋物癖，是吧？你的动机还真是显而易见，不是吗？");
         }
         else if(_loc2_ == "Galatea")
         {
            outputText("Galatea？以奥布利莫的名义，这名字真美！");
         }
         else if(_loc2_ == "Goo")
         {
            outputText("黏黏？哈……哇哦，你可不太聪明啊，是吧？不过，我想我也能接受。那就叫我黏黏吧，");
         }
         else if(_loc2_ == "Hedrah")
         {
            outputText("Hedrah？一个好听又响亮的名字。我赞成，");
         }
         else if(_loc2_ == "Helia")
         {
            outputText("赫莉娅，是吗？我不知道我有没有那么喜欢走后门！");
         }
         else if(_loc2_ == "Jacques")
         {
            outputText("Jacques？这有点像男孩的名字，不是吗？……我的胸部是不是变大了？");
         }
         else if(_loc2_ == "Kara")
         {
            outputText("Kara，嗯？听起来就像是一个穿着法国女仆装、有着可以揉捏的大胸女孩的名字！我超级喜欢！");
         }
         else if(_loc2_ == "Karazelle")
         {
            outputText("Karazelle，嗯？听起来就像是一个穿着法国女仆装、有着可以揉捏的大胸女孩的名字！我超级喜欢！");
         }
         else if(_loc2_ == "Latexy")
         {
            outputText("乳胶妹，是吧？那，呃……真有创意……");
         }
         else if(_loc2_ == "Luckster")
         {
            outputText("拉克斯特，是吗？奇怪，我没觉得有多幸运。附近有牛娘吗？");
         }
         else if(_loc2_ == "Maria")
         {
            outputText("玛丽亚？我操，这又不是被诅咒了！你不会指望我把你变成女人吧？");
         }
         else if(_loc2_ == "Savin")
         {
            outputText("萨文？你为什么要用斯大林之后第二糟糕的人的名字来给我命名？");
         }
         else if(_loc2_ == "Symphonie")
         {
            outputText("Symphonie，嗯？这似乎非常……合适。不知怎么的，感觉很舒适贴心，");
         }
         else if(_loc2_ == "Third")
         {
            outputText("瑟德，是吗？我说话会带着奇怪的口音，然后一整天都打不中头吗？好吧，我想这名字还行，");
         }
         else if(_loc2_ == "Tifa")
         {
            outputText("蒂法，嗯？我喜欢这个名字的发音！");
         }
         else if(_loc2_ == "Urta")
         {
            outputText("乌尔塔，是吗？你把我当成什么了，福瑞控吗？我想也只能这样了，");
         }
         else if(_loc2_ == "Valeria")
         {
            outputText("瓦莱丽娅？等等，我以前听过这个名字……");
         }
         else if(_loc2_ == "Whitney")
         {
            outputText("惠特尼？那个农场女孩？好吧，我想我可以代替那个性冷淡的婊子。");
         }
         else
         {
            outputText("[latexyname]，是吗？我想我能接受，");
         }
         outputText("[sayend]她沉思着，心情变得开朗起来。");
         return true;
      }
      
      public function minotaurCumFeedingGoo(param1:Boolean = false) : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().MINOCUM);
         outputText("你从腰间的袋子里拿出一瓶牛头人精液");
         if(get_player().minotaurNeed() || get_player().minotaurAddicted())
         {
            outputText("并饥渴地舔了舔嘴唇，总是渴望自己也能享受这样的美味");
         }
         outputText("。乳胶女人");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,671) > 0)
         {
            outputText("兴奋地拍手，她那黑如夜色的乳头立刻挺立起来。她还没有忘记上次品尝这令人陶醉的美味的感觉。");
         }
         else
         {
            outputText("困惑地歪着头，但当她意识到你拿的是精液时，她那黑如夜色的乳头挺立了起来。");
         }
         outputText("你来回摇晃着瓶子，说着你给你的宠物带来了一份美味。");
         outputText("[pg][latexyname]不由自主地喋喋不休，[say: 真的吗，[Master]？给我的？] 她将她那非人般光滑的皮肤贴在你身上，给了你一个拥抱。她乌黑的涂层紧紧地贴着你，她的脸颊拂过你的");
         if(get_player().get_tallness() >= 72)
         {
            outputText("[chest]");
         }
         else if(get_player().get_tallness() >= 60)
         {
            outputText("脖子");
         }
         else if(get_player().get_tallness() >= 52)
         {
            outputText("自己的");
         }
         else
         {
            outputText("头发");
         }
         outputText("。引人注目的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛恳求地看着你，仿佛在说：[say: 我现在可以吃了吗？]");
         if(!param1)
         {
            outputText("[pg]你摇了摇头，毫不留情地把她推开。你耐心地解释说，如果她想吃这个美味，她需要听话。");
            if(gooObedience() >= 70)
            {
               outputText("[latexyname]立刻四肢着地趴在地上，用头蹭着你的[foot]乞求道：[say: 拜托了，[Master]，你的乳胶性奴能吃一点那美妙的精液吗？] 看来她终究还是能听话的。");
            }
            else if(gooObedience() >= 40)
            {
               outputText("[latexyname]发出了微不足道的抗议，[say: 我必须这样吗？那精液看起来真的很美味！我保证，我会乖乖的！我会让你用任何你想要的方式操我。如果你想的话，我甚至可以操你！]");
               outputText("[pg]你得意地笑了，惊讶于她竟然这么快就学会了乞求。不过，她还是不够听话。你命令她跪下。她毫不犹豫地照做了，尽管她那黑色的脸庞上明显挂着委屈的表情。你命令她四肢着地趴在你面前。她再次毫不犹豫地照做。然后，你要求她舔你的[feet]。");
               outputText("[pg]这团颤抖的黑色肉便器犹豫了片刻。她似乎想要反抗，但随后，她开始亲吻你的[feet]，最终伸出舌头来膜拜你。起初，她的嘴唇只是温柔地、试探性地触碰你。然而，很快就变得急切而迅速。[latexyname]很快就不只是在舔你的[feet]，而是全身心地膜拜它们，用舌头将它们擦拭得锃亮。当她开始享受其中时，可以听到液体滴落的声音。");
               outputText("[pg]直到这时，你才允许她停下来，揪着她的后颈把她拉起来。她学得很快。");
            }
            else
            {
               outputText("[latexyname]抗议道，[say:可是你抓了我！你至少应该有风度地给我点好吃的！]");
               outputText("[pg]你叹了口气，建议她如果想要这个，就得跪下。她皱起眉头，但在回头看了看你手中雪白的奖品后，她遗憾地跪了下来。她抬起头，皱着眉头问，[say:现在呢？]");
               outputText("[pg]你轻轻摇了摇头，说，[say:不是这样。张开嘴，用你的嘴唇乞求，然后你才能得到它。]");
               if(gooFluid() >= 66)
               {
                  outputText("[pg]踉跄着站起来，[latexyname]咆哮道，[say:去他妈的，我没那么渴！]她转过身去，此时甚至不愿意和你说话。");
                  gooObedience(-5);
                  gooHappiness(-3);
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
               outputText("[pg]踉跄着站起来，[latexyname]看起来快要放弃了。然后，她舔了舔嘴唇，打了个寒颤，似乎想起了自己的饥饿。她颓然跪倒在地，向后仰起头，张开嘴时甩掉了脸上的几缕乳胶。然后，她那玛瑙般的嘴唇无声地说，[say:喂我，求你了。]");
               outputText("这才像话。");
            }
         }
         outputText("[pg]你点点头，拔开瓶塞，递给她。她立刻像个喝干杯酒的水手一样把它倒进嘴里，喉咙无声地吞咽着，把那液体的负荷直接送进肚子里。[latexyname]大声打了个嗝，她的呼吸中充满了精液的气味");
         if(get_player().minotaurNeed())
         {
            outputText("这让你因为自己内心回荡的渴望而脸红。你情不自禁地扑向她，舔去她嘴唇上每一丝天堂般的牛头人精液，并舔去她体内最细微的残留物。你的奴隶");
            if(gooHappiness() < 33)
            {
               outputText("勉强地回应了这个吻，似乎更多的是在忍受。你几乎没有注意到，因为你已经欲火焚身了。");
            }
            else if(gooHappiness() < 66)
            {
               outputText("起初似乎很惊讶，但很快就开始享受起来，充满激情地交换着沾满精液的唾液。");
            }
            else
            {
               outputText("渴望地回应了这个吻，放纵地和你法式热吻。她的舌头高兴地把残留的精液推入你的嘴里。");
            }
            outputText("你退了回来，气喘吁吁，欲求不满，希望你自己喝了它");
            get_player().minoCumAddiction(2);
         }
         outputText("。");
         outputText("[pg][latexyname]抬头对你微笑，给了你一个相当长而性感的拥抱作为感谢。然后，在你的注视下，她的笑容变大了。她明亮的眼睛变得暗淡，虹膜扩张成空洞的餐盘。你乳胶宠物的无毛小穴肿胀起来，开始流口水，又热又重。她现在喘着粗气，呻吟着，微笑着，充满幸福。她二话不说，把手插进自己的阴户，把拳头一直埋到手腕处，插进柔软的小穴里。当她用手指操自己时，糖浆状的乳胶从周围涌出，把她的身心交给了你送给她的掺了药的精液所带来的麻木快感。几秒钟内，她高潮了，墨色的水汽溅满了地面。她尖叫着你的名字，再次插进去，一直插到自己的手肘。这引发了另一次混乱的高潮，甚至比第一次还要大。");
         outputText("[pg][latexyname]的眼睛翻白，她平躺着倒下，仍然用拳头和前臂操着自己。就这样，她一次又一次地高潮，屈服于麻痹她理智的麻醉性唤起，让她的身体充满了欲望之火。对她来说，除了不断攀升的快感和随之而来的狂喜释放，一个接一个，别无其他。她身体的颤抖加剧到了让你担心她会伤到自己弹性身体的地步，但幸运的是，她的身体完全瘫软下来，陷入了昏迷。");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         gooFluid(20);
         gooHappiness(15);
         if(param1)
         {
            gooObedience(-1);
         }
         else
         {
            gooObedience(5);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function meanGooGirlRecruitment() : void
      {
         get_game().set_inCombat(false);
         clearOutput();
         spriteSelect(SpriteDb.get_s_latexgoogirl());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,654,1);
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,658,get_monster().skin.tone);
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            get_player().consumeItem(get_consumables().SUCMILK);
         }
         else
         {
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         if(get_player().hasItem(get_consumables().BLACKEG))
         {
            get_player().consumeItem(get_consumables().BLACKEG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_BLKEG);
         }
         outputText("你走近那个发情的凝胶女孩，最后一次欣赏她那可溶性身体折射出的奇妙色彩。你从袋子里拿出黑蛋，然后");
         if(get_player().get_spe() > 60)
         {
            outputText("一边走，一边漫不经心地在手指上旋转着它，把它抛向空中，然后在下一次接住");
         }
         else
         {
            outputText("一边走，一边紧紧地把它握在手里");
         }
         outputText("。黏液女孩不解地抬头看着你，最后给了你一个充满希望的微笑——可怜的小家伙以为你要操她！你拍了拍她的头，指示她弯下腰。她当然照做了，从她那黏糊糊的底座上抬起一个令人愉悦的女性臀部向你展示。你甚至能看到一对女性的阴唇，完美地塑造成一个激情燃烧的女性的形状。");
         outputText("[pg]好吧，现在是时候了。你拿起黑蛋，开始把它推入她的小穴，心想以她扭曲的解剖结构，从哪个洞塞进去都无所谓。黏液女孩高兴地颤抖着，当你把黑蛋推入核心时，她的洞在你的手周围发热。她在你周围愉快地扭动着，她的肉壁似乎决心要从你的手臂上榨出幻影般的精液。");
         outputText("[pg]突然，她的动作停止了，你赶在她反应过来之前抽回了手臂，生怕她试图把它囚禁在那个黏糊糊的通道里。当你抽回手时，她的嘴唇开始变暗，逐渐变得不透明。伴随着一阵沮丧的晃动，黏液女孩站了起来，转过身面对你。她的下唇已经变成了闪亮的缟玛瑙色，撅着嘴，充满恐惧。她愤怒地举起双臂，上面覆盖着慢慢生长的黑斑。你对此早有准备，轻松地滑入她的防线，打开你带来的魅魔乳汁瓶，举到她的唇边。奶油般的液体充满了她的嘴，邪恶的味道很快让她吞咽起来。她把瓶子从你手中拉开，不假思索地把剩下的都喝光了，甚至没有注意到她的指尖已经凝固，变成了光滑坚实的物体，有着清晰的指甲。当她喝完药水时，她的乳房变大了，把她脸朝下拽到了地上。");
         outputText("[pg]她扭动着身体，但没能站起来，因为凝固的乳房太重了，无法移动。到目前为止，她的手臂已经凝结成光滑的缟玛瑙色，一直延伸到手肘，她的臀部同样是反光材料制成的深色球体，简直让人忍不住想摸一摸。在下面，她的黏液池正在缩小，向内收缩，同时变得更加不透明。它一分为二，逐渐扭曲缠绕，直到露出两条匀称的小腿，上面是一双娇小的脚。这些几乎瞬间就凝固了——变形正在加速！可渗透的薄膜迅速让位于她颤抖的身体上反光、光滑的乳胶，将黏液女孩塑造成了一个捆绑荡妇湿梦中的形象。随着她的整个身体从液体变成固体，曾经的黏液女孩陷入了昏迷，黑色的眼睑盖住了她坚实的[monster.skin]眼睛。");
         if(get_player().cor < 33)
         {
            outputText("[pg]担心你可能杀了她，你冲上前去检查她的呼吸。呼！她没事，只是像灯一样熄灭了。");
         }
         else if(get_player().cor < 66)
         {
            outputText("[pg]对她为什么失去知觉感到困惑，你走上前去确保她没有死。谢天谢地，她只是晕过去了。");
         }
         else
         {
            outputText("[pg]你喂给她的物品似乎产生了不寻常的反应，这让你感到恼火，你大步走上前去确保她没有死。如果这适得其反，那将是对两件强力物品的巨大浪费！呼！她还活着。");
         }
         outputText("[pg]现在，你得到了一个乳胶黏液女孩……或者一个乳胶女孩……随便吧。怎么把她带回家？");
         if(get_player().get_inte() >= 60)
         {
            outputText("[pg]你很快找到了一些木头和一些结实的芦苇作为绳子。不到 15 分钟，你就把收集到的部件组装成了一个简陋的拖拉架——一个你必须自己拉的拖拉架。把这个有着巨大乳房的性感乳胶堆抬到你的杰作上是一项艰巨的任务，但你勉强做到了。把她拖回营地也不容易，但多亏了你的机智，你省了不少力气。");
            get_player().changeFatigue(20);
         }
         else
         {
            if(get_player().get_str() < 60)
            {
               outputText("[pg]你试图举起她，但她太重了！该死！你不可能像这样把她带回营地，你也不能让传送门长时间无人防守，等她醒来。你现在必须离开她，等她醒来后再试图抓住她。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("[pg]你把她扛在肩上，拉紧你强健的肌肉来支撑那些巨大的乳房并保持直立。这项任务很艰巨，但你足够强壮，可以应付任何事情！");
            if(get_player().get_tou() < 40)
            {
               outputText("走到一半，你太累了，无法继续。你可能很强壮，但你没有耐力长期承受这样的重担。你现在必须离开她，等她醒来后再试图抓住她。");
               doNext(get_camp().returnToCampUseOneHour);
               get_player().changeFatigue(30);
               return;
            }
            outputText("当你到达营地时，你已经上气不接下气了，但你做到了！在所有这些工作之后，你需要一段时间才能喘过气来……你的胳膊和腿仍然因为过度劳累而发热！");
            get_player().changeFatigue(10);
         }
         menu();
         addButton(0,"继续",PCCarriedGooBackHome);
      }
      
      public function malePCDomFucksLatexGoo() : void
      {
         clearOutput();
         outputText("你解开你的[armor]，向你那乳胶般的爱人露出你的[cocks]。她毫不掩饰地用充满爱意的眼神看着它，下意识地舔了舔嘴唇，仿佛已经在舌尖尝到了精液的味道。[latexyname]从遐想中惊醒，问道，[saystart]你在做什么");
         if(gooObedience() > 50)
         {
            outputText("，[Master]");
         }
         outputText("？[sayend]");
         outputText("[pg]你用手掌托起她的下巴，让她抬起头看着你，同时向她解释。你打算狠狠地操她。然后，你要在她那有弹性、黏糊糊的小穴里射出浓稠的一发，直到有白色的丝带从她的缝隙里滴出来。[latexyname]听到你的宣言，羞得满脸通红。在她的膝盖之间，几滴液体不由自主地落到地上。纯黑色的乳头");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,666) == 1)
         {
            outputText("-阴茎");
         }
         outputText("在她的胸前变硬，凸显出来，简直是在乞求被吸吮。");
         if(gooObedience() < 60)
         {
            if(gooFluid() < 33)
            {
               outputText("[pg]带着毫不掩饰的饥渴舔着嘴唇");
            }
            else if(gooFluid() < 66)
            {
               outputText("[pg]惊愕地用舌头抵着脸颊");
            }
            else
            {
               outputText("[pg]翻了个白眼");
            }
            outputText("，[latexyname]");
            if(gooObedience() < 20)
            {
               outputText("大胆地反驳道");
            }
            else if(gooObedience() < 40)
            {
               outputText("没好气地回答");
            }
            else
            {
               outputText("怯生生地抗议道");
            }
            outputText("，[say:不。你不能强迫我。我可能被困在这个营地里，和我的族人分开了，但我不会让自己成为某种性玩具。]她双腿间流出的墨色润滑液");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
            {
               outputText("以及她那根坚硬的" + gooCock() + "让");
            }
            else
            {
               outputText("让");
            }
            outputText("你对她的说法表示怀疑，但她似乎下定决心要避免直接做爱，至少在你把她调教得更好之前是这样。");
            if(gooFluid() < 10)
            {
               outputText("她的饥渴显而易见，也许你最好尽快“喂饱”她？");
            }
            gooObedience(-3);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg][latexyname]向你抛了个媚眼，娇嗔道：[say:今天你想怎么要我呢，[Master]？插我的屁股？插我的小穴？还是你想操我的嘴？]");
         outputText("[pg]你指了指下面，告诉她你打算三个都要。这个橡胶荡妇高兴地尖叫起来，跪在你面前，咯咯笑着说：[say:我打赌我能让你在每个洞里都高潮，[Master]！]");
         if(get_player().cor < 33)
         {
            outputText("微笑着");
         }
         else if(get_player().cor < 66)
         {
            outputText("会意地微笑着");
         }
         else
         {
            outputText("厌倦了她的喋喋不休");
         }
         outputText("，你抓住她的头，把她拉向你。她明白了你的意思，把嘴张成一个大大的“O”型，正好让[oneCock]插进去，滑入那黑玛瑙般的开口，伴随着你喉咙里发出的愉悦呻吟。你爱人那黏糊糊的脖子让你得以进入，");
         if(get_player().biggestCockArea() < 80)
         {
            outputText("轻松地包裹住你的勃起");
         }
         else
         {
            outputText("在它进入她的核心时，高兴地伸展成你勃起的形状");
         }
         outputText("。过了她的嘴，她的内部变得不那么坚实了。感觉就像一团温暖的黏液在她的深处，再加上她滑溜溜的舌头抚摸你[cock]底部的感觉，你觉得你像在天堂一样。");
         if(get_player().cockTotal() > 1)
         {
            outputText("当她抓住你剩下的阴茎时，感觉更好了");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("并开始用稳健的动作抽插。");
         }
         outputText("[pg][latexyname]那充满活力的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛抬头看着你，她的脸颊凹陷以提供吸力。你再次呻吟，这次慢慢地把她的头往后拉。当她退后时，她光滑的黑色唾液从你的阴茎上滴下来，尽管其中大部分逐渐变硬，成为你工具的反光护套。你把她拉开，直到只有你的" + get_player().cockHead() + "留在那个吸吮的快乐洞里。然后，你把她猛地按下去，操她的嘴");
         if(get_player().biggestCockArea() >= 10 && get_player().biggestCockArea() < 50)
         {
            outputText("和喉咙");
         }
         else if(get_player().biggestCockArea() >= 50)
         {
            outputText("，喉咙和身体");
         }
         outputText("快速地抽插着。你在你的胯部上越来越快地颠弄着她");
         if(get_player().biggestCockArea() >= 80)
         {
            outputText("，惊叹于她竟然能如此轻松地承受这么多");
         }
         outputText("。最棒的是，她的眼睛从未停止仰视你，恳求你射精，释放并将精液塞满她的脸。");
         outputText("[pg]看着她那样看着你，操……你要射了！你把她的嘴唇紧紧贴在你的腹部[skinfurscales]上，释放出你体内沸腾的极乐。你的精液像粗绳一样喷涌而出，仿佛它一直试图逃跑，直到现在才找到自由。[latexyname]在你的[cock]周围微笑着，因为它把充满活力的粘液泵入她的喉咙，她抓住你的[butt]，让自己更紧地贴着你。");
         if(get_player().cumQ() >= 500)
         {
            outputText("在一次特别强烈的喷射后，精液从她的鼻孔喷出，但[latexyname]并不介意，甚至没有移开视线。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("你大量的精液使她的肚子变圆，但大部分液体的重量在瞬间转移到了她的乳房、臀部和屁股上。");
         }
         if(get_player().cumQ() >= 4000)
         {
            outputText("这不足以跟上你的效力。片刻之后，她的嘴角开始渗出雪白的液体，随着每一次脉动喷射而出。可怜的女孩。");
         }
         outputText("完事后，你把她拉开，让她喘口气。");
         outputText("[pg][latexyname]舔了舔嘴唇，欣赏着她的唾液在[oneCock]周围形成的乳胶鞘。[say: 搞定一个洞了，[Master]。]她举起一只手，指尖变长，长出锋利如剃刀的指甲。那些带刺的爪子毫无预兆地压进你的");
         if(get_player().balls > 0)
         {
            outputText("[sack]");
         }
         else
         {
            outputText("[cock biggest]");
         }
         outputText("，你一动不动。它们以完美无瑕、挑逗的关怀抚摸着你，尽管它们在身后留下了红色的刺激痕迹，但不知何故感觉很好。[latexyname]渴望地在你的会阴处挠痒痒，然后依依不舍地收回它们，问道，[say: 你准备好要我的小穴了吗？]");
         outputText("[pg]转过身来，这个好色的性玩具在你面前扭动着她的屁股来挑逗你。圆润的臀部随着每一次摇晃微微颤动，当涟漪穿过每一个丰满的脸颊时，反射着光芒。一股新鲜的血液涌向你的生殖器，告诉你，是的，你准备好要她的小穴了。你抓住这个乌木诱惑者纤细的腰身，打她的屁股，因为她竟敢抓你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("。她呜咽着，但又朝着你的方向扭动，尽管受到了惩罚，但仍锁定在她的目标上。一条乌木色的裂缝，如此温暖湿润，感觉就像在向你的勃起吹蒸汽，缩小了分开的几英寸空气。");
         outputText("[pg]挑逗对你产生了预期的效果，你把她猛拉到你的[cock]上。就像她的嘴和喉咙一样，一旦你穿过她女性的嘴唇，她的小穴很快就会变得粘糊糊的。在里面，她感觉就像温暖的明胶和阴道的结合体，具有前者的所有灵活性和屈服性，并结合了后者精美纹理的内部。[latexyname]屁股性感光滑的表面在你的[hips]上摩擦，她的小穴吞噬了你整个肉棒。无法逃避的兴奋卷须顺着你的脊柱蠕动，由你僵硬的男子气概高潮引起的敏感性喂养。它们让你陷入了只能被描述为性狂热的状态。");
         outputText("[pg]你抓住[latexyname]的头发，在抽插之间拉扯，迫使她拱起背部，以一种更令人愉悦的方式展示她的身体。啪，啪，啪……你的[hips]拍打着她，每一刻都变得越来越快。你倒霉的性伴侣因痛苦和兴奋而呜咽，当她高潮时，黑色的湿润涌过你的[legs]。你再次打她圆润的屁股，当震动的涟漪按摩你的[cock]时，你再次高潮。她光滑的小穴贪婪地吞噬了你身体能提供的最初几股喷射。它甚至从根部到" + get_player().cockHead() + "按摩你的长度，以哄出更多。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("这很快使她膨胀成怀孕的样子，在最后一次注射后，她无处代谢这一切。");
         }
         if(get_player().cumQ() >= 2000)
         {
            outputText("你继续，直到一股雪白的种子洪流从她的小穴流出，绕过你的肉棒。太棒了。");
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            outputText("下面的" + gooCock() + "吵闹地将墨水般的液体射入泥土中，很快就被吸收了。");
         }
         outputText("[pg]你踉跄着后退，靠在一块巨石上休息。在这个过程中，你的[cock]退出了[latexyname]那闷热黏腻的缝隙。闪闪发光的黑色润滑液从你的龟头一直拉丝到她的入口，其中还混合着精液。你呆呆地看着它们断裂，一根接一根地弹回最近的生殖器上。一个欢快的声音欢呼道，[saystart]这是第二次了！");
         if(get_player().cumQ() >= 1000)
         {
            outputText("而且弄得好脏！我不知道我还能不能装下更多！");
         }
         outputText("[sayend] 一只看起来像戴着乳胶手套的手将挂在[latexyname]阴阜上的汁液抹平，穿过她的股沟，用你残留的精液涂满了她的屁眼。");
         outputText("[pg]你喘着粗气，连续射精让你疲惫不堪。尽管如此，几英尺外就有一个充满活力的乳胶屁股，正催眠般地来回弹跳着。你确实说过你要把三个洞都射满，不是吗？");
         outputText("[pg][say: 来吧，[Master]，] [latexyname] 欢呼道，[say: 我已经准备好迎接你的肉棒了……只要插进来，我会接下你所有的精液。]");
         outputText("[pg]见鬼去吧！你从临时支撑物上踉跄着站起来，再次抓住你那性感的荡妇，这次对准了她的屁眼。这里是你说了算，天哪，你要把她操翻！你拍打着她一直被你忽略的那半边屁股，让它弹跳起来。在诱人的晃动平息之前，你猛地向前挺动[hips]，将你的[cock]直接塞进那起皱的乳胶屁眼里。乌黑的雏菊淫荡地伸展着，包裹着你的粗壮，比你今天探索过的另外两个洞要紧得多。半勃起的肉棒一寸一寸地进入黏液女人的肛门，但并非没有遇到一点阻力。");
         outputText("[pg]一旦完全进入，她紧致的括约肌就像阴茎环一样夹住你的[cock]，将血液困在里面，让它变得越来越硬。在她的肛门帮助下，你的勃起毫不费力地恢复了全盛状态，带着重新燃起的欲望，你开始在你的男子气概上弹跳那黑色的屁股。在紧致的圆环之外，你已经爱上的那种熟悉的、柔软的黏液开始用液体的压力按摩你。力量的波浪沿着你的长度滚动，像十几条舌头一样舔舐着它，同时她的入口让你保持着超级坚挺。");
         outputText("[pg]一次又一次，你占有着你战利品的肛门之星。你的臀部似乎进入了自动驾驶模式，带着粗暴的激情探索着那个黑色的屁眼。当你操她时，黏糊糊的墨水和残留的、涂抹的精液喷射出来，你抓住她的" + gooTits() + "，仿佛一个把手能帮你更好地控制这难以驾驭的快感。[latexyname] 呻吟着，[say: 哦，[name]！操我的屁股！打我，虐待我，然后射在我的屁股里，告诉我我是你的！]");
         outputText("[pg]你低吼一声，扇了她的奶子一巴掌，因为她竟敢命令你。这让她的屁股夹得你更紧了。不过，你觉得一个有点主动性的荡妇是个好荡妇，而且她表现出的主动性让她乞求得如此有创意。你奖励她，给了她想要的东西。啪！你的手重重地落在她的背上，你可以感觉到这一击一直传到她的体内。她呜咽着，滴下液体作为回应，所以你又做了一次，这次是在另一边。这次她滴下了更多的液体。你把打击融入你的节奏中——弹入，弹出，拍打，弹入，弹出，拍打……操，她太紧了，而你太敏感了，憋不住了。");
         outputText("[pg]你大喊一声，[say: 来了！] 然后将自己深深埋入你的乳胶宠物中，当你开始在她体内卸货时，用力捏住她的乳头。她在你身下颤抖，用高亢的声音呜咽着，而你在她耳边低语，[say: 我的宠物……]。当你的肉棒尽最大努力让黏液女人受孕时，你继续对她低语，解释说她身心都是你的，任你使用和虐待。你甚至开始提到你可以利用她独特形态的变态方式，在你的[cock]填满她的其余部分时，让她的脑海中充满了未来屈服的想法。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("几乎立刻，精液就从她的屁股周围滴落下来，流过你的[legs]。她太满了，装不下更多了——你的精液无处可去，只能流出来！");
         }
         if(get_player().cumQ() >= 2000)
         {
            outputText("你射得太多了，你的精液形成了一个大小可观的");
            if(get_player().cumQ() < 4000)
            {
               outputText("水坑");
            }
            else
            {
               outputText("湖泊");
            }
            outputText("。");
         }
         outputText("[pg][latexyname] 从你身上滑落，平躺在地上，进入一个");
         if(get_player().cumQ() >= 1000)
         {
            outputText("混合液体的水坑");
         }
         else
         {
            outputText("她自己残留的爱液水坑");
         }
         outputText("。时不时地，她的屁股会微微抬起并晃动，然后落下。她呜咽着，抽搐着，承受着自己高潮的余震。你筋疲力尽，但你站立着，取得了胜利。你操了你的乳胶奴隶所有的三个洞，而且比她坚持得更久。");
         outputText("[pg]当你穿好衣服时，你发现你的[cock]非常干净。它看起来很有光泽，就像被唾液擦亮了一样，但上面没有任何乳胶残留。不知何故，她的屁眼一定把她干涸的淫液和唾液又吸回了体内。你没想到肛交后会变得更干净，但这确实让你以一个高潮结束。你迈着大摇大摆的步伐穿好衣服，回到营地中心。");
         outputText("[pg]在你离开时，一个疲惫的声音叹息道，[say:那是……第三次了。]");
         var _loc1_:int = 15;
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         if(get_player().cumQ() >= 500)
         {
            _loc1_ += 10;
         }
         if(get_player().cumQ() >= 1000)
         {
            _loc1_ += 10;
         }
         if(get_player().cumQ() >= 1500)
         {
            _loc1_ += 10;
         }
         if(get_player().cumQ() >= 2000)
         {
            _loc1_ += 10;
         }
         gooFluid(_loc1_);
         get_player().changeFatigue(10);
         gooObedience(4);
         gooHappiness(2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function maleDirectFeedLatexGooGoneWrong() : void
      {
         clearOutput();
         if(get_player().cockTotal() > 1)
         {
            outputText("一只完美无瑕的手包裹住");
            if(get_player().cockTotal() > 2)
            {
               outputText("你剩余的勃起");
            }
            else
            {
               outputText("你另一个勃起");
            }
            outputText("，抚摸着");
            if(get_player().cockTotal() == 2)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("缓慢地抚摸着。她用多余的精液作为润滑剂，确保它们几乎像你的主阴茎一样被滑溜溜的乳胶包裹着。");
         }
         outputText("毫无预兆地，一阵狂喜爆发出来，迫使你的腹部肌肉产生颓废而愉悦的挤压，最终从");
         if(get_player().cockTotal() > 1)
         {
            outputText("每一个");
         }
         outputText("你的精液裂口");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("释放出白色的压力。[latexyname] 抬头看着你抽搐的身体，嘴里含着");
         if(get_player().biggestCockArea() > 80)
         {
            outputText("令人印象深刻的");
         }
         outputText("一大口阴茎，因为它直接泵入她的肚子，让她能更深地饮用你的精华。");
         outputText("[pg][latexyname] 将你从口交的囚禁中释放出来，时间长到足以从你的 [cockHead biggest] 漏出几缕精液。");
         if(get_player().cockTotal() == 1)
         {
            outputText("她的手固定在你光滑、涂满黑色乳胶的长度上，开始用急切的抽插抚摸它");
         }
         else
         {
            outputText("她急切的抽插从未减慢，她移动一只忙碌的手来抚摸你涂满黑色乳胶的长度");
         }
         outputText("。这个乳胶女孩用手指挠着你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("会阴");
         }
         outputText("，同时开心地解释道，[say: 我们黏液女孩的特点是……我们喜欢喝。嗯……] 她的声音逐渐变成愉悦的哼唱，因为她消化了你最新的供品，最终又回来说，[say: 你尝起来真好，[name]……我停不下来，它太甜了，太美味了。吞下你的精液让我的小穴喷水，让我的肚子发出咕噜声。你不介意我再尝几口吧？]");
         outputText("[pg]你咕哝出一些听起来像是否定的声音。此时你已经无法用言语表达，陷入了对你过度敏感的阴茎无休止的挑逗循环中");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。更糟糕的是，你一直享受的黏滑手淫");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("变成了");
         if(get_player().cockTotal() == 1)
         {
            outputText("");
         }
         outputText("能给你带来更强烈快感的东西。如果你能把眼睛往下看，你会看到 [latexyname] 的手指融合在一起，连接成一个单一的圆柱体。黑色的油开始从那紧紧的握力中滴落，而她“手”底部形成的令人愉悦的、带紫色的乳胶嘴唇，一个带有乳胶润滑剂的模拟小穴，让这一切变得更加难以忍受。在每一次向下抽插的底部，你的阴茎都会从顶部挣脱出来，出现的时间刚好够她慵懒地吸吮你的 [cockHead]。");
         outputText("[pg]高潮以大锤般的力量猛击你，让你的视线变红，耳朵嗡嗡作响。随着 [latexyname] 更深地饮用你的精华，从你被彻底挤奶的 [balls] 中诱导出新鲜的白色喷射物，你的腹股沟发出更多湿润的吸吮和吧唧声。当你将液体的极乐射入她体内时，你疲惫的眼睑闭上了。");
         outputText("[pg][say: 你还没完，对吧？] 一个性感的嗓音低语着，伴随着对你男性特征的新一轮服侍。[say: 你答应过要喂我的，[Master]，现在来吧，在我滑溜溜的挤压中喷射。把你的精液给我！] 那个声音乞求着，恳求着，只有在重新贴在你的 [cock biggest] 上时才安静下来。你失去了意识，只有在抬高臀部为你贪婪的宠物释放新鲜营养时才会动一下。");
         menu();
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-3));
         addButton(0,"继续",feedCumDirectEpilogue);
      }
      
      public function letLatexGooDrainCuntDry() : void
      {
         clearOutput();
         outputText("[latexyname]的脸依然固执地贴在你的下体上。无论你如何扭动或推开她，她都死死地吸附在你的[vagina]上。近乎超自然的快感让你的手臂软得像果冻，几次挣脱无果后，你无力地瘫倒回去。你饥渴的宠物那" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛一眨不眨地盯着你。她毫不留情地用舌头舔弄你湿透的缝隙，将你推向另一次高潮。滑溜溜的乳胶嘴唇在你的女性私处上滑动，性爱的狂喜淹没了你的思绪，你翻着白眼，大脑将全部力量都用来体验这强加于你的快感。");
         outputText("[pg]你一言不发地在[latexyname]身上扭动，直到高潮终于放过你。你的黏液宠物退了回去，甚至把舌头从你汁水四溢的小穴里抽了出来。她的拳头毫不迟疑地取而代之。事实上，当那光滑的肢体滑入时，你能感觉到最粗大的部分变得平滑，塑造成一个圆柱形的物体，在“手腕”上方有一道明显的凸起。[latexyname]咯咯笑着，[say: 天哪，你尝起来真棒，我们黏液女孩……我们最喜欢喝了。嗯……] 她的声音渐渐变成愉悦的哼哼声，消化着你最新的贡品，最后又说道，[say: 你的小缝隙看起来开心极了，[name]……我不想停下来，它太甜了，太美味了……吞下你的淫水让我的小穴喷水，肚子咕噜咕噜叫。你不介意我再多尝几口吧？]");
         outputText("[pg]你出声抗议，但乳胶嘴唇紧紧包裹住你[clit]的感觉，迅速将你的抗议变成了呻吟和咕噜声。");
         if(get_player().getClitLength() >= 3)
         {
            outputText("她配合着手臂的抽插，开心地为你口交。");
         }
         else
         {
            outputText("她配合着手臂的抽插，开心地舔舐吮吸你最敏感的部位。");
         }
         outputText("她那像假阳具一样的肢体抽插时发出刺耳的吧唧声，轻易地淹没了你更连贯的发声。除了为你的乳胶黏液女孩高潮，你什么也做不了。除了感受快感和高潮，一次又一次地喂给她每一滴你那充满快感的液体，你别无选择。");
         outputText("[pg]一声抗议的呜咽从你嘴里滑出，你的[vagina]再次高潮，[latexyname]又一次大口吞咽。眼睑颤动着闭上，你失去了意识，将身体交给[latexyname]，任由她一次又一次地索取。");
         menu();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-3));
         addButton(0,"继续",feedCumDirectEpilogueGirls);
      }
      
      public function leaveTheLatexGooGirl() : void
      {
         clearOutput();
         outputText("你没有时间处理这个……东西。你把女孩放在岸边，然后回到营地。希望无论什么东西找到她，都不会太可怕。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function latexyTalkMenu() : void
      {
         clearOutput();
         outputText("你想和她谈些什么？");
         menu();
         addNextButton("她怎么样？",latexyHowIsShe).hint("问问她感觉如何。");
         addNextButton("黏液女孩",latexyGoos).hint("问更多关于她族人的事。");
         addNextButton("乳胶",latexyLatex).hint("她真的喜欢她的新身体吗？");
         setExitButton("返回",approachLatexy);
      }
      
      public function latexyLatex() : void
      {
         clearOutput();
         outputText("从一个普通的黏液女孩变成现在这个样子，肯定需要很大的适应过程，所以你问[latexyname]对自己的转变有何感想。听到你的问题，她不安地扭动了一下，似乎不知道该怎么回答。");
         outputText("[pg][say:" + (gooHappiness() >= 75 || gooObedience() >= 75 ? "我想……我想这并不完全令人不快，虽然我确实很怀念我以前的身体。它" : "我……我讨厌它。每时每刻我都会想起我失去了什么。我以前的身体") + "要柔软得多——失去改变形态的能力几乎就像失去了一条肢体。也许更糟。[if (latexyhappiness >= 75) {虽然我不能否认这个身体也有它自己的乐趣|[if (latexyobedience > 50) {虽然我接受这是[if (latexynicetf) {我被赋予的|你赋予我的}]形态|我想我永远无法原谅你}]}]。]");
         outputText("[pg]站在你面前的乳胶黏液女孩看起来" + (gooHappiness() >= 75 || gooObedience() >= 75 ? "有些矛盾" : "几乎痛苦不堪") + "。你想你当时做这件事的时候并没有完全考虑到她的感受，[if (corruption < 50) {但你会尽力让她新的生活更愉快|虽然你现在也不怎么在乎}]。就在你注视着她的时候，[latexyname]用手指顺着她光滑闪亮的一侧滑下，然后打了个寒颤。");
         doNext(latexyTalkMenu);
      }
      
      public function latexyHowIsShe() : void
      {
         clearOutput();
         outputText("你对她的状况很感兴趣，于是询问你的黏液奴隶过得怎么样。");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,662) >= 75)
         {
            outputText("[pg][say:好极了[if (latexyobedience >= 75) {，[Master]}]！你确实把我喂得很好，我没什么可抱怨的。[if (latexyobedience >= 75) {不、不是说我会质疑你。|继续保持！}]]");
            outputText("[pg]很高兴知道她很享受被囚禁的生活。似乎最初的那些大惊小怪已经平息了，她已经接受了现实。");
         }
         else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,662) >= 25)
         {
            outputText("[pg][say:很好，]她[if (latexyobedience >= 75) {顺从地|用一种难以捉摸的声音}]说。你等了一会儿，但没有进一步的回答。你不确定她现在是真的没什么感觉，还是只是不愿多说。");
            outputText("[pg]不管怎样，至少她没有公开表现出不满。[if (cor < 50) {你不想让她过得太不舒服|你可不想让她开始产生反叛的念头..}]。");
         }
         else
         {
            outputText("[pg]你立刻捕捉到了她脸上阴沉的表情，但她很快就掩饰了过去，[if (latexyobedience < 50) {[if (latexyobedience < 25) {尽管留下的那一丝愁容并没有改变多少|只是抿紧了嘴唇}]|恭敬地低下头}。[say:[if (latexyobedience >= 50) {哦，我过得非常好，[i:[Master]]|我……不会抱怨的}]。]");
            outputText("[pg]好吧，这绝对不能让人产生任何信心。你仔细地打量着她，寻找任何反抗的迹象，但她显得特别冷淡，显然是在隐藏自己的情绪。");
         }
         doNext(latexyTalkMenu);
      }
      
      public function latexyGoos() : void
      {
         clearOutput();
         outputText("你意识到自己从未真正了解过黏液女孩。表面上看，她们似乎是头脑简单的宁芙，唯一关心的就是能吞下多少精液，但她说过的一些话让你怀疑她们是否还有更多内涵。考虑到这一切，你让[latexyname]告诉你更多关于她们的事。");
         outputText("[pg]她精神振奋了片刻，但随即又皱起了眉头。[say:我……不知道该怎么解释，]她说。[say:有太多事情根本说不通。对我来说不再有意义，对你来说也不会有意义。]你的乳胶奴隶叹了口气。[say:我失去了太多……]");
         outputText("[pg]过了好一会儿，她继续说道，声音中带着一丝忧郁。[say:我们关心的只有阳光和灵魂。一切都是纯粹的音乐，即使是蔓延的污秽也无法触及我们最重要的地方。我们的生活和存在都得到了升华。]听起来她几乎是在强忍着泪水，但她很快控制住了自己，脸上的表情变得异常平静。");
         outputText("[pg][say:想那些也没用。[if (latexyobedience < 50) {自从[if (latexynicetf) {我变成这样|你把我从这一切中剥离出来}]之后就没有了|我现在是你的了}]。[if (latexyhappiness >= 75) {但不管怎样，我在这里的生活并没有悲惨到我会……|但自从我失去了那个，我……}]]她摇了摇头。[say:不，我活在此时此地。我回不去了。我回不去了。][Latexyname]只是站在那里好一会儿，思绪飘荡。");
         outputText("[pg][say:不过，我确实很怀念那音乐……]她总结道，目光深邃。");
         doNext(latexyTalkMenu);
      }
      
      public function latexyEatsADickItem(param1:ItemType) : void
      {
         var _loc2_:* = null as IMap;
         get_player().consumeItem(param1,1);
         clearOutput();
         outputText("[latexyname]毫不犹豫地使用了你提供的物品。令人惊讶的是，除了闭上眼睛，露出一副极其专注的神情外，她似乎没有任何反应。");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
         {
            outputText("她那玛瑙般的阴阜隆起，丰满的阴唇包裹着内部的某种东西。渐渐地，它们像丝绸面纱一样分开，露出了一个");
            if(param1 == get_consumables().MINOBLO)
            {
               outputText("扁平的龟头");
            }
            else
            {
               outputText("球状的冠状沟");
            }
            outputText("。新生的肉棒尖端变粗，将她撑得更开，同时逐渐从周围的女性血肉中垂落下来。");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,667,8);
            set_cockType(CockTypesEnum.HUMAN);
            if(param1 == get_consumables().MINOBLO)
            {
               outputText("它不断地伸长。照这个速度，她真的会像种马一样雄伟！");
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,667,13);
               set_cockType(CockTypesEnum.HORSE);
            }
            outputText("然后，它开始变硬，向上拱起，进入完全勃起的状态。新长出的肉棒似乎是从她的阴蒂长出来的，但当你俯身检查她的阴道时，你发现她的阴户稍微向下移动了，并且长出了一个新的阴蒂来取代旧的。");
            outputText("[pg][say: 你让它变得更硬了！] [latexyname]抱怨着，试图用手遮住它。当然，这只会让它变得更硬，一滴油腻的先列腺液在顶端渗出。你会习惯这个的。<b>[latexyname]现在有一根" + Utils.num2Text(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667)) + "英寸长的");
            if(param1 == get_consumables().MINOBLO)
            {
               outputText("马-");
            }
            outputText("鸡巴！</b>");
            gooObedience(5);
         }
         else
         {
            if(param1 == get_consumables().GROPLUS)
            {
               outputText("她的" + gooCock() + "颤抖着，开始从根部向外生长，在你眼前变长。一……二……三……新长出的几英寸闪亮肉棒展现在你面前！[pg][latexyname]咯咯笑着，[say: 你还真是喜欢大的！]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc2_,667,FlagDict_Impl_.arrayReadFloat(_loc2_,667) + 3);
            }
            else if(param1 == get_consumables().REDUCTO)
            {
               outputText("她的" + gooCock() + "颤抖着，开始向内收缩，消失在她光滑的腹部。这效果如此惊人，以至于你不得不揉揉眼睛再看一次。[latexyname]的阴茎现在只有原来大小的三分之二了！[pg]她咯咯笑着，[say: 不喜欢大家伙，是吧？]");
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,667,Math.round(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) * 0.66));
            }
            else
            {
               outputText("她的" + gooCock() + "迅速勃起，几秒钟内就完全膨胀。静脉开始移动，在她玛瑙般的皮肤下像小虫子一样爬行，重塑着她的阴茎。一声闷哼从[latexyname]的唇间溢出，伴随着从她龟头和肉缝中流出的黑色先列腺液。然后，伴随着有力的收缩，这个乳胶女人的阴茎凝固成了新的形状。<b>[latexyname]的男性特征现在是一根");
               if(param1 == get_consumables().CANINEP)
               {
                  set_cockType(CockTypesEnum.DOG);
               }
               if(param1 == get_consumables().EQUINUM)
               {
                  set_cockType(CockTypesEnum.HORSE);
               }
               if(param1 == get_consumables().P_DRAFT)
               {
                  set_cockType(CockTypesEnum.HUMAN);
               }
               if(param1 == get_consumables().W_FRUIT)
               {
                  set_cockType(CockTypesEnum.CAT);
               }
               if(param1 == get_consumables().INCUBID)
               {
                  set_cockType(CockTypesEnum.DEMON);
               }
               if(param1 == get_consumables().MINOBLO)
               {
                  set_cockType(CockTypesEnum.HORSE);
               }
               outputText(gooCock() + "！</b>");
            }
            gooObedience(2);
         }
         menu();
         addButton(0,"继续",approachLatexy);
      }
      
      public function latexyAppearance() : void
      {
         clearOutput();
         outputText("站在你面前的是[latexyname]，你的乳胶黏液女孩。她的整个身体都是由光滑的黑色乳胶组成的，甚至连她的头发也是，从她的头上垂下细细的几缕。她那闪亮的玛瑙光泽中唯一的例外是她明亮的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "目光，目前正盯着你，带着一种[if (latexyobedience < 30) {挑衅的|[if (latexyobedience >= 70) {顺从的|难以捉摸的}]}]神情。你的目光甚至向下扫去，掠过她的" + gooTits() + "和" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) != 0 ? gooCock() : "滴水的肉褶") + "。盯着那深色、光滑的皮肤，你忍不住想去触摸它，[if (latexyobedience >= 50) {而且你知道她会让你这么做的|虽然你现在不确定她会有什么感觉}]。");
         doNext(approachLatexy);
      }
      
      override public function latexGooFollower() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,657) > 0;
      }
      
      public function latexGooAtCamp() : Boolean
      {
         if(latexGooFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1085) == 0;
         }
         return false;
      }
      
      public function gooTits() : String
      {
         return BreastStore.breastDescript(int(gooTitSize()));
      }
      
      public function gooTitSize() : Number
      {
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) / 2 >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,665) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,665) > 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,665);
         }
         return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) / 2;
      }
      
      public function gooTitClass(param1:int) : int
      {
         if(param1 >= 35)
         {
            return 7;
         }
         if(param1 >= 24)
         {
            return 6;
         }
         if(param1 >= 15)
         {
            return 5;
         }
         if(param1 > 4)
         {
            return 4;
         }
         if(param1 > 3)
         {
            return 3;
         }
         if(param1 > 2)
         {
            return 2;
         }
         return 1;
      }
      
      public function gooObedience(param1:Number = 0, param2:Boolean = true) : Number
      {
         var _loc3_:* = null as IMap;
         if(param1 != 0)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc3_,663,FlagDict_Impl_.arrayReadFloat(_loc3_,663) + param1);
            if(param2)
            {
               outputText("\n<b>服从度变化: " + Math.round(param1 * 10) / 10 + "%</b>");
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,663) < 1)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,663,1);
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,663) > 100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,663,100);
            }
         }
         return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,663);
      }
      
      public function gooName() : String
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,656);
      }
      
      public function gooHappiness(param1:Number = 0, param2:Boolean = true) : Number
      {
         var _loc3_:* = null as IMap;
         if(param1 != 0)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc3_,662,FlagDict_Impl_.arrayReadFloat(_loc3_,662) + param1);
            if(param2)
            {
               outputText("\n<b>快乐值变化：" + Math.round(param1 * 10) / 10 + "%</b>");
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,662) < 1)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,662,1);
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,662) > 100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,662,100);
            }
         }
         return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,662);
      }
      
      public function gooFluid(param1:Number = 0, param2:Boolean = true) : Number
      {
         var _loc3_:* = null as IMap;
         if(param1 != 0)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc3_,664,FlagDict_Impl_.arrayReadFloat(_loc3_,664) + param1);
            if(param2)
            {
               outputText("\n<b>体液变化：" + Math.round(param1 * 10) / 10 + "%</b>");
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) < 1)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,1);
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) > 100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,100);
            }
         }
         return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664);
      }
      
      public function gooCock() : String
      {
         return Appearance.cockDescription(get_cockType(),FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667),FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) / 6,50,100);
      }
      
      public function get_cockType() : CockTypesEnum
      {
         return CockTypesEnum.ParseConstantByIndex(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,668));
      }
      
      public function femalePCDomFucksLatexGooFuta() : void
      {
         clearOutput();
         outputText("在[latexyname]好奇的注视下，你开始脱下你的[armor]。她问道，[say: [name]，你在做什么？]");
         outputText("[pg]你淫荡地扭动着[hips]，告诉她你要操她——骑在她那闪亮的肉棒上，一次又一次地达到高潮。[latexyname]的" + gooCock() + "立刻硬了起来，坚挺而骄傲。");
         if(gooObedience() < 60)
         {
            if(gooFluid() < 33)
            {
               outputText("她毫不掩饰自己的饥渴，舔了舔嘴唇");
            }
            else if(gooFluid() < 66)
            {
               outputText("她惊慌失措地用舌头抵住脸颊");
            }
            else
            {
               outputText("她翻了个白眼");
            }
            outputText("，[latexyname]");
            if(gooObedience() < 20)
            {
               outputText("大胆地反驳道");
            }
            else if(gooObedience() < 40)
            {
               outputText("没好气地回答");
            }
            else
            {
               outputText("怯生生地抗议道");
            }
            outputText("，[say: 不。你不能强迫我。我可能被困在这个营地，和我的族人分开了，但我不会让自己成为什么性玩具。]她双腿间流出的一丝墨色润滑液和她那坚挺的" + gooCock() + "让你对她的说法表示怀疑，但她似乎下定决心要避免直接做爱，至少现在是这样。");
            if(gooFluid() < 10)
            {
               outputText("她的饥渴显而易见，也许你最好尽快“喂饱”她？");
            }
            gooObedience(-3);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("起初，她伸手去摸自己，一想到这事就兴奋得想马上开始，但她想起了自己的身份，停了下来。这个乌木般的奴隶女孩问道，[say: 我应该坐下来让你骑我吗，[Master]？还是你希望我骑你？]");
         outputText("[pg]你告诉她你说了算，所以你要在上面。[latexyname]咧嘴一笑，在地上摊开身体，靠在一块大石头上。她那");
         if(gooFluid() > 60)
         {
            outputText("丰满的");
         }
         outputText("臀部在她坐下时微微凸起，你停顿了一下，欣赏着眼前这曲线优美的玛瑙色身躯。她的" + gooCock() + "在你眼前硬了起来。它那反光的黑曜石般的皮肤慢慢绷紧，在光线下闪闪发光。它越变越大，直到达到极限，即便如此，[latexyname]的勃起还是进一步膨胀，就像一根塞得太满的香肠。你小心翼翼地摸了摸它，它用一滴黑色的先列腺液回报了你的好奇心。");
         outputText("[pg][latexyname]淫荡地呻吟着，[say: 噢噢噢……我一直很喜欢做这些东西……]");
         outputText("[pg]你轻轻拍了拍那根" + gooCock() + "，并对她嗤之以鼻——她当然喜欢。那么，她今天能成为你的假阳具真是太幸运了。你用拇指抚摸着那根坚硬如铁的阴茎，它高高跳起，向着你的触碰弹去，就像一只想要被抚摸的猫。你嗤笑着，刷过那个黑色的气泡，将先列腺液涂抹在肿胀的勃起物上。液态乳胶先列腺液很快在你的手上干涸，让它看起来像一只亮黑色的手套。你觉得你还不如把这身打扮弄完整，换了只手后，你就有了一双相配的手套。这个乳胶女人的工具并没有因为她的先列腺液而发生改变——它似乎在干涸后直接被她的皮肤吸收了，让它像以前一样光滑、乌黑。虽然这很有趣，但你还不想让她射出来，至少在你玩够之前不想。");
         outputText("[pg]你抓住它的根部，将" + gooCock() + "向上倾斜，对准你。它的顶端明显变粗了，仿佛读懂了你的意图。你转动[hips]悬停在它上方，没有开场白，你向下压，将光滑的乳胶鸡巴吸入你湿滑的通道。在它的先列腺液和你自己的润滑液的共同作用下，插入出奇地容易。");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) / 6 > get_player().vaginalCapacity())
         {
            outputText("当然，因为它太大了，你无法全部吞下，但你尽了最大努力去尝试。");
         }
         else
         {
            outputText("很快，你的[butt]靠在了[latexyname]油滑的皮肤上，她的勃起物很好地依偎在你的体内。");
         }
         outputText("你试探性地上下弹跳了几下，享受着那根" + gooCock() + "挤压着你的肉褶并在你体内搅动的感觉。你的宠物伸手抓住你的[hips]以支撑身体。她喘息着");
         if(get_player().isTaur())
         {
            outputText("贴在你的后腿上");
         }
         else if(get_player().get_tallness() >= 84)
         {
            outputText("贴在你的身侧");
         }
         else if(get_player().get_tallness() >= 70)
         {
            outputText("贴在你的肩膀上");
         }
         else if(get_player().get_tallness() >= 60)
         {
            outputText("贴在你的脖子上");
         }
         else
         {
            outputText("越过你的头顶");
         }
         outputText("，试图将自己拉向你，更深地进入你体内。");
         get_player().cuntChange(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) / 6,true,true,false);
         outputText("[pg]你在[latexyname]身上弹跳得越来越快");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) / 6 <= get_player().vaginalCapacity())
         {
            outputText("，你的[butt]湿漉漉地拍打着她黑玛瑙般的大腿");
         }
         outputText("。很快，你感觉到体内的" + gooCock() + "传来一阵明显的抽动，在你来得及阻止之前，一股浓稠、滑腻的温暖感从你的子宫向外辐射。伴随着湿润和体热的爆发，你的子宫里逐渐涌起一股压力，最终爆发出一股滑腻的黑色粘液，");
         if(get_cockType() == CockTypesEnum.DOG)
         {
            outputText("由于你宠物粗大的肉结，这些黏液被困在了你的体内");
         }
         else
         {
            outputText("从你的[vagina]喷射而出");
         }
         outputText("。你转过头去责骂道，[say:我没允许你高潮！]");
         outputText("[pg][say:我控制不住自己，[Master]……你感觉太棒了！就像一个用蜂蜜做成的老虎钳，要把我榨干！][latexyname]脱口而出。好吧，听到这样的宣言，很难生得起气来。她接着说，[say:别担心，我会保持硬度的。我是黏液女孩，记得吗？转移一点体液根本不算什么。]");
         outputText("[pg]决定暂时原谅她");
         if(!get_player().isTaur())
         {
            outputText("，你转过身面对她，将你的[chest]压在她的胸前。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,666) == -1)
            {
               outputText("她的乳头小穴");
               if(get_player().hasFuckableNipples())
               {
                  outputText("亲吻着你的");
               }
               else
               {
                  outputText("吞没了你的乳头");
               }
               outputText("。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,666) == 1)
            {
               outputText("她的乳头肉棒");
               if(!get_player().hasFuckableNipples())
               {
                  outputText("涂抹在你的乳房上");
               }
               else
               {
                  outputText("消失在你的乳头小穴里");
               }
               outputText("。");
            }
            else
            {
               outputText("她的乳头");
               if(!get_player().hasFuckableNipples())
               {
                  outputText("在你的乳头上摩擦");
               }
               else
               {
                  outputText("对接进你的乳头小穴里");
               }
               outputText("。");
            }
         }
         else
         {
            outputText("，你开始抚摸你的[nipples]，并在她的大腿上弹跳着臀部。");
         }
         outputText("天哪，你可能会习惯这种感觉的！你瞥了一眼你的[vagina]，当你看到你的阴阜被黑色的乳胶覆盖时，你退缩了。这很合理，但还是吓了你一跳。你咕哝着，继续操她，感觉她粘稠的精液从她把你小穴变成的黑色内射中喷射出来。在她身下，一滩混合着精液的润滑液已经形成。");
         outputText("[pg][latexyname]乞求道，[say: 我可以吻你吗，求你了[Master]？我、我快要高潮了！]");
         outputText("[pg]又来？你觉得有点慷慨，或者只是发情了，于是你点了点头。她可以吻你。");
         if(get_player().isTaur())
         {
            outputText("这名胶衣女郎毫不犹豫地弯下腰，亲吻你那马一般的屁股，甚至还凑上前去亲吻你那娇嫩的后庭。");
         }
         else
         {
            outputText("这名胶衣女郎毫不犹豫地将她那光泽的嘴唇贴在你的唇上，甚至还将她那滑溜溜的舌头伸进你的嘴里。");
         }
         outputText("她那热情的亲吻和抽搐的肉棒让你的感官不堪重负，还没来得及警告她，你就高潮了。");
         outputText("[pg]你毫无预兆地紧紧夹住那根" + gooCock() + "，立刻开始用你那如天鹅绒般的内壁按摩它。你的小穴似乎知道该怎么做才能得到它想要的，而[latexyname]根本不是对手。她结结巴巴地说，[say: 要……要……哦，天哪！] 然后开始喷射，将一股股黑玛瑙般的粘液直接喷进你的子宫。她的嘴唇再次压了上来，掩盖了她那充满幸福的呜咽声");
         if(!get_player().isTaur())
         {
            outputText("以及你自己的声音");
         }
         outputText("。你们俩一起沉浸在狂喜之中，高潮……高潮……不断地高潮。");
         if(get_player().hasCock())
         {
            outputText("白色的液体从你的[cocks]中肆意喷发。你甚至不在乎它弄脏了[latexyname]的" + gooTits() + "。感觉太棒了，而且她身上溅满糖霜般液体的样子看起来真漂亮。");
         }
         if(get_player().hasCock() && get_player().cumQ() >= 750)
         {
            outputText("当然，你很快就用一波白色的浪潮将那些液体掩埋了。");
         }
         outputText("[pg][latexyname]紧紧抱着你，在你体内完成了释放。最后几股黑色的精液让你的小穴感到一阵愉悦的泥泞。你心满意足地叹了口气，从你的战利品身上站起来");
         if(get_cockType() == CockTypesEnum.DOG)
         {
            outputText("，无视了她的肉结滑出时发出的响亮“啵”声，");
         }
         outputText("并将你沾满液体的阴道凑到她脸前。她知道该怎么做，立刻用舌头开始清理。超过两英尺长的灵活口部肌肉钻进你的[vagina]，那令人愉悦的爱抚让你知道你的宠物有多享受这项任务。她热情地吞食着她黏糊糊的精液和你的女性体液，动作从未放缓。即使你确信自己已经干净了，她仍在继续，激起你身体里新的情欲。");
         outputText("[pg]这可不行。你命令她停下");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,672) > 0)
         {
            outputText("，她顺从地照做了。为了奖励她是个好宠物，你给了她一个深情的舌吻。");
         }
         else
         {
            outputText("，但命令被无视了。[latexyname]的鼻子埋进了你小穴变成的黏滑泥泞中，更深更用力地压进去，贪婪地吞食你的汁液。厌倦了她的不服从，你把她推开，当一寸又一寸滑溜溜的舌头滑出时，你打了个寒颤。这个有着性感肌肤的荡妇立刻试图爬起来，但你把她按倒，并狠狠地扇了她一巴掌。她僵住了，慢慢地把手举到脸颊上。闪闪发光的黑色眼泪从她眼中流出，她道歉道，[say: 对不起！对不起！我会乖的，我会乖的！我保证！]");
            outputText("[pg]你点点头，然后，在她还没来得及回味惩罚之前，你给了她一个吻。之后她羞得满脸通红，捂着嘴咯咯地笑。");
         }
         outputText("你穿好衣服，大摇大摆地离开了。一个面带微笑、身体结实的黏液女孩留在你身后。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         get_player().slimeFeed();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,672,FlagDict_Impl_.arrayReadInt(_loc1_,672) + 1);
         gooFluid(5 + get_player().wetness() * 2);
         gooObedience(4);
         gooHappiness(2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function femalePCDomFucksLatexGoo() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你开始脱衣服，并对[latexyname]说，你有个地方很痒，她正好能帮你挠挠。好像你的话还不够清楚似的，你");
         if(get_player().balls > 0)
         {
            outputText("把你的[sack]挪开，以便");
         }
         else if(get_player().hasCock())
         {
            outputText("把你的[cocks]挪开，以便");
         }
         outputText("露出了你的[vagina]，阴唇已经因为欲望而充血，呈现出玫瑰般的红色。");
         if(gooObedience() < 60)
         {
            if(gooFluid() < 33)
            {
               outputText("[pg]带着毫不掩饰的饥渴舔着嘴唇");
            }
            else if(gooFluid() < 66)
            {
               outputText("[pg]惊愕地用舌头抵着脸颊");
            }
            else
            {
               outputText("[pg]翻了个白眼");
            }
            outputText("，[latexyname]");
            if(gooObedience() < 20)
            {
               outputText("大胆地反驳道");
            }
            else if(gooObedience() < 40)
            {
               outputText("没好气地回答");
            }
            else
            {
               outputText("怯生生地抗议道");
            }
            outputText("，[say: 不。你不能强迫我。我可能被困在这个营地，和我的族人分开了，但我绝不会让自己成为什么性玩具。]她双腿间流下的一丝墨色润滑液");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
            {
               outputText("以及她那根坚硬的" + gooCock() + "让");
            }
            else
            {
               outputText("让");
            }
            outputText("你对她的说法表示怀疑，但她似乎下定决心要避免直接的性行为，至少目前是这样。");
            if(gooFluid() < 15)
            {
               outputText("她的饥渴显而易见，也许你最好尽快“喂饱”她？");
            }
            doNext(get_camp().returnToCampUseOneHour);
            gooObedience(-3);
            return;
         }
         outputText("[pg][latexyname]立刻四肢着地，顺从地鞠了一躬。[say: 您想怎么操我，[Master]？]她问道。");
         outputText("[pg]你用一根手指挑起她的下巴，让她看着你的眼睛，用不容置疑的语气命令她张开双腿。你想感受她那玛瑙般的小穴在你的私处摩擦，阴蒂埋在她滑溜溜的阴唇之间。她服从了，就像个顺从的荡妇。你脱完衣服，把[armor]扔到一边，紧贴着她滑了过去，享受着她乳胶般光滑的双腿在你湿润的下体下滑动的触感。当你接触到[latexyname]布满液体的下体时，你的腹股沟爆发出一阵温暖的电流，那是美味的、由欲望点燃的火焰，融化了你的理智。");
         outputText("[pg]立刻，覆盖在[latexyname]无毛小穴上的黑色润滑液开始粘附在你的小穴上。它感觉比你自己的分泌物还要滑，但性油斑块的边缘在暴露于空气中后很快开始变干。变硬的液体乳胶紧紧地包裹着你的外阴，将你的私处外表面包裹在坚固的黑色中。这种新感觉一点也不令人不快。事实上，这种收缩的包裹感加剧了向你袭来的女同性恋快感。");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            outputText("与此同时，" + gooCock() + "在结合的阴道上方无用地摇晃着，因为它被忽视了，所以流出了自己的分泌物。");
         }
         outputText("你沉浸在快感中，前后上下地摆动着你的[hips]，在宠物那超级湿滑的小穴上无意识地摩擦着，将自己推向新的高潮。");
         outputText("[pg]一阵感官上的颤栗震撼了你的世界，以其强烈的程度冲击着你的感官。你不假思索地伸手去抓你的[chest]");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，揉捏着你的胸部");
            if(get_player().lactationQ() > 50)
            {
               outputText("当乳汁");
               if(get_player().lactationQ() < 200)
               {
                  outputText("顺着你的手指滴落");
               }
               else if(get_player().lactationQ() < 500)
               {
                  outputText("毫无阻碍地喷射而出");
               }
               else
               {
                  outputText("像喷泉一样喷洒而出");
               }
            }
         }
         else
         {
            outputText("，捏着你的[nipples]");
         }
         outputText("。你弓起背，抓住[latexyname]的脚踝，把她拉向你。她因为下体受到的压力而呜咽，太敏感了，无法忍受你强迫她体验的一切。一声高亢的兴奋颤音划破空气。[latexyname]高潮了，听声音很激烈。滚烫的墨色分泌物溅在你的[clit]上，流进你的[vagina]里。");
         if(get_player().hasCock())
         {
            outputText("有些甚至溅到了你的[cocks]上，在你的男性象征上留下了紧绷的黑斑。");
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            outputText("她的" + gooCock() + "几乎从内部爆裂开来，膨胀着以容纳其骇人的乳胶分泌物。大部分溅在[latexyname]的皮肤上，像玛瑙水滴一样顺着她的肉体流下。");
         }
         outputText("[pg]当她的精华钻进你的体内时，你的[vagina]不由自主地收缩起来。你的阴唇将快感传递到你的脊椎，你爽得翻起了白眼，你把玩具的腿拉得更紧，把她油腻的小穴更紧地贴在你那涂满粘液的裂口上。两个乳胶小穴互相喷涌着滚烫的润滑液，闪闪发光。它们狂热地颤抖着，阴蒂僵硬勃起，快乐地分享着女性的极乐。有两个声音在尖叫，在不协调的和谐中向天空呼喊。较高的那个声音渐渐平息，变成满足的低吟，当你的小穴在高潮的余波中松弛下来时，你意识到第二个声音是你自己的。");
         outputText("[pg]你把你的[vagina]在[latexyname]的阴部又摩擦了几次，以品味高潮的余韵。她每次都发出咕哝声，嘴巴张成简单的“O”形。这位皮肤性感的女士甚至连尖叫都发不出来了。当你用完她时，她所能做的就是发出低沉而淫荡的呻吟。当你们慢慢开始分开时，空气中悬挂着一团黑色的网，闪烁着一层爱液。其中一些已经半凝固，随着你的抽出而断裂。其他的则散开，在分开时湿漉漉地拍打着每个小穴。");
         outputText("[pg]起身，你检查你的[vagina]。除了沉重和湿润之外，它还覆盖着一层坚固的乳胶。你毫不怀疑把它撕下来会很痛");
         if(get_player().hasPerk(PerkLib.Masochist))
         {
            outputText("，所以你这么做了，兴高采烈地把材料从皮肤上剥下来。当你带着受虐的快感折磨你的阴阜时，汁液从你的[vagina]中喷涌而出，剥离粘性物质，露出因疼痛而发红的皮肤。[latexyname]敬畏地抬头看着你，你打了个寒颤，拍了拍她的头。[say:好宠物。]");
         }
         else
         {
            outputText("。当然，你这里已经有一只宠物了，她是一个听话的小穴清洁工。你把你的[vagina]直接贴在她的脸上，命令道，[say:把它舔干净。]");
            outputText("[pg][Latexyname]热情地用舌头工作，在她的触摸下，墨色的物质融化了。分离的液体带着温暖冲刷着你，一滴一滴地消失在宠物的嘴里。她贪婪地吞噬着她的残留物，连同你高潮后分泌的大量润滑液，饥渴地吞噬着一切。她的舌头潜入你的体内，清理你的通道。她前后抽插，用舌头操你，为自己做了一顿饭，并在你自己的女性润滑液的波浪中带走了液体乳胶。[latexyname]似乎一心想解她那不自然的口渴，她继续刺激和吸吮，远远超过了你认为她该结束的时间。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,672) == 0)
            {
               outputText("[pg][Latexyname]不肯罢休。你命令她，[say:停下，我干净了！]她没有。你用一只[foot]推开她，当两英尺长的舌头从你被舌头撑开的阴道里抽出来时，你差点摔倒。她对着你喘气，然后又试了一次。你把她踢倒，这次用一条腿把她压住。[latexyname]的舌头伸了出来，但你用手抓住它，用另一只手把她的额头按下去。她呜咽着。你平静地告诉她，下次你要求清洁时，她最好听从命令停下来。");
               outputText("[pg][latexyname]眨着眼睛，把乌黑的眼泪挤掉，终于明白了。你放开她，站起身来，感到一阵新鲜的性奋。你的宠物显得很谦卑，但很满足。最棒的是，她在身下留下了一滩玛瑙色的阴道汁液，这是她在被束缚时刚刚排泄出来的。好女孩。");
            }
            else
            {
               outputText("[pg][latexyname]服从了，记住了上次的教训。当她缩回舌头时，两英尺长的舌头从你的[vagina]中抽了出来。她闪亮的脸顺从地低垂着，但你发誓你能看到她嘴角挂着一丝微笑。你告诉她她是个好宠物，一股新鲜的湿润从她的下体流出。");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,672,FlagDict_Impl_.arrayReadInt(_loc1_,672) + 1);
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         gooFluid(5 + get_player().wetness() * 2);
         gooObedience(5);
         gooHappiness(2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLatexySomeMilk() : void
      {
         clearOutput();
         outputText("你用双手托住你充满乳汁的乳房，问[latexyname]是否饿了。");
         if(gooFluid() >= 66)
         {
            outputText("她耸了耸肩，但在向你靠近时给了你一个微笑。[say:不饿，但如果你需要减轻负担……我就是你的女孩！]");
         }
         else if(gooFluid() >= 33)
         {
            outputText("她舔了舔嘴唇作为对你提议的回应，显然准备好品尝你美味的乳汁了。");
         }
         else
         {
            outputText("你甚至还没说完你的提议，[latexyname]就像飞蛾扑火一样扑向你，急切地拉扯你的衣服，试图释放你的乳头。");
         }
         outputText("[pg]你把[latexyname]带到附近的一块岩石上，然后把自己拉起来坐下。你的乳胶女孩微笑着蜷缩在你的腿上，她柔软光滑的手臂深情地搂着你的肩膀。你抽出一点时间梳理她长而光滑的头发，手指穿过光滑的发丝，同时另一只手脱下你的[armor]。最后，你脱下衣服，你充满乳汁的乳头从衣服里弹出来，[nipples]在冷空气中变硬。[latexyname]饥渴地张开嘴，但令你惊讶的是，她在喝之前把嘴唇贴在你的嘴唇上，把你锁在一个漫长而深情的吻中。你回报了她的感情，紧紧地抱着她，拥抱着饥渴的粘液，最后引导她的头低下，靠近你饥渴的[chest]。");
         outputText("[pg]当[latexyname]冰凉光滑的嘴唇擦过你坚挺的乳头时，你发出一声微弱的喘息，她的舌尖刚好擦过你敏感的肌肤。当她丰满的乌黑嘴唇终于锁住你的乳头时，你呻吟起来，她修长的手指握住你丰满的乳房，第一次小小的吸吮从你体内带出一滴乳汁，准确地落入[latexyname]等待的味蕾中。片刻之后，一股水流从你体内涌出，你的乳胶粘液的口技深深地挖掘了你的乳汁储备。你向后仰起头，色情地呻吟着，因为[latexyname]急切地吸吮着你，她的脸颊在每次吞咽之间微微鼓起，努力跟上她从你那里吸取的母乳洪流。");
         outputText("[pg][say:真好吃，][latexyname]笑着说，从你的一个乳头上弹开去照顾另一个，留下浓稠的黑色唾液痕迹连接着她的嘴唇和你的乳头，直到你用拇指刷掉它们，你的手指抚摸着她的下巴和脸颊。她用鼻子蹭着你的手，发出一种类似于呼噜声的声音，然后滑下来，用脸颊摩擦你的另一个乳房。[say:嗯，我喜欢这个味道，]她像个小女孩一样咯咯地笑着，把头靠在你的胸前休息了一会儿。[say:你真棒，[name]。太好了。]");
         outputText("[pg]你微笑着揉了揉[latexyname]的头发，轻轻地把她推向你另一个饥渴的乳房。她没有吸吮，而是在你的[nipple]尖端快速地吻了一下，让你感到一阵愉悦的颤栗。在你还没恢复过来之前，[latexyname]已经贴在你身上，她的双手紧紧地裹住你的乳房，她的舌头在你的乳头上轻弹，挑逗出你的第一滴乳汁。当她把你最初的几滴乳汁催促成一股温暖、美妙的乳汁流时，你把手指卷进[latexyname]的头发里，把她紧紧地拉向你，轻轻地拱起你的背，让她的脸完全埋在你充满乳汁的胸膛里。她在你的乳肉里咯咯地笑着，她的笑声让细小的乳汁流顺着她的下巴流到她自己巨大的胸膛上，白色涂抹在黑色上的对比吸引了你的目光，即使她乌黑的舌头在你的敏感花蕾周围盘旋。");
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[pg]当她吸吮时，[latexyname]的双手向下游走，她的手指诱人地刷过你柔软的肌肤，直到她光滑的指尖找到你的双重生殖器。一只手迅速裹住你半勃起的肉棒，另一只手插入你光滑而渴望的肉洞，两者都被你得到的挑逗和吸吮唤醒并准备好了。[latexyname]一致地移动她的双手，一只手拉到你[cock biggest]的冠部，另一只手深深地插入你的阴道深处，然后两者都释放，拉到根部或退回到尖端，然后一次又一次地继续。");
         }
         else if(get_player().hasCock())
         {
            outputText("[pg]当她吸吮时，[latexyname]的手向下游走，她的手指诱人地刷过你柔软的肌肤，直到她光滑的指尖摩擦着你[cock biggest]半硬的肉棒。当乳胶女孩把手指裹住你的肉棒时，你忍住了一声喘息，只需要最轻微的触摸就能让你变得坚挺。她以缓慢、慵懒的动作移动她的手，慢慢地将她异常光滑的手在你的肉棒上下拉动，从冠部到根部，配合着她吸吮你的乳头，轻轻地扭动和挤压。");
         }
         else if(get_player().hasVagina())
         {
            outputText("[pg]当她吸吮时，[latexyname]的手向下游走，她的手指诱人地刷过你柔软的肌肤，直到她光滑的指尖摩擦着你[vagina]的外褶皱。当她修长的手指滑入你准备好的洞里时，你才勉强忍住了一声喘息，已经兴奋并渴望做爱。她的手进入你体内，感觉就像一个异常灵活的假阳具，当她把几英寸的乳胶推入你体内时，每一次抽插都配合着吸吮你的乳头。");
         }
         else
         {
            outputText("[pg]当她吸吮时，[latexyname]的双手向下游走，她的手指诱人地刷过你柔软的肌肤，直到她光滑的指尖让你脊背发凉，当她把手指伸进你的[butt]时，她的指关节划过你暴露的[asshole]。由于没有其他生殖器可供选择，当[latexyname]将一根光滑的手指滑入你的直肠，以极其缓慢的速度推入你的屁股时，你咬紧牙关，微小的抽插配合着她吸吮你的乳头。");
         }
         outputText("[pg]在乳胶女孩结合了挤奶和性挑逗的攻势下，你感觉到高潮在你的肠道深处升起。你强迫自己，试图再坚持一会儿，因为[latexyname]加强了她的攻势，吸吮着你的每一滴乳汁，同时她的手指在你的");
         if(get_player().get_gender() == 3)
         {
            outputText("双重生殖器");
         }
         else if(get_player().hasCock())
         {
            outputText("肉棒");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("屁眼");
         }
         outputText("上创造奇迹。你没坚持多久，很快就向后仰起头，射了，");
         if(get_player().get_gender() > 0)
         {
            outputText("将她的手指涂满你喷射而出的精液");
         }
         else
         {
            outputText("当她的手指从后面挤压你时，你的[ass]紧紧夹住");
         }
         outputText("。突然，你的乳头从她嘴里弹了出来，一道乳汁依然在喷射，直到[latexyname]被你白色的高潮祭品涂满，她像个小女孩一样笑着，舔着手指，把自己的乳房送到嘴边，试图舔掉溅在上面的乳汁。");
         outputText("[pg][say:真美味！]她微笑着说，在你的嘴唇上印下长长的一吻。你回以微笑，把她拉近，让她的脸埋进你现在变轻了的胸膛里，休息了短短几分钟。");
         if(get_player().hasPerk(PerkLib.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
         get_player().boostLactation(0.5);
         gooHappiness(5);
         gooObedience(3);
         var _loc1_:int = 15;
         if(get_player().lactationQ() >= 200)
         {
            _loc1_ += 10;
         }
         if(get_player().lactationQ() >= 500)
         {
            _loc1_ += 10;
         }
         if(get_player().lactationQ() >= 1000)
         {
            _loc1_ += 10;
         }
         if(get_player().lactationQ() >= 2000)
         {
            _loc1_ += 10;
         }
         if(get_player().lactationQ() >= 4000)
         {
            _loc1_ += 10;
         }
         if(get_player().lactationQ() >= 8000)
         {
            _loc1_ += 10;
         }
         gooFluid(_loc1_);
         get_player().changeFatigue(5);
         get_player().orgasm("Tits");
         dynStats(DynStat.Sens(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLatexyGirlCumIndirectly() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,670) == 0)
         {
            outputText("你在你的乳胶宠物的区域扔了一个木碗在地上。她对这个举动感到非常困惑，戳了戳它问道，[say:这是干什么用的？][pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,670,1);
         }
         outputText("低头看着[latexyname]，你告诉她该吃饭了。她抬起头，眼神中充满了渴望");
         if(gooObedience() < 70)
         {
            outputText("并毫不羞耻地伸手去抓你的[armor]。你拍开她的手，强迫她贪婪的乳胶小手和她身体的其他部分一起乖乖等着");
         }
         else
         {
            outputText("，摇着舌头乖乖地等着。");
         }
         if(gooFluid() < 33)
         {
            outputText("她眼中的饥渴如此强烈，你甚至担心她的目光会直接钻进你的[vagina]里。");
         }
         else if(gooFluid() < 66)
         {
            outputText("她眼中的饥渴几乎触手可及，你担心这会促使她做出鲁莽的举动。");
         }
         else if(gooFluid() < 90)
         {
            outputText("她眼中的饥渴显得有些慵懒。看起来没那么强烈，但她总是乐意多喝一点。");
         }
         else
         {
            outputText("她眼中的饥渴是一种颓废而贪婪的欲望，新鲜精液的诱惑勉强能将其唤醒。这依然让她伸出舌头舔了舔闪亮的嘴唇。");
         }
         outputText("[pg]你扭动着脱下下装，微微向后靠，张开[legs]，将[vagina]对准食盆的正上方。没有停顿，你的手指滑入那个甜美的洞穴，带着崇敬的动作抚摸着你的阴唇，在女性的祭坛上取代了它们的位置。你张得更开，好让手指进入。你颤抖着，任由自己享受着自我抚慰的快感，甚至用拇指轻柔地打圈摩擦着你的[clit]。");
         if(get_player().getClitLength() >= 3.5)
         {
            outputText("很快，它就骄傲地挺立起来，一根闪闪发光的女性肉柱，在每一阵微风的吹拂下都会感到一阵酥麻。");
         }
         outputText("[pg]被这诱人的景象所迷住，你的乳胶宠物忍不住模仿起你的动作。她那橡胶般的指尖一个接一个地从视线中消失，深深地埋入下方那漆黑的裂缝中。唯一可见的只有她拇指的指尖，正隔着手掌周围渗出的浓稠乌黑润滑液，淫荡地在她的阴蒂上打圈。她那" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛从黑色的眼睑下恳求地仰视着你，她的嘴无声地乞求着你的淫液。高潮席卷了她敏感的身体，这个活生生的恋物癖玩物在高潮中颤抖着。当她高潮时，液态乳胶从她的手腕周围喷涌而出。");
         outputText("[pg]你呻吟着，同样被她为你展现的景象所迷住。很快，你");
         if(get_player().wetness() < 3)
         {
            outputText("就被你少女的淫液完全浸透了");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("肆意地滴下成串的少女淫液");
         }
         else
         {
            outputText("简直是在把少女的淫液喷涌进碗里");
         }
         outputText("。你本能地向前摇晃你的[hips]，随着一种本能的、动物般的节奏缓慢地抽动着。[latexyname]全神贯注地看着，依然在用手指无情地操弄着自己。她满怀期待地看着，聚精会神地等待着你高潮的第一个迹象。");
         outputText("[pg]为了不让那双渴望的眼睛失望，你高潮了。一道强烈的电流在你的[clit]中炸开。");
         if(get_player().getClitLength() >= 3.5)
         {
            outputText("你下意识地用手握住它，飞快地抚摸着那根光滑的女性肉棒，让你的脑海被一片空白的无脑快感所淹没。");
         }
         outputText("越来越高涨，一股液体的狂喜从你身体的核心升起。它攀升至顶峰，然后冲出你的产道，随之引发了肌肉收缩的地震。那些剧烈的紧缩像老虎钳一样夹紧你的手指，直到一股淫液冲刷而出迎接它们时才放松下来。你在高潮的愉悦中几乎要跌倒，但还是紧紧端着碗，在它被装满时差点洒出来。");
         if(get_player().wetness() < 3)
         {
            outputText("你滴水的阴户在碗上涂抹了一层薄薄的女性精液，随着你的滴落和扭动，慢慢地将它填满。");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("你那湿得离谱的小穴将浓稠的女性精液渗入碗中，迅速用你高潮的证明将其填满。");
         }
         else
         {
            outputText("你喷涌的阴户将一股耀眼的女性精液喷入碗中，瞬间就溢出了边缘。随着你快感的延续，它很好地用你高潮的证明弄脏了地面。");
         }
         outputText("[pg][latexyname]兴致勃勃地扑向碗，贪婪地吞噬着每一滴。她的舌头伸出来，在抛光的木头上拍打着，越来越多的乳胶嘴部肌肉伸出来帮助进食。几秒钟内，碗就被清空了。");
         if(get_player().wetness() >= 4)
         {
            outputText("遗憾的是，弄脏地面的大量阴道润滑液已经被吸收了。看来泥土吃得比你的宠物还快。");
         }
         var _loc1_:int = 10;
         if(get_player().wetness() >= 3)
         {
            _loc1_ += 5;
         }
         if(get_player().wetness() >= 4)
         {
            _loc1_ += 5;
         }
         if(get_player().wetness() >= 5)
         {
            _loc1_ += 5;
         }
         get_player().orgasm("Vaginal");
         gooFluid(_loc1_);
         gooHappiness(4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLatexyGirlCumDirect() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你轻轻地脱下你的[armor]，慵懒地伸了个懒腰，漫不经心地提到喂食时间到了。");
         if(get_player().hasCock())
         {
            outputText("当[latexyname]瞥向你的[cocks]时，你啧啧两声，然后");
            if(get_player().balls > 0)
            {
               outputText("托起你的[balls]");
            }
            else
            {
               outputText("改变姿势");
            }
            outputText("以展示你的[vagina]。");
         }
         else
         {
            outputText("当[latexyname]向下看时，你扭动身姿，更好地展示你的[vagina]。");
         }
         if(gooFluid() < 33)
         {
            outputText("[pg]一阵咕噜声让[latexyname]紧绷的肚子颤抖起来。她抬起一只手捂住她那没有特征的肚子，向前倾身时给了你一个紧张的笑容。[saystart]你怎么知道我这么饿");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("？[sayend]");
         }
         else if(gooFluid() < 66)
         {
            outputText("[pg]一抹得意的笑容在[latexyname]的脸上蔓延开来。她舔了舔嘴唇，向前倾身，说道，[saystart]嗯……我想吃点零食");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("。[sayend]");
         }
         else
         {
            outputText("[pg]一个慵懒的笑容在[latexyname]的脸上显露出来。她咯咯地笑着，丰满的身体随着她的动作而晃动，仿佛充满了液体的重量。这个乳胶女人评论道，[say: 嗯……我已经很饱了。] 她舔了舔嘴唇，用贪婪的呼噜声继续说道，[saystart]不过你随时可以喂我更多");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("。[sayend]");
         }
         outputText("[pg]你自信地走上前，停在你的乳胶宠物面前。她立刻跪下，把鼻子放在离你的外阴只有几英寸的地方。她那双" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛兴奋地锁定在");
         if(get_player().wetness() >= 3)
         {
            outputText("闪闪发光的");
         }
         outputText("外阴唇上，当她靠近时，瞳孔微微放大。[latexyname]的鼻孔张开，深深地呼吸着你的气味，大口吸入你女性的体味，那是发情女人的醉人麝香。她的嘴微微张开，仿佛对她所看到的东西感到敬畏，在没有意识引导的情况下，她慵懒地靠得更近了。");
         outputText("[pg]当她的鼻子不经意间撞上你的阴唇时，一阵下流的快感顺着你的脊椎蔓延开来。[latexyname]微微颤抖了一下，从对你小穴的痴迷中清醒过来，因为她的鼻子上沾满了滚烫的湿润。她抬头看着你，脸上泛起一丝紫色的红晕，犹豫地伸长脖子，让嘴唇接触到你的阴唇。起初，她在你外阴的边缘亲吻和舔舐，用她墨汁般的唾液涂抹在表面。这滑腻的液体一接触空气就变稠了，即使她潜入你的[vagina]更深处，用她那奇特的舌头慢慢撑开你的内阴唇。");
         outputText("[pg][Latexyname]很快就沉浸在自己巧妙的服侍中，她的世界缩小到了你[hips]和[legs]交界处那滚烫的裂缝。她的舌头如蛇一般滑出，钻进你的[vagina]。它的长度和它一样滑腻、闪亮、光滑，毫不费力地滑过你的大门。[latexyname]熟练地在你的体内扭动它，将更多她那黑色的唾液挤进你的通道，她那润滑的肌肉在你的体内蠕动，用力按压每一个娇嫩的部位。它是如此光滑，如果不是它如此令人愉悦地推挤着你，你几乎感觉不到它。事实上，一条滑腻的蛇正在你的小穴里蠕动，点燃了你的下半身。");
         if(get_player().wetness() < 3)
         {
            outputText("当你的宠物取悦你时，淅淅沥沥的湿润顺着她的下巴流下。她急切地吞咽着大部分液体，很高兴能有这样一个……湿润的[master]。");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("当你的宠物取悦你时，湿润的水滴拍打在她的下巴上。她急切地吞咽着大部分液体，很高兴在主菜之前能有一道开胃菜。");
         }
         else
         {
            outputText("当你的宠物取悦你时，润滑液在她光滑的下巴上闪闪发光。她时不时地急切吞咽，品尝着你的味道。");
         }
         outputText("[pg]饥渴的乳胶女向后退去，抬头对你微笑，尽管她的嘴被那条悬在半空中的舌头堵住了，那条舌头仍然通过她起伏的口腔附件锁在你的小穴上。她长长的睫毛无辜地眨着，而那强有力的口腔肌肉则在按摩你阴道的内壁。被这感官的冲击和伴随而来的无辜面容所吸引，你抓住[latexyname]的脸，把它塞进你的小穴，用力把她的嘴压在你的下体上，发出清晰的吧唧声。[latexyname]的眼角愉快地皱了起来。即使你正在操她的嘴，把她当成活生生的乳胶性玩具，她仍然迎着你的目光。");
         outputText("[pg]你紧紧抓住这个想法，就像抓住你奴隶的头一样，你咄咄逼人地在她身上摩擦，让狂喜的快感模糊了你的思维过程，直到它达到顶峰。她扭动着，用力向上压着舌头，挤压着一个极其敏感的部位。随之而来的天堂般放纵的爆炸在你的大脑中回荡，使你的运动控制短路。你的四肢自由地挥舞着，尽管你的手指和手臂仍然锁在[latexyname]身上，把她紧紧地压在你的裂缝里。");
         if(get_player().wetness() >= 4)
         {
            outputText("你将一条喷涌的汁液小河直接射进她的嘴里，她的脸颊被大量涌出的润滑液淹没。");
         }
         else
         {
            outputText("你逐渐用你自由流淌的高潮润滑液填满她的嘴。");
         }
         outputText("当你的[vagina]紧紧闭合时，她的舌头被挤压得很紧，在口腔肌肉周围痉挛，就好像它是一根可以挤奶的阴茎。当你忍受着释放的浪潮时，你的[legs]锁紧了。");
         outputText("[pg]快感并没有很快消退。事实上，折磨你肌肉的余震继续随着你宠物急切嘴唇的每一次亲吻而袭击你。高潮过后，她并没有放慢速度或停止。如果说有什么不同的话，那就是她更加用力地吸吮你的下唇和[clit]，贪婪地想要更多你美味的汁液。你扭动着身体，把手放在[latexyname]的额头上，命令她停下来。");
         if(gooObedience() >= 60)
         {
            outputText("[pg]听到你的命令，一声呜咽滚过你的[vagina]，但她那光滑的舌头在你体内起伏的快感逐渐消退。你的[clit]从囚禁的褶皱中挣脱出来，伴随着一层墨汁般的唾液和女性精液。[latexyname]大口喘着粗气，好像她一直憋着气，就你所知，她可能确实如此。无论如何，她饥渴地喵喵叫着，舔舐着你小穴里黏糊糊的液体来清理它。再次，这种感觉太好了，几乎耗尽了你的力量，但你紧紧抓住，直到她舔完润滑液和唾液，让你的入口完全干净。");
            if(gooHappiness() >= 66)
            {
               outputText("[pg][say: 谢谢你的款待，[Master]，] [latexyname]娇嗔道，[say: 像我这样的宠物只需要你允许的东西，不是吗，[Master]？]");
            }
            else if(gooHappiness() >= 33)
            {
               outputText("[pg][say: 谢谢你的款待，我想，] [latexyname]嘟囔着，[say: 我想你不会让你的宠物过度放纵，对吧？]");
            }
            else
            {
               outputText("[pg][say: 真的吗？就这样？] [latexyname]抱怨道，[say: 我还以为你喜欢呢，但我猜你更关心服从而不是我的快乐，对吧，[Master]？]");
            }
            outputText("[pg]你站起身，给了你的乳胶奴隶一个心领神会的点头。她的小穴");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
            {
               outputText("和" + gooCock() + "飞溅出");
            }
            else
            {
               outputText("飞溅出");
            }
            outputText("油腻的液体，滴落在地，她因顺从的快感而颤抖。你拍了拍她的头，表扬她做得好，然后离开，对她的服从感到放心。");
            _loc1_ = 10;
            if(get_player().wetness() >= 3)
            {
               _loc1_ += 5;
            }
            if(get_player().wetness() >= 4)
            {
               _loc1_ += 5;
            }
            if(get_player().wetness() >= 5)
            {
               _loc1_ += 5;
            }
            gooFluid(_loc1_);
            gooObedience(4);
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(-2));
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]听到你的命令，你的宠物更加卖力了。她那光滑的黑色小口紧紧吸住你的[clit]，同时感觉有一英尺厚的舌头在你体内翻腾。高潮后你非常敏感，根本无法忍受如此猛烈的刺激。你的[legs]无力地抽搐着，失去了力量，你瘫倒在一块巨石上，粗糙的石头减缓了你滑向地面的速度。[latexyname]的嘴依然紧紧锁住你的[vagina]，像真空一样吸附着。你甚至能感觉到你的外阴在吸力下肿胀变大。你的阴唇变得更热、更敏感，丰满而厚实。");
            menu();
            addButton(0,"让她继续",letLatexGooDrainCuntDry);
            addButton(1,"尝试主导",assertControlOverCuntDrainingLatexGoo);
         }
      }
      
      public function feedLatexyCumIndirectly() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,670) == 0)
         {
            outputText("你在你的乳胶宠物的区域扔了一个木碗在地上。她对这个举动感到非常困惑，戳了戳它问道，[say:这是干什么用的？][pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,670,1);
         }
         outputText("低头看着[latexyname]，你告诉她该吃饭了。她抬起头，眼神中充满了渴望");
         if(gooObedience() < 70)
         {
            outputText("并毫不羞耻地伸手去抓你的[armor]。你拍开她的手，强迫她贪婪的乳胶小手和她身体的其他部分一起乖乖等着");
         }
         else
         {
            outputText("，摇着舌头乖乖地等着。");
         }
         if(gooFluid() < 33)
         {
            outputText("她眼中的饥渴如此强烈，你甚至担心她的目光会直接钻进你的");
            if(get_player().balls == 0)
            {
               outputText("身体");
            }
            else
            {
               outputText("阴囊");
            }
            outputText("。");
         }
         else if(gooFluid() < 66)
         {
            outputText("她眼中的饥渴几乎触手可及，你担心这会促使她做出鲁莽的举动。");
         }
         else if(gooFluid() < 90)
         {
            outputText("她眼中的饥渴显得有些慵懒。看起来没那么强烈，但她总是乐意多喝一点。");
         }
         else
         {
            outputText("她眼中的饥渴是一种颓废而贪婪的欲望，新鲜精液的诱惑勉强能将其唤醒。这依然让她伸出舌头舔了舔闪亮的嘴唇。");
         }
         outputText("[pg][EachCock]从束缚装备中释放出来后，立刻就硬了起来，已经相当肿胀。你试探性地套弄了");
         if(get_player().cockTotal() > 1)
         {
            outputText("一根");
         }
         else
         {
            outputText("它");
         }
         outputText("，几下快速的撸动就让它完全勃起。[latexyname]只能全神贯注地看着这淫荡的画面，一只手紧张地抚摸着大腿，另一只手把玩着头发。她心甘情愿地等待着，似乎明白你只是来给她提供食物的。但这并没有让她更容易克制自己的欲望。");
         outputText("[pg]随着你快速自慰，[latexyname]的手滑进了她那油滑的通道。她的两根手指被柔软的肉缝吞没，浸泡在黑色的湿润中。接着，第三根手指也加入了进来，探进去按摩着里面光滑敏感的肉壁。气喘吁吁的乳胶女人轻松地用第四根手指将肉缝撑开，向你展示那乌黑的内部，为你自慰的狂热添柴加火。她的拇指擦过阴蒂，开始对着你摇晃臀部，淫荡地挺动着，同时流下了一股股乌黑的蜜液。");
         outputText("[pg]你呻吟着，同样被她为你展现的景象所迷住。很快，你");
         if(get_player().cumQ() < 250)
         {
            outputText("渗出了比平时更浓稠的先列腺液");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("滴落了比平时更多的先列腺液");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("滴落着先列腺液");
         }
         else
         {
            outputText("渗出了一条先列腺液的小河");
         }
         outputText("。你[cockHead]周围敏感的皮肤是快速抚摸的完美素材，让你在强烈的快感中脊背发麻。你再次套弄，在触电般的极致快感中颤抖，不由自主地摆动着臀部。[latexyname]正满怀期待地注视着，等待你射精的第一个迹象。");
         outputText("[pg]为了不让那双渴望的眼睛失望，你射了。在你体内膨胀的滚烫洪流力量倍增，然后爆发。你弓起背，向前挺动，在喷射前勉强记得将[cocks]对准碗。精液从");
         if(get_player().cockTotal() > 1)
         {
            outputText("所有的");
         }
         outputText("你的龟头");
         if(get_player().cockTotal() > 1)
         {
            outputText("同时");
         }
         outputText("喷涌而出，化作浓稠的白色绳索如雨般落入碗中。");
         if(get_player().cumQ() >= 500)
         {
            outputText("没过多久，你就把它装满了，所以你只好把剩下的喷洒在你那橡胶般的战利品上。长长的、粘稠的、滑溜溜的繁殖液体如雨般落在她炭黑色的鬃毛上，把它染成了一团灰色的拖把。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("尽管如此，你还是无情地套弄着自己，一次又一次地射精，直到地面再也承受不住，在下面形成了一个水坑。");
         }
         if(get_player().cumQ() >= 4000)
         {
            outputText("那个水坑迅速填满，变成了一个一英尺深的精液湖，一个由你自己充满活力的精液组成的泥泞沼泽。");
         }
         outputText("[pg][latexyname]兴致勃勃地扑向木碗，贪婪地吞噬着每一滴精液。她的舌头伸在外面，在抛光的木头上拍打着，越来越多的乳胶嘴部肌肉伸展出来帮助进食。几秒钟内，碗就被清空了");
         if(get_player().cumQ() >= 500)
         {
            outputText("，然后她转而清理自己");
         }
         outputText("。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("遗憾的是，积聚起来的大量精液已经被干燥的地面吞噬了。看来泥土喝得比你的乳胶奴隶还快。");
         }
         var _loc1_:int = 20;
         if(get_player().cumQ() >= 500)
         {
            _loc1_ += 10;
         }
         gooFluid(_loc1_);
         gooHappiness(4);
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLatexyCumDirectly() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("解开你的[armor]，你让[eachCock]自由地垂下。[latexyname]立刻低头看去，" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛紧紧锁定在[oneCock]上，全神贯注地看着它随着不断上升的欲望而变硬。你把它拿在手里掂量它的重量。你解释说这是她的食物，并给了它一个鼓励性的摇晃。毕竟，如果你不喂你的黏液女孩，你算什么主人？");
         if(gooFluid() < 33)
         {
            outputText("一阵咕噜声让[latexyname]紧绷的肚子颤抖起来。她抬起一只手捂住自己没有特征的肚子，身体前倾时给了你一个紧张的笑容。[saystart]你怎么知道我这么饿");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("？[sayend]");
         }
         else if(gooFluid() < 66)
         {
            outputText("一抹得意的笑容在[latexyname]的脸上蔓延开来。她舔了舔嘴唇，身体前倾，说道，[saystart]嗯……我想吃点零食");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("。[sayend]");
         }
         else
         {
            outputText("[latexyname]的脸上浮现出慵懒的笑容。她咯咯地笑着，丰满的身体随着她的动作而晃动，液态的重量感十足。这位乳胶女郎评论道，[say: 嗯……我吃得很饱了。]她舔了舔嘴唇，继续用贪婪的呼噜声说道，[saystart]不过你随时可以喂我更多");
            if(gooObedience() > 50)
            {
               outputText("，[Master]");
            }
            outputText("。[sayend]");
         }
         if(gooFluid() > 50)
         {
            outputText("丰满的");
         }
         else
         {
            outputText("O");
         }
         outputText("玛瑙色的嘴唇慵懒地撅起，仿佛有自己的意志般慢慢张开，它们的主人凑近你，吸入你的气味。她光滑的鼻孔在嗅你的[cock biggest]时微微张开，品味着她这顿大餐的气味。慢慢地，她被吸引到她的食物前，最终将那紧缩的孔洞紧紧贴在你的[cockHead biggest]上。");
         outputText("[pg][Latexyname]很懂事地抬起头，对你眨了眨眼。然后，她露出了她的舌头——一条似乎无穷无尽的乌黑凸起。一个愉悦的笑容在[latexyname]乌黑的嘴上蔓延开来，她那沾满口水的舌头紧紧地缠绕住[eachCock]。满足之后，她向下拉伸下巴，以便完全张开嘴。撅起的嘴唇变成了一个膨胀的“o”形，并向前推进，带着不懈的决心顺着你的[cock biggest]向下移动，欢快地吞噬着你的勃起。");
         if(get_player().biggestCockArea() > 80)
         {
            outputText("她的喉咙被拉伸得如此之紧，看起来更像是一个墨色的避孕套。每一根血管，每一处长度的变化都完美地呈现出来——直到它消失在她的胸口。");
         }
         else
         {
            outputText("她的身体没有呕吐反射，轻松地吞下了你。");
         }
         outputText("[pg]随着[oneCock]深深埋入你的宠物[sheath]深处，你忍不住呻吟起来。片刻之后，你意识到，当她把你拉进去时，她的舌头就解开了，因为你能感觉到乳胶女郎喉咙里湿润、跳动的肉壁在按摩你的长度，用只有黏液女孩才能提供的半固体压力一丝不苟地刺激着你。她的内脏感觉就像凝胶状的波浪在你身上翻滚，既温暖又黏糊糊的。[latexyname]温柔地挤奶你的[cock biggest]，挤出几股先列腺液进入她的肚子。退后时，她从你的[cockHead biggest]挤出一团精液，她油腻的舌头紧贴着你工具的底部，直到它被暴露在冷空气中。");
         outputText("[pg]你整个男性特征都被慢慢凝固的黑色所包围，这是一种液态乳胶，让你看起来像戴着一个墨色的、漏水的避孕套。它的紧绷感在你周围紧紧包裹时让你感到刺痛。这种感觉以一种不同寻常的方式让人感觉很好，但你想要更多！你抓住[latexyname]的头，向前猛冲，将自己深深地插回那个黑色的肉洞里，让她核心的液态乳胶紧紧拥抱你。她发出一声沉闷的惊讶咕噜声，但她的表情很快就变成了满足。在汹涌的性欲驱使下，你把她光滑的头发抓在手里，拉着她的头发把她往后拉，来回拉扯。你在操她的脸，而她很喜欢！");
         outputText("[pg][latexyname]叹了口气，发出一种几乎低于你听力范围的咕噜声，但它确实存在。她的眼睛与你相遇，充满饥渴和恳求。它们用性感的、长睫毛的眨眼乞求你，恳求你射精。她的舌头用淫荡的舔舐为你口交你的[cock biggest]，进一步激起你的激情，在你猛烈撞击她的脸时崇拜你。对于一个普通的女人，甚至是一个恶魔来说，这可能会让人感到不舒服，但对她来说，这只是另一次口交。她体内半固体的表面突然紧紧闭合，将你僵硬的阴茎紧紧包裹在喷涌的丝绒中。与此同时，她开始在她体内低沉地哼唱，当她开始吸吮时，那些多汁的肉垫在你的鸡巴周围振动。");
         outputText("[pg]丝般光滑的手指深深陷入你的[butt]中，与紧紧抓住她头部的那些手指如出一辙。她的双手又拉又拽，在充满射精快感的淫荡亲吻中，将下体与嘴唇紧紧贴合。你的身体变得僵硬，你的双手拉得更紧，随着高潮的到来，你开始颤抖。她喉咙里跳动的温暖似乎蔓延到了你的腹部，在那里翻腾冒泡，然后在一阵黏糊糊的快感爆炸中喷涌而出。一波又一波的精液射入你宠物黏糊糊的体内，让她停止了哼唱，并让她湿滑的肉壁随着你的抽搐挤压你，将你的[cock biggest]榨干。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你剩下的");
            if(get_player().cockTotal() == 2)
            {
               outputText("鸡巴徒劳地涂抹");
            }
            else
            {
               outputText("鸡巴徒劳地涂抹");
            }
            outputText("她的" + gooTits() + "上覆盖着一层白色的光泽，在一种颓废的男子气概展示中浪费了它们的水分。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("你把她的内脏射得满满的，以至于随着每一次新鲜的精液泵入，她的肚子都会膨胀和晃动。");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("她的肚子越来越圆，直到中间部分像气球一样，被撑得紧绷绷的，因为下面全是白色的精液，甚至透出灰白色的光泽。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("然而，当你的高潮逐渐平息时，她已经开始代谢它了，将她那被精液撑得鼓鼓的肚子转化为她身体其他部位更加柔软、紧致的曲线。");
         }
         outputText("[pg]你感到完全被掏空了，无力地靠在一块巨石上。支撑你的石头的粗糙质感让你保持直立，但你的[legs]几乎没有力气了。[Latexyname]还在下面，还在吸吮和舔舐，用温柔的舔舐探索你精管的娇嫩入口，同时从你身上挤出最后几滴精液。在高潮之后这么快，这种感觉实在太好了。你扭动着身体，把手放在[latexyname]的额头上，命令她停下来。");
         if(gooObedience() >= 60)
         {
            outputText("[pg]听到你的命令，你的[cock biggest]上发出一声呜咽，但包围着它的吸吮热度退去了，连同她那光泽的嘴唇提供的多汁的环一起滑落。你的[cockHead biggest]从囚禁它的褶皱中弹了出来，拖着光泽的黑色唾液。[latexyname]喘着粗气，好像她一直憋着气，就你所知，她可能真的憋着气。不管怎样，她饥渴地喵喵叫着，舔掉你阴茎上粘稠的液体，把它清理干净。这感觉又一次好到几乎耗尽了你的力气，但你紧紧抓住，直到她把乳胶完全融化，让你的阴茎变得干干净净。");
            if(gooHappiness() >= 66)
            {
               outputText("[pg][say: 谢谢你的款待，[Master]，] [latexyname]娇嗔道，[say: 像我这样的宠物只需要你允许的东西，不是吗，[Master]？]");
            }
            else if(gooHappiness() >= 33)
            {
               outputText("[pg][say: 谢谢你的款待，我想，] [latexyname]嘟囔着，[say: 我想你不会让你的宠物过度放纵，对吧？]");
            }
            else
            {
               outputText("[pg][say: 真的吗？就这样？] [latexyname] 抱怨道，[say: 我还以为你喜欢呢，但我猜你更关心服从而不是我的快乐，是吧，[Master]？]");
            }
            outputText("[pg]你站起身，给了你的乳胶奴隶一个心领神会的点头。她的小穴");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
            {
               outputText("和" + gooCock() + "飞溅出");
            }
            else
            {
               outputText("飞溅出");
            }
            outputText("油腻的液体，滴落在地，她因顺从的快感而颤抖。你拍了拍她的头，表扬她做得好，然后离开，对她的服从感到放心。");
            _loc1_ = 20;
            if(get_player().cumQ() >= 500)
            {
               _loc1_ += 5;
            }
            gooFluid(_loc1_);
            gooObedience(5);
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(-2));
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]听到你的命令，她的吸吮加倍了。那吸吮的热度让你的[cock biggest]在她体内变得更大，用嘈杂的感觉轰炸着你，让你对身体的控制像微风中的树叶一样散开。你发出一声压抑的呜咽，顺着石头滑下来，轻轻地落在你的[butt]上，落在你那叛逆的宠物性感的身体前。她的嘴唇像真空一样紧紧锁住你的腹股沟，伴随着湿润、饥渴的吧唧声上下抽动。你弓起背迎合她的服侍，翻着白眼。当来自你[cock biggest]的快感如此强烈，以至于让之前的高潮显得毫无价值时，还有什么必要去看呢。");
            menu();
            addButton(0,"随她去",maleDirectFeedLatexGooGoneWrong);
            addButton(1,"尝试强硬",tryToAssertMaleDomWhileLatexGooDrains);
         }
      }
      
      public function feedLatexy() : void
      {
         var nice1:Boolean;
         var _g1:LatexGirl;
         var nice:Boolean;
         var _g:LatexGirl;
         clearOutput();
         outputText("你要怎么喂她？");
         if(get_player().get_lust() < 33 && get_player().get_gender() > 0)
         {
            outputText("你还没有兴奋到可以尝试喂她任何性液体的程度。");
         }
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"间接射精",feedLatexyCumIndirectly).disableIf(get_player().get_lust() < 33,"你还没有兴奋到可以做爱。");
            addButton(1,"直接射精",feedLatexyCumDirectly).disableIf(get_player().get_lust() < 33,"你还没有兴奋到可以做爱。");
         }
         if(get_player().hasVagina())
         {
            addNextButton("间接潮吹",feedLatexyGirlCumIndirectly).disableIf(get_player().get_lust() < 33,"你还没有兴奋到可以做爱。");
            addNextButton("直接潮吹",feedLatexyGirlCumDirect).disableIf(get_player().get_lust() < 33,"你还不够兴奋，无法做爱。");
         }
         if(gooHappiness() >= 50 && get_player().lactationQ() >= 100 && get_player().biggestTitSize() >= 3)
         {
            addNextButton("喂奶",feedLatexySomeMilk);
         }
         if(get_player().hasItem(get_consumables().MINOCUM))
         {
            _g = this;
            nice = true;
            addNextButton("牛精(温和)",function():void
            {
               _g.minotaurCumFeedingGoo(nice);
            });
         }
         if(get_player().hasItem(get_consumables().MINOCUM))
         {
            _g1 = this;
            nice1 = false;
            addNextButton("牛精(粗暴)",function():void
            {
               _g1.minotaurCumFeedingGoo(nice1);
            });
         }
         addButton(14,"返回",approachLatexy);
      }
      
      public function feedCumDirectEpilogueGirls() : void
      {
         clearOutput();
         outputText("你醒来时口干舌燥，感觉嘴里像砂纸一样。环顾四周，你看到[latexyname]在角落里沉睡，看起来相当……饱满丰饶，胖乎乎的。你感到同样令人讨厌的空虚。你的腹股沟因为强力的吮吸而隐隐作痛。你踉踉跄跄地走去喝水，意识到如果你想让她听从命令停下来，你必须提高她的服从度。让她喝得那么深可能也无济于事。");
         gooFluid(50 + get_player().wetness() * 8);
         gooHappiness(4);
         gooObedience(-4);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function feedCumDirectEpilogue() : void
      {
         clearOutput();
         outputText("你醒来时，嘴里干得像砂纸一样。环顾四周，你看到[latexyname]在角落里沉睡，看起来相当……饱满和丰腴，体重增加了不少。你感到同样、令人讨厌的空虚。你的腹股沟因为被强行榨干而隐隐作痛。你跌跌撞撞地走向有水的地方，意识到如果你想让她听从命令停下来，你就必须提高她的服从度。让她喝得这么深可能也无济于事。");
         var _loc1_:int = 50;
         if(get_player().cumQ() >= 500)
         {
            _loc1_ += 30;
         }
         gooFluid(_loc1_);
         gooHappiness(5);
         gooObedience(-4);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function encounterLeftBehindGooSlaveII() : void
      {
         clearOutput();
         outputText("[say:你想叫我什么就叫什么吧，我的名字不重要。]");
         outputText("[pg]你要给她起什么名字？");
         menu();
         addButton(0,"继续",nameZeLatexGoo);
         genericNamePrompt();
      }
      
      public function encounterLeftBehindGooSlave() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_latexgoogirl());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,655) > 0)
         {
            outputText("在探索时，你看到湖里有些奇怪的东西。那是一团黑色的黏液，在蔚蓝的波浪中几乎看不见，但它似乎在疯狂地拍打水面，像是在挣扎。你走到湖边，正好看到那团黑色的黏液软绵绵地瘫倒在沙滩上，大口喘气。是那个可怜的被变成乳胶的黏液女孩！");
            outputText("[pg][say: 是……你……]她呻吟着，用睁大的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛看着你，然后闭上了……看来她晕倒了。她看起来几乎像个外星人……比以前更像了，以前她只是一团有胸部和假发的水状黏液。现在，她身体的每一个切面都是闪亮、反光的乳胶。甚至她自由滴落的阴道分泌物也是液体乳胶，黑亮多汁，一旦离开身体就会慢慢硬化成柔韧的固体。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你不禁想知道，让她用她的汁液包裹你的[cocks]会是什么感觉。");
            }
            outputText("[pg]令人惊讶的是，她有头发，或者说对于一个完全由柔软的无机半固体构成的女人来说，可以算是头发的东西。她的长发垂过肩膀，细长的发丝和她的皮肤一样反光。与她的皮肤不同，乳胶黏液女孩的头发似乎永远是油腻、光滑和润滑的。你犹豫地伸出手去触摸，小心翼翼地抚摸着几根橡胶般的发丝。它们的质地光滑而滑溜，不像你曾经有幸触摸过的任何头发。");
            outputText("[pg][say: 我能感觉到，你知道的。]");
            outputText("[pg]你拼命后退，对这突如其来的话语感到惊讶，以至于你差点一屁股摔在[butt]上。作为回应，咯咯的笑声冒了出来，[say: 抱歉，我不是故意吓你的。]");
            outputText("[pg]你走上前，低头看着这个已经恢复意识的曾经的黏液女孩。她问道：[say: 真的是你吗？我……在我试图让你舒服之后，还有这个……]她指了指自己乳胶般的身体和巨大无瑕的双乳，[say: 我从没想过还能再见到你。]她移开视线，挣扎着站起来——她有脚了，一双修长的腿，不像湖里那些普通的黏液女孩。看来她已经失去了很多无定形的特征。");
            outputText("[pg]你尽可能温柔地向她讲述你的经历：黑蛋和奶从你的[inv]里掉了出来，溅到了——或者说渗入了——她的身体里，改变了她。她痛苦地呻吟着，双手抱住宽阔的胸部，浑身发抖，她那扭曲的身体在光线下摇晃闪烁，让这个动作显得更加不可思议。你忍不住注意到她的身体是多么性感，多么诱人，她那乳胶般的身体简直在呼唤你的触摸和爱抚……就在你提醒自己的时候，那具身体里的女孩正绝望而悲伤地哭泣着。");
            outputText("[pg]不过，不知道她的名字，想安慰她并不容易。你坐在她身边，尽可能友好地问她。");
            outputText("[pg][say:名字？我的名字是我灵魂的温暖和被遗忘的海洋的气息……或者说，在你把我变成……这样之前是这样的。我想我现在甚至无法与我的族人正常交流。在你的耳朵里，我没有名字，老实说……我以前的名字可能也只是一个被遗忘的记忆。]一滴孤独的玛瑙色泪珠从她的眼角流下，在她的脸颊上变硬。她抽泣着把它擦掉。");
         }
         else
         {
            outputText("在探索时，你看到湖里有些奇怪的东西。那是一团黑色的斑块，在蔚蓝的波浪中隐约可见。偶尔，它会沮丧地溅起水花。出于好奇，你找了附近的一个灌木丛躲在后面，静静地观察。那个黑色的身影猛地将手臂砸向水面，发出巨大而愤怒的一击，将水滴炸到十几英尺高的空中。然后，它大步走上岸坐下，当水分顺着它奇特的乳胶皮肤流下时，它那球状的乳房仍在晃动。");
            outputText("[pg]你觉得现在是最好的时机，于是走出藏身处，走近那个奇怪的、性感的尤物。她立刻注意到了，站直身子大喊：[say: 你！]");
            outputText("[pg]");
            if(get_player().cor < 33)
            {
               outputText("你歉意地叹了口气");
            }
            else if(get_player().cor < 66)
            {
               outputText("你皱着眉头");
            }
            else
            {
               outputText("你得意地笑着");
            }
            outputText("，你点点头承认道：[say: 是我。]她站起身，颤抖着向你迈出一步，威胁地举起双臂。你准备好迎战，但她停了下来，单膝跪地。油腻的黑色眼泪从她那" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛的眼角滴落，肆无忌惮地落在地上，她哀号着：[say: 我听不到她们了！]黑色的水滴溅在沙子和草地上，立刻凝固成一张光滑坚固的网。你惊叹于此，她继续说道：[say: 我不再是黏液了……我的姐妹们……我听不到她们的声音了……]");
            outputText("[pg]这个乳胶女人又颤抖着抽泣了几声，然后抬起头看着你，眼里闪着泪光。[say: 为什么？你为什么要这样对我？你想从我这里得到什么？]");
            outputText("[pg]你微笑着解释说，湖里的黏液女孩一直让你很感兴趣，这似乎是让她们变得更……容易控制的最好方法。她痛苦地呻吟着，双手抱住宽阔的胸部，浑身发抖，她那扭曲的身体在光线下摇晃闪烁，让这个动作显得更加不可思议。你平静地伸出双手，解释道");
            if(get_player().cor < 33)
            {
               outputText("你会成为一个好[master]。她永远不会缺少她需要的体液，只要她服从你，你就会满足她的其他需求。");
            }
            else if(get_player().cor < 66)
            {
               outputText("你会成为她的好[master]。只要她听话，你就会让她保持健康和满足。");
            }
            else
            {
               outputText("只要她服从你，她就没什么好怕的。她最好乖乖听话。");
            }
            outputText("[pg]你拉着她的手把她拉起来，带她回营地。她向你提出了一连串的问题，但你没有理会她，把她带回了家里一个僻静的地方。一旦安全可靠，你突然问她，除了“女孩”或“奴隶”之外，你应该叫她什么。毕竟，即使是宠物也需要名字。");
            outputText("[pg][say: 名字？我的名字是我灵魂的温度和被遗忘的海洋的气息……或者说，在你把我变成……这样之前是。我觉得我现在甚至无法和我的族人正常交流了。对你来说，我没有名字，老实说……我以前的名字也可能只是一段被遗忘的记忆。]一滴孤独的黑色眼泪从她的眼角滑落，在她的脸颊上凝固。她抽泣着把它擦掉。");
         }
         menu();
         addButton(0,"继续",encounterLeftBehindGooSlaveII);
      }
      
      public function changeLatexyTits(param1:int = 0) : void
      {
         clearOutput();
         if(gooTitClass(param1) > gooTitClass(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,665)) && gooTitClass(int(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) / 2)) < gooTitClass(param1))
         {
            if(gooTitClass(int(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,664) / 2)) == gooTitClass(int(gooTitSize())))
            {
               outputText("[latexyname]点了点头，但她的身体并没有发生变化。[say:我现在没有足够的黏液让它们变得更大了。如果你想看看它们……完全长大的样子，你就得喂我。]");
            }
            else
            {
               outputText("[latexyname]把手放在乳头上，深吸了一口气。她屏住呼吸一秒……两秒……三秒……当她呼气时，她的乳房肉眼可见地膨胀起来，不是因为空气，而是因为沉重的液体重量。不幸的是，它们没有达到你要求的大小。[latexyname]只是没有足够的汁液来填满它们……目前还没有。她告诉你，一旦你喂饱她，她就会像你要求的那样圆润。");
            }
         }
         else if(gooTitClass(param1) == 7)
         {
            outputText("[latexyname]把手放在乳头上，深吸了一口气。她屏住呼吸一秒……两秒……三秒……当她呼气时，她的乳房肉眼可见地膨胀起来，不是因为空气，而是因为沉重的液体重量。它们变得越来越大，直到几乎遮住了她的腰部。它们显然很重，呈水滴状。在它们之间，丰满的乳胶乳沟吸引了你的目光。你的一部分想爬进去，看看你是否能消失在那些沉重、被乳胶包裹的乳房中。");
         }
         else if(gooTitClass(param1) == 6)
         {
            if(gooTitClass(int(gooTitSize())) < 6)
            {
               outputText("[latexyname]把手放在乳房下方，眨了眨眼。在你的注视下，她的" + gooTits() + "充满了越来越多的黏液，伸展开来以容纳它们惊人的液体重量。它们直到几乎有沙滩排球那么大才停下来，沉重地摇晃着，遮住了你宠物的大部分躯干。墨黑色的乳沟随着每一个动作摇晃，邀请你把什么东西放进去。");
            }
            else
            {
               outputText("[latexyname]把手放在她巨大的乳房下方，眨了眨眼。在你眼前，这巨大的肉团慢慢缩小，将它们过多的质量压缩成一个更小、更容易控制的形状。较小的乳房直到勉强遮住[latexyname]的躯干才停止缩小。它们仍然有深不见底的乳沟，但现在的形状可能更容易让你的同伴承受。");
            }
         }
         else if(gooTitClass(param1) == 5)
         {
            if(gooTitClass(int(gooTitSize())) < 5)
            {
               outputText("[latexyname]托起她的" + gooTits() + "，捏住乳晕向外拉扯。反光的黑色肌肤随着她的拉扯而伸展，因新增加的重量而变得沉甸甸的。乳房的生长直到大约有篮球那么大才停止，尽管它们要摇晃得多。那些令人印象深刻的球体之间的乳沟似乎深不见底，几乎在邀请你把什么东西放进去。");
            }
            else
            {
               outputText("[latexyname]叹了口气，抓住她肿胀的乳房。她向下压，将它们向内压缩。仿佛变魔术一般，压力实际上导致过大的乳房缩小了。它们变得越来越小，直到大约有篮球那么大，无论怎么看仍然非常大。[latexyname]的乳沟仍然令人印象深刻，但没有达到那种淫秽的程度。家乡的女人为了拥有像她这样的巨乳，杀人的心都有了。");
            }
         }
         else if(gooTitClass(param1) == 4)
         {
            if(gooTitClass(int(gooTitSize())) < 4)
            {
               outputText("[latexyname]咯咯地笑着问，[say: 你确定我们不能弄得更大点吗？变成乳胶最好的部分就是我的新皮肤不需要我费什么力气就能保持形状。我可以毫不费力地拥有拖到地板上的巨大乳房！操，如果我的乳头能挂在每一颗小石子上，我一定会发情的！]她一边幻想一边叹气，拉扯着自己的乳头。随着每一次拉扯，她的乳房都会膨胀一点，充满了新鲜的液体。当它们变成排球大小的乳房时，它们会稍微晃动一下，中间有一道迷人的乳沟。");
            }
            else
            {
               outputText("[latexyname]叹了口气说，[say: 我真希望你能让我把它们弄得更大。那样我就可以手脚并用地爬行，把它们拖在地上，尽量不在每次乳头挂到小石子时高潮。]她一边幻想一边叹气，向下压着她过大的乳房。仿佛变魔术一般，它们缩小了，压缩到大约有排球那么大，中间有一道迷人的乳沟。");
            }
         }
         else if(gooTitClass(param1) == 3)
         {
            if(gooTitClass(int(gooTitSize())) < 3)
            {
               outputText("[latexyname]叹了口气，托起自己的乳房，大声说道：[say: 长大。] 就像听话的毛衣小狗一样，她的乳房膨胀并变得饱满。曲线变得丰满，乳沟加深，[latexyname]对这个结果露出了微笑。她的乳房现在大约是DD罩杯——正如你所要求的那样。");
            }
            else
            {
               outputText("[latexyname]失望地呻吟着，[say: 我喜欢它们大一点！好吧，你是老板……] 她握紧拳头，闭上眼睛。起初什么也没发生，但过了一会儿，她的" + gooTits() + "收紧了。在几十秒的时间里，[latexyname]的乳房缩小到了DD罩杯左右——正如你所命令的那样，一个不错但相当正常的尺寸。");
            }
         }
         else if(gooTitClass(param1) == 2)
         {
            if(gooTitClass(int(gooTitSize())) < 2)
            {
               outputText("[latexyname]说，[say:好吧，我想这是一个开始。]她捧起她小巧的乳头，轻轻地揉捏着。每一次，它们都会多晃动一点。几乎在她开始的同时，她停了下来，让它们变成了曲线优美的C罩杯。[say:我们能再大一点吗？]");
            }
            else
            {
               outputText("[latexyname]颤抖了一下，但还是服从了。首先，她向下压她的" + gooTits() + "，然后，她闭上眼睛，打了个寒颤。在你的眼前，乳房的肉减少了，最终变成了曲线优美的C罩杯。[say:我看起来一定脱水了！幸好其他女孩看不到我！]");
            }
         }
         else if(gooTitClass(param1) == 1 && param1 > 0)
         {
            outputText("[latexyname]说：[say: 我看起来会贫血的！其他黏液女孩会以为我快饿死了！] 你给了她一个居高临下的眼神，她叹了口气。[say: 好吧，好吧。如果我的[master]想要小胸，" + get_player().mf("he\'ll","she\'ll") + "就会得到。] 她抓住自己的" + gooTits() + "，用力挤压。令人惊讶的是，乳胶胸肉随着她的推压而退缩，在你的眼前缩小。当它们缩小到B罩杯时，她呜咽了一声，当它们缩小到A罩杯时，她呻吟了一声。[latexyname]把手拿开，向你展示她努力的成果——两个小乳房，每个只有手掌大小。一条乳胶润滑液的河流从她的股沟流出，违背她的意愿服从你这一行为反而增强了她的性唤起。");
         }
         else
         {
            outputText("[latexyname]脸红了，给了你一个微笑，如果不是在午夜黑色的画布上，这个微笑会是光芒四射的。[say:谢谢你。]");
            gooHappiness(2);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,665,param1);
         if(gooObedience() < 75)
         {
            gooObedience(3);
         }
         doNext(approachLatexy);
      }
      
      public function changeGooDick() : void
      {
         var item10:ItemType;
         var _g10:LatexGirl;
         var item9:ItemType;
         var _g9:LatexGirl;
         var item8:ItemType;
         var _g8:LatexGirl;
         var item7:ItemType;
         var _g7:LatexGirl;
         var item6:ItemType;
         var _g6:LatexGirl;
         var item5:ItemType;
         var _g5:LatexGirl;
         var item4:ItemType;
         var _g4:LatexGirl;
         var item3:ItemType;
         var _g3:LatexGirl;
         var item2:ItemType;
         var _g2:LatexGirl;
         var item1:ItemType;
         var _g1:LatexGirl;
         var item:ItemType;
         var _g:LatexGirl;
         clearOutput();
         if(gooObedience() >= 60)
         {
            outputText("你");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
            {
               outputText("问[latexyname]有没有想过长根鸡巴玩玩。");
            }
            else
            {
               outputText("问她想不想换一种鸡巴。");
            }
            outputText("她呜咽着呻吟道，[saystart][Master]，在改变之前我就很喜欢长出阴茎。更重要的是，");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
            {
               outputText("我想为你长一根。");
            }
            else
            {
               outputText("我希望你经常命令我改变它。");
            }
            outputText("进一步改变我自己，把我的身体扭曲成你的性爱游乐场……那将是终极的刺激！[sayend]");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
            {
               outputText("[pg][latexyname]把一只手从她的小穴上移开，说道：[say: 如果你想让我长出鸡巴，我需要一些阳刚的东西，[Master]。梦魔的药剂可以，或者一些牛头人的血，虽然血可能会让它变成马鸡巴……]她颤抖着闭上眼睛，想象着自己有一根坚硬的马具。你的史莱姆似乎有点恋物癖。");
            }
            else
            {
               outputText("[pg][latexyname]把一只手从她的小穴上移开，说道：[say: 什么样的阴茎最能取悦你？我大概能变出人类的、狗的、马的、猫的、触手的，或者恶魔的。]说到最后一个时，她微微颤抖了一下，舔了舔嘴唇。[say: 不过你需要有合适的物品来帮助我，[Master]。我不再像以前那么灵活了。]");
            }
         }
         else
         {
            if(gooHappiness() < 70)
            {
               outputText("你");
               if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
               {
                  outputText("问[latexyname]有没有想过长根鸡巴玩玩。");
               }
               else
               {
                  outputText("她想不想换一种鸡巴。");
               }
               outputText("她翻了个白眼，说道：[say: 抱歉，但我觉得你现在已经让我改变得够多了。]");
               outputText("[pg]在她愿意那么做之前，她必须学会更顺从一些。");
               gooObedience(-3);
               menu();
               addButton(0,"继续",approachLatexy);
               return;
            }
            outputText("你问[latexyname]");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
            {
               outputText("她有没有想过长根鸡巴玩玩。");
            }
            else
            {
               outputText("她想不想换一种鸡巴。");
            }
            outputText("她喜笑颜开，咯咯地笑着说：[say: 天哪，在改变之前我就很喜欢长出阴茎！看到这会让人们多么惊讶，以及变出新的形状看看感觉如何，真是太有趣了。我们开始吧！]");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) == 0)
            {
               outputText("[pg][latexyname]敲了敲下巴，说道：[say: 如果你想让我长出鸡巴，我需要一些阳刚的东西。梦魔的药剂可以，或者一些牛头人的血，虽然血可能会让它变成马鸡巴……]她邪恶地笑了笑。");
            }
            else
            {
               outputText("[pg][latexyname]敲了敲下巴，说道：[say: 我大概能变出几乎任何种类的阴茎，虽然我只真正喜欢人类的、狗的、马的、猫的、触手的，和恶魔的。]说到最后一个时，她微微颤抖了一下，舔了舔嘴唇。[say: 不过你需要有合适的物品来帮助我，我不再像以前那么灵活了。]");
            }
         }
         menu();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            _g = this;
            item = get_consumables().INCUBID;
            addButton(0,"男魅魔药剂",function():void
            {
               _g.latexyEatsADickItem(item);
            }).disableIf(!get_player().hasItem(get_consumables().INCUBID) || get_cockType() == CockTypesEnum.DEMON);
            _g1 = this;
            item1 = get_consumables().MINOBLO;
            addButton(1,"牛头人血",function():void
            {
               _g1.latexyEatsADickItem(item1);
            }).disableIf(!get_player().hasItem(get_consumables().MINOBLO) || get_cockType() == CockTypesEnum.HORSE);
            _g2 = this;
            item2 = get_consumables().CANINEP;
            addButton(2,"犬椒",function():void
            {
               _g2.latexyEatsADickItem(item2);
            }).disableIf(!get_player().hasItem(get_consumables().CANINEP) || get_cockType() == CockTypesEnum.DOG);
            _g3 = this;
            item3 = get_consumables().EQUINUM;
            addButton(3,"马化药剂",function():void
            {
               _g3.latexyEatsADickItem(item3);
            }).disableIf(!get_player().hasItem(get_consumables().EQUINUM) || get_cockType() == CockTypesEnum.HORSE);
            _g4 = this;
            item4 = get_consumables().P_DRAFT;
            addButton(4,"纯净药剂",function():void
            {
               _g4.latexyEatsADickItem(item4);
            }).disableIf(!get_player().hasItem(get_consumables().P_DRAFT) || get_cockType() == CockTypesEnum.HUMAN);
            _g5 = this;
            item5 = get_consumables().W_FRUIT;
            addButton(5,"猫须果",function():void
            {
               _g5.latexyEatsADickItem(item5);
            }).disableIf(!get_player().hasItem(get_consumables().W_FRUIT) || get_cockType() == CockTypesEnum.CAT);
            _g6 = this;
            item6 = get_consumables().GROPLUS;
            addButton(6,"Gro+",function():void
            {
               _g6.latexyEatsADickItem(item6);
            }).disableIf(!get_player().hasItem(get_consumables().GROPLUS) || FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) >= 24 + (get_hyper() ? 0 : 36));
            _g7 = this;
            item7 = get_consumables().REDUCTO;
            addButton(7,"缩形膏",function():void
            {
               _g7.latexyEatsADickItem(item7);
            }).disableIf(!get_player().hasItem(get_consumables().REDUCTO) || FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) < 5);
         }
         else
         {
            _g8 = this;
            item8 = get_consumables().INCUBID;
            addButton(0,"男魅魔药剂",function():void
            {
               _g8.latexyEatsADickItem(item8);
            }).disableIf(!get_player().hasItem(get_consumables().INCUBID));
            if(get_player().hasItem(get_consumables().P_DRAFT))
            {
               _g9 = this;
               item9 = get_consumables().P_DRAFT;
               addButton(0,"纯净药剂",function():void
               {
                  _g9.latexyEatsADickItem(item9);
               });
            }
            _g10 = this;
            item10 = get_consumables().MINOBLO;
            addButton(1,"牛头人血",function():void
            {
               _g10.latexyEatsADickItem(item10);
            }).disableIf(!get_player().hasItem(get_consumables().MINOBLO));
         }
         addButton(14,"返回",approachLatexy);
      }
      
      public function bootOutNiceGoo() : void
      {
         clearOutput();
         outputText("你把她带回来已经尽了你的公民义务，但长期照顾她……这要求太高了。[say:我明白，]她说着，悲伤地低下头，摇摇晃晃地挣扎着站起来。[say:没关系。你做的已经够多了，真的。我走了。希望湖里的一些姐妹愿意帮助我，即使我现在……和她们……如此不同。再见，我的朋友。也许我们有时还会再见。]");
         outputText("[pg]过了一会儿她就走了，一边摇摇晃晃地走回湖边，一边从肩膀上挥手。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,659,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         outputText("你告诉她回营地去；你需要对她做一些她在这里时你做不到的事情。反复地做。[latexyname]停顿了一下，然后瞥了一眼湖的方向，显然对要被从那里带走的前景感到不快。然而，她知道自己的位置。");
         outputText("[pg]你看着这个生物缓慢而笨重地向营地走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1085,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function assertControlOverCuntDrainingLatexGoo() : void
      {
         if(get_player().get_str() < 40 || get_player().get_str() / 10 + Utils.rand(20) + 1 < 9)
         {
            letLatexGooDrainCuntDry();
            return;
         }
         clearOutput();
         outputText("[pg][Latexyname]的脸依然固执地贴在你的下体上。你在她无情的口部攻势下挣扎，直到你终于紧紧抓住了这个叛逆的黏液荡妇。你发挥出惊人的力量，将你和黏液女孩翻转过来，跨坐在她的肩膀上，用身体压住她。[latexyname]发出一声可怜的吱吱声，你再次夺回了控制权，将她按在身下的地上。她在这里本该是顺从的一方：是时候让这个婊子认清自己的位置了。你抓住她光滑的乳胶头发，把她的脸按进你的小穴，当她的鼻子摩擦你的[clit]时，你浑身一颤。你厉声命令她再让你高潮一次。如果她那么想要你的体液，就让她用正确的方式去争取：像个乖巧的小M一样，温顺地吮吸你的小穴。");
         outputText("[pg]被按倒在地的[latexyname]在你有力的[legs]下挣扎了一会儿，直到你再次用力把她的脸按进你饥渴的小穴，她对你淫水的强烈渴望压倒了她反抗的欲望。[saystart]对、对不起，");
         if(gooObedience() <= 50)
         {
            outputText("[name]");
         }
         else
         {
            outputText("[Master]");
         }
         outputText("[sayend] 她呜咽着，在你女性的褶皱间长长地、试探性地舔了一下。你紧紧抓住她，让她证明自己有多抱歉。当她长而光滑的舌头再次滑过你的身体，停下来打圈挑逗你敏感的[clit]时，你屏住了呼吸，突如其来的快感让你浑身颤抖。");
         outputText("[pg][say: 乖女孩，] 你呻吟着，弓起背，她将长长的舌头越伸越深，用黑色乳胶填满了你的[cunt]。你的手指穿过她的头发，催促着[latexyname]，她开始探索你的通道，在刚刚经历了她的脸交之后，那里依然敏感柔软，令人愉悦。她越来越多地钻进你体内，撑开你的阴道壁，直到她的舌尖触碰到你的子宫颈口，用缓慢而有节奏的动作愉快地绕着它打圈。你提醒[latexyname]，这才是应有的方式，她应该顺从地按照你的意愿服侍你饥渴的小穴；而不是试图支配你。这不是规矩，她现在应该明白了。");
         outputText("[pg][say: 对不挤，" + get_player().mf("主银","女主人") + "，] 她含糊不清地嘟囔着，因为舌头完全埋在你体内，所以口齿不清。她从你体内抽离，让你感到空虚和寒冷，她补充道，[say: 我不是故意的，主人……我只是，失去了控制……] 你微笑着低头看着这个小小的乳胶女孩，告诉她不用担心。你会一直在这里，用美味的淫水把她喂得饱饱的，饱到快要撑破肚子。[latexyname]扭动着身体，被你的话语所打动，你越过肩膀看去，可以看到一股新鲜的液态乳胶从她的大腿间流下。");
         outputText("[pg]你松开[latexyname]的头，留下一只手抚摸她的头发，另一只手顺着她光滑的皮肤游走，沿着她匀称的曲线和巨大的、摇晃的乳房，直到你的指尖拂过她的大腿。当一根手指插入她体内，以一个缓慢、慵懒的动作滑入她准备好的小穴直到指关节时，她喘息着。你的另一只手引导她的头向上，催促她回到她的职责；她犹豫了片刻，但你也一样，两人都僵持着，直到她终于接受了你的要求并继续，她的舌头伸出来在你的[cunt]上游走。[say: 乖女孩，] 你又说了一遍，开始移动你的手，温柔地用手指抠弄她的小穴，同时她舔舐着从你下体自由流出的润滑液。");
         outputText("[pg]然而，在她进入用舌头操你的节奏之前，你决定奖励她新发现的顺从：你转过身，让她被压在你的[legs]下，同时你把头移到她匀称的大腿之间。你深吸一口气，陶醉在她的气味中，[latexyname]将她长长的舌头滑回你体内，用她的口腔器官填满你空虚的[cunt]。你投桃报李，温柔地将中间三根手指滑入她饥渴的小穴，撑开她，直到你能把整个拳头滑进去。她喘息着，呼吸热乎乎地喷在你敏感的小穴上，但你毫不迟疑地将拳头推入她体内，滑进去直到填满整个小穴。你开始移动，用缓慢、温柔的动作对她进行拳交，享受着她光滑的通道拼命收缩，试图挤压里面巨大肿块的感觉，试图在你推入时把你推出去；试图在你拔出到指关节时把你吸进去。");
         outputText("[pg][say: " + get_player().mf("主——人——","女——主——人——") + "！] [latexyname]呻吟着，随着你用拳头操她，她的头向后仰去。她加倍努力地用嘴服侍你，急切地舔舐着你湿透的阴部，拼命想让你高潮，尽管润滑液从她双腿间大量喷出，预示着她即将到达顶点。但你离高潮更近，近在咫尺，即使她停下来你也会高潮。但她不敢，而是抓住你的大腿，把脸埋在你的[legs]之间，以令人理智崩溃的速度用舌头在你体内吸吮。");
         outputText("[pg]在你高潮之前，你尽可能深地把拳头塞进[latexyname]体内，让她发出愉悦的尖叫，当你在高潮的边缘爆发时，你的小穴也随之震颤。你的[cunt]几乎喷发出淫液，淋在[latexyname]的脸上，你的阴部紧紧夹住她的舌头，把她困在你体内，同时你猛烈地捣弄着她的小穴，让她在你身下陷入高潮的痉挛，她的舌头在你体内扭动翻腾，进一步增加你的快感。");
         outputText("[pg]当你的第二次高潮过去后，你软绵绵地从[latexyname]身上滚下来，彻底满足了。你的[chest]起伏着，你平静地叹了口气，闭上沉重的眼皮，渴望休息。但片刻之后，你感觉到光滑的皮肤贴着你的皮肤，[latexyname]蜷缩在你身边，她的脸离你只有几英寸远。你带着淡淡的微笑，伸出手，用手指穿过她的头发，然后把她拉进一个长长的吻中，在你的嘴唇上留下了女人的味道。");
         if(gooHappiness() < 33)
         {
            outputText("[pg][say: 如果总是这样的话，也许……和你在一起也不是那么糟糕，] [latexyname]低语道。");
         }
         else if(gooHappiness() < 66)
         {
            outputText("[pg][say: 对不起，我太强硬了，[name]。我喜欢服侍你……真的。]");
         }
         else
         {
            outputText("[pg][latexyname]依偎着你，她的头靠在你的[chest]上。[say: 对不起，[name]。我不是故意要强迫你的。我喜欢你这么自信，这么……有统治力的时候。]");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         gooFluid(30 + get_player().wetness() * 5);
         gooHappiness(5);
         gooObedience(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function approachLatexy() : void
      {
         var _g:Camp;
         clearOutput();
         spriteSelect(SpriteDb.get_s_latexgoogirl());
         if(gooHappiness() < 10)
         {
            outputText("看到你走近，[latexyname]皱起眉头，她" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛里满是不悦。你怀疑她那纯黑玛瑙般的脸庞还能不能更阴郁一点。");
         }
         else if(gooHappiness() < 20)
         {
            outputText("当你靠近时，[latexyname]狠狠地瞪着你，显然对目前的状况很不满。她看起来过得相当糟糕。");
         }
         else if(gooHappiness() < 30)
         {
            outputText("当你靠近时，[latexyname]对你皱起眉头，看到你让她非常不高兴。她似乎过得不太好。");
         }
         else if(gooHappiness() < 40)
         {
            outputText("看到你走近，[latexyname]惊愕地皱起眉头，显然很不高兴。看起来她一点也不喜欢待在这里。");
         }
         else if(gooHappiness() < 50)
         {
            outputText("当你靠近时，[latexyname]抬头瞥了你一眼，显得很无聊。她看起来需要一些安慰。");
         }
         else if(gooHappiness() < 60)
         {
            outputText("当你靠近时，[latexyname]对你勉强笑了笑，看起来有些无聊。不过，她眼中闪烁的光芒告诉你，她离不高兴还差得远呢。");
         }
         else if(gooHappiness() < 70)
         {
            outputText("看到你，[latexyname]露出了浅浅的笑容，很高兴见到你。很高兴看到她有这样积极的心态。");
         }
         else if(gooHappiness() < 80)
         {
            outputText("当你靠近时，[latexyname]对你展露笑颜，看起来心情不错。她微笑时，那性感迷人的肌肤反射着光芒，看起来真是美极了。");
         }
         else if(gooHappiness() < 90)
         {
            outputText("[latexyname]对你咧嘴一笑，露出一排闪闪发光的黑牙。她用那双快乐的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛调皮地看着你。");
         }
         else if(gooHappiness() < 100)
         {
            outputText("看到你走近，[latexyname]蹦蹦跳跳地迎上来，嘴巴咧开一个大大的笑容。她那闪闪发光的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛里闪烁着由衷的喜悦。");
         }
         else
         {
            outputText("看到你走近，[latexyname]一跃而起，在你靠近时高兴地拍着手。她那" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛和狂喜的面容清楚地表明她有多么难以置信的开心。");
         }
         outputText("");
         if(gooTitSize() >= 35)
         {
            outputText("她的" + gooTits() + "充满了水分，大到她的手臂几乎无法环抱，双手徒劳地按压着晃动的两侧。冒着气泡的黑色表面淫靡地隆起，几乎无法承受里面液体的重量。");
         }
         else if(gooTitSize() >= 24)
         {
            outputText("她那惊人的胸部疯狂地晃动着，双手几乎无法将其托住。它们完全遮挡了她的躯干。最终，她放弃了束缚，任由它们自由晃动。你忍不住欣赏着那完美的曲线，同时思考着她怎么可能还能站得直。");
         }
         else if(gooTitSize() >= 15)
         {
            outputText("大到足以遮住她大部分躯干的" + gooTits() + "沉甸甸地摇晃弹跳着。当她用双手托住胸部时，光线从那闪亮、令人着迷的表面反射出来。");
         }
         else if(gooTitSize() > 4)
         {
            outputText("她那圆润且富有弹性的" + gooTits() + "随着她的动作微微泛起涟漪。那些圆润的球体似乎既柔软又坚挺。");
         }
         else if(gooTitSize() > 3)
         {
            outputText("高高耸立在她胸前的一对骄傲的" + gooTits() + "随着她的每一个动作微微晃动。它们依然圆润漂亮，但远不及她以前那般巨大。");
         }
         else if(gooTitSize() > 2)
         {
            outputText("她那高耸丰满的" + gooTits() + "看起来挺拔俏丽，顶端点缀着黑巧克力般的乳头。反光的表面让它们看起来比实际更大，为你的双眼带来一场午夜黑暗的视觉盛宴。");
         }
         else
         {
            outputText("高高耸立在她胸前的" + gooTits() + "对于她的体型来说似乎小得不成比例。挺拔的玛瑙色乳头诱人地凸起，宛如诱人午夜的小巧冠冕。");
         }
         outputText("你估计如果[latexyname]穿胸罩的话，她的胸部应该适合" + Appearance.breastCup(gooTitSize()) + "罩杯。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,666) == 1)
         {
            outputText("那些挺拔的乳头顶端有着奇怪的凸起，这些凸起可以极度膨胀，变成坚硬的肉棒乳头。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,666) == -1)
         {
            outputText("那些挺拔的乳头中间有一条明显的裂缝，正等着被掰开，变成饥渴的小穴。");
         }
         if(gooFluid() >= 75)
         {
            outputText("她的黑玛瑙色嘴唇丰满诱人，充满了液体。同样，她的身体看起来红润且充满活力，显然不缺液体营养。");
         }
         else if(gooFluid() >= 50)
         {
            outputText("她的黑玛瑙色嘴唇丰满而微微噘起。同样，她的身体光滑且曲线优美，充满了充足的液体营养。");
         }
         else if(gooFluid() >= 25)
         {
            outputText("她的黑玛瑙色嘴唇看起来有点小。同样，她的身体纤细狭窄，不够丰满，也没有曲线。她可能需要更多的液体营养。");
         }
         else
         {
            outputText("她的黑玛瑙色嘴唇很小，抿成一条细线。同样，她的身体狭窄而虚弱，也许缺乏液体营养。");
            if(gooFluid() <= 5)
            {
               outputText("她看起来非常不健康——她也许能这样活下去，但你能看出这对她来说是个沉重的负担。");
            }
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            outputText("在她的腰部下方，悬挂着一根 " + Utils.num2Text(Math.round(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) * 10) / 10) + " 英寸长的 " + gooCock() + "，柔软而闪亮。");
         }
         outputText("一条闪闪发光的裂缝，渗出煤黑色的润滑液，紧紧地依偎在她性感的乳胶双腿交汇处。由于这种不自然的湿滑，它们闪耀得更加明亮。");
         outputText("[pg]");
         if(gooObedience() < 10)
         {
            outputText("[latexyname]用纯粹挑衅的眼神看着你，随时准备违抗命令。");
         }
         else if(gooObedience() < 20)
         {
            outputText("[latexyname]漫不经心地卷着一缕乌黑的头发，等待着你的评价，她" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛里闪烁着叛逆的光芒。");
         }
         else if(gooObedience() < 30)
         {
            outputText("[latexyname]对你假笑，脸上带着叛逆的神情。");
         }
         else if(gooObedience() < 40)
         {
            outputText("[latexyname]对你眨着炭黑色的睫毛，用她" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "、火热的眼睛注视着你，仍然远未顺从。");
         }
         else if(gooObedience() < 50)
         {
            outputText("[latexyname]向下瞥了一眼，移开视线，直到她想起要抬起头，抗拒着自己的屈服。");
         }
         else if(gooObedience() < 60)
         {
            outputText("[latexyname]垂下眼睛，但透过炭黑色的睫毛向上偷看你。");
         }
         else if(gooObedience() < 70)
         {
            outputText("[latexyname]将她" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "的眼睛垂向地面以示对你的尊重，尽管她在等待命令时紧张地用手指在泥土上画画。");
         }
         else if(gooObedience() < 80)
         {
            outputText("[latexyname]顺从地将目光固定在下方，脸颊泛起紫红色。她喜欢向你屈服吗？");
         }
         else if(gooObedience() < 90)
         {
            outputText("[latexyname]在你面前五体投地，向后仰起头，这样她就可以将目光固定在你的腰部，不配与你对视。");
         }
         else if(gooObedience() < 100)
         {
            outputText("[latexyname]顺从地在你面前五体投地，高高撅起她黑玛瑙色的臀部，同时低下额头。她的脸颊和臀部都透过乳胶皮肤泛起紫红色，显然被她自己的顺从唤起了性欲。");
         }
         else
         {
            outputText("[latexyname]在你面前四肢着地，亲吻着你的[feet]。她光滑的臀部连同她的侧腰和脸颊一起变亮，因她自己屈服的热度而泛起紫罗兰色的情欲红晕。她淫荡地向你问好，[say: [Master]。]");
         }
         outputText("[pg]<b>体液 %:</b> " + Math.round(gooFluid()));
         outputText("\n<b>快乐 %:</b> " + Math.round(gooHappiness()));
         outputText("\n<b>服从 %:</b> " + Math.round(gooObedience()));
         menu();
         addButton(0,"外貌",latexyAppearance).hint("检查这个乳胶黏液女孩。");
         addButton(1,"交谈",latexyTalkMenu).hint("和[latexyname]谈谈。");
         addButton(2,"喂食",feedLatexy).hint("喂[latexyname]一些体液。你可以直接从你体内分泌，或者给她一些你装在瓶子里的东西。");
         addButton(3,"使用她",useLatexy).hint("用她来发泄一下性欲。她可能也会喜欢的。").sexButton(-1);
         addButton(5,"胸部大小",setLatexysBustSize).hint("要求[latexyname]改变她的胸部大小。");
         addButton(6,"阴茎选项",changeGooDick).hint(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0 ? "让[latexyname]调整她阴茎的外观。不过她需要一些物品来帮忙。" : "让[latexyname]长出一根肉棒。不过她可能需要一些材料来帮忙。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1085) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农场工作",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1085) == 1)
         {
            addButton(10,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1085) == 1)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
         else
         {
            _g = get_camp();
            addButton(14,"返回",function():void
            {
               _g.campSlavesMenu();
            });
         }
      }
      
      public function PCCarriedGooBackHomeII() : void
      {
         clearOutput();
         outputText("[say:你想叫我什么就叫什么吧，我的名字不重要。]");
         outputText("[pg]你要给她起什么名字？");
         menu();
         addButton(0,"继续",nameZeLatexGoo);
         genericNamePrompt();
      }
      
      public function PCCarriedGooBackHome() : void
      {
         clearOutput();
         outputText("你把曾经的黏液放在营地一个僻静的地方");
         if(get_camp().companionsCount() > 0)
         {
            outputText("，远离窥探的目光");
         }
         outputText("。在某种程度上，她看起来几乎像个外星人……比以前更像了，以前她只是一个长着奶子和假发的水状黏液团。现在，她身体的每一面都是闪亮、反光的乳胶。甚至她随意滴落的阴道分泌物也是液体乳胶，这些有光泽的黑色汁液一旦离开她的身体，就会慢慢变硬，成为一种有弹性的固体。");
         if(get_player().totalCocks() > 1)
         {
            outputText("你不禁想知道，让她用她的汁液包裹你的[cocks]会是什么感觉。");
         }
         outputText("[pg]令人惊讶的是，她有头发，或者说对于一个完全由柔软的无机半固体构成的女人来说，那算是头发。她的长发垂过肩膀，细长的发丝和她的皮肤一样反光。与她的皮肤不同，这个乳胶黏液女孩的头发似乎永远是油腻、湿滑且润滑的。你犹豫地伸出手去触摸，小心翼翼地抚摸着几根橡胶般的发丝。它们的质地光滑而溜滑，与你有幸触摸过的任何头发都不同。");
         outputText("[pg][say: 我能感觉到，你知道的。]");
         outputText("[pg]你猛地后退，被这突如其来的话语吓了一跳，差点一屁股摔在你的[butt]上。作为回应，她发出咯咯的笑声，[say: 抱歉，我不是故意要吓你的。]");
         outputText("[pg]你走上前，低头看着你清醒的战利品。她问道，[say: 我……我怎么了？我本来……本来……本来想让你舒服的……然后……你把我变成了这样！]她向后退缩，背靠在岩石上，随着恐慌达到顶点，她的身体失去了硬度。这个乳胶女人的背部渗过她靠着的巨石，身体慢慢溶解。你伸出手想阻止她，但伴随着一声痛苦的啪嗒声，每一个半固体的伪足都缩回了原位，让她向前摔倒在她巨大的乳房上。看来她失去了很大一部分可溶的柔韧性。");
         outputText("[pg]她抬头看着你，那双惊恐的" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛睁得像餐盘一样大。[say: 你为什么要这样对我？]");
         outputText("[pg]你微笑着解释说，湖里的黏液女孩一直让你很感兴趣，而这似乎是让其中一个变得更……容易控制的最佳方法。她痛苦地呻吟着，双手抱住宽阔的胸部，浑身发抖，她扭曲的身体在光线下抖动闪耀，让这个动作显得更加奇妙。你平和地伸出双手，解释道");
         if(get_player().cor < 33)
         {
            outputText("你会成为一个好[master]。她永远不会缺少她需要的体液，只要她服从你，你就会满足她的其他需求。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你会成为她的好[master]。只要她听话，你就会让她保持健康和满足。");
         }
         else
         {
            outputText("只要她服从你，她就没什么好怕的。她最好乖乖听话。");
         }
         outputText("突然，你问她除了“女孩”或“奴隶”之外，你应该怎么称呼她。毕竟，即使是宠物也需要名字。");
         outputText("[pg][say:名字？我的名字是我灵魂的温暖和被遗忘的海洋的气息……或者说，在你把我变成……这样之前是这样的。我想我现在甚至无法与我的族人正常交流。在你的耳朵里，我没有名字，老实说……我以前的名字可能也只是一个被遗忘的记忆。]一滴孤独的玛瑙色泪珠从她的眼角流下，在她的脸颊上变硬。她抽泣着把它擦掉。");
         menu();
         addButton(0,"继续",PCCarriedGooBackHomeII);
      }
   }
}

