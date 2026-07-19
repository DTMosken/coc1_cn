package classes.scenes.areas.swamp
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.swamp._FemaleSpiderMorphScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class FemaleSpiderMorphScene extends BaseContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public function FemaleSpiderMorphScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "femalespidermorph";
         saveContent = new SaveContent(null);
         super();
         pregnancy = new PregnancyStore(1197,271);
         pregnancy.addPregnancyEventSet(25,[100]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function voluntaryFemaleSpiderMorphRapesYou() : void
      {
         set_monster(new FemaleSpiderMorph());
         spriteSelect(SpriteDb.get_s_spidergirl());
         loseToFemaleSpiderMorph();
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            pregnancy.knockUpForce();
         }
         return false;
      }
      
      public function talkToFSpiderMorph() : void
      {
         var _loc1_:* = null as FemaleSpiderMorph;
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         if(Utils.rand(2) == 0)
         {
            outputText("你举起双手，表示没有威胁，并问蜘蛛女为什么要试图偷偷靠近你。她的眼睛睁得大大的，震惊地用甲壳状的手捂住嘴，然后喊道：[say:天哪，太对不起了！]你对这种明显少女般的反应笑了笑，而她恢复过来后继续说道：[say:我不是故意要吓你的！自从恶魔摧毁了我们的村庄后，我就一直一个人住在这里……我-我们能不能……嗯……聊一会儿？][pg]");
            outputText("蜘蛛女紧张地摆弄了一会儿手指，直到你对她点了点头。你确实打算和她谈谈，而且看起来效果比你预期的要好一点。她向前走了几小步，然后盘腿坐在一些蕨类植物上。你感觉不到这个奇怪的怪物女孩有什么威胁，于是坐在她对面，让她向你询问你的冒险经历，等她问完后，你也问了她同样的问题。[pg]");
            if(Utils.rand(2) == 0)
            {
               outputText("在你们都聊够了之后，蜘蛛女问道：[saystart]我-我想知道你能不能帮我个忙……我有一些……冲动，而且");
               if(get_player().get_gender() == 0)
               {
                  outputText("哦——哦，算了，你是无性别的……该死。[sayend]她红着脸抬起腹部，向树上射出一根蛛丝，借此逃离了这个尴尬的局面。你再次被彻底孤零零地留下了。");
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
               outputText("那个，你是我有机会问的第一个理智的人。哦，去他妈的，我能把你绑起来干你吗？求你了？[sayend][pg]");
               outputText("你让她干你吗？");
               menu();
               addButton(0,"是",voluntaryFemaleSpiderMorphRapesYou);
               addButton(14,"离开",declinedCrazyFemaleSpiderMorphSexFunTimes);
            }
            else
            {
               outputText("在你们都聊够了之后，蜘蛛女孩微笑着给了你一个温柔的拥抱。她颤声说道：[say: 真的很感谢你陪我聊天！能再次真正地……和别人交流，感觉真是太好了。我感激不尽，不过，拿着这个吧。也许它能在你的旅途中帮到你。][pg]");
               get_inventory().takeItem(get_consumables().S_GOSSR,get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("你举起双手，表示自己没有威胁，并问蜘蛛女孩为什么要偷偷靠近你。[pg]");
            _loc1_ = new FemaleSpiderMorph();
            _loc1_.spiderMorphWebAttack();
            startCombat(_loc1_);
         }
      }
      
      public function spiderMorphFemaleRidesACawk() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(!get_game().get_inCombat())
         {
            outputText("你脱下你的[armor]并把它扔到一边，感觉[eachcock]");
            if(get_player().get_lust100() < 70)
            {
               outputText("抽动着，开始变硬，期待着与美丽的蜘蛛女仆做爱。");
            }
            else
            {
               outputText("抽动着，已经硬得发疼，渴望着美丽蜘蛛女仆的抚摸。");
            }
            outputText("你大步向前，靠近到一臂之遥，她却伸出手掌阻止了你。她说道：[say:还不行，躺到那边去，这样我才能好好享用你。][pg]");
         }
         if(!get_game().get_inCombat())
         {
            outputText("你耸耸肩，后退一步，躺在柔软的苔藓上，");
         }
         else if(get_player().get_HP() < 1)
         {
            outputText("你瘫倒在柔软的苔藓上，");
         }
         else
         {
            outputText("你瘫倒在柔软的苔藓上，开始自慰，");
         }
         outputText("身体微微下陷，看着那个蛛女转过身，开始对着你摇晃她可爱的臀部。它迷人地摇曳着，她那巨大腹部的沉重分量随着每一次摇晃而上下摆动，短暂地遮挡了你的视线。就在你注视的时候，腹部上的几个突起扭动了半秒钟，然后喷射出大量粘稠的蛛网。它像锤子一样击中你，将你完全击倒，把你赤裸的身体死死地粘在泥土上。");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("其中一根蛛丝重重地打在你的手臂上，将它从你的腹股沟处扯开，你被死死地钉在地上，无法再抚摸自己。");
         }
         outputText("等她喷吐完毕，你发现你的头、胸和胯部都没有被粘稠的蛛丝覆盖。她又喷出一股珍珠般的蛛丝覆盖在第一层上，你被完全、彻底地束缚住了。[pg]");
         outputText("[say: 完美，既然你现在舒舒服服的，我们就可以做爱了！]");
         if(get_game().get_inCombat())
         {
            outputText("胜利的蜘蛛女宣布道。");
         }
         else
         {
            outputText("蜘蛛女眼中闪烁着危险的光芒。你为什么要答应这个？");
         }
         outputText("[pg]");
         outputText("这位非人的褐发女郎再次转过身，在你俯卧的身体上方晃动着她的屁股，下意识地，");
         if(get_player().get_lust100() >= 80)
         {
            outputText("你向上挺动，仿佛不顾束缚，想要和她交配一样");
         }
         else
         {
            outputText("你变得越来越硬，被这性感的景象迷住了");
         }
         outputText("。她对着你咯咯地笑，然后又朝你喷射了几根蛛丝，这次直接对准了你的" + get_player().cockDescript(_loc1_) + "。它紧紧地粘在");
         if(!get_player().hasSheath())
         {
            outputText("根部");
         }
         else
         {
            outputText("包皮");
         }
         outputText("上，形成一个紧密的圆环，像老虎钳一样死死地固定住你的肉棒。");
         if(get_player().cockTotal() > 1)
         {
            outputText("她给");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根阴茎");
            }
            else
            {
               outputText("你的其他阴茎");
            }
            outputText("也做了一个类似的圆环");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("，确保你被完全束缚住。");
         }
         outputText("你因为突如其来的紧绷感而皱起眉头，怀疑自己这样还能不能高潮，但她立刻射出更多丝滑的蛛丝，在你的" + get_player().cockDescript(_loc1_) + "周围封上了一层完美的不粘纤维鞘，并固定在圆环上。[pg]");
         outputText("[saystart]我们可不想让我怀上");
         if(get_player().spiderScore() < 4)
         {
            outputText("野兽的种子");
         }
         else
         {
            outputText("奇怪的、流浪蜘蛛的种子");
         }
         outputText("，对吧？[sayend] 你的俘虏者问道。你睁大了眼睛，开始向她求饶，但她很快用喷出的蛛丝堵住了你的嘴，只留下了你的鼻子。一只覆盖着甲壳的手");
         if(get_player().cockTotal() > 1)
         {
            outputText("越过你的另一根阴茎");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("并且");
         }
         outputText("抚摸着那根可怜的、被束缚的肉棒，她低头看着你，紫色的眼睛盯着你，脸上浮现出残酷的笑容。[pg]");
         outputText("[say: 你的肉棒被绑得死死的，毫无用处，被蜘蛛女滑溜溜的手握着，感觉怎么样？我敢打赌，透过我用来做避孕套的那些漂亮、轻薄的网，你一定能感觉得清清楚楚，对吧？好吧，别喷出来。我要用这个，] 蜘蛛女戏弄道，在说最后几个字时，轻轻拍了拍你的 " + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("你对这种待遇发出呻吟，在束缚中挣扎，但这完全是徒劳的。你从[feet]到脖子都被这东西绑着，照这样下去，你是不可能从这铁一般坚固的蛛丝中挣脱出来的。蜘蛛女跨坐在你的腰上，打断了你的挣扎，让你完美地看到了她闪闪发光的黑色小穴。她丰满的阴唇几乎渗出水分，看起来就像在你们相遇之前有人给它们涂了油，但从它们散发出的强烈的女性气味来看，这绝对是她饥渴、发情状态的反映。黑色的肉在融入周围苍白的皮肤之前褪成了暗色，突出了她的外阴，就像你插入的完美目标。可悲的是，你除了等待什么也做不了。[pg]");
         outputText("蜘蛛女开始降低身体，但在碰到你的 " + get_player().cockDescript(_loc1_) + " 时停顿了一下并改变了姿势。随着角度的改变，她的阴唇滑过你被丝绸包裹的阴茎，用湿润的液体涂抹着光滑的茧，你不知怎么地能透过它感觉到。她向前倾身，将手放在你躯干的两侧，让她不受束缚的乳房在你上方弹跳，深色的乳头");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("拖过你自己的[nipples]");
         }
         else
         {
            outputText("悬停在你的胸膛上方");
         }
         outputText("。当你开始对着她抽搐时，蜘蛛女似乎厌倦了这种戏弄。[pg]");
         outputText("[say: 那些可怜的抽搐就是你能给我的全部吗？我得解决这个问题，] 你的蜘蛛情人宣布。她进一步俯身亲吻你的[chest]，片刻之后张得更大，狠狠地咬了下去。她的毒牙几乎没有遇到任何阻力就滑入了你的肉体，毒牙很细，感觉更像是被捏了一下，而不是真正痛苦，但随后她的毒液开始流动。你感觉到它强行进入你的静脉，当外来液体渗透你的整个身体时，灼热地燃烧着。从她咬的地方开始，热量慢慢向外蔓延，慢慢地从沸腾的不适转变为情欲的烈焰。你的 " + get_player().cockDescript(_loc1_) + " 开始在包裹下随着你的心跳跳动，实际上开始因为渴望而疼痛。");
         if(get_player().cockTotal() > 1)
         {
            outputText("与此同时，你多余的阴茎");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("滴下");
            if(get_player().cockTotal() == 2)
            {
               outputText("");
            }
            outputText("先列腺液，但");
            if(get_player().cockTotal() == 2)
            {
               outputText("被");
            }
            else
            {
               outputText("被");
            }
            outputText("完全无视了。");
         }
         outputText("[pg]");
         outputText("你的阴茎突然被甲壳死死夹住，直接塞进了蜘蛛女那湿润、天鹅绒般紧致的阴道里。温度和压力的突然变化让你充满毒液的身体无法承受，你立刻开始高潮。你感觉到精液在体内沸腾，但紧紧缠绕在你的" + get_player().cockDescript(_loc1_) + "上的丝环将它封锁在里面，让你连最微小的释放都无法实现。突然被阻止射精让你感到疼痛。蜘蛛注意到了你的表情，得意地笑了笑，指尖划过你的[face]，说道，[say: 哎呀，我可不能让你这么快就软下来。如果你表现得好，完全满足我，也许我待会儿会让你射出来。][pg]");
         outputText("你只能发出一声痛苦的呻吟作为回应——当你连动都不能动，而且一直处于高潮的边缘却无法释放时，你该如何满足一个女人？她紧紧夹住你的阴道用力挤压着你，粉碎了你的注意力，提醒着你体内涌动着的不自然的性欲。蜘蛛女快速而猛烈地操着你，一边揉捏着自己的乳房，拉扯着乳头，一边啪啪地拍打着你被绑住的[hips]。[pg]");
         outputText("你又一次高潮了，就像上次一样，但这只给你带来了痛苦和压抑释放的折磨。那折磨人的夹具……它挤压着、抚摸着，怂恿你释放，但你知道释放只会带来痛苦和挫败感。你试图忍住，在被这个狂喜的虫子婊子强暴时，让你发烧的身体保持绝对静止，但这不可能。她动得太快了，而且她的小穴对你的" + get_player().cockDescript(_loc1_) + "来说太热了，你根本坚持不住。你因为努力忍耐而斗鸡眼，然后她高潮了，她小穴那如波浪般起伏、榨汁般的挤压迫使你当场射精。[pg]");
         outputText("你的整个身体都僵住了，每一寸肌肉都在用力向上推，而你的身体则试图挤出积压的精液。缠绕在你的" + get_player().cockDescript(_loc1_) + "上的网环发出了一声断裂、撕裂的声音，你感觉到它松开了一些——没有完全松开，但刚好足以让你的精液最终逃脱！它大团大团地喷涌而出，终于让你体会到了绝对、极致释放的甜美感觉。精液从你的尿道中冒出气泡，将避孕套塞满了多发量的粘液，直到它像气球一样膨胀起来，填满了蜘蛛荡妇的阴道。[pg]");
         outputText("她从你身上滚下来，让那个慢慢膨胀的精液气球从她的小穴里弹出来，同时她喘着粗气，试图恢复呼吸。你呻吟着，仍然沉浸在高潮中，同时你挤出最后一滴粘稠的精液。气球越来越大，直到停止，几乎和");
         if(get_player().cumQ() < 25)
         {
            outputText("棒球一样大");
         }
         else if(get_player().cumQ() < 100)
         {
            outputText("葡萄柚一样大");
         }
         else if(get_player().cumQ() < 400)
         {
            outputText("篮球一样大");
         }
         else if(get_player().cumQ() < 700)
         {
            outputText("西瓜一样大，巨大的重量把你的阴茎往下拖");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("健身球一样大，把你闷在被网包裹的精液下");
         }
         else
         {
            outputText("一个人一样大，完全覆盖了你，然后它终于爆裂，用你丰富的精液浸透了该区域的一切");
         }
         outputText(".[pg]");
         outputText("终于平静下来，你在束缚中瘫软下来，陷入了沉睡。在你无梦的睡眠中，你的身体感觉到了束缚被切断。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(2),DynStat.Sens(1));
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function spiderAmputationLeave() : void
      {
         outputText("[pg]也许这种程度的残暴能向所有人展示你的实力，让他们充满恐惧和焦虑。也许这会让他们陷入复仇的狂热，但你暂时不会想太多。[pg]");
         get_combat().cleanupAfterCombat();
      }
      
      public function spiderAmputationBeat() : void
      {
         clearOutput();
         outputText("没必要让这怪物再多想了，因为你还没完事呢。你挥舞着那条覆盖着甲壳的断腿，凶狠地向[monster.him]砸去，把[monster.him]打得晕头转向，而[monster.he]则在抽泣中慢慢失血。随着[monster.his]意识逐渐模糊，你感到一丝不满。如果死亡终将降临，那也应该是由你亲手终结，而不是流血致死。");
         outputText("[pg]在做了几个合理的伸展动作放松之后，你准备进行一次强力的猛击。断腿以全力砸在蜘蛛的脸上，砸碎了[monster.his]头骨。你再次举起断腿，又是一记重击，这可怜家伙的头盖骨肉眼可见地受损了。为了保险起见，你又挥舞了一次，蜘蛛人的脑袋裂开了。这下应该死透了。[pg]");
         get_combat().cleanupAfterCombat();
      }
      
      public function spiderAmputation() : void
      {
         clearOutput();
         outputText("你命令这只蜘蛛人张开[monster.his]双腿，发现[monster.he]虽然紧张，但还是有些急切地顺从了。当[monster.his]生殖器暴露出来时，你迅速用你的[foot]猛击它们，引得[monster.he]发出一声痛苦的尖叫[if (singleleg) {，因为这火辣辣的一击}]。你继续压在[monster.his]腹股沟上，尽你所能地用力踩踏。");
         outputText("[pg][say: 求求你停下，好痛！] [monster.he]哭喊着，双手本能地试图捂住[monster.his]胯部。");
         if(get_player().get_weapon().isAxe() || get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("[pg]在[monster.he]只能认为是仁慈的情况下，你退了回来，让这只蜘蛛无力地爬走。趁着[monster.his]背对着你，你拿起你的" + (get_player().get_weapon().isAxe() ? "武器" : "伐木斧") + "并[walk]上前，挥舞武器砍向怪物的腿。[Monster.he]在恐惧和痛苦中尖叫，将[monster.his]甲壳质的手指深深插入沼泽的泥浆中。你再次举起斧头，砍得更深，让那条腿只剩下一点皮肉相连。");
            outputText("[pg]这个蜘蛛" + get_monster().mf("男孩","女孩") + "剧烈地喘息干呕，痛得快要吐出来了。[say: 为什么？] [monster.he]哭着问道。");
         }
         else
         {
            outputText("[pg]你琢磨着接下来该怎么做，悄悄靠近了[monster.him]。蜘蛛惊恐地盯着你。你抬起[monster.his]一条甲壳质的腿，推着膝盖同时拉扯脚踝。你继续按住[monster.his]骨盆把[monster.him]压在地上，用尽全力扭动并猛拉那条腿，引来痛苦的惨叫。又用力拉了几下后，伴随着“咔哒”一声，这条腿完全从髋关节脱臼了。");
            outputText("[pg]这个蜘蛛" + get_monster().mf("男孩","女孩") + "痛苦地退缩着，大口喘气，双手发抖。[say: 求、求求你，我很抱歉和你战斗，] [monster.he]乞求道。");
         }
         outputText("[pg]尽管你很可能已经让这个人打消了将来袭击你的念头，但若要给它的同类一个更深刻的教训，你最好继续下去。于是你决定无视[monster.his]哀嚎。也许需要费些力气，但你重新集中精神，抓住那条受伤的腿，" + (!(get_player().get_weapon().isAxe() || get_player().hasKeyItem("Carpenter\'s Toolbox")) ? "再次" : "") + "用尽全力猛地一拽。扭动和弯折帮助磨断了维系一切的纤维，那条腿很快就被撕了下来。");
         outputText("[pg]令人毛骨悚然的惨叫声响彻沼泽，蜘蛛痛苦地嚎叫着。" + (!(get_player().get_weapon().isAxe() || get_player().hasKeyItem("Carpenter\'s Toolbox")) ? "若不是这么费力气，你真想把另一条腿也一并卸下。" : "") + "泪水和鼻涕顺着[monster.his]脸流淌下来。[say: 我-我-我……你——][monster.he]语无伦次地结巴着，试图消化眼前发生的一切。");
         if(get_game().shouldraFollower.followerShouldra() && get_silly())
         {
            outputText("[pg]你体内那个幽灵的声音响了起来，[say: 看来他们现在没法在你面前占上风了！] 你能感觉到她那调皮的笑容。[say: 别对我皱眉头，勇者，我的幽默感可是无价之宝。]");
         }
         _temp_1.spidersKilled += 1;
         menu();
         addNextButton("痛打",spiderAmputationBeat).hint("把蜘蛛的腿还给它。");
         addNextButton("离开",spiderAmputationLeave).hint("这就够了。");
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function runFromFSpiderMorph() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         if(Utils.rand(2) == 0)
         {
            outputText("你转过身，在她靠近之前逃跑了。跑了一会儿后，你意识到那个蜘蛛女根本没有试图追赶你。你看到的她最后的画面是她低头看着地面，表情异常忧郁。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            startCombat(new FemaleSpiderMorph());
            get_combat().runAway();
         }
      }
      
      public function reset() : void
      {
         saveContent.spidersKilled = 0;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function loseToFemaleSpiderMorph() : void
      {
         if(get_player().hasCock())
         {
            if(get_player().cockThatFits(get_monster().vaginalCapacity()) == -1)
            {
               femaleSpiderMorphTooBigWebRape();
            }
            else
            {
               spiderMorphFemaleRidesACawk();
            }
         }
         else if(get_player().hasVagina())
         {
            defeatFemale();
         }
         else
         {
            outputText("蜘蛛女把你打晕了，嘴里一直嘟囔着什么“无性别的怪胎”。");
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_debugName() : String
      {
         return "蜘蛛形态";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function findASpiderMorphEggSack() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         outputText("你偶然发现一个挂在树上的巨大网状囊袋。走近仔细观察，你看到里面包裹着近十几个网茧，每个里面都有一个蠕动的身影。它们开始动得越来越快，也许是对附近的动静做出了反应，直到外壳最终破碎，释放出里面的东西。每个网茧里都有一个微小的、六英寸高的人形生物，每一个都像是一个微缩的孩子。引人注目的是，它们的特征让你想起了自己，而在你意识到这一事实的意义之前，它们就掉到地上，用它们那覆盖着甲壳的小腿匆匆跑开了。[pg]");
         outputText("当你意识到它们是你自己的孩子，是不久前被你操过的蜘蛛人生下的时候，你只能挠头。[pg]");
         pregnancy.knockUpForce();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fightFSpiderMorph() : void
      {
         startCombatImmediate(new FemaleSpiderMorph());
         spriteSelect(SpriteDb.get_s_spidergirl());
      }
      
      public function femaleSpiderMorphTooBigWebRape() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(!get_game().get_inCombat())
         {
            outputText("你急忙脱下你的[armor]并把它扔到一边，很高兴能让[eachcock]露出来透透气。当蜘蛛女看到你所有的");
            if(get_player().get_lust100() < 70)
            {
               outputText("膨胀的");
            }
            else
            {
               outputText("坚硬的");
            }
            outputText("长度时，她的眼睛睁大了。她难以置信的表情其实有点可爱，所以你开始抚摸自己，让它变得更大。[pg]");
            outputText("[say: 哇，你真是个大[boy]，不是吗？你为什么不躺下来舒服点，我来把你绑起来……我可不想你两腿之间的那头野兽杀了我！]她说道。[pg]");
            outputText("你躺了下来，对你那超大号的勃起充满自信，并幻想着她能用各种方式来满足你。她会用大腿夹着你操吗？也许她会用她那光滑的甲壳给你打手枪？当然，你觉得她总是可以把她那漂亮的小穴在你那巨大的阴茎上摩擦。" + get_player().SMultiCockDesc() + "因为你所有的下流想法，从它" + get_player().cockHead() + "处微微扩张的缝隙中滴下了一大滴饱满的先列腺液。湿润的水滴提醒了你身在何处，你及时抬起头，看到了这个苍白女人圆润的屁股在前后摇晃，微微颤动，而她的腹部在上面沉重地摇摆着。[pg]");
            outputText("在她那球形的蛛形纲器官上，她的吐丝器充血了，变得更加明显。它们扭动了一会儿，然后喷出大量的蛛网，沉重的丝线覆盖了你的[legs]、手臂、部分躯干，甚至你的[feet]。唯一完全没有被覆盖的地方是你的头和胯部。第二股光滑、不粘的丝线包裹住了第一股，确保你的情人在亲密接触时不会粘在你身上。蜘蛛女仆咯咯地笑着，漫步走上前来，仔细观察你的" + get_player().cockDescript(_loc1_));
            if(get_player().cockTotal() > 1)
            {
               outputText("，无视了其他较小的成员");
            }
            outputText("。她问道，[say: 这是你的骄傲和宝贝，对吧？嗯，我对这么笨重的东西没什么用，但如果你把我舔得足够舒服，也许我会看看它的高潮是否和它的尺寸一样令人印象深刻。][pg]");
         }
         else
         {
            outputText("你倒在地上，并且");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("把手伸向胯部，饥渴地抚摸着[onecock]");
            }
            else
            {
               outputText("痛苦地呻吟，无法动弹");
            }
            outputText("。蜘蛛女走上前，像个小女孩一样对你的状态咯咯笑着，同时她煞费苦心地脱下你的每一件盔甲，当你的" + get_player().cockDescript(_loc1_) + "弹出来时，她明显地倒吸了一口凉气。[pg]");
            outputText("[say: 这……这也太大了！我永远也骑不上这个怪物……不过也许你可以用另一种方式帮我，]她若有所思地说。[pg]");
            outputText("还没等你反应过来，蜘蛛女就转过身，向你展示她那翘挺的屁股，让你能跟着她那迷人的臀瓣摇摆，以及她上方沉重下垂的腹部弹跳。你看到无数的吐丝器从外骨骼的缝隙中伸出。它们迅速充血，填满并微微鼓起，然后扭动着向你喷射出一波粘稠的货物。蛛网重重地溅在你身上，将你的[legs]和手臂平钉在地上，然后将你的脖子、躯干，甚至你的[feet]都束缚在囚禁的丝线之下。第二波光滑、不粘的丝线包裹住了第一波，确保胜利者在利用她的猎物时不会被粘住。[pg]");
            outputText("蜘蛛女问道，[say: 你不介意我不浪费时间去操这个吧？它太大了，作为鸡巴毫无价值，更像是一个淫秽的玩具，而不是什么实用的东西。不过，如果你能让我足够舒服，也许我还是会让你射出来的。][pg]");
         }
         outputText("你刚想抗议，但这个施虐狂蹲了下来，将她腹部光滑的甲壳直接压在你的" + get_player().cockDescript(_loc1_) + "上，用它的重量将尿道隆起压平。她叹了口气，前后摇晃着臀部，用缓慢、挑逗的动作在你的鸡巴上前后拖拽着沉重的球体，导致可怜的阴茎迅速充血到最大、抽搐的尺寸。她看起来非常满意，宣布道，[say: 真是个好[boy]。现在来织一个漂亮、柔软的小鸡巴套来给这头野兽戴上口套。][pg]");
         outputText("立刻，光滑的丝线开始从她的吐丝器中滑出，在你的" + get_player().cockDescript(_loc1_) + "周围绕成长长的圈，直到它的上半部分被完全覆盖。你意识到，与将你钉在地上的蛛网不同，这些轻柔的丝线一点也不粘，虽然她编织的这个奇妙柔软的鸡巴套感觉很紧，但每次触摸时它都能轻松地弯曲和滑动一点。那奇妙的包裹还在继续，将你鸡巴的每一寸都紧紧地束缚在雪白的护套中，直到看不见一丝皮肤。蜘蛛女站起来，上下摩擦着温暖的蛛网，用丝管为你手淫了几次，直到你开始舒服得呻吟起来。[pg]");
         outputText("这只雌性蜘蛛停了下来，宣布道，[say: 还不准射，我可爱的大屌猎物。你还需要服侍我，记得吗？]你咕哝着，试图向上扭动，把你被绑住的阴茎再次推入她的手中，但她那包裹着你的粘稠蛛网将你完全钉在原地，连一英寸的臀部都抬不起来。就在你挣扎的时候，她改变了姿势，来到了你的脸上方。她的腹部挡住了你视线中的大部分光线，但从你顺从地躺在泥土中的位置，你可以惊人地看清她紧致、深色的圆环和黑皮肤、闪闪发光的性器官。[pg]");
         outputText("你的蜘蛛女主人没有耽搁，坐下来将她湿漉漉的嘴唇放在可以刷过你口鼻的位置，而她光滑、近乎瓷白色的臀瓣则包裹住了你的大半张脸。你迟钝地注意到她腹部的重量压在你的头上，你希望她完事后不会把你的脸也用蛛网封起来。她不会那样做的，对吧？还没等你来得及进一步思考，你就感觉到两颗坚硬的乳头擦过你的" + get_player().cockDescript(_loc1_) + "和肚子。两个匕首般锋利的尖端刺入你的大腿，片刻之后，液态的欲望在你的血管中跳动，让你的鸡巴慢慢地用稳定的先列腺液填满护套内的空间。[pg]");
         outputText("蜘蛛女拔出尖端，拍打着新鲜的伤口，命令道，[say: 舔我，我美味的大屌点心！让我舒服，否则我会一直咬你，直到你服从！][pg]");
         outputText("你已经因为饥渴而颤抖喘息，向湿润的蜘蛛小穴呼出大口热气，试图控制住自己。再咬几口……你绝对无法承受被挑逗得那么兴奋却得不到任何释放。你歪着头，将嘴唇压在湿滑的阴户上，伸出舌头，第一次犹豫地品尝她女性的汁液。它们是甜的！她的小穴就像蜂蜜一样，甜得几乎令人发腻，就像一个缓慢滴落的糖浆喷泉，让你每次深入这糖浆般的毛穴时，舌头都兴奋得嗡嗡作响。[pg]");
         outputText("[say: 哦，没错，我的小昆虫，继续舔……服侍我，你的女主人，]蜘蛛女命令道，同时她用手握住了你被蛛网包裹的鸡巴。在被冷落了这么久之后，她纤细的手指触摸你的" + get_player().cockDescript(_loc1_) + "，带来了一阵让你头晕目眩的感官交响乐。渴望得到更多奖励，你的舌头以近乎宗教般的狂热攻击着上方湿滑的小穴，用长长的舔舐膜拜着滴水的小穴，同时你轻轻吸吮着她阴蒂的小肉球。蜘蛛女开始用浸满先列腺液的护套慢慢地为你打飞机，那温暖、湿润的紧致感就像一个巨大的小穴在你的粗壮上滑动。她上下套弄着，用她的蛛网配合着你疯狂舔舐的节奏操着你。[pg]");
         outputText("你舔得越快，她用蛛网撸你的速度就越快。很快，你们俩都喘着粗气，发出毫无意义的欢愉喘息，并肆意挥洒着你们的淫液。快速抽插的湿滑蛛网小穴在你的根部堆积，每次向下抽动时都会在你的顶端拉紧，而每次向上抽动时，它都会产生一个小的真空，吸吮着你的鸡巴，同时将你的一小部分血肉暴露在空气中。感觉奇妙极了，虽然你被完全束缚，但你的[hips]肌肉不断地对抗着束缚，试图向上挺动，像一只没有思想的野兽一样与那轻柔的套管交配。[pg]");
         outputText("一股糖果般甜美的糖浆溅在你的舌头上，然后那毛茸茸的黑色蜘蛛小穴重重地压在你的脸上，力道大得切断了你的呼吸。这个动作让你除了舔舐痉挛的通道外无事可做，同时它将女性的体液喷了你一脸。你舔舐并吞咽着，对着甜美的小穴发出可怜的呜咽，而你自己的高潮则在女主人性感蛛网那湿滑紧致的拥抱中慢慢积聚。精液从你巨大的射精口喷涌而出，喷射的力度足以使蛛网变形，并在你的鸡巴顶端形成一个精液泡。你又吞下了一份女士的精华，然后下一波种子泵入气泡，在你的丝绸避孕套顶端形成一个漂亮圆润的精液袋。你一次又一次地射精，把小气球越吹越大，直到你的");
         if(get_player().balls == 0)
         {
            outputText("身体完全被掏空");
         }
         else
         {
            outputText("卵蛋已经彻底射空了");
         }
         outputText(".[pg]");
         outputText("突然，你注意力的焦点伴随着湿润的摩擦声抽离了，让你大口呼吸着充满小穴气味的空气，并且一段时间以来第一次看到了你的肉棒。它现在一团糟。上面有");
         if(get_player().cumQ() < 50)
         {
            outputText("一个苹果大小的精液块挂在龟头上，里面装满了你顺从的精液。");
         }
         else if(get_player().cumQ() < 300)
         {
            outputText("一个葡萄柚大小的精液泡挂在龟头上，里面装满了你顺从的精液。");
         }
         else if(get_player().cumQ() < 700)
         {
            outputText("一个篮球大小的精液气球挂在龟头上，沉甸甸地压着你，里面装满了大量你顺从的精液。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("一个西瓜大小的精液气球挂在龟头上，沉甸甸地压在你的肚子上，里面晃荡着你注入的所有顺从的精液。");
         }
         else if(get_player().cumQ() < 2000)
         {
            outputText("一个健身球大小的精液团挂在龟头上，垂在你的身体上，里面湿漉漉地晃荡着你注入的所有顺从的精液。");
         }
         else
         {
            outputText("一个人大小的精液团挂在上面，覆盖着你，里面装满了你注入的所有顺从的精液。");
            if(get_player().cumQ() >= 4000)
            {
               outputText("它破裂了，太脆弱而无法承受所有的液体压力，你的精液把你们俩都浸透了！");
            }
         }
         outputText("你叹了口气，陷入了断断续续的沉睡，几乎没有察觉到蜘蛛女切断了你的束缚。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(2),DynStat.Sens(1));
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function fSpiderMorphRapeDude() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         outputText("你把蜘蛛女推倒仰面躺下，在脱下[armor]之前，好好打量了一番你的战利品。看到你的[cocks]时，她");
         if(get_monster().get_lust100() <= 99)
         {
            outputText("稍微放松了一些。发情雌性的气味从她身上飘散出来，提醒着你这可能就是她一开始想要的。");
         }
         else
         {
            outputText("流下了口水，两个小穴都滴下淫液，期待着即将到来的性爱。空气中弥漫着性爱的气味，你意识到你马上就要给她她想要的东西了。");
         }
         outputText("这都不重要——你要把她的阴户操满精液。[pg]");
         outputText("蜘蛛女张开双腿，让你能清楚地看到她那奇特、乌黑发亮的肉缝入口。与她的四肢不同，她阴唇闪烁的黑曜石般的光泽并非因为甲壳，而是因为色素沉着和滴落的淫液。深色的皮肤从暗色逐渐褪成瓷白色，吸引着你的目光锁定在那个缓缓绽放的漆黑通道上。你着迷地看着她完全屈服，用两根手指抚摸着肿胀的阴唇，然后将手指探入她那欢迎着你的小穴深处。[pg]");
         outputText("你走上前，[eachcock]");
         if(get_player().get_lust100() < 70)
         {
            outputText("变粗");
         }
         else
         {
            outputText("跳动");
         }
         outputText("准备好插入那个诱人的蜘蛛小穴。湿润的阴唇轻松地滑过你的" + get_player().cockDescript(_loc1_) + "，在你滑入时发出湿漉漉的吧唧声。你因为这突如其来的变化而喘息，慢慢地摇晃着你的[hips]，紧贴着蜘蛛人的身体，同时适应着她下体的热度。就在那一刻，她抓住了你的头，轻轻一拉引导你低下头，将你的嘴唇贴在她的乳房上。你微笑着，开始吮吸她深色皮肤上的乳头。[pg]");
         outputText("被击败的蜘蛛人明显地颤抖着，在你一次又一次地深入她体内时大声呻吟，你慢慢开始用更快、更自信的抽插来操她。她竟然开始哀求，[say:求、求求你射精前拔出来好吗？我想让你继续操我，但、但我不想怀孕。][pg]");
         outputText("这真是出乎意料。你拍打她的屁股，咬住她的乳头，让她闭上那毫无价值的嘴——如果她不想让你操她的小穴，她就不该那么努力地想脱你的裤子。她扭动着，挣扎着，随着你的每一次抽插，她的腹部都会喷出细小的半成形蛛丝，几乎要高潮了，但依然睁大眼睛，担心着怀孕。你用空闲的手按摩她的另一侧乳房，不断地抽插和捣弄着她");
         if(get_player().cockTotal() > 1)
         {
            outputText("而你的另一根");
            if(get_player().cockTotal() == 2)
            {
               outputText("肉棒无力地甩动着");
            }
            else
            {
               outputText("肉棒无力地甩动着");
            }
         }
         outputText("。这额外的刺激足以让她高潮，让她用大量的淫液喷湿你的腹股沟。你捏住她的乳头，再次咬下去，");
         if(get_player().cor < 50)
         {
            outputText("挑逗着这个渴望的骚穴");
         }
         else
         {
            outputText("惩罚这个毫无价值的骚穴");
         }
         outputText("因为她早泄了，而她颤抖的小穴那痉挛般的榨汁动作终于将你推向了边缘。[pg]");
         outputText("你一插到底");
         if(get_player().balls > 0)
         {
            outputText("并将你的蛋蛋拍打在她湿透的会阴上");
         }
         outputText("，你的" + get_player().cockDescript(_loc1_) + "抽搐着");
         if(get_player().cockTotal() > 1)
         {
            outputText("而");
            if(get_player().cockTotal() > 2)
            {
               outputText("其余的则毫无意义地痉挛着");
            }
            else
            {
               outputText("另一根则毫无意义地痉挛着");
            }
         }
         else
         {
            outputText("愉快地准备卸货");
         }
         outputText("。精液从你的马眼喷涌而出，深深地填满她的体内，直抵她的子宫颈。蜘蛛女紫色的眼睛因为她仍在不断高潮的小穴中传来的新感觉而变成了斗鸡眼。你配合着每一次泥泞的精液喷发，抽动着你的[hips]，将越来越多的精液推入她体内，直到你确信它们会在她的子宫里扎根。");
         if(get_player().cumQ() >= 500)
         {
            outputText("每一股喷射都感觉比上一股更猛烈，当你射完时");
            if(get_player().cumQ() < 1000)
            {
               outputText("，你可以从她微微隆起的小腹看出，她已经吃饱了精液。");
            }
            else
            {
               outputText("，精液正从她阴唇的缝隙中源源不断地漏出来。你在她身下弄出了一滩水，她的肚子紧绷绷的，被撑得像个孕妇一样。");
            }
         }
         outputText("[pg]");
         outputText("这位即将成为母亲的蜘蛛人率先从高潮中平复下来，重新控制住了自己，而你的" + get_player().cockDescript(_loc1_) + "正将最后的礼物送入她的小穴。她的双手在自己");
         if(get_player().cumQ() >= 1000)
         {
            outputText("隆起的");
         }
         outputText("肚子上游移，脸上带着震惊和难以置信的神情，她一边呻吟一边开始哭泣，[say: 我要怀孕了！我从、从来没想过会这样……][pg]");
         outputText("拔出肉棒，");
         if(get_player().cor < 33)
         {
            outputText("你擦去她的眼泪并亲吻了她，解释说任何纯洁的新生命都是一种祝福。听到你温柔的话语，她振作了起来，再次将注意力转回自己的肚子，对这一切仍感到有些茫然。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你耸耸肩，叹了口气，擦去她眼角的泪水，心里感到一丝内疚。她还在抽泣，抚摸着自己的肚子，显然对这突如其来的变化感到困惑。");
         }
         else
         {
            outputText("你扇了她一巴掌，叫她坚强点。她一听就开始嚎啕大哭，蜷缩成紧紧的一小团，毫不掩饰地哭泣着。");
         }
         outputText("你穿好衣服，回到了营地。");
         get_player().orgasm("Dick");
         pregnancy.knockUpForce(25,200);
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function fSpiderMorphRape() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         outputText("你嘲笑她，用你的[legs]把她推倒，欣赏着这位苍白少女无瑕的肌肤和深色、充满恋物癖气息的外骨骼在沼泽泥土中弹跳的景象。她紧张地夹紧双腿，试图向你掩饰她的私处");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("，尽管她的手指仍在不停地揉搓着她湿滑的阴唇");
         }
         outputText("。你拍开她的手，掰开她的双腿，近距离地仔细观察她的阴道。[pg]");
         outputText("她的阴部和她的乳头一样是深色的，不过她私处的阴唇比那些小凸起暗淡的皮肤更接近纯粹的午夜黑。一层女性的淫液在她的外阴上积聚，使她的大阴唇和皮肤在透入沼泽地面的微弱阳光下明显闪闪发光。在她的阴道周围，皮肤迅速从深巧克力色褪回她身体其余部分那种瓷器般的白色。你戳弄并把玩着那湿润的裂隙，感觉柔软的皮肤像柔软的天鹅绒手套一样在你的手指周围分开。作为回应，她变得更湿了，对你的侵入发出哀怨的轻声呻吟");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("直到她气喘吁吁，她那小巧的阴蒂露了出来，硬得像块石头");
         }
         outputText(".[pg]");
         outputText("蜘蛛女那蜜色的缟玛瑙色阴部令人无法抗拒，你脱下你的[armor]，准备迎接即将到来的性爱。当你分心时，这只被击败的蜘蛛形态怪物开始自慰，同时用睁得大大的、渴望的眼睛看着你。你抓起附近的一根藤蔓，把这个荡妇的手从她的阴部猛拉开。她抗议着，但你得意地笑着告诉她，除非她让你高潮，否则她别想拿回她的爪子。蜘蛛女孩默默地点了点头，不过当你开始绕着她转圈，来到她胸前时，她的脸上闪过一丝困惑。[pg]");
         outputText("你一手托起她的一只乳房，另一手抬起她的头，让那看起来很淫荡的黑色嘴唇靠近到足以亲吻她乳头的程度。她耸耸肩，开始舔舐和吮吸。你不得不好奇她是否能仅靠乳头刺激就达到高潮，但这并不是你的目标。你叹了口气，在她耳边低语：[say:咬下去。我想看看你那可爱的小穴因为渴望而喷涌的样子。]她猛烈地摇头，尽其所能地抗议，但你直接把她的乳房拍回她嘴里，并重申了你的指示。[pg]");
         outputText("经过几次重复，她终于屈服了，让她的毒牙刺破了她乳房的皮肤。这个动作带来的疼痛让她咬紧牙关，将充满毒液的长矛完全刺入。起初，她的眼睛因疼痛而睁大，但一旦她的眼睑开始下垂，变成一种充满情欲和渴望的凝视，你判断她已经受够了，就把她拉开了。两个微小的红点是她“注射”的痕迹，从蜘蛛女孩在空气中挺动的样子来看，你知道她的身体已经准备好了。[pg]");
         outputText("你躺在蜘蛛荡妇身边，将你的" + get_player().legs() + "穿过她的大腿和下半身。当你摆好姿势时，每一次对她那渴望的阴户的微小触碰都会让她喘息和呻吟，用她大量分泌的淫液涂抹你的下半身。一旦你的[vagina]终于接触到她那湿滑、喷涌的阴户，结果是瞬间且强烈的——她猛烈地高潮了。她的双腿在你的[legs]周围扭曲痉挛，无意识的抽搐蔓延到她的全身，直到她在泥土中扭动，她的乳房也在上下翻飞、抖动。[pg]");
         outputText("虽然她抽搐的身体在你的[vagina]上摩擦带来的刺激很美妙，但你很快就厌倦了她的挣扎。你找到她庞大的腹部，找到了其中一个吐丝器。这个肉质的突起出乎意料地容易操作，你把它对准蜘蛛女孩的一条腿并挤压。一股蛛网喷溅在她覆盖着甲壳的腿上，虽然它没有粘在她身上，但它确实完全吞没了她的脚踝并粘在地上，把她固定在原地。你退后一步，对她的另一条腿重复这个动作，让她被牢牢地困住。[pg]");
         outputText("你再次穿过她的身体下方和周围，滑回到她仍在颤抖的阴户上，直到你湿滑的私处紧紧压在上面。随着两对湿滑的阴唇在彼此身上滑动，混合着淫液的滴落发出湿润的挤压声，沼泽的其余部分逐渐褪成一个几乎被忽视的背景。你的[clit]很快从包皮中露出来");
         if(get_player().getClitLength() < 4)
         {
            outputText("，在黑色蜘蛛阴户湿透的阴唇上碰撞和滑动。");
         }
         else
         {
            outputText("，慢慢地向前刺入，用它那绝对不淑女的长度和粗细穿透湿透的蜘蛛阴户。");
         }
         outputText("这位苍白的美人呻吟着、尖叫着，她被绑住的双臂徒劳地拉扯着束缚，而你则无情地干着她，把她的身体当作你润滑的、振动的玩具。[pg]");
         outputText("你们交配的挤压声和水声回荡着，而你们俩的声音都因为快感而变得更高亢。蜘蛛女高潮了无数次，把她甜美的蜜汁喷在你的[vagina]上，次数多到足以在你们腰部结合处下方留下一个水坑。即使在潮湿的沼泽空气中，飞溅的女性淫液也很快渗入泥土，但你那蜘蛛般的爱人会继续制造更多；你对此深信不疑。你抓住她的一只脚作为杠杆，越来越用力地挺动，直到你的[clit]");
         if(get_player().getClitLength() >= 4)
         {
            outputText("恰到好处地被她天鹅绒般的拥抱抓住，你在用你“微小”的凸起干她时高潮了。");
         }
         else
         {
            outputText("恰到好处地拖过她天鹅绒般的阴唇，你猛烈地高潮了，在狂喜中尖叫。");
         }
         outputText("[pg]");
         outputText("你翻滚着、挺动着，你的臀部完全不受控制地移动。闭上眼睛，你享受着这一刻，让你的指尖卷入下方长满青苔的地面，而一波波的快感从你的女性私处辐射开来。");
         if(get_player().cockTotal() > 1)
         {
            outputText("在整个过程中，[eachcock]将浪费的精液喷洒在她的腿上");
            if(get_player().cumQ() >= 400)
            {
               outputText("，甚至留下了一");
               if(get_player().cumQ() >= 400 && get_player().cumQ() < 1000)
               {
                  outputText("小滩");
               }
               else if(get_player().cumQ() >= 2000)
               {
                  outputText("大滩");
               }
               outputText("地上的水洼");
            }
            outputText("。");
         }
         outputText("蜘蛛女和你共享了高潮的瞬间，随后在束缚中突然瘫软下来，倒在了");
         if(get_player().cumQ() < 400)
         {
            outputText("她自己的");
         }
         else
         {
            outputText("混合的");
         }
         outputText("淫液水洼中。你只是向后躺去，微微颤抖着，等待着余韵消退，然后才从这个倒霉的荡妇身上抽身离开。[pg]");
         outputText("没过多久你就恢复了体力并穿好了衣服，不过看起来你的情人情况可没那么好。");
         if(get_player().cor < 33)
         {
            outputText("出于一时的怜悯，你在离开前努力将她从束缚中解救了出来。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你感到有些内疚，在离开之前，你解开了她手上的绑绳，这样她就能自己挣脱了。");
         }
         else
         {
            outputText("你把她留在那里，手脚依然被完全束缚着。算她倒霉。");
         }
         get_player().orgasm("Vaginal");
         if(get_player().canDepositEel())
         {
            outputText("[pg]<b>在你们俩忙活的时候，一条寄生鳗悄悄钻进了她的体内。</b>");
            get_player().depositEel();
         }
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function fSpiderMorphGreeting() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         if(pregnancy.get_event() == 2)
         {
            findASpiderMorphEggSack();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,270) == 0)
         {
            outputText("你深入沼泽探索，尽力无视这里令人窒息的闷热与潮湿。昆虫在你周围不断地嗡嗡作响、飞来飞去，试图用它们那无休止的噪音把你逼疯。你从[face]上拍走了一只特别吵闹的虫子，这才意识到你已经不再是孤身一人了。[pg]");
            outputText("一个奇怪的裸体女性站在你面前，双手叉腰，上下打量着你。她一丝不挂，在潮湿的沼泽空气中露出闪闪发光的苍白肌肤。虽然她的四肢都包裹着某种闪亮的黑色覆盖物，但这似乎只是突出了她的裸体，而不是为了遮掩。在她身后晃动着一个巨大的黑色球体，上面有几个小突起，你只能猜测那是她的吐丝器。她显然是个蜘蛛女，现在你凑近一看，那黑色的物质是她的外骨骼！这个怪物女孩在靠近你时，向你露出针状的毒牙，微微一笑。[pg]");
         }
         else
         {
            outputText("你在沼泽里探索，还没走多远，一个女性蜘蛛人就出现了！她显然和你上次遇到的那个不同，尽管她的许多特征都一样。你意识到她离你不到十几步远，正慢慢靠近，眼中闪烁着奇怪的光芒。[pg]");
         }
         outputText("你要做什么？");
         menu();
         addButton(0,"战斗",fightFSpiderMorph);
         addButton(1,"尝试交谈",talkToFSpiderMorph);
         addButton(14,"离开",runFromFSpiderMorph);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,270,FlagDict_Impl_.arrayReadInt(_loc1_,270) + 1);
         unlockCodexEntry(2037);
      }
      
      public function evilSpiderGirlVictoryAnal() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ == -1)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = get_player().cockThatFits2(get_monster().analCapacity());
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         outputText("你脱下你的[armor]，同时轻蔑地俯视着你的战利品。");
         if(get_monster().get_lust100() >= get_monster().maxLust())
         {
            outputText("她正哀怨地呻吟着，同时又开心地用手指抠弄着自己，简直是在向你献上她那多汁的肉穴。");
         }
         else
         {
            outputText("她痛苦地呻吟着，挣扎着想要移动，却又倒了下去，双腿岔开，不经意间向你展示了她的小穴。");
         }
         outputText("叹了口气，你抓住她纤细的身躯，一边感叹她身体的轻盈，一边将她抱起，让她摆出四肢着地的姿势。");
         if(get_monster().get_lust100() >= get_monster().maxLust())
         {
            outputText("她失望地喵呜了一声。");
         }
         outputText("这个姿势对她来说好多了；屁股撅起，小穴和后庭完全暴露在外。[pg]");
         outputText("蜘蛛人恐惧地回头看了一眼，但她还是弓起背，抬高腹部，让你更容易进入她的穴口，就像她真的是个顺从的荡妇一样。你用双臂环抱住她沉重的外骨骼器官，走上前去，借力将你的" + get_player().cockDescript(_loc1_) + "滑入她那欢迎你的小穴。蜘蛛的阴户伴随着湿润的吧唧声将你吸入，以非同寻常的渴望欢迎你的肉棒进入那渗出汁液的鞘中，直到柔软的黑色阴唇紧紧压在你的腰间。你很难不屈服于那丝滑通道中湿热的压力，当场就像野兽一样操她，但一个更紧致、更美妙的洞穴正在召唤你那已经润滑过的操穴棒的注意力。[pg]");
         outputText("你用一根手指在蜘蛛荡妇直肠外侧粗糙的皮肤上画圈，看着那紧致的洞口随着每一次刷过她敏感的皮肤而眨眼。她回过头，皱着眉头担忧地问道，[say: 你、你不会要把什么东西放进那里吧？感觉好奇怪！][pg]");
         outputText("你当然会。你用行动回答了她的疑问，从天鹅绒般的隧道中抽出，将你的" + get_player().cockDescript(_loc1_) + "直直地抵在蜘蛛人紧致的屁眼上。她惊讶地叫了一声，试图爬开，但你紧紧抓住她，压在她身上，把她的奶子和脸按进肥沃的沼泽泥土里。你继续压迫着，骑上她，将你的" + get_player().cockDescript(_loc1_) + "深深地插入她黑暗的洞穴");
         if(_loc2_ >= 0)
         {
            outputText("，同时你的" + get_player().cockDescript(_loc2_) + "滑入了她温暖的小穴。");
         }
         else
         {
            outputText("，当你将它撑得更宽时，她紧致的括约肌无力地紧紧夹着你。");
         }
         outputText("她覆盖着甲壳的指尖深深抠进泥土里，背部条件反射般地弓起，仿佛这样就能从这刺激中扭身逃脱。你把她压在身下，紧紧按住，直到她停止挣扎。[pg]");
         outputText("终于，她放弃了对这强迫后庭交的抵抗，放松了下来。一旦你感觉到她的括约肌松开了对你肉棒的死命钳制，你便开始操她的屁股。你又重又快地抽插着，毫不在意她是否舒服，只沉迷于占有这个未被驯服的怪物女孩紧致、甚至可能是处女的后庭。每一次用力的挺进和抽插，都让她紧绷的肉环变得更松弛一些，也更能容纳你的雄风。慢慢变宽的括约肌被撑得大开，每次拔出时，她的后穴都会微微敞开");
         if(_loc2_ >= 0)
         {
            outputText("，但它仍然比那个泥泞的蜘蛛小穴要紧致得多，那个小穴正有节奏地吞噬着你的" + get_player().cockDescript(_loc2_));
         }
         outputText(".[pg]");
         outputText("你的猎物咬着嘴唇，试图憋住欢愉的喘息，但你一巴掌拍在她柔软的屁股蛋上，逼得她惊呼出声。随着防线崩溃，你欣赏到了一场由她言语上的享受交织而成的听觉交响乐。蜘蛛女喘息着、低吟着、呻吟着、娇喘着，最终在你" + get_player().cockDescript(_loc1_) + "每一次填满她后庭的挺进中，开始胡乱地喊着“是的”。她的双腿发软，你不得不托住她的腹部把她架起来，同时对着她暴露的屁股猛烈输出，用尽你肌肉所能允许的最大力气操弄着这个蜘蛛女。[pg]");
         outputText("这个蜘蛛荡妇猛烈地高潮了，展现出她的绝顶");
         if(_loc2_ == -1)
         {
            outputText("，将她芬芳的淫液喷溅在泥土上");
         }
         else
         {
            outputText("，将你的" + get_player().cockDescript(_loc2_));
            if(get_player().balls > 0)
            {
               outputText("和蛋蛋");
            }
            outputText("喷满了她大量的淫液");
         }
         outputText("。距离你自己的高潮还有一段距离，你把玩着这只失去理智的蜘蛛的吐丝器，拉扯着、拽动着，最后试探性地将一根手指捅进它们的开口里。你的后庭性玩具彻底疯狂了，她猛烈地挺动和颤抖着，整个身体都在摇晃扭动，同时她的呻吟声在音调和音量上不断攀升，直到几乎高得让人听不见。[pg]");
         outputText("黏糊糊的白色黏液开始从她的吐丝器中喷涌而出，滴落在你的手中，变成一团半成型的黏稠物。你试探性地拉扯其中一个微小的器官，扭动它指向蜘蛛女的背部。粗大的黏稠原蛛丝喷了她一身，在她颤抖的后腰处积成一滩。你心满意足地用她自己的体液把她射满全身，同时粗暴地蹂躏着她被玩坏的后庭");
         if(_loc2_ != -1)
         {
            outputText("和滴着淫液的肉缝");
         }
         outputText("，看着她的屁股肉随着你撞击的力道而晃动。[pg]");
         outputText("像这样操她，没过多久你就达到了高潮，而且");
         if(get_player().balls > 0)
         {
            outputText("随着你的蛋蛋蠕动并释放");
         }
         else
         {
            outputText("前列腺释放");
         }
         outputText("，你将一股股浓稠的精液深深地注入她空荡荡的肠道中");
         if(_loc2_ != -1)
         {
            outputText("和小穴");
         }
         outputText("，用温暖的精液填满她。蜘蛛女慢慢开始平静下来，她的吐丝器在你的抓握中变得无力。她伸手去摸自己的肚子，仿佛在感受那填满肠道的精液冲刷进她的后庭");
         if(get_player().cumQ() > 500)
         {
            outputText("。令人难以置信的是，她真的能感觉到，随着你在她体内射出更多精液，她体会到了肚子膨胀的感觉");
            if(get_player().cumQ() < 750)
            {
               outputText("微微");
            }
            else if(get_player().cumQ() >= 1200)
            {
               outputText("剧烈，变成了一个几乎可以说是下流的凸起");
            }
         }
         outputText(".[pg]");
         outputText("你拔出来并退后一步，轻轻拍了蜘蛛一下，让她侧躺下来。一");
         if(get_player().cumQ() < 100)
         {
            outputText("股细流般");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("股喷涌般");
         }
         else
         {
            outputText("条河流般");
         }
         outputText("的精液从她大张的肛门中涌出，在她慢慢失去意识时积聚在沼泽的地面上。你深情地拍了拍她的屁股，穿好衣服，感到心满意足，准备继续你的冒险。");
         if(_loc2_ != 1)
         {
            pregnancy.knockUpForce(25,200);
         }
         get_player().orgasm("Dick");
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function defeatFemale() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         if(!get_game().get_inCombat())
         {
            outputText("你同意和这个可怜的、欲求不满的蜘蛛女仆做爱，并且");
            if(get_player().cor < 33)
            {
               outputText("紧张地");
            }
            else if(get_player().cor < 66)
            {
               outputText("调皮地");
            }
            else
            {
               outputText("诱惑地");
            }
            outputText("脱下衣服，把你的[armor]扔到一边，将自己完全暴露出来，就像你即将成为的恋人一样。");
            if(get_player().hasCock())
            {
               _loc1_ = get_player().cockTotal() > 1;
               _loc2_ = _loc1_ ? "s" : "";
               _loc3_ = _loc1_ ? " 你的每根" : " 你的";
               if(get_player().get_lust100() >= 70)
               {
                  outputText("" + _loc3_ + "坚硬如铁的肉棒" + _loc2_ + "有力地抽动着，你好奇蜘蛛女孩会怎么“干”你，在对即将到来的性接触的期待中颤抖着。");
               }
               else if(get_player().get_lust100() >= 33)
               {
                  outputText("" + _loc3_ + "半勃的肉棒" + _loc2_ + "微微变硬，你好奇蜘蛛女孩会怎么“干”你，为了即将到来的性接触而挺立起来。");
               }
               else
               {
                  outputText("" + _loc3_ + "疲软的肉棒" + _loc2_ + "微微变硬，你好奇蜘蛛女孩会怎么“干”你，为了即将到来的性接触而挺立起来。");
               }
            }
            else if(get_player().hasVagina())
            {
               outputText("与此同时，你的" + get_player().vaginaDescript(0) + "");
               if(get_player().wetness() < 4)
               {
                  outputText("变得湿润");
               }
               else
               {
                  outputText("滴下淫液");
               }
               outputText("同时你的阴唇充血肿胀，变得更加敏感，渴望被触碰。");
            }
            outputText("[pg]");
            outputText("蛛女转过身，向你摇晃着她的臀部，让你的目光沿着她闪亮、及大腿高的甲壳表面上下游走，直到她那俏皮的心形臀部和下垂的腹部。它收缩颤抖着，危险地摇晃着，然后喷出一大股蛛丝。这粘稠的有机束缚物砸在你身上，将你钉在地上，不过柔软的泥炭藓垫子足以防止你受伤。事实上，它的海绵状质感简直就像床垫一样。你徒劳地挣扎了一下，蜘蛛又向你喷射了一波蛛丝，将你完全粘在一团无法穿透的白色粘性物质中。你忍不住注意到她完全避开了你的腹股沟、脸和[chest]。[pg]");
            outputText("[say:为了安全起见，再来一层，]蜘蛛娇嗔道，眼中带着饥渴、几乎是野性的神情。她那覆盖着甲壳的膝盖相互碰撞，轻哼了一声，然后在你身上喷下最后一层蛛丝。既然任务完成了，她爬到你身上解释道：[say:我们可不想在做爱的时候，我的皮肤被粘稠的蛛丝粘住，对吧？]你点点头，第一次对自己的处境感到有些担忧。[pg]");
            outputText("蛛女得意地笑了，她的脸上带着残酷、掠夺的神情，说道：[say:你会好好伺候我，并且乐在其中的。][pg]");
         }
         else if(get_player().get_HP() < 1)
         {
            outputText("你倒在地上，彻底被击败，再也无法抵抗这残忍的蜘蛛眷属的意图。她踢了你的侧身，她脚上坚硬的甲壳痛苦地陷入你的肉里。你因冲击力而仰面躺下，眼中充满恐惧地看着她熟练地脱下你的装备。她转过身，缓慢而性感地后退了一步，开始向你扭动她那硕大的臀部，几乎是在挑逗你。你趁机仔细打量她，目光沿着她那覆盖着甲壳的柔软双腿向上游走，来到她心形的臀部，最后停留在她那上下摆动、沉甸甸的腹部上。[pg]");
            outputText("在你的注视下，许多吐丝器变得清晰可见，从甲壳上凹陷的孔洞中探出。它们完美同步地脉动和蠕动了片刻，准备着蛛丝，直到准备好将其喷吐而出。它们齐刷刷地喷出一股白色的粘稠蛛丝。它溅落在你身上，用它的重量将你钉在地上。你试图起身，但在你的伤口和粘稠的轻柔纤维之间，你已经被完全固定住了。第二层纤维丝覆盖在第一层上，你注意到新的一层与第一层的质地不同。[pg]");
            outputText("胜利的蜘蛛沉思着，[say:我们可不想让我在强暴你的时候被自己的网粘住，对吧？][pg]");
            outputText("知道她打算强迫你，你忍不住因为想到这个曲线优美的蜘蛛女妖骑在你脸上，而她光滑的甲壳紧紧夹住你的头而感到兴奋。你甩开这个念头，但她看到了你的分心，开始用尖锐的指尖在你的一侧[nipples]周围画圈，然后问道：[say:哦，你已经准备好做爱了吗？已经很久了，我本来打算好好品味一下的，不过我想我们应该开始了。][pg]");
         }
         else
         {
            outputText("你倒在地上，开始疯狂地用手指抠弄你的" + get_player().vaginaDescript(0) + "，弓起你的[hips]，因为对性接触的渴望压倒了你的矜持。");
            if(get_player().hasCock())
            {
               outputText(get_player().SMultiCockDesc() + "淫荡地甩动着，在它们接触到的任何地方都留下了先列腺液的痕迹。");
            }
            outputText("蜘蛛女低头看着你俯卧着自慰的样子，慢慢开始拨弄自己饥渴的穴。她转过身，张开双腿，手上的动作丝毫没有减慢。她苍白的心形臀部开始随着手指的抽插左右摆动，经常被她沉重的蜘蛛腹部所遮挡。[pg]");
            outputText("球形的蜘蛛器官上隆起许多突起，每一个都完美同步地充血并微微扭动。事实上，你几乎没有注意到，因为你太专注于她湿润的私处，根本不在乎她奇怪的蜘蛛部位。不幸的是，每一个吐丝器都向你喷出一波蛛网，把你的手从私处拉开，将你完全钉在地上。你徒劳地挣扎着，拼命想把手指放回你酸痛的穴里，但粘稠的丝线紧紧地固定着你，让你动弹不得。它们再次扭动，片刻之后，你被进一步埋在轻薄的丝线之下。[pg]");
            outputText("蜘蛛女走近，一边若有所思地轻轻拨弄着紧绷的蛛网，一边说道：[say:我们可不想让我娇嫩的皮肤被这些粘稠的丝线挂住，对吧？][pg]");
            outputText("你想知道她为你准备了什么，腹中啃噬般的恐惧让你暂时从核心沸腾的渴望中分心。看懂了你的表情，蜘蛛女笑了起来，开始在你的[nipple]周围画圈，同时解释道：[say:亲爱的，我为什么要吃你呢？我有一种……不同的饥饿感，打算让你来满足。不过也许我能在这里找到点吃的。]她用指关节摩擦你暴露的私处，让你沮丧地呻吟。[pg]");
         }
         outputText("蜘蛛人舔了舔嘴唇，双手在臀部和腹部摩擦，淫荡地呻吟着，屈服于她长期被忽视的性需求。她闪闪发光的紫色眼睛微微眯起，锁定在你暴露的[nipples]上。蜘蛛女将她反光的黑色嘴唇撅成诱人的形状，片刻之后吞噬了其中一个尖锐的乳晕。你感觉到她的毒牙尖端抵在你的皮肤上，在你的肉体上刮出微小的、充满毒液的沟壑");
         if(get_player().biggestLactation() >= 1)
         {
            outputText("随着她从你泌乳的乳房中吸出的每一口乳汁");
         }
         else
         {
            outputText("随着她每一次徒劳无功、让你乳头充血的吸吮");
         }
         outputText(".[pg]");
         outputText("你在蜘蛛女皇身下扭动着，无助地被困在她的网中，任由她折磨你的每一个[nipples]。你的欲望不断高涨，虽然你的下体渴望哪怕是最轻微的触碰，但她却巧妙地避开了你");
         if(get_player().wetness() < 3)
         {
            outputText("湿润的");
         }
         else if(get_player().wetness() < 5)
         {
            outputText("流着口水");
         }
         else
         {
            outputText("喷涌着");
         }
         outputText("阴唇，让它们浸泡在自己的汁液中。你呻吟着，在这样的刺激下无法保持沉默。这只淫荡的蜘蛛女终于松开了你肿胀的乳头，越过红色的抓痕抬头看着你的脸。[pg]");
         outputText("[say:真美味！现在让你准备好，]她带着得意的笑容说道。你沮丧地呻吟着，但当她将超过一英寸的针状毒牙刺入你的乳房时，你的声音提高了几个八度。毒液沸腾着注入你被刺穿的肉体，滚烫的药物在你的血管中燃烧，你的身体将其扩散到四肢百骸。你的[skin]泛红，虽然你觉得不可能，但你的[vagina]喷涌出真正的淫液洪流，将珍珠般的丝线染成了潮湿的灰色。空气中弥漫着女孩情欲的醉人香气，你本能地在束缚中挺动，但这些限制让你的动作变成了可悲的、重复的肌肉抽搐。[pg]");
         outputText("蜘蛛女退后一步，欣赏了一会儿她的杰作，然后重复了刚才的动作，在");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你胸部的另一侧");
         }
         else if(get_player().totalBreasts() == 2)
         {
            outputText("你的另一侧乳房");
         }
         else
         {
            outputText("你众多乳房中的另一个");
         }
         outputText("。此时，你的身体因性欲而悸动，甚至她毒牙刺穿你血肉的疼痛也仅仅被感知为一阵受虐的快感。一股");
         if(get_player().wetness() >= 4)
         {
            outputText("股喷涌般");
         }
         else
         {
            outputText("一小股");
         }
         outputText("淫水从你的[vagina]里喷溅出来，你那可怜的、充满催情剂的小穴因为蜘蛛注入你静脉的液体欲望而经历了一次微小的性高潮。你甚至不再试图压抑自己发出的饥渴呜咽，而是像个放荡的婊子一样呻吟着……只要能诱惑蜘蛛快点操你，你什么都愿意做。[pg]");
         outputText("怪物女人把手放在你的阴阜上，感受着你温暖的渴望从她的指缝间溢出，液体的欲望让她光滑的黑色甲壳在昏暗的沼泽阳光下闪烁着幽暗的光芒。她喉咙里发出一声呼噜声，宣布道：[say:我想我的玩具已经准备好了。][pg]");
         outputText("甲壳质的膝盖陷入你头部周围的蛛网和壤土中，蜘蛛腹部巨大的黑色球体挡住了光线，迫使你的眼睛适应蜘蛛女双腿之间的阴影。现在你终于能看清了，你仔细端详着蜘蛛女的小穴。与她其余苍白的皮肤不同，蜘蛛女的性器官黑如午夜，闪烁着女性的湿润，周围的肉色逐渐变暗，慢慢融入她近乎瓷白色的肤色中。[pg]");
         outputText("她用手指在你的阴唇间摩擦，沾取你积聚的淫水，问道：[say:喜欢你看到的吗？好吧，如果你想让我做更多，你最好开始舔，因为我会继续给你注射更多的毒液，直到你让我高潮！][pg]");
         outputText("为了强调她的话，蜘蛛女一口咬在你的[leg]上，将一股新鲜的、令人无法抗拒的催情毒液深深注入你的体内。又一股淫液涌出，浸透了这位女王的指尖，你喘息着乞求释放，知道此时此刻你会答应她的任何要求。作为回应，她那覆盖着外骨骼的腿分得更开，将那午夜般漆黑的阴唇降到你轻易就能舔到的距离。第一滴水珠滴落，啪嗒一声落在你的嘴唇上，你不假思索地将其舔去，第一次尝到了你蜘蛛女主人的味道。[pg]");
         outputText("这蜘蛛女的淫液尝起来……很甜——甜得不自然，浓烈得几乎让人发腻。你凑上前去舔她那黏糊糊的黑色小穴，就在你接触到她那渗着汁液的下体时，她的腿一软，将全身的重量都压在了你身上，用她那滴着蜜汁的阴户将你闷住。压力的变化让你不舒服地闷哼了一声，但你那被催情剂迷得神魂颠倒的大脑还记得，舔她的阴部就能让你得到释放。你用尽全身力气向前挺出舌头，深深埋入");
         if(get_player().tongue.type == 1)
         {
            outputText("那蛇一般的长舌一路探入她的子宫，滑过她的子宫颈。");
         }
         else if(get_player().tongue.type == 2)
         {
            outputText("那巨大如恶魔般的长舌探入她的阴道，在阴道壁上卷曲，均匀地抚摸着每一处。");
         }
         else if(get_player().hasLongTongue())
         {
            outputText("那非人的长舌探入她的阴道，在阴道壁上卷曲，均匀地抚摸着每一处。");
         }
         else
         {
            outputText("尽可能深地探入她的通道，在寻求高潮的狂热中舔舐着。");
         }
         outputText("她阴蒂上坚硬的肉核撞击着你的下唇，你开始尽可能快地张合下巴，去摩擦那个微小的快感器官。[pg]");
         outputText("你的蛛形纲女主人用她的臀部摩擦着你的脸，当她像骑着她个人的快感竞技场一样骑着你的嘴时，她的臀瓣和沉重的腹部完全包裹了她其余的面容。她的雌性精液慢慢填满了你的脸颊，你对那几乎甜得发腻的味道发出愉悦的哼声，并在你口交的间隙将其吞下。她的下体成了你的焦点，你生命的绝对意义，而她的臀部和大腿取代了世界的其余部分。你感觉到她开始用她手指上坚硬、无情的甲壳为你手淫，每当你稍微放慢速度时，她就会放慢动作，你用你的嘴操她，不断地试图做得更多，完全成为你女主人心血来潮的奴隶。[pg]");
         outputText("毒牙再次深深刺入你的[legs]，距离上次注射的地方不远，将性需求激起到你甚至无法理解的程度。你扭动着、尖叫着，在极乐和痛苦的渴望中胡言乱语，但被束缚着的你，这都是徒劳的。蜘蛛女每次抽出手指时都会用一只手拍打你的外阴，即使你的小穴努力将沼泽变成充满女孩精液的湖泊，她也在挑逗你。闪亮的腿夹住你的头，把你更用力地推入她高潮的阴户，真正的蜘蛛精液洪水般涌入你的嘴里，而她的通道夹紧并挤压着你的舌头。那榨精般的收缩威胁着要完全压碎你的舌头！[pg]");
         outputText("在整个过程中，你[vagina]里的指尖闲置着，甚至懒得提供最轻微的刺激。她的漫不经心让你只能徒劳地在束缚中推挤，而你的脸却被那甜美、甜美的蜘蛛小穴操着。你沮丧地哭喊，痛苦的尖叫只会让施虐狂的阴蒂震动得更厉害，进一步延长了她的高潮。肿胀的黑色阴唇在你的[face]上发出嘈杂的吧唧声，片刻之后，它们终于伴随着一声凌乱的“嘶啦”声离开了。[pg]");
         outputText("你哭泣着乞求释放，但那只颤抖着的蜘蛛人唯一的回答是在你的手臂上慵懒地咬了一口，将新一批催情毒素注入你的体内。在完成最新一次让你小穴泛滥的注射后，她问道：[say:既然我只要一直咬你，就能让你坐在这里给我的网涂上几个小时的淫水，那我为什么还要费那么大劲呢？][pg]");
         outputText("她的每一个爱痕都比上一个不那么疼，完全用令人痛苦的快感取代了疼痛感。你的[vagina]变得如此敏感，以至于随着顺着[legs]荡漾开来的每一次收缩和抽搐，你都能感觉到每一片肿胀湿润的阴唇在相互摩擦。心满意足的蛛女拂过你汗湿的额头，低语道：[say:嘘，再咬一口应该就能让你释放了。][pg]");
         outputText("她的尖牙刺入你的脖子，将强效的催情剂直接注入你的动脉，在你残存的理智中引爆了快感的烟花。你的小穴抽动着，并且");
         if(get_player().wetness() >= 5)
         {
            outputText("像喷泉一样爆发，一遍又一遍地喷洒");
         }
         else
         {
            outputText("一遍又一遍地在地上积起一滩滩淫水");
         }
         outputText("，每一次高潮都引发了前一次的收缩，直到你翻起白眼，嘴巴大张，在盲目而绝对的快感中呻吟。你射了又射，射了又射，仿佛过了好几个小时。虽然你又尝到了几次蜘蛛小穴的味道，但你的大脑已经沉浸在极乐之中，只能在记忆中记录下微小而破碎的快感爆发。[pg]");
         outputText("在你无梦的睡眠中，你的身体感觉到束缚被解除了，但你继续沉睡，完全没有察觉。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(2),DynStat.Sens(1));
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function defeatASpiderBitch() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_spidergirl());
         outputText("蜘蛛女跪倒在地，摇摇晃晃地站不稳");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("，屈服于欲望的她将两根覆盖着甲壳的指尖深深插入她泥泞的小穴中。她竟然还有胆量要求道，[say:操我，现在就操我！]");
         }
         else
         {
            outputText("，伤得太重，无法反击或逃跑。");
         }
         menu();
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]你要对她做什么？");
         }
         addButton(0,"操屁股",evilSpiderGirlVictoryAnal).sexButton(1);
         addButton(1,"操小穴",fSpiderMorphRapeDude).disableIf(get_player().cockThatFits(get_monster().vaginalCapacity()) < 0,"你的肉棒太大了。").sexButton(1);
         addButton(2,"磨豆腐",fSpiderMorphRape).sexButton(2);
         if(get_goreEnabled())
         {
            addNextButton("截肢",spiderAmputation).hint("[if (silly) {好吧，那就开始动手（腿）吧。|砍下蜘蛛的腿，也许还能用它来打她。}]");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         setSexLeaveButton();
      }
      
      public function declinedCrazyFemaleSpiderMorphSexFunTimes() : void
      {
         clearOutput();
         outputText("你告诉这个发情的蜘蛛人，你现在对和她做爱没兴趣。虽然她看起来很沮丧，但还是理解地点了点头，在局面变得更尴尬之前，顺着一根蛛丝荡进了树林里。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

