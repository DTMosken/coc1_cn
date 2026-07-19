package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.MasteryLib;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.forest._AikoScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class AikoScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving, Encounter
   {
      
      public var talkAndSex:Boolean;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var playerchoice:Boolean;
      
      public var globalSave:Boolean;
      
      public function AikoScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         playerchoice = true;
         talkAndSex = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "aiko";
         saveContent = new SaveContent(null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function yamataWins() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         outputText("当你跪倒在地时，你痛苦地咬紧牙关。当你倒下时，你能听到八岐在嘲笑你。你无能为力；她实在太强了。");
         outputText("[pg][say: [name]！] 爱子一边喊着，一边跑向你瘫软的身体。你忍不住咒骂自己：你辜负了她，你没能打败她的姐姐。[pg][say: 过来，你这个小可怜！] [say: 不！放开我！] 随着骚乱的继续，你设法抬起头看看发生了什么：八岐用她的尾巴缠住了爱子，牢牢地堵住了她逃跑的每一个机会。其中一条尾巴还在她的嘴里，阻止她说话。[say: 闭嘴，你的话既不需要也不受欢迎，哈哈哈哈哈！这太棒了！每个人都会谈论我！“八岐，打败了勇者的人！”他们想要你活着……但我宁愿看着你在痛苦中死去，因为我要折磨这个小丫头！][pg][say: 不！[name]！求求你，不要离开我！不！！！！！] 你感到头晕目眩，头垂到了地板上。当你听到爱子惊恐的尖叫声时，你的视线逐渐变得模糊。你很庆幸你不会再看到她受苦了。");
         outputText("[pg]当生命离开你的身体时，你唯一能嘟囔的，就是一个无声的道歉，同时一滴眼泪从你的脸颊滑落。[pg]");
         if(get_game().marbleScene.marbleFollower())
         {
            outputText("[pg][say: 不！！！！！亲爱的！] 玛布尔的哭声从你的营地传来。");
         }
         get_game().set_inCombat(false);
         get_game().gameOver();
      }
      
      public function yamataTalk() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         if(get_aikoCorruption() < 50)
         {
            outputText("你问爱子是否还有什么关于她同父异母姐姐的事可以告诉你。");
            outputText("[pg]她吸了吸鼻子，从地上抬起头看着你，微微点了点头，站起身来面对你。她拍了拍身上的灰尘，平复了一下情绪，说道：[say: 我们从来都合不来……我的意思是，一开始只是普通的兄弟姐妹之间的事……但在我被选为村庄守护者的那一天，我想那对她来说就是压死骆驼的最后一根稻草。我们整个童年都想要这个位置，而当她被淘汰时……][pg]爱子打了个响指来强调她的观点，悲伤地叹了口气。[pg][say: 在我被任命为守护者的第二天晚上，八岐闯入神社，偷走了我们家族保护的其中一件宝物。她大发雷霆，然后在被制服之前，她消失得无影无踪。从那以后再也没有人见过她，直到她突然出现，手里拿着我的宝珠。][pg]你问她是否能告诉你关于她偷走的这件宝物的任何信息，希望能收集到尽可能多的信息。[pg][say: 我对它了解不多，因为它一直被锁起来，封印在神社的最深处。不过有一件事我很确定；在像她这样的人手里，它是一件危险的武器。]");
         }
         else
         {
            outputText("她叹了口气，微微摇了摇头，很明显她的耐心正在耗尽。不过没有你的帮助她也做不了什么，所以她说道：[say: 我们从来都合不来……标准的兄弟姐妹竞争的破事……但在我被选为村庄守护者的那一天，哦吼，她他妈的疯了。我们整个童年都想要这个位置，而当她被淘汰时……][pg]为了强调她的观点，她用拇指在喉咙上划了一下，做了一个恶心的鬼脸。[pg][say: 在我被任命为守护者的第二天晚上，八岐闯入神社，偷走了我们家族保护的其中一件宝物。她大发雷霆，我说的可是彻底的屠杀，那简直太美妙了！她消失得无影无踪，直到她突然出现，带着我的宝珠！] 她咆哮着，露出牙齿。[pg]你问她是否能告诉你关于她偷走的这件宝物的任何信息，希望能收集到尽可能多的信息。[pg][say: 从来没怎么了解过它——长老们对那东西怕得要死，所以它被封印在神社下面。不过有一件事我很确定；在像她这样的人手里，它很危险。只可惜我没能先拿到它……]");
         }
         menu();
         addButton(0,"现在出发",yamataStart).hint("和爱子一起去对付八岐，阻止她的疯狂！");
         addButton(1,"准备",yamataPrepare).hint("回家准备一下，这将是一场非常艰难的战斗！");
      }
      
      public function yamataStart() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉爱子你准备好出发了，请她现在就带你去村子。听到这话，她似乎精神振奋起来，点了点头。[pg]");
         if(get_aikoCorruption() < 50)
         {
            outputText("[say: 好的，跟我来，] 她说着，轻轻拉起你的手，拉着你往前走。她带你离开空地，沿着一条几乎看不见的土路走去。走了一小段路后，你看到一个设计奇特的大木拱门，似乎建在荒郊野外。很明显有人在维护它，因为它鲜红的油漆几乎没有褪色和变色的迹象，但环顾四周，你却看不到任何其他文明的迹象。[pg][say: 站在这里，] 爱子说着，走到拱门里站定。她把手伸进长袍，掏出一张小纸符，放在中间的地上，然后退后。她似乎费了九牛二虎之力，在手掌中召唤出一缕蓝色的火焰。即使是最基本的法术她也显得很吃力，看来她的魔力已经快耗尽了。[pg]当她用火焰点燃纸符时，整个拱门突然充满了神秘的火焰，迫使你遮住眼睛以避开刺眼的光芒。当火焰平息后，你现在可以看到拱门外有一个古色古香的村庄！出于好奇，你绕着拱门的周边走了一圈，果然，只有当你透过拱门看时，才能看到这个村庄。[pg][say: 没时间解释了，] 爱子语气中带着一丝急切。[say: 我只希望大家都还安好……]");
         }
         else
         {
            outputText("[say: 你花了好半天才下定决心，] 她说着，拉起你的手，拉着你往前走。她带你离开空地，沿着一条几乎看不见的土路走去。走了一小段路后，你看到一个设计奇特的大木拱门，似乎建在荒郊野外。很明显有人在维护它，因为它鲜红的油漆几乎没有褪色和变色的迹象，但环顾四周，你却看不到任何其他文明的迹象。[pg][say: 站在这里，] 爱子说着，走到拱门里站定。她把手伸进长袍，掏出一张小纸符，放在中间的地上，然后退后。她似乎费了九牛二虎之力，在手掌中召唤出一缕紫色的火焰。即使是最基本的法术她也显得很吃力，看来她的魔力已经快耗尽了。[pg]当她用火焰点燃纸符时，整个拱门突然充满了神秘的火焰，迫使你遮住眼睛以避开刺眼的光芒。当火焰平息后，你现在可以看到拱门外有一个古色古香的村庄！出于好奇，你绕着拱门的周边走了一圈，果然，只有当你透过拱门看时，才能看到这个村庄。[pg][say: 别傻看了，] 爱子语气中带着一丝不耐烦。[say: 我们赶紧进去踢她的屁股！]");
         }
         doNext(yamataIntro);
      }
      
      public function yamataPrepare() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉爱子你还需要时间准备，从她对八岐的描述来看，她同父异母的姐姐是个相当难对付的对手。你回到营地，继续为即将到来的大战做准备。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function yamataLoses() : void
      {
         clearOutput();
         outputText("当你看到八岐四肢着地，睁着邪恶的眼睛绝望地喘息时，你放松了肩膀。");
         outputText("[pg][say: 不可能！你竟然有这样的力量，" + (get_player().kitsuneScore() < 4 ? "对于一个卑微的凡人来说！" : "即使你比我弱！") + "]");
         outputText("[pg]你冷冷地告诉她放弃吧，停止这种恶魔般的胡闹，把爱子的宝珠还回来。八岐在你说话的时候开始歇斯底里地大笑，然后突然向你展示了她恶魔般的面容。");
         outputText("[pg][say: 愚蠢！你怎么敢对九尾发号施令？像你这样的人应该受到惩罚！] 当她威胁你时，她迅速站起来，试图向你发射一道漆黑的能量斩。你准备好你的[weapon]，迅速将波浪切成两半，让它在你身后爆炸，但当你回头看时，你发现八岐已经消失了。");
         outputText("[pg][say: [name]！求-] 爱子的声音像刀子一样划破了寂静，你迅速抬起头，震惊地看到八岐抓住了爱子，并用她的尾巴缠住了爱子，其中一条尾巴在爱子的嘴里，阻止她说话。");
         outputText("[pg][say: 哈哈哈哈哈哈！你们这些卑微的生物太容易被骗了！看来情况逆转了……“勇者”，如果你想活命就离开这里……但爱子将全是我的……] 当她继续威胁你时，八岐舔了舔她妹妹的耳朵，这让她很震惊，也让你很沮丧。爱子迅速咬了八岐的尾巴一口，设法解放了她的嘴，堕落的妖狐发出一声痛苦的尖叫。");
         outputText("[pg][say: 别管我，[name]！攻击她，阻止这种疯狂！必须阻止她！] 她恳求道，但八岐的尾巴再次打断了她的话。");
         outputText("[pg][say: 你这个傲慢的小丫头！你会为此付出代价的！] 被妹妹的顽强激怒了，八岐准备好她的村正，试图直接刺穿她的心脏，但爱子的分心正是你所需要的。当她的注意力被转移时，你靠近到足以接触到邪恶的妖狐和她的人质，用肩膀快速撞击她的侧面，你设法解救了爱子。当八岐向前移动时，你迅速用你的[weapon]攻击她，设法将她击倒，而爱子则四肢着地，喘着粗气。");
         outputText("[pg]你站在被打败的九尾妖狐面前。她愤怒地低吼着，再次试图去拿她的村正。你预判了她的动作，一脚踩在她的手上，将她死死按住。你动作敏捷地从八岐的乳沟里夺回了爱子的宝珠，居高临下地看着这只被打败的堕落妖狐。");
         outputText("[pg][say: 混蛋……混蛋！都是那些长老的错！我做的一切都被我那愚蠢妹妹的成就给掩盖了！求求你……勇敢的勇者……放我走吧……我发誓，我不会再伤害你了……] 当你举起[weapon]准备给她最后一击时，她绝望地看着你，泪水顺着脸颊滑落。在你面前，她显然已经毫无还手之力。");
         outputText("[pg][say: 别听她的，[name]……你现在应该知道了，妖狐都是骗人的行家……她想骗你放她走！她对我的村子做了那么多事……就算她是我姐姐，她也是个可恶的恶魔。] 爱子从你手中拿回宝珠，小心翼翼地藏在长袍里。随着力量的恢复，她召唤出弓箭，搭上一支箭，瞄准了她姐姐的喉咙。");
         if(!get_player().hasPerk(PerkLib.Masochist))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2372) >= 100)
            {
               outputText("[pg]你意识到，在经历了八岐对你的所有折磨后，你竟然开始享受痛苦了。<b>你变成了一个受虐狂！</b>");
            }
            else
            {
               outputText("八岐对你施加的所有痛苦几乎让你变成了受虐狂，但你在她成功让你产生这种堕落念头之前就打败了她！");
            }
         }
         outputText("你看着被打败的恶魔，她的眼神在乞求怜悯。你觉得你可以放八岐走，让爱子解决她姐姐" + (get_player().cor > 60 ? "，自己动手了结她，或者在决定怎么做之前先操她一顿。" : "，或者自己动手了结她。"));
         if(!get_player().hasPerk(PerkLib.Masochist) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2372) >= 100)
         {
            get_player().createPerk(PerkLib.Masochist,0,0,0,0);
         }
         menu();
         addButton(0,"放她走",releaseYamata).hint("放八岐走，相信她不会再伤害任何人。");
         addButton(1,"爱子动手",aikoKillSister).hint("应该由爱子来决定怎么处置八岐。");
         addButton(2,"了结她",killYamata).hint("八岐已经造成了足够的痛苦和苦难，现在就了结她！");
      }
      
      public function yamataIntro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         outputText("狐妖村的街道空无一人，镇上笼罩着一种令人毛骨悚然的寂静。你经过的每一栋房子都和上一栋一样黑暗空荡，看不到任何镇民的踪迹。正当你开始认为自己可能来得太晚时，你听到有人痛苦地叫喊！");
         outputText("[pg]转过拐角，你发现自己面对着一个看起来疯疯癫癫的狐妖，她的脚踩在一个村民的背上。看起来她一直在鞭打这个可怜的女孩，但她脸上空洞的眼神和狂喜的表情表明，她的受害者一直从这种虐待中获得某种扭曲的快感。现在你有时间看清现场了，你可以看到城镇广场已经被改造成了一个临时的束缚地牢，许多镇民被锁链和其他简陋的束缚具绑了起来。");
         outputText("[pg][say: 八岐！] 爱子大喊一声，握紧了拳头。");
         outputText("[pg][say: " + (get_player().catScore() > 4 ? "哎呀，哎呀……看看是谁把这只猫叼来了！" : "哎呀，哎呀……看看我们这儿有谁……") + "]");
         outputText("[pg]当你把注意力转向那个把脚踩在村民背上的妖狐时，你注意到她的眼睛和爱子一样是蓝色的。尽管她的眼睛闪烁着可怕的疯狂，她的嘴似乎永远扭曲成一个精神病般的笑容，露出她锋利、闪闪发光的牙齿。她比爱子高得多，身高超过6.5英尺，耳朵前面长着一对巨大的恶魔角。她只用一块布裹住她巨大的E罩杯乳房，裸露的手臂上满是抓痕和咬痕，腰间飘逸着一条白色的灯笼裤，款式与爱子长袍的下半部分相似。你数了数，她身后有九条巨大的尾巴在空中扭动，不规则地甩动着。她的头总是微微倾斜，好像被永久性地拧错了一样，她的一举一动都令人不安，就好像她是一个披着妖狐外衣的怪物。");
         outputText("[pg]然而，她最引人注目的特征是她的头发。一头乌黑的鬃毛从她的肩膀上倾泻而下，但当它流下时，突然开始向外扭曲，形成八个盘绕在她周围的蛇形线圈，每个线圈的末端都有一个巨大的、长着尖牙的蛇头。当她转身对你们俩说话时，所有八个蛇头也将注意力转向你，猛烈地咬向空气。");
         outputText("[pg][say: 在找这个吗？] 她说道，居高临下地笑着，在指尖上旋转着爱子的宝珠。[say: 我看你带了个朋友来，亲爱的妹妹。我希望你不要以为[he]能救你！] 她笑着，用脚把失去知觉的受害者推开，开始向你和爱子走去。[say: 当然，我总是可以用更多的玩具来取乐……嗯……是的，我想你会是我游乐场的完美补充……勇者。]");
         outputText("[pg]当她用你的头衔称呼你时，你吃了一惊，并要求知道她是怎么知道这些事情的，试图击退入侵你脑海的奇怪想法，这些想法告诉你屈服是多么美妙。");
         outputText("[pg][say: 哦，我的主人对你的一切了如指掌……我们一直在观察和等待合适的时机出击……想想看，我终于可以向我亲爱的、可爱的妹妹复仇，把这个该死的村庄变成我个人的游乐场，并且终于可以一举把你除掉！] 她向天空举起双臂，开始歇斯底里地大笑，然后终于把注意力转回你身上，饥渴地舔着嘴唇。[say: 你一直是我们的眼中钉……你到底对一点点无政府状态有什么不满？混乱才是让世界运转的动力！反正我们都只是这个毫无价值的泥球表面上的一点宇宙尘埃，在天空中以永恒的向外螺旋碰撞，直到我们最终在一次光荣的、刺耳的宇宙热寂中熄灭！为什么不享受这个过程呢，我说得对吗？！]");
         outputText("[pg]哇。这个婊子真是疯了。你不知道她在说什么，但你知道你必须把爱子的宝珠拿回来，而唯一的方法就是打败这个女人。你准备好你的[weapon]，准备战斗。");
         outputText("[pg][say: 嗯……很好，我喜欢我的猎物有一点反抗精神。村正！] 她大喊着，把手伸向一边。一个装饰着符文的发光圆圈在半空中出现，她开始从中拔出一把巨大的黑色刀刃，似乎沐浴在堕落的能量中。这把扭曲的武器看起来就像噩梦中的东西，它笔直的边缘向前弯曲成一个尖锐的刺，看起来可以轻易刺穿最坚固的盔甲。[say: 害怕了吗？你应该害怕……] 她说着，把刀刃翻转到肩膀上，一堵堕落之火的墙开始从她身后蔓延开来，将你们俩包围起来，并将你与爱子分开。看来你别无选择，只能结束这场战斗！");
         outputText("[pg][say: [name]！" + (get_aikoCorruption() < 50 ? "我……我相信你！" : "狠狠踢那个自大婊子的屁股！") + "]");
         startCombat(new Yamata());
      }
      
      public function yamataAftermath() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("当你离开去释放狐妖村民时，你的注意力被八岐使用的那把邪恶的刀吸引了——你记得她好像叫它“村正”。你小心翼翼地仔细检查这把刀，能看到它那异常锋利的刀刃下有深紫黑色的漩涡。这把剑散发出的腐化气息[if (cor < 50) {几乎令人窒息|令人振奋}]，仅仅是靠近它就让你感到[if (cor < 50) {肮脏|不可阻挡}]。你担心这把武器太污秽了，" + (get_game().rathazul.followerRathazul() ? "即使是拉萨祖尔" : "任何人") + "都无法净化它。");
         outputText("[pg]爱子走过来，眯起眼睛，盯着那把剑。[say:这是一把非常强大的武器……如果它再次落入恶魔之手，那将是一场灾难。]你什么也没说，她抓住剑柄，把它从地上拔了出来。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) == 1 ? "[say:也许我可以用我的魔法净化它。]" : "[say:我可以用它来定位八岐……甚至可能强大到可以用它来对付她。]") + "你很想警告她这把剑的恶魔影响，但她可能比你更了解这把刀。此外，很难感觉不到它的腐化。她显然明白自己行为的危险性。");
         outputText("[pg]回到村子后，你帮助爱子把被锁链绑住的村民从八岐的刑具上解救下来。每个人都称赞你是拯救村庄的英雄，一些特别感激的狐妖甚至向你献上她们的身体——但要让你分心，光靠裸露的乳房和摇摆的臀部是不够的。毕竟，这是漫长的一天，你还记得你的营地在等着你。你吻别了爱子，并答应稍后去看她，但在你离开之前，一只九尾狐妖出现在你面前。令你惊讶的是，她和爱子长得惊人地相似……");
         outputText("[pg][say:勇敢的勇者，我们感谢你为我们种族所做的贡献。以我们全村的名义，如果你选择回来，你将永远受到最高的敬意。我既作为长辈，也作为母亲感谢你。甚至爱子似乎也和你在一起找到了幸福。]狐妖长辈向你鞠躬，慢慢地消失在虚无中。当她消失时，你仔细端详着她，想起了爱子提到过她的母亲。难怪她这么漂亮。");
         outputText("[pg]在疲惫的一天后，你回到了营地。");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseFourHours);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.AikoLustPrank))
         {
            get_player().addStatusValue(StatusEffects.AikoLustPrank,1,-1);
            if(get_player().statusEffectv1(StatusEffects.AikoLustPrank) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.AikoLustPrank);
               dynStats(DynStat.Sens(-15));
               outputText("随着爱子的魔法失效，你皮肤上持续的红晕终于消退了。终于，你又可以自由活动了，再也不会因为轻微的触碰就发情了！");
            }
         }
         return false;
      }
      
      public function talkTentacles() : void
      {
         var _loc1_:* = null as Array;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你决定向她询问一些当地的植物群。她能分享一些关于触手怪的事吗？");
         outputText("[pg][say: 它们还好吧，我想。我从来没养过。责任太大了。]");
         outputText("[pg]等等，养过？[if (cor > 50) {你肯定错过了什么。|人们真的会……养它们吗？}]");
         outputText("[pg][say: 哦，你是说野生的那些吗？]");
         outputText("[pg]考虑到你遇到的那些家伙的脾气，很难相信还有其他种类的触手怪。[say: 哦！嗯，是的。有些狐妖喜欢把它们当宠物养。野生的非常危险，当它们靠我们的领地太近时，我偶尔还得把它们赶走。但驯服的其实挺可爱的。就像小小的……长满叶子的……鱿鱼。]");
         outputText("[pg]虽然你觉得这很难以置信[if (cor > 50) {，而且还有点诱人}]，但你还是示意她继续说下去。");
         outputText("[pg][say: 很多人以为它们长成那样就只是野兽，但它们其实很聪明——只是有点被进食习惯所奴役。不过，如果你让它们吃饱，它们就会像小猫一样温顺。有时候它们可能会有点闹腾，但你懂的。]");
         if(get_game().forest.tentacleBeastScene.saveContent.timesLost > 0)
         {
            outputText("[pg]当你回想起那些触手向你蠕动，[if (cor > 50) {把你紧紧缠住，|用铁钳般的力道困住你，}]并榨取[if (hascock) {你的[cockplural]|你}]时，你能感觉到[if (cor > 50) {热度|羞耻}]涌上脸颊，尽管你曾努力挣扎想要逃脱。");
            outputText("[pg]爱子的笑容更灿烂了。[say: 看来你确实懂……]");
         }
         else
         {
            outputText("[pg]你其实不知道那是怎么回事[if (cor > 50) {，但也不介意去了解一下。[say: 那可是……狂野的体验，]她说道，她的表情已经告诉了你一切。|，并希望永远都不知道。[say: 你真的错过了很多，[name]。]}]");
         }
         outputText("[pg][say: 有时候确实会变得很奇怪……我见过有些女孩甚至给她们的触手怪做衣服。这……其实有点让人不安。]");
         outputText("[pg]你同意她的看法，然后你们俩讨论了各自在野外遇到各种生物的经历。");
         if(talkAndSex)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               _loc1_ = ["你经历过的最血腥的战斗","你对抗过的凶恶怪物","你遇到过的可怕恶魔"];
               outputText("[pg]但在你能告诉她所有关于" + _loc1_[Utils.rand(int(_loc1_.length))] + "之前，她打断了你。[say: 你还想要点别的，对吧？]爱子" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 65 ? "红着脸" : "颤抖着") + "停顿了一下。[say: 刚才那些关于触手的话题让我，嗯……]");
               doNext(aikoSex);
            }
            else
            {
               _loc1_ = ["你经历过的最血腥的战斗","你对抗过的凶恶怪物","你遇到过的可怕恶魔"];
               outputText("[pg]你告诉她所有关于" + _loc1_[Utils.rand(int(_loc1_.length))] + "，直到她打断了你。[say: 我有……]她深吸了一口颤抖的气，然后继续说道。[say: 有些事情要处理。]");
               outputText("[pg][if (cor > 50) {你并不怎么关心她的问题，|在你提出帮忙之前，她就消失在森林里了，而且}]除了回营地，你似乎也没什么别的事可做。");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkNineTails() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:Boolean = get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails);
         var _loc2_:String = get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "并微笑着" : (get_player().kitsuneScore() >= 4 ? "，似乎对你还不知道这些感到有些惊讶" : "");
         var _loc3_:String = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "八条" : "七条";
         outputText("[say: 噢，你想了解" + (_loc1_ ? "你自己" : "我们的贵族") + "，是吗？]她双臂交叉抱在胸前" + _loc2_ + "。你可以看出她也想成为其中一员，毕竟她已经有" + _loc3_ + "尾巴了。");
         outputText("[pg][say: 九尾是最古老、最睿智的妖狐，非常稀有且受人尊敬。在我们氏族里，只有六位九尾，我母亲就是其中之一。]");
         if(get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            outputText("[pg]终于，有人察觉到了你的野心。其他人说你做不到——只有心灵纯洁的人才能获得真正的力量，但这并没有阻止你。当低阶妖狐祈求指引时，你更加努力地学习。总是向着更高处攀登，直到有一天……");
            outputText("[pg]即使是现在，这些记忆依然让你激动得浑身发麻。当你的第九条尾巴成型时，那种麻木而荣耀的感觉，整个宇宙都为你洗礼，敬畏你的力量。随着你尾巴的每一次摆动，那原始而充满激情的能量在你的指尖跳跃，提醒着你自来到这里以来已经走得有多远。");
            outputText("[pg]整个世界都是你的，即使他们还不知道。");
            outputText("[pg][say: ……我们村里诞生的最后一位九尾。她的名字叫“银子”……]");
            outputText("[pg]天哪，她还在说。这不是应该关于你的吗？");
         }
         else
         {
            outputText("[pg][say: " + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "我不知道你当时是什么情况，但在我们这里，当" : "当") + "一只妖狐长出最后一条尾巴时，我们会举行一个盛大的仪式，全村人都会庆祝他们新上任的领袖。在仪式上，新任九尾可以选择一名或多名随从，作为他们的仆人和副手。他们需要有五条或更多的尾巴，甚至可以是其他氏族的。你可以想象，被选中是极高的荣誉。]");
            outputText("[pg]那她呢？她曾经当过随从吗——毕竟，她自己也有" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "八条" : "七条") + "尾巴了。");
            outputText("[pg][say: 嗯……是的。我曾是我们村里最后一位九尾妖狐的侍从。她的名字叫“银子”……这么说吧，她很喜欢对我们唠叨，而且……对在性方面支配我们有一种狂热。直到我成为村子的守护者才结束。]");
            outputText("[pg]你咧嘴一笑，对她明显厌恶做仆人的时光咯咯笑了起来，换来她的一声嘘声，然后你们一起大笑。" + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? " 也许她更愿意和你在一起？" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 80 ? "[say: 当然。但我不能，记得吗？]" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "她耸耸肩。[say: 谁知道呢。但我的守卫职责无论如何都会阻止它的。]" : "爱子瞪着你。[say: 我宁愿和她在一起一百年，也不愿和你在一起一年。]")) : ""));
         }
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            if(get_player().hasPerk(PerkLib.EnlightenedNinetails))
            {
               outputText("[pg]感谢她提供的信息后，你提到你可以让她体验一下作为你侍从的生活。[say: 哦？我很乐意看看你会让我做什么，[name]。]");
            }
            else
            {
               outputText("[pg]" + (get_player().hasPerk(PerkLib.CorruptedNinetails) ? "为了显得礼貌，你感谢她提供的“信息”，然后" : "感谢她提供的信息后，你") + "转身准备离开，却感觉到她的手搭在了你的肩膀上。[say: 我知道这信息量很大……但我没忘记你还有别的计划。]");
            }
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]" + (get_player().hasPerk(PerkLib.CorruptedNinetails) ? "很高兴这结束了" : "感谢她抽出时间") + "，你告诉她你得回去看看你的营地了。[say: 撒哟娜拉，[name]。]");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkMansionSisters() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你决定问问她关于你在冒险中遇到的其他一些狐妖——特别是你在森林里看到的那三姐妹。她们也是来自她的村庄吗？");
         outputText("[pg][say: 噢，那三姐妹啊。对，她们原本是我们村的，但现在不住那儿了。她们屡次无视长老们不要和外人过多接触的请求，最后受够了，决定自己搬出去住。如果我是你，我会离她们远点。她们看起来可能很友善，但绝对是惹祸精。]");
         outputText("[pg]你忍不住指出，她现在做的事，其实就是在和外人接触。她难道不会因为同样的原因惹上麻烦吗？");
         outputText("[pg][say: 那、那不一样！我是守卫，我必须在外面保护村子！我……作为联络人是我的责任！]她说道，脸红得厉害。");
         outputText("[pg][say: 反、反正，至少我不会像她们那样做得太过分。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0)
         {
            outputText("[pg][if (cor > 50) {你不太确定她说的“过分”是什么意思——被三只热情的妖狐缠上几个小时，感觉更像是“刚刚好”。|<i>也许</i>是有点过分，但她们三个花了好几个小时抚摸品尝你身上的每一寸肌肤，那绝对是一次令你终生难忘的体验。}]");
            outputText("[pg]她摇了摇头。");
         }
         else
         {
            outputText("[pg]你[if (cor > 50) {绝对|有点}]好奇她说的“过火”是什么意思。");
         }
         outputText("[pg][say: " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0 ? "一旦" : "那三个家伙就是不知道适可而止。她们把旅行者引诱到她们的宅邸，然后……好吧，一旦") + "你跨过门槛，你就已经成为幻象的一部分了。如果她们想把你留在那儿，你一点办法也没有。你要知道，你不会是第一个被多情的妖狐神隐的倒霉旅行者。我们可不都像我这么好心。]");
         outputText("[pg]你感谢爱子的警告。[if (cor > 50) {不过听起来还是很值得。|看来在妖狐这方面，你还有很多东西要学。}]");
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg]你告诉她，你现在也有点想恶作剧的心情，她的耳朵立刻竖了起来。[say: 我确实……喜欢听你这么说。]");
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]不幸的是，你离开营地太久了，你现在可能该回去看看了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkGoblins() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你决定向爱子询问一些当地的动物群。她有没有遇到过在森林里游荡的地精？");
         outputText("[pg][say: " + (get_player().goblinScore() >= 4 ? "除了你？男" : "地精……男") + "孩，那是个悲伤的故事。发生在她们身上的事真的很遗憾；她们以前很聪明的。现在，我相信你也注意到了，她们真的只对一件事感兴趣。还有少数几个在搞科学研究，但即使那样也只是为了让她们更擅长做爱。]她耸了耸肩，悲伤地摇了摇头。");
         outputText("[pg][say: 她们其实不太打扰我们，但有一个特别的家伙" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2275) > 0 ? "以前经常来" : "偶尔会来") + "，发出一些含糊的、消极攻击的威胁。她话说得很满，但我真的怀疑她是不是想打架。不管怎样，我还是尽量避开她们。她们真的没那么大威胁，但领地意识有点强，[if (hascock) {特别是当“新鲜肉”搬进来的时候，你懂我的意思吧。|[if (hasvagina) {特别是如果有女性侵入她们认为是“她们地盘”的地方。|不过考虑到你，呃，的情况，她们可能不会太打扰你。}]}]]");
         outputText("[pg]你们俩讨论了一会儿各自遇到当地地精的经历，然后你向她告别，告诉她你该回营地看看了。");
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg][say: 等等。你真的只想要这些吗？]当你转过身时，她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 65 ? "红着脸" : "") + "低下了头。[say: 我发誓我不像她们那样，但是……]");
            doNext(aikoSex);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkFamily() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉她，如果她不介意的话，你有几个私人问题想问。");
         outputText("[pg][say: 问吧。不过我不保证全都会回答，]她回答道，双臂交叉，露出羞涩的笑容。");
         outputText("[pg]不想得寸进尺，你决定从简单的开始。她提到了很多关于她家乡的事情，但从未提及她的家人。");
         outputText("[pg][say: 家人？嗯……是的，我有。我母亲是长老之一，也是前任守护者。她教给了我所知道的一切。她的伴侣是来自另一个隐秘村落的妖狐；她还是三尾的时候就认识他了。不过我不知道他是不是我父亲。]");
         outputText("[pg]看到你困惑的表情，她补充道，[say: " + (get_player().kitsuneScore() >= 4 ? "你们村子的做法肯定不同，但在我们这里，大多数人" : "哦，这在妖狐村落里并不罕见。大多数妖狐") + "都不确定自己的父亲是谁。我小的时候，还以为到处都是这样呢。]");
         outputText("[pg]你点点头，然后问她有没有兄弟姐妹，心想既然" + (get_player().kitsuneScore() >= 4 ? "她" : "妖狐") + "的社会如此支持自由恋爱，大家庭一定很普遍。");
         outputText("[pg][say: 我……嗯，是的……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2369) > 0 ? " 还记得八岐吗？我同父异母的姐姐？]" : "] 爱子的神情突然变得忧郁起来，你问她是不是你说了什么不该说的话。[say: 不是，我只是……我确实有个同父异母的姐姐，但我已经好几年没见过她，也没和她说过话了。我不知道她在哪里，甚至不知道她是否还活着——恶魔到来后不久她就失踪了。虽然……在那之前我们相处得并不好。]"));
         outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "在[if (cor > 40) {半心半意地}]为勾起她对那个" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) == 1 ? "被杀的" : "残忍的") + "姐姐的回忆而道歉后，你" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2369) > 0 ? "[if (cor > 66) { 你早就忘记了她的问题，但你|你肯定是忘了，你}]" : "你")) + "告诉爱子，如果让她感到不舒服，她不需要透露任何太私人的事情。");
         outputText("[pg][say: 是的，我更希望这样，谢谢。]");
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg]不过你有个主意，也许能让她重新振作起来……");
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]看到有借口可以轻易脱身，你告诉她你该回营地看看了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkCulture() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = null as String;
         var _loc5_:Boolean = false;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2366) > 0 || get_player().kitsuneScore() >= 4;
         var _loc2_:String = get_player().kitsuneScore() >= 4 ? "你的" : "她的";
         outputText("[pg]你告诉她你有兴趣了解" + (_loc1_ ? "更多" : "") + "关于" + _loc2_ + "文化。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2366) < 1 || get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails))
         {
            outputText("[pg][say: " + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "你是在……考验我，对吧？" : "什么，真的吗？") + "]");
            _loc3_ = get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails);
            _loc4_ = get_player().kitsuneScore() >= 4 ? "你们" : "她";
            _loc5_ = get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails);
            outputText("[pg]你" + (_loc3_ ? "耸了耸肩" : "点了点头") + "，说你只是对" + _loc4_ + "的种族感到好奇。" + (_loc5_ ? "虽然她看起来有点紧张，但还是深吸了一口气，开始讲述。" : ""));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2366) >= 1)
         {
            outputText("[pg]又来？");
         }
         outputText("[pg][say: 嗯，让我想想，从哪里开始说起呢……我没怎么见过外面的世界，但我想我们和普通的村庄没什么两样。大家就是过着普通人的生活，你懂吧？日常琐事，没那么有趣。我们也有铁匠、面包师、木匠，和其他人一样。]");
         outputText("[pg]也许说得更具体一点会有帮助。你问是否所有的狐妖都像她一样喜欢恶作剧。");
         outputText("[pg]" + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "[say: 当然，]她说着，对你礼貌地点了点头。" : "听到你的问题，她的眼睛几乎亮了起来。") + " [say: 如果你明白我的意思，这对我们来说是一种非常满足的体验。]");
         outputText("[pg][if (cor > 30) {你很确定你懂，但为了确认一下|带着一丝困惑}]，你问她是不是你想象的那个意思。");
         outputText("[pg][say: 性方面，是的。因此，恶作剧和戏弄已经深深烙印在我们的民族天性中。这甚至是我们求偶仪式的一部分。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg]回想她所有的恶作剧，你忍不住怀疑她是不是在向你求偶。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "一抹红晕爬上她的脸颊，她说道：[say: 这是一个可能……]" : "[say: 也许吧，]她说道，笑容依旧让人捉摸不透。[say: 或者也许" + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "……" : "你只是太好骗了。") + "]"));
         }
         outputText("[pg]你又想到了一件事：你从未遇到过" + get_player().mf(get_player().kitsuneScore() >= 4 ? "另一个" : "一个","一个") + "她这个种族的雄性。是不是" + get_player().mf(get_player().kitsuneScore() >= 4 ? "几乎" : "","") + "所有的狐妖都是雌性，还是你只是运气不好？");
         if(get_player().kitsuneScore() >= 4)
         {
            _loc3_ = get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails);
            _loc5_ = get_player().isNaked() && get_player().cor > 50;
            outputText("[pg]爱子" + (_loc3_ ? "恼怒地" : "奇怪地") + "瞥了你一眼，但还是继续说道。[say: 我想，我们大多数人出生时都是……雌性，但这其实没什么意义。我们可以像换衣服一样轻松地改变性别。]她停顿了一下，仔细打量着你，你忍不住" + (_loc5_ ? "感到兴奋" : "扭动了一下身子") + "。");
            switch(get_player().get_gender())
            {
               case 0:
                  outputText("[pg][say: 虽然我们大多数人保持着女性的外貌，但有些狐妖偏爱其他形态也不足为奇，]她说着，脸上浮现出好奇的笑容。[say: 但是你……嗯，" + (get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails) ? "你是个引领潮流的人" : "即使对我们来说，也有点不寻常") + "。]");
                  break;
               case 1:
                  outputText("[pg][say: 虽然我们大多数人保持着女性的外貌，但有些狐妖偏爱其他形态也不足为奇，]她说着，脸上浮现出会意——或者说掠食性的——笑容。[say: 但我猜你已经知道了。]");
                  break;
               case 2:
                  outputText("[pg][say: 但尽管如此，我们中的许多人还是保持着女性的外貌，]她耸了耸肩说道。[say: 我相信你能理解。]");
                  break;
               case 3:
                  outputText("[pg][say: 虽然我们大多数人保持着女性的外貌，但有些狐妖偏爱其他形态也不足为奇，]她说着，脸上浮现出会意——或者说掠食性的——笑容。[say: 有些人想要体验这个世界能提供的一切，不是吗？]");
                  break;
               default:
                  outputText("[pg]<b>错误：无效性别。</b>请报告此错误。");
            }
            outputText("[pg]你点了点头，告诉她你现在对自己有了更多的了解" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "。[say: 我希望这……能让你明白一些事情。]即使她转过身去，也掩饰不住脸上的红晕。" : "，但只得到了一个被逗乐的笑容作为回应。"));
         }
         else
         {
            outputText("[pg][say: 是的。不是……嗯，两者都是？我的意思是……是的，大多数狐妖出生时都是……“雌性”，我想，但性别对我们来说真的没有任何意义。雄性和雌性之间的区别……对大多数狐妖来说是一个难以理解的概念。对我们来说，这更像是决定今天穿什么衣服。就像人们会偏爱某些款式的衣服一样，大多数狐妖更喜欢以某种形态度过他们的时间。现在阴道就是很流行。]");
            if(get_silly() && get_player().isGoo())
            {
               outputText("[pg]你感同身受。你自己也有点流动性。");
            }
            outputText("[pg]你感谢她的帮助，她也微笑着回应。[say: " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "这是我的荣幸，[name]。" : "没什么。") + "]");
         }
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2366,FlagDict_Impl_.arrayReadInt(_loc6_,2366) + 1);
         if(talkAndSex)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               outputText("[pg]谈话逐渐转移到其他话题，直到你感觉到她紧贴着你的温暖，她的尾巴" + (get_player().kitsuneScore() >= 4 ? "缠绕在你的尾巴上" : "轻轻拂过你的[skindesc]") + "。[say: 但你不仅仅是来聊天的，对吧？]");
               doNext(aikoSex);
            }
            else
            {
               outputText("[pg]对话逐渐转移到其他话题，直到最后慢慢停息。[say: 也许你没那么糟，]她喃喃自语，似乎是在自言自语。[say: [if (hours > 21) {晚安|回见}]，[name]。]");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("[pg]虽然这次聊天很有教育意义，但你真的该回去看看你的营地了。[say: " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "保重。" : "当然。") + "]");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkBees() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你决定向她询问一些当地的动物群。她有没有遇到过你在森林里见过的巨型蜂女？");
         outputText("[pg][say: 巨蜂？她们通常不会深入到森林的这么深处，但我偶尔也会碰到她们。我想她们还是挺友好的，只要她们不试图把卵塞进……某些地方。至少她们在这方面还算客气。]");
         if(get_player().beeScore() >= 4)
         {
            outputText("[pg][say: 这……不是你想知道的，对吧？] 她说着，终于意识到你是什么人了。[say: " + get_player().mf("如果你在找配偶，那你走错地方了。","不、不要卵，求你了……别再来了。") + "]");
            outputText("[pg][if (cor > 40) {你打断了她|你道了歉}]，你提到你其实对她和其他蜜蜂的遭遇很感兴趣。[say: 哦，] 她说道，" + get_player().mf("显得很困惑","松了一大口气") + "。[say: 既然这样，那好吧……]");
         }
         else if(get_game().forest.beeGirlScene.saveContent.timesEgged > 0)
         {
            outputText("[pg]你告诉她你对她们的卵再熟悉不过了，她笑了起来。[say: 那是……一种体验，对吧？]");
         }
         else if(get_player().cor > 50)
         {
            outputText("[pg]当你想象着那些黏糊糊的卵塞进你体内，然后一个接一个地滑出来，把你撑到极限的感觉时，你感到有些燥热。也许你应该……试试？[pg]爱子奇怪地看了你一眼，但还是继续说了下去。");
         }
         else
         {
            outputText("[pg]一想到这你就浑身发抖，庆幸自己至今还能避开这种事。[say: 没你想的……那么糟，] 她嘟囔着，脸颊微微泛红。[say: 但确实很奇怪。]");
         }
         outputText("[pg][say: 不过有些村民偶尔会和她们做交易，换取她们的蜂蜜。那可是泡茶的好甜味剂，而且还能用它做些非常美味的甜点和糖果……] 她的声音渐渐变小，舔了舔嘴唇，显然正沉浸在美好的想象中。");
         outputText("[pg][say: 抱歉，关于她们我不知道更多了。]");
         if(talkAndSex)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               outputText("[pg]你告诉她没关系，让话题稍微转移到其他事情上，然后再把话题绕回性爱上。[say: 真是毫不掩饰啊，[name]，]她说道，尽管她笑得那么开心，很难让人把她的责备当真。[say: 但我确实喜欢知道[he]想要什么的[if (ischild) {[boy]|[man]}]。]");
               doNext(aikoSex);
            }
            else
            {
               outputText("[pg]你告诉她没关系，让话题稍微偏离了一会儿，然后再把话题转到性上。");
               outputText("[pg][say: 也许你能找到一个蜂女。] 说完，爱子消失在森林里，你除了回营地别无他法。");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("[pg]你告诉她没关系，感谢她抽出时间，并提到你也该回营地了。");
            outputText("[pg][say: 在外面小心点。]");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkArchery() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你提到了爱子的箭术，她对你的赞美报以自豪的微笑，尽管你能看到她脸颊上泛起了一丝略显尴尬的红晕。[pg]");
         if(get_player().hasKeyItem("Bow") || get_player().hasKeyItem("Kelt\'s Bow"))
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2368,FlagDict_Impl_.arrayReadInt(_loc1_,2368) + 1);
            if(get_player().masteryLevel(MasteryLib.Bow) >= 4)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2368) == 1)
               {
                  outputText("你告诉她你也一直在尝试学习，并拿出你自己的弓给她看。她仔细端详了一会儿，微笑着伸手抚摸弓身。[pg][say: 哇，这做工真精良！如果我没看错的话，这是半人马制造的……你从哪弄来的？]");
                  outputText("[pg]你向她解释了" + (get_player().hasStatusEffect(StatusEffects.Kelt) ? "你和凯尔特的交易，" + (get_player().statusEffectv2(StatusEffects.Kelt) < 75 ? "谈论着那个傲慢的半人马粗暴的态度，以及忍受他是多么糟糕。" : "几乎是梦幻般地叹息着，描述着他粗犷英俊的外表和严肃的教学方法。") : "你告诉她[if (silly){它就是某天突然出现在你的背包里的|你就是某天偶然发现它的}]，从那以后你就一直在自学如何使用它。"));
                  outputText("[pg][say: 如果你愿意，你可以使用我的靶场，但我不知道我能帮上多少忙。听起来你已经掌握了一些技巧。][pg]");
               }
               else
               {
                  outputText("你告诉她，你想知道她是否愿意再给你上一课。");
                  outputText("[pg][say: 我真的不知道我还有什么可以教你的，]她微微耸了耸肩说道。[say: 我不想承认，但你已经比我强了。][pg]");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2368) == 1)
            {
               outputText("你告诉她你一直在努力学习，并拿出你自己的弓给她看。她仔细检查了一会儿，微笑着抚摸着弓身。");
               outputText("[pg][say: 哇，这做工真不错！如果我没看错的话，这是半人马制造的……你从哪里弄来的？][pg]你向她解释了你和凯尔特的交易，" + (get_player().statusEffectv2(StatusEffects.Kelt) < 75 ? "评论着那个傲慢的半人马粗鲁的态度，以及忍受他是多么糟糕。" : "几乎是梦幻般地叹息着，描述着他粗犷英俊的外表和严肃的教学方法。") + " 之后，你问她是否愿意给你上一两节课。[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "[say: 我很乐意给你一些指导，[name]。]" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 35 ? "[say: 好吧，我会教你的……只是别让我后悔。][pg]" : "[say: 我绝对不会教[i: 你]任何东西。如果你想要我的帮助，也许你应该试着友善一点。][pg]")));
            }
            else
            {
               outputText("你告诉她，你想知道她是否愿意再给你上一课。");
               outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "她高兴地点点头，给了你一个灿烂的笑容，说道：[say: 当然，我去布置靶子！][pg]" : "她想了一会儿，最后说道：" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 35 ? "[say: 好吧，我会再教你一些。][pg]" : "[say: 不，今天不行。你想要免费的射箭课，也许你应该试着友善一点。][pg]")));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 35)
            {
               outputText("你们俩轮流射击靶子，在射击间隙互相交换故事。" + (get_player().statusEffectv2(StatusEffects.Kelt) >= 80 ? "爱子的技术显然不如凯尔特，你发现自己渴望回到真正的大师的指导下。" : (get_player().hasStatusEffect(StatusEffects.Kelt) ? "即使凯尔特的技术稍微好一点，爱子开朗的性格也足以弥补这一点，你发现自己很感激能找到一个不像他那样傲慢、粗鲁和刻薄的射箭伙伴。" : "")) + "");
               if(get_player().masteryLevel(MasteryLib.Bow) < 2)
               {
                  outputText("最后，她仍然证明了她比你强得多，但值得庆幸的是，她并没有在你面前炫耀。你离开时感觉在和她相处的短暂时间里学到了很多东西。");
                  get_player().masteryXP(MasteryLib.Bow,15 + Utils.rand(31));
               }
               else if(get_player().masteryLevel(MasteryLib.Bow) < 4)
               {
                  outputText("最后你给了她一个相当不错的挑战，但很明显你仍然有很多东西需要向她学习。你觉得你从她那里学到了一些很好的技巧和窍门。");
                  get_player().masteryXP(MasteryLib.Bow,5 + Utils.rand(11));
               }
               else
               {
                  outputText("最后，她是对的；你光明正大地击败了她，你不能说你学到了什么新东西，但这很有趣。而且你觉得这次经历让你和她更亲近了。");
               }
            }
         }
         else
         {
            outputText("你告诉她，如果她愿意教你，你也有兴趣学习使用弓箭。她羞涩地笑了笑，拿出她的长弓紧紧抱在怀里，轻轻地抚摸着它。");
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "[say: 相信我，我很乐意，但是……我真的没有多余的给你用，而且这把对我来说非常重要。不是我不信任你，但是……如果它出了什么事，我会崩溃的。抱歉……不过，如果你能在某个地方找到一把，我很乐意帮你学习如何使用它！] " : "[say: 抱歉，不行。我没有备用的，而且我不会让随便什么人碰我的……它对我来说非常重要，如果它出了什么事，我会崩溃的。如果你有自己的，也许我愿意给你一些指导。] ") + "你点点头，为浪费她的时间而道歉。");
         }
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg][say: 等等，] 爱子说道，就在你转身离开之际。[say: " + (get_player().hasKeyItem("Bow") || get_player().hasKeyItem("Kelt\'s Bow") ? "你不会以为训练已经结束了吧？" : "我能想到一些不需要弓的训练……") + "]");
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]不幸的是，你现在应该回营地了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkAkbalAnswer(param1:Boolean) : void
      {
         if(param1)
         {
            outputText("[pg]当你描述" + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718) == "" ? "你是如何杀死那头野兽的" : "他的新形态：一只可爱毛茸茸的小猫" + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718) != "Akbal" ? "名叫[akky]" : "只有名字还能将他与过去的生活联系起来")) + "时，爱子仔细聆听着你的每一个字。他的低语将不再在树林中回荡，不再是恐怖和死亡的预兆。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) == 1)
            {
               outputText("[pg][say: 我本以为我们永远无法解脱，但是……]她环顾四周，也许是以一种新的眼光看待她的家。[say: 如果有人能阻止他，那一定是你。]");
            }
            else
            {
               outputText("[pg][say: 我想相信这一点，[name]。我真的想。]她紧紧握住双手，继续说道。[say: 但阿克巴尔太强大、太狡猾了。他会回来的，我知道。][pg]爱子停顿了一下，似乎陷入了沉思。[say: 虽然最近没人见过他……]");
            }
            saveContent.akbalDone = true;
         }
         else
         {
            outputText("[pg]没关系。虽然你知道他已经走了，但阿克巴尔那敏锐的头脑和隐藏在每个阴影后的锋利爪子带来的威胁，会让她保持警惕。");
            outputText("[pg]不过，你还是有点好奇她为什么这么鄙视他。");
            outputText("[pg][say: " + (get_player().kitsuneScore() >= 4 ? "你感觉不到吗？" : "") + "他就是森林的敌人，就这么简单。我们狐妖在精神上与我们居住的土地紧密相连——阿克巴尔在我们森林中的存在本身就是一种灾难。值得庆幸的是，由于这棵树的存在，他似乎无法太靠近村庄，]她解释道，用拇指指着身后的古树。[say: 玛莱的祝福在森林的这部分很强，我们的神虽然被削弱了，但仍然为我们提供了一些保护，免受腐化的影响。]");
            outputText("[pg]你点点头，花了一点时间消化她的话");
         }
         talkAkbal2();
      }
      
      public function talkAkbal2() : void
      {
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_QUEST_DONE) > 0)
            {
               outputText("[pg][say: 你知道吗，]爱子说着，她的尾巴已经缠绕在你的身体上，柔软的毛发贴着[if (hasfur) {你自己的毛发|你的[skindesc]}]。[say: 这样的英雄事迹如果……没有得到回报，那就太可惜了。]");
            }
            else
            {
               outputText("[pg][say: 抱歉说了这么多沉重的话。]爱子给了你一个歉意的微笑，继续说道。[say: 也许你想……放松一下？]");
            }
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]感谢她抽出时间，你告诉她你必须回去看看你的营地了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkAkbal() : void
      {
         var choice1:Boolean;
         var _g1:AikoScene;
         var choice:Boolean;
         var _g:AikoScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你决定向爱子询问一些当地的动物群。她知道你在这里遇到的恶魔美洲豹吗？");
         outputText("[pg][say: 阿克巴尔，]她几乎是咬牙切齿地吐出这个名字。你甚至能看到她后颈的汗毛因为想到他而竖了起来。[say: 堕落的恶魔人渣，]她紧咬着牙关补充道，声音中带着一种反常的冰冷。[say: 信不信由你，他曾经比现在要糟糕得多。他被一个巫师封印成了那个形态，但不幸的是，由于他的力量过于强大，封印并不完全，于是他变成了今天这副怪物的模样。尽管他现在依然很强大，但也只是曾经的影子罢了，这对世界来说是件好事。我只希望能完成那个巫师未竟的事业。]");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_QUEST_DONE) > 0)
         {
            outputText("[pg]如果你愿意，你可以告诉她你是如何对付阿克巴尔的。");
            menu();
            _g = this;
            choice = true;
            addNextButton("告诉她",function():void
            {
               _g.talkAkbalAnswer(choice);
            });
            _g1 = this;
            choice1 = false;
            addNextButton("不告诉她",function():void
            {
               _g1.talkAkbalAnswer(choice1);
            });
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,17) == 2)
            {
               outputText("[pg]听到她对你的主人说出这样的谎言，你感到很痛苦。他对你一直很慷慨，给了你无数的礼物和关爱。但她还没准备好听真相，所以你咬紧牙关，问她为什么这么鄙视他。");
            }
            else
            {
               outputText("[pg]据你所知，他看起来就像其他掠食性恶魔一样，你很好奇她为什么这么鄙视这个恶魔。");
            }
            outputText("[pg][say: " + (get_player().kitsuneScore() >= 4 ? "你感觉不到吗？" : "") + "他就是森林的敌人，就这么简单。我们狐妖在精神上与我们居住的土地紧密相连——阿克巴尔在我们森林中的存在本身就是一种灾难。值得庆幸的是，由于这棵树的存在，他似乎无法太靠近村庄，]她解释道，用拇指指着身后的古树。[say: 玛莱的祝福在森林的这部分很强，我们的神虽然被削弱了，但仍然为我们提供了一些保护，免受腐化的影响。]");
            outputText("[pg]你点点头，花了一点时间消化她的话");
            talkAkbal2();
         }
      }
      
      public function talkAiko() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉她，如果她不介意的话，你有一些私人的问题想问。");
         outputText("[pg][say: 问吧。不过我可不保证全都会回答，]她回答道，双臂交叉，狡黠地笑着。[pg]你首先问她关于你第一次见到她时发现的那个奇怪的宝珠。那东西对她似乎很重要；它到底有什么特别的意义？[pg]" + (get_player().kitsuneScore() >= 4 ? "[say: 我的宝珠？你自己也是狐妖，难道不知道我们的灵魂容器是怎么运作的吗？]她睁大眼睛说道。你告诉她你忘了它是怎么运作的了。她咯咯地笑了起来，然后像敲门一样调皮地轻轻敲了敲你的额头。[say: 真是健忘，不是吗？呵呵呵。这对我们来说非常重要，让我想想，我该从哪里开始说起呢？[pg]" : "[say: 哦，我的宝珠……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2367) > 0 ? "我以为我已经解释过了？" : "") + "每个狐妖都有一个，]她解释道。[say: 很难向非狐妖解释清楚，但是……让我看看这样说行不行。[pg]") + "宝珠就像一个……灵魂容器。如果有人把它从我们身边拿走，我们与它的联系就会慢慢消失，直到……]她打了个寒颤，停顿了片刻。[say: 这么说吧。宝珠里包含着我们灵魂的一部分……失去与它的联系是……非常痛苦的。]");
         outputText("[pg]她似乎不太愿意详细说明，但你想象着其中的含义，不禁皱起了眉头。你决定换个话题，提起了她的尾巴。");
         outputText("她的尾巴确实很多——比你遇到的其他狐妖都要多" + (get_player().tail.type == 13 && get_player().tail.venom < (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? 7 : 8) ? "，包括你自己" : "") + "。");
         if(get_player().kitsuneScore() >= 4)
         {
            if(get_player().tail.type == 13 && get_player().tail.venom > (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? 7 : 8))
            {
               outputText("[pg][say: 听着，我知道我没有你强。]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "她红着脸移开了视线。" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "爱子嘟囔了一些你听不清的话。" : "爱子瞪着你。")) + "[say: 所以别再拿这事取笑我了。]");
            }
            else
            {
               outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "她点点头。[say: 如果你继续努力，我相信总有一天你会成为" + (get_player().tail.venom == 8 ? "一只" : "一只") + Utils.num2Text(get_player().tail.venom + 1) + "尾狐妖的。]" : "[say: 即使是你这样的人也能提升等级，]爱子叹了口气说道。[say: 尽管我们宁愿你不要这么做。]"));
            }
         }
         else
         {
            outputText("[pg][say: " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2367) > 0 ? "是啊，你忘了吗？" : "") + "那是因为我是" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "八" : "七") + "尾，]她解释道，微笑着顺着她的一条尾巴抚摸着。[say: 我们出生时只有一条尾巴，但随着年龄的增长，我们的魔法和智慧变得更强，它就会分裂。我们拥有的尾巴数量算是一种地位的象征。我的第七条尾巴是在恶魔出现后不久长出来的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "，而我的最后一条尾巴是在我们阻止了我妹妹之后获得的" : "") + "。]");
         }
         outputText("[pg]你停顿了片刻，想知道你的下一个问题是否会太具侮辱性。深吸一口气后，你冒着风险问她，狐妖是不是某种恶魔。");
         if(get_player().kitsuneScore() >= 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) < 50)
            {
               outputText("[pg][say: 你可能是。]她继续说道，目光似乎要看穿你。[say: 但我们其他人不是。]");
            }
            else
            {
               outputText("[pg][say: 嗯，[name]，]爱子说着，从你身边退开。[say: 你有什么想告诉我的吗？]");
               outputText("[pg]你只是好奇。毕竟，你[if (cor > 50) {经常|有时}]会感到这些冲动……");
               outputText("[pg][say: 对、对。这很正常。]她环顾四周，似乎自己也不太确定。[say: 反正我是这么认为的。我们的魔法是由性来驱动的，所以这很自然……]爱子停了下来，显然在仔细斟酌她的措辞。[say: 我们和他们不一样，好吗？别让任何人告诉你不是这样。]");
            }
         }
         else
         {
            outputText("[pg][say: 什么？不！]她脱口而出，然后停下来，平复了一下情绪。[say: 抱歉，抱歉……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2367) > 0 ? "我再解释一遍。这次尽量跟上，好吗？" : "") + "不，我们不是。至少……我们不像[b: 他们]，]她说着，下意识地双臂抱胸，几乎是一种防御性的姿态。[say: 想到这些相似之处，至少可以说让人很不舒服，但这只是我们的天性。我保证，我们并没有任何恶意。我们名声不好，是因为我们的魔法是靠生命能量维持的，而有时我们是从……嗯，性交中获得生命能量的。好吧，如果我实话实说的话，不仅仅是有时。但恶魔们，他们用自己的力量去腐化，他们偷走人们的灵魂，并尽其所能把整个世界变成他们扭曲的游乐场。]");
            outputText("[pg]你理解地点了点头，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "告诉她，你知道她不仅仅是一个寻找慰藉的魅魔，如果你冒犯了她，你很抱歉" : "很高兴知道她不仅仅是一个寻找慰藉的魅魔") + "。她似乎振作了一点，说道：[say: 别担心……我已经习惯了。早在恶魔到来之前，我们的名声就很差了。]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2367,FlagDict_Impl_.arrayReadInt(_loc1_,2367) + 1);
         if(talkAndSex && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            if(get_player().kitsuneScore() >= 4)
            {
               outputText("[pg]你决定暂时结束对话，但爱子在你离开前拦住了你。[say: 刚才的事很抱歉。只是——算了。]她的尾巴在身后紧张地垂下，随着每一次呼吸无力地摆动着。[say: 我很乐意帮你……恢复能量。我是说，如果你想的话。]");
            }
            else
            {
               outputText("[pg]你决定暂时结束对话，但爱子在你离开前拦住了你。[say: 我知道我说过我们不是恶魔，但是……这并不意味着我们没有需求……而且你刚才也问过了。]");
            }
            doNext(aikoSex);
         }
         else
         {
            outputText("[pg]你决定暂时结束对话；你真的该回去看看你的营地了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function submitToAiko() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉她，你只是渴望一点" + (get_player().hasPerk(PerkLib.Masochist) ? "释放" : "虐待") + "，你并不是真的想为此和她打架。[pg]她微微皱起眉头，鼻子稍微皱了皱，咆哮道，[say: 要求女士和你做爱，却不提供一点前戏作为交换，这很粗鲁。][pg]你担心她不会接受拒绝，但谢天谢地，她放下了她的钩镰枪，向你走来[if (hasweapon) {，轻轻地从你手中拿走你的[weapon]并把它扔到一边。}] [say: 但我想这也是没办法的事……]");
         switch(get_player().get_gender())
         {
            case 1:
               doNext(aikoFootjob);
               break;
            case 2:
               doNext(aikoWhipping);
               break;
            case 3:
               doNext(Utils.rand(2) == 0 ? aikoFootjob : aikoWhipping);
               break;
            default:
               outputText("等一下！当你连做爱所需的工具都没有时，我怎么和你做爱？！滚开！");
               doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sparWithAikoWin() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("爱子单膝跪地，气喘吁吁，用弓支撑着身体。尽管她明显在战斗中筋疲力尽，但她还是咧嘴笑得合不拢嘴。");
         outputText("[pg][say: 好吧，我承认，你很厉害，]她说着，坐回去喘口气。[say: 那么，胜者为王……你在想什么？]");
         playerchoice = true;
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2308,FlagDict_Impl_.arrayReadInt(_loc1_,2308) + 1);
         }
         aikoConsSex();
      }
      
      public function sparWithAikoLose(param1:int) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你瘫倒在地，被" + (get_player().get_lust() >= get_player().maxLust() ? "欲望" : "疲惫") + "所淹没。爱子站在你面前，双手叉腰，得意地笑着。[pg][say: 那么，胜者为王……]她说着，咯咯笑着向你走来。");
         playerchoice = false;
         var _loc2_:Array = [];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 60 && param1 >= 60)
         {
            if(get_player().hasCock())
            {
               _loc2_.push(aikoSexMissionary);
               if(get_player().cockThatFits(50) != -1)
               {
                  _loc2_.push(aikoSexDoggy);
               }
               _loc2_.push(aikoSexBJ);
            }
            if(get_player().hasVagina())
            {
               _loc2_.push(aikoSexCunni);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 75 && get_player().hasCock())
            {
               _loc2_.push(aikoSexTailjob);
            }
         }
         if(int(_loc2_.length) > 0)
         {
            doNext(_loc2_[Utils.rand(int(_loc2_.length))]);
         }
         else
         {
            outputText("[pg][say: 仔细想想，我现在真的没心情做那个。拜拜，]她说着，挥了挥手，然后消失在大树后面。");
            if(get_player().hasStatusEffect(StatusEffects.Spar))
            {
               get_player().removeStatusEffect(StatusEffects.Spar);
            }
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function set_aikoCorruption(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2354,Utils.boundInt(0,param1,100));
         return param1;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.akbalDone = false;
      }
      
      public function releaseYamata() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         outputText("[say: 什么！？你要放她走！？] 爱子转过头看着你，睁大了眼睛，她简直不敢相信你刚才说的话。[pg]你告诉她，她已经拿回了宝珠，八岐现在毫无防备。既然她知道了你的实力，她短期内就不会再来找你麻烦了。八岐看起来哑口无言，但随后她咯咯地笑了起来，看着你。[pg][say: 你比看起来要聪明，勇者，也许我会奖励你把我从我妹妹的魔爪中救出来……真遗憾，爱子，看来这次我是赢家，不是吗？][pg][say: 闭嘴！] 爱子松开弓弦，箭矢直奔她姐姐的脸而去，但在击中堕落妖狐之前，八岐化作一团黑暗能量消失了，箭矢穿过了八岐刚才站立的地方。七尾妖狐呆呆地站在那里，脸上写满了愤怒。她咬紧牙关，握紧了拳头。[pg][say: 我……我不敢相信你竟然放她走，[name]！她会回来的！她会回来的，她会再次试图摧毁我们，难道你看不出她有多堕落吗！？] 爱子的愤怒掩盖了一丝悲伤，她清澈的眼睛证明了这一点。你试图去拉她的手臂，但她迅速甩开了你。[say: 在她回来之前……我要成为九尾妖狐，亲手了结她！]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) - 20);
         get_player().dynStats(DynStat.Cor(10));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2370,3);
         doNext(yamataAftermath);
      }
      
      public function postSexUpdate() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 4);
         if(get_player().cor >= 50)
         {
            set_aikoCorruption(get_aikoCorruption() + 4);
         }
         if(get_aikoCorruption() >= 50 && get_player().cor < get_aikoCorruption())
         {
            get_player().dynStats(DynStat.Cor(2));
            set_aikoCorruption(get_aikoCorruption() - 2);
         }
      }
      
      public function postRapeUpdate() : void
      {
         var _loc1_:* = null as IMap;
         if(get_aikoCorruption() >= 50)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 5);
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) - 5);
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2365,FlagDict_Impl_.arrayReadInt(_loc1_,2365) + 1);
         if(get_player().cor < 50)
         {
            get_player().dynStats(DynStat.Cor(5));
         }
         if(get_player().cor > get_aikoCorruption() || get_player().hasPerk(PerkLib.Sadist))
         {
            set_aikoCorruption(get_aikoCorruption() + 12);
         }
         else
         {
            set_aikoCorruption(get_aikoCorruption() + 8);
         }
      }
      
      public function playerJerk() : Boolean
      {
         if(get_player().isPureEnough(50))
         {
            return get_player().hasPerk(PerkLib.Sadist);
         }
         return true;
      }
      
      public function pcWinsDomFight(param1:Boolean) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         if(get_aikoCorruption() >= 50)
         {
            outputText("爱子踉跄了一下，摔倒在地，气喘吁吁。虽然她奋力抵抗，但最后似乎她的肌肉太虚弱了，无法继续下去，她只是瘫倒在地上，用疯狂的目光抬头看着你。");
            outputText("[pg][say: 呃……呵……哈哈……看来你确实知道怎么让女孩开心。也许你毕竟不是个" + get_player().mf("软蛋唱诗班男孩","过气的婊子") + "，]她讽刺地笑着说。[say: 好了，来吧，还是说现在我倒在地上了，你反而怂了不敢做了？]");
            outputText("[pg]即使你知道她只是为了激怒你才这么做的，但她的话还是达到了预期的效果，你突然产生了一种冲动，想教训一下这个消极攻击的婊子。你打算对她做什么？");
         }
         else
         {
            outputText("爱子单膝跪地，气喘吁吁地用弓支撑着自己。她鼓起最后的一丝意志力，瞄准了最后一支箭并射了出去，但她的力量显然已经耗尽——那支箭像喝醉的黄蜂一样在空中划过，偏离了目标，撞在树干上发出咔哒声。");
            outputText("[pg][say: 你……你打算做什么？]她喘着气说，随着长弓从她身下消失，她瘫倒在地。[pg]这是个好问题。她现在任你摆布，所以你几乎可以对她做任何你想做的事。" + (!get_player().isPureEnough(60) ? " 当你想到要教训这个惹恼你的小婊子时，你的脸上浮现出一丝邪恶的冷笑。" : "") + " 你会强奸她吗？如果是，你会怎么做？");
         }
         aikoRapeSex();
      }
      
      public function pcLosesDomFight(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:Boolean = false;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as String;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         if(get_aikoCorruption() >= 50)
         {
            _loc3_ = Utils.rand(int(get_player().cocks.length));
            outputText("你倒在地上，屈服于这只疯狂狐狸的力量。爱子带着露齿的笑容和眼中闪烁的疯狂光芒走近，开始脱衣服，任由衣服随意掉落在地。她一只脚踩在你的胸口，把你推倒，当你向后倒在地上时，她给了你一个得意的冷笑。");
            outputText("[pg]伴随着指关节的咔咔声，她开始有条不紊地撕扯你身上的[armor]，让你赤身裸体，完全暴露在她的怒火之下。你太虚弱了，无法抵抗她的侵犯，只能被迫看着她俯下身跨坐在你身上，用指甲在你的[chest]上抓挠。这种感觉既痛苦又令人兴奋，当她的指甲留下一系列深深的、迅速变红的抓痕时，你的喉咙里发出一声小小的呻吟。");
            outputText("[pg][say: 当你是那个挨操的婊子时，就没那么好玩了，对吧？]她用一种比尖叫更令人不安的平静语气说道。");
            outputText("[pg]她继续在你的身体上肆意妄为，指甲轻轻划过你裸露的肌肤。她向前倾身，用力捏住你的[ear]，让你感到一阵疼痛，然后低语道：[say: 我会好好享受这个的。]");
            outputText("[pg]当她用力拉扯你的耳朵时，你痛苦地皱起眉头，随后当你感觉到她那纤细却出奇有力的手指慢慢缠绕在你的气管上时，你开始大口喘气。她倾身向前，撅起嘴唇，强行给了你一个深沉而完全不对劲的吻，在慢慢呼气的同时用舌头侵犯你的口腔。甘草那苦甜参半的毒药味充满了你的喉咙，你能慢慢感觉到自己屈服于她折磨带来的快感中，随着她那堕落的火焰在你的身体里蔓延，你的伤口开始隐隐作痛。");
            outputText("[pg]突然间，你在她手中变得像橡皮泥一样任人揉捏。你知道你会做任何事，只为了感受爱子那美妙的残忍所带来的甜蜜释放……只为了再多一刻那甜蜜的折磨。");
            _loc4_ = get_player().hasPerk(PerkLib.Masochist) ? "高兴" : "恐惧";
            _loc5_ = get_player().hasCock() ? "缠绕在你的[cocks]上" : "";
            _loc6_ = get_player().hasVagina() && get_player().hasCock();
            _loc7_ = get_player().hasVagina() ? "开始用它们那毛茸茸的瓶刷状尖端挑逗你的[clit]" : "";
            outputText("[pg]令你感到" + _loc4_ + "的是，你那狐狸般的女王双手紧紧掐住你的脖子，向你施压。你窒息着，虚弱地挣扎，随着视线开始变暗，你抬头看着她那报复性的笑容。在意识的边缘，你能感觉到爱子的尾巴慢慢向你的腹股沟滑去，" + _loc5_ + (_loc6_ ? "并且" : "") + _loc7_ + "。");
            _loc8_ = get_player().hasCock() ? "在你的[cocks]上下套弄" : "";
            _loc9_ = get_player().hasVagina() && get_player().hasCock();
            _loc10_ = get_player().hasVagina() ? "插入你的[vagina]。最糟糕的是，这感觉太棒了" : "";
            outputText("[pg]当她的双手稍微松开，刚好把你从边缘拉回来时，你猛烈地喘息着，让肺部充满甜美清新的空气，就在这一刻，她开始抽动她的尾巴" + _loc8_ + (_loc9_ ? "并且" : "") + _loc10_ + "，这种感觉的结合让你突飞猛进地走向高潮，而爱子则嘲笑着你在她身下那可悲的挣扎。");
            get_player().cuntChange(5,true,true,false);
            outputText("[pg][say: 哦，愚蠢的[name]……你以为我会掐死你吗？]她说着，再次压迫你的气管并舔了舔嘴唇。[say: 我不会杀你的，小甜心……但你肯定不会以为我会让你这么容易就解脱吧？那可一点都不好玩。]");
            outputText("[pg]你的大脑在抗议中尖叫，你的臀部在她身下虚弱地扭动，渴望着那根本不会到来的高潮。每次她把你推向边缘，她都会退缩，迫使你忍受同时处于意识和高潮边缘的极乐痛苦。");
            if(get_player().hasCock())
            {
               outputText("[pg]当你的视线再次变暗时，你能感觉到爱子湿透的小穴紧贴着你的[cock " + (_loc3_ + 1) + "]的顶端，用它们那光滑的深处挑逗着你。那柔软温暖的嘴唇在你的龟头周围诱人地扩张，伴随着突然的下沉，她骑上了你的阴茎，" + (get_player().hasKnot(_loc3_) ? "小心翼翼地不让你的肉结滑进去，" : "") + "紧紧地挤压着！");
            }
            if(get_player().hasVagina())
            {
               outputText("[pg]在你[vagina]里的尾巴加倍努力，无情地捣弄着你，而爱子的快感也开始沸腾。");
            }
            outputText("[pg]她的双手突然完全松开了对你喉咙的控制，当你嘶哑地让肺部充满甜美奇妙的新鲜空气时，你的身体被一阵巨大的高潮所折磨，让你从头到脚陷入疯狂。爱子的尾巴因快感而卷曲，她似乎与你同步了，在乘着自己高潮的浪潮时，双手抓挠着自己的身体。" + (get_player().cumQ() > 350 && get_player().hasCock() ? "随着你的高潮持续时间比平时更长，她的腹部因精液而肿胀，这是她让你经历的奇怪窒息play的副作用。" : ""));
            outputText("[pg]从令人愉悦的折磨中解脱出来，终于能够达到高潮，你气喘吁吁地躺在地上，大口喘气，而爱子慢慢从你身上下来" + (get_player().cumQ() > 350 && get_player().hasCock() ? "，让积蓄的精液喷涌而出，覆盖你的下半身" : "") + "。在你因精疲力竭而昏过去之前，你最后看到的是她捡起长袍的画面。");
            if(get_player().hasCock())
            {
               get_player().orgasm("Dick");
            }
            if(get_player().hasVagina())
            {
               get_player().orgasm("vagina");
            }
         }
         else
         {
            outputText("你瘫倒在地上，被你的" + (get_player().get_lust() >= get_player().maxLust() ? "欲望" : "伤口") + "所克服。爱子站在你上方片刻，低声念着咒语，你看着她将前两根手指指向你的额头，随后世界陷入黑暗。[pg]");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leave() : void
      {
         get_player().removeStatusEffect(StatusEffects.Spar);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            get_camp().returnToCampUseOneHour();
         }
      }
      
      public function killYamata() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         if(get_player().get_weapon().isFirearm())
         {
            outputText("你眯起眼睛，举起你的[weapon]对准被打败的堕落妖狐，爱子和八岐都惊讶地睁大了眼睛。然后你冷酷地直接向八岐的胸口开了一枪，刺穿了她的心脏");
         }
         else if(get_player().get_weapon().isChanneling())
         {
            outputText("你举起你的[weapon]，释放出一股巨大的魔法冲击波，吞没了八岐，烧焦了她的血肉。爱子惊讶地叫了一声，震惊地看着你");
         }
         else if(get_player().get_weapon().isStabby())
         {
            outputText("你眯起眼睛，冲向被击败的堕落狐妖，爱子和八岐都惊讶地睁大了眼睛。然后你冷酷地一剑刺穿了战败对手的心脏");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你挥舞着[weapon]，粉碎了被击败的对手的胸腔");
         }
         else
         {
            outputText("你眯起眼睛，举起[weapon]对准被击败的堕落狐妖，爱子和八岐都惊讶地睁大了眼睛。然后你冷酷地抓住她的下巴和后脑勺，猛地一扭，扭断了她的脖子");
         }
         outputText("。八岐咳出一口鲜血，嘟囔着最后一句辱骂，然后倒在地上，死了。你松了一口气，放下[weapon]，转身看向爱子。");
         outputText("[pg]还没等你有所动作，这只七尾狐妖就跳到你面前，紧紧地抱住了你。你微笑着回抱你的狐妖恋人，温柔地抚摸着她的头发。过了一会儿，她稍微退开一点，给了你一个漫长而温柔的吻。[say:结束了……我本来想亲手解决她的，但谁知道呢，她可能还有别的花招……]她在你怀里放松下来，看着你的脸，脸上带着温柔的微笑和红晕。[saystart]谢谢你，[name]……如果不是你……我早就死了。");
         outputText("[pg]所以……我需要变得更强。我需要成为九尾！[sayend]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2370,1);
         doNext(yamataAftermath);
      }
      
      public function get_debugName() : String
      {
         return "Aiko";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function get_aikoCorruption() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2354);
      }
      
      public function fuckYamata() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         outputText("操八岐的占位符[pg]");
         menu();
         addButton(0,"放她走",releaseYamata).hint("放八岐走，相信她不会再伤害任何人。");
         addButton(1,"爱子动手",aikoKillSister).hint("应该由爱子来决定怎么处置八岐。");
         addButton(2,"了结她",killYamata).hint("八岐已经造成了足够的痛苦和苦难，现在就了结她！");
      }
      
      public function execEncounter() : void
      {
         encounterAiko();
      }
      
      public function encounterName() : String
      {
         return "Aiko";
      }
      
      public function encounterChance() : Number
      {
         return 0.35;
      }
      
      public function encounterAiko() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         get_images().showImage("aiko-intro");
         spriteSelect(SpriteDb.get_s_aiko());
         talkAndSex = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2356,50);
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2353,FlagDict_Impl_.arrayReadInt(_loc1_,2353) + 1);
         get_images().showImage("Aiko-intro");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1)
         {
            outputText("当你向森林深处走去时，感觉茂密的枝叶似乎离你越来越近，头顶厚厚的树冠仿佛要遮蔽天空。借着透过树叶洒落的微弱光线，你可以看到你一直沿着走的粗糙土路在前方几乎消失殆尽，正处于被这片未开化的荒野重新吞噬的晚期阶段。");
            outputText("[pg]无论你身在何处，你确信自己以前从未探索过这里。虽然你对这片土地的危险保持警惕，但你很好奇森林的这一部分可能隐藏着什么秘密。你继续前进，跋涉在杂草丛生的小径上，在向黑暗中进发时，尽力保持头脑清醒。");
            outputText("[pg]正当你考虑原路返回时，你看到前方某处传来微弱的光。你在灌木丛中跌跌撞撞地走着，找到了光源——在你面前矗立着一棵巨大的、看起来很古老的树，树叶间跳跃着一缕缕蓝色的火焰，树根处挂着一块饱经风霜的旧牌子。牌子上的字迹已经剥落褪色，但剩下的少数几个还能辨认的字符似乎是用一种奇怪的语言写成的。");
            outputText("[pg]你转过身，准备原路返回，却发现来时的路已经消失了！当你听到森林中回荡着幽灵般的女性笑声，听起来仿佛来自你的四面八方时，你不由自主地打了个寒颤。");
            outputText("[pg]你跑进灌木丛，寻找那条小路，却突然发现自己又跌跌撞撞地回到了空地上。你想知道自己怎么会被转得这么晕，于是你又走回森林，转悠了几分钟后再次出现在空地上，当你再次看到那棵幽灵般的树隐约出现在你面前时，你停下了脚步。");
            outputText("[pg]其中一朵苍白的火焰从火群中分离出来，轻轻飘落，悬浮在你的脸前。它在你的手臂周围跳跃，让你的四肢感到一阵凉爽的刺痛，然后飞走，消失在树干后面。你跟着它，绕着树追逐，却被一根裸露的树根绊倒了。当你站起来，温柔地揉着下巴时，你注意到树洞里放着一个没有特征的白色小球，你好奇地伸手去抓它。");
            outputText("[pg]空地突然沐浴在耀眼的闪光中，迫使你遮住眼睛。当你再次睁开眼睛时，你看到一个巨大无比的怪物从灌木丛中出现，它的体型太大了，根本不可能藏在那里。一个巨人！你不能确定，但你估计它至少有五十英尺高，从头到脚都穿着颜色鲜艳的金属盔甲。");
            outputText("[pg]你准备好你的[weapon]，想知道你怎么可能和这么巨大的东西战斗，因为巨人发光的绿色眼睛锁定了你。它抬起巨大的装甲脚，你闭上眼睛，利用你剩下的最后几分钟来反思你的一生，然后被这个不可思议的存在的脚跟压碎。[pg]当即将到来的死亡从未降临时，你睁开眼睛，惊讶地向后退了一点，因为现在站在你面前的不是一个50英尺高的装甲怪物，而是一个美丽的女人，留着一头银金色的短发，被一对巨大的三角形耳朵分开。她穿着一套暴露的蓝白相间的长袍，展现出她少女般的曲线，她的乳房被一块布紧紧地裹在胸前。淡蓝色的火焰在她周围跳跃，在她的脸上投下怪异的光芒，你可以看到她的脸上有一些红色的印记，她的嘴唇卷曲成一个永远的假笑。在她的身后，七条毛茸茸的狐狸尾巴随着一种听不见的旋律来回摇摆。[pg][say:你真该看看你刚才的表情！]她笑着对你说。[say:你真的以为你要被压碎了，不是吗？][pg]你发现自己无言以对，嘴巴张得大大的。[pg]狐耳女人咯咯地笑着走到你面前，用食指推起你的下巴，绕着你走，好像在打量你。[say:嗯……我已经很久没在这里看到新人了，]她说着，慢慢地点了点头。[say:你一定就是大家都在谈论的那个人。]");
            outputText("[pg]大家？她在说什么？最后，你回过神来，问她是谁，那个巨人刚才发生了什么事。[pg]");
            if(get_player().kitsuneScore() < 4)
            {
               outputText("[say:我是爱子，这片森林的守护者。你闯入了妖狐的领地。你没看到牌子吗？][pg]你向她解释说你看不懂牌子，但即使你试图离开，你最终还是会被一次又一次地转回来。[pg][say:哦。对……]爱子说着，装出一副无辜的样子。[say:我能说什么呢，我就是忍不住！就像我说的，你是我很长一段时间以来看到的第一个新人。当你唯一的伙伴是一棵树时，能找到的乐趣是有限的。那么，新人，我已经告诉你我的名字了，你为什么不告诉我你的名字呢？][pg]你告诉了她你的名字，有些欣慰地发现这片森林里还有另一个居民，她对你的兴趣不仅仅是把你打得屈服然后强奸你——至少到目前为止是这样。[pg][say:[name]，是吗？好吧，[name]，把我的球还给我，对你来说是不是太麻烦了？]她指着你手里的白球说。你对简单地接受任何表面价值持谨慎态度，你问她为什么这对她如此重要，以及她在这片荒野中到底在守护什么。[pg][say:作为我氏族选定的守护者，保护这片森林和所有居住在其中的妖狐是我的职责，]她解释说，环顾四周。[say:这听起来并不像听起来那么迷人，]她向你保证，[say:我主要只是用我的幻觉来吓跑小恶魔和其他恶魔害虫。还有游客。就像你一样！][pg]你对被称为“游客”感到有些恼火，" + (get_player().cor > 20 ? "并带着轻微的皱眉告诉她，" : "") + " 但你" + (get_player().cor <= 20 ? "礼貌地" : "") + "点了点头，现在明白那个巨人只是这个女孩施展的幻觉。[pg][say:当然，必要时我也不怕动粗。所以告诉我，[name]，我需要动粗吗？]");
            }
            else if(get_player().isNineTails())
            {
               outputText("[say:我是爱子，这片森林的守……]她突然停了下来，睁大了眼睛，注意到了你身后那九条摇摆的尾巴。她咬紧牙关，立刻跪倒在地，咬着下唇，让你大惑不解。[say:请接受我最深切的歉意！我……我没想到您是九尾，我的[lord]！我非常抱歉！][pg]你困惑地揉了揉你的[hair]，无言以对。过了一会儿，你回想起九尾妖狐应该是妖狐一族中的贵族，但你给了她一个顽皮的微笑，告诉她不要担心，因为这是你们第一次见面，并向她伸出了一只手。[pg]她尴尬地垂下耳朵，接受了你的帮助，紧张地摆动着她那七条摇摆的尾巴。[say:我-我只是忍不住想和新人玩，但既然你中了我的恶作剧，我还以为你是某种用尾巴变戏法的幻术师呢！]她发出一阵非常紧张的笑声，成功地试图掩饰她尴尬的红晕。[say:我的名字是爱子，这片森林的守护者。我的村子没有通知我有一位九尾要来拜访我们……我能问一下您的名字吗，我的" + get_player().mf("lord","lady") + "][pg]你平静地告诉她你的名字，她是一个非常有趣的家伙，至少她没有像玛瑞斯的一半人那样试图强奸你。你补充说，你最近才成为一只九尾妖狐，你还在学习他们的文化，告诉她不应该这么正式。[pg][say:" + get_player().mf("Lord","Lady") + " [name]……不……[name]……这可能有点突然……但我能请你把我的球还给我吗？你知道这对我们有多重要，可能你自己也有一个。]在你告诉她不要担心礼节之后，她似乎放松多了。[pg][say:即使我很强，我也不知道我是否能比得上我们神的高级" + get_player().mf("Priest","Priestess") + "的力量……但如果我必须这样做，我可能会变得非常粗暴……所以告诉我，[name]，我需要动粗吗？]");
            }
            else
            {
               outputText("[say:我是爱子，这片森林的守护者。我看出你是我的同类，但你不是我们村的。那么，其他氏族还没有受到腐化的影响吗？][pg]你平静地解释说，你最近才通过潜伏在玛瑞斯的魔法成为了一只妖狐。她调皮地点了点头，轻声笑了起来。[say:我就是忍不住，骗你太容易了，如果你想成为一只成熟的妖狐，你需要改进！]她带着顽皮的笑容说，你忍不住为此感到有点尴尬。[pg][say:不管怎样，你叫什么名字，妖狐同胞？自从恶魔来了之后，我们就不常有访客了，]她问道，双臂交叉抱在她那对摇晃的大乳房下。[pg]你告诉了她你的名字，有些欣慰地发现这个世界上还有另一个居民，她对你的兴趣不仅仅是把你打得屈服然后强奸你——至少，到目前为止是这样。[pg][say:[name]，是吗？好吧，[name]，把我的球还给我，对你来说是不是太麻烦了？你知道这对我们有多重要，因为你是我的同类。]你知道这个球对妖狐有多重要，但在你做出决定之前，她打断了你[say:当然，必要时我也不怕动粗。所以告诉我，[name]，我需要动粗吗？]");
            }
            menu();
            addButton(0,"是",aikoAggroGreeting).hint("我想留着这个球！");
            addButton(1,"否",aikoPeaceGreeeting).hint("不想和这个可爱的狐狸女孩打架。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2363) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 3 && get_silly() && get_aikoCorruption() < 50 && Utils.rand(15) == 0)
         {
            outputText("当你走在森林深处一条看起来很熟悉的杂草丛生的小径上时，你突然停下脚步，举起一只手放在耳边。声音很微弱，但你能听到战斗的声音在树林中回荡。");
            outputText("[pg]准备好你的[weapon]，你决定去调查一下。声音把你引向那棵古树矗立的空地，当你从灌木丛中出现时，你不得不低下头，以避免被一颗灼热的蓝色火焰导弹击中。");
            outputText("[pg]占据空地的是你见过的最大的触手怪！它一定有你在树林里看到的那些漫步的触手怪的十倍大，但值得庆幸的是，它的注意力似乎集中在别处。爱子正与这个长满植物的怪物交战，一箭又一箭地射入它长满树叶的肉体，在它可怕的触手之间躲闪，并抓住每一个机会向它发射燃烧的导弹。");
            outputText("[pg]蓝色的抛射物在撞击时爆炸，使野兽蹒跚而行，让爱子有足够的时间准备致命一击。在你的眼前，她平常的长袍变成了一件长长的斗篷，上面印着一个燃烧的头骨，她的眼睛被一副带有红色镜片的奇怪眼镜遮住了。");
            outputText("[pg][say:别小看我！你以为我是谁！？]她大喊着，不知为何举起手臂指向天空。当爱子凭空拔出一个巨大的钻头时，你的表情变得完全困惑！");
            outputText("[pg]不知怎的，这个娇小的姑娘不仅举起了那荒谬的装置，还一头扎进了那只惊呆了的触手怪身上！钻头卡在了那只蹒跚的怪物身上，突然间，整个世界仿佛进入了慢动作。时间慢得像蜗牛在爬，爱子转过身，开始平静地大步离开那只还活着的生物，当她摘下墨镜时，她的新披风戏剧性地在周围飘扬。在她的身后，巨大的触手怪突然被巨大的爆炸吞没，一道火柱盘旋升空，直冲云霄。");
            outputText("[pg]这有点夸张，但你不得不承认，她看都不看一眼的样子还挺酷的。");
            outputText("[pg]当触手怪变成一堆冒着烟的焦炭时，爱子仍然没有注意到你的存在，开始跳起了一段小小的胜利之舞。");
            outputText("[pg][say: 欧耶，嗯哼，我很坏，今天是我的生日！]她一边唱着，一边抛开伪装，在身前转着圈挥舞着拳头。她就这样持续了一段时间，摇晃着臀部，在越来越荒谬的舞蹈中跳来跳去，只要没人打扰她，她就会一直跳下去。");
            outputText("[pg]你开始怀疑她的炫耀到底会有多荒谬，直到你终于忍不住笑出声来，这才让爱子注意到了你的存在。她在“机械舞”的半空中僵住了，慢慢转过头看着你，脸上写满了极度的恐惧和尴尬。");
            outputText("[pg][say: 你……你在这里多久了……我，呃……我炉子没关，拜拜！！]");
            outputText("[pg]还没等你再说一句话，她就冲进了森林，试图掩盖她脸上深红色的红晕。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2363,FlagDict_Impl_.arrayReadInt(_loc1_,2363) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 2)
         {
            outputText("当你深入森林探索时，你有一种模糊的似曾相识的感觉。你无法确定，但你觉得你以前来过这里……更奇怪的是，你感觉自己正在被监视。你试图摆脱这种感觉，继续在小径上走着，但你的后颈继续因为一种挥之不去的怀疑而刺痛，你开始屈服于偏执，紧张地回头看。");
            outputText("[pg]当你听到附近一棵树的树叶沙沙作响时，你几乎要从[skin]里跳出来，你摆出防御姿势，准备好你的[weapon]。一道银光划过你的视野，一个毛茸茸的小东西从树枝上飞奔而下，穿过森林。[pg]" + (get_player().dogScore() >= 4 ? "你的犬类追逐本能压倒了你之前的偏执情绪，你一头扎进" : "你起初犹豫了一下，但随后决定追上去，冲进") + " 灌木丛追赶它。[pg]你出现在一个由一棵熟悉的、看起来很古老的树主导的空地上，正好看到一只长着闪亮银色皮毛的野生小狐狸。它盯着你，似乎带着一种超越普通野兽的 " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 55 ? "喜爱" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 50 ? "熟悉" : "蔑视")) + " 的神情看着你。当你注意到这只狐狸最引人注目的特征时，你终于恍然大悟——它的眼睛是美丽的清澈蓝色，而且它不仅有一条，而是有七条美丽的尾巴。[pg]在你的眼前，爱子变成了她的人形，丝滑的皮毛让位于裸露的肌肤和舒适的衣服。变形完成后，她轻轻地整理了一下长袍，让它们整齐地挂在她可爱、整洁的女性特征上。[pg][say: 我很惊讶你竟然能再次找到这个地方，]她完成她简短的仪式后说道，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2361) > 0 ? "微笑着" : "怒视着") + " 看着你。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 55)
            {
               outputText("[say: 令人愉快的惊喜，]她补充道，她的表情变得柔和而深情。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2359) == 6 ? "[say: 我其实一直希望你能找回这里……]" : "") + "[pg]她开始向你走来，走路时轻轻摇摆。[say: 我想再次感谢你归还我的球……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2359) == 6 ? " 尤其是……为了你做的其他事情，]她带着一丝红晕说道" : "]她说道") + "。[say: 大多数人可能不会那么好心。][pg]你承认她可能有道理；在你在片这片陌生土地上旅行时遇到的无数次遭遇中，绝大多数都远不如这次文明。她的语气开始转向一种更顽皮、更喧闹的态度，她问道，[say: 那么，是什么风把你吹回这里了？]");
               menu();
               addButton(0,"交谈",aikoTalkE2).hint("和狐狸女孩交谈。");
               addButton(1,"做爱",aikoSexE2).hint("和狐狸爱子共度欢乐时光！");
               addButton(2,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
               addButton(14,"离开",leave).hint("离开空地");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 50)
            {
               outputText("[say: 那么，你喜欢你的“礼物”吗？]她窃笑着说，几乎掩饰不住灿烂的笑容。你面无表情地看着她，鼓起你最好的死鱼眼，回答说你遇到过更好的。[pg][say: 哦，别那么严肃，]她反驳道，对你吐了吐舌头，假笑着。[say: 只是一个小小的无害的玩笑而已。][pg]你很快提醒她，这是以你为代价的，你愤怒地交叉着双臂。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2359) == 3 ? "你不得不承认，性爱很棒——你只是希望没有那些不想要的副作用。" : "") + " 你想进一步追究她诡计的话题，但爱子在你开口之前迅速转移了话题。[pg][say: 那么是什么风把你吹回这里了？我希望你不是指望再来一次免费的，因为我已经把我的球移到了一个新的藏身之处。虽然……也——许如果你好好求我的话……]她的声音越来越小，给了你一个可爱的假笑，双手在背后交叉，身体前倾，让你很好地看到了她丰满的胸部。");
               menu();
               addButton(0,"交谈",aikoTalkE2).hint("和狐狸女孩交谈。");
               addButton(1,"做爱",aikoSexE2).hint("和狐狸爱子共度欢乐时光！");
               addButton(2,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
               addButton(14,"离开",leave).hint("离开空地");
            }
            else
            {
               outputText("[say: 你胆子不小，还敢在这里露面，]她冷冷地说，她的弓凭空出现。[say: 我希望你这次没指望" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2362) == 1 ? "再被放一马" : "被放一马") + "；我已经把我的宝珠藏在别处了，所以你别想再拿它当人质。][pg]" + (!get_player().isPureEnough(50) ? "她又在提那个破宝珠了。" : "") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2362) > 0 ? "你告诉她，对于一个上次输得那么惨的人来说，她似乎有点太自以为是了。" + (get_silly() ? "你建议她，也许她应该在——引用你的原话——自取灭亡之前，先掂量掂量自己。" : "") : "在上次获胜后，她似乎很自信能再次击败你。") + "当她毫不退缩地盯着你时，你几乎能感觉到她眼中射出的匕首，看起来她几乎迫不及待地想让你给她一个理由，松开那支指着你的箭。[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2362) > 0 ? "[say: 该你出招了。]" : "[say: 那么，你是打算和平离开，还是我们再来一次硬碰硬？]"));
               menu();
               addButton(0,"道歉",aikoApologize1).hint("向爱子道歉，因为你之前攻击了她。");
               addButton(1,"做爱",aikoSexE2).hint("和狐狸爱子共度欢乐时光！");
               addButton(2,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
               addButton(14,"离开",leave).hint("离开空地");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 3)
         {
            outputText("你走进那片熟悉的空地，古树依然矗立在那里，你看到狐妖祭司爱子正在练习射箭。她还没有注意到你的靠近，从箭袋里抽出一支新箭，射出一道划破空气的弧线。你可以看到她的目标似乎是钉在树干上的几块羊皮纸，眯起眼睛，你认出最近的那块上面似乎画着一幅粗糙的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "牛头人" : "你！") + "[pg]她的箭一支接一支地射中目标，保持着非常密集的落点。" + (!get_player().hasMastery(MasteryLib.Bow) ? "她相当厉害！" : (get_player().masteryLevel(MasteryLib.Bow) < 4 ? "她相当厉害，" + (get_player().hasStatusEffect(StatusEffects.Kelt) ? "虽然可能不如凯尔特。不过，你也许能从她那里学到一两招，而且她可能比那个傲慢的半人马更适合做伴。" : "你也许能从她那里学到一两招。至少，这比你一个人练习要有趣得多。") : "她相当厉害，但不如" + (get_player().hasStatusEffect(StatusEffects.Kelt) ? "凯尔特或你自己" : "你") + "。她也许是个不错的练习伙伴，但你可能学不到什么新东西。")) + "[pg]最后，你清了清嗓子，她猛地转过身来，原本要射出的箭现在对准了你！" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "当她认出是你时，她放松了下来，慢慢松开拉满的弓，将武器从你的胸前移开。" : "当她看到是你时，她厌恶地咆哮着，武器一直对准着你。") + "[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               outputText("[say: 哦，[name]！我只是在练习……抱歉，呃，关于箭的事，]她说着，轻轻地用箭杆敲打着她的弓。[say: 你吓到我了，仅此而已。]");
               outputText("[pg]你告诉她没关系，你理解——小心驶得万年船。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2365) < 1)
               {
                  outputText("她笑了笑，收起弓，高兴地向你走来。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "她咧嘴一笑，双臂搂住你的肩膀，在你的脸颊上亲了一下，然后退后一步和你说话。" : "") + "[pg][say: 是什么风又把你吹来了？]");
                  menu();
                  addButton(0,"交谈",aikoTalkE3).hint("和狐狸女孩聊天。");
                  addButton(1,"做爱",aikoSex).hint("和狐狸女孩爱子共度欢乐时光！");
                  addButton(2,"切磋",aikoSpar).hint("进行一些友好的切磋。");
                  addButton(3,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
                  addButton(14,"离开",leave).hint("离开空地");
               }
               else
               {
                  outputText("她点点头，但似乎不安地从你身边退缩。你注意到她还没有收起弓，尽管它不再指向你了。");
                  outputText("[pg][say: 你……你不会又想强暴我吧？]她满怀希望地看着你说。" + (get_player().isPureEnough(50) ? "她的问题刺痛了你的良心，而她天真的表情让这变得更糟。她非常想喜欢你——你可以从她的眼睛里看出来。" : "") + "");
                  outputText("[pg]那么，你打算怎么做？");
                  menu();
                  addButton(0,"交谈",aikoTalkE3).hint("和狐狸女孩聊天。");
                  addButton(1,"做爱",aikoSex).hint("和狐狸女孩爱子共度欢乐时光！");
                  addButton(2,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
                  addButton(14,"离开",leave).hint("离开空地");
               }
            }
            else
            {
               outputText("[say: 你就是听不懂暗示，是吧？！]她眯起眼睛，低吼道。[pg][say: 你到底跑回来干什么？]");
               menu();
               addButton(0,"交谈",aikoTalkE3).hint("和狐狸女孩聊天。");
               addButton(1,"做爱",aikoSex).hint("和狐狸女孩爱子共度欢乐时光！");
               addButton(2,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
               addButton(14,"离开",leave).hint("离开空地");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2371) == 0)
         {
            outputText("当你走进发光的深林时，你想起还有事要和爱子谈谈，她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) < 3 ? "很高兴噩梦终于结束了" : "对你放走她姐姐感到非常生气") + "。[pg]你穿过灌木丛，察觉到了一股熟悉的气息。你背靠着一棵树，看到一团蓝色的火焰正向你飘来。紧接着，火焰炸开，爱子在你面前现身。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) < 3 ? "看到你她非常高兴" : "她看起来有些苦涩。") + "[pg][say: 嘿，[name]……我……我想再次感谢你在下面的帮忙……我作为一个守护者很失败，阻止八岐进入村子是我的责任，但我被算计了……别担心，我不会让这种事再发生了。看这里。]她庄重地说着，伸出了她的尾巴。你惊讶地发现，她多了一条尾巴。[pg]你微笑着祝贺这位现在拥有八条尾巴的狐狸，而她则试图掩饰脸上深红的红晕。她似乎真的下定决心要成为九尾狐，你也很高兴她正在将这变成现实。剩下的时间里，你和你的狐狸女孩愉快地聊着天。[pg][say: 回头见，[name]。]她在你脸颊上飞快地啄了一下，然后放你离开。看着她匆匆离去的背影，你注意到她臀部依然系着八岐的村正武士刀。那把刀依然强大，但爱子似乎还没有受到影响。不过，她的魔法确实变得非常强大。尽管如此，你还是很担心，从现在起你最好多留意她的状态，以免她像她同父异母的姐姐一样被腐化。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2371,1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) == 0 && softLevelMin(25) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 90 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2369) > 0)
            {
               if(get_aikoCorruption() < 50)
               {
                  outputText("当你回到古树时，你呼唤着爱子。你发现她坐在树根处，双臂抱着膝盖。看起来她已经在那个地方待了很长一段时间，她脸颊的红晕表明她又哭过了。当你靠近时，她满怀希望地抬起头问道：[say: [name]，你回来了！请告诉我你现在准备好出发了……]");
                  menu();
                  addButton(0,"交谈",yamataTalk).hint("向爱子询问更多关于八岐的信息。");
                  addButton(1,"现在出发",yamataStart).hint("和爱子一起去对付八岐，阻止她的疯狂！");
                  addButton(2,"准备",yamataPrepare).hint("回家准备一下，这将是一场非常艰难的战斗！");
               }
               else
               {
                  outputText("当你进入古树的空地时，你呼唤着爱子。看样子，她又在愤怒地砍树根处的树皮了，而这棵树显然承受不住。它的树叶已经开始腐烂，很明显它已经奄奄一息了。它可能无法在这样的摧残下存活下来。[say: 终于来了！你最好准备好出发了。]");
                  outputText("[pg]如果你觉得自己已经准备好面对爱子同父异母的姐姐，你可以现在就去，或者你可以告诉她你还需要时间准备。也许你可以向她追问更多信息，以防万一。");
                  menu();
                  addButton(0,"交谈",yamataTalk).hint("向爱子询问更多关于八岐的信息。");
                  addButton(1,"现在出发",yamataStart).hint("和爱子一起去对付八岐，阻止她的疯狂！");
                  addButton(2,"准备",yamataPrepare).hint("回家准备一下，这将是一场非常艰难的战斗！");
               }
            }
            else if(get_aikoCorruption() < 50)
            {
               outputText("当你走进熟悉的空地寻找爱子时，你听到了微弱的抽泣声。出于好奇，你绕过树干，发现爱子瘫倒在树旁，双膝跪地，对着袖子无法控制地哭泣。你抓住她的肩膀，问她怎么了，她用泪汪汪的冰蓝色眼睛看着你，用长袍擦了擦脸，试图让自己看起来体面一点。");
               outputText("[pg][say: [name]，是……是我的宝珠！我-我不知道她-她是怎么找到它的，但-但是……][pg]你紧紧抓住她的肩膀，告诉她冷静下来，控制好自己，她点点头，深吸了一口气，试图控制住自己的抽泣，以便能说出一句连贯的话。[pg][say: 我-我的姐姐，八岐……嗯，同父异母的姐姐……她……她找到了我的宝珠。][pg]你稍微松开手，问为什么另一只狐狸找到她的宝珠是件这么严重的事。[pg][say: 这非常严重！]她说道，几乎又要歇斯底里了，她咬着嘴唇，又挤出几滴眼泪，然后才平静下来。[say: 她几年前就被逐出村子了……但是……我从没想过……[name]，她被腐化了！][pg]你点点头，现在明白了。[pg][say: 她已经吸走了我宝珠里的大部分力量……时间每过去一分钟，我都能感觉到我与它的联系在减弱……我……我失败了……她已经先进入村子了……谁知道她会对大家做些什么……我作为一个保护者失败了，]她说道，声音几乎降到了耳语，绝望地抱着头。[pg]胡说八道！你把她扶起来，紧紧地抱住她，告诉她一切都会好起来的。她呜咽着，紧紧抓住你的肩膀，任由眼泪流淌。[say: 我……我一个人做不到……如果我还有力量的话也许可以……但她现在对我来说太强了。她是个怪物。求求你……帮帮我……]");
               outputText("[pg]她抬起头看着你的眼睛，眨去眼泪。毫无疑问，爱子需要你的帮助……但这个八岐听起来可能强得可怕。先花点时间准备一下可能是个好主意。");
               outputText("[pg]你要怎么做？");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2369,FlagDict_Impl_.arrayReadInt(_loc1_,2369) + 1);
               menu();
               addButton(0,"现在出发",yamataStart).hint("和爱子一起去对付八岐，阻止她的疯狂！");
               addButton(1,"准备",yamataPrepare).hint("回家准备一下，这将是一场非常艰难的战斗！");
            }
            else
            {
               outputText("当你走进空地时，你碰巧看到爱子正用她的柴刀在古树旁乱砍，嘴里还不断喷出污言秽语，听得你耳朵发烫。在这样的情绪下，你不敢靠得太近，于是你大声呼唤她，问她为什么这么生气。她猛地转过身，眼中闪烁着野兽般的怒火，愤怒地将柴刀朝你掷来。扭曲的斧刃在空中划过，避开了你，牢牢地钉在你身后的一棵树上。");
               outputText("[pg][say:别偷偷摸摸地靠近我！]她大喊道，明显在怒火中烧。她咆哮着，大口喘息了好一会儿，才终于控制住自己火爆的脾气。[say:是……我那个该死的同父异母的婊子姐姐，八岐。她来过这里，你想知道她拿了什么吗？我的宝珠！][pg]你问这有什么大不了的，不就是另一只狐妖找到了它吗。[pg][say:这可是件天大的事！]她咆哮着，打了个响指。她的柴刀在原地晃动了一下，但还是停留在那里，拒绝回到她的手中。[say:她吸干了我的魔力，现在正用它来破坏我的村庄！我才不在乎他们会怎么样，但我想要回我的宝珠！][pg]她用手捂住脸，尽力让自己平静下来。[say:我能感觉到我与它的联系每分每秒都在减弱……尽管我很讨厌这样……但我需要……帮助。别露出那种得意的表情！我找你是因为你是我唯一能指望的人，也许你能帮我把它拿回来！][pg]你双臂交叉，问她为什么不能自己把宝珠拿回来。[pg][say:我告诉过你！她吸干了我的力量！她本来就很强，现在，她简直就是个恶魔！听着，我和你一样不喜欢这样，但你是我唯一能指望的人，所以你到底帮不帮我？]");
               outputText("[pg]嗯，你心里很清楚，如果她不是真的走投无路，她是不会这样求你的。不过，这个八岐听起来似乎是个强劲的对手。先花点时间准备一下也许是明智之举。你打算怎么做？");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2369,FlagDict_Impl_.arrayReadInt(_loc1_,2369) + 1);
               menu();
               addButton(0,"现在出发",yamataStart).hint("和爱子一起去对付八岐，阻止她的疯狂！");
               addButton(1,"准备",yamataPrepare).hint("回家准备一下，这将是一场非常艰难的战斗！");
            }
         }
         else
         {
            aikoMenu();
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function applyAikoLustPrankEffect() : void
      {
         get_player().createStatusEffect(StatusEffects.AikoLustPrank,Utils.rand(48) + 24,0,0,0);
         dynStats(DynStat.Sens(35));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoWinsIntro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你瘫倒在地，" + (get_player().get_lust() >= get_player().maxLust() ? "被欲望折磨得无法动弹" : "被彻底击败") + "，抬头看着那个目光如炬的狐狸女人。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1)
         {
            if(get_player().kitsuneScore() >= 4)
            {
               if(get_player().isNineTails())
               {
                  outputText("[say: ……这、这可能吗？我……我打败了一只九尾狐？]她脸上写满了沮丧，小心翼翼地让她的弓在一阵烟雾中消失。她用一圈火球包围着自己，走近你，慢慢地伸向你的[inv]，取回了她的白球。[pg][say: 我……很惊讶……也许是你让我赢了，但我就是不能让你带着我的球离开。][pg]她小心翼翼地把球塞进乳沟里，向后退了一步，让火球在手臂的距离指向你。她把前两根手指举到脸旁，低声念着咒语。当最后一个音节离开她的嘴唇时，你的视线开始模糊。就在你昏迷之前，你能听到爱子的声音似乎从几英里外传来。[say: 如果我看起来不尊重你，我很抱歉……但你逼我的……想想你还挺可爱的……]");
               }
               else
               {
                  outputText("[say: 我不想这么做，但你逼我的，]她一边说着一边放下弓，让它在一阵烟雾中消失。她保持着警惕，用火球包围着自己走近你。她小心翼翼地弯下腰，从你的[inv]中抢走了白球。[pg][say: 这个球对我来说太重要了，我不能把它留在一个陌生人手里。][pg]她小心翼翼地把球塞进乳沟里，向后退了一步，让火球在手臂的距离指向你。她把前两根手指举到脸旁，低声念着咒语。当最后一个音节离开她的嘴唇时，你的视线开始模糊。就在你昏迷之前，你能听到爱子的声音似乎从几英里外传来。[pg][say: 对不起……你其实挺迷人的……]");
               }
            }
            else
            {
               outputText("[say: 记住，这是你自找的，]她说着放下了弓，让它在一阵烟雾中消失。她走过来时眼睛一直盯着你，小心翼翼地在一只手里准备了一个火球，然后伸手从你的[inv]中取回了白球。[pg][say: 我真的从来没想过要伤害你，我只是需要拿回这个。][pg]她小心翼翼地把球塞进乳沟里，向后退了一步，让火球在手臂的距离指向你。她把前两根手指举到脸旁，低声念着咒语。当最后一个音节离开她的嘴唇时，你的视线开始模糊。就在你昏迷之前，你能听到爱子的声音似乎从几英里外传来。[pg][say: 太可惜了，你其实挺可爱的……]");
               outputText("[pg]8小时过去了……当你终于恢复意识时，你发现自己被扔在了森林边缘，没有爱子或那棵古树的踪影。");
            }
         }
         else
         {
            outputText("爱子在你上方站了一会儿，低声念着咒语，你看着她把前两根手指指向你的额头，就在世界变暗之前。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoWhipping() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("当爱子把你推倒时，你很容易就倒下了，她得意地笑着。她慢慢地脱下你的[armor]，从中获得一种扭曲的快感，用一种几乎是漫不经心的方式脱掉你的衣服，来强调她的主导地位。当你完全暴露在她的“温柔慈悲”之下时，她开始用指甲划过你的[chest]，留下挥之不去的刺痛，让你羞耻地发出兴奋的呜咽。她的尾巴像蛇一样伸出来，缠绕在你的手臂和" + (!get_player().hasTailInsteadOfLegs() ? "腿" : "尾巴") + "上，把你牢牢地固定在原地。为了保险起见，另一条尾巴紧紧地缠绕在你的脖子上，虽然不足以限制你的空气流通，但似乎是在警告你如果反抗会有什么后果。");
         outputText("[pg][say: 舒服吗？希望如此，]她说道，声音里滴着施虐的毒液。");
         outputText("[pg]她举起一只手，突然在你的脸颊上抓了一下，伴随着清脆的巴掌声，你的脸感到一阵刺痛。当新鲜的血液开始从伤口渗出并顺着你的下巴滴落时，爱子抓住你的" + (get_player().hair.length != 0 ? "头发" : "耳朵") + "，把你的头向后仰，这样她就可以用舌头舔过你的脸。她的嘴唇被你的血染成了樱桃红，当她退开时，一小滴血从她的嘴角滴落，闪烁着邪恶的笑容。");
         outputText("[pg]她的手再次抬起，你本能地从预期的巴掌中退缩，但它并没有落下。取而代之的是，病态的紫色火焰开始在她的指关节上跳跃，让她的指尖覆盖在怪异的腐败光芒中。当她把手指贴在你的胸膛上时，你痛苦地叫了出来，当她在你身上长长地划过时，炽热的火焰发出嘶嘶的灼烧声。当它们燃烧时，你痛苦地尖叫，但突然意识到你正在发出不亚于性高潮快感的呻吟！这种痛苦是难以忍受的，但它变得越可怕，你就越渴望它，渴望感受到更多更多！");
         outputText("[pg][say: 嗯……这不是很美妙吗？这种痛苦……这种精致、难以忍受的痛苦……]");
         outputText("[pg]" + (!get_player().hasPerk(PerkLib.Masochist) ? "带着恐惧的神色，你意识到她的火焰正在慢慢把你变成一个受虐狂！" : "") + "你忍不住恐惧地点头同意，你的阴道液已经溢出到地上。你的肺部发出了无耻的呻吟，伴随着你快速逼近的释放，但你逐渐变成沮丧的喘息，意识到爱子还没有准备好让你结束。");
         outputText("[pg]带着恶意的笑容，她举起一条没有束缚你四肢的尾巴，把它放下来抽打你的[chest]，擦过你的一处烧伤。她的尾巴感觉像鞭子一样，刺痛着你的肉体，第一鞭之后很快又是一鞭，然后又是一鞭。残酷的鞭打让你在每一次打击中都越来越接近高潮，但爱子展示了她折磨人的技巧，刚好克制住，不让你越过边缘。");
         outputText("[pg][say: 哈哈哈哈！喜欢吗？！爱吗？！承认吧！在表面之下，你只是一个扭曲的受虐狂猪！！]");
         outputText("[pg]你在她的折磨下尖叫、抽搐、扭动、痉挛，你的身体燃烧着，仿佛正处于你生命中最不可思议的高潮边缘。每一次鞭打都感觉像是要把你送上顶峰，然而每一次都未能如愿。你唯一的慰藉是，这种快感在不断地延续——如果可以选择，你很可能会在那里躺上几天，承受她的虐待，像发情的母狗一样呻吟。");
         outputText("[pg]一声尖锐的呻吟从你的喉咙里传出，你感觉自己终于要得到宝贵的释放了，受虐的快感带来的痛苦痉挛撕裂了你的身体，同时一股名副其实的淫液喷泉从你的下体喷洒到草地上。");
         outputText("[pg][say: 想要吗？你那么想高潮，对吧？] 爱子恶毒地笑着说，饥渴地舔了舔嘴唇。");
         outputText("[pg]你向天大喊，是的，你想要，你求她让你高潮，你什么都愿意做！[pg]");
         if(Utils.rand(4) == 0)
         {
            outputText("[say: 很好！记住这种感觉……][pg]随着那美妙的折磨停止，你沙哑的呻吟声突然消失了，当这只狐狸精松开你时，你因未满足的欲望而颤抖。即使是最轻微的触碰也足以让你达到顶峰，但你疲惫不堪的肌肉却一动也不能动！你绝望地向她恳求，声音变得沙哑，但她只是用食指把你的头按回泥土里，低语道：[say: 今天不行，我的小受虐狂荡妇……] 她把你留在地上，除了你[allbreasts]那饥渴的起伏外，你一动不动。发出一声可怜的呜咽，你终于因精疲力竭而昏了过去，你的需求没有得到满足。");
            outputText("[pg]大约一个小时后当你醒来时，爱子已经不见踪影。你的肌肉酸痛难忍，身体仍然因兴奋而发红，但你已经知道，经历了这场磨难，你会变得更坚强一些。");
            get_player().dynStats(DynStat.Lust(50));
            get_player().dynStats(DynStat.Tou(2),DynStat.Sens(-12));
            get_player().changeFatigue(30);
         }
         else
         {
            outputText("[say: 嗯，你很幸运，我今天心情好，我的小受虐狂荡妇……][pg]她抓住你的喉咙，把嘴唇贴在你的嘴唇上，强行把舌头伸进去开路，同时把一股苦甜参半的毒紫色火焰呼入你的嘴里。甘草的毒味顺着你的喉咙倾泻而下，你的快感突然翻倍，终于突破了你的极限！[pg]当你终于高潮时，你全身的肌肉都紧绷起来，在你的狐狸精女王身下变成了一堆无耻、可怜的烂泥。[pg][say: 别说我什么都没给过你，] 她在你耳边低语，轻轻舔去你脸颊伤口上的一点干血。你只是因精疲力竭而昏了过去，整个身体仍然因那美妙折磨的余韵而颤抖。[pg]大约一个小时后当你醒来时，爱子已经不见踪影。你的肌肉酸痛难忍，但你已经知道，经历了这场磨难，你会变得更坚强一些。" + (!get_player().hasPerk(PerkLib.Masochist) ? " 你微微颤抖，厌恶地回想起自己是多么心甘情愿地接受这种对待。" : ""));
            get_player().orgasm("Vagina");
            get_player().dynStats(DynStat.Tou(2),DynStat.Sens(-2));
            get_player().changeFatigue(30);
            postSexUpdate();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2357,FlagDict_Impl_.arrayReadInt(_loc1_,2357) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoTouchFluffTail() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("[say: 什——什么？！]爱子喊道，脸颊上泛起深红色的红晕。");
         outputText("[pg]你平静地重复了一遍，说你想摸摸她毛茸茸的尾巴，这似乎只让她的脸更红了。");
         outputText("[pg][say: 哦……我、我就知道你是这个意思，]她说着，试图用手遮住脸上的红晕，透过指缝可爱地[if (tallness > 64) {仰视|俯视}]着你。[say: 那、那个……我想……你可以摸摸我的尾巴……就一小会儿……]");
         outputText("[pg]你不确定你请求中的什么内容让她行为举止发生了如此巨大的变化，但她突然开始变得如此害羞的样子真是可爱极了。爱子怯生生地走到你身边，礼貌地请你坐下，同时不安地摆弄着手指。你听从了她的请求，坐到了地上，爱子温柔地转过身来，她那许多毛茸茸的尾巴随着动作拂过你的身体。她把手伸到后面，把尾巴拨到一边，让你正好能看到她那美丽、丰满的屁股，以及上面装饰的鲜红色螺旋纹身，然后她优雅地" + (!get_player().isBiped() || get_player().get_tallness() < 48 ? "坐到了你旁边的地上" : "坐到了你的腿上") + "。");
         outputText("[pg][say: 好、好吧……请温柔一点……这是我的第一次，]她说着，把那团柔软浓密的尾巴拉到她的腿上，让你能轻松够到。");
         outputText("[pg]你完全不知道她在说什么，但谁在乎呢，毛茸茸的尾巴！你的手向下移动，轻轻抚摸着它们。当你开始抚摸每一条尾巴时，你的嘴唇上露出了灿烂的笑容，感受着手指滑过银色皮毛时，那奢华的柔软感在你的手掌上挠痒痒。在你忘乎所以的兴奋中，你几乎没有注意到爱子的头重重地靠在了你的" + (!get_player().isBiped() || get_player().get_tallness() < 64 ? "肩膀" : "胸膛") + "上。你完全沉浸在这些尾巴令人难以置信的柔软中，轻轻地将手从根部滑到尖端，一遍又一遍，甚至偶尔还会举起一条尾巴，用脸颊蹭它。");
         outputText("[pg]当你终于抽出时间看一眼爱子时，你震惊地发现她几乎陷入了昏迷状态，她的眼睛因为快感而翻白，下巴上滴下一条细细的口水。[say: 嗯……别停……]她低语着，轻轻地把口水吸回嘴里，手指轻轻地抓着你的胸膛。");
         outputText("[pg]当你再次把她的尾巴拿在手里，指尖穿过皮毛，微微一笑时，你终于明白了。看来爱子比你想象的要享受得多！你很难抱怨什么，你把这个可爱的狐狸女孩和她那许多尾巴抱在怀里，一边轻笑一边抚摸着它们，一只手移动去轻轻挠她的耳朵。你继续抚摸了她大半个小时，感觉这个世界腐败的重担似乎从你的肩上卸下了。最后，你遗憾地告诉她，你需要回去检查你的营地了。为了履行你的承诺，你把她的球放回她手里，然后开始上路。");
         outputText("[pg][say: ……早点回来……]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,6);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 15);
         get_player().dynStats(DynStat.Lust(10 + Utils.rand(11)),DynStat.Cor(-5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoTalkE3() : void
      {
         var _loc3_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = get_player().masteryLevel(MasteryLib.Bow);
         var _loc2_:Boolean = get_player().hasKeyItem("Bow") || get_player().hasKeyItem("Kelt\'s Bow");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("你告诉她你今天只是想聊聊。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2361) > 0 ? "爱子长舒了一口气，点点头，微笑着。" : ""));
            outputText("[pg][say: 当然，我很乐意聊天。反正我也开始觉得有点孤单了，]她说着，在草地上坐了下来。");
            outputText("[pg]你告诉她你注意到她的弓箭用得很熟练" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2361) > 0 ? "，不过你补充说你之前已经亲身体验过她的箭术了" : "") + "。");
            outputText("[pg]听到你的夸奖，她有些脸红，点了点头，揉了揉鼻子下方，笑得很灿烂。");
            outputText("[pg][say: 谢谢。我是跟我妈妈学的……在我之前，她是村庄的守卫。]");
            outputText("[pg]你微微一笑，追问更多信息，她补充道：[say: 嗯……每个狐妖村庄都会选出一名守卫，保护入口不被外人发现。被选中是一项莫大的荣誉……我从小就想做这个。]");
            outputText("[pg]你告诉她你和她有共同点，并继续解释你是如何被选中成为你们村庄的勇者的，以及这对你意味着什么。然后你注意到她提到“每个”狐妖村庄都会选择一名守卫——这是否意味着不止一个？[say: 哦，是的，当然。不过它们都是超级机密——连我都不知道大多数村庄在哪里。我们主要过着与世隔绝的生活，尽管村长们有时会为了非常重要的事情聚在一起。我……其实我可能不该和一个外人谈论这些，" + (get_player().isNineTails() ? "即使[he]是一只九尾狐……" : "") + "不幸的是，长老们很容易因为这些事情生气。]");
            outputText("[pg]你为自己的打探道歉，并问她是否有什么是她可以谈论的。");
            outputText("[pg][say: 抱歉，我不是那个意思，只是村里的长老们喜欢保护隐私……自从恶魔出现后……嗯，我们本来就很孤立，但现在有了恶魔，长老们害怕与外界接触会给我们的村庄带来腐化。说实话，我不知道我们是否有那么多需要担心的，但这确实发生过……]");
            outputText("[pg]你能看出她不太喜欢讨论这个话题，于是立刻决定换个话题。[pg]");
            if(_loc2_)
            {
               outputText("你拿出弓，咧嘴笑着问她是否愿意来一场友谊赛。她似乎对此很兴奋，立刻去准备场地。");
               outputText("[pg]在接下来的一个小时里，你们轮流向目标射击。");
               if(_loc1_ < 2)
               {
                  outputText("爱子以她高超的技巧彻底击败了你，但她的态度很贴心，你设法从她那里学到了一些技巧。");
                  get_player().masteryXP(MasteryLib.Bow,10 + Utils.rand(21));
               }
               else if(_loc1_ < 4)
               {
                  outputText("你让她费了一番功夫，但爱子最终还是占据了上风。不过她对此表现得很贴心，还给了你一些可能会有帮助的指点。");
                  get_player().masteryXP(MasteryLib.Bow,5 + Utils.rand(11));
               }
               else
               {
                  outputText("爱子是个强劲的对手，但她最终还是敌不过你高超的技巧。你甚至大方地给了她一些指点，她似乎对你的帮助很感激。");
                  _loc3_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc3_,2356,FlagDict_Impl_.arrayReadInt(_loc3_,2356) + 5);
               }
            }
            else
            {
               outputText("话题转向了你在玛瑞斯其他地方的各种事迹，你们俩聊了大半个小时，然后你告诉爱子你该回营地了。她依依不舍地向你道别，在你离开时又回去练习射箭了。");
            }
            outputText("[pg]不幸的是，你现在必须回营地了，所以你向她依依不舍地道别，在你离开时她又回去练习射箭了。");
         }
         else
         {
            outputText("你举起双手，告诉她你只是想谈谈。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2364) == 2)
            {
               outputText("[pg]她眯起眼睛，一直用弓瞄准你，说道：[say: 哦，是啊，我以前听过这话。]");
               outputText("[pg]你向她保证这次不一样，同时保持双手举起以示防御。");
               outputText("[pg][say: 我凭什么相信你？到目前为止，你不过是个傲慢的混蛋，[he]想做什么就做什么，想对谁下手就对谁下手。]");
               if(get_silly())
               {
                  outputText("[pg]你轻轻举起一根手指，告诉她她应该用“whomever”，而不是“whoever”。她给了你一个“你在搞什么鬼”的眼神，大喊道：[say: 随便啦！]");
                  outputText("[pg]不，是 whomev——哦，她是在……好吧。");
                  outputText("[pg][say: 闭嘴！]");
                  outputText("[pg]你向她发誓这次你没打算做什么；你只是想谈谈。");
                  outputText("[pg][say: 好吧，但你待在那边。你最好别耍什么花样。]");
               }
            }
            else
            {
               outputText("[pg][say: 真的，只是谈谈？给我一个我应该相信你的好理由。]");
               outputText("[pg]你举起双手，提醒她现在是用弓瞄准你的人。[if (hasweapon) {你的武器甚至不在手里，等你拿到它的时候，她早就射中你了。|你甚至连武器都没有。}]");
               outputText("[pg]这似乎让她放松了一点，但她仍然用弓瞄准你的胸口，手指轻轻抽动，似乎在等你有所动作。");
               outputText("[pg][say: 好吧，但你待在那边。你最好别耍什么花样。]");
            }
            outputText("[pg]你同意了她的条件，与她保持距离。尴尬的沉默持续了一段时间，你终于决定打破紧张气氛，提到了爱子的弓术。");
            outputText("[pg][say: 我母亲教我的，]她微微点头说道。[say: 在我之前，她是守护者。你最好别以为奉承我就能弥补你所做的一切。]");
            outputText("[pg]你向她保证你绝无此意，并追问她关于这个“守护者”的事情。");
            outputText("[pg][say: 每个狐妖村落都会选出一名守护者。被选中保护入口，抵御那些试图伤害村落的外来者，是一项巨大的荣誉。] 你从她的语气中推断出，她的话里有一句没说出口的 [say: 就像你一样]，但你没有追问。没必要进一步激怒她，尤其是当你什么也得不到的时候。");
            outputText("[pg]你告诉她，在某些方面，你和她并没有什么不同，并解释了你是如何被选为村庄的勇者，然后穿过传送门的。");
            outputText("[pg][say: 是啊，我也看到了你的所作所为。算什么勇者。]");
            outputText("[pg]她的话很刺耳，但你还有更多问题，所以你继续追问。她提到“每个”狐妖村落都会选出一名守护者。你问她这是否意味着不止一个村落。");
            outputText("[pg][say: 当然，你不会以为只有我这一个吧？……算了。它们都隐藏起来了，你别想从我这里得到它们的位置；我甚至都不知道它们大多数在哪里。" + (get_player().isNineTails() ? " 如果你想找的话，你应该能找到，毕竟你是九尾狐。" : "") + "]");
            outputText("[pg]你理解地点点头，问为什么它们是这么大的秘密。");
            outputText("[pg][say: 我们喜欢保护隐私，好吗？而且长老们认为，如果我们与外界接触太多，就会被恶魔的腐化所污染。我以前觉得他们只是杞人忧天，但他们可能说得有道理。]");
            outputText("[pg]你明白她那些尖酸刻薄的话可能又是冲着你来的；这次谈话并没有你希望的那么顺利。话又说回来，在你那样对待她之后，你还能指望什么呢？为了寻找脱身的机会，你告诉爱子你现在必须回营地了，但你很高兴能和她聊天。");
            outputText("[pg]她似乎并不完全相信，但她确实深吸了一口气，叹了口气，稍微放松了弓弦，点了点头。[say: 是啊，好吧……考虑到种种情况，我觉得和你聊天还不算太糟。但你还没完全脱身，差得远呢。]");
            outputText("[pg]你没再多说什么，转身走回营地。");
         }
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2356,FlagDict_Impl_.arrayReadInt(_loc3_,2356) + 3);
         set_aikoCorruption(get_aikoCorruption() - 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoTalkE2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你微笑着告诉她你只是想聊聊。她也回以微笑，压抑着一丝失望的神情，点点头说：[say: 哦，真的吗？好吧，我想我确实需要个伴。][pg]她在草地上坐下，示意你也坐下。[say: 你饿了吗？]她问，打了个响指，伴随着一团烟雾，一个小木盒出现在她手中。[say: 我没多少东西，但我愿意和你分享。][pg]你感谢她的好意，看着她为你打开盒子。生鱼片和冷饭？你不确定这听起来是否很合你的胃口，" + (get_player().isPureEnough(33) ? (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 57 ? "但你不想显得不礼貌，所以你小心翼翼地挑了几块看起来很好吃的，并对她笑了笑。出乎意料的好吃，她似乎很高兴你喜欢。" : "但你不想显得不礼貌，所以你小心翼翼地拿了一块放进嘴里，然后……好辣！！爱子看着你的惨状咯咯地笑了起来，你拼命地给嘴巴扇风，却无济于事，你忍不住觉得她可能一开始就计划好了。至少她还算好心，给你倒了杯水。") : "所以你给了她一个略带厌恶的眼神，把盒子推回给她。她似乎觉得有点被冒犯了，但没有再提这件事。") + "[pg]你向她讲述了你的冒险故事，爱子也投桃报李，讲了一些她在狐妖村长大的轶事，以及作为村子保护者的感受。你们聊了将近一个小时，但最终你告诉她，你该回去看看你的营地了。[say: 好的，]她愉快地说，打了个响指收拾好东西。[say: 记得常来玩哦！]你告诉她你一定会尽量来的，然后挥手向她告别。");
         get_player().refillHunger(10);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 3);
         set_aikoCorruption(get_aikoCorruption() - 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoTalkAndSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉爱子你是来聊天的，但你对之后的做爱也很感兴趣。");
         outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "她愉快地笑了笑，向你走来，凑上前在你的脸颊上轻轻啄了一下。[say: 听起来是个不错的计划，] 她笑着说，稍微退后了一点。[say: 你想聊些什么？]" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "她愉快地笑了笑，微微点头。[say: 当然，我们可以聊聊。表现好点，说不定我就会答应你第二部分的提议，] 她说道，但从她俏皮的语气中你能听出她只是在开玩笑。[say: 你有什么想法？]" : "[say: 好吧，我们聊聊。至于第二部分，看我之后的心情吧，] 她交叉着双臂说道。[say: 那么，你想聊些什么？]")));
         talkAndSex = true;
         aikoTalk();
      }
      
      public function aikoTalk() : void
      {
         if(!talkAndSex)
         {
            clearOutput();
            spriteSelect(SpriteDb.get_s_aiko());
            outputText("你告诉爱子你只是来聊天的，没别的。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65 ? "她愉快地笑了笑，向你走来，凑上前在你的脸颊上轻轻啄了一下。[say: 你想聊些什么？] 她笑着说，稍微退后了一点。" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? "她愉快地笑了笑，微微点头。[say: 当然，我们可以聊聊。你有什么想法？]" : "[say: 好吧，我们聊聊。那么，你想聊些什么？]")));
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 3);
         set_aikoCorruption(get_aikoCorruption() - 5);
         menu();
         addButton(0,"巨蜂",talkBees).hint("向她询问森林里的巨蜂。");
         addButton(1,"触手怪",talkTentacles).hint("向她询问森林里的触手怪。");
         addButton(2,"地精",talkGoblins).hint("向她询问地精的事。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,17) != 0)
         {
            addButton(3,"阿克巴尔",talkAkbal).hint("向她询问你在附近遇到的恶魔阿克巴尔。").disableIf(saveContent.akbalDone,"你已经告诉过她那个恶魔的下场了。");
         }
         addButton(4,"狐妖文化",talkCulture).hint("向她询问狐妖的文化。");
         addButton(5,"爱子",talkAiko).hint("向她询问关于她自己的事。");
         addButton(6,"宅邸姐妹",talkMansionSisters).hint("向她询问你在森林里见过的狐妖姐妹。");
         addButton(7,"九尾",talkNineTails).hint("向她询问关于九尾狐的事。");
         addButton(8,"爱子的家庭",talkFamily).hint("向她询问关于她家人的事。");
         addButton(9,"箭术",talkArchery).hint("向她询问关于她箭术的事。");
         setExitButton("返回",aikoMenu);
      }
      
      public function aikoSpar() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你微笑着建议，如果她感兴趣的话，也许你们可以来一场友谊赛。");
         outputText("[pg][say: 比赛是吧？我可不是好惹的，你知道的，]她说着，对着空气挥了几下空拳。[say: 好吧，我加入。赌注是什么？][pg]你思考了一会儿，然后建议输家必须取悦赢家。她轻笑了一声，然后点了点头。[pg][say: 听起来很公平。好了，你准备好了随时开始！]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 2);
         get_player().createOrFindStatusEffect(StatusEffects.Spar);
         startCombat(new Aiko());
      }
      
      public function aikoSexTailjob() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = Utils.rand(int(get_player().cocks.length));
         if(playerchoice)
         {
            outputText("你问爱子这次她能不能用她的尾巴，同时你诱惑地让你的[armor]从身上滑落，向这只容易受惊的狐妖露出你的[cock " + (_loc1_ + 1) + "]。她立刻脸红了，垂下耳朵，真可爱。");
            outputText("[pg][say:我……我-我们只对我们真正喜欢的人使用尾巴……而我确实喜欢你……]你看到她逐渐恢复了平时的样子，当她引导你坐下时，露出了一个调皮的笑容。");
         }
         else
         {
            outputText("[say:我……真的很喜欢你，[name]，所以我打算做一件我们很少做的事，除非是对我们最亲密的伴侣和爱人。]她诱惑地开始脱下你的[armor]，让每一件都掉在地上，在开始脱下一件之前看着你的眼睛，手指沿着你的肩膀、肚子和两侧划过。当你的[cock " + (_loc1_ + 1) + "]暴露出来时，她深深地脸红了，用手指顺着它的长度划过，在它跳动时立刻抽离。");
         }
         outputText("[pg][say:放松点……享受我毛茸茸的尾巴吧，大男孩，]她娇羞地说着，你看到她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "八条" : "七条") + "尾巴开始移动，像孔雀的羽毛一样伸展开来。光是看着它们，你就已经感到硬了。");
         outputText("[pg]爱子爬上你的腿，带着笑容诱惑地向你的脸爬来，然后她热情地亲吻你的嘴唇，寻找你的舌头；她的尾巴用它们柔软温暖的毛发慢慢地抚摸你的下半身。随着亲吻变得更加热情，你慢慢地用双臂环抱住她，直到你感觉到她的一条尾巴轻轻地缠绕在你的[cock " + (_loc1_ + 1) + "]上。");
         outputText("[pg]这只容易受惊的狐妖调皮地咯咯笑着，让你喉咙里发出一声轻柔的呻吟。她轻轻地抚摸着你粗壮的肉棒，用她的一条尾巴覆盖了它的全部长度，轻轻地移动着它，你感觉到温暖的毛发用舒适的光芒包裹着你，就像营地的篝火抚摸着你的肉棒。");
         outputText("[pg]你因狐妖情人精湛的抚摸而呻吟，她的尾巴很快就会把你逼到极限，它是如此柔软、华丽，而且如此灵巧！你热烈地亲吻她，感觉到她的胯部贴在你的下腹部，上面沾满了淫液。");
         outputText("[pg]当狐妖继续折磨你的肉棒时，你注意到第二条尾巴也加入了进来，环绕着你的[cock " + (_loc1_ + 1) + "]的顶端，而另一条尾巴则紧紧地缠绕在根部" + (get_player().balls > 0 ? "，抚摸着你的蛋蛋" : "") + "。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("你" + (int(get_player().cocks.length) > 2 ? "剩下" : "另一根") + "的[cocks]很快就被爱子的尾巴包裹并抚摸，被她羽毛般丝滑的尾毛巧妙地挑逗和摩擦着" + (!get_player().hasVagina() ? "。" : "，而你的"));
         }
         else
         {
            outputText(get_player().hasVagina() ? "你的" : "");
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]被不断抚摸着你" + (get_player().balls > 0 ? "蛋蛋" : "肉棒") + "的尾巴逗弄着。偶尔她的一条尾巴会压在你的阴阜上，那丝滑的触感在你的阴唇上感觉相当美妙。");
         }
         outputText("[pg]你红着脸，在爱子的嘴里发出一声低沉的呻吟，狂喜像触电一样包围了你的身体，你的高潮爆发在你的狐妖同伴的肚子、乳房和尾巴上。");
         outputText("[pg]爱子咯咯地笑着，她站着，身上沾满了你滚烫浓稠的精液。然后她把嘴藏在一条湿透的尾巴后面，诱惑地把它舔干净，看着你舒服地喘着粗气。");
         outputText("[pg][say: 很少有人能像这样享受我的尾巴……而你显然很喜欢，[name]……下次，我会让你扯平的……]当你把她拉近再吻她一次时，她咯咯地笑着，露出了顽皮的笑容。你叹了口气，结束了这个吻，告诉她你必须回营地了，但你保证下次会让她沐浴在快乐中。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2357,FlagDict_Impl_.arrayReadInt(_loc2_,2357) + 1);
         postSexUpdate();
         get_player().orgasm("Dick");
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_player().removeStatusEffect(StatusEffects.Spar);
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoSexMissionary() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = Utils.rand(int(get_player().cocks.length));
         outputText(playerchoice ? "你告诉爱子，今天你想用传统的方式来，并慢慢开始脱下你的[armor]。" : "[say: 今天……我们要用老派的方式，]爱子一本正经地说着，带着色眯眯的坏笑打量着你，同时开始脱下你的[armor]。");
         outputText("[pg]当你完全赤裸后，爱子也开始脱下自己的衣服，动作缓慢而性感。她像是在表演，虽然算不上脱衣舞，但她慢慢解开系在长袍下半部的腰带，让它滑落到脚踝处堆成一团。接着她褪下上半身的长袍，从衣物堆中迈出，向你走来。最后脱下的是她紧绷的束胸，它化作布条落在地上，让她紧实、丝滑的棕褐色双乳自由地晃动着。");
         outputText("[pg]看着她美丽的裸体站在你面前，你已经硬得像石头一样了。她把手放在你的肩膀上" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) > 64 ? "，深深地凝视着你的眼睛。" : "，嘴角挂着一丝坏笑。") + "她开始轻轻地拉着你，引导你躺在地上，然后自己平躺下来，将尾巴在身下铺开。");
         outputText("[pg]她张开双腿，露出闪闪发光的小穴，开始抚摸自己的乳房和阴蒂，为你做着准备。她的指尖顺着你的[chest]慢慢滑下，然后游移到你的腹股沟，轻轻抚摸着你的[cocks]。她用双手轻柔地握住你的[cock " + (_loc1_ + 1) + "]，开始用龟头摩擦她的阴唇，并摇晃着臀部，性感地在上面滑动。");
         outputText("[pg]她用双手更紧地握住你的肉棒，抬起臀部将你拉入体内，发出一声沙哑的呻吟。她一次又一次地向前挺动臀部，每一个微小的动作都将你滚烫的男根吞没得更深。现在你能感觉到她的臀部紧贴着你，你的[cock " + (_loc1_ + 1) + "]已经齐根没入她丝滑柔软的小穴中，肌肉壁正熟练地挤压着你。");
         outputText("[pg]你发出一声轻柔的呻吟，开始扭动臀部，配合着这位可爱的祭司，缓慢而充满激情地抽插着。她的双腿滑上来缠住你，将你紧紧拉向她，用尾巴包围你的身体，发出一声轻柔的欢愉呜咽。随着你开始加快抽插的速度，你的理智慢慢屈服于原始的本能。不过，爱子似乎并不介意，她迎合着你扭动臀部，将她诱人的屁股从地上抬起几英寸，以便一次又一次地将自己钉在你的肉棒上。");
         if(!get_player().isTaur())
         {
            outputText("[pg]你的双手顺着她的身体两侧滑下，轻轻揉捏着她那诱人的臀瓣。那柔软、富有弹性的触感令人难以置信的丰满多汁，就像熟透的水果一样，当温暖的肌肤从你的指缝间溢出时，你忍不住发出一声轻柔的呻吟。");
         }
         outputText("[pg]你继续保持着猛烈的节奏，充满激情地耕耘着这位美丽的狐狸女孩，感受着她温暖的汁液随着每一次抽插在你的肉棒周围溢出。她的呻吟声随着时间的推移变得越来越大，感受着她那湿透了的、极其柔软的小穴现在挤压你的方式，你知道你们俩很快就会被送上顶峰。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65)
         {
            outputText("[pg]她的内壁进行了最后一次肌肉收缩，以令人难以置信的紧致度夹紧了你的[cock " + (_loc1_ + 1) + "]，并以惊人的吸力将你拉入。");
            outputText("[pg]爱子向着天空呻吟着，双臂环抱住你，拉起自己热情地亲吻你，在你的唇间尖叫着她的欢愉，身体不断颤抖着。");
         }
         if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]你将肉结狠狠地顶入，它膨胀到最大，在你的高潮来临前将她紧紧封锁。");
         }
         outputText("[pg]当你的高潮爆发时，你的肉棒在她体内膨胀，");
         if(get_player().cumQ() <= 150)
         {
            outputText("随着你的高潮终于爆发，你发出一声响亮的呻吟，" + (get_player().hasKnot(_loc1_) ? "将一股股精液射入爱子的小穴，然后瘫倒在她身上，直到你的肉结开始缩小。几分钟后你拔了出来，确保她没有被你的肉结弄伤，不过因为她是狐妖，她那富有弹性的小穴似乎没有任何问题。" : "将几股精液射入爱子的小穴，然后拔出来，让最后几股精液喷洒在她的肚子上。"));
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("将难以置信的精液射入她的小穴，在你的肉棒周围冒着泡，" + (get_player().hasKnot(_loc1_) ? "但无法越过你肿胀的肉结。当爱子的肚子鼓起，意识到所有的精液都被你的肉结困住时，她发出了一声狂热的呻吟。高潮结束几分钟后，你的肉结开始缩小。几分钟后你拔了出来，确保她没有被你的肉结弄伤，不过因为她是狐妖，她那富有弹性的小穴似乎没有任何问题。一些精液开始漏出来，" : "并") + "顺着她迷人的屁股滴落。");
         }
         else
         {
            outputText("将一波又一波的精液泵入她体内，直到她紧绷的腹部肿胀成一个沉甸甸、晃动着的孕肚。" + (get_player().hasKnot(_loc1_) ? "多亏了你肿胀的肉结，你刚刚泵入她体内的精液一滴也逃不掉，爱子瘫倒在地，而你则被拉到她高高隆起的肚子上。高潮结束后，你躺在那里几分钟，直到你的肉结开始缩小。几分钟后你拔出了肉结，确保她没有被那巨大的球状物弄伤，不过因为她是狐妖，她那富有弹性的小穴似乎没有任何问题。" : ""));
         }
         outputText("[pg]她的内部肌肉仍然没有松开你的阴茎，你趴在她身上，你的喘息声和她的喘息声交织成一首充满激情的交响乐。一旦她度过了高潮带来的最后一波快感，她就放松下来，松开阴道壁，慢慢滑下，平躺着休息。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65)
         {
            outputText("[pg]你从她身上滚下来，瘫倒在她旁边的地上，微笑着仰望茂密的树冠。爱子转向你，凑过来在你的脸颊上印下一个轻吻，然后蜷缩起身子贴在你的身侧，把头靠在你的肩膀上。你这样抱着她过了一会儿，但遗憾的是，天下没有不散的筵席。你用低沉的语气告诉她，你需要回去检查你的营地了。");
            outputText("[pg][say: 好吧，]当你收拾东西时，她仍然赤裸着躺在草地上说道。[say: 别成了陌生人。]");
            outputText("[pg]你告诉她你当然不会，在出发前最后看了一眼她美丽的身体。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg]你从她身上退开，满意地叹了口气，而爱子继续平躺着，慵懒地张开双腿，喘着粗气。");
            outputText("[pg]尽管你很不想离开，但你告诉她你真的该回去检查你的营地了。");
            outputText("[pg][say: 呵呵，那回头见，]她说着，冲你调情般地[say: 摇了摇手指]，在你收拾东西时，她依然赤身裸体地躺在草地上。你临走前最后看了一眼她赤裸的身体，看到你离开，她流露出一丝淡淡的失落。");
         }
         else
         {
            outputText("[pg]当你退开时，爱子微微叹了口气，脸上的表情交织着满足与一丝自我厌恶。她躺在地上，抬头看着你说道：[say: 嗯……你还不赖。也许你应该试着对我好点……如果你表现得好，我们可以经常这样。]");
            outputText("[pg]当你收拾东西准备回营地时，她冲你挥了挥手，依然慵懒地躺在草地上，若有所思地凝视着远方。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2357,FlagDict_Impl_.arrayReadInt(_loc2_,2357) + 1);
         postSexUpdate();
         get_player().orgasm("Dick");
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_player().removeStatusEffect(StatusEffects.Spar);
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoSexE2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你微笑着问她是否有兴趣在草地上[say: 滚一滚。][pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 55)
         {
            outputText("她也回以微笑，对你的直白咯咯地笑了起来。");
            outputText("[pg][say: 哦，[name]，你把我当成什么样的女孩了？]她戏弄道，漫不经心地挥了挥手。看到你略显失望的表情，她微笑着说：[say: 放松点，我只是开玩笑……说实话，我也需要稍微释放一下压力。][pg]她走到你身边，[if (tallness > 64) {踮起脚尖，}]在你的脸颊上啄了一下，留下轻微的刺痛感，然后开始小心翼翼地帮你脱下[armor]。");
            aikoConsSex();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("她对你咧嘴一笑，说道：[say: 直奔主题，是吧？好吧，至少你是个知道[he]想要什么的[manboy]。][pg]她停顿了一下，装模作样地[say: 考虑了一下，]然后终于把一只手叉在腰上，让长袍的一侧肩膀滑落，露出丝滑的棕褐色肌肤来挑逗你。当她漫步走到你面前，开始帮你脱下armorName时，你可以大致猜到她最终的答案是什么，她动手时那七条尾巴在周围催眠般地摇摆着。");
            aikoConsSex();
         }
         else
         {
            outputText("[say: 你在开玩笑吧。在你做了那些事之后？！][pg]她对你冷笑，愤怒地露出锋利的野兽般的牙齿。[say: 说真的，你到底是个什么东西，某种精神病吗？滚出这里，你这个不可理喻的" + get_player().mf("混蛋","婊子") + "！]");
            outputText("[pg]好吧，看来她不太欣赏你的提议，虽然你也没指望她会。你可以就此打住然后离开，或者你可以尝试强迫她。");
            menu();
            addButton(0,"强迫",aikoFight).hint("你有需求！强迫她。");
            addButton(14,"离开",leave).hint("不要强求。你搞砸了，别把气撒在她身上。");
         }
      }
      
      public function aikoSexDoggy() : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = null as String;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = get_player().cockThatFits(50,"area");
         var _loc2_:int = get_player().cockThatFits2(50);
         outputText(playerchoice ? "你告诉爱子，这次你想用后入式上她。" : "爱子打量了你一会儿，眼中闪过一丝罕见的欲望，目光在你的胯部停留了片刻。[say: 嗯……我今天想来点“狂野”的……你懂我的意思吧，]她说着，给了你一个娇媚的坏笑。");
         outputText("[pg]你急不可耐地脱下[armor]，微笑着看着这位迷人的狐妖俯下身子，伸手握住你的[cocks]。她的双手开始抚摸揉捏，在她的娴熟技巧下，你的肉棒很快就硬了起来。她调皮地舔了舔你的[cock " + (_loc1_ + 1) + "]的顶端，然后改变姿势，在你面前四肢着地，将她那诱人的屁股高高撅起，尾巴像孔雀开屏一样散开。");
         outputText("[pg]你咧嘴一笑，俯下身子，将手掌放在她那沉甸甸、颤巍巍的臀瓣上装饰着异国情调螺旋纹身的部位，并在她身后摆好姿势。你的[cock " + (_loc1_ + 1) + "]的顶端轻轻擦过她的阴唇，你能感觉到一股名副其实的汁液喷涌而出，浇在上面。你可以看到爱子因为自己已经湿透了而羞红了脸，但她很快就把你的注意力转移回她的下体，她向后退了几英寸，将你的肉棒吞入，发出一声淫荡的呻吟。");
         outputText("[pg]她体内的美妙温热如手套般包裹着你，你的胯部不由自主地向前挺去，" + (get_player().hasKnot(_loc1_) ? "将整根肉棒直抵肉结" : "将整根肉棒尽根没入") + "，一插到底。爱子张大嘴巴发出强烈的呻吟，开始前后摇摆臀部，一遍又一遍地将她那丰满的臀部撞在你的" + (get_player().hasKnot(_loc1_) ? "肉结" : "胯部") + "上。");
         outputText("[pg][say: 哦，是的，天哪，是的！我太需要这个了……]她交替着大喊和喘息，让自己进入了一个良好的节奏。你的双手顺着她的身体向上移动，抓住她的臀部，她那毫无束缚的臀瓣开始自由地颤动和弹跳。爱子向前趴在肩膀上，向后伸手开始摆弄她的阴蒂，而你则继续猛烈地操弄她的小穴，从她流着口水的裂口中涌出的液体开始在地上汇聚成一滩。");
         outputText("[pg][say: 快，快快！啊，是的！]");
         outputText("[pg]你开始担心她的叫喊声会引来森林里的捕食者，但你把这个念头抛在脑后，决定专注于眼前的任务。");
         if(_loc2_ >= 0)
         {
            outputText("[pg]当你热情地操弄她的小穴时，你的[cock " + (_loc2_ + 1) + "]在她的臀瓣之间滑动，被似乎永无止境的液体充分润滑。每当你抽出特别长的一段时，它偶尔会压在她紧闭的肛门上片刻，然后再继续移动。爱子回头看着你，脸上带着深深的红晕，说道：[say: 嗯……啊！你可以……哦！……如果……你……想……操……我的……屁股，我……是说……]在她的允许下，你向后退去，压在她紧致的菊花上，向前倾身，用你的[cock " + (_loc2_ + 1) + "]刺穿她的屁股！爱子发出一声深沉的呻吟，起初有些退缩，但她温暖的内脏非常乐意接纳你的肉棒，她的痛苦在片刻之内就变成了快感。随着你的每一次推进，她的肛门开始挤压并把你吸得更深，她双穴的触感让你爽得发狂。");
         }
         outputText("[pg]被你的肉棒刺穿，爱子开始以加倍的激情向后迎合你，将脸颊贴在草地上，继续弹拨和挤压她的阴蒂。");
         if(get_player().hasKnot(_loc1_) && get_player().hasKnot(_loc2_))
         {
            outputText("[pg]你将肉结猛地插进她的小穴和紧致的屁股里，她现在所承受的过度饱胀感让她从喉咙里发出一声尖锐、兴奋的尖叫。你的肉结肿胀起来，将你牢牢地锁在原位。");
         }
         else if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]你将肉结猛地插进她的小穴里，随着你的肉结肿胀并将你锁在原位，她因为小穴里现在非常饱胀的感觉而呻吟起来。");
         }
         else if(get_player().hasKnot(_loc2_))
         {
            outputText("[pg]你将肉结猛地插进她紧致的屁股里，随着你的肉结肿胀并将你锁在原位，她因为屁股里现在非常饱胀的感觉而尖叫起来。");
         }
         outputText("[pg]她高潮了，效果立竿见影且强烈——她的小穴" + (_loc2_ >= 0 ? "和屁眼" : "") + "紧紧夹住你的肉棒，她体内的热度变得几乎令人无法忍受的愉悦。你再也忍不住了，也没有理由忍耐，你捏住她的臀部，伴随着最后一声呻吟向前挺动，将你的精液释放在她体内。");
         if(get_player().cumQ() > 350)
         {
            outputText("[pg]当你将充满活力的精液泵入她的" + (_loc2_ >= 0 ? "两个" : "") + "肉洞时，她的洞里发出清晰可闻的咕噜声，你感觉到她的腹部开始肿胀起来。当你把精液全部射入她体内时，她看起来就像是怀胎十月，她幸福地吐出舌头。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("[pg][say: 那……太棒了……]她说着，向前倒去");
            if(!(get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_)))
            {
               outputText("从你的阴茎" + (_loc2_ >= 0 ? "上" : "") + "拔出，侧躺在草地上。你紧随其后，疲惫地张开双臂瘫倒在她身边，两人都在轻轻喘息。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 65)
            {
               _loc3_ = get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_);
               _loc4_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0 ? "八条" : "七条";
               _loc5_ = get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_);
               _loc6_ = get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_);
               outputText("[pg]" + (_loc3_ ? "她把屁股向你贴得更紧，依然被你的肉结紧紧连在一起" : "她蜷缩在你身边") + "，她那" + _loc4_ + "尾巴像一条大毯子一样将你包裹起来。然后她甜蜜地将" + (_loc5_ ? "鼻子" : "头") + "埋进你的肩膀，闭上了眼睛。接下来的一个小时里，你们俩在草地上依偎在一起，但你最终不得不告诉她你需要回营地了。" + (_loc6_ ? "你从她体内拔出，你的肉结终于疲软下来，然后站起身。" : "") + "她挥手告别，蜷缩在树下，用尾巴裹住自己，脸上带着温暖的微笑。");
            }
            else
            {
               outputText("[pg]" + (get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_) ? "你从她体内拔出，你的肉结终于疲软下来，然后站起身。" : "你慢慢坐起身，") + "告诉爱子你该回营地了。她理解地点点头，然后微微叹了口气，蜷缩在树下，用尾巴裹住了自己。");
            }
         }
         else
         {
            outputText("[pg]" + (get_player().hasKnot(_loc1_) || get_player().hasKnot(_loc2_) ? "几分钟后，你从她体内拔出，你的肉结终于疲软到可以拔出的程度。" : "") + "她从你身边退开，拖着身子坐了起来，用尾巴裹住自己，喘着粗气。");
            outputText("[pg][say: 哈……哈……那……还算不错，]她承认道，温顺地微笑着。[say: 也许如果你乖乖听话……我以后还会让你再来一次。]");
            outputText("[pg]你告诉爱子你该回营地了，她点点头，没有再说什么。");
         }
         outputText("[pg]收拾好东西，你穿上[armor]，向营地走去。");
         var _loc7_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2357,FlagDict_Impl_.arrayReadInt(_loc7_,2357) + 1);
         postSexUpdate();
         get_player().orgasm("Dick");
         if(_loc2_ >= 0)
         {
            get_player().orgasm("Dick");
         }
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_player().removeStatusEffect(StatusEffects.Spar);
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoSexCunni() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText(playerchoice ? "你告诉爱子这次你想让她舔你，急切地脱下衣服，好让事情开始。" : "爱子把你从[armor]里拉出来放在一边，她用充满欲望的眼神看着你，露出了一个苦笑。");
         outputText("[pg]当你的[vagina]映入眼帘时，她微微一笑，舌头沿着上牙的边缘舔过。她的尾巴缠绕在你的脚踝上，你发现自己被调皮地推了一下。你的心跳漏了一拍，但你很快发现自己滑倒在一条由蠕动的狐狸尾巴铺成的毯子上，它们接住了你，轻轻地把你放在背上。");
         outputText("[pg]爱子站在你上方，解开系着长袍的腰带，让它们掉在地上成一堆。她转过身，优雅地跨坐在你俯卧的身体上，让你清楚地看到她柔软的臀部和上面装饰的红色螺旋纹身。她把头靠在你的大腿之间，将她湿润的私处压在你的嘴唇上，她的尾巴在你的脖子下移动，形成一个枕头。她用双臂环抱住你的大腿，将嘴唇贴在你颤抖的[vagina]上，同时她的尾巴将你的头抬起，埋入她散发着甜美香气的蜜壶中。");
         outputText("[pg]当你开始用舌头沿着她剃光毛发的阴唇外侧舔舐时，她微微颤抖，并在你胯下呻吟着作为回报。她的舌头熟练地在你的褶皱中进进出出，轻轻地弹拨着你的[clit]，她用嘴唇包裹住它，轻轻地吸吮。快感顺着你的脊椎向上蔓延，迫使你在她滴水的阴户中呻吟，当你和她来回交替，在彼此的敏感带上互相舔舐和亲吻时，创造了一个快感的反馈循环。");
         outputText("[pg]她用手指拨开你的阴唇，将舌头深深地滑入你的[vagina]，蠕动的肌肉埋入你的体内。她的臀部开始在你的脸上摩擦，将你的鼻子压在她的臀部上，她开始迷失在快感中，用她光滑的爱液涂满你的脸。");
         outputText("[pg]她发出淫荡的呻吟，收回舌头，开始轻轻地向你的[clit]吹气，一连串蓝色的火焰倾泻在你的私处，将快感的冲击传遍你的全身。她急切地再次将自己埋入你的[vagina]中，让她的舌头在每一个褶皱和缝隙中穿梭，同时她丰满的臀部将你的头压在地上，在你的脸上上下弹跳时微微颤动。");
         outputText("[pg]你们俩齐声呻吟，颤抖的私处紧紧收缩，彼此的脸上都沾满了光滑的淫液。爱子的双腿因快感而颤抖，再也无法支撑她颤动的臀部，她瘫倒在你身上，下巴靠在你的大腿之间。最后，她深吸了一口气，似乎费了九牛二虎之力才从你身上爬起来，收拾好衣服，开始重新系上长袍" + (int(get_player().cocks.length) > 0 ? "，你被冷落的[cocks]将" + (int(get_player().cocks.length) == 1 ? "它的" : "它们的") + "精液洒满了爱子的胸膛和你们下方的地面" : "") + "。");
         outputText("[pg]爱子站起身来，拍了拍身上的灰尘，臀部轻轻地来回摇摆。");
         outputText("[pg][say:啊，真有趣，]她说着，伸了个懒腰，发出一声可爱的叹息。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 1 ? "你只能点头同意，在满足的疲惫中躺了一会儿，直到你终于撑起身子，开始收拾你的[armor]。向爱子告别后，你回到了营地。" : ""));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2357,FlagDict_Impl_.arrayReadInt(_loc1_,2357) + 1);
         postSexUpdate();
         get_player().orgasm("Vagina");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1)
         {
            doNext(aikoE1SexPart2);
         }
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_player().removeStatusEffect(StatusEffects.Spar);
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoSexBJ() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = Utils.rand(int(get_player().cocks.length));
         outputText((playerchoice ? "你告诉爱子这次你想让她用嘴来取悦你，并急切地脱下衣服，好让事情开始。" : "爱子把你从[armor]里拉出来放在一边，用充满欲望的眼神看着你，露出一丝苦笑。") + "[pg]当你的[cocks]弹入视线时，她坏笑了一下，抬头看着你，带着调皮的笑容，用手指裹住你的[cock " + (_loc1_ + 1) + "]，开始温柔地抚摸。[say: 嗯……你已经这么硬了，]她说着，将脸颊温柔地蹭着你的腹股沟，把鼻子凑到你的[cockplural]根部，嗅着你的气味。[pg]她撅起嘴唇贴在你的根部，温柔地吸吮着你肉棒的侧面，同时手掌包裹住龟头，挤出几滴先列腺液，用它们润滑自己的手，热情地亲吻和抚摸着你的[cockplural]。她把手移开片刻，在手掌中召唤出一团淡蓝色的火焰，然后又放回你的" + (get_player().cockTotal() == 1 ? "" : "主") + "肉棒上，给它涂上一层冰凉的火焰，让你的脊背一阵发抖。" + (get_player().balls > 0 ? "她的另一只手轻轻托起你的[balls]，温柔地揉捏着，同时舌头舔舐着你[cock " + (_loc1_ + 1) + "]的下侧。" : "") + "[pg]");
         if(get_player().cockArea(_loc1_) < 40)
         {
            outputText("她大声地吧唧着嘴，在你的肉棒上下亲吻，让你的感官陷入疯狂，同时她的手在你的[cock " + (_loc1_ + 1) + "]上下滑动，指尖沿着长度拖拽。" + (get_player().balls > 0 ? "托着你的[balls]，" : "") + "爱子最后一次用舌头轻轻滑过你肉棒的下侧，张开嘴唇成一个大大的O型，用她温暖湿润的嘴将你吞没。");
            outputText("[pg]她一只手紧紧握住根部，开始前后摆动头部，让你每次温柔的挺进时，[cock " + (_loc1_ + 1) + "]都能顶到她的喉咙深处。她那水晶般湛蓝的眼睛娇羞地盯着你，嘴唇在你颤抖的男根周围弯成一个微笑。她把你压在口腔后部，吞咽了几次，喉部肌肉的轻柔起伏按摩着你[cock " + (_loc1_ + 1) + "]的龟头。");
            outputText("[pg][say: 嗯……嗯……]爱子对着你的阴茎发出轻柔的呻吟，将温柔的震动传递到肉棒上，你能感觉到有什么毛茸茸、柔软的东西开始缠绕你的双腿。她的手移到你的[hips]周围，指尖掐进你[ass]的肉里，她的几条尾巴紧紧地缠绕在你的脚踝上，一直延伸到大腿。");
            outputText("[pg]你的手在她的头顶上方悬停了片刻，有些犹豫，但爱子用她闪烁着蓝光的眼睛抬头看着你，轻轻地点了点头，嘴唇紧紧地裹住你的[cock " + (_loc1_ + 1) + "]。得到她的允许后，你将指尖埋入她银色的鬃毛中，开始向前挺动臀部，将你的肉棒插进她的喉咙。她呻吟着，发出吸溜声和淫荡的吞咽声，你开始深喉操她，她的眼睛微微翻白，唾液和先列腺液开始顺着她的下巴滴落。");
            outputText("[pg]虽然她装出一副让你掌控全局的好戏，但你能感觉到她依然在你的掌控中有节奏地摆动着头部，当她吞咽你跳动的肉棒时，喉部肌肉紧紧地收缩着。她绝对在尽自己的一份力，你很快就能感觉到你的快感达到了顶峰。");
            outputText("[pg]发出一声淫荡的呻吟，你迷失在快感中，你的[cock " + (_loc1_ + 1) + "]将滚烫的精液射进爱子的嘴里，用你充满活力的精液涂满了她的喉咙。她呻吟着，闭上眼睛，将嘴唇贴在你肉棒的根部，喉咙有节奏地收缩，努力吞咽你的精液。" + (get_player().cumQ() > 150 ? "她很努力，但最终还是失败了，精液从她的嘴角喷涌而出" + (get_player().cumQ() > 350 ? "。随着越来越多的精液顺着她的喉咙倾泻而下，她的肚子开始微微鼓起，尽管更多的精液是弄到了她身上而不是嘴里，顺着她的下巴一塌糊涂地流淌下来" : "") : "") + (int(get_player().cocks.length) > 1 ? "，你其余的[cocks]将精液洒满了爱子的胸膛和你们下方的地面" : "") + (get_player().hasVagina() ? "，你的阴道痉挛着，分泌物顺着大腿两侧滴落到地上，形成了一滩混合着性液的泥泞水洼" : "") + "。");
            outputText("[pg]一旦你的高潮结束，她紧紧地用嘴锁住你疲软的肉棒并向后拉，从你的尿道中挤出最后一点精液，当她的嘴唇伴随着轻柔的吧唧声离开时，你的[cock " + (_loc1_ + 1) + "]被清理得干干净净。她用一只袖子的衣角擦去脸上残留的精液，然后打了个可爱的嗝，拍了拍胸口说道[say: 嗯，哦，不好意思。]");
         }
         else
         {
            outputText("她大声地吧唧着嘴，在你的肉棒上下亲吻，让你的感官陷入疯狂，同时她的手在你的[cock " + (_loc1_ + 1) + "]上下滑动，指尖沿着长度拖拽。" + (get_player().balls > 0 ? "托着你的[balls]，" : "") + "爱子最后一次用舌头轻轻滑过你肉棒的下侧，张开嘴唇成一个大大的O型，包裹住龟头。她一只手紧紧握住根部，另一只手开始在露出的肉棒部分滑动，同时她温暖湿润的舌头在龟头下方滑出。她热情地舔舐着每一滴先列腺液，水晶般湛蓝的眼睛娇羞地盯着你，当她开始更快地套弄你的肉棒时，嘴唇弯成了一个微笑。");
            outputText("[pg]紧紧捏住你的根部，她夹紧了你的[cock " + (_loc1_ + 1) + "]，增加的压力让你本已充血的阴茎更加肿胀。她尽情地吸吮着龟头，让唾液和先列腺液的混合物顺着你的肉棒滴落，她用另一只手收集这些液体来润滑她的套弄。她的一条尾巴滑上来缠住你的阴茎根部，紧紧地勒住它，代替了她的手，她开始用双拳交替的技巧以狂热的速度套弄你。");
            outputText("[pg]看着你脸上掠过的愉悦表情，她咯咯地笑了起来，并加倍努力，交替着用双手套弄你和饥渴地亲吻你的肉棒。快感越来越难以承受，但她的尾巴堵住了你释放的唯一途径，从她的坏笑中你可以看出，她完全知道自己在对你做什么。");
            outputText("[pg]她的双手继续在你的[cock " + (_loc1_ + 1) + "]上下来回滑动，似乎永无止境，她的尾巴紧紧缠绕在根部，确保你永远无法释放，与此同时，你感觉到你的快感越来越高。你发现自己从头到脚都在颤抖，乞求她让你射精，你的肌肉因迟迟不来的高潮压力而紧绷。[say: 嗯……哦，我想可以吧，]她调侃道，向后仰起身子，挺起胸膛。一只手继续套弄你，另一只手伸向背后，你充满欲望地看着她，束缚她乳房的绷带变成了一条条碎片，她那美丽、挺拔的乳房弹了出来。她张开嘴，闭上眼睛，你能感觉到她尾巴的抓握突然松开了，你的高潮瞬间冲到了顶点。发出一声淫荡的呻吟，你迷失在快感中，你的[cock " + (_loc1_ + 1) + "]将滚烫的精液射满了爱子的脸和胸膛，疯狂地抽搐着。一股接一股的精液喷涌而出，几次高潮的精液终于得以自由飞翔，在她的脸和乳房上弄得一塌糊涂，又浓又热。" + (get_player().cumQ() > 350 ? "你的高潮似乎永无止境，当一切结束时，爱子的脸几乎认不出来了，被你黏糊糊的精液面具遮住了。" : ""));
            outputText("[pg]" + (int(get_player().cocks.length) > 1 ? "你其余的[cocks]将精液洒满了爱子的胸膛和你们下方的地面" + (get_player().hasVagina() ? "，而且你的" : "") : (get_player().hasVagina() ? "你的" : "")) + (get_player().hasVagina() ? "阴道痉挛着，分泌物顺着大腿两侧滴落到地上，形成了一滩混合着性液的泥泞水洼。" : ""));
            outputText("[pg]" + (get_player().cumQ() <= 350 ? " [say:嗯……]爱子发出一声轻柔的呻吟，咽下了射进她嘴里的精液，并开始用衣袖的边角清理自己。" : "[say:嗯……你可以停下了，]爱子调侃道，她像个小女孩一样咧嘴笑着，擦去一层精液，自顾自地咯咯笑着。[say:该死，你弄得一团糟，]她补充道，开始用衣袖的边角清理自己。"));
            outputText("[pg]清理干净后，她收起绷带，小心翼翼地再次开始缠绕胸部。");
         }
         outputText("[pg]爱子站起身来，拍了拍身上的灰尘，臀部轻轻地来回摇摆。");
         outputText("[pg][say:啊，真有趣，]她说着，伸了个懒腰，发出一声可爱的叹息。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2357,FlagDict_Impl_.arrayReadInt(_loc2_,2357) + 1);
         postSexUpdate();
         get_player().orgasm("Dick");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1)
         {
            doNext(aikoE1SexPart2);
         }
         else
         {
            outputText("[pg]当你从满足的恍惚中恢复过来后，你开始收拾东西，重新穿上你的[armor]，向爱子告别，然后返回营地。");
         }
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            get_player().removeStatusEffect(StatusEffects.Spar);
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你告诉她你想和她做爱" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2361) > 0 ? "，但你这次不是来强迫她的" : "") + "。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
         {
            outputText("听到你这么说，她似乎很高兴，并急切地开始脱衣服。");
            outputText("[pg][say: 你不知道我听到这个有多高兴，]她说着，把衣服扔到一边。[say: 我在这里孤独得快发疯了，没有人可以说话，我需要一点陪伴，而且……哦，我现在在胡言乱语了……]");
            outputText("[pg]你对她如此急切地想要开始感到有些好笑，但你不能抱怨她的热情。");
            aikoConsSex();
         }
         else
         {
            outputText("[say: 你就是听不进去，是吗？]她摇着头说道。[say: 你知道，如果我觉得我可以信任你，我可能就会让你这么做了。]");
            outputText("[pg]你可以从她的眼睛里看出她实际上非常渴望一些陪伴，但她的需求很难战胜她的骄傲和对你明显的厌恶。");
            outputText("[pg]但你也有需求……你打算怎么解决？");
            menu();
            addButton(0,"道歉",aikoApologize2).hint("为自己是个刻薄的混蛋而道歉。");
            addButton(1,"强迫",aikoFight).hint("你也有需求！强迫她。");
            addButton(14,"离开",leave).hint("不要强求。你搞砸了，别把气撒在她身上。");
         }
      }
      
      public function aikoRequestsBallAfterLose() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你转身离开倒下的狐妖，准备离开，但当你感觉到她的手绝望地抓住你的[armor]时，你停了下来。");
         outputText("[pg][say: 等等！求求你！我需要……我需要我的宝珠……没有它，我的村子……][pg]" + (!get_player().isPureEnough(60) ? "你愤怒地拍开她的手，怒视着这个无礼的女孩。" : "") + " 你的手本能地伸向[inv]，那里放着你之前找到的白色宝珠。她似乎真的非常渴望拿回它……你要把它给她吗？");
         menu();
         addButton(0,"给予",aikoLoseGiveBall).hint("快把那该死的宝珠给她吧……");
         addButton(1,"不给",aikoLoseRefuseBall).hint("她不配拥有它。");
      }
      
      public function aikoRapeSex() : void
      {
         menu();
         addButton(0,"操小穴",aikoRapeFuckVag).hint("用力操她的小穴。").sexButton(1);
         addButton(1,"操屁眼",aikoRapeFuckAss).hint("尝尝那紧致多汁的屁股！").disableIf(get_player().cockThatFits(50) < 0,"你的肉棒太大了，塞不进她的屁眼。").sexButton(1);
         addButton(2,"羞辱",aikoRapeHumiliate).hint("让她成为你的宠物母狗！");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) == 1)
         {
            addButton(3,"拳交",aikoFistHer).hint("感受一下她小穴里的滋味。");
            addButton(4,"被舔",aikoRapeGetLicked).hint("让她用舌头探索你小穴柔软的褶皱。").disableIf(!get_player().hasVagina(),"这个场景需要一些女性器官，你懂的……");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) != 1)
         {
            addButton(14,"离开",aikoRequestsBallAfterLose).hint("不碰她，直接离开空地。");
         }
         else
         {
            addButton(14,"离开",leave).hint("不碰她，直接离开空地。");
         }
      }
      
      public function aikoRapeHumiliate() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("当你站在倒下的女祭司上方时，你的目光游移到她那毛茸茸的尾巴和狐狸耳朵上。这个可爱的狐狸女孩挑衅却又挫败的表情，只会增强你想把她变成宠物的欲望。当她注意到你走上前跪在她身上时脸上浮现的邪恶笑容，她的表情带上了一丝恐惧。");
         outputText("[pg][say: 你、你要做什么？不管是什么，请快点——啊嗯……]");
         outputText("[pg]当你的手指轻轻抚摸她的耳朵时，她的话说到一半就停住了，她的脖子不由自主地向后抽搐，她的话语变成了呜咽。你告诉她，如果她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) == 0 ? "想要回她的宝珠" : "不想再受到伤害") + "，她就会表现得像个好宠物。在揉了揉她的耳朵，用手指穿过她柔软的银金色头发片刻后，爱子抬起头，泪流满面地向你点了点头，羞愧地低下头，接受了你这侮辱性的对待。");
         outputText("[pg]当你逐渐开始脱去她的衣服时，你特别注意她那丰满的乳房和不断变硬的乳头，当你温柔的服侍让她开始轻声呻吟时，你淫荡地笑着。当你的指尖开始顺着她的脊椎向下滑动时，她低沉的呻吟和喘息慢慢开始变得疯狂和恐惧。你的手越靠近她那毛茸茸的尾巴，她的呼吸就越吃力，你慢慢开始明白是怎么回事了。");
         outputText("[pg]你戏弄着她，开始把手悬停在她的尾巴上方，她脱口而出抗议道，[say: 拜、拜托，不要！以前从来没有人碰过我的尾巴！]");
         outputText("[pg]你" + (playerJerk() ? "立刻扇了她一巴掌" : "在她的鼻子上轻轻敲了一下以示惩戒") + "，让她那微不足道的反抗安静下来——你让她知道，" + (get_player().isPureEnough(50) ? "至少现在" : "") + "她属于你，不管她过去的经历如何，特别是如果她还希望能拿回她的宝珠的话。命令她四肢着地，战败的狐狸女孩只能服从，她犹豫地摆好姿势，顺从地红着脸" + (playerJerk() ? " 并流下眼泪" : "") + "，继续呜咽着。");
         outputText("[pg][say: 拜托……我只求你对我温柔一点。]");
         outputText("[pg]你让她知道她的请求已得到充分注意，但这只取决于你的意愿。你的手终于接触到了她，开始抚摸，好奇地想全面测试她的敏感度。你以温柔的动作开始，爱子的反应超出了你最狂野的想象。她的眼睛翻白，舌头开始伸出，身体随着你抚摸的节奏抽搐和扭动，因为她正经历着高潮迅速逼近的明显迹象。很明显她很享受你的对待，但对她来说不幸的是，你的仁慈已经到了尽头。你将温柔抚摸的手掌变成" + (playerJerk() ? "紧握的拳头" : "坚定的抓握") + "，抓住其中一条毛茸茸的肢体，爱子作为回应弓起背，发出一声嚎叫。她困惑的叫声在快乐和痛苦之间交替，但随着她滴水的小穴开始变成汹涌的洪水，你很容易就能看出哪种感觉占了上风。她的淫液浸透了她的大腿，她的膝盖弯曲，瘫倒在地上，无法支撑自己的重量，因为高潮带来的抽搐让她无法站立。");
         outputText("[pg]在她的身体终于停止抽搐后，爱子彻底被击败了，" + (playerJerk() ? "在自己的耻辱池中可怜地哭泣，" : "") + "但你还远未结束。你把她转过来，这样你就可以把嘴唇紧紧贴在她的嘴唇上，把舌头伸进她的喉咙，在她的嘴里淫荡地呻吟，同时你的手粗暴地抓住她后脑勺的头发。你打破了吻，只是为了开始在她的耳边热烈地呼吸，当她从短暂的激情中融化时，你低声承诺她的痛苦只会让位给更大的快乐。爱子已经被她的耻辱所打破，低下头，准备忍受任何痛苦以拿回她的球。[pg]");
         if(get_player().hasVagina())
         {
            outputText("你抓住她的头发把她的头向后拉，站在她上方，眼中充满欲望，同时将你的[pussy]降向她的嘴唇，无视她抗议的呜咽。伴随着突然有力的推挤，你将她的嘴唇压在你的[clit]上，发出一声呻吟，因为她不情愿地开始舔你的裂缝。你慢慢开始利用你[hips]的重量强迫她仰面躺下，改变你的位置，一旦她完全瘫倒在地上就转过身来，这样你就可以俯身抓住她的一条尾巴。[pg]她对着你的胯部喘息，因突然的感觉而颤抖，你咧嘴一笑" + (get_player().cor >= 50 ? "邪恶地" : "") + "，因为你突然有了一个奇妙而可怕的主意。将你的臀部在她的脸上摩擦，你开始卷起她的尾巴，瞄准她闪闪发光的小穴，带着残忍的假笑，你强行将那毛茸茸的附肢塞了进去。爱子发出一声震动你核心的尖叫，你开始以新的活力骑乘她的舌头，你的双手紧紧抓住她的尾巴，粗暴地抽插。她愉悦的抽搐变得越来越不规律，你不得不将大腿夹紧她的头部两侧，以防止她从你身下挣脱，决心不让她剥夺你自己的高潮。");
            outputText("[pg]终于，这位蒙羞的祭司笨拙的舌头开始将你的快感推向顶峰，这在很大程度上归功于被她自己的尾巴粗暴地操弄而引起的失控挣扎。你的女性汁液浸透了她的脸，同时她也经历了她自己的高潮，空气中弥漫着性爱后麝香般的气味。[pg]");
            get_player().orgasm("Vagina");
         }
         if(!get_player().hasCock() && get_player().hasVagina())
         {
            outputText("你颤抖着慢慢下来，站起身，留下几乎昏迷的狐妖变态地瘫倒在地上，被你们混合的汁液浸透。[pg]");
         }
         else
         {
            outputText("你微微颤抖，准备下来，但腹股沟的轻微跳动提醒你，你还没有照顾好你的男性部分。[pg]");
         }
         if(get_player().hasCock())
         {
            _loc1_ = Utils.rand(int(get_player().cocks.length));
            if(!get_player().hasVagina())
            {
               outputText("你粗暴地抓住她的头发把她拖到仰面躺下，无视她发出的痛苦叫声，你将自己置于她上方，从头到脚，慢慢降低自己，用膝盖压住她的肩膀。抓住她的一条尾巴，你开始卷起它，瞄准她闪闪发光的小穴，带着" + (!get_player().isPureEnough(60) ? "残忍的" : "") + "假笑，你强行将那毛茸茸的附肢塞了进去。[pg]");
            }
            else
            {
               outputText("你抬起臀部，将你的[cock " + (_loc1_ + 1) + "]对准她的嘴，将龟头压在她紧闭的嘴唇上。你伸出手，紧紧捏住她的鼻子，强迫她张开嘴，以免她窒息，她不情愿地开始吞咽你的巨物" + (get_player().cocks[_loc1_].cockThickness >= 3 ? "，被你的粗壮噎住" : "") + "。[pg]你开始增加抽插的凶猛程度，无论是你喉咙里的[cock]还是捶打她小穴的尾巴，爱子发出一声尖叫，在你的阴茎尖端周围震动。[pg]");
            }
            if(get_player().cockArea(_loc1_) <= 50)
            {
               outputText("你开始带着动物般的激情骑乘她的喉咙，你的双手粘在她的尾巴上，从两端无情地捣弄她。她在你身下咯咯作响并抽搐，拼命试图在抽插之间喘口气，你不得不将大腿夹紧她的头部两侧" + (get_player().isHerm() ? "再次" : "") + "，以防止她挣扎得太厉害，感觉到你的高潮开始涌现。[pg]当你感觉到你的快感开始沸腾时，你发出一声强烈的呻吟，最后一次将自己向下推。爱子被你的[cock " + (_loc1_ + 1) + "]噎住，因为阴茎开始因精液的涌入而肿胀，并且" + (get_player().cumQ() <= 150 ? "你向抽搐的通道发射了几条粘稠的精液，让她咳嗽和结巴。" : (get_player().cumQ() > 150 && get_player().cumQ() <= 350 ? "你向她的喉咙释放了一股浓稠的精液，让她窒息和结巴，因为它开始倒流并在她嘴角起泡" : "你用浓稠、充满活力的精液淹没了她的食道，强迫如此多的精液进入她的喉咙，以至于她的肚子开始因其巨大的体积而膨胀。")) + "[pg]");
            }
            else
            {
               outputText("你用力压迫她，但随着女孩的挣扎越来越绝望，你终于承认你根本无法将你巨大的阴茎再塞进她的喉咙。由于她未能达到你的标准，你感到不满，你将你的阴茎从她的喉咙里拔出来，给她一点时间咳出一团先列腺液，然后给她一个" + (playerJerk() ? "响亮的耳光。如果她太无能，无法用她的嘴取悦你，那么你将不得不找到另一种方法让她让你高潮……" : "温柔的拍打在屁股上，通过责骂她来表现你的统治地位") + "[pg]你将你的阴茎向下移动到她挺拔的棕褐色乳房之间，指示她像一个好宠物一样用它们取悦你。她顺从地举起双手，将它们挤压在你的[cocks]两侧，来回按压和揉捏，因为你用她自己的尾巴操她的折磨，她在可耻的狂喜中呻吟。你满意地点点头，将注意力转回到惩罚这个小荡妇上，将她的尾巴在她的湿润小穴里进进出出" + (playerJerk() ? "带着不必要的残酷力量" : "") + "。[pg]虽然这不是深喉，但她近乎完美的乳房肉的难以置信的柔软摩擦着你的[cocks]，很快就让你达到了高潮。伴随着一声强烈的呻吟，你松开她的尾巴，将手移到她的乳房上，控制着你来回挺动，" + (get_player().cumQ() <= 150 ? "终于将你的精液释放到狐狸女孩的肚子上，用你的气味涂抹它" : (get_player().cumQ() <= 350 ? "在她的肚子上泵出浓稠的精液，溢出她的两侧并浸透地面" : "在狐狸女孩的下半身射出一股又一股的精液，给她涂上一层厚厚的精液")) + "。[pg]");
            }
            get_player().orgasm("Dick");
         }
         outputText("你退后一步，看看你的杰作，" + (playerJerk() ? "对你所做的事情感到一种扭曲的自豪感，满意地傻笑。" : "对你对这个可怜女孩的残酷对待感到有点可耻，因为一种挥之不去的内疚感在你的肠胃里降临。") + "[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) == 0 ? "你决定你应该奖励她的服从，从你的[inv]中拿出球，并在" + (playerJerk() ? "塞进" : "轻轻地放在") + "她的嘴里之前，在上面涂抹一些你剩余的精华，然后像对待狗一样抚摸和赞美她。你发现她的一些尾巴对你的贬低待遇做出了无力的摇摆，她的精神崩溃了，至少目前是这样。" : "你像对待狗一样抚摸和赞美她，并发现她的一些尾巴对你的贬低待遇做出了无力的摇摆。她的精神崩溃了，至少目前是这样。") + "[pg]" + (playerJerk() ? "对自己感到无比自豪" : "对自己感到有点厌恶") + "，你转身回到营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         postRapeUpdate();
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoRapeGetLicked() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你对着倒下的祭司咧嘴一笑，慢慢脱下你的[armor]" + (get_player().hasCock() ? "，把你的[cocks]" + (get_player().balls > 0 ? "和[balls]" : "") + "挪开" : "") + "，骄傲地向她展示你的[pussy]。你向她解释说，作为胜利者，你有权获得战利品，而你想要的是她的尊严。为了强调这一点，你把手放在她的头上，开始慢慢地、居高临下地抚摸她的头。[pg][say: 别、别把我当成你的宠物狗——][pg]你把她的脸按在你的骨盆上，强迫她的嘴唇贴在你的[pussy]上，用一声呻吟让她闭嘴。她太虚弱、太屈辱了，无法反抗，起初只发出一声尖叫，然后就认命地开始用她天鹅绒般柔软的舌头在你的阴唇上舔舐。你发出一声呻吟，把手移到她的后脑勺，用压倒性的力量强迫她更深地埋进你的小穴，你的汁液顺着她的下巴自由地流淌。[pg]");
         if(get_player().hasCock())
         {
            _loc1_ = Utils.rand(int(get_player().cocks.length));
            outputText("你抓住她的手臂举起来，把她的手按在你的[cock " + (_loc1_ + 1) + "]侧面。她似乎明白了你的意思，本能地开始来回套弄，可怜地呜咽着。" + (int(get_player().cocks.length) > 1 ? "她的另一只手抬起来抓住你的另一根肉棒，你带着满意的坏笑，开始急切地把骨盆往她脸上蹭。" : "") + "");
            outputText("[pg]你抓着她的头发把她往后拉了一会儿，她大口呼吸着新鲜空气，发出一声喘息，她的脸上沾满了你的汁液。她的脸颊通红，你可以看出，吸入你的气味和汁液已经非常有效地唤醒了她。当她还在绝望地喘息时，你再次把她的脸深深地埋进你的胯部，急切地骑着她的舌头，随着你越来越接近高潮。[pg]");
            get_player().orgasm("Dick");
         }
         outputText("她抬头怒视着你" + (get_player().hasCock() ? (int(get_player().cocks.length) > 1 ? "夹在" : "绕着") + "你的[cocks]" : "") + "，热切地用舌头舔舐着你的[pussy]，七条尾巴在身后来回甩动。不管她对你怀有多少怨恨，她的呻吟声还是震颤着传遍你的全身，很快就让你再也无法忍受。你用全身的重量压在她脸上，让她淹没在你滑腻的女孩淫液中，她别无选择，只能尽快吞咽下去。" + (get_player().hasCock() ? "与此同时，你的[cocks]在她持续的爱抚下胀大，快感迸发，一股股精液喷射在她身后的地面上。" : "") + "[pg]你满足地颤抖着，从她身上下来，轻轻推了她一把，她顺势就仰面倒了下去。她的脸和衣服上半部都浸透了你的精华，嘴巴大张，舌头耷拉在外。她双腿不知羞耻地大张着，微微抽搐，一小滩液体从她腿间慢慢扩散开。你俯身拍拍她的头，说她是个[say: 乖女孩，]然后笑着捡起你的[armor]离开，留下这个女祭司沉浸在自己的羞耻之中。");
         postRapeUpdate();
         get_player().orgasm("Vagina");
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoRapeFuckVag() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = Utils.rand(int(get_player().cocks.length));
         outputText("趁着女祭司战败占她便宜的诱惑实在太大了，你无法拒绝。你粗暴地抓住她长袍下半部分的腰带，用力拉扯直到它松开，然后用它把爱子的双手绑在背后。她没有怎么反抗，但她脸上担忧的神情告诉你，她对你的意图已经有所察觉。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1)
         {
            outputText("[say:我……求求你，我只是想要回我的宝珠，]当你把她翻转过来平躺时，她抬头看着你恳求道。" + (playerJerk() ? "你狠狠地扇了这个无礼女孩一巴掌，叫她别哭了，闭上她那张婊子嘴。这是她试图欺骗你的惩罚，如果你待会儿心情好，也许会大发慈悲地把它还给她。" : "") + "你急不可耐地把她的长袍扔到一边，分开她的双腿，露出一条湿润的小缝，在她的阴阜上方还有一个可爱的莲花纹身。你带着淫荡的笑容，脱下你的[armor]，露出你的[cocks]，开始变态地在她身上摩擦。[pg][say:求、求求你！你想做什么都行，但是……但是你得答应我！]她说着，眼角泛起了泪花");
         }
         else
         {
            outputText("[say:我……求求你，我不想和你打的！]当你把她翻转过来平躺时，她抬头看着你恳求道。" + (playerJerk() ? "你狠狠地扇了这个无礼女孩一巴掌，叫她别哭了，闭上她那张婊子嘴。" : "") + "你急不可耐地把她的长袍扔到一边，分开她的双腿，露出一条湿润的小缝，在她的阴阜上方还有一个可爱的莲花纹身。你带着淫荡的笑容，脱下你的[armor]，露出你的[cocks]，开始变态地在她身上摩擦。[pg][say:求、求求你！你为什么要这么做？！]她说着，眼角泛起了泪花");
         }
         outputText("当你的手扯开她的裹胸布，让她那挺拔的D罩杯弹出来时。" + (playerJerk() ? "你又扇了她几巴掌，叫她闭嘴" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 1 ? "，别再提她那破宝珠了" : "") + "。你敢发誓你告诉过这个婊子把她那该死的嘴闭紧！" : "你尽力摆脱内心的负罪感，知道自己已经陷得太深，无法回头了。") + "她抽泣了一下，咬着嘴唇。看来她已经准备好忍受你打算对她做的一切了，尽管她在这个问题上也没有多少选择的余地。" + (playerJerk() ? "至少现在，也许她能停止抱怨，让你爽完！" : ""));
         outputText("[pg]你把你的[cock " + (_loc1_ + 1) + "]抵在她颤抖的小穴上，稍微用力压了下去。她湿润的爱洞很紧，但还是相对容易地接纳了你。当你一点一点地沉入她体内时，你发出一声呻吟，她柔软而肌肉发达的肉壁紧紧包裹着你，用一种近乎空灵的温暖包围着你。" + (get_player().cocks[_loc1_].cockLength >= 40 ? "正当你确信她应该无法再承受你巨大的阳具时，一阵吸吮般的收缩把你拉得更深。" : "") + (get_player().hasKnot(_loc1_) ? "当你感觉到你的肉结顶在她的阴唇上时，你转移重心压在她身上，开始用你的[cock " + (_loc1_ + 1) + "]猛捣她的小穴。" : "当你感觉到你的臀部撞击着她的臀部时，你转移重心压在她身上，开始用你的[cock " + (_loc1_ + 1) + "]猛捣她的小穴。") + "你把注意力转移到把玩她的乳房上，" + (get_player().hasPerk(PerkLib.Sadist) ? "痛苦地咬着她的乳头" : "捏着她的乳头") + "，同时你的臀部粗暴地撞击着她。当你开始加快你狂暴的抽插时，爱子咬着嘴唇，看向一旁，她的脸颊涨得通红。从她喉咙肌肉紧绷的方式，你可以看出她正在尽力压抑自己的呻吟。");
         if(playerJerk())
         {
            outputText("[pg]你粗暴地抓住她的头发，把她拽回来面对你，冲她吼道，你操荡妇的时候喜欢看着她们的眼睛。她温顺地顺从了，眨着眼睛挤出泪水。对，真是个好荡妇……");
         }
         outputText("[pg]如果说她有什么优点的话，那就是她知道如何取悦一根肉棒——她的小穴以令人难以置信的控制力在你周围起伏，用一种只能是熟练技巧的方式挤压、拉扯和揉捏你的肉棒。你只能假设她试图让你快点射精，这样她就能结束这一切，如果这样下去，她可能真的会如愿以偿。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]你感觉到自己快要射了，于是把肉结狠狠地顶了进去，爱子紧致的小穴几乎没有足够的空间让你挤进去，但它还是卡在了原位并膨胀到了最大，把你们锁在了一起。");
         }
         if(get_player().cumQ() <= 150)
         {
            outputText("[pg]当你的高潮终于沸腾而出时，你发出一声响亮的呻吟，" + (get_player().hasKnot(_loc1_) ? "把精液射进爱子被蹂躏的小穴里，然后强行拔出你的肉结，这让爱子非常不悦，她因为强行拔出的疼痛而尖叫起来。" : "把几股精液射进爱子被蹂躏的小穴里，拔出来，让最后几股精液喷在她的肚子上。"));
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("[pg]你发出一声响亮的呻吟，感觉到你的[cock]明显膨胀，一条名副其实的精液之河涌入爱子被蹂躏的小穴。" + (get_player().hasKnot(_loc1_) ? "你的肉结阻止了你的精液漏出，她的肚子明显鼓了起来，然后你强行拔出你的肉结，这让爱子非常不悦，她因为强行拔出的疼痛而尖叫起来。" : "你肆意地抚摸着自己，从她体内拔出，把剩下的精液倒在她的肚子上，几股迷路的精液落在她的乳房上，弄脏了她的头发。"));
         }
         else
         {
            outputText("[pg]当你的高潮终于袭来时，你发出一声响亮的呻吟，" + (get_player().hasKnot(_loc1_) ? "把你的肉结插得更深了一点，伴随着爱子愉悦的呻吟，让你那非人般巨大的高潮涌入爱子被蹂躏的小穴和子宫。她的肚子开始明显鼓起来，变成一个淫秽的圆形凸起，但你的精液无法逃过你紧紧密封的肉结。你们被锁在一起，直到你的高潮结束几分钟后，你的肉结卡得太紧，无法直接拔出。一旦它开始缩小，你就强行拔出你的肉结，这让爱子非常不悦，她因为强行拔出的疼痛而尖叫起来。" : "再次将你的臀部撞向她，让你那凌乱的高潮喷射进爱子被蹂躏的小穴里。她的肚子开始明显鼓起来，变成一个淫秽的圆形凸起，然后你拔出来，你的[cock]仍在空中喷射着精液。你滚烫的精液覆盖了她的身体，让她被你麝香般的男人精华彻底浸透。"));
         }
         outputText("[pg]你站起来，拍了拍身上的灰尘，拿起你的[armor]。爱子抬头看着你，她的双腿仍然以一种淫荡的姿势张开着，你的精液从她的阴道里流出来，在地上她那两个柔软的屁股蛋之间积成一滩。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) == 0)
         {
            outputText("[pg][say:你得到了你想要的……]她几乎是低语着说。[say:现在你能把我的宝珠还给我了吗？]");
            outputText("[pg]你觉得这玩意对你也没啥用，而且她干起来还挺爽的，于是你把手伸进[inv]里掏出宝珠，随手扔了过去。宝珠掉在爱子双腿间形成的粘稠精液坑里，溅起几滴落在她的大腿上。");
         }
         outputText("[pg]你留她自己想办法解开绑绳，然后转身回了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         postRapeUpdate();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoRapeFuckAss() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = get_player().cockThatFits(50);
         outputText("你淫荡的目光在倒下的女祭司身上游走，最后停留在她那丰满的臀瓣上，那是不端庄的袍子暴露出来的。你下定决心，伸手扯下她长袍的下半部分，压在她身上防止她挣扎。");
         outputText("[pg][say: 什，等等，不，你在干什么——]");
         outputText("[pg]" + (playerJerk() ? "你反手扇了她一巴掌，提醒她如果想拿回宝珠，就乖乖闭嘴做个好婊子。" : "你给了她一个惩戒性的轻拍，提醒她如果想拿回宝珠，就乖乖坐好。") + " 她从你身边缩开，顺从地把丰满的后臀撅到半空中，尾巴也翘了起来，露出她那闪闪发光的裂缝和可爱的雏菊。你用力地在她的屁股上拍了一下，当那柔软的臀瓣长时间地泛起涟漪和晃动时，你几乎高兴得要晕过去了。");
         outputText("[pg]装饰在她屁股上的巨大螺旋状纹身似乎是你抓住两边臀瓣的完美位置，你用你的肉棒顺着她的裂缝滑动，沾满了她滑溜溜的汁液作为润滑。当她感觉到你把[cock " + (_loc1_ + 1) + "]紧紧贴在她的雏菊上时，她发出一声轻柔的呜咽，肩膀向地面低垂，紧紧抓住泥土。");
         outputText("[pg][say: 请温柔点……]当紧致的肉环开始在你的龟头周围扩张时，她说道。当你把第一英寸插进去时，她的脸变得通红，她丰满的臀瓣紧紧夹住你的[cock " + (_loc1_ + 1) + "]，饥渴地呻吟着。");
         if(get_player().cockArea(_loc1_) >= 40)
         {
            outputText("[pg][say: 啊！不……不，不要了，进不去的……咿呀！]当你轻松地又插进四英寸时，她的话说到一半就停住了。进不去？怎么可能，你一边告诉她，一边用力打她的屁股。你告诉她，她那淫荡的屁眼可不这么认为——它简直要把你的老二吞下去了！");
         }
         outputText("[pg]你的臀部最后用力向前一挺，迫使爱子的喉咙里发出一声尖叫，因为她终于被" + (get_player().hasKnot(_loc1_) ? "你的整根肉棒一直插到肉结，这开始把她的雏菊撑得相当大。" : "你的整根肉棒刺穿了。") + " 当你捏着她美味的屁股时，你几乎无法控制自己，开始不顾一切地快速抽插起来。");
         outputText("[pg]爱子尖叫着，但很难分辨是因为痛苦还是快乐。" + (playerJerk() ? "你发现自己希望是前者，为了自己自私的快乐而粗暴地虐待她的屁股。" : "") + " 她的直肠收缩你阴茎的方式非常美妙，内壁的肉感觉像枕头一样柔软温暖，随着每一次抽插在你的[cock " + (_loc1_ + 1) + "]上泛起涟漪。");
         outputText("[pg]你迷失在快感中，对这位可爱女祭司的哭喊充耳不闻，因为她的屁股一次又一次地被你的肉棒刺穿，每一次抽插都把你拉得越来越接近高潮。" + (playerJerk() ? " 你报复性地微笑着，俯身压在她身上，指甲痛苦地掐进她的背里，同时更用力地操她的屁股，她痛苦的尖叫让你充满喜悦。" : "") + " 终于，你再也受不了了，" + (get_player().hasKnot(_loc1_) ? "用尽全力向前挺动臀部，把你的肉结埋在她的屁股里，" : "") + " 你的肉棒因为精液而膨胀，开始把你的欲望倾泻进这个女孩被虐待的肉洞里。" + (get_player().cumQ() > 350 ? "她的肚子开始因为你的精液而膨胀，当你把一发又一发的精液射进她的体内时，发出了清晰的咕噜声。当你的肉棒终于停止痉挛时，她明显比以前更圆润、更重了，被你灌满的巨大精液量压得喘不过气来。" : ""));
         if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]你因为肿胀敏感的肉结而和她连在一起了一会儿，几分钟后才开始变软。");
         }
         outputText("[pg]当你拔出来时，她的屁股在你的肉棒周围发出湿滑的吸溜声，一团精液跟着流了出来，溅在地上。" + (playerJerk() ? "爱子躺在一滩主要由她自己的淫液、眼泪和耻辱组成的液体中，轻声哭泣。" : "") + "你站起来拍了拍身上的灰尘，在这个狐妖女祭司的屁股上重重地拍了一下" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) == 0 ? "，然后" + (playerJerk() ? "拿出她的宝珠，邪恶地笑着，一个卑鄙的想法浮现在你的脑海中。你把宝珠抵在爱子被蹂躏的肛门上，把它推了进去，引起了她喉咙里又一声羞耻的呻吟。好吧，她说她想要回它，现在她如愿以偿了，你带着可怕的笑容在心里想着，然后动身回营地。" : "轻轻地把她的宝珠扔在她旁边的地上，动身回营地。") : " 然后动身回营地。"));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         postRapeUpdate();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoPeaceGreeeting() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你正犹豫要不要把这当成威胁，爱子却扑哧一声笑了出来。[say: 哈哈，开玩笑的啦。你看起来挺靠谱的。不过说正经的，把我的球还给我。][pg]你勉强挤出一个笑容，尴尬地陪着笑。算你倒霉——就算她没有表现出强烈的攻击性，你还是觉得爱子脑子有点不太正常。不过话说回来，也许这对她们这种生物来说很正常？[pg][say: 好吧，听着，我有个提议。我挺喜欢你的，所以我愿意跟你做个交易。而且，刚才逗你玩也挺开心的，所以……要怎样你才肯把球还给我呢，嗯？财富？力量？还是……发泄一下？] 她娇媚地说着，转过身去，调皮地拍了拍自己丰满多汁的臀部，露出了臀部上的两个螺旋状纹身。");
         outputText("[pg]不管这个球是干什么用的，它对她来说似乎非常重要。你也许能让她做任何事……你会要求什么呢？");
         menu();
         addButton(0,"财富",aikoE1Riches).hint("");
         addButton(1,"力量",aikoE1Power).hint("");
         addButton(2,"性爱",aikoE1SexPart1).hint("");
         addButton(3,"无",aikoE1Nothing).hint("还给她，这毕竟是她的东西。");
         addButton(4,"毛茸茸的尾巴",aikoTouchFluffTail).hint("");
      }
      
      public function aikoMenu() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你走进古树所在的空地，呼唤着爱子。[pg]");
         if(get_aikoCorruption() < 50)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               _loc1_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50 ? Utils.rand(3) : Utils.rand(2) + 1;
               if(_loc1_ == 0)
               {
                  outputText("[say:动力突击！][pg]还没等你反应过来，你感觉爱子的大腿突然猛地压在你的肩膀上，她似乎是从天而降。" + (get_player().get_str() > 60 ? "这一下撞击让你吓了一跳，但你保持住了平衡，并把她放到了地上。" : (get_player().get_str() >= 30 ? "这一下撞击让你喘不过气来，但幸好爱子很轻，你成功地把她安全地放到了地上。" : "你在撞击的力道下弯下了腰，结果脸朝下摔倒在地，爱子坐在你的背上。[say:嘿嘿，哎呀。抱歉！]她边说边把你扶起来。")) + "[pg]");
               }
               if(_loc1_ == 1)
               {
                  outputText("过了一两分钟，这位可爱的狐妖巫女从森林里走了出来，她的弓挂在肩上。她的额头上有几块污渍，看起来她刚才出去打猎了。看到你她很高兴，她去梳洗了一下，几分钟后回来了，看起来和往常一样一尘不染。[pg]");
               }
               if(_loc1_ == 2)
               {
                  outputText("树枝微微沙沙作响，突然她荡了下来，膝盖挂在其中一根较低的树枝上。她咧嘴大笑，松开手，优雅地翻身落地……结果没站稳，惊叫一声滑倒在她丰满的臀部上！她爬起来，拍了拍身上的灰尘，试图装作什么都没发生，但你还是忍不住轻笑了一下。[pg]");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 75)
               {
                  outputText("她给了你一个快速的拥抱，并在你的脸颊上啄了一下作为问候。");
               }
               outputText((get_aikoCorruption() <= 20 ? "然后她走到大树旁，随意地靠在树上，双手背在身后，可爱地对你微笑。她和往常一样充满活力、热情洋溢。" : (get_aikoCorruption() <= 40 ? "然后她走到树前，看起来比平时少了几分活力。她眼中昔日的光芒已经黯淡，取而代之的是某种……别的东西的闪烁。你想知道你是不是开始对她产生了一点影响。" : "她走路的姿势有些奇怪，她身上似乎有些……不对劲。你开始怀疑和你在一起已经严重影响了她的性格。")) + "整个空地沐浴在树枝间跳跃的空灵火焰发出的柔和蔚蓝光芒中。[pg][say:嗨，[name]，怎么了？]");
            }
            else
            {
               outputText("当一支箭从你头顶呼啸而过，砰的一声钉在你身后的一棵树上时，你不得不低下头。爱子从灌木丛中走出来，拔出另一支箭，走到古树旁站定。" + (get_aikoCorruption() <= 20 ? "你可以看到她眼中和往常一样闪烁着生命和骄傲的火花。" : (get_aikoCorruption() <= 40 ? "她眼中生命和骄傲的火花消失了，取而代之的是更冷酷的东西。你怀疑她要感谢你。" : "她走路的姿势似乎有一种令人不安的摇晃，就像她有点失去平衡一样。她的眼神表明她的精神可能也有些失常。")) + "空灵的蓝色火焰在空地周围跳跃，将一切笼罩在苍白、幽灵般的光芒中。[pg][say:那是警告射击……你想要什么？]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) == 4)
            {
               outputText("[pg]你现在相当自信，凭记忆就能找到回这里的路。");
               outputText("[pg][b:（巨树已添加到地点菜单中。）]");
            }
            menu();
            addButton(0,"外貌",aikoAppearance).hint("检查那只狐妖。");
            addButton(1,"交谈",aikoTalk).hint("和狐妖女孩聊天。");
            addButton(2,"性爱",aikoSex).hint("和狐妖爱子共度欢乐时光！");
            addButton(3,"切磋",aikoSpar).hint("进行一些友好的切磋。");
            addButton(5,"交谈与性爱",aikoTalkAndSex).hint("聊聊天，然后和狐妖爱子共度一段欢乐时光！");
            addButton(6,"战斗",aikoFight).hint("攻击那个狐狸婊子！");
            addButton(14,"离开",leave).hint("离开空地");
         }
         else
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               outputText("没过多久，那个疯狂的狐妖守卫就从森林里出现了，身上布满了新鲜的擦伤和瘀伤。从她头发上粘结的体液可以明显看出，她又出去恐吓森林里的生物了，而她身上散发出的刺鼻的性爱气味告诉你，她又有了新的战利品。");
            }
            if(_loc1_ == 1)
            {
               outputText("这个疯狂的祭司从灌木丛中拖着身子走出来，脸上挂着疯狂的笑容。从她伤口的性质来看，你猜她一直在恐吓巨蜂，她还在舔着前臂上粘稠的金色残留物，这进一步证实了你的想法。");
            }
            if(_loc1_ == 2)
            {
               outputText("一把柴刀在空中划过，险些擦过你的头，伴随着一声响亮的“砰”声砍在树上，吓得你赶紧低头躲避。爱子从森林中走出，发出一阵堕落的笑声，像秃鹫盯着尸体一样盯着你。过了一会儿，她似乎控制住了自己那几乎无法抑制的疯狂，但很明显，她因为某件事而情绪激动。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 60)
            {
               outputText("[say: 回来玩了吗，亲爱的？我一直很期待呢……]");
            }
            else
            {
               outputText("[say: 又回来了？你最好别浪费我的时间……]");
            }
            outputText("她走上前靠在树上，双臂交叉在胸前，带着可怕的笑容看着你。病态的紫色火焰在树枝间蜿蜒，让整个空地笼罩在一种令人毛骨悚然的淡紫色光芒中，似乎遮蔽了所有外界的光线。空气中弥漫着隔夜的麝香味，甚至周围的树叶似乎也因为腐败的恶臭而枯萎。");
            menu();
            addButton(0,"外貌",aikoAppearance).hint("检查那只狐妖。");
            addButton(1,"交谈",aikoTalk).hint("和狐妖女孩聊天。");
            addButton(2,"屈服",submitToAiko).hint("和狐妖爱子共度一段欢乐时光！\n不过在她现在的状态下，谁知道她会做出什么事来！");
            addButton(3,"强奸战斗",aikoFight).hint("她喜欢你试图强奸她！");
            addButton(5,"交谈与性爱",aikoTalkAndSex).hint("聊聊天，然后和狐妖爱子共度一段欢乐时光！");
            addButton(14,"离开",leave).hint("离开空地");
         }
      }
      
      public function aikoLosesIntro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("爱子单膝跪地，气喘吁吁地用弓支撑着自己。她鼓起最后的一丝意志力，瞄准了最后一支箭并射了出去，但她的力量显然已经耗尽——那支箭像喝醉的黄蜂一样在空中划过，偏离了目标，撞在树干上发出咔哒声。");
         outputText("[pg][say: 你……你比我想象的要强得多……我承认，我低估了你……]她喘息着说，随着她的长弓在身下消失，她瘫倒在地。[pg][say: 你……你打算做什么？][pg]这是个好问题。她现在任你摆布，所以你几乎可以对她做任何你想做的事。" + (!get_player().isPureEnough(60) ? "当你想到要给这个惹恼你的小婊子一个教训时，你的脸上浮现出一抹邪恶的冷笑。" : "") + "");
         outputText("[pg]你会强暴她吗？如果会，你打算怎么做？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2362,1);
         aikoRapeSex();
      }
      
      public function aikoLoseRefuseBall() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("" + (get_player().isPureEnough(50) ? "你挣脱爱子的手，头也不回地离开了空地，尽力无视她恳求的哭喊声。" : "你一脚踩在她的胸口，猛地把她推倒在泥土里，留下那个瘫倒在地的女孩，径直走出了空地。") + "[pg]当你离开空地一段距离后，你偶然发现了一条穿过树林的小溪。你把手伸进[inv]，拿出那颗白色的宝珠，把它扔进湍急的水流中，看着它顺流而下。当你走回营地时，你有一种感觉，你短期内不会再见到爱子了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,2);
         get_player().dynStats(DynStat.Cor(5));
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoLoseGiveBall() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你低头看着她恳求的表情，" + (!get_player().isPureEnough(50) ? " 忍不住对这个可怜女孩的纠缠感到厌烦" : "忍不住对这个可怜的女孩感到一丝懊悔") + "。你犹豫地把手伸进[inv]，拿出宝珠，看到它，爱子眼中闪过一丝微小的希望光芒。[pg]" + (get_player().isPureEnough(50) ? "你把宝珠放在她手里，对你对这个可怜生物所做的事感到有些抱歉" : "你把宝珠扔在她面前，朝它吐了口唾沫，希望这足以让她闭嘴") + "。[pg][say: 谢……谢谢你……]她低语着，把宝珠紧紧抱在胸前。她挣扎着站起来，逃进了树林，只停下来回头看了你一次。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 2);
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoKillSister() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_yamata());
         outputText("你用眼角余光看了爱子一眼，然后点了点头。她眯起眼睛，冷冷地松开了箭。八岐无助地看着箭矢飞向她的脸，当箭矢刺穿她的喉咙时，她睁大了眼睛。在痛苦中，她脸上爆发出纯粹的仇恨，死死地盯着你和爱子，她大口喘着气，被自己的鲜血淹没。最后，八岐倒在地上，爱子如释重负地深吸了一口气，闭上了眼睛。");
         outputText("[pg]七尾妖狐用颤抖的眼神看着你，一言不发，她扑向你，用双臂和尾巴紧紧抱住你的身体。你微笑着在她的怀抱中放松下来，回抱住她。一切都结束了，她死了。[say: 我……不得不这么做……如果她逃跑了，她肯定会回来纠缠我或者我的村子……] 然后她用感激的眼神看着你的眼睛，在你的嘴唇上留下了一个漫长而温柔的吻。[say: 如果没有你……我早就迷失了。谢谢你，[name]] 她微笑着闭上眼睛，脸颊绯红。[say: 我……需要变得更强。我需要成为九尾妖狐。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2370,2);
         doNext(yamataAftermath);
      }
      
      public function aikoFootjob() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         var _loc1_:int = Utils.rand(int(get_player().cocks.length));
         outputText("当爱子把你推倒在地时，你很容易就倒下了，她得意地笑着。她慢慢地脱下你的[armor]，从中获得一种扭曲的快感，用一种几乎是漫不经心的方式脱掉你的衣服，来强调她的主导地位。当你完全暴露在她的“温柔慈悲”之下时，她开始用指甲划过你的[chest]，留下挥之不去的刺痛，让你羞耻地发出兴奋的呜咽。她的尾巴像蛇一样伸出来，缠绕在你的手臂和" + (!get_player().hasTailInsteadOfLegs() ? "腿" : "尾巴") + "上，把你牢牢地固定在原地。为了保险起见，另一条尾巴紧紧地缠绕在你的脖子上，虽然不足以限制空气流通，但似乎是在警告你如果反抗会有什么后果。");
         outputText("[pg][say: 舒服吗？希望如此，]她说道，声音里滴着施虐的毒液。");
         outputText("[pg]她站在你上方，抬起一只光脚滑过你的胸膛。她的脚趾慢慢地顺着你的身体滑下，逐渐向你的腹股沟移动，她熟练地用脚抬起你的[cocks]，将[if (cocks>1) {它们|它}]向后翻转，并用脚跟将[if (cocks>1) {它们|它}]压在你的身体上。尽管爱子总是光着脚走来走去，但她的脚底却如丝般光滑，她的脚压在你肉棒[if (cocks>1) {们}]下侧的感觉比你想象的要美妙得多。她的脚趾向上滑动，沾满了漏出的先列腺液，光滑的液体弄湿了她的整只脚。");
         outputText("[pg][say: 呵呵……你真是个可悲的失败者，竟然对这种东西发情……你只是个变态，不是吗？]她笑着说，俯下身子，以便对你的腹股沟施加更大的压力。当她的脚在你的[cock " + (_loc1_ + 1) + "]上前后滑动时，她开始用指甲划过你的胸膛和肩膀，让你喉咙里发出痛苦和快乐的呻吟。[say: 不是吗？你嘴上说得好听，但你只是个大受虐狂，喜欢把你的老二在我的脚上摩擦！]");
         outputText("[pg]" + (!get_player().hasPerk(PerkLib.Masochist) ? "你还没来得及抗议，" : "") + "爱子开始加快她羞辱性的足交速度，用力揉搓你的腹股沟，逼得你喉咙里发出一声微弱的呻吟。一缕缕邪异的紫色火焰开始在她脚底舔舐，让你的胯间笼罩在难以忍受的炽热中。你被那近于滚烫的火焰灼得蜷缩起来，但痛苦很快转化为快感。" + (!get_player().hasPerk(PerkLib.Masochist) ? "当你意识到她的火焰正在把你变成一个受虐狂时，你的脸上闪过一丝惊恐！" : ""));
         outputText("[pg]束缚你的毛茸茸的绳索开始痛苦地收缩，随着爱子火焰的效果蔓延到你身体的其他部位，让你产生愉悦的痉挛。");
         outputText("[pg][say: 这很美妙，不是吗？这种痛苦……简直……太精致了……你想要的，不是吗？非常、非常想要……]");
         outputText("[pg]你的身体不由自主地动了起来，你点着头，把臀部顶向她的脚，大喊着是的，你想要，你什么都愿意做！[pg]");
         if(Utils.rand(4) == 0)
         {
            outputText("[say: 呵呵呵，我想下次你就不会这么自私了，]她说着，把脚压在你的腹股沟上。不！你已经很接近了！如果她能再多抚摸你一会儿，你就能高潮了！[pg][say: 我告诉过你，要求女士让你高潮却不提供一点前戏作为交换，这很粗鲁，]她说道，呼应了她之前的观点。她轻哼了一声，报复性地嘲笑你，转身离开，让你沉浸在自己可悲的羞耻中，消失在树林里。[pg]你抓住你的[cocks]，拼命地想让自己高潮，但你自己疯狂的抚摸似乎无法与爱子脚的侮辱性服侍相比。伴随着绝望的咆哮，你向后倒去，意识到在她的火焰效果消失之前，普通的快乐根本无法满足你。你在那里躺了很久，然后才回到营地，你痛苦的勃起让你走起路来有些尴尬，因为你的[cocks][if (cocks>1) {们|}]紧紧地压在你的[armor]内侧。");
            get_player().dynStats(DynStat.Lust(50));
         }
         else
         {
            outputText("[say: 真是个乖巧的小受虐狂……]她轻声说道，将[if (cocks=1) {其中一条}]空闲的尾巴缠绕在你的[cocks]根部[if (cocks>1) {们}]，像[if (cocks=1) {一个}]毛茸茸的阴茎环[if (cocks>1) {们}]一样紧紧收缩，加快了她粗暴抚摸的速度。她的脚趾卷住你的[cock " + (_loc1_ + 1) + "]，她的脚变成了一团模糊的影子，以惊人的速度在你的[cock " + (_loc1_ + 1) + "]上震动，如果不是有大量的润滑液作为缓冲，肯定会擦伤。你的[cocks]根部[if (multicock) {们}]膨胀起来，因为越来越多的精液聚集在你的肉棒[if (multicock) {们}]里，就在她尾巴[if (multicock) {们}]紧紧的抓握之下。[pg]你的[cocks]徒劳地抽动着[if (cocks=1) {，}]，你感觉到一波又一波的精液在你体内积聚。爱子嘲笑你的痛苦，将她的脚滑到你的[cock " + (_loc1_ + 1) + "]根部，试探性地戳着肿胀的肉。这种感觉让一阵快感传遍你的脊背，你开始求她结束这种折磨，让你高潮！[pg][say: 哦，好吧，剥夺一个女孩的乐趣，你这个自私的小变态，]她说道，报复性地笑着，她的尾巴[if (cocks>1) {们}]退去，同时她用脚向下挤压你的肉棒，利用这个动作帮助你的身体排出精液。你的精液喷洒在你的胸膛上，以惊人的力量溅到你的脸上[if (balls > 0) {，同时你蛋蛋里的东西也全都倒在了你身上}]。[pg]你全身沾满了自己的精液，躺在地上，爱子松开了对你的抓握。[say: 嗯……这副模样很适合你，]她说道，用脚在敏感的胯部又摩擦了几下，然后转身离开。你在自己的羞耻中躺了一会儿，最后才清理干净自己，收拾东西回到营地。");
            get_player().orgasm("Dick");
            postSexUpdate();
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2357,FlagDict_Impl_.arrayReadInt(_loc2_,2357) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoFistHer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("下定决心后，你带着" + (playerJerk() ? "虐待狂的喜悦" : "傻笑") + "掰响了指关节。你告诉她，你决定惩罚她惹出的所有麻烦。她退缩了，但当她退到一棵树旁时，她无路可退，你逼近，轻松地将她困住。" + (playerJerk() ? "你粗暴地抓住她的下巴，将她扳倒在她的背上，被击败的女祭司太累了，无法抵抗。" : "你用手抚摸她的后脑勺，抚摸她的耳朵，然后缓慢但坚定地将她压在地上。") + "她不情愿地顺从了被剥光衣服并绑起来的命运，当你拉开她的长袍时，你慢慢地用手指划过装饰她耻骨丘的小莲花纹身，让她发抖。");
         outputText("[pg]当你将触碰向下滑动时，你拉开一条细细的粘稠液体，将你的指尖连接到她的阴唇，并评论说她很幸运。她的湿润将对你为她计划的事情有很大的帮助。你用一只手张开滴水的粉红色嘴唇，轻松地将两根手指推入其中。她颤抖的盒子在回应中发出一小股汁液，当你开始将指尖泵入她体内时，骄傲的女祭司忍不住发出一声低沉的呻吟。在她的体内弯曲你的手指，你试图感受她的深度，然后逐渐增加第三根，然后是第四根。");
         outputText("[pg]用另一只手向上伸，你开始摸索和玩弄她的乳房，捏住乳头并倾斜身体轻轻吸吮它们。当你在她体内扭动和旋转手指时，你的拇指摩擦着她肿胀的快乐按钮，她忍不住发出一声可耻的呻吟，让她全身陷入抽搐的狂乱。你可以看出她正在用她存在的每一根纤维挣扎，不让她的臀部摇晃到你的手上，试图抓住她最后的一丝尊严。");
         outputText("[pg]好吧，你可不能让你的玩物保留任何尊严，不是吗？你把手伸直，用力地哼了一声，" + (playerJerk() ? "毫不留情地" : "坚定地") + "将拳头塞进她毫无防备的洞穴中。爱子弓起背，几乎僵在原地，每一块肌肉都紧绷着颤抖，她发出了迄今为止最响亮的呻吟，她所有的[aikotailnumber]条尾巴都像洗瓶刷一样炸毛了。她的肉壁紧紧夹住你的拳头，本能地像肉手套一样包裹着它，大量的淫液从她的小穴中涌出，浸透了你的前臂。你皱着眉头看着她——这个下贱的婊子竟然只凭这个就高潮了？！你开始用力地将手臂抽插进她体内，惩罚她那淫荡的小穴，竟敢在你管教完她之前就高潮。她开始疯狂地挣扎，无法从高潮中平复下来，眼泪从她眼中涌出，因为那折磨人的持续快感。现在你的手臂在她体内飞速进出，每一次抽插都喷出新的汁液。你毫不怀疑她能轻松地吞下你整条手臂，但你只是想惩罚她。你用最后一次用力的抽插让她喘不过气来，她紧绷着身体迎来了第二次高潮，翻着白眼，在森林的地面上变成了一团纯粹的快感。当你拔出手臂时，你的手臂已经完全湿透了" + (get_player().hasFur() ? "，[furcolor]的皮毛被她的汁液黏在一起，" : "") + "而爱子仍在快感中左右翻滚，她的小穴因为失去了你的拳头而淫荡地大张着。你在她脱下的长袍上擦了擦手，把她翻过身来，顺便解开了她的绳子，留下这个失去知觉的狐妖从快感昏迷中恢复，而你则回到了营地。");
         postRapeUpdate();
         get_combat().cleanupAfterCombat();
      }
      
      public function aikoFight() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         if(get_aikoCorruption() >= 50)
         {
            outputText("你告诉她，不管她喜不喜欢，你都要操她，并准备好你的[weapon]。她露出了邪恶的笑容，似乎对你的热情很满意，大喊道：[say: 这才是我们想听到的！来操我吧，婊子！]");
         }
         else
         {
            outputText("下定决心后，你毫无预兆地向她扑去，高举你的[weapon]，准备战斗。她向后跳开，险险躲过你突然的攻击，并举起弓进行防御。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 50)
            {
               outputText("[say: 喂！搞什么鬼？！你在干什么？]她惊讶地大喊，但你唯一的回答是摆出准备战斗的姿势，准备与她交战。");
            }
            else
            {
               outputText("[say: 好吧，我们再按你的方式来一次！]她厉声说道，准备战斗。");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) - 2);
         }
         var _loc2_:Aiko = new Aiko();
         _loc2_.onDefeated = pcWinsDomFight;
         _loc2_.onWon = pcLosesDomFight;
         startCombat(_loc2_);
      }
      
      public function aikoE1SexPart2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("[say: 那么……我不想逼你，但是……]你在半昏迷状态下困惑地眨了眨眼，然后被摇回现实，因为你记起了你的交易。对你的[say: 交易]感到满意，你履行了你的承诺，把球扔给了她。她微微一笑，把它塞进乳沟里，然后漫步走进树林，臀部来回摆动。在她从视线中消失之前，她转过身来，带着会心的微笑说：[say: 谢谢你，亲爱的。尽量别惹太多麻烦……]你想知道她那是什么意思，但不能浪费太多时间去想，因为你因欲望的遭遇而筋疲力尽地倒在地上。一旦你的身体恢复过来，你就收拾好你的[armor]并回到营地。在路上，你忍不住注意到你的整个身体变得特别敏感。每一步和每一个动作都让你因皮肤摩擦衣服内侧而兴奋得脸红。爱子的魔法让你感觉格外敏感！在这种状态下，很难不变得兴奋。希望它能很快消失……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 2);
         doNext(applyAikoLustPrankEffect);
      }
      
      public function aikoE1SexPart1() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你上下打量了她柔软的身体一会儿，当她的手在她柔软的曲线上上下滑动时，你不由自主地舔了舔嘴唇。从你下体散发出的热量告诉你，你的身体已经为你做出了决定。你正要说出你的欲望，爱子漫步走到你面前，把一根手指放在你的嘴唇上，低声说：[say: 嘘……调皮的[boy]……我能看到你用眼睛脱我的衣服。我知道你想要什么。][pg]还没等你说话，她就在你面前跪下，把你的[armor]拉到一边，露出你的腹股沟。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,3);
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("她检查了你的下体一会儿，然后抬头看着你，说：[say: 那么，你希望我怎么取悦你呢，嗯？]");
            menu();
            addButton(0,"男性",aikoSexBJ).hint("让她用嘴取悦你的肉棒。");
            addButton(1,"女性",aikoSexCunni).hint("让她用舌头探索你小穴柔软的褶皱。");
         }
         else if(get_player().hasCock())
         {
            doNext(aikoSexBJ);
         }
         else if(get_player().hasVagina())
         {
            doNext(aikoSexCunni);
         }
         else
         {
            outputText("看到你没有任何通常的设备，她似乎很困惑。[say: 呃，如果你没有合适的东西，我不知道你希望我怎么取悦你……]");
            doNext(aikoE1SexPart2);
         }
      }
      
      public function aikoE1Riches() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你考虑了一下她的提议，然后告诉她，你总是需要一些额外的宝石。");
         outputText("[pg][say: 真是个贪心的小家伙，不是吗？] 爱子坏笑着调侃道。[say: 好了，跟我来，] 她说着，示意你跟着她走到树下。[say: 就在这儿等着，] 她对你说，然后又补充道，[say: 不许偷看！][pg]她示意你转过身去，你本想抗议，但当她严厉地瞪了你一眼时，你只好耸耸肩照做了。听到她咳嗽的声音，你转过身，发现她站在那里，手里拿着一个小木箱，另一只手挥舞着驱散从箱子里升起的一团烟雾。爱子咧嘴笑着，像个小女孩一样蹦蹦跳跳地把箱子塞进你手里。在她的催促下，你打开了箱子，发现里面装满了宝石！你对这次交易很满意，履行了你的承诺，把球扔给了她，并向她道别。[say: 噢，别客气。这是我的荣幸，] 她眨了眨眼说道，你忍不住觉得她知道一些你不知道的事情。你耸耸肩，带着新到手的战利品回到了营地……");
         outputText("[pg]回到营地后，你放下箱子，准备清点你新获得的财富，却听到一声空洞的闷响！等等，不对劲。这个箱子刚才不是重得多吗？你急忙打开箱子，发现里面的东西变成了一堆树叶！");
         outputText("[pg]你被骗了！看来爱子占了你的便宜……[pg]");
         if(!get_player().hasKeyItem("Camp - Chest"))
         {
            get_player().createKeyItem("Camp - Chest",0,0,0,0);
            outputText("好吧，也许你可以把这个箱子用来储物……");
            outputText("[pg]<b>你现在在营地有 " + Utils.num2Text(get_inventory().itemStorageSize()) + " 个储物槽了。</b>");
         }
         else
         {
            outputText("在你的眼前，箱子变成了一张白纸，上面画着一张卡通脸，正对着你吐舌头。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoE1Power() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("稍微思考了一下，你告诉她，再多一点力量会对你的旅程有很大帮助。");
         outputText("[pg][say: 嘻嘻……好吧，英雄" + get_player().mf("先生","女士") + "，你的愿望就是我的命令，]爱子调侃道，调皮地咧嘴笑着。她想了一会儿，然后似乎灵光一闪，脸上亮了起来，跑开时对你喊道：[say: 待在这里！别动！][pg]你耐心地等着，不知道她在搞什么鬼。过了一分钟，爱子怀里抱着一个包裹回来了，她一边跑向你一边把它高高举起。[say: 快看！我把它包好了！来吧，打开它！]她喊道，递给你那个长长的包裹，它用紫色的布包着，用金色的绳子绑着。[pg]你眨了眨眼，对她的热情有点吃惊，开始解开包裹。当你拉开紫色的布时，你发现里面有一把闪闪发光的金剑，剑刃上刻着符文。[pg][say: 是一把剑！我在树林里找到的！]她惊呼道，咧嘴大笑。[say: 不过它有魔法，看看剑刃！][pg]当你把剑柄拿在手里时，你感觉到剑刃发出魔法能量的嗡嗡声。雕刻开始发光，剑突然燃烧起来！[pg]一旦你弄清楚如何关闭剑的能量，你就把它重新包好并感谢爱子。对你们的交易感到满意，你履行了你的承诺，把球扔回给她并向她告别。[pg][say: 哦，别客气。这是我的荣幸，]她眨着眼睛说，你忍不住觉得她知道一些你不知道的事情。耸耸肩，你带着你的新战利品回到营地……回到营地后，你坐下来仔细看看你的新剑。你急忙解开包裹，却发现它已经被一根普通的铅管代替了！上面附着一张小纸片，上面画着一张卡通脸，正对着你吐舌头。");
         outputText("[pg]你被骗了！看来爱子占了你的便宜……好吧，如果你用力挥舞它，这根管子可能仍然会造成一些伤害……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,2);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 1);
         get_inventory().takeItem(get_weapons().PIPE,get_camp().returnToCampUseOneHour);
      }
      
      public function aikoE1Nothing() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你不知道是因为你觉得仁慈，还是因为一些挥之不去的怀疑，但在考虑了一番之后，你决定把她的球还给她，而不要求任何回报。");
         outputText("[pg]你把它递给她，并把这些告诉她，看着她伸手从你那里拿回它时，脸上亮起了惊讶的表情。");
         outputText("[pg][say: 你是……认真的？你就这么把它给我了？]她说，轻轻地从你手里接过它，把它塞进乳沟里。[say: 我……不知道该说什么。我的意思是，你根本不知道我有多感激，但是……老实说，我很震惊。][pg]她转身要走，但停了下来，把食指放在嘴唇上，似乎陷入了沉思。[say: 听着……我通常不这样做，但是……你看起来人很好，现在我觉得有点矛盾。][pg]她漫步走到你面前，抓住你的后脑勺，在你反应过来之前把你拉进一个吻里。当她呼气到你嘴里时，你能尝到冬青的味道在你的舌头上倾泻而下。当她拉开距离时，她给了你一个假笑，一小股蓝色的火焰从你的嘴唇里逃了出来。[pg][say: 现在别有任何想法……我这样做只是为了偿还我的债务，你听到了吗？]");
         outputText("[pg]尽管她这么说，她还是带着明显的微笑走开了，她的七条尾巴来回摆动，消失在树林里。");
         outputText("[pg]当你转身回营地时，你的舌头上仍然有淡淡的冬青味道，你忍不住对你的旅程感到一种新的活力。");
         outputText("[pg]爱子火热的吻让你的身心感到充满活力！[pg]");
         get_player().dynStats(DynStat.Lust(15),DynStat.Cor(-5));
         var _loc1_:int = Utils.rand(4);
         if(_loc1_ == 0)
         {
            outputText("你觉得你可以和牛头怪掰手腕，你的肌肉因新的力量储备而起伏！");
            get_player().dynStats(DynStat.Str(Utils.rand(4) + 1));
         }
         if(_loc1_ == 1)
         {
            outputText("你觉得你可以挡住即使是最强恶魔的打击，你的身体感觉更有弹性！");
            get_player().dynStats(DynStat.Tou(Utils.rand(4) + 1));
         }
         if(_loc1_ == 2)
         {
            outputText("你觉得你可以跑过半人马，因为你充满了新发现的能量！");
            get_player().dynStats(DynStat.Spe(Utils.rand(4) + 1));
         }
         if(_loc1_ == 3)
         {
            outputText("你觉得你可以记住整个图书馆的书，你的头脑变得明显更敏锐！");
            get_player().dynStats(DynStat.Inte(Utils.rand(4) + 1));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2358,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,4);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2356,FlagDict_Impl_.arrayReadInt(_loc2_,2356) + 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoE1Fight() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("当很明显你不会被说服放弃战斗时，爱子发出了一声失望的叹息。");
         outputText("[pg][say: 我真的很希望能避免战斗，]她说着，举起双手做出防御姿态，向后退了几小步。[say: 但我真的需要拿回那个球，如果我不能说服你……我就只能强迫你交出来了。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2359,5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2361,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) - 2);
         startCombat(new Aiko());
      }
      
      public function aikoConsSex() : void
      {
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"传教士位",aikoSexMissionary).hint("");
            addButton(1,"后入式",aikoSexDoggy).hint("").disableIf(get_player().cockThatFits(50) == -1,"这个场景需要一根合适的阴茎。");
            addButton(2,"口交",aikoSexBJ).hint("让她用嘴取悦你的肉棒。");
         }
         if(get_player().hasVagina())
         {
            addButton(3,"被舔",aikoSexCunni).hint("让她用舌头探索你小穴柔软的褶皱。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2356) >= 75 && get_player().hasCock())
         {
            addButton(4,"尾交",aikoSexTailjob).hint("");
         }
         if(get_aikoCorruption() >= 50)
         {
            addButton(5,"屈服",submitToAiko).hint("向爱子屈服，看看她会对你做什么");
         }
         if(get_player().hasStatusEffect(StatusEffects.Spar))
         {
            setExitButton("离开",leave);
         }
         else
         {
            setExitButton("返回",aikoMenu).hideIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) < 4);
         }
      }
      
      public function aikoAppearance() : void
      {
         clearOutput();
         outputText("当你瞥向爱子时，她[if (aikoaffection < 50) {[if (aikocorrupt) {死死盯着你|警惕地看着你}]|微笑着[if (aikocorrupt) {，令人不安|[if (aikoaffection >= 65) {，笑容灿烂}]}]}]，[if (aikoaffection < 50) {但当她意识到你对她没有恶意后，便慢慢放松下来|并尽力吸引你的注意}]。[Aikotailnumber]条银狐尾巴在她身后展开，毫无疑问地彰显了她的狐妖血统，每一条都[if (aikocorrupt) {沾满了污垢|闪烁着健康的光泽}]。[if (tallness < 62) {[if (tallness >= 58) {她比你稍高一些|她比你高出许多}]|[if (tallness < 67) {她和你差不多高|[if (tallness >= 70) {她比你稍矮一些|她比你矮很多}]}]}]，如果你非要猜的话，她大概有[if (metric) {160厘米|5英尺4英寸}]左右。");
         outputText("[pg]她[if (aikocorrupt) {破烂、肮脏的长袍掩盖了她作为祭司的身份，并——有意或无意地——露出了支撑她胸部的污渍布料和诱人数量的晒黑皮肤。|一尘不染的蓝白长袍是祭司的华服——不过考虑到它们几乎无法掩盖她用布包裹的胸部，你怀疑她穿得比规定要宽松一些。}] 复杂的魔法纹身布满了她的脸，据你[if (aikohadsex) {记得|在微风中瞥见}]，她的手掌和屁股上也有类似的螺旋图案，下背部还有一朵风格化的莲花，全部用红色蚀刻。她水晶般湛蓝的眼睛与[if (aikocorrupt) {干净部分的}]长袍相配，[if (aikocorrupt) {似乎能看穿你，当它们没有在最微弱的声音中四处游移时|闪烁着恶作剧的光芒，一如既往地难以捉摸}]。如果不是她齐肩的银金色头发中露出的毛茸茸的狐狸耳朵，从腰部以上看，她很容易被误认为是一个人类。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2357) != 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2365) != 0)
         {
            outputText("[pg]在她的长袍下，她拥有温柔、少女般的曲线，这赋予了她不可否认的女性气质。虽然你现在看不到，但你知道她柔软、可捏的脸颊隐藏在她丝滑尾巴的根部下方，她光滑、闪亮的嘴唇停留在她的大腿之间，所有这些都[if (aikoaffection < 50) {令人愉悦|邀请你的}]触摸。");
         }
         outputText("[pg][if (aikocorrupt) {随着她双手的每一次抽动而颤抖的血迹斑斑的柴刀|斜挎在她背上的长弓}]向你保证，如果需要，爱子可以保护自己。");
         doNext(aikoMenu);
      }
      
      public function aikoApologyTrick() : void
      {
         var _loc2_:* = null as Aiko;
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("当她伸出手时，你微笑着，虽然她明显还有些忐忑，但愿意相信你。这是她犯下的大错。你的微笑变成了一个邪恶的笑容，你粗暴地抓住她的手，用力一拉让她失去平衡，将她摔倒在地。[pg]");
         get_player().dynStats(DynStat.Cor(5));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) - 8);
         set_aikoCorruption(get_aikoCorruption() + 10);
         if(get_player().get_str() > 35)
         {
            outputText("她尖叫着，徒劳地反抗着你压倒性的体力，你将她打得屈服，撕开她的衣服，准备享用你的战利品。");
            outputText("[pg][say: 你……你这个该死的" + get_player().mf("混蛋","婊子") + "！]她现在泪流满面，脸上沾满了泥土，还有你们扭打时留下的抓痕。[say: 我就知道我不该相信你！]");
            outputText("[pg]你狠狠地扇了她一巴掌，让她知道谁才是老大。尽管她愤怒地瞪着你，但你已经把她压制住了——她哪里也去不了。你要怎么强暴她？");
            aikoRapeSex();
         }
         else
         {
            outputText("她大叫一声，狠狠地扇了你一巴掌，打得你晕头转向，她迅速爬起来，拉开了你们之间的距离。");
            outputText("[pg][say: 你这个该死的疯子！]她啐了一口，强忍着哭泣的冲动。[say: 先是说你想道歉，然后又来这套？我受够你的把戏了！]她心里似乎有什么东西断裂了……看来你有一场硬仗要打了！");
            _loc2_ = new Aiko();
            _loc2_.onDefeated = pcWinsDomFight;
            _loc2_.onWon = pcLosesDomFight;
            startCombat(_loc2_);
         }
      }
      
      public function aikoApologySincere() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你微笑着看着她伸出手，虽然明显还有些忐忑，但愿意相信你一次。你紧紧握住她的手，轻轻摇了摇，你们俩都放松了下来。");
         outputText("[pg][say: 我……我还需要一点时间，]她说着，把手背在身后，有些不安地扭动着。");
         outputText("[pg]你告诉她没关系；你可以等她准备好。感觉良心稍微轻松了一点，你漫步走回营地。");
         get_player().dynStats(DynStat.Cor(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2356,50);
         set_aikoCorruption(get_aikoCorruption() - 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aikoApologize2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你说得对，你说道，这似乎让她有些惊讶。她没有理由信任你，但你能从她的眼神中看出她很孤独，而你可以帮忙。你告诉她，如果她愿意既往不咎，你保证会给她现在渴望的那种陪伴。");
         outputText("[pg]她似乎在妥协自己的价值观上挣扎了一会儿，然后表情终于柔和下来，叹了口气。[say: ……去他妈的。我知道我会后悔的，但是……如果你保证……我们快点开始吧。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2356,FlagDict_Impl_.arrayReadInt(_loc1_,2356) + 5);
         aikoConsSex();
      }
      
      public function aikoApologize1() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你慢慢举起双手，尽量让自己看起来没有威胁。你解释说你只是来谈谈的。");
         outputText("[pg]她仍然用箭指着你，但似乎稍微软化了一点。显然，她有点吃惊。[say: 谈谈？你和我有什么好谈的？]她皱着眉头说。[pg]你告诉她你想为你的所作所为道歉。你有一点时间反思，你对" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2365) <= 0 ? "攻击她" : "你残忍的强暴") + "感到非常糟糕。仅仅用言语是无法弥补你可耻的行为的，所以如果她不能原谅你，你也能理解；你只是需要告诉她你很抱歉。[pg][say: 你当然该觉得抱歉！]她愤愤不平地说，开始有点发作，然后又控制住了自己。她深吸了一口气，慢慢呼出，稍微放松了严厉的姿态，犹豫地放下了弓。[pg][say: 但是……如果你真的是认真的……]她说着，思考了片刻。[say: 别以为你能全身而退！]她赶紧补充道，短暂地皱了皱眉，然后又软化了。[say: 我对你还是不太满意，但我愿意尝试重新开始。]");
         menu();
         addButton(0,"真诚",aikoApologySincere).hint("你真的为你的行为感到抱歉。");
         addButton(1,"欺骗她",aikoApologyTrick).hint("不，只是另一个接近她的把戏！").disableIf(!get_player().isCorruptEnough(33),"<b>你不够堕落，无法进行这种欺骗</b>");
      }
      
      public function aikoAggroGreeting() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_aiko());
         outputText("你问她那是不是威胁，收起球并准备好你的[weapon]。你确信她试图以某种方式欺骗你，你不会容忍这种事！");
         outputText("[pg][say: 呵呵……嗯……你知道，也许我太草率了。也许我们可以做个交易？你觉得怎么样？我的球换取你心中渴望的任何东西。财富，权力……如果你明白我的意思，我可以帮你缓解一下压力，] 她娇羞地说，诱人地扭动着臀部。");
         outputText("[pg]不管这个球是用来做什么的，它似乎对她非常重要。也许你应该重新考虑一下——你可能可以让她做任何事……但这可能是一个陷阱。你会要求什么？");
         menu();
         addButton(0,"财富",aikoE1Riches).hint("");
         addButton(1,"力量",aikoE1Power).hint("");
         addButton(2,"性爱",aikoE1SexPart1).hint("");
         addButton(3,"无",aikoE1Nothing).hint("还给她，这毕竟是她的东西。");
         addButton(4,"战斗",aikoE1Fight).hint("");
         addButton(5,"毛茸茸的尾巴",aikoTouchFluffTail).hint("");
      }
   }
}

