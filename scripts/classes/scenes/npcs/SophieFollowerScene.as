package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class SophieFollowerScene extends NPCAwareContent
   {
      
      public var eggColors:Array;
      
      public function SophieFollowerScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         eggColors = ["黑色","蓝色","棕色","粉色","紫色","白色"];
         super();
      }
      
      public function yesDebimboSophie() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().DEBIMBO);
         outputText("你一把抓住这只没头脑的鹰身女妖，把她拉到你身边，让她那傲人的胸部紧贴着你，同时准备好你的智力饮料。[say: 喔！嘿，宝贝，你拿的是什么？]索菲睁大眼睛盯着药水问道。你告诉她别担心，拔掉软木塞，把瓶口凑到索菲的嘴边，她那丰满的大嘴唇急切地张开着。[say: 嘿，是酒吗？我简直<b>爱死</b>酒了！然后也许，我们可以狠狠地干上一场！]她大声宣布，在你的怀里兴奋地跳着——差点让你把饮料洒出来。你捏住她的下巴，稳住这只鹰身女妖的脑袋，把液体倒进她的嘴里，确保每一滴都流进她的嘴里，然后你挠了挠她的喉咙，迫使她咕咚一声把药水全吞了下去。");
         outputText("[pg][say: 呃！那绝对不是酒！]索菲抱怨着，从你的怀里挣脱出来，撅着嘴，长满羽毛的手臂交叉在她沉甸甸的胸前。你观察了她好一会儿，等待着……等待着……[say: 嘿，我好像，感觉不太好……]索菲终于开口了，她捂着头，手指穿过她浓密的金发。[say: 呃，我不……为什么……哦，该死，我在哪里？我的胸怎么了！？]索菲踉跄着向前走去，用力眨着眼睛。片刻后，当她抬头看你时，你可以看到她蓝色的眼睛里再次闪烁着智慧的光芒。");
         outputText("[pg][say: 什……你对我做了什么！？！？！]索菲尖叫着，她那张仍然带着无脑花瓶特征的脸上充满了纯粹的野性狂怒，在闪闪发光的眼睛和长长的金发下，丰满的嘴唇扭曲成咆哮的形状。她闪亮的黄色羽毛竖了起来，她气冲冲地走到你面前，把脸凑到你跟前。[say: 你这个" + get_player().mf("混蛋","婊子") + "！你对我做了什么？]");
         outputText("[pg]你被这突如其来的愤怒吓得退缩了一下，脑子里飞速运转着，寻找合适的应对方法……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,745,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,746,1);
         }
         menu();
         addButton(0,"打她",beatSophieAroundYouMonster);
         if(get_player().get_inte() > 30)
         {
            addButton(1,"道歉",apologizeToDebimboSophie);
            addButton(2,"为何这么做",whyIDidItToDebimboSophie);
         }
         addButton(3,"放她走",letDebimboSophieGo);
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            addButton(4,"再次变无脑花瓶",bimboSophieAgain);
         }
      }
      
      public function whyIDidItToDebimboSophie() : void
      {
         clearOutput();
         outputText("你决定试着温和地解释一下，告诉索菲你是怎么偶然发现傻妞液的……你为什么决定把它用在她身上，以及原因。她默默地听着，你说话时她避开了你的目光。不过，你注意到，当你说话时，她的手慢慢地滑落，抚摸着她被赋予的新身体，仿佛第一次发现她增强的“资产”。这位白金发色的鹰身女妖颤抖着，她的手滑过她巨大的F罩杯，指尖轻轻抚摸着她突出的乳头，乳头在她的触摸下立刻变硬，准备好被把玩或吸吮。");
         outputText("[pg]当你解释完后，有很长一段时间的沉默。索菲继续避开你的目光，但你可以看出她稍微平静了一些，也许是被你的诚实所安抚。不过，最后她还是开口了：鹰身女妖女人用几乎只有耳语的声音平静地说，[say: 我回不去了。]");
         outputText("[pg]什么？");
         outputText("[pg][say: 看看我，]她声音颤抖地说，[say: 我这样根本飞不起来……就算能飞，其他女孩也会……哦，她们会说些什么啊。我回不了家了。]");
         outputText("[pg]她停顿了一下。然后，令你惊讶的是，她嘴角漏出了一丝苦笑。[say: 见鬼，反正我一直想离开那座该死的山。我厌倦了女孩们取笑我……叫我大胸荡妇。]索菲抬起头，与你四目相对，[say: 好吧，既然你看起来那么想让我留下来，我想你不会介意我留下来吧，[name]？反正我也没别的地方可去，也许至少你能欣赏我的新体格……我得承认，这些还挺性感的，]她说着，托起她沉甸甸的乳房。");
         outputText("[pg][say: 也许我就在那边搭个窝，]她补充道，漫不经心地指着营地边缘一块被一圈石头遮蔽的空地。");
         outputText("[pg]你点点头，告诉索菲把这里当自己家就好。");
         outputText("[pg](<b>索菲已被移至“追随者”标签页！</b>)");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function unbimboSophie() : void
      {
         clearOutput();
         outputText("你从[inv]里拿出这种强效混合物，考虑着要不要把它给在你面前扑腾的无脑花瓶鹰身女妖。她可能会对整件事感到非常生气，但如果你想弥补你造成的伤害，这可能是你最好的选择。你要解除索菲的无脑花瓶状态吗？");
         menu();
         addButton(0,"是",yesDebimboSophie);
         addButton(1,"否",noDontDebimbo);
      }
      
      public function stopHarvest() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你告诉索菲不要再给你蛋了；你宁愿她把它们用来给农场赚钱。");
         outputText("[pg][say: 噢，]她用恳求的眼神回答道。[say: 你就不能直接把一些真正的蛋射进我体内吗？]");
         outputText("[pg]你做出了否定的回答，惹得这位丰满的母鸡撅起了嘴。看起来无论如何她都会服从你。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1102,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function sophieVagFollowerFollowup() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("过了一会儿，你被面带微笑的索菲唤醒，你们结合的证明正从她的大腿间滴落。她打趣道，");
         if(get_sophieBimbo().sophieIsInSeason())
         {
            outputText("[say: 如果这都没怀上，我不知道还有什么能怀上！]");
         }
         else if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("[say: 对于一根小巧的女孩鸡巴来说，还不赖嘛！]");
         }
         else
         {
            outputText("[say: 让人期待的东西总是更美好，不是吗？]");
         }
         outputText("[pg]你本想回敬一句俏皮话，但你实在是太他妈累了。你叹了口气，试着穿上衣服，费了好大劲才用[feet]站稳，直到索菲伸出援手。她在你的脸颊上亲了一下，用口型说了句[say: 谢谢]，然后开心地扑腾着翅膀，蹦蹦跳跳地离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sophieTalkMotherhood() : void
      {
         clearOutput();
         outputText("你和索菲的互动很大程度上都集中在让她怀孕上，所以在某种程度上，你不得不问——到底为什么？这仅仅是某种鹰身女妖的本能，还是她有其他原因如此渴望成为一个母亲。");
         outputText("[pg]这位充满母性的鹰身女妖对这个问题似乎感到有些惊讶。她站在那里陷入沉思，一动不动，仔细考虑着她的回答。你几乎吃了一惊——她总是反应迅速，你觉得你以前从未见过她如此认真地对待一件事。");
         outputText("[pg][say:我想……我想我也不知道确切的原因。当然，鹰身女妖喜欢怀孕，但是……对我来说，这不仅仅是本能。这是你作为一个人能做的最重要的事情。这是你的传承，是你的骄傲和快乐，是让世界变得更美好的最佳方式。我想不出有什么时候比我肚子里装满蛋时更让我感到满足了。那是世界上最美妙的感觉，]她摸着肚子说道。");
         outputText("[pg]她微微撅起嘴唇，似乎在克制自己，但随后又脱口而出：[say:而且宝宝们太可爱了！我不知道为什么会有人不想要。见鬼，如果他们不想要，就把所有的精液都留给我吧。我想要多少宝宝就要多少！]她咯咯地笑了起来，眼睛眯成了一条缝。");
         doNext(sophieTalkMenu);
      }
      
      public function sophieTalkMenu() : void
      {
         clearOutput();
         outputText("你要问她什么？");
         menu();
         addNextButton("鹰身女妖",sophieTalkHarpies).hint("问问索菲对她那些姐妹的看法。");
         addNextButton("爱情",sophieTalkLove).hint("你和她的关系到底意味着什么？");
         addNextButton("母性",sophieTalkMotherhood).hint("成为母亲对她来说到底意味着什么？");
         addNextButton("玛瑞斯",sophieTalkMareth).hint("问问她对这个世界的看法。");
         setExitButton("返回",followerSophieMainScreen);
      }
      
      public function sophieTalkMareth() : void
      {
         clearOutput();
         outputText("索菲似乎对世界的变化总是相当淡定。她真的不介意生活在莉希丝的统治下，还是只是在随遇而安？");
         outputText("[pg]鹰身女妖耸了耸肩，说道：[say:我其实不怎么想这事。恶魔们从没怎么找过我们麻烦——我们可能比他们想象的还要麻烦，毕竟我们本来就对操逼挺感兴趣的——所以生活并没有改变太多。我们大多独来独往，不过缺乏合适的繁育母畜确实让我感到有些寂寞。]");
         outputText("[pg]她的目光转向你。[say:直到我遇见了你，[name]。你就是我需要的全部繁育者，]她发出满足的呼噜声。[say:一想到" + (get_pregnancy().get_isPregnant() ? "你放进我肚子里的宝宝" : "你即将放进我肚子里的宝宝") + "，我就浑身发热。]");
         outputText("[pg]她的大腿摩擦在一起，你可以看出她现在想做的不仅仅是聊天。");
         doNext(sophieTalkMenu);
      }
      
      public function sophieTalkLove() : void
      {
         clearOutput();
         outputText("虽然这可能是一个敏感的话题，但你想知道你们俩到底处于什么关系。她和你住在一起，而且她[i:绝对]对你表现出了爱意，但你不希望有任何误会。");
         outputText("[pg]这只鹰身女妖看起来有些不确定。[say:那你想让我说什么？你让我和你住在一起。你让我很开心。你为我受精了很多蛋，而且" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0 ? "我们甚至在这里" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) != 0 ? "有了孩子们" : "有了一个孩子") : "我希望你不要就此打住") + "。我绝对不想改变我们之间的任何事情。]");
         outputText("[pg]这很令人鼓舞，但你还是希望能得到更具体的答案。");
         outputText("[pg][say:听着，对我来说，你绝对是个足够出色的[man]。这可不是随便说说的，因为索菲妈妈需要很多很多的爱，]她发出咕噜声。[say:说了这么多，我都觉得有点渴了……]她侧身靠近你，一只手顺着自己的身体侧面滑下。");
         doNext(sophieTalkMenu);
      }
      
      public function sophieTalkHarpies() : void
      {
         clearOutput();
         outputText("自从索菲搬来和你同住后，你很难想象她还和山里的那些鹰身女妖有什么交集。她有没有想念过她的姐妹们？");
         outputText("[pg]她的回答是一声嗤笑。[say:那些娇生惯养的家伙？总是闹出丑闻，总是吵个不停。你只要稍微丰满一点]——她挺了挺胸以示强调——[say:她们就会抓住一切机会贬低你。我和你在一起好多了，[name]。]");
         outputText("[pg]好吧，你觉得那里的环境可能确实不太好，但她以前的生活难道就没有什么值得怀念的吗？");
         outputText("[pg][say:嗯……上面的空气确实好一点。但是！]她向前倾身，双手叉腰，眼睑微垂，将她的资本展露无遗。靠得这么近，她可以直接在你耳边低语：[say:我还是更喜欢被汗水弄得朦胧的感觉。]");
         doNext(sophieTalkMenu);
      }
      
      public function sophieSprite() : void
      {
         get_game().sophieBimbo.sophieSprite();
      }
      
      public function sophieSpecial() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            get_player().smallestCockIndex();
         }
         outputText("[say: 啊，所以你确实想要一点索菲妈妈的特殊待遇……真是个勇敢的[boy]，不是吗？] 她靠得更近了，开始脱掉你的[armor]。[say: 非常勇敢……我们可能得把你放回原位。索菲妈妈会榨干这根" + get_player().cockDescript(_loc1_) + "，直到未来唯一能让你射精的原因，就是我用口红给你下了药。]");
         outputText("[pg]慢慢地，她跪了下来，从你的[armor]里掏出你的" + get_player().cockDescript(_loc1_) + "，急切地舔着嘴唇。[say: 首先，我们要给它涂上很多我的特制口红，这样无论如何你都会保持坚挺。还有，嗯，这样当索菲妈妈想让你喷射的时候，你就无法反抗了。]");
         outputText("[pg]确实，她那丰满的金色嘴唇包裹着你的" + get_player().cockDescript(_loc1_) + "，用她的唾液和口红涂抹着它，同时她的头在你的肉棒上上下套弄，导致它变得异常坚硬，你本能地挺动你的[hips]，想要更多这张美味的嘴。她抱怨着，对你的移动感到不满，并试图通过抓住你的[ass]来把你固定在原地；然而，这被证明是相当无效的，因为你开始在她的口交攻势下颤抖，她的舌头在你的" + get_player().cockDescript(_loc1_) + "上上下舔舐，用淫荡的唾液和下药的口红的混合物完全覆盖了它……事实上，你感到头晕目眩");
         if(get_player().balls > 0)
         {
            outputText("，而你的[balls]正等着把一包充满男子气概的粘稠包裹卸到她的喉咙里");
         }
         outputText("。索菲似乎感觉到了，轻笑了一声，把嘴从你的" + get_player().cockDescript(_loc1_) + "上移开，导致你发出呜咽声，再次寻找她的嘴。[saystart]好了，好了，我的小精液泵。索菲妈妈才不会那么刻薄，把你和你那");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("喷水的阴蒂");
         }
         else if(get_player().cockArea(_loc1_) <= 30)
         {
            outputText("饥渴的男孩肉棒");
         }
         else
         {
            outputText("巨大的肉棒");
         }
         outputText("丢在一边，不让你好好射一大股。只是不能射在我嘴里……你应该乖乖听话，不要自己乱动。[sayend]");
         outputText("[pg]你感觉到索菲同时推你的[chest]和拉你的[legs]，导致你慢慢地仰面躺下，这时你意识到你的[armor]显然已经消失了。这位自信的鹰身女妖主母得意地笑着，咯咯地笑着，跨过你的身体，向你展示她那丰满、摇晃的屁股，她湿润的小穴向你的" + get_player().cockDescript(_loc1_) + "降下，渴望吞噬它。伴随着一声湿润的吧唧声，你被埋在她的体内，在她那巨大、摇晃的屁股下颤抖。[say: 哎呀，哎呀……你真是一点也忍不住，是吗？我才刚把你放进我身体里，你就已经这么渴望把我的墙壁涂白，以至于你简直要直接喷射了？]");
         outputText("[pg]你无法分辨这些话背后是否有命令，但伴随着一声响亮的呻吟，你只是将你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]和");
         }
         outputText("" + get_player().cockDescript(_loc1_) + "里的东西排泄到索菲那榨取肉棒的通道里，当你的第一股充满男子气概的精液击中她的内壁时，她发出了满足的呻吟。");
         if(get_player().cumQ() < 250)
         {
            outputText("她榨干了你所有的价值。");
         }
         else if(get_player().cumQ() < 750)
         {
            outputText("她对你射进她体内的量发出呜咽。");
         }
         else if(get_player().cumQ() <= 1500)
         {
            outputText("你的精液很快从她的小穴里涌出，在你的[hips]上汇成一小滩。");
         }
         else
         {
            outputText("她的屁股突然更向你推来，精液从她湿润的阴户里涌出，因为你第一发的精液量太大，她开始膨胀起来。");
         }
         outputText("[pg][saystart]真是个好[boy]，有着漂亮又听话的");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("小阴蒂");
         }
         else if(get_player().cockArea(_loc1_) <= 30)
         {
            outputText("漂亮肉棒");
         }
         else
         {
            outputText("巨大的撑穴巨根");
         }
         outputText("……全都是我的……但你硬不起来了，是吗？你只是想把更多充满活力的精液射进索菲妈妈的身体里。[sayend]索菲在你身上扭动着臀部，她那沾满精液和爱液的湿滑屁股撞击着你的骨盆。她无情地使用着你那过度敏感的" + get_player().cockDescript(_loc1_) + "，在你身上弹跳时，从龟头一直摩擦到根部。那涂了药的口红和她不断用魔力提出的要求，让你连一刻都无法软下来。她骑着你直到高潮，双手一直在大腿间揉搓着自己的阴蒂。最后，她的阴道紧紧地夹住了你，让你挺起臀部，因为极度的敏感而呻吟，无法这么快就达到下一次高潮。");
         outputText("[pg]索菲咧嘴一笑，从你的" + get_player().cockDescript(_loc1_) + "上站起身来，");
         if(get_player().cumQ() < 250)
         {
            outputText("她的阴道里滴落着你的精液，流到地上");
         }
         else
         {
            outputText("你自己的精液从她体内滴落，把你的[hips]和[butt]淹没在一滩黏糊糊的精液里");
         }
         outputText("，然后转向你，弯下腰，在你[face]上方晃动着她的乳房，问道：[say: 刚才好玩吗，[name]？你觉得我们现在该结束了，对吧？还是你想给索菲妈妈更多浓稠的精液，让她肯定能怀上双胞胎？]在药物和性爱的双重作用下，你几乎失去了自我价值感，你几乎是恳求她再次把你放进她体内。你那泛着金光的肉棒骄傲地挺立在空中，等待着她的臀部和阴道降临。[say: 好回答，非常好的回答。]她再次降临在你身上，用她的阴道摩擦着你" + get_player().cockDescript(_loc1_) + "的龟头，挑逗着她自己和你，然后把你拉进体内，一直没入到你的[sheath]里！");
         outputText("[pg]在离开索菲湿润的阴道后，它简直就像天堂一样。她的口红让你的肉棒变得如此敏感，渴望得发痒，她的乳房在你头顶晃动，促使你在她身上弹跳时抓住它们。[saystart]哦，我的小可爱想玩妈妈的乳房！可惜妈妈太想操这个小可爱的");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("娇小女根");
         }
         else if(get_player().cockArea(_loc1_) <= 30)
         {
            outputText("漂亮、甜美的喷精器");
         }
         else
         {
            outputText("巨大、华丽的巨根");
         }
         outputText("直到它快要坏掉！来吧，你这个小甜心，你知道你想把它射进我体内，就像一个坏掉的水龙头！[sayend]");
         outputText("[pg]你闷哼一声，设法忍住了她的命令，索菲对你的抵抗发出愉悦的咕哝声。[say: 看看我的[boy]，现在长大了，竟然能抵抗索菲妈妈那肥沃、渴望精液的阴道的快感！你不该这么做的……不过，如果你这么做，也许我们可以一起高潮……好吧，宝贝，一旦你感觉到索菲妈妈的阴道格外用力地挤压你，你就会射精，而且你不会试图憋住，好吗？]你咕哝着点点头，但当你想象索菲怀上你的孩子时的样子，你已经发现很难忍住了。一旦你第二次射进她体内，她很可能就会怀上。");
         outputText("[pg]你听到索菲那发出水声的阴道吞没了你整个" + get_player().cockDescript(_loc1_) + "并反复释放它，她的臀部和柔软丰满的屁股在你的[legs]上弹跳，她继续在你的" + get_player().cockDescript(_loc1_) + "上越来越用力地操着自己。她内壁的褶皱舔舐和按摩你那充满药物的肉棒的方式简直绝妙，你需要用尽每一分意志力才能阻止自己像下面坏掉一样在她体内反复射精。最后，索菲将她的臀部拍打在你的坚硬上，大声呻吟着，她的阴道猛烈地挤压和拉扯着你的肉棒，暂时停止了精液从你的" + get_player().cockDescript(_loc1_) + "中流出，但这只是一瞬间。它在你的[balls]里翻滚沸腾，穿过你的" + get_player().cockDescript(_loc1_) + "，射入索菲湿润、贪婪的阴道和渴望婴儿的子宫里。索菲的高潮和你的高潮融为一体，并相互延长，你释放出");
         if(get_player().cumQ() < 250)
         {
            outputText("几股精液");
         }
         else if(get_player().cumQ() < 750)
         {
            outputText("一大股混乱的精液");
         }
         else if(get_player().cumQ() < 2000)
         {
            outputText("一波又一波的精液");
         }
         else
         {
            outputText("大量的精液");
         }
         outputText("的精液射进她体内，让她");
         if(get_player().cumQ() < 500)
         {
            outputText("满足地呻吟");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("因为小穴装不下这么多而发出闷哼");
         }
         else if(get_player().cumQ() < 2000)
         {
            outputText("在你身上伸展，除了晃动的乳房和柔软的屁股，又多了一个装满精液的肚子");
         }
         else
         {
            outputText("精液猛烈地从你的肉棒周围喷涌而出，仅凭你的精液就把她撑得像怀孕了一样");
         }
         outputText("。");
         outputText("[pg][say: 啊……啊……好[boy]……真棒……我现在绝对是个妈妈了。不过……不过……你得多射点出来，以防万一……这也是对你试图违抗索菲妈妈命令的惩罚！]");
         outputText("[pg]你尖叫起来，不知道是因为喜悦、危险，还是因为索菲的小穴再次将你吞没到底时，你那根肉棒传来的极度敏感。");
         outputText("[pg]感觉就像溺水了一样……但这液体太黏稠了，她的阴道肌肉紧紧绞着你，同时她粗暴地把你的脸按在她的胸部上，让你吃了一嘴的奶子，而她的小穴则继续着刚才的动作。你的" + get_player().cockDescript(_loc1_) + "又酸又敏感，你绝对已经把所有的存货都射光了，但这个鹰身女妖的口红和她渴望受孕的强烈欲望似乎让你停不下来。你几乎要在她的乳房里窒息晕倒，但每隔几下响亮的拍打声，她就会把你拉开一会儿，让你喘口气，而她的繁殖通道则吸吮着你的勃起，贪婪地喝着你的先列腺液和尿道里残留的精液，试图慢慢地在你体内酝酿另一次高潮。");
         outputText("[pg]你感觉到索菲的嘴唇贴在你的嘴唇上，然后她在你耳边轻声细语，诱惑你继续下去，再次和她一起高潮。[saystart]忍一会儿……让我好好享受一下，亲爱的……然后我会让你再射一次。是的，你应该和我同时高潮。别担心，你操得我太爽了，用不了多久的……而且你那敏感、备受折磨的");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("小阴蒂");
         }
         else if(get_player().cockArea(_loc1_) <= 30)
         {
            outputText("漂亮肉棒");
         }
         else
         {
            outputText("巨大的撑穴棒");
         }
         outputText("大概很快就准备好再射一次了吧，不是吗？你就是跟不上索菲妈妈极品小穴的节奏，你只能一次又一次地不断射精。[sayend]");
         outputText("[pg]你拼命地点头，意识到自己确实无法拔出，也无法在再次高潮前停下来。唯一阻止你的是她要求你忍在里面，直到她也能高潮，这不知怎么地阻止了你用[balls]里剩下的任何东西淹没她的体内；不过，你觉得你也没剩多少精液可给了……");
         outputText("[pg]索菲现在强迫你吸吮她坚挺的乳头，同时将你完全吞没，每次她丰满的屁股拍打你或停在你身上扭动时，都会温暖你的[legs]。过了一会儿，索菲伸手到双腿之间，开始抚摸自己的阴蒂，她的通道拉扯、按摩着你的肉棒，似乎快要达到她自己的高潮了。[say: 就差……一点……点……了！]");
         outputText("[pg]她嘴上这么说，但她臀部的每一次起伏，对你那被彻底榨干、过度敏感的" + get_player().cockDescript(_loc1_) + "来说都是一种折磨。她的小穴试图榨干你体内的每一滴液体，而且很快，它似乎就能做到这一点了……");
         outputText("[pg]在经历了感觉像是永恒的折磨后，她那充满精液的小穴发出摩擦和吸吮的声音，紧紧抓住并拉扯着你涂满口红的阴茎，索菲终于达到了她的第二次高潮，大声呻吟着，而你的堤坝也随之决堤。");
         if(get_player().cumQ() < 250)
         {
            outputText("你只在她体内射出了可怜的几股");
         }
         else if(get_player().cumQ() < 750)
         {
            outputText("即使你巨大的精液产量也跟不上那个速度");
         }
         else
         {
            outputText("尽管你的精液工厂非同寻常，你也只能射出几股大水柱，然后就慢成了滴落");
         }
         outputText("。你在她身下挣扎、呻吟、颤抖，呼唤着她的名字，而她抚摸着你的[hair]并轻声哄着你，再次将她的乳头压在你的嘴上。[say: 嘘……你做得很好，小精液泵……全都给索菲妈妈……马上就结束了……]");
         outputText("[pg]确实，她的小穴在你喷精的阴茎周围颤抖和跳动的强度太大了，你眼前一黑，醒来时她的乳房在你的嘴里，你的手指在她的阴道里，她到处滴着你的精液。她仍然抚摸着你的头，占有欲极强地依偎着你。");
         outputText("[pg]你觉得你可能需要休息几个小时。");
         get_player().orgasm("Dick");
         if(get_sophieBimbo().sophieIsInSeason())
         {
            get_sophieBimbo().sophiePregChance();
         }
         get_player().changeFatigue(15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sophieSmallDongTeases() : void
      {
         var _loc1_:int = get_player().smallestCockIndex();
         outputText("[pg]<b><u>那天早上你醒来时……</u></b>");
         outputText("[pg]令人酥麻的温暖包裹住你的[oneCock]，带来柔软顺滑的触感，将其紧紧包裹在跳动的温热之中。一个滑溜溜的突起物缠绕着你的柱身滑动，逗弄着你的[sheath]");
         if(get_player().balls > 0)
         {
            outputText("和[balls]");
         }
         outputText("然后在底部慷慨地涂抹着它的湿滑。仅仅几秒钟，你就变得如此僵硬——如此坚挺，" + get_player().cockDescript(_loc1_) + "肿胀着试图填满这个湿滑的牢笼，但无论你变得多硬，那个紧缩的洞穴似乎仍然比它必须扭曲自己去适应的小阴茎大得多，也更能容纳。");
         outputText("[pg]突然，你那充满欲望的勃起从温暖的怀抱中被抽离，只留下冰冷与渴望。你在床上打了个寒颤，还没有完全清醒，直到有人调皮地弹了一下你那跳动着的" + get_player().cockDescript(_loc1_) + "，力道刚好能让你感觉到却又不觉得痛。你猛地想要坐起身，但立刻被一只长着利爪的脚爪按住肩膀推了回去。你瞥见了一片羽毛和巨大的乳房——这肯定是鹰身女妖主母索菲，大清早来找你乐子了。");
         if(get_player().get_str() >= 70)
         {
            outputText("如果你想的话，你可以强行把她推开，但你把她带上床可不是为了什么都不做。");
         }
         outputText("她毛茸茸的臀部重重地坐在你的[legs]上，就在你的腰部下方。伴随着一声熟悉的咕咕声，她把另一只脚放在你的胸前");
         if(get_player().breastRows[0].breastRating >= 1)
         {
            outputText("并粗暴地揉捏你的[breastcup]乳房。");
         }
         else
         {
            outputText("并让爪子刺入你的[skinfurscales]，刚好让你感到一点疼痛。");
         }
         outputText("[pg]索菲舔了舔水亮的嘴唇，低头看着那根在她两腿之间抽动、被唾液浸湿的小肉棒，离她的小穴只有几英寸。[say:噢噢，索菲妈妈最爱的girl" + get_player().mf("-boy","y-girl") + "想让别人玩弄她的小婊子棒吗？]她碰了碰它，就在[cockHead smallest]下方，温暖的指尖缓慢而撩人地画着圈，直到你开始因她的抚弄而颤动。[say:你知道我怎么想的吗？]她低声呢喃着，弯下腰与你面对面——考虑到她的脚还牢牢锁在你的肩上，这柔韧性简直惊人。[say:我觉得你喜欢我玩弄这根小小的女孩鸡巴。我觉得你脑子里某个堕落、病态又恶心的部分，会在我拿这根婊子鸡巴有多女性化来挑逗你时，让你射得更狠。]");
         outputText("[pg]你拼命摇头，否认她的指控，尽管你的勃起似乎比以前更加肿胀了。此时它已经硬得几乎发痛。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,749) > 0)
         {
            outputText("在你的内心深处，你知道如果她的话不是真的，你就不会一直和她上床，让她对你做这种事。");
         }
         else
         {
            outputText("在你的内心深处，你几乎不得不怀疑这是不是真的，或者她的口红是不是刚刚进入了你的系统……");
         }
         outputText("[pg]索菲现在套弄着你的肉棒，在你的嘴唇上快速印下一吻，然后向后靠去，戏弄道：[say: 拜托！如果你不喜欢这样，你就不会滴得我满指尖都是，而且每隔几秒钟就发抖。] 她把手拿开，目光锁定在你那根不听话的小肉棒上。它像个小节拍器一样来回弹跳，直到索菲交叉双腿，把脚放在你的肩膀上。她的大腿像固定台钳一样夹紧，这产生了一个不幸的后果：你那滑溜溜的肉棒抽动得太厉害，以至于在光滑的皮肤上滑动，获得了它渴望的摩擦力，并促使它弹跳得更厉害。尽管你努力控制自己，你的[hips]还是对她做出了微弱的、半推半就的动作。");
         outputText("[pg]索菲检查着她的指甲，而你则在她身上摩擦，直到你的一个动作足以让她浑身颤抖。");
         outputText("[pg][say: 哦？我以为你不喜欢我羞辱你那可怜的小肉棒呢？] 鸟人夸张地假装惊讶道。[say: 你知道，我一直偏爱这样的鸡巴——小巧、敏感。当我的小穴压在它们上面时，它们似乎总是会“砰”地一下射出来。最好的那些甚至在那之前就射了，就在它们以为能射进我里面的时候，喷得自己满身都是，哈！] 此时，她的肉缝已经开始滴落在你的[legs]上。很明显，她的每一句话都让她和你一样兴奋，尽管她还没有开始抚摸自己。");
         outputText("[pg]你发现自己想知道，你是否会那么容易地为她高潮，把你的精液浪费在自己的肚子上，而不是内射进你那长满羽毛的女主人的小穴里。索菲看出了你的犹豫，把一根手指伸进她的胯部，拿出来时手指上沾满了她那带有麝香味的体液。她把它抹在你的额头上，顺着你的鼻梁，然后抹在你的脸颊上，强迫你每次呼吸都闻到她的气味，你的脸上印满了小穴的味道。");
         outputText("[pg]她窃笑着，[say: 好了。我觉得这种味道很适合你，比这根鸡巴散发出的任何气味都合适得多。] 她把湿润的手指抹过你的[cock smallest]，让你不由自主地呻吟出声，同时又冒出一股先列腺液。鹰身女妖突然夹紧大腿，紧紧夹住你的肉棒，她笑着说：[say: 你看起来真他妈的高兴，你这个小荡妇。是这样吗？你想被一个性感的女孩压在身下，甚至不让你好好看看她的小穴，只能在她用淫液涂抹你并嘲笑你那可怜的尺寸时，勉强盯着她的奶子看？] 你的眼睛不由自主地瞥向她的乳头。它们看起来确实非常漂亮，同时你[hips]之间跳动的热度也加剧了。");
         outputText("[pg]索菲把自己往上拉了一点，小穴几乎碰到了你。[say: 现在，我要看看你是个什么样的女孩——是一个只闻到一点小穴味就会射得自己满身都是的荡妇，还是一个被我湿润的嘴唇擦过就会喷水的荡妇。是哪一个呢？你<b>一定</b>会因为其中一个而高潮的，我那脏兮兮的喷水小女孩……] 她承诺着，一边滑近一边盯着她的眼睛。");
         outputText("[pg]你周围的温度似乎翻了一倍，索菲大腿峡谷中雾蒙蒙的欲望让你的[cock smallest]上渗出了水珠。她慢慢张开双腿，直到几乎水平分开，悬挂在你身体两侧，她湿润的阴户随着时间的推移向你逼近。她动了动嘴唇，[say: 如果你想做个彻头彻尾的婊子，你可以射……] 她的手勾住滑溜溜的皮肤，把她的通道撑得大大的，离你如此之近，以至于你那娇小的男性器官几乎能尝到小穴的味道。你在痛苦的快感中悸动，想知道是不是就是这样了……");
         if(get_player().sens / 5 + Utils.rand(20) + 1 <= 20)
         {
            outputText("[pg]尽管你硬得发疼，非常非常硬，但高潮却离你而去。你心里有一小部分想知道为什么你不能高潮，成为索菲的婊子，但你很快就打消了这个念头，把注意力重新集中在她的乳房上。索菲挑逗地微笑着，把她那富有弹性的双乳挤在一起，让你看得更清楚，同时嘲弄道：[say: 哎呀，你那娇嫩的肉棒一定训练得不够好。不过，你看起来已经很接近了，我敢肯定，像你这样顺从的荡妇，一旦我碰到你，就会把精液射在我的阴唇外面……] 她的声音响亮、色情而引人注目，[say: 你感觉不到你[balls]里的压力吗？所有的精液都准备好喷洒在我光滑的小穴上了？憋着一定很难受吧，你那软弱的肉棒不可能把你体内所有淫荡、顺从的精液憋太久的，对吧？]");
            outputText("[pg]索菲把她的臀部滑得更近了，只是勉强避开了对你[cock smallest]的性感摩擦。你哀怨地呜咽着，感觉到体内涌动的精液，她催眠般的强迫扭曲了你的感知，把你直接放在了顶峰，就在屈服的边缘。她柔声说道：[say: 还没完……我会让你射的，但只有在你求我摸你那可怜的鸡巴之后。求我！说，“求求你，索菲妈妈，摸摸我淫荡的鸡巴！”<b>快说！</b>]");
            outputText("[pg]你被憋得几乎要哭出来了，不假思索地顺从了，只想得到释放——感受她那多汁、流着口水的小穴贴着你，赐予你高潮，[say: 是的！求求你，索菲妈妈！揉揉我淫荡的鸡巴！摸摸它，让它把精液浪费在你身上！什么都行，只要让我射就行！]");
            outputText("[pg]鹰身女妖主母摸着下巴，慢慢地点了点头。[say: 不错，不过也许下次我得先给你化个妆，让体验更完整。] 她又弹了一下你的肉棒，问道：[say: 准备好了吗？]");
            outputText("[pg]你咬着嘴唇，急切地点点头，仅仅是那一次触摸就让你几乎要射了。你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
            {
               outputText("金");
            }
            else
            {
               outputText("粉");
            }
            outputText("发女主人仁慈地俯视着你，不可阻挡地滑近，你发现强烈的期待本身几乎就是一种快感。然后，她狂热温暖的三角区接触到你出汗的鸡巴皮肤，她多汁的小穴贴着你的甜蜜感觉让你无法忍受。你娇小的鸡巴尽可能地扩张到它那微小的尺寸所允许的程度，当你迎上索菲会意的微笑时，你呻吟着释放了，将精液喷洒在她丰满的阴蒂和");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 150)
            {
               outputText("怀孕的");
            }
            else if(get_player().tone >= 70)
            {
               outputText("健美的");
            }
            outputText("肚子上，大部分精液像糖浆一样喷洒在她湿润的阴唇周围。");
            outputText("[pg]索菲和你一起呻吟着，她的手伸进那喷泉般黏糊糊的精液中，开始自慰，将精液涂抹在她敏感的阴蒂上。她喘息着，[say:射吧，小荡妇！为索菲妈妈射出来！嗯，对，就是那里！]她的手指越转越快，把你的精液搅成一团泡沫，而你也很乐意继续为她增加精液。几秒钟后，这位霸道的鹰身女妖尖叫起来，她的臀部在你的[cock smallest]上缓慢地摩擦着，几乎不在乎你那黏糊糊的精液滑进她的体内。");
            if(get_player().cumQ() >= 500)
            {
               outputText("你射了那么多，以至于你和索菲最后都");
               if(get_player().cumQ() < 1000)
               {
                  outputText("身上布满了巨大的湿斑");
               }
               else
               {
                  outputText("腰部以下全湿透了");
               }
               outputText("。感觉太爽了，你们俩都不介意。");
            }
            if(get_player().cumQ() >= 2000)
            {
               outputText("你的床也变成了一片反光的、黏糊糊的白色，现在简直就是一个精液湖。");
            }
         }
         else
         {
            outputText("[pg]毫无预兆地，一股快感席卷了你的腹部，最终爆发出一阵兴奋。一滴白色的液体从你的龟头滴落，随后你全身的肌肉收缩达到顶峰，一大团精液射到了你的[chest]上，下一团则高高地划过弧线，打在你的脸上。索菲在性高潮中途改变了姿势，将她那丰满、兴奋的阴唇贴在你那根小肉棒上，狂热地来回摩擦，用她的阴蒂摩擦你那痉挛的尿道，随着每一股精液的喷出，尿道都在膨胀。灼热的压力将你的肉棒压下，剩下的精液都乱七八糟地喷洒在你的肚子上");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 150)
            {
               outputText("，从你那被称为肚子的怀孕圆顶上滚落下来");
            }
            outputText("。");
            if(get_player().cumQ() >= 500)
            {
               outputText("你射精的时间似乎长达几个小时，把你的[balls]排空在自己身上，每一滴浪费的精液都证明了你被小穴迷得神魂颠倒的状态。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("没过多久，你周围就形成了一滩精液，当她骑着你进入你自己湿透的被褥时，精液与她小穴里滴落的液体混合在一起。");
            }
            outputText("当你快被榨干时，索菲说：[say:把那些恶心的男孩精液都给我喷出来，然后你就可以做我的宠物女孩了。]你的高潮加倍了，汹涌澎湃地又射出几股长长、浓稠的快感，落在你湿透的腹部。");
            outputText("[pg]只有在你的高潮结束后，鹰身女妖才终于达到高潮，在你身上颤抖着，用她的爱液浸透了你那可怜的、被挑逗的肉棒。");
         }
         outputText("[pg]结束时，年长的鹰身女妖咯咯地笑着。[say:我喜欢像你这样敏感的" + get_player().mf("伪娘","女孩") + "……你让我感觉自己好强大……]");
         outputText("[pg]索菲突然俯下身来拥抱你，依偎着你，低语道，[say:谢谢你满足我的幻想，[name]。]她性感地扭动着身子离开了，去找点早餐。");
         outputText("[pg]你用颤抖的[legs]站起来，试图清理你弄出的");
         if(get_player().cumQ() >= 1000)
         {
            outputText("巨大的");
         }
         outputText("烂摊子，想知道为什么你那么享受。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,749,FlagDict_Impl_.arrayReadInt(_loc2_,749) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1),DynStat.Sens(3));
         doNext(playerMenu);
      }
      
      public function sophieSixtyNine() : void
      {
         clearOutput();
         outputText("索菲挑起一根眉毛问道：[say:给发情的勇者来点百合的乐趣？]她哼了一声，翻了个白眼，[say:不用了，谢谢。我其实对女孩子没那么感兴趣。]看来她对此并不感冒。");
         menu();
         addButton(0,"继续",sleepWithSophieToggle);
      }
      
      public function sophieRecruitmentFinale() : void
      {
         clearOutput();
         outputText("索菲在你的脸颊上啄了一下，从你的身上离开，准备起飞。");
         outputText("[pg][say: 我太高兴了。我已经很久没有感觉这么年轻了——不知不觉间我就会搬进来的！]");
         outputText("[pg]说完，这位风韵犹存的母亲展开双翼，径直飞向高山，没过多久便带着她那为数不多的行李回来了。");
         outputText("[pg][say:我知道你可能忙着做勇者之类的事，所以我尽量不给你添乱。但一定要给索菲妈妈一点甜头，好吗？]");
         outputText("[pg]你点点头，欢迎她来到你的营地");
         if(get_camp().companionsCount() >= 3)
         {
            outputText("，一定要在事情升级之前，把她介绍给沿途的其他居民，并安抚任何不满的情绪。索菲在这方面做得很好。她似乎天生就有化解愤怒的能力，她把这归功于抚养了她众多的女儿");
         }
         outputText("。");
         outputText("[pg]<b>(索菲已添加到追随者菜单中！)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,747,1);
         doNext(playerMenu);
      }
      
      public function sophieIncestInHerCooterOrSomethingIDunno() : void
      {
         var daughter:int;
         var _g:SophieFollowerScene;
         clearOutput();
         outputText("你走近鹰身女妖的巢穴，呼唤着你的一个女儿。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 1)
         {
            outputText("得到[father]关注的期望让你那长满羽毛的女儿们之间爆发了一场小小的争吵。谢天谢地，这场小争斗很快就结束了，你的一个女儿飞下来站在你面前。");
         }
         else
         {
            outputText("听到你的呼唤，你的女儿非常高兴地来到了你的身边。");
         }
         outputText("这个曲线曼妙的女孩对你微笑着，她的双眼明亮而专注，闪烁着对她心爱的[daddy]的禁忌爱意。你对她坏笑了一下，用打量的目光看着她，视线在她那美丽的成熟女性躯体上游走。");
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740);
         if(_loc1_ > 4)
         {
            _loc1_ = 4;
         }
         _loc1_ = Utils.rand(_loc1_);
         if(_loc1_ == 0)
         {
            outputText("[pg]你那胸部丰满的无脑花瓶女儿向你摆出姿势，挺起她巨大的乳房，向你飞吻，炫耀着她身体的巨大资本。她抬起双手，托起她柔软的肉球，然后松开，让它们在你眼前诱人地弹跳摇晃。她一刻也等不及了，蹦蹦跳跳地向你跑来。她那白皙的乳沟随着她的每一步像果冻一样摇晃抖动，直到她用双臂环抱住你，将它们紧紧贴在你身上，她那棉花糖般的胸部溢出到你身上，她拼尽全力想引诱你进入她的温柔乡，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,750) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[say: 那个，我看起来怎么样，" + get_player().mf("爸爸","妈妈") + "？我的胸部是不是超级软？你难道不想吸一吸、揉一揉吗？哦哦哦！" + get_player().mf("爸爸","妈妈") + "，求你摸摸我好不好？我好想要你！一想到你猛操我的小穴，我的下面就湿得不行了！]");
            }
            else
            {
               outputText("[say: 你不喜欢我这又大又软的乳房吗，" + get_player().mf("Daddy","Mommy") + "？你难道不想揉捏它们、吸吮它们吗？哦哦，" + get_player().mf("Daddy","Mommy") + "，求你了，我好想要你。一想到你，我就变得又热又湿！我只想让你的[cock]插进我身体里，狠狠地捣弄我的骚穴，直到我尖叫出来！]");
            }
            outputText("[pg]这样柔软、令人忍不住想揉捏的乳房紧贴着你，而你的女儿又如此愿意让你触碰它们——甚至是在央求你触碰——你又怎么可能抵挡得住这份乱伦的诱惑？你把手探下去，拍打她丰腴的屁股，逼得她丰满柔软的唇间发出一声鸟儿般的啾鸣。你凑上前，亲吻那双柔软嘟起、仿佛专为肉棒准备的唇瓣。你们唇瓣相贴的触感让你女儿发出一声低沉的呻吟；那双柔嫩敏感的唇，似乎和她那滚烫湿润的小穴一样敏感。你的双手从她圆润的鹰身女妖臀部滑向她巨大的乳房，手指陷入柔软丰盈的肉里，仿佛那是用最上等的慕斯做成的一般。你一边用力亲吻她，一边肆意揉捏、抚弄她的乳房；你的嘴唇、舌头和双手都在挑逗着你女儿身上最敏感的部位。那对硕大乳白的乳房似乎更适合长在牛娘身上，而不是鹰身女妖身上。她顶着这么一副丰硕胸脯居然还能飞，简直令人惊讶。");
            outputText("[pg]你无法抗拒她那硬挺的乳头紧紧贴着你的感觉，你伸出手，抓住你女儿那巨大、乳白色的乳房，捏住她硬挺的乳头。你拉扯着你那丰满女儿敏感的乳蕾，然后捏紧、挤压它们。你还没有满足，你松开她的乳头，让你的手陷入她巨大乳房柔软的肉中，然后更用力地抓住它们，开始揉捏和按摩那柔软、顺从的乳房。你粗暴而充满激情的抚摸似乎只会让你大女儿更加兴奋和饥渴。她显然很享受你对她敏感乳房的抚摸和挑逗，你从她撅起的嘴唇中引出了渴望的、像鸟儿一样的咕咕声和哭泣声。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,750) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[pg][say: 啊啊、啊啊啊！" + get_player().mf("爸、爸爸","妈、妈妈") + "！我、我真的受不了你这样挑逗了！求你，把你硬、硬邦邦的肉棒给我，" + get_player().mf("爸爸","妈妈") + "！]");
            }
            else
            {
               outputText("[pg][say: 噢，噢噢噢！" + get_player().mf("D-Daddy","M-Mommy") + "！嗯嗯嗯……我受不了这么挑逗了！求你，求你给我吧，尽你所能狠狠地操我，" + get_player().mf("Daddy","Mommy") + "！]");
            }
         }
         else if(_loc1_ == 1)
         {
            outputText("[pg]你屁股硕大的女儿摆出姿势，背对着你，炫耀她那又大又圆的屁股和丰腴、好生养的胯部。她那丰满的翘臀被她长长的羽毛般头发和尾巴挑逗般地遮掩着。她回头看向你，嘟起丰润的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,751) > 0)
            {
               outputText("无脑花瓶般的");
            }
            outputText("嘴唇，向你飞吻。她的双手滑过臀部，将紧致的屁股撅得更高，然后为了取悦你而自己打起屁股来。随着自己拍打的感觉，她嘴里发出喘息，试图让你陷入配种的狂热之中。");
            outputText("[pg]看着她如此色情的表演，看着你亲生女儿如此努力地诱惑你进行一场乱伦的狂欢，你咬住了嘴唇。当你闻到她的气味时，想要立刻抓住你的女儿就地正法的欲望变得更加强烈。这只饥渴的鹰身女妖扇动着长长的羽毛，将她那火热而令人上头的气味吹向你，让你闻到她的发情，那是一个成熟且渴望交配的雌性准备好被配种的气味。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,751) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[say: 嗯……你难道不想狠狠操我性感的屁股吗，" + get_player().mf("爸爸","妈妈") + "？它这么大，简直就是在求着你打它、揉它，直到它变得通红又敏感。]");
            }
            else
            {
               outputText("[say: 来吧，" + get_player().mf("爸爸","妈妈") + "，摸我，打我的屁股，就像我这个渴望着" + get_player().mf("爸爸","妈妈") + "的坏女孩应得的那样。狠狠地给我，打我圆滚滚的大屁股，狠狠操我火热紧致的小穴，我知道你想这么做。]");
            }
            outputText("[pg]再也受不了她的挑逗，你向前一步，抬起手，照着她想要的屁股狠狠拍了一下。那有力的一击让你的女儿忍不住从唇间发出一声喘息。你让你的女孩俯下身，花时间仔细端详你这丰腴女儿饥渴的后臀。双手滑过她圆润的臀肉，你揉捏着那片柔软的肉感，掌心在她那明摆着渴求抚弄的屁股上反复按揉，随后又抽回手，给了她梦寐以求的责打。她的双颊因羞耻而烧得通红，可她对着你晃动、颤抖着那肉乎乎的臀部，分明说明她和你一样渴望这一切。终于能好好看个清楚，你的双眼睁大，双手抚过她弹软后臀的每一寸。如此美妙的屁股绝不能浪费，于是你俯下身，把脸埋进那对奢华的臀瓣之间，嘴巴牢牢贴上她淌着淫液的小穴，品尝她甜美的淫液。你很快就被你这大屁股女儿淫靡小穴的美味冲得头昏脑涨。她散发着一只精致、羽毛柔软、发情的女儿般“母狗”的甜美滋味，渴望让[daddy]的鸡巴塞进她湿淋淋、迫不及待的小穴里。她那巨大的臀部虽然丰腴诱人，但你已经忍不住要当场占有她。她小穴的气味与味道已经深深影响了你。想要与你的女儿交配、让她受孕的冲动实在强烈得无法遏止。");
         }
         else if(_loc1_ == 2)
         {
            outputText("[pg]与她的两个姐姐不同，你面前的这个鹰身女妖女儿与她的母亲和姐姐们相比要普通得多，尽管她仍然比普通的山地鹰身女妖更丰满、更性感。在你的注视下，你的女儿忍不住害羞起来。她红着脸低下头，双手不安地摆弄着，双脚在泥土里踢来踢去。这个鹰身女妖女孩显然因为自己不如母亲和姐姐们那样多汁和丰满而感到尴尬。尽管她对你充满渴望，但当你可以操她的母亲或姐姐时，她忍不住觉得自己配不上你。她深吸了一口气，装出一副勇敢的样子，然后为你摆出一个姿势。");
            outputText("[pg]看着她尽管这么在意自己，却依然如此努力，你心里不禁一暖。你的女儿只是为了取悦你，才这么拼命。你注视了她一会儿，看着她开始为你起舞、扭动身体，尽可能展现出自己紧实的身段。她的双手在身上上下滑过，抚摸着自己的臀部、平坦紧致的小腹，还有柔软挺翘的乳房。她一抓住自己娇嫩的乳房，便忍不住发出一声低吟，同时用那双紫罗兰色的眼睛望向你，希望自己的舞姿能让你满意。");
            outputText("[pg]你拍手鼓掌，赞许女儿的努力。这个曲线玲珑的小鹰身女妖正这么拼命地取悦她的[daddy]，还想把他诱进自己的巢里……");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,752) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[say: 就、就是说，我做得好吗，" + get_player().mf("Daddy","Mommy") + "？我真的已经为你尽全力了。我知道我不像妈妈和姐妹们那样超级性感……可是，" + get_player().mf("Daddy","Mommy") + "……我还是会让你满意的，真的，会尽我所能做到最好！]");
            }
            else
            {
               outputText("[say: 这、这个，你觉得怎么样，" + get_player().mf("爸爸","妈妈") + "？我做得好吗？我知道我没有妈妈那么性感，但我保证会尽我所能取悦你！]");
            }
            outputText("她说道，心里只想着无论如何都要取悦你。");
            outputText("[pg]你对女儿露出坏笑，朝她走去的同时伸出双手，一把抓住她，将这个诱人的女儿拉进怀里，与你紧紧贴在一起。你们贴得如此之近，她清楚地感觉到[oneCock]正在你的[armor]束缚下硬挺地顶着她。欲求不满的鹰身女妖发出一声咕哝，身体贴着你磨蹭，双手紧抓着你，在你身上游移；她用那双紫罗兰色的大眼睛望着你。她对你的渴望，就像地精脸上的淫欲一样赤裸。你伸手向下，抓住她丰腴的鹰身女妖臀部，饥渴地揉捏着那柔软、令人想拍打的翘臀；想要侵犯并让这个美味鸟女孩受孕的欲望迅速膨胀，压过了你所剩无几的理智。尽管她有着“正常”的双脚，但一想到要占有这个迫不及待又美丽的女儿，你心中便涌起一阵必须得到满足的刺痛饥渴。");
         }
         else
         {
            outputText("[pg]你的女儿优雅地展开双翼，柔软的绒羽看起来温暖又舒服；她将翅膀垂落在身侧，勉强遮住自己裸露的身体。她尽可能优雅地为你起舞，摇摆着身躯，如同最下流酒吧里最出色的舞者般扭动。她晃动丰腴的臀胯，摇着那欠拍的屁股，又挤弄着可供吮吸的乳房，这个粉色的女人为你低声吟唱。她一边起舞、一边抚弄自己，口中不断发出呻吟与低哼；她的蓝眼睛一有机会就瞟向你，目光在你身上游移，毫不掩饰对你的欲望。");
            outputText("[pg]她慢慢向你走来，诱人地来回摆动臀胯，炫耀着那副好生养的丰腴曲线。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,753) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[say: 来嘛，" + get_player().mf("爸爸","妈妈") + "，你看不出来我有多火辣吗？你难道不想放开了干我，干到我尖叫出来吗？]");
            }
            else
            {
               outputText("[say: 看看我，" + get_player().mf("爸爸","妈妈") + "，我的曲线多美，我已经准备好了，为你变得又热又湿。放开自己，向我展示你的爱，向我展示你有多爱我，" + get_player().mf("爸爸","妈妈") + "，狠狠地操我，让我尖叫，让我成为你的。]");
            }
            outputText("这个饥渴的鸟女孩舔着她丰满、诱人的嘴唇说道，渴望着你乱伦的种子。她用双臂环抱住你，将身体紧贴着你，并将一条长满绒毛的长腿缠绕在你身上。她的姿势向你敞开，并将她湿润的下体压在你的胯部。她是一个如此淫荡、可爱的女人，她如此渴望你，她的身体乞求你占有她，用你强大的男子气概播种她肥沃的身体。");
            outputText("[pg]你再也无法忍受，一把抓住你毛茸茸的女儿，双手抓住她的屁股，揉捏拉扯着那柔软曲线优美的臀部。在你的命令下，她将自己更紧地贴向你，她那变态的肉棒枕头在你们之间挤压着，就像最柔软、最甜美的棉花糖。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,753) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
            {
               outputText("[say: 啊……哦……哦，" + get_player().mf("爸爸","妈妈") + "！你喜欢我的屁股，对吧；它是不是很棒？抓起来捏起来感觉真好。我打赌，如果打它几下，也会很有趣的……]");
            }
            else
            {
               outputText("[say: 嗯……哦，" + get_player().mf("爸爸","妈妈") + "，是的……就是这样，摸我，摸我，玩弄我，你想对我做什么都可以。]");
            }
            outputText("她在你耳边咕哝着，用她乱伦肉体的禁忌更加诱惑你。面对如此强烈的快乐邀请，你的女儿如此开放，准备好接受你的快乐，你怎么能拒绝这样一个可爱的女孩呢？");
         }
         menu();
         _g = this;
         daughter = _loc1_;
         addButton(0,"继续",function():void
         {
            _g.phaseTwoOfIncest(daughter);
         });
      }
      
      public function sophieFollowerIntro() : void
      {
         outputText("[pg]<b><u>今天早上发生了一些不寻常的事情……</u></b>");
         outputText("[pg]你正漂流在一条温暖奇妙的河上，手紧紧抓着胯部，脑海里回想着与那个性感尤物索菲的所有性爱经历。她那高傲成熟的态度似乎恰到好处地撩拨着你，如果由你决定，你恨不得让这位熟女妈妈每天每时每刻都在你的鸡巴上跳跃。说到这，你越是想起你那成熟世故的性伴侣，你顺流而下的旅程似乎就越发颠簸。随着颠簸越来越剧烈，你突然意识到你根本不知道自己一开始为什么会漂流在河上……");
         outputText("[pg][say: 用力操我，亲爱的！]");
         outputText("[pg]你猛地回过神来，醒来发现你痴迷的对象正欢快地在你暴露的腹股沟上跳跃。随着这位鸟人那如天堂般的大腿的每一次下压，她凌乱的头发也跟着跳动。她很快注意到了你完全清醒过来，脸涨得通红，试图从你身上下来。");
         outputText("[pg][say: 噢，该死——亲爱的，事情根本不是你想的那样。我一直都是那个抓年轻男人来狠狠操我的人，但自从你出现后，我满脑子想的都是你的鸡巴！噢，当然还有你。请不要生气，亲爱的，找到这个地方已经够难了，而且——]");
         dynStats(DynStat.Lust(10));
         menu();
         addButton(0,"亲吻索菲",kissSophieRecruitment);
         addButton(1,"滚出去",getOutSophieRecruitment);
      }
      
      public function sophieFollowerGoesIntoSeas() : void
      {
         outputText("[pg]每当你望向索菲时，她似乎都在试图引起你的注意。当你靠近她时，她会时不时地轻轻触碰你，显然没有任何借口，当你靠得足够近时，她总是试图摸摸你的隆起和你的[cock biggest]。她身上也散发着烟熏般的欲望气息，当你离她太远而无法触碰时，她会眼中闪烁着光芒看着你，张开她的下唇，比平时更加肿胀和变大。当她注意到你在她身后看着她的方向时，她会本能地弯下腰，突出她那摇晃的臀部的曲线，炫耀她的阴户。");
         outputText("[pg]毫无疑问——索菲想配种了。[pg]");
      }
      
      public function sophieFollowerGivesBlowjobs() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("索菲歪着头轻笑起来，[saystart]你想感受索菲妈妈的嘴唇包裹住那根");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("被你称为阴茎的小阴蒂");
         }
         else if(get_player().cockArea(_loc1_) <= get_sophieBimbo().sophieCapacity() / 2)
         {
            outputText("饥渴的男孩肉棒");
         }
         else
         {
            outputText("被你称为鸡巴的肿胀巨物");
         }
         outputText("吗？[sayend]她扭动着臀部，风情万种地漫步走来，多汁的肉丘发出响亮的吧唧声，每次大腿张开时，腿间都会挂着拉丝的淫液。鹰身女妖的指尖戳在你的胸口");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，正好在你的[chest]之间");
         }
         outputText("，然后慢慢向上划到你的下巴，用长着长指甲的手指轻轻捏住。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("[say: 你可能给了我一具无脑花瓶的身体和对性爱永不满足的渴望，]");
         }
         else
         {
            outputText("[say: 你可能用火辣的性爱把我诱惑到了你的营地，]");
         }
         outputText("她娇嗔道，[say: 但这并不意味着我会白白用这美丽的嘴唇包裹你。不如你让我用你那张可爱的脸来磨蹭我的小穴，然后我再回报你怎么样？]她向你飞吻，最后用舌头在她肿胀的嘴唇上缓慢而湿润地舔了一圈。");
         menu();
         addButton(0,"强迫她",forceSophieBlowjob);
         addButton(1,"69式",sophieBlowsSixtyNine);
      }
      
      public function sophieFollowerAtCamp() : Boolean
      {
         if(sophieFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0;
         }
         return false;
      }
      
      override public function sophieFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0)
         {
            return false;
         }
         if(get_sophieBimbo().bimboSophie())
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,745) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,747) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function sophieFertilityKnockedUpExpired() : void
      {
         outputText("[pg]索菲时不时地揉着自己的腹部，还会露出得意的笑容或微笑，尤其是在看着你做这个动作的时候。在得到你的“帮助”后，她显得有些凌乱，但似乎不太在意自己的外表，而是更在意你“干预”的结果，当她的手指伸向自己的阴阜，寻找你的体液时，她的眼神有些迷离。[pg]");
      }
      
      public function sophieFertilityExpired() : void
      {
         outputText("[pg]索菲似乎对你失去了大部分异常的兴趣，虽然她像往常一样性感撩人，但她似乎不再那么极度渴望有根肉棒插进她的小穴里了。看来她的发情期，或者不管叫什么，暂时过去了。[pg]");
      }
      
      public function sophieDaughterDebimboUpdate() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1)
         {
            outputText("[pg]也许营地里发生的最令人印象深刻的变化，是索菲开始管教她在你给她解药之前生下的那个女儿。她就在她妈妈旁边，梳理着羽毛，对着一块闪亮的金属片检查自己的妆容。索菲引起了她的注意，并立即开始做出一些改变——带领她进行发声训练。她似乎下定决心要消除她女儿从她那里学来的“口音”，而年轻的鹰身女妖也以惊人的速度适应了。你猜在接下来的日子里，你不会再听到太多“like”或“totally”了。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 2)
         {
            outputText("[pg]也许营地里发生的最令人印象深刻的变化，是索菲开始管教她在你给她解药之前生下的那两个女儿。她们都围在她身边，梳理着羽毛，对着闪亮的金属片检查自己的妆容。索菲引起了她们的注意，并立即开始做出一些改变——带领她们进行发声训练。她似乎下定决心要消除她女儿们从她那里学来的“口音”，而年轻的鹰身女妖们也以惊人的速度适应了。你猜在接下来的日子里，你不会再听到太多“like”或“totally”了。[pg]");
         }
         else
         {
            outputText("[pg]也许营地里发生的最令人印象深刻的变化，是索菲开始管教她在你给她解药之前生下的那些女儿。她们都围在她身边，梳理着羽毛，对着闪亮的金属片检查自己的妆容。索菲引起了她们的注意，并立即开始做出一些改变——带领她们进行发声训练。她似乎下定决心要消除她女儿们从她那里学来的“口音”，而年轻的鹰身女妖们也以惊人的速度适应了。你猜在接下来的日子里，你不会再听到太多“like”或“totally”了。[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,746,0);
      }
      
      public function sophieBlowsSixtyNine() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         outputText("你急切地点头，这让这位丰满的鹰身女妖笑了起来，全身泛起红晕。她向你冲来，又跳又扇翅膀，速度越来越快，身后扬起一阵脱落的羽毛。你张开双臂，任由她撞向你，她沉甸甸的双乳和宽大柔软的大腿缓冲了冲击力。你们俩在泥土中翻滚了好几圈，最后停了下来，她跨坐在你的[chest]上，用一根手指在滑腻的肉褶间摩擦。她又加上一根手指将它们撑开，粉红色的内壁湿润地跳动着，滴落着雌性的淫液。");
         outputText("[pg]索菲轻声咕哝着，[say: 只要在索菲妈妈的小穴上舔几下，[name]，我就会把你吸得舒舒服服的，让你沉迷于被鹰身女妖的小穴糊一脸的感觉。]");
         outputText("[pg]你挑起一侧眉毛作为回应，但还没等你好好回答，这位充满母性的女人就站起身转了一圈，让你完美地欣赏了她那丰满的翘臀，然后她的臀部向你的[face]压了下来。沉甸甸的臀瓣和粗壮的大腿完全遮蔽了光线，女人湿漉漉的私处降临到你的嘴上。她那酸甜的气味越来越浓烈地钻进你的鼻腔，直到她滑溜溜的温暖和女性的气味完全占据了你的感知。她的阴唇在你的口鼻上大大地张开，索菲柔软丰满的大腿夹住了你的耳朵。此时此刻，你简直就是又聋又瞎又哑，但你仍然有一种方式可以交流——用你的舌头。");
         outputText("[pg]在你被阴道包裹的同时，索菲也开始处理你那紧绷的凸起");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("那");
         if(get_player().cockTotal() > 1)
         {
            outputText("正");
         }
         else
         {
            outputText("正");
         }
         outputText("越来越高。她轻松地将[eachCock]从束缚你的[armor]中拉出来，测试着肿胀肉棒的粗细和硬度");
         if(get_player().cockTotal() > 1)
         {
            outputText("，寻找着她今天的目标。最后，她选定了你的" + get_player().cockDescript(_loc1_) + "，深情地捏了捏它");
         }
         else
         {
            outputText("，深情地捏了捏它");
         }
         outputText("。她对着它呼气，那气息如此湿热，你几乎以为口交已经开始了。但当她的嘴唇真正碰到你的" + get_player().cockHead(_loc1_) + "时，这种想法被那滑腻香甜的拥抱击碎了。在你的感官被小穴剥夺、被阴液淹没的情况下，索菲那金色的肉棒枕头对你的触碰似乎被放大了七倍。你的背本能地弓起，试图把你的[hips]抬得更高，但这位主母温柔而坚定的手把你按了回去。她的舌头伸出来，在你的尿道下方舞动，而她那柔软的嘴唇则越滑越低。");
         outputText("[pg]你急切地让自己的口部天赋发挥作用。它轻松地穿过索菲润滑的内壁，她通道里丰富的汁液用她的欲望染红了你的嘴唇。");
         if(get_player().tongue.type > 0 && get_player().tongue.type <= 3)
         {
            outputText("你的舌头越来越长，不断地从嘴里伸出，随着时间的推移，越来越深地扎进那滑溜溜的通道。她的味道浸透了你众多的味蕾，当你反复将你那非人的肌肉滑过那糖浆般的通道时，她内部天鹅绒般的褶皱感觉棒极了。");
         }
         else
         {
            outputText("你的舌头直接滑了进去，鹰身女妖的小穴似乎就像你的第二个家。当你尽可能深地扎进去，滑过她天鹅绒般的褶皱时，她的味道浸透了你的味蕾。");
         }
         outputText("索菲粗壮的大腿作为回应夹得更紧了，挡住了最后一点光线，把你更用力地推向她湿透的阴阜。你让下唇擦过她坚挺的阴蒂，品尝着她漏进你嘴里的润滑液。");
         outputText("[pg]她的舌头和你的舌头似乎成了唯一重要的事情。她的舌头环绕着你的整个" + get_player().cockDescript(_loc1_) + "，伴随着金色的嘴唇，留下了它们那令人迷醉的琥珀色残留物。那些化学物质引起的令人愉悦的刺痛感让你欲火焚身。你的心脏在胸腔里疯狂地跳动，每一次跳动都增强了你在鸟女嘴里勃起的硬度。");
         if(get_player().hasVagina())
         {
            outputText("她温柔地");
            if(get_player().balls > 0)
            {
               outputText("伸手到你的[balls]下面，并且");
            }
            outputText("用两根手指探索你的[vagina]，拇指每隔几秒钟就刷过你的[clit]。看来这只鹰身女妖甚至体贴到了你的女性需求——这让你变得更硬，胀得几乎发痛。");
         }
         else if(get_player().balls > 0)
         {
            outputText("她温柔地抚摸你的[sack]，让手指在你的[balls]上跳舞。看来这只鹰身女妖以一种让你更硬、胀得几乎发痛的方式体贴到了你的所有需求。");
         }
         else
         {
            outputText("她温柔地用长指甲划过你敏感的会阴皮肤。看来她非常体贴你的快感，体贴到让你硬得发胀，几乎发痛。");
         }
         outputText("她羽毛般的头发垂在你的[legs]上，当她大声地吸吮时，发丝弄得你痒痒的，而你则直接对着她光溜溜的小穴呻吟。震动让她比以前流得更厉害了。你尽职尽责地努力把它们喝下去。");
         outputText("[pg]当你开始直接滴在她的舌头上时，索菲高兴地哼着歌，先列腺液从你被唾液润湿的马眼处稳定地流出。虽然你知道是什么在给你的" + get_player().cockDescript(_loc1_) + "带来天堂般的快感，但你被唇彩迷幻的大脑还是开始陷入幻想。就像在现实世界中一样，索菲的小穴用她芬芳的淫液涂抹着你的[face]，而你的肉棒则被琥珀色的催情剂包裹着。但在幻想中，有一个小穴紧紧地挤压着你，还有第二双粗壮的鹰身女妖大腿紧紧夹住你的腰。那些肥沃的、能产卵的大腿在你的肉棒上上下跳动，你上方的小穴因兴奋而成熟，上面是一个因孕育生命而肿胀的肚子，那生命有一天会成为你的女儿。每天早上，你都会被你的女孩们吸到高潮，并被亲吻，直到你的嘴唇和肉棒被涂上一层琥珀色的光泽。然后你躺下来，享受作为鹰身女妖" + get_player().mf("king","breeder-queen") + "的成果：一个接一个的内射，舔舐味道浓郁的鹰身女妖小穴，以及每次你性欲开始衰退时熟练的口交。你对着上面的缝隙呻吟，你的手抓住多汁的臀部，把它们拉向你。");
         outputText("[pg]作为回应，一声愉悦的叫喊在你的肉棒上回荡，伴随着逐渐增加的吸力，将你从幻想中唤醒。你的[hips]慢慢地随着索菲嘴唇吸吮的节奏摇摆，当你积极地舔舐她越来越湿润的小穴时，你意识到你们俩都越来越接近高潮。索菲将她肿胀的、吸吮着肉棒的嘴唇顺着你的长度向下探去");
         if(get_player().cockArea(_loc1_) <= 60)
         {
            outputText("直到[sheath]");
         }
         else
         {
            outputText("尽可能深，微微作呕");
         }
         outputText("。她的大腿开始在你周围颤抖，用力之大让你开始担心她可能会以某种方式压碎你的头，但这更像是被柔软的垫子闷住，而不是什么真正令人担忧的事情。你兴奋地颤抖着，开始弹拨她的阴蒂，渴望让她分享这份快乐。");
         outputText("[pg]两声同时发出的愉悦哼唱在两对生殖器中震荡，在完美和谐的高潮中相匹配。当你将你液态的欲望提供给她吸吮的口腔时，索菲的脸颊鼓了起来。当你的尿道将一波又一波的精液泵入她的喉咙深处时，她的舌头在肿胀的尿道上挠痒痒。她大声地吞咽着，肚子咕噜咕噜地响，试图跟上你的节奏。你上方肿胀的阴阜随着你嘴部的动作痉挛，释放出一波味道浓郁的鹰身女妖淫液，这种芬芳滑腻的东西溅满了你的整个[face]，迫使你大口吞咽麝香气味的女孩淫液。");
         if(get_player().cumQ() >= 1000 || get_player().cockTotal() > 1)
         {
            outputText("一旦你强劲的喷射变得让索菲无法承受，温暖的粘液就会覆盖你的[hips]和[butt]。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("当她开始显露出一些精液小腹时，她很快就放弃了吞咽，但当她榨取你的" + get_player().cockDescript(_loc1_) + "时，她的手精力充沛地套弄着你，将大量的精液挤在你的[chest]上。");
         }
         if(get_player().cumQ() >= 3000)
         {
            outputText("你用所有的滴落物弄出了一个白色的大水坑，当你舔舐高潮的鹰身女妖主母时，你陷入了精液泥潭中。");
         }
         outputText("[pg]索菲又颤抖了几次，你的身体也随之愉悦地起伏。你躺在那里，对着她的小穴喘气，而她则在你肿胀的肉棒上大口喘气。最终，她从你身上爬下来，扶你站起来。");
         outputText("[pg][say:我就知道，只要你舔几口索菲妈妈的小穴，你就会更爽，]这位长着羽毛的女人在大声吞咽后柔声说道。[say:你真该看看所有的血液都涌向你的老二……就像现在一样。]她再次捏了捏你已经僵硬的肉棒。[say:如果你还想要，就告诉我，不过既然这么多口红都浸透了这个小家伙……那可能就是现在了。]索菲得意地笑了笑，转过身，扭动着臀部，迈着俏皮的步伐走开了。你确实有点想再来一次……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,748,0);
         get_player().slimeFeed();
         get_sophieScene().luststickApplication(8);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         dynStats(DynStat.Lust(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sophieAppearance() : void
      {
         clearOutput();
         outputText("索菲是一个高大丰满的鹰身女妖，毫无疑问。她有着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("非常");
         }
         outputText("长的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("白金色的");
         }
         else
         {
            outputText("粉");
         }
         outputText("像鸟类羽毛一样垂在肩上的“头发”。她丰满的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("、超大的");
         }
         outputText("嘴唇上总是涂着厚厚的一层金色唇膏，就像她的大多数同类一样，这种唇彩能让她的声音具有一种令人无法抗拒的魅力，或者在接触男性或扶他时引起他们的性欲。她的脸上缺乏许多姐妹那种青春的气息，尽管你也看不到任何表明年龄的皱纹。");
         outputText("[pg]索菲的乳房");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("如此巨大，如果她试图飞行，它们会把她拖到地上，这是你给她喝的药水留下的性感后遗症。这对摇晃的无脑花瓶奶子看起来大约有F罩杯。");
         }
         else
         {
            outputText("异常巨大。这个丰满的鹰身女妖似乎确实被它们稍微拖累了，但仍然能够飞行。她的乳房看起来大约有DD罩杯，又大又漂亮，足以进行柔软的揉捏或粗暴的乳交。");
         }
         outputText("[pg]在她粗壮的大腿之间隐藏着一个闪闪发光、湿润的小穴，" + (get_noFur() ? "就在这下面开始长出" : "这两条腿都长满了") + "羽毛，一直延伸到她那像鸟一样长着利爪的脚上。她每迈出夸张的一步，她那摇晃的臀部就会微微颤动，长长的尾羽在上面扇动。你确信在它们之间有一个紧致的屁眼，就在它该在的地方，但周围都是丰满的屁股，你实在看不清楚。");
         outputText("[pg]索菲的手臂上也长满了羽毛，外观有点像翅膀，尽管末端长着人类的手。她的主翼更大，从肩胛骨上方长出来。她经常把它们折叠在身后以免碍事，但当她想的时候，她可以用它们卷起巨大的沙尘暴。");
         if(get_game().farm.farmCorruption.hasTattoo("sophie"))
         {
            outputText("[pg]");
            if(get_game().farm.farmCorruption.sophieFullTribalTats())
            {
               outputText("她从头到尾都覆盖着部落纹身，色情的线条在她赤裸的身躯上蜿蜒，让她看起来像一个几乎未被驯服的野蛮人。");
            }
            else
            {
               if(get_game().farm.farmCorruption.numTattoos("sophie") > 1)
               {
                  outputText("她的身体上印有以下纹身：\n");
               }
               else
               {
                  outputText("她有");
               }
               if(1145 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1145) + "\n");
               }
               if(1146 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1146) + "\n");
               }
               if(1147 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1147) + "\n");
               }
               if(1148 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1148) + "\n");
               }
            }
         }
         doNext(followerSophieMainScreen);
      }
      
      public function sleepWithSophieToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Sophie")
         {
            outputText("你问索菲是否愿意晚上和你一起睡。听到这个建议，索菲挑起了一边眉毛。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
            {
               outputText("[pg][say:你先是把我变成了一个无脑花瓶，然后又恢复了我的理智。现在，你指望我像个没脑子的花瓶一样直接跳上你的床？]她上下打量着你问道。");
               outputText("[pg]你");
               if(get_player().cor < 33)
               {
                  outputText("局促地");
               }
               outputText("回答说，你觉得晚上和她依偎在一起可能会很不错，甚至不一定非要发生性关系。在漫长寒冷的夜晚，能有个人抱着就很好了，而且你承认索菲的身体抱起来会很舒服。");
               outputText("[pg]这位主母想到这里笑了笑，然后给了你一个柔软的大拥抱。她在你耳边低语道：[say:我也很乐意，]同时她的两对翅膀在你身上来回抚摸。索菲依依不舍地松开了你。");
               outputText("[pg][saystart]今晚见，[name]");
               if(get_player().smallestCockArea() <= 5 && get_player().hasCock())
               {
                  outputText("，但如果我早上对你那根小鸡巴有点粗暴，可别惊讶");
               }
               outputText("！[sayend]她喊道。");
               if(get_player().smallestCockArea() <= 5 && get_player().hasCock())
               {
                  outputText("[pg]<b>如果你不想让她拿你的小鸡巴开玩笑，你最好告诉她不要再和你一起睡了。</b>");
               }
            }
            else
            {
               outputText("[pg]索菲灿烂地笑着抱住你，她的翅尖兴奋地扑腾了几下，然后将你包裹在一个更加全面的拥抱中。她说道：[say:听起来很不错。]");
               outputText("[pg]她带着幸福的微笑与你分开。");
               if(get_player().smallestCockArea() <= 5 && get_player().hasCock())
               {
                  outputText("[say: 你不会介意我早上逗弄你可爱的小鸡鸡吧，[name]？它太可爱了……]她若有所思地说。[pg]<b>如果你不想让她拿你的小鸡鸡开玩笑，你最好别和她上床。</b>");
               }
            }
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Sophie");
         }
         else
         {
            outputText("你告诉索菲，你现在暂时不想和她一起睡。听到这番话，她重重叹了口气，说道，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) == 0)
            {
               outputText("[say:好吧，那是你的床。如果你想让我回来抱抱，记得告诉我，好吗？]");
            }
            else
            {
               outputText("[say: 驾驭不了这些曲线，是吧，[name]？别发愁，索菲妈妈会一直陪着你，直到你忍不住来抱抱她。]");
            }
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         }
         doNext(followerSophieMainScreen);
      }
      
      public function sexWithFollowerSophie() : void
      {
         clearOutput();
         if(!get_player().hasCock())
         {
            outputText("[say: 哦？做爱？你并没有真正具备那个条件，]索菲说着，向你的胯部投去失望的目光。即使你不能让别人怀孕，你也完全具备享受快感的条件，但她似乎并不在意这个理由。[say: 我对" + get_player().mf("没有鸡巴的男孩","女孩") + "不感兴趣，[name]。]");
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,94) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 1 ? "你已经给了她很多蛋" : "你为她提供了庇护所") + "，而且她也不打算离开，所以找点乐子有什么不好的？当你给她口交的时候，你身体的其他部分是什么样真的重要吗？");
            outputText("[pg][say: 我不离开是因为" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,94) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0 ? "你以前给过我蛋，而且你有很大的机会长出新的鸡巴再来一次" : "在我的情况下，我没有太多选择") + "。这不是什么纯洁的童话浪漫；我只是对那些在生理上不适合我的人没有吸引力。]她叹了口气，双臂交叉。[say: 这很难理解吗？不是每个人都能对自己的性感受如此开放。]");
            outputText("[pg]你觉得这很有道理，而且表达得很清楚，这正是你能从像她这样成熟的人身上期望到的。不用说，你有点失望，但是" + (get_player().cor > 66 ? "如果你试图强奸她，随之而来的闹剧太麻烦了" : "你会尊重她的感受") + "。");
            doNext(followerSophieMainScreen);
            return;
         }
         menu();
         outputText("[say: 哦，真的吗？我本来还希望你能早点尝尝我的味道呢。]一提到要和你做爱，索菲就有些兴奋起来。[say: 那么，你想要什么？还是老样子，还是妈妈这次为你做点特别的？]她舔了舔嘴唇，暗示着。");
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(get_sophieBimbo().sophieCapacity()))
            {
               addButton(0,"阴道交",fuckFollowerSophie);
            }
            addButton(1,"口交",sophieFollowerGivesBlowjobs);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,743) > 0 && get_player().hasCockThatFits(get_sophieBimbo().sophieCapacity()))
         {
            addButton(8,"操女儿",sophieIncestInHerCooterOrSomethingIDunno);
         }
         addButton(14,"返回",followerSophieMainScreen);
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你告诉和你同居的鹰身女妖，她要前往湖边，找到一个农场，向在那里工作的女士报到，并听从她的吩咐。索菲对这个主意并不怎么热心。");
         outputText("[pg][say: 我来这里是为了和你在一起，不是去什么农场干活，]她气呼呼地说。她狡黠地看着你，将她那温暖、柔软的身躯依偎在你的身旁。[say: 你一个人在这里不会觉得寂寞吗，[name]？是的，你会的。给索菲妈妈一个吻，我们就把这事全忘了……]你后退一步，坚定地指向农场的方向。");
         outputText("[pg]在她粉红色的羽毛消失在山坡上很久之后，还能听到她的抱怨和牢骚。你觉得她作为一个工人可能毫无用处，但她比她表现出来的要警惕和敏锐得多。谁知道呢，也许她在那里的时候能产下一些蛋。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1081,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postEggSelector(param1:String) : void
      {
         clearOutput();
         sophieSprite();
         outputText("[say: 那我就为你下一些漂亮的" + param1.toLowerCase() + "蛋吧，亲爱的，]她微微一笑说道。[say: 不过我一周只能产一个。我会把它和你从这个地洞里赚到的其他东西放在一起。怎么样？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1102,1);
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1103) != param1)
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1103,param1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1104,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1105,7);
         }
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function phaseTwoOfIncest(param1:int) : void
      {
         var _loc2_:Boolean = false;
         clearOutput();
         var _loc3_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc3_ < 0)
         {
            _loc3_ = get_player().smallestCockIndex();
         }
         param1++;
         outputText("你收紧对曲线优美的女儿的拥抱，将她推倒在地上。你带着几乎原始的边缘咆哮着，俯身检查你的战利品，双手抚摸着她的");
         if(param1 == 1)
         {
            outputText("巨大的肉枕头般的乳房");
         }
         else
         {
            outputText("柔软挺拔的乳房");
         }
         outputText("，当你抚摸和挤压你女儿丰满的身体时，你的手指陷入了她柔软的肉体。你俯下身，亲吻和吸吮她的脖子，你的嘴唇紧紧贴住，用力吸吮，足以在她的皮肤上留下你的印记，让全世界都能看到。她不愿意对你色情的举动做任何反抗，身心都准备好并完全接受你对她做的任何下流的事情。从她沉重的呼吸和她对你淫荡的呻吟和呼唤来看，你的女儿显然比你更渴望[father]和女儿之间甜蜜的乱伦结合。你有一个多么性感可爱的女儿啊……在你咄咄逼人的抚摸下，她为你呻吟和低吟，召唤你继续你的家庭猛攻。她用双腿缠住你的身体，将臀部贴着你摩擦。[say: 是的，是的！再来，" + get_player().mf("爸爸","妈妈") + "！] 她在气喘吁吁的呻吟中尖叫着。");
         outputText("[pg]你的双手在她的身体上下游走，探索和抚摸你能触及的她曲线优美身躯的每一寸。你向下移动到她");
         if(param1 == 2)
         {
            outputText("巨大、圆润、适合打屁股的屁股");
         }
         else
         {
            outputText("好摸、柔软的屁股");
         }
         outputText("并用力抓住她，挤压和拉扯她柔软的肉体。你对她低吼着，用力打了一下她的屁股，然后把她推倒，把她压在身下。你的目光扫过她的身体，欣赏着她乳白色的肌肤和色彩斑斓的羽毛，她的眼睛也回望着你，燃烧着渴望。你不想再等一秒钟，你从她修长、丝滑的双腿中挣脱出来，脱下你的[armor]。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你的[chest]，从装备的束缚中解脱出来");
            if(get_player().biggestTitSize() < 3)
            {
               outputText("，当冷空气拂过你坚硬、勃起的乳头时，挺立起来。");
            }
            else if(get_player().biggestTitSize() < 10)
            {
               outputText("，活泼地弹跳着，当你满手的乳房肉接触到冷空气时，乳头变硬了。");
            }
            else
            {
               outputText("，涌出一波柔软、可挤压的丰满；那种可以蜷缩起来当枕头用的乳房。");
            }
         }
         outputText("[pg]在你的双腿之间，[eachCock]自由地垂下，你的" + get_player().cockDescript(_loc3_) + "硬得发痛，为你渴望被操的女儿准备好了。这团充满男子气概的肉体随着你的性唤起而跳动，这个贪得无厌的器官渴望被插入你女儿湿透的阴道的深处，她紧致、天鹅绒般的褶皱准备好接受你强大、充满活力的精华。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,753) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0)
         {
            _loc2_ = (param1 == 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,753) > 0 || param1 == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,752) > 0 || param1 == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,751) > 0 || param1 == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,750) > 0) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,746) == 0;
         }
         if(_loc2_)
         {
            outputText("[pg][say: 是的！求你了，" + get_player().mf("爸爸","妈妈") + "！给我！干翻我，干到我脑子里除了你那根超级棒的肉棒什么都想不起来！]");
         }
         else
         {
            outputText("[pg][say: 是的！求你了，" + get_player().mf("爸爸","妈妈") + "，我好想好想！给我，像个种马一样干我，把我的小穴射满精液！]");
         }
         outputText("她柔声说道，字里行间流露出对你和你们之间乱伦之爱的原始而热烈的渴望。看到她如此饥渴，如此渴望，她的身体燃烧着对你无法满足的饥渴，这实在是太诱人了。你自己的欲望也沸腾了，一滴浓稠的先列腺液从你的" + get_player().cockHead(_loc3_) + "喷出，溅在女儿湿透的阴部，为已经准备好迎接你进入她身体的润滑液又添了一把火。");
         outputText("[pg]你握住自己敏感、跳动的肉棒，撸动了一下，发出一声呻吟，你已经准备好了；你硬得发疼，迫不及待地想要享受这场乱伦的性爱。你像一头饥渴的野兽一样，对准女儿娇嫩的阴唇，猛地插了进去，多亏了她流出的甜美汁液，你的" + get_player().cockDescript(_loc3_) + "轻松地滑入了她湿滑的小穴。突然的猛烈抽插让过度兴奋的女儿感受到了一阵阵快感，你一插到底，她的双腿就缠上了你的腰。你没有等她适应，就开始挺动臀部，将你的" + get_player().cockDescript(_loc3_) + "一次又一次地像活塞一样插入她体内，同时把她压在地上。她发出如鸟儿般欢快的叫声，伴随着你臀部拍打她臀部发出的清脆湿滑的啪啪声，这一切都在告诉你她有多爽，她有多喜欢被她的[father]操。");
         outputText("[pg]你不满足于仅仅这样操你的骚女儿，你俯下身，用你的嘴唇吻住了她的嘴唇。");
         if(param1 == 1)
         {
            outputText("你的嘴唇粗暴地压在她丰满、敏感的嘴唇上，这种感觉只会让她的快感更加强烈；当你吻她时，她的小穴在你周围颤抖，紧紧地夹住你。");
         }
         outputText("她热切地回吻你，用她长满羽毛的手臂环抱住你，向你张开双唇。她的舌头滑出来舔舐你的嘴唇，寻找你的舌头，将其拉入一场甜蜜、禁忌的乱伦之舞。你的羽毛子嗣推着你的身体，向后顶撞你，想要更多这种让她脊背发凉的狂喜，这种与她强壮的伴侣交配和繁殖的强烈需求完全控制了她，她的脑海里只有让她的[father]使她的卵子受精的梦想。");
         outputText("[pg]你回吻着这个发情、饥渴的女孩，把舌头强行伸进她的嘴里，探入她温暖湿润的口腔，堵住了她狂野、淫荡的呻吟。你的一只手滑下去，抓了一把女儿丰满、适合打屁股的臀部，用力捏了捏，把她的身体当作把手，一边操她，一边宣示她颤抖的身体属于你。就像她之前的母亲一样，她属于你。你女儿的身体是你的财产，生来就是为了满足你沸腾的欲望，把你的种子深深地吸入她的子宫，像一个优秀的、多产的雌性一样孕育你的后代。你已经能感觉到体内不断膨胀的压力，即将到来的高潮带来的灼热快感，赋予你女儿生命的种子很快就会在[father]的欲望爆发中淹没她的子宫。");
         outputText("[pg]很快，高潮的膨胀力量降临到你身上。你英勇地尽可能久地忍耐着。");
         if(get_player().balls > 0 && get_player().ballSize < 8)
         {
            outputText("你充满精液的睾丸在高潮的力量下收缩、抽动，将你浓稠的精液射入她等待的深处。");
         }
         else if(get_player().balls > 0)
         {
            outputText("你巨大的、种马般的睾丸重重地拍打在女儿柔软、白皙的皮肤上，让她感受到它们有多重，里面充满了你强壮的精华。你酸痛的睾丸贴着她身体的感觉，让她一想到你泡沫般的精液会胀大她的肚子，就高兴得浑身发抖。伴随着强烈的收缩，你肥大、肿胀的阴囊以巨大的、间歇泉般的爆发力，射出浓稠、充满精子的精液，释放出喷涌而出的男子气概。");
         }
         outputText("你肿胀的精管凸起，粘稠的精液撑开了你的" + get_player().cockHead(_loc3_) + "，化作一道道强有力的精柱喷涌而出，仿佛要强暴她的卵子。你充满精子的精液淹没她紧缩、颤抖的小穴的感觉，让你曲线优美的女儿翻着白眼达到了高潮，她的身体在原始的、令人神魂颠倒的狂喜中扭动、挣扎，她的身体紧紧地夹住、挤压着你。");
         outputText("[pg]你们的身体紧紧贴在一起，你抽动着臀部，在她的臀部上摩擦，确保你所有宝贵的种子都去到它理所应当去的地方，进入你可爱的女儿渴望的小穴和肥沃的子宫。");
         if(get_player().cumQ() < 250)
         {
            outputText("你一次又一次地射入你甜美、淫荡的女孩体内，让你多产的女儿受精，尽可能多地把你的精液射入她饥渴的子宫。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("你一次又一次地射入你甜美、淫荡的女儿体内，你把她抱得更紧，确保你尽可能多地把精液射入她等待、饥渴的子宫。");
         }
         else if(get_player().cumQ() < 2000)
         {
            outputText("一股又一股浓稠丰富的精液从你体内流出，滋润着你女儿的子宫。你尽可能紧紧地贴着她，确保每一滴精液都塞进她肥沃的肚子里。你强有力的精液很快就让她的肚子鼓成了一个可爱的、充满精液的圆滚滚的小肚子。");
         }
         else
         {
            outputText("你的精液像洪水一样淹没了你女儿紧致、挤压的小穴，一波又一波浓稠、泡沫般的精液穿过她痉挛的小穴，直接进入她渴望、等待的子宫。间歇泉般浓稠、泡沫般的精液强行进入她的子宫，把它填得越来越满，直到她的肚子越来越胀。她曾经紧致、平坦的肚子圆润成了一个健康的精液宝宝，你浓稠、酸奶般的精液从她被塞满的阴部溢出，形成浓稠、粘稠的溪流。");
         }
         outputText("在片刻的清醒中，你低头看着你的女儿，看到她脸上幸福的表情；她白皙的皮肤发红；她的眼睛向上翻。她的舌头从她丰满、适合口交的嘴唇里伸出来。看到你的女儿沉浸在如此令人神魂颠倒的快感中，享受着她的[father]射在她体内的狂喜，只会让你对你可爱的女儿产生一种自豪感和喜爱之情。");
         outputText("[pg]当你终于从高潮的余韵中缓过来时，你叹了口气，俯下身，依偎在女儿身边。你的双臂环抱着她的身体，她的双腿一刻也没有松开，她用长满羽毛的手臂环抱着你，开始温柔地吻你。她一边吻你，一边对你柔声细语。");
         if(_loc2_)
         {
            outputText("[say: 哦，" + get_player().mf("爸爸","妈妈") + "，哦，" + get_player().mf("爸爸","妈妈") + "……太棒了！我的" + get_player().mf("爸爸","妈妈") + "真是一个性感火辣的" + get_player().mf("种马","双性人") + "。我刚才真的以为自己要失去理智了。我爱你，" + get_player().mf("爸爸","妈妈") + "。]");
         }
         else
         {
            outputText("[say: 哦，" + get_player().mf("爸爸","妈妈") + "，哦，" + get_player().mf("爸爸","妈妈") + "……太棒了，你真是一个他妈的" + get_player().mf("种马","完美的繁殖者") + "！我简直要对你上瘾了。我爱你，" + get_player().mf("爸爸","妈妈") + "，]");
         }
         outputText("她用柔软的嘴唇吻着你说道。你对你深情的女儿轻笑了一声，依偎着她，和你刚刚播种过的女孩度过了一段甜蜜、舒适的枕边时光。");
         outputText("[pg]将近一个小时，你们躺在那里，拥抱、亲吻、抚摸着你女儿的身体，她把你完全霸占了。尽管这样抱着女儿很舒服，但你不得不从她那曲线优美、令人愉悦的身体上抽身。当你离开时，她忍不住撅起了嘴，显然想和她心爱的[father]多待一会儿。你不想让她太失望，于是伸手在她的屁股上拍了一下，把她拉近，再次亲吻她，然后承诺以后会花更多时间陪她。她微笑着咯咯笑了起来，点了点头，脑海里愉快地幻想着下次你们共度美好时光的情景。");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noDontDebimbo() : void
      {
         var _g:SophieBimbo;
         clearOutput();
         outputText("你耸了耸肩，把药水放回了[inv]里。也许以后再说吧……你现在可不想应付一个发疯的索菲。");
         menu();
         _g = get_sophieBimbo();
         addButton(0,"继续",function():void
         {
            _g.approachBimboSophieInCamp();
         });
      }
      
      public function letDebimboSophieGo() : void
      {
         clearOutput();
         outputText("你决定最好还是放索菲走。她静静地待了很久，最后才用她那双蓝色的大眼睛看着你，眼神中混合着奇怪的憎恶和惊奇。没有再犹豫，她转过身，匆匆跑开了，你猜是回高山去了。");
         outputText("[pg]也许你有一天还会见到她。不过以她那样的身体……你怀疑她在野外能有多“成功”。");
         outputText("[pg]带着巨大的奶子和被改造成无脑花瓶的屁股，她还能爬上山吗？");
         if(get_player().lib >= 50)
         {
            outputText("[pg]你的脑海中浮现出她那对弹跳的乳房四处晃荡的画面，她那巨大的丰满屁股不断地把她拉向无情的地面，那里充满了充满欲望的怪物和恶魔，它们渴望着操她，用它们那跳动的、充满精液的阴茎在她体内得到满足，直到她快要被撑爆。你想象着她那张漂亮的无脑花瓶脸完全累得通红，舌头从因为吸吮阴茎而肿胀的嘴唇间伸出喘气，这是为了维持她那罪恶的性爱娃娃身体进行高空飞行所必须付出的努力。");
            if(get_player().cor < 40)
            {
               outputText("你连连眨眼，试图把这些无聊的念头赶出脑海，但还是被激起了性欲。");
               dynStats(DynStat.Lust(10));
            }
            else
            {
               outputText("[pg]你任由这些幻想在脑海中狂奔，想象着三个趁虚而入的牛头人轮奸着因飞行而精疲力竭的索菲；他们那带有螺纹、龟头膨大的肉棒彻底改造着她那顺从的小穴和痉挛的屁眼，而她则无助地在喉咙深处那根跳动的马屌周围发出咕噜声。那两个双管齐下插着她小穴的牛头人发出咕噜声，他们那肿胀得像西瓜一样大的精囊和颤抖的黑色会阴互相摩擦着，狂热地比赛看谁能先射精，把这只无脑花瓶鸟变成他们私人的精液垃圾桶和生育奴隶。");
               outputText("[pg]随着牛头人越来越接近高潮，释放过去两个月里在他们肿胀的睾丸中积累的疼痛压力，空气中混合着小穴淫液和马匹麝香的信息素气味变得越来越令人窒息。他们疯狂的节奏，从粗暴的抽插变成了直捣黄龙，显示出他们是多么渴望占有这个充满母性魅力的鹰身女妖，她的身体只适合取悦肉棒和生下更多的孩子。拥有这样一匹多产的“母马”，意味着他们不断扩张的牛头人精液工厂将再也不会因为憋着精液而隐隐作痛。");
               outputText("[pg]突然，那个操着索菲脸的牛头人发出一声巨大的咆哮，粗大如海绵般的马屌撑开了她那已经被折磨得变了形的黄色嘴唇，浓稠的精液脉冲般地冲向完全张开的膨大龟头。它阻断了任何空气进入索菲疼痛肺部的希望，一个野兽般的肉锥直接推入她的胃里，滴着精液，精液管指向它最深、最饥渴的深处。当滚烫的精液从马肉塞中涌出时，索菲蓝色的眼睛翻白，完全被牛头人的催情睾丸汁所淹没。她感觉不到每一层越来越厚的螺纹肉棒刮过她的牙齿，迫使她的下巴越张越大的疼痛，也感觉不到牛头人膨大的龟头拉扯着她狭窄的食道试图逃跑的疼痛。牛头人完全沉浸在胜利的高潮中，将他两英尺长的肉棒全部插入索菲的喉咙，她的鼻子紧紧地压在他野兽般的胯部，唾液在牛头人迅速干瘪的黑色睾丸上起泡。索菲亚立刻对牛头人的精液做出了反应，精液让她的胃越来越亮，越来越鼓，她那饱受摧残的肉棒容器强有力地收缩着，受虐狂般的高潮折磨着她，将她重重地压在地上，并将她那暴露在外、长满尾羽的翘臀高高翘起，迎向充满麝香的空气，以求更深的插入。粗大、带有深色螺纹的牛头人肉棒在她紧致的屁眼和柔软的小穴中进进出出，产生更多的挤压颤抖，在她高潮时进一步挑逗着她体内的肉棒。");
               outputText("[pg]剩下的两个牛头人，无法承受鹰身女妖起伏的肛门和小穴肌肉通过他们极度磨损、肿胀的马屌传来的火热感觉，发出了一声咆哮，甚至盖过了那个仍在射精的牛头人，他正享受着用他作为“母马”的无数未来精液中的第一批填满她。与此同时，在索菲的后庭，当只隔着一层薄薄的肛门壁的两个牛头人肉棒开始射精时，他们感觉到咕噜咕噜的精液洪流离开每个牛头人汗水浸透的马睾丸，变成令人愉悦的振动，随着精液喷涌到他们互相挤压的跳动包皮上而增加。这种刺激随着每个牛头人有节奏收缩的会阴使他们的肉棒反复抽动，并通过肛门壁美妙地压在另一个牛头人被困的阴茎上而增长，进一步增强了他们期待已久的射精。索菲的身体陷入了狂喜的痉挛，她感觉到两头公牛的龟头在她体内膨胀，在<i>所有</i>正确的位置摩擦，只是因为她不可思议的鸟类肺部才保持清醒。尽管没有赢得“母马”，但牛头人们并不后悔，因为他们体验到了他们两个充满种子的龟头和带有螺纹的牛头人皮肤在鹰身女妖紧致的包裹中互相摩擦。这驱使他们两人最后一次用力插入，尽可能深地刺穿她的屁眼和小穴。两根完全被包皮包裹的肉棒拍打索菲屁股的声音在空气中回荡，牛头人们开始发出轻柔的哞哞声，高潮淹没了他们，喷射液体的声音越来越大。");
               outputText("[pg]随着第二根肉棒爆发，索菲的视线变得暗淡，几乎像消防栓一样加压的高潮填满了她的屁股，确保了探索肛门的牛头人的种子会和另一个操她头骨的牛头人的精子在她怀孕的肚子里成为好朋友。至少在两股碰撞的精液决定离开索菲肚子温暖的范围之前是好朋友。胜利的牛头人嫉妒地咕噜了一声，看到另一头公牛强效的肛门增强喷射迫使他自己那波令人陶醉的公牛面糊从索菲被烤串般插着的嘴里喷回他身上。它浸透了他毛茸茸的胯部，然后在他颤抖的蹄子附近积成水坑。第三头公牛插在她颤抖的小穴里，当他将膨大的龟头撞击她的子宫颈时，索菲晕了过去，用吸吮、海绵状、带有柔软脊状突起的马肉完全拥抱了她敏感子宫口的所有侧面。残酷的龟头柱塞运动让索菲的小穴将女性体液喷满全身，浸透了入侵的肉棒，让性爱的声音听起来更加淫荡；她身体本能的收缩是一种机制，将任何释放的精子吸入她女性特征的最深处，在那里它肯定会让饥渴的卵子受孕。正如自然界所预期的那样，与索菲微小的开口相比，牛头人龟头的巨大尺寸确保了离开变宽的尿道的每一滴精子都直接进入了她不受保护的子宫……至少在从她满溢的婴儿洞中溢出的多余精子冲破牛头人龟头的真空密封之前。射精、哞哞叫和难闻的湿润液体被泵送的声音如此之大，以至于其他牛头人从附近的洞穴中出现，聚集在周围，见证一匹新“母马”加入牛群。当滚烫的精液和精子像河流一样在索菲的腿周围滴落时，她暴露在外的身体和羽毛的其余部分被层层黏黏覆盖，聚集的牛头人以颜射的方式为她洗礼，正式欢迎她加入牛群。最终，轮奸结束了，三个牛头人都拔出了肉棒，伴随着湿润的“SCLUUUUUUUUURPS”声在山间回荡，他们带有螺纹的马屌变得疲软，乌黑的睾丸现在只有棒球大小。");
               outputText("[pg]胜利的牛头人高兴地咕噜着，抓住他的新“母马”爪子上方一点的地方，开始把她拖回牛头人居住的错综复杂的洞穴网络。恢复意识后，新母马结结巴巴地——将非人量的精液咳到她枕头般的乳房上；这正是从她其他即将永远变成牛头人大小的精液垃圾桶孔中渗出的同一种液体。她向天空伸出手，无声地用嘴型说着[say: 求、求求你，[name]——救……救命，]手无力地垂入洞穴的阴影中，再也看不到白天的光芒。");
               outputText("[pg]你从幻想中变态地笑了，被它彻底激起了性欲。");
               dynStats(DynStat.Lust(25));
            }
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,283,1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function kissSophieRecruitment() : void
      {
         clearOutput();
         outputText("你用你所知道的最好的方式让她闭嘴——把你的嘴唇贴在她的嘴唇上，你非常清楚她那充满欲望的口红的效果。索菲回应了你的举动，在品尝你的同时，用舌头锁住你的舌头，用她的另一组嘴唇摩擦着你那挺立的阴茎。");
         outputText("[pg]你抓住她那充满母性的臀部，引导它们向上贴紧你那变硬的肉棒。索菲很乐意让你掌控局面，俯下身将她美丽的胸部压在你的[chest]上。你抬起她的屁股，然后将它重重地拍回你那蓄势待发的鸡巴上");
         if(get_player().cockTotal() > 1)
         {
            outputText("，你的第二根阴茎滑入她的臀部之间");
         }
         if(get_player().cockTotal() > 3)
         {
            outputText("当其他人挤向她时");
         }
         outputText("。索菲发出愉悦的叫声，差点吵醒了整个街区——考虑到你的邻居，这可不是件好事。你迅速再次品尝她的嘴唇，让她闭嘴，同时开始向上猛烈地捣入她饥渴的阴道。");
         outputText("[pg]你贪婪的龟头挤压着你这位长满羽毛的熟女紧致的内部，随着你[hips]的每一次推拉，挤压着她天鹅绒般的肉壁。这位玫瑰色的鹰身女妖靠在你身上，在你将所有肉欲的注意力集中在面前跳动的臀部时，温柔地在你耳边低语。");
         outputText("[pg]你们俩瘫倒在床上，在经历了一夜美好的性爱后筋疲力尽。索菲躺在你的怀里，用手指在你的胸前画着圈。");
         outputText("[pg][say:你这里布置得挺可爱的，亲爱的。如果能和你待在一起，我不介意搬离那些鹰身女妖。]");
         dynStats(DynStat.Lust(20));
         menu();
         addButton(0,"当然",sophieRecruitmentFinale);
         addButton(1,"否",getOutSophieRecruitment);
      }
      
      public function harvestEggs() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你问索菲，她在这里的时候是否有可能产下特定颜色的蛋。");
         outputText("[pg][say: 用湖泊的魔法？当然，]她打着哈欠，伸了个懒腰说道。[say: 我的一些姐妹以前经常来这里，这样她们就能怀上蛋，然后偷偷卖掉。你想要什么颜色的？]");
         eggSelector();
      }
      
      public function get_pregnancy() : PregnancyStore
      {
         return get_game().sophieScene.pregnancy;
      }
      
      public function getOutSophieRecruitment() : void
      {
         clearOutput();
         outputText("入侵你的营地是一回事，但索菲越界了，她以为她想什么时候和你做爱都可以。你把她从你身上推开，站起来宣布你需要性爱的时候自然会做，而不是在她想要的时候。这只可怜的鸟拼命点头，对整个事件感到无比尴尬。");
         outputText("[pg][say: 绝对的，亲爱的，我们再也不提这事了。我现在就走。]");
         outputText("[pg]说完，她冲向营地上方，飞回了她在高山上的家。你本来还做着那么美妙的梦呢。");
         dynStats(DynStat.Lust(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,754,1);
         doNext(playerMenu);
      }
      
      public function fuckFollowerSophie() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         var _loc2_:int = get_player().cockThatFits2(get_sophieBimbo().sophieCapacity());
         clearOutput();
         if(get_sophieBimbo().sophieIsInSeason())
         {
            outputText("索菲把你拉进她羽毛般柔软的怀抱，指尖性感地探索着你身体的每一寸。她声音沙哑地咕哝着，[say: 这么说你想帮索菲妈妈变成真正的妈妈，是吗？]她抓住你的手，塞进她丰满的双腿之间，直达她湿漉漉的阴阜。[say: 别让我等太久……你弄得我……浑身燥热……]");
         }
         else
         {
            outputText("索菲坏笑着走近，指尖漫不经心地探索着你的身体。她声音沙哑地咕哝着，[say: 这么说，你想和索菲妈妈找点乐子，是吗？]她张开丰满的双腿，刚好让你看到她阴阜上闪烁的湿润。[say: 好吧，让我们看看你有多像个" + get_player().mf("男人","\'男人\'") + "……]");
         }
         outputText("你毫不犹豫地脱下你的[armor]，将你的" + get_player().cockDescript(_loc1_) + "展现在索菲面前。");
         if(get_player().cockArea(_loc1_) <= 5)
         {
            outputText("[pg]她窃笑着，[say: 就凭这小东西也想操我？" + get_player().mf("我还以为你是个男人，但这看起来就像个小女孩的阴蒂！","我知道你是个双性人，但也许你应该把这小东西变成一个真正的阴蒂！") + "]她戳了戳你那女孩般的阴茎，评论道，[say: 它有它自己可爱的地方，虽然我觉得我不会有什么感觉。]她的手指在它的下方挠痒痒，咯咯笑着，[say: 我可以一整天都玩这个娇小的女孩鸡巴……]");
         }
         else if(get_player().cockArea(_loc1_) <= get_sophieBimbo().sophieCapacity() / 2)
         {
            outputText("[pg]她问道，[say: 这么说这就是你想用来操我的东西，是吗？这可不怎么让人印象深刻。]她的手包裹住你的" + get_player().cockDescript(_loc1_) + "，轻轻地挤压着，直到它在她的手掌中勃起。[say: 噢，不过它看起来确实很不错，很有活力，不是吗？]她抚摸着它的下方，对它咕哝着，全神贯注地看着你完全勃起。");
         }
         else
         {
            outputText("[pg]她倒吸了一口气，[say: 哇，你这根鸡巴又大又粗，不是吗？我能明白为什么年轻女孩会渴望这样的巨兽了。]她慢慢地抚摸着它，掂量着这根阴茎相当大的重量和粗细。[say: 这么巨大的肉棒……我敢打赌它一定很棒，很有活力，]她评论道，同时它在她的握持中变得更粗了。");
         }
         outputText("[pg]索菲赞赏地拍了一下你的" + get_player().cockDescript(_loc1_) + "，然后转过身，弯下腰，双手放在膝盖上，屁股翘在半空中。她来回扭动着，那淫荡丰满的臀部抖动着，在每次摇摆的顶点都能听到清脆的拍打声。她发出呼噜声，[say: 如果你觉得自己够[man]，就来拿吧！]");
         outputText("[pg]你向前扑去，但索菲后退了，翅膀拍打着，她的臀部直接推向你。她那圆润的屁股把你逼退到众多立石中的一块上，把你夹在阴户和坚硬的石头之间。伴随着嘈杂的挤压声，你的" + get_player().cockDescript(_loc1_) + "直接滑进了索菲的");
         if(get_sophieBimbo().sophieIsInSeason())
         {
            outputText("喷涌着汁液、渴望精液的");
         }
         else
         {
            outputText("湿滑的");
         }
         outputText("阴户。突如其来的插入让你大声呻吟，拼命抓住索菲的屁股。她的屁股几乎吞噬了你的指尖，那宽阔的臀部在你的触摸下美妙地下陷。你几乎没有时间去注意这个细节，因为你的大部分注意力都集中在紧紧抓住你的肉壁上，伴随着熟练的性技巧滑动。索菲的臀部缓慢地滚动着，以最令人愉悦的方式把你钉在石头上。");
         outputText("[pg]鹰身女妖的翼尖不时地扑腾着，这也许是这位主母在岩石间享受这场避开视线的淫荡性爱时，唯一能看出她有多享受的迹象。她转过头，越过肩膀开始说话，话语下带着一种不自然的震颤。[say: 哦，[name]，先别射。在我的小穴高潮之前，你不能射，即使感觉好得让人发疯——即使它让你的鸡巴感觉好到你几乎站不住。快感只会越来越好……越来越好，直到你最终让我高潮。然后你会射得很猛，连路都走不动。]她调皮地咧嘴一笑，然后呻吟着，咬着下唇，把你按在石头上摩擦。");
         if(get_player().get_inte() < 50)
         {
            outputText("[pg]突然");
         }
         else
         {
            outputText("[pg]即使你知道她在用她的强迫能力");
         }
         outputText("，她的话仍然影响着你。她的小穴感觉……太……美妙了。它是如此火热湿润，你几乎觉得你现在就能射出来。你的[legs]摇晃着，但索菲只是更用力地向后推，用你的" + get_player().cockDescript(_loc1_) + "和你的[butt]在巨石上的摩擦力支撑着你。鹰身女妖看着你的表情，她的臀部继续缓慢地滚动，当快感开始积聚时，感觉到你的手指抽搐并揉捏着她巨大的臀部。你试图保持镇定，但这简直太他妈爽了！她丝滑的裂缝是如此温暖、湿润，而且简直……色情。慢慢地，你通常会高潮的临界点逼近了，但并没有出现标志着释放的痉挛性收缩，你的精液被紧紧地憋在体内，比地精子宫里的精子还要紧。");
         outputText("[pg]索菲开始咕哝，动作也变得更加用力。她的裂缝重重地撞击着你，她叫喊着，[say: 操，是的！噢，是的，感觉真好。你是个好[boy]，现在还没射。]那种强迫的语气又回来了。[saystart]按摩我的屁股，然后");
         if(_loc2_ >= 0)
         {
            outputText("操它");
         }
         else
         {
            outputText("用手指插我的屁眼");
         }
         outputText("当我操你的时候，[name]！[sayend]她命令道，用权威的眼神盯着你。");
         if(_loc2_ >= 0)
         {
            outputText("你挪动身体，将你的" + get_player().cockDescript(_loc2_) + "顶到位，正好迎上索菲蠕动的直肠，让它包裹住你的肉棒。它滑了进去，她甚至连一声呜咽都没发出。");
         }
         else
         {
            outputText("你犹豫地用拇指按压她的屁眼，直到她蠕动的直肠压在上面，轻松地扩张开来，接纳了你入侵的手指。");
         }
         outputText("你不知为何越捏越紧，开始按摩起来，甚至能透过她薄薄的内壁感觉到自己的存在。");
         outputText("[pg]不过，你很难集中注意力。你本能地捏着她的屁股，向后瘫倒，双眼翻白，被快感淹没。你滚烫的精液在体内翻腾，乞求着释放，但<b>你不能——直到她高潮为止！</b>你的舌头伸了出来，因为这种感觉慢慢剥夺了你的理智，你唯一的工作就是用双手膜拜索菲的屁股，让她的阴道在你周围变得越来越湿润。如果你还能思考，你会庆幸这块石头如此光滑，但现在，你只是像个发情的婊子一样呻吟着。");
         outputText("[pg]鹰身女妖突然挤压自己的乳房，粗暴地捏着自己的乳头。她的内壁开始痉挛，索菲兴奋地尖叫起来，疯狂地拍打着翅膀。你被她高潮时翅膀的抽动拍打着，被羽毛扇得晕头转向，但你几乎感觉不到——因为你太专注于她收缩的阴道了。索菲的淫液从她肿胀的阴蒂中如潮水般喷涌而出。她向后仰着头，眼神似乎在说你应该专注于她的屁眼，但她抽搐的身体让这项任务变得困难，她呜咽着：[say:你让我高潮了，[name]！你让索菲妈妈高潮得好厉害！]");
         outputText("[pg]你从头到脚都在颤抖，感觉就像一个高压阀门突然被猛烈地拧开。一股被压抑的欲望从你的[balls]中沸腾而出，化作滑腻的波浪。索菲在性高潮的极乐中呻吟着，当滚烫、白色的爱液溅在她的子宫颈上时，她颤抖起来");
         if(_loc2_ >= 0)
         {
            outputText("和肠壁");
         }
         outputText("。你的手指深深陷入她柔软的臀部，不再是揉捏，而是占有欲极强地弯曲着，宣告对那丰满的臀部和下方迅速被填满的阴道的绝对所有权。");
         if(_loc2_ >= 0)
         {
            outputText("你把她的肠道塞满精液，同时也在她紧致的小穴里射满了精子。");
         }
         if(get_sophieBimbo().sophieIsInSeason())
         {
            outputText("她的阴道似乎把射入的精液都喝了下去，子宫颈张开，尽可能多地接纳。你能感觉到那股吸力，如果不是你已经处于令人神魂颠倒的高潮中，你肯定会比平时射得更猛。");
         }
         outputText("你的身体瘫软在她身上，唯一还在工作的肌肉是你下半身痉挛的肌肉，不断泵出新鲜的精液。你发出原始快感的呜咽，嘴角泛起白沫。");
         if(get_player().cumQ() >= 500)
         {
            outputText("索菲的肚子");
            if(get_player().cumQ() < 1000)
            {
               outputText("已经开始膨胀");
            }
            else
            {
               outputText("已经膨胀到了一个夸张的程度");
            }
            outputText("因为你射入的精液");
            if(get_player().cumQ() >= 4000)
            {
               outputText("而且还在变得更大");
            }
            outputText("。");
         }
         if(get_player().cumQ() >= 5000 || get_player().cumQ() >= 500 && get_sophieBimbo().sophieIsInSeason())
         {
            outputText("一大股白浊从她被狠狠肏过的肉洞里涌出，混合着精液浸湿了你的双腿。");
         }
         outputText("然后，你失去了意识，你的" + get_player().cockDescript(_loc1_));
         if(_loc2_ >= 0)
         {
            outputText("和" + get_player().cockDescript(_loc2_));
         }
         outputText("仍在狂喜中跳动。这次高潮真是太棒了……");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         if(get_sophieBimbo().sophieIsInSeason())
         {
            get_sophieBimbo().sophiePregChance();
         }
         menu();
         addButton(0,"继续",sophieVagFollowerFollowup);
      }
      
      public function forceSophieBlowjob() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_sophieBimbo().sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,748,FlagDict_Impl_.arrayReadInt(_loc2_,748) + 1);
         outputText("你抓住她，把她按倒在地上，索菲完全不理解的惊讶表情帮了你大忙。她倒在地上，撅着嘴，粗壮的大腿弯曲着试图帮助她站起来。你责骂她——如果她不想吸你的老二，她就不应该搬进你的营地。相反，她应该感到高兴，因为你决定允许她留在你的营地里，只为了一个简单的口交。你指着她渗出淫液的小穴，提醒她，她显然和你一样享受这一切，她应该开始工作，在满足你的同时照顾自己的需求。");
         outputText("[pg]索菲抱怨着，但她的一只手确实依偎在她" + (get_noFur() ? "" : "长满羽毛的") + "大腿之间，另一只手伸向你的腹股沟，掏出你的" + get_player().cockDescript(_loc1_) + "。她透过愤怒的眉毛抬头看着你，眉毛因隐藏的欲望而略微柔和。[say:我会给你口交……这次，]她宣布，");
         if(get_player().balls > 0)
         {
            outputText("几乎带着渴望的注意力抚摸你的[balls]，");
         }
         else
         {
            outputText("几乎带着渴望的注意力摩擦你的长度，");
         }
         outputText("[say:但别养成习惯，否则你会孤独地醒来。]索菲的舌头试探性地滑过你的" + get_player().cockHead(_loc1_) + "。[say:至少你尝起来不错。]滑溜溜的肌肉再次滑过你敏感的肉棒皮肤，这次时间更长，在金色的嘴唇靠近时，在下面徘徊。");
         outputText("[pg]你不耐烦地将手指穿过她羽毛般的头发，让她靠近。她闪亮的琥珀色嘴巴撞到了你的" + get_player().cockHead(_loc1_) + "，随后是不抵抗的鹰身女妖发出的惊讶的唧唧声。在第一次接触时，她闪亮的金色口红带来的电流般的刺痛感击中了你，导致你的心跳加快，你的" + get_player().cockDescript(_loc1_) + "在她的手中因兴奋而略微变粗。你不由自主地用力推，将索菲丰满的吸精唇撑开，包裹住变粗的肉棒，她的唾液润滑了缓慢而稳定的进入她嘴里的旅程。就像变魔术一样，她开始自己向前推，在她的渴望中几乎挣脱了你的抓握。她的嘴平滑地向下滑动");
         if(get_player().cockArea(_loc1_) <= 60)
         {
            outputText("尽可能深，甚至在你进入她的喉咙一部分后，她才没有空间");
         }
         else
         {
            outputText("一直到你的根部，一寸又一寸的肉棒消失在她柔软的喉咙里");
         }
         outputText("。");
         outputText("[pg]索菲紧紧地用她那涂着金色唇彩的嘴唇包裹着你的肉棒，她用充满情欲的眼神抬头看着你，下面传来的嘈杂的吧唧声让你对她的状态毫无怀疑。那燃烧着、激发情欲的化妆品似乎越来越多地渗入你的体内。这让你的全身感到发热、滚烫，准备好操她那甜美" + (get_noFur() ? "" : "、长满羽毛") + "的屁股。你准备拔出来，直到你看到那丰满的金色嘴唇紧紧地锁在原位，顺滑地摩擦着你" + get_player().cockDescript(_loc1_) + "的每一寸。看到这一幕，你强有力地跳动着，在她口腔的拥抱中弯曲，让鹰身女妖发出一阵愉悦的咯咯笑声，当她在你的男性象征下自慰时，这笑声被愉悦的呻吟声打断。");
         if(get_player().cockTotal() == 2)
         {
            outputText("你多出来的肉棒拍打着她的脸颊，挂在她的耳朵上，慢慢地将先列腺液漏进她柔软的头发里。");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("你多出来的肉棒拍打着她的脸颊，挂在她的耳朵和肩膀上，慢慢地将先列腺液漏进她柔软的头发里。");
         }
         outputText("[pg]索菲突然抓住她那丰满、充满母性的大乳房之一，热情地抚摸着自己。她的嘴唇微微张开，刚好与你的" + get_player().cockDescript(_loc1_) + "分开，并在她自慰时发出一声淫荡的呻吟。那颤抖的舌头在你的下方挠痒痒，这感觉非常令人愉悦，而现在涂满你肉棒的金色光泽更是增强了这种感觉。你体内有一种刺痛、脉动的加速感。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]感觉几乎要满了，被液体的重量绷得紧紧的，乞求着被泵出");
         }
         else
         {
            outputText("感觉很紧，就像你被一种温暖的液体重量填满，正乞求着被释放出来");
         }
         outputText("喷满了这位充满母性的鹰身女妖的脸。你兴奋地大声呻吟，双眼紧盯着索菲那丰满的臀部和粗壮的大腿，它们部分被她颤抖的尾羽遮挡着。");
         outputText("[pg]口水和唾液滴落下来");
         if(get_player().balls > 0)
         {
            outputText("你的[sack]上，然后流过");
         }
         outputText("你的双腿。索菲的眼睛微微翻白——没有完全翻白，但足以自豪地展示她高潮时那极致的快感。她那糖浆般的淫液溅落在下方荒芜的土地上，几秒钟后，声音变成了更湿润、泥泞的飞溅声。鹰身女妖的喉咙紧紧地收缩着，包裹着你。她紧闭双唇，在狂喜中哼唱，随着她自己的高潮平息，她开始慵懒地吸吮你的" + get_player().cockDescript(_loc1_) + "。你强迫她加快速度，按着她的头前后抽插，你太渴望释放了，根本不在乎她是否舒服。从重新开始的稳定、黏糊糊的抽插声来看，她似乎也不怎么在乎。");
         outputText("[pg]索菲突然用她那涂着金色唇彩的嘴唇紧紧地包裹着你，并更用力地吸吮。她向上翻着眼睛乞求你的精液，表情比你想象的鹰身女妖主母还要淫荡，无声地要求你在她体内释放。你的[hips]向前猛冲，将你的" + get_player().cockDescript(_loc1_) + "深深地捣进她的脸里，你的" + get_player().cockHead(_loc1_) + "感到刺痛，在高潮中膨胀。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("" + get_player().knotWord(_loc1_) + "在她的嘴唇后膨胀起来，像一个金色的球体，将你困在她湿滑的嘴里，确保你所有咸咸的精华都会流进她的喉咙。");
         }
         outputText("[pg]精液几乎立刻从你的尿道喷射而出，长长的精液长矛直接喷进索菲的喉咙，在那里它可以滴入她的肚子里。你张开嘴，闭上眼睛，立刻想象自己被一群鹰身女妖女孩包围，大多数都怀孕了，一边亲吻你，一边用她们的鸟穴一次又一次地榨取你的肉棒。药物引发的幻想确保你的高潮持续的时间比原本更长，你继续将滑溜溜的精液直接喷发到索菲的胃里。");
         if(get_player().cumQ() >= 500)
         {
            outputText("当她的腹部因为你注入的液体而开始隆起时，她发出嘈杂的咕噜声");
            if(get_player().cumQ() >= 2000)
            {
               outputText("，但这仅仅是个开始。你把她的肚子胀成一个淫秽的、几乎是球形的形状");
            }
            if(get_player().cumQ() >= 4000)
            {
               outputText("，然后再射出一些，在你完成淹没她消化系统的每一寸之后，泛滥的精液被迫从她的鼻孔中逃出");
            }
            outputText("。");
         }
         outputText("[pg]几乎是带着遗憾，你");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("拉扯着索菲紧锁着肉棒的嘴，但你的" + get_player().knotWord(_loc1_) + "就是不肯动弹。你坐在那里等待它消退，感觉像过了一个世纪，而她的口红并没有帮上什么忙——似乎你的精液在整个过程中一直在流动和滴落，你的" + get_player().cockDescript(_loc1_) + "一心想要让鹰身女妖的嘴受孕。尽管如此，你最终还是设法“砰”的一声挣脱了，尽管这拉伸了索菲的下巴，并在你的营地周围回荡。");
         }
         else
         {
            outputText("将你痉挛的肉棒从她的金门中抽出，最后几滴精液滴在她撅起的下唇上。");
         }
         outputText("[pg]鹰身女妖红着脸抬头看着你，咽下最后一口浓稠的精液，同时继续自慰，直到迎来第二次令人窒息的高潮，高潮席卷全身时，她的尾羽都在颤抖。你顺手捏了捏她的乳房，然后穿上衣服，提醒她刚才很享受。索菲透过沾满白浊的嘴唇抗议道，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,748) == 1)
         {
            outputText("[say:啊……没……没有……如果你能回报我的话，我会更享受的！]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,748) < 4)
         {
            outputText("[say:啊……我……我不知道我还能忍受多少次这种待遇！]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,748) < 8)
         {
            outputText("[say:啊……你……你打算什么时候回报我？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,748) == 8)
         {
            outputText("[say:啊……我想……我已经受够了……]");
         }
         else
         {
            outputText("[say:啊……其实……我想……[b:我想如果你不对我好一点，我可能会离开。]]");
         }
         outputText("[pg]你心满意足地叹了口气，穿好衣服。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerSophieMainScreen() : void
      {
         var _g1:Camp;
         var _g:Camp;
         clearOutput();
         get_sophieBimbo().sophieSprite();
         if(get_sophieBimbo().sophieIsInSeason() && get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            outputText("当索菲听到你叫她时，她整个柔软的身体都明显地颤抖和晃动起来。尽管她极力尝试，但她走向你的步伐还是太快了，显得不够性感，她的尾羽抽动着，向你扇起一阵混合着信息素和她饥渴性欲的微风。她一只手叉腰，稍微展示了一下她摇晃的臀部和巨大的乳房，同时向你抛了个媚眼，半眯着眼睛盯着你，那双充满诱惑的眼睛试图激起你更多的欲望。她说话时，手指按在你的[chest]上，缓慢而诱人，试图用嘴唇的力量来强调每一个字。[say: 那么，你想见我？那太好了，因为索菲妈妈也想见你。]");
            outputText("[pg]她的手顺着你的肚子一路向下，来到你的[oneCock]上，深情地摩擦着，同时将她那惊人的胸部紧贴着你。[say: 你看，你需要让索菲妈妈重新成为“妈妈”，[name]。你真的必须这么做，这<b>非常</b>重要，你同意吗？]当她抓住你的[cockHead biggest]时，你立刻僵住了，几乎发现自己要对她的话点头同意了。[say: 你的肉棒似乎同意了，[name]。它把你拉向我，怂恿你把我灌满卵，对吧？]她一边继续摩擦你的阴茎，一边轻笑着。[say: 只要把它插进去，然后喷射，直到我完全被你的精液填满，然后怀上你的孩子。]她继续抚摸着你，你意识到，由于她比平时更饥渴，她自然会试图强迫你和她做爱，而且");
            if(get_sophieBimbo().bimboSophie())
            {
               outputText("恢复了智力让她在这方面又变得相当熟练了");
            }
            else
            {
               outputText("她在这方面相当熟练");
            }
            outputText("。[say: 哦，来吧，[name]！就像个乖[boy]一样给我吧，好吗？我甚至可以给你一点特别的奖励。<b>快。给。我。</b>]");
            outputText("[pg]你猜索菲现在绝对不会接受任何不能让她怀孕的做爱方式，但你可以拒绝……或者选择那个特别的奖励，而不是平常的做爱。");
            dynStats(DynStat.Lust(20));
            menu();
            addButton(0,"外貌",sophieAppearance);
            if(get_player().hasCock())
            {
               if(get_player().hasCockThatFits(get_sophieBimbo().sophieCapacity()))
               {
                  addButton(1,"阴道交",fuckFollowerSophie);
                  addButton(2,"特别奖励",sophieSpecial);
               }
               else
               {
                  outputText("[pg]你太大了，插不进她里面！");
               }
            }
            else
            {
               outputText("[pg]你需要一根阴茎才能操她！");
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie")
            {
               addButton(8,"不共眠",sleepWithSophieToggle);
               outputText("[pg]你现在晚上和索菲同床共枕，但如果你想的话，也可以把她赶出去。");
            }
            _g = get_camp();
            addButton(14,"返回",function():void
            {
               _g.campFollowers();
            });
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
            {
               outputText("当你靠近时，索菲向后靠在她的巢里，展示着她那显眼、赤裸的F罩杯。她像往常一样一丝不挂，毫不羞耻地张开她的鸟腿坐着，露出被柔软的白金羽毛包裹着的湿润小穴。[say: 嗨，" + get_player().mf("帅哥","小可爱") + "。索菲妈妈能为你做点什么？也许是来我热情的翅膀里抱抱；或者是为了更……刺激的事情？]");
            }
            else
            {
               outputText("当你靠近时，索菲向后靠在她的巢里，展示着她那显眼、赤裸的DD罩杯。她像往常一样一丝不挂，端庄地交叉着她的鸟腿坐着，向你隐藏起她那湿润的小穴。[say: 嗨，" + get_player().mf("帅哥","小可爱") + "。索菲妈妈能为你做点什么？]");
            }
         }
         else
         {
            outputText("当你呼唤她的名字时，索菲那涂着金色唇彩的嘴唇向上弯起，露出一个微笑。她不慌不忙地从巢里走出来，然后滑翔到你身边。");
            outputText("[pg][say: 需要索菲妈妈帮忙吗？]她柔声说道。");
         }
         menu();
         addButton(0,"外貌",sophieAppearance);
         addButton(1,"交谈",sophieTalkMenu).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,755) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) == 0 || !get_player().hasCock(),"你不确定她是否很想和你说话。");
         addButton(2,"性爱",sexWithFollowerSophie).sexButton();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            outputText("[pg]<b>索菲的蛋就放在附近。</b>");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            addButton(5,"女儿",get_sophieBimbo().daughterCheckup);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            addButton(9,"同睡",sleepWithSophieToggle);
         }
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            addButton(9,"独睡",sleepWithSophieToggle);
            outputText("[pg]你现在晚上和索菲同床共枕，但如果你想的话，也可以把她赶出去。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农场工作",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 1)
         {
            addButton(10,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1102) == 0)
         {
            addButton(11,"收获蛋",harvestEggs);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1102) == 1)
         {
            addButton(11,"更换蛋",changeEggs);
            addButton(12,"停止收获",stopHarvest);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            _g1 = get_camp();
            addButton(14,"返回",function():void
            {
               _g1.campFollowers();
            });
         }
         else
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
      }
      
      public function eggSelector() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(eggColors.length))
         {
            addButton(_loc1_,eggColors[_loc1_],(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var selected:Array = param2;
               return function():void
               {
                  _g[0].postEggSelector(selected[0]);
               };
            })([this],[eggColors[_loc1_]]));
            _loc1_++;
         }
      }
      
      public function debimboSophieBeatsYouUp(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         outputText("你向后倒去，一屁股摔在[butt]上，无法抵挡鹰身女妖的攻击。她居高临下地看着你，怒目而视，脸因为强烈的憎恶而涨得通红。[say: 你他妈的到底有什么毛病！？你怎么……你为什么要做这种事——对一个可怜的老太婆？你……你把我变成了一个怪物！我——我是个畸形儿！]");
         outputText("[pg]索菲把脸埋在双手里开始哭泣，眼泪很快从指缝间流下，弄脏了她白金色的羽毛。");
         menu();
         addButton(1,"道歉",apologizeToDebimboSophie);
         addButton(2,"为何这么做",whyIDidItToDebimboSophie);
         addButton(3,"放她走",letDebimboSophieGo);
      }
      
      public function changeEggs() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你问索菲是否愿意改变她为你产下的蛋的类型。");
         outputText("[pg][say: 我[i: 更]希望你能亲自把我操得满肚子都是蛋，但我想我可以为了你改变一下……]");
         eggSelector();
      }
      
      public function bimboSophieAgain() : void
      {
         clearOutput();
         outputText("哦不，去他妈的！你向前猛扑，一把抓住还在恢复中的鹰身女妖，同时从腰带上抽出另一瓶傻妞液。[say: 什——不！]她大叫，但太迟了！你拔掉软木塞，把这瓶能杀死脑细胞的烈酒灌进她的喉咙，捂住她的嘴，捏住她的鼻子，直到她像个真正的好荡妇一样把酒全——部吞下；空酒瓶在地上滚动，空气中回荡着湿润的吞咽声。大功告成，她瘫倒在地，随着药水发挥作用，她的双眼再次因为熟悉的困惑而对眼，大脑被重新烧成了一片空白。");
         outputText("[pg][say: 宝……宝贝？]片刻后她问道，用睁得大大的、呆滞的眼睛抬头看着你。她的手滑向她湿漉漉的下体，一边看着你一边心不在焉地揉弄着。[say: 想要，那个，做爱还是什么的吗？]");
         outputText("[pg]好吧，危机解除了！");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,745,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,746,0);
         get_player().consumeItem(get_consumables().BIMBOLQ);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            get_sophieBimbo().approachBimboSophieInCamp(false);
         }
      }
      
      public function beatUpDebimboSophie(param1:Boolean) : void
      {
         clearOutput();
         outputText("索菲踉跄后退，无法抵挡你狂怒的攻击。你在这个鹰身女妖倒下前抓住了她，问她现在他妈的准备好听人说话了吗。她挑衅地把头扭开，不看你，尽管她已经虚弱得无法反抗了。");
         menu();
         addButton(1,"道歉",apologizeToDebimboSophie);
         addButton(2,"为何这么做",whyIDidItToDebimboSophie);
         addButton(3,"放她走",letDebimboSophieGo);
         if(get_player().hasItem(get_consumables().BIMBOLQ))
         {
            addButton(4,"再次变无脑花瓶",bimboSophieAgain);
         }
      }
      
      public function beatSophieAroundYouMonster() : void
      {
         clearOutput();
         outputText("哦不，去他妈的！你准备好你的[weapon]，打算把这个鹰身女妖荡妇打醒。看到你充满敌意的动作，索菲深吸了一口气，准备自卫。");
         outputText("[pg][say: 我要让你为此付出代价！]");
         var _loc1_:Sophie = new Sophie();
         _loc1_.bimboBrawl = true;
         _loc1_.onDefeated = beatUpDebimboSophie;
         _loc1_.onWon = debimboSophieBeatsYouUp;
         _loc1_.createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         startCombat(_loc1_);
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你告诉她现在可以回营地了。");
         outputText("[pg][say: 感谢诸神，]她翻着白眼说道。[say: 再待在这里，我都要无聊死了。]她深情地亲吻了你的脸颊，然后展开巨大的翅膀，朝着传送门的方向飞去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1081,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function apologizeToDebimboSophie() : void
      {
         clearOutput();
         outputText("你决定向索菲道歉，说你不是故意让事情变得这么失控的……你不知道她会发生这么大的变化！你只以为药水会增强她的体格，也许会让她对你的追求更接受一点。");
         outputText("[pg]她默默地听着，你说话时她避开了你的目光。不过，你注意到，当你说话时，她的手慢慢地滑落，抚摸着她被赋予的新身体，仿佛第一次发现她增强的“资产”。这位白金发色的鹰身女妖颤抖着，她的手滑过她巨大的F罩杯，指尖轻轻抚摸着她突出的乳头，乳头在她的触摸下立刻变硬，准备好被把玩或吸吮。");
         outputText("[pg]当你解释完后，有很长一段时间的沉默。索菲继续避开你的目光，但你可以看出她稍微平静了一些，也许是被你的诚实所安抚。不过，最后她还是开口了：鹰身女妖女人用几乎只有耳语的声音平静地说，[say: 我回不去了。]");
         outputText("[pg]什么？");
         outputText("[pg][say: 看看我，]她声音颤抖地说，[say: 我这样根本飞不起来……就算能飞，其他女孩也会……哦，她们会说些什么啊。我回不了家了。]");
         outputText("[pg]她停顿了一下。然后，出乎你意料的是，她嘴角露出一丝苦笑。[say: 见鬼，反正我一直都想离开那座破山。我受够了那些女孩取笑我……叫我大奶荡妇。]索菲抬起头，目光锁定着你，[say: 好吧，既然你这么想让我留下来，我想你应该不介意我待在这里吧，[name]？反正我也没别的地方可去，而且也许至少你能欣赏我的新身材……我必须承认，它们还挺性感的，]她说着，托起了自己沉甸甸的双乳。");
         outputText("[pg][say: 也许我就在那边搭个窝，]她补充道，漫不经心地指着营地边缘一块被一圈石头遮蔽的空地。");
         outputText("[pg]你点点头，告诉索菲把这里当自己家就好。");
         outputText("[pg](<b>索菲已被移至“追随者”标签页！</b>)");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
   }
}

