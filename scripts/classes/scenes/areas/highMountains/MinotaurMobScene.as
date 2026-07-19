package classes.scenes.areas.highMountains
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class MinotaurMobScene extends BaseContent implements TimeAwareInterface
   {
      
      public function MinotaurMobScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function victoryMinotaurGangTitFuck() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("[say: 噢，男孩们，]你一边娇嗔着一边走上前，臀部摇曳生姿，展现出迷人的性感。[say: 我真该教教你们规矩。]你弯下腰，在离你最近的那个不听话的种马的两圈包皮之间紧紧捏了一把。他痛苦地闷哼了一声，你看着龟头因为突然涌入的血液而膨胀起来。你调侃道：[say: 现在，我想是时候给你们一些惩罚了。你们不觉得你们应该受到惩罚吗？][pg]");
         outputText("[say: 是、是的，妈妈，]被击败的野兽低声隆隆地说道。你松开他，看着他瘫倒回去，发出一声疲惫而如释重负的哞叫。这个可怜的男孩压抑得太久了，太饥渴了，所以你不介意稍微满足一下他和他的兄弟们。");
         if(get_player().minotaurAddicted())
         {
            outputText("当然，取悦他们也能让你得到你想要的——更多那种美味、奇妙的精液。");
         }
         outputText("[say: 太棒了。你们都是好孩子，我知道你们是的。现在过来。对，还有你——你们全都到妈妈这儿来。我要惩罚你们所有人。][pg]");
         outputText("你俯下身子");
         if(get_player().isBiped())
         {
            outputText("跪在地上");
         }
         else if(get_player().isTaur())
         {
            outputText("前腿着地");
         }
         else if(get_player().isGoo())
         {
            outputText("陷入你黏糊糊的下盘");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("盘起尾巴");
         }
         else
         {
            outputText("进入你的错误：未分类的下半身");
         }
         outputText("并解开你的[armor]，向这些饥渴的种马露出你的" + get_player().allBreastsDescript() + "。他们起初有些犹豫，害怕受到残酷的惩罚。你开始催眠般地上下晃动那对柔软的肉团，他们很快就忘记了谨慎。牛头人们靠拢过来，肉棒上流淌着先列腺液，顺着他们粗壮、布满褶皱的长度滴落。你嗅了嗅那滑溜溜的肉棒，饥渴地舔了舔嘴唇。这一定会很有趣。");
         outputText("[pg]最先进入你手臂范围内的两个“男孩”迎来了双管齐下的手交。他们舒服得直跺蹄子，在你不熟练却充满爱意的指尖引导下，慢慢地越靠越近。看到他们滴着液体的肉棒，你发出愉悦的娇喘，把他们拉得更近，直到他们触碰到你的[nipples]，用他们急需释放的先列腺液涂满你的胸膛。[pg]");
         outputText("[say: 哦，是的，你们这些男孩太调皮了。准备好接受惩罚了吗，我那充满欲望的怪物儿子们？]你呻吟着。他们郑重地点点头，虽然担心你会对他们的肉棒做什么，但又被你起伏的胸膛深深吸引，无法逃离。你坏笑着，将那两根肉棒拖过你胸前那对颤动的肉山，滑向你那深谷般的乳沟。两根跳动的肉棒在消失在那温暖如母性般的沟壑前相遇，你能感觉到它们随着每一次心跳在你胸前跳动。[pg]");
         outputText("你咯咯地笑着，[say: 我要惩罚你们，直到你们哭着求我原谅……把精液哭得妈妈的奶子和嘴上到处都是。]你说完，两只幸运的牛头怪对视了一眼，担忧的表情变成了会心的坏笑。他们一起把手放在你的肩膀上，臀部向内移动，让他们的肉棒以更好的角度操弄你的乳房。你看着那两个慢慢膨胀的龟头从你巨大的肉团之间探出头来，将他们麝香般的先列腺液滴进你的乳沟。[pg]");
         outputText("他们耐心地保持不动，知道你已经打败了他们，如果你愿意，完全可以惩罚他们。你用缓慢的、绕圈的舔舐来奖励他们的顺从，舔舐着离你最近的肉棒顶端。它在你的舌头上喷出一大团浓稠的先列腺液，你没有吞下这神仙般的液体，而是把它吐回了闪闪发光的肉棒上。这种混合物增加了已经从你胸部下方滴落的润滑液。他们的睾丸在阴囊内移动、翻滚，你可以看到肿胀的球体在准备喷发时翻滚着。这些家伙在无法自慰的情况下憋得太久了；这对他们来说简直是地狱。[pg]");
         outputText("你把手按在你的" + get_player().biggestBreastSizeDescript() + "两侧，将肉紧紧地挤压在那两根幸运的阴茎周围。牛头人们发出愉悦的哞哞声，立刻用另一大波先列腺液弄滑了你的[skinfurscales]，在他们适应你胸部的紧致之前，你开始把你沉重的爱之垫向上拖……最后向下。你慵懒地抚摸着他们被完全包裹的肉棒，享受着这带给你的对牛群的完全控制和支配感。他们剧烈地颤抖着，努力控制自己的身体为你保持静止。真是好孩子。[pg]");
         outputText("你加快了节奏，以此奖励这些耐心的种马。吞吐着肉棒的乳房上下起伏，不断滴落的先列腺液如雨点般落在地上，发出响亮的吧唧声。被困住的肉棒相互跳动、碰撞，而周围完美的牢笼则同时抚摸、爱抚着它们的整个长度。它们微微膨胀，变粗，反压在你的乳房上，你意识到它们快要爆发了。[pg]");
         get_images().showImage("minomob-won-titfuck");
         outputText("你向前倾身，用嘴唇包裹住一个膨胀的龟头，刚舔了一口，它就以撑破脸颊的力量爆发了。你尽可能多地吞咽，但紧接着下一波精液就撑开了你乳房之间的肉棒，喷射在你滴水的上颚。精液喷射、回流，从你的鼻子里涌出，你试图咽下这股浓精，让它流回你的乳沟。又有几股涌入口中的精液将你完全推离了肉棒，你放弃了，吞下你所得到的一切，而精液则把你的[hair]和[face]完全染成了白色。[pg]");
         outputText("甚至没有时间恢复。在第一匹种马把你浸透之前，第二匹种马就在你的脖子上爆发了。黏液顺着你乳房的曲线流下，把你一直到腹部都浸泡在奶油般、似乎永无止境的精液瀑布中。你时不时地俯下身子，舔舐着喷涌的精液，因为大脑的思考能力慢慢减弱，你的眼睛都变成了斗鸡眼。尽管如此，你还是设法让你的手忙碌起来，上下晃动你的乳房，以延长精液喷泉的时间。直到柔软的肉棒从你母亲般的拥抱中抽出，你才意识到他们刚才已经射完了。[pg]");
         outputText("你舔了舔嘴唇，摇摇晃晃地站着，感觉自己被虚假的幸福感冲昏了头脑。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 10)
         {
            outputText("还有那么多牛头人等着你去榨汁，这让你头晕目眩。不过，这也可能是牛头人的精液让你可怜的大脑变得混乱。你隐约记得你发誓要惩罚他们所有人，在你的“男孩们”采取主动之前，你用手抓住接下来的两匹种马，开始给他们打飞机，慢慢地怂恿他们靠近你。巨大的肉棒急切地做出回应，直接滑入妈妈的乳房之间，那里才是它们该待的地方。就像他们的大兄弟一样，这两个家伙在就位后也顺从地保持不动，让你用你的" + get_player().biggestBreastSizeDescript() + "榨取他们的肉棒。[pg]");
            outputText("[saystart]好孩子。现在给妈妈更多精液……她");
            if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
            {
               outputText("好像，");
            }
            outputText("被它灌得醉醺醺的，[sayend]你命令道。你上下晃动着乳房，让被精液浸透的皮肉在肿胀、慢慢变大的肉棒周围不断摩擦。突然，一股湿润的液体溅到了你的脸颊上，当你转头想看个究竟时，一根漏着液体的肉棒挤进了你因困惑而撅起的嘴唇。咸甜的先列腺液在你的舌尖上刺痛，你开始急切地舔舐它，舌头滑过那根滚烫、膨胀的肉棒。它的味道简直美妙极了。你全神贯注于此，试图屏蔽掉它主人的声音。[pg]");
            outputText("你那窝里最弱小的迷你牛头怪正在呜咽，[say: 对、对不起，妈妈，但我实在忍不住了。嗯……你的嘴好烫。我控制不住了！]他抓住你的");
            if(get_player().horns.value > 0)
            {
               outputText("角");
            }
            else
            {
               outputText("头发");
            }
            outputText("把你拉下来，在他射精的前一秒，把他那根粗大的肉棒塞进你的喉咙。咸咸的精液瞬间灌满了你的喉咙，然后流入你的胃里，让你体内原本就满满的精液又多了一份。当你被精液填满时，你幸福地哼哼着。喉咙增加的震动让你那女性化的儿子为你喷射了很久。[pg]");
            outputText("你脑中那麻醉般的泥浆变得更加浓稠，让你的思绪变得迟缓，直到它们变成一团充满精液的糊状物。你咯咯地笑着，在迷你牛头怪拔出他那根疲软的肉棒后，舔干净了嘴唇，就在几秒钟后，一股新的黏液又浸透了它们。你乳沟里的那些种马——你都把他们忘了！他们正随着喷涌而出的精液，发出愉悦的咕哝声和低沉的牛叫声。精液像泥石流一样流过你已经湿透的身体，让你从头到脚都沾满了散发着香味的牛头人精液。你那心满意足的儿子中，有一个在你滴着精液的乳房下放了一个瓶子，评论道，[saystart]妈妈，你为什么不留点以后用呢，");
            if(get_player().minotaurAddicted())
            {
               outputText("我可不想看到你在一只低等野兽身边因为饥渴而发疯。");
            }
            else
            {
               outputText("一旦你学会了需要它，这会好得多。");
            }
            outputText("[sayend][pg]");
            outputText("你呆呆地点点头，倒在身侧，对着那瓶装满精液的瓶子傻笑。真傻！还有那么多肉棒要榨干，可你已经忘了怎么站起来了！一双强壮的大手把你扶起来，把另一根肉棒塞进你的乳房。真好吃！肉棒又快又狠地操着它们，直到你又吃了一大口奶油般的精液。在那之后你就失去了意识，不过你确信你的乳房和喉咙至少被每个兽人填满并操过一次。就连迷你牛头怪也用你的乳房来了第二发。[pg]");
            outputText("你在营地醒来，仍然有些头晕，而且一丝不挂。你的[armor]就在几英尺外。从你头晕的程度来看，距离你在山里的幽会还没过多久。在穿衣服之前，你洗掉了[skinfurscales]和装备上干涸的精液。哇……那感觉真不错。");
         }
         else
         {
            outputText("只剩下");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 3)
            {
               outputText("一只牛头人");
            }
            else
            {
               outputText(Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 2) + " 只牛头人");
            }
            outputText("等着你去榨干。你记得你是在惩罚他们，在你被药物麻痹的头脑中，你决心要完成它。你即将参与的行为与惩罚相去甚远，但这丝毫没有打扰你平静的专注。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 3)
            {
               outputText("你抓住迷你牛头怪的肉棒，把这个害羞的兽人拉到你沾满精液的乳房上，毫不犹豫地把肉棒埋进妈妈的乳沟里，那里才是它该待的地方。");
            }
            else
            {
               outputText("你抓住迷你牛头怪和");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 4)
               {
                  outputText("剩下的那个兄弟");
               }
               else
               {
                  outputText("剩下的兄弟之一");
               }
               outputText("，用力将它们拉向你沾满精液的乳房。你毫不迟疑地将它们那对双胞胎肉棒埋入它们妈妈那沾满精液的乳沟中，这正是它们该待的地方。");
            }
            outputText("[saystart]好孩子。现在给妈妈更多的精液……她");
            if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
            {
               outputText("好像，");
            }
            outputText("快要被它灌醉了，[sayend] 你命令道。[pg]");
            outputText("那只迷你牛头怪摇摇晃晃的，完全不习惯有如此湿润温柔的包裹挤压着他的肉棒。他呜咽着，[say: 妈，我……我……我要……呃……射了！] 这只顺从的雌性牛头怪不顾一切地喷射着，他那较小的肉棒甚至都没能穿过你的乳沟，但他还是设法弄得比以前更乱了。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 3)
            {
               outputText("他的精液沿着他哥哥那根更大的肉棒所撑开的缝隙喷涌而出，很快他也射了，顺从地为你高潮。");
            }
            outputText("其中一个之前已经满足的兄弟拿出一个瓶子放在你面前，让它装满精液，然后塞上软木塞。他咕哝着，[saystart]");
            if(!get_player().minotaurAddicted())
            {
               outputText("也许我们可以让妈妈完全上瘾。那样我们就不用和她打架了？");
            }
            else
            {
               outputText("那对她来说会是一顿不错的零食。我们可不想让她在低等物种面前失控。");
            }
            outputText("[sayend]");
            outputText("[pg]你又吞下几口，然后踉踉跄跄地站了起来。你的脑子里像是有精液在游泳，让你很难思考，更不用说走路了！你心不在焉地拿起那个装满精液的罐子。你可不想忘了那个。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 5)
            {
               outputText("牛头怪们让你穿好衣服，同时幸福地叹息着，显然对这个结果很满意。");
            }
            else
            {
               outputText("你还没走多远，一只强壮的手臂抓住了你。哦，对了……还有一个需要惩罚的儿子。你跪倒在地，服侍他");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 5)
               {
                  outputText("和他的兄弟");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 6)
                  {
                     outputText("");
                  }
               }
               outputText("。这个过程模糊不清，但你");
               if(!get_player().isGoo())
               {
                  outputText("看起来像个白色的黏液女孩");
               }
               else
               {
                  outputText("凝胶状的身体里充满了长长的白色条纹");
               }
               outputText("等你设法离开时。你差点忘了你的装备，但在最后一秒抓住了它。");
            }
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().MINOCUM.get_id());
         get_player().orgasm("Tits");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Cor(0.5));
         get_player().slimeFeed();
         get_player().minoCumAddiction(15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,234)),get_camp().returnToCampUseOneHour);
         }
      }
      
      public function victoryMinotaurGang() : void
      {
         var _g2:Combat;
         var choice1:Number;
         var _g1:MinotaurMobScene;
         var choice:Number;
         var _g:MinotaurMobScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         if(get_monster().get_HP() < 1)
         {
            get_images().showImage("minomob-fallen-hp");
            outputText("最后一只牛头怪跪倒在地，摇摇晃晃地挣扎着想要站稳。他放弃了，瘫倒在背上，痛苦地哞哞叫着。你看着这些被击败的兽人，为自己的胜利感到欢欣鼓舞。虽然他们很强壮，而且有强效的天然催情剂辅助，但他们根本不是你的对手。有趣的是，即使在半昏迷状态下，他们依然硬挺着。像马一样的牛头怪肉棒掀起他们的遮羞布，直指天空，滴落着汁液。[pg]");
         }
         else
         {
            get_images().showImage("minomob-fallen-lust");
            outputText("最后一只牛头怪跪倒在地，用足以撕裂布料的力量扯开他的遮羞布，将那根跳动着、饥渴的肉棒暴露在空气中。他开始像他的兄弟一样自慰，将他的先列腺液洒在地上，汇聚成一滩越来越大、黏糊糊的水洼。空气中弥漫着浓烈的气味，但你赢了，而且你保持着足够的理智，如果想走的话随时可以离开。[pg]");
         }
         if(get_player().get_lust() < 33)
         {
            dynStats(DynStat.Lust(33,DynStatOp.Eq),DynStat.NoScale);
         }
         else
         {
            dynStats(DynStat.Lust(20));
         }
         outputText("你的身体滚烫，几英尺外正在上演的淫秽画面让你欲火焚身。你该怎么做？");
         menu();
         addButtonDisabled(1,"乳交","这个场景需要你有足够大的乳房。");
         addButtonDisabled(2,"乳头交","这个场景需要你有可以被操的乳头。");
         addButtonDisabled(4,"被口交","这个场景需要你有肉棒。");
         addButton(0,"轮奸",victoryAllThePenetrationsMinotaurGangBang);
         if(get_player().biggestTitSize() >= 6)
         {
            addButton(1,"乳交",victoryMinotaurGangTitFuck);
         }
         if(get_player().hasFuckableNipples())
         {
            addButton(2,"乳头交",victoryBJNippleFuckMinotaurGang);
         }
         _g = this;
         choice = 0;
         addButton(3,"被舔",function():void
         {
            _g.forceMinitaurToGiveOral(choice);
         });
         if(get_player().hasCock())
         {
            _g1 = this;
            choice1 = 1;
            addButton(4,"被口交",function():void
            {
               _g1.forceMinitaurToGiveOral(choice1);
            });
         }
         addButton(5,"管教",disciplineEldestMinotaurSon);
         _g2 = get_combat();
         addButton(14,"离开",function():void
         {
            _g2.cleanupAfterCombat();
         });
      }
      
      public function victoryBJNippleFuckMinotaurGang() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("你拉下[armor]的上半部分，前后晃动着你的[chest]。[say:你们这两个强壮的小伙子想不想玩玩妈妈的乳头？]你戏谑道。牛头人们从战败的姿态中回过神来，眼中燃烧着欲望，起身向前逼近。你咯咯地笑着，用指尖在乳晕上打圈，淫荡地呻吟着，挑逗着这些可怜的野兽，直到你厌倦了这种刺激，将指尖伸进");
         if(get_player().totalNipples() == 2)
         {
            outputText("每一个");
         }
         else
         {
            outputText("两个");
         }
         outputText("流着淫液的乳头小穴。[pg]");
         outputText("你那群强壮的儿子中第二大的那个胆敢问道：[say:如果你打算让我们操你的乳头，为什么还要先和我们打一架？][pg]");
         outputText("[say:因为，亲爱的男孩，我需要向你们这些叛逆的蠢货展示一下这里谁说了算。既然你们已经认清了自己的位置，是时候给妈妈一点甜头了，]你一边诱惑地扭动着身体一边解释道。[pg]");
         outputText("最大的那个牛头人一把将他的弟弟挤到一边，咆哮道：[say:好吧。我来陪你玩，妈妈。]他猛地扯下湿透的遮羞布残片，随手扔到一边，然后向前走去，他那巨大的肉棒在身前晃动着。你的目光锁定在那根巨大的肉棒上，它散发出的气味让你饥渴地流下口水，你大口大口地吸着它的麝香。另一个兄弟也不甘示弱，绕过他的兄弟，来到你的另一个乳房前，挡住了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 3)
         {
            outputText("迷你牛头怪，这让那个较小的怪物非常懊恼。");
         }
         else
         {
            outputText("他其余的同族，这让他们非常懊恼。");
         }
         outputText("当你继续把玩着乳头处的开口，慢慢地将它们拉伸，使其变得越来越湿润时，这对兄弟用贪婪的目光注视着你。[pg]");
         get_images().showImage("minomob-nipplefuck");
         outputText("你微笑着");
         if(get_player().get_tallness() >= 72)
         {
            outputText("跪下");
         }
         else
         {
            outputText("调整姿势");
         }
         outputText("以便让你的[nipples]处于更好的角度，将你的手指从它们黏滑的深处拔出。[say:好吧，那就继续吧，]你用期待的语气说道。[say:操它们。]牛头人们没有让你失望。他们每个人都用手托起你的一只" + get_player().biggestBreastSizeDescript() + "，将他们粗大平坦的龟头压在微微张开的开口上。随着压力不断增加，他们将龟头更用力地顶向坚挺的乳头小穴，直到最后他们将可怜的乳穴撑得大大的，并扩张了你乳房的内部。[pg]");
         outputText("那些滚烫的牛头人肉棒将你的乳头撑得像被操熟的小穴一样宽，这种感觉简直是天堂。你随着那黏糊糊的、喷涌着先列腺液的抽插在原地摇晃，看着");
         if(get_player().biggestTitSize() <= 2)
         {
            outputText("几英寸");
         }
         else if(get_player().biggestTitSize() <= 4)
         {
            outputText("英寸");
         }
         else if(get_player().biggestTitSize() <= 8)
         {
            outputText("大半英尺的");
         }
         else if(get_player().biggestTitSize() <= 14)
         {
            outputText("超过一英尺的");
         }
         else if(get_player().biggestTitSize() <= 30)
         {
            outputText("将近两英尺的");
         }
         else
         {
            outputText("整根");
         }
         outputText("近乎马屌的肉棒消失在你体内。粗壮滚烫的肉棒在你乳房底部跳动，快感几乎让你瘫倒在地。你抓住孩子们的睾丸，轻轻揉捏着，鼓励他们。作为回应，两只牛头怪都把肉棒抽了回去，把龟头从你的乳房里拔出来，然后再次狠狠地插进去。[pg]");
         outputText("你像个荡妇一样呻吟着，抚摸着儿子们巨大的睾丸，享受着每一刻。令你惊讶的是，两只正在快乐交配的牛头怪被第三个毛茸茸的身影分开了。一只迷你牛头怪从他们中间钻了出来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 7)
         {
            outputText("，身后跟着你其他孩子们的嘲笑声");
         }
         outputText("。他害羞地挠了挠头，小心翼翼地撩起遮羞布，直到他勃起的肉棒在你的[face]前晃动。[say: 妈妈，你能……舔舔它吗？好痛。]你坏笑了一下，张大嘴巴，让他清楚地看到你慢慢蠕动的舌头和闪闪发光的嘴唇。[pg]");
         outputText("你那像女孩一样的迷你牛头怪儿子一头扎进你诱人的嘴里。他的肉棒滑过你的嘴唇，越过你的舌头，轻松地进入你喉咙深处，留下一道令人酥麻的先列腺液，涂满了它经过的每一个地方。尽管你最小的孩子的突然出现迫使你较大的孩子们改变了姿势，但这只是把你颤抖的、被侵犯的乳房拉向两侧，展示出淫荡的乳交画面。这三个家伙猛烈地操着你，按照他们自己的节奏抽插着，让你无法集中注意力，只能感受到这猛烈的侵犯。");
         if(get_player().hasCock())
         {
            outputText("" + get_player().SMultiCockDesc());
            if(get_player().hasVagina())
            {
               outputText("和[vagina]流着口水");
            }
            else
            {
               outputText("流着口水");
            }
            outputText("无力地在你的衣服里，几乎被你上半身传来的感官超载所遗忘。");
         }
         outputText("[pg]四颗睾丸在你的手中扭动收缩，然后突然间，你的胸部被两股沉重的野兽精液双重填满。麝香气味的精液迅速填满了被紧紧撑开的通道，并溢出来，顺着你的乳房底部滴落。滚烫、泛滥的精液淹没了你，一阵让乳房颤抖的乳交高潮穿过白热化的神经末梢，让你在绝对完美的快感中尖叫");
         if(get_player().biggestLactation() >= 3)
         {
            outputText("同时你将乳汁喷洒在两根肉棒周围");
         }
         else if(get_player().biggestLactation() >= 1.5)
         {
            outputText("同时你将乳汁滴在两根肉棒周围");
         }
         outputText("。");
         outputText("[pg]两只正在射精的种马从紧致的洞里拔出肉棒，你痉挛的指尖挤奶般地揉捏着他们的睾丸，无法控制地挤压着沉重的阴囊。一串串强效、掺有药物的精液溅在你的[chest]、肩膀和脸上，就在这时，堵住你嘴巴的肉棒像决堤的大坝一样爆发了高潮。你完全被精液浸透了，从里到外——彻头彻尾的乱伦荡妇。两只最大的牛头怪终于耗尽了他们的储备，退后一步，边走边击掌。你那较小的、像女孩一样的男孩花了更长的时间才射完，但当他射完时，你感觉自己被完全填满了。要过很长一段时间你才会渴望");
         if(!get_player().minotaurAddicted())
         {
            outputText("“一顿饭”");
         }
         else
         {
            outputText("下一次的快感");
         }
         outputText("。");
         outputText("[pg]你直起身子伸了个懒腰，精液从你的乳头流出。聚集的牛头人们");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 5)
         {
            outputText("放松下来，一边给自己扇风，一边用充满欲望的眼神看着你");
         }
         else
         {
            outputText("阴郁地盯着那三个幸运儿，然后再次转头，带着毫不掩饰的欲望注视着你的身躯");
         }
         outputText("。你性感地重新穿上衣服，尽可能大胆地向他们展示你的身体，甚至懒得擦去你[skinfurscales]上覆盖的精液，然后才穿好[armor]离开。");
         get_player().orgasm("Nipples");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Sens(-1),DynStat.Cor(1));
         get_player().minoCumAddiction(10);
         get_player().slimeFeed();
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function victoryAllThePenetrationsMinotaurGangBang() : void
      {
         var _loc1_:Number = NaN;
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("决定了你想要和你的儿子们一样的东西，你脱下你的[armor]，并指示那些发情、被击败的牛头怪脱掉他们剩下的遮羞布。他们服从了");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("几乎是立刻，他们太兴奋了，无法拒绝他们母亲用他们坚硬的肉棒做任何事情的想法。");
         }
         else
         {
            outputText("尽管受了伤，他们还是有些迟缓地为你脱去衣物。当他们脱完后，动作开始变得快了一些，从战斗中恢复的速度比你想象的要快。");
         }
         outputText("你漫步走到最近的肉棒前，欣赏着它抽搐的硬度，温柔地抚摸着那根有些像马的肉棒，同时将自己正正地摆在它上方。[pg]");
         get_images().showImage("minomob-gangbang");
         outputText("当你沉下身子时，它戳弄着你的外阴，用芬芳的牛头人“花蜜”涂抹着你的外阴唇。那喇叭状的龟头在你的爱之通道入口处几乎没有遇到任何阻力。你伸手向下，将自己拉开，尽可能地为你后代那美妙的肉棒敞开大门。");
         if(get_player().vaginalCapacity() >= 60)
         {
            outputText("它轻松地滑入你的" + get_player().vaginaDescript(0) + "，依偎在你那包容的开口中，仿佛那是它的第二个家。");
         }
         else if(get_player().vaginalCapacity() >= 40)
         {
            outputText("它极其缓慢地滑入你的" + get_player().vaginaDescript(0) + "，逐渐撑开你的阴道，直到它能够容纳它的尺寸。");
         }
         else
         {
            outputText("当它插入你时，它以痛苦的力量撑开你的" + get_player().vaginaDescript(0) + "，强行撑开你的阴道，直到它能够将其包皮依偎在你的外阴上。");
         }
         outputText("随着牛头人如锤击般的心跳，它在你体内湿润地跳动着。");
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]你弓起背，在空中扭动着你暴露的臀部，问道：[say: 现在，我的哪个儿子想向妈妈展示他们有多爱她？][pg]");
         outputText("几秒钟内，你身后就聚集了一群人。无数双手挤压和抚摸着你的" + get_player().buttDescript() + "，有几个甚至胆敢按压你的[asshole]环。他们为了争夺插入你后门的荣誉而互相推搡，但在你对这场奇观感到厌倦之前，一个胜利者被选了出来。他用双手抓住你的[ass]，以帮助他将肉棒对准你的菊花，并轻轻地挤压着。[pg]");
         outputText("这个兽人终于用他的龟头抵住了你的肛门，并向前推进。");
         if(get_player().analCapacity() < 40)
         {
            outputText("你的[asshole]太紧了，他不得不一次又一次地推入和拔出。痛苦的插入过程持续了很久，因为他撑开了你的洞，以接纳他那巨大的肉棒。");
         }
         else if(get_player().analCapacity() < 60)
         {
            outputText("你的[asshole]慢慢撑开，接纳了那根被送入其深处的肉棒。你发现自己有些庆幸，因为你已经被撑得足够开，以至于这不会让你感到痛苦。");
         }
         else
         {
            outputText("你的[asshole]轻松地吞噬了这根肉棒。唯一接近紧绷感的是你的菊花在他的根部被撑开的感觉。");
         }
         outputText("睾丸轻轻地靠在你的会阴上。你享受着被如此精妙地填满的感觉，那些粗壮的、有棱纹的肉棒通过你的洞互相摩擦，但似乎还缺少了什么。");
         get_player().buttChange(60,true,true,false);
         outputText("[pg]当你开始摇晃臀部时，你问道：[say: 你们这些男孩有谁想帮妈妈弄弄她的另一个洞吗？]一根滴着液体的肉棒像变魔术一样出现在你的面前。你舔了舔嘴唇，因为他先列腺液的气味慢慢压倒了你的意识，你抬起头看着那根奇妙肉棒的主人，同时张大了嘴巴。他向前猛冲，沿着你的舌头滑动，仿佛那是为他铺设的红地毯。肉棒埋入你的喉咙，泄漏的先列腺液一路上消除了你的作呕反射。你把手放在他的肚子上，示意他应该保持不动，他勉强同意了，暂时如此。你故意上下摇晃你的[hips]，操着你儿子们的双胞胎阴茎，同时这个动作让你的喉咙在你嘴里的肉棒上上下套弄。");
         if(get_player().hasFuckableNipples() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 4)
         {
            outputText("你还可以做更多的事情。");
         }
         outputText("[pg]");
         if(get_player().hasFuckableNipples() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 4)
         {
            if(get_player().biggestLactation() >= 1)
            {
               outputText("乳白色的润滑液");
            }
            else
            {
               outputText("润滑液");
            }
            outputText("从你的[nipples]滴落，与你被填满的小穴相呼应。一个邪恶的想法在你充满欲望的心理中凝聚，你问道：[say: 你们这些男孩知道我的其他小穴吗？你们为什么不试试我的乳房？]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 4)
            {
               outputText("一个种马聚集在旁边");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 5 && get_player().totalBreasts() == 2)
            {
               outputText("两头种牛聚集在");
            }
            else
            {
               _loc1_ = get_player().totalBreasts();
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3 < _loc1_)
               {
                  _loc1_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 3;
               }
               outputText(Utils.num2Text(_loc1_) + " 头种牛聚集在");
            }
            outputText("你身边，看着你的乳房随着身体的动作摇晃。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 4)
            {
               outputText("他兴奋地用手指");
            }
            else
            {
               outputText("他们兴奋地用手指");
            }
            outputText("玩弄你的乳房，滑入几根手指探索你胸部小穴的深处。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 4)
            {
               outputText("他舔干净手指，片刻之后，一根肉棒刺穿了你的一个乳头，消失在你胸部内隐藏的刺痛通道深处。[pg]");
            }
            else
            {
               outputText("他们舔干净手指，片刻之后，几根肉棒刺穿了你的乳头，消失在你胸部内隐藏的刺痛通道深处。[pg]");
            }
         }
         if(get_player().hasCock())
         {
            outputText(get_player().SMultiCockDesc() + " 软绵绵地挂在你其中一个男孩的肚子上，因为你的需求而微弱地滴着液体，但它没有任何办法参与到这群狂欢的肉体中。[pg]");
         }
         outputText("这就对了——既然你已经被全方位地刺穿，真正的乐趣就可以开始了！你加快了身体的运动速度，陶醉于你对这些提供药物的后代所拥有的绝对支配和控制中。当你用力快速地操他们时，他们漏出并滴下液体，当他们开始移动时，你偶尔会伸手去拍打或打他们的屁股。你像骑着一套活生生的假阳具一样骑着他们，从每个洞里发出嘈杂的吧唧声，同时渗出等量的润滑液、唾液和先列腺液。这真是太火辣、太下流了");
         if(get_player().cor < 33)
         {
            outputText("，当你意识到自己正在进行一场乱伦狂欢时，你有点退缩，但血液中不断上升的牛头人药物冲刷掉了这个错误的念头。");
         }
         else
         {
            outputText("，你几乎无法保持理智，但感觉所有渗入你血液的牛头人药物可能会把仅存的理智也冲刷掉。");
         }
         outputText("[pg]当你嘴里的肉块让你感到愉悦时，你发出哼哼声，因为身体被完全穿透，将你推过了忍耐的极限，进入了极乐的境界。哼哼声的音调和音量不断升高，变成了尖叫般的呻吟。你的身体颤抖，你的小穴紧缩，");
         if(get_player().hasFuckableNipples() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 4)
         {
            outputText("你的乳头喷水，");
         }
         outputText("你的屁股同时挤压着里面的牛头人阴茎。被他们淫荡母亲的挣扎和紧缩的洞穴所压倒，你的儿子们抓住你并控制了你，疯狂地操着你。");
         outputText("你像个儿童玩具一样弹跳着，完全任由你肌肉发达的后代摆布。[pg]");
         outputText("你屁股里的那个最先射精，用他的汁液涂抹你的结肠。当他把可怜的直肠口填得过满时，麻醉性的精液从你的[asshole]溢出，但你体内得到的精液足以让你感到头晕目眩——就好像你的高潮还不够似的。精液以同样的热情在你的[vagina]中爆发，以令人难以置信的力量塞进你的子宫。");
         outputText("你能感觉到你身后的四个睾丸在缩小，因为它们的货物排空到了你的小穴和屁股里，塞满了你的后半身。[pg]");
         outputText("在你喉咙里张开，你嘴里的牛头人肉棒也开始射精，受到你颤抖的、高潮的动作以及看到你的[ass]被如此彻底地塞满的刺激。沉重的精液团一个接一个地直接喷射到你的胃里，直到你被完全塞满。");
         if(get_player().hasFuckableNipples() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 4)
            {
               outputText("与此同时，你的[nipples]也从周围的种牛那里得到了类似的感觉");
            }
            else
            {
               outputText("与此同时，你的[nipple]也从不断抽插的乳钉上感受到了类似的感觉");
            }
            outputText("，精液的注入让你的乳房胀大了一整个罩杯。");
         }
         outputText("它们同时拔出，留下你抚摸着胀大的肚子呻吟。这群");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 20)
         {
            outputText("暴徒");
         }
         else
         {
            outputText("部落");
         }
         outputText("看着你挣扎着站起来，对你露出得意的笑容。[pg]");
         outputText("你摇晃了一下，但还是勉强站了起来。战败的牛头怪们对他们的杰作窃笑不已，现在你身上的每一个洞都在滴水。你捏得指关节咔咔作响，用绝对残暴的表情瞪着他们，结束了这一切。兽人们吓得转身就跑，不敢冒犯母亲的怒火。等他们走后，你瘫倒在自己身下那个浸满精液的泥坑里，疯狂地咯咯笑起来。你的儿子们真是群愚蠢的傻瓜！[pg]");
         outputText("穿好衣服后，你漫不经心地从湿透的阴部舀起一把精液吞了下去——这是漫长回家路上完美的零食。");
         get_player().knockUp(2,432,75);
         get_player().orgasm("Anal");
         get_player().orgasm("Vaginal",false);
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(0.5),DynStat.Sens(-0.5),DynStat.Cor(1));
         get_player().slimeFeed();
         get_player().minoCumAddiction(20);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) > 30)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,328,30);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,328,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) > 0)
         {
            _loc1_ = 328;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,327) > 0)
            {
               _loc1_ = 327;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,326,FlagDict_Impl_.arrayReadInt(_loc2_,326) + 1);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,327) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,328) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,328,30);
         }
         return false;
      }
      
      public function submitToMinotaurMob() : void
      {
         get_player().set_lust(get_player().maxLust());
         dynStats(DynStat.Lust(1));
         minotaurDeFeet();
         spriteSelect(SpriteDb.get_s_minotaurSons());
      }
      
      public function runFromMinotaurs() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("你企图转身逃跑，");
         if(get_player().canFly())
         {
            outputText("从低矮的悬崖上跃起，展翅高飞");
         }
         else
         {
            outputText("顺着山坡逃窜");
         }
         outputText("。");
         if(get_player().canFly() && get_player().get_spe() > Utils.rand(40) || !get_player().canFly() && get_player().get_spe() > Utils.rand(60))
         {
            outputText("一只毛茸茸的手臂差点抓住你的[leg]，但你挣脱了，迅速逃离了你那群饥渴的孩子。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            if(get_player().get_gender() == 3)
            {
               get_images().showImage("minomob-falling-herm");
            }
            else if(get_player().get_gender() == 2)
            {
               get_images().showImage("minomob-falling-female");
            }
            else
            {
               get_images().showImage("minomob-falling-male");
            }
            outputText("一只毛茸茸的手臂抓住了你的[leg]，用力一拉，把你狠狠地摔在悬崖壁上。你头晕目眩，流着血，摇摇晃晃地挣脱出来，有些发懵。战斗开始了！");
            fightOTaurs();
         }
      }
      
      public function nonAddictMinotaurGangBang() : void
      {
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("牛头怪们走近了，他们的蹄子在靠近你俯卧的身体时扬起了一小阵尘土。你抬起头，鼻子抽动着，深深地呼吸着他们的气味，同时向这群人中最近的一个投去娇羞的目光。他微笑着，手指捏住你的下巴，把你的嘴拉成一个撅起的“o”形。他的另一只手握着他那僵硬的男性器官的沉重肿块——一根超过两英尺长、肿胀、末端张开的肉棒，上面有三道突出的脊。你颤抖着，下意识地舔了舔嘴唇，当它慢慢靠近时，你在空气中尝到了他先列腺液的甜美气味。[pg]");
         if(get_player().isTaur())
         {
            outputText("突然，一股猛烈的推力将你马一样的身体翻转到侧面，一根更大的肉棒压在了你紧缩的");
            if(get_player().tail.type == 0)
            {
               outputText("屁眼上");
            }
            else
            {
               outputText("尾穴上");
            }
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("突然，一股猛烈的拉力扯直了你的尾巴，一根更大的肉棒挤进你的[ass]之间，戳弄着你紧缩的屁眼");
         }
         else if(get_player().isGoo())
         {
            outputText("突然，一股猛烈的推力将你翻转到侧面，你感觉到毛茸茸的皮毛摩擦着你黏糊糊的褶皱，同时一根更大的肉棒压在了你紧缩的");
            if(get_player().tail.type == 0)
            {
               outputText("屁眼上");
            }
            else
            {
               outputText("尾穴上");
            }
         }
         else
         {
            outputText("突然，一股强大的拉力将你的一条腿高高抬起，你感觉到一根更大的肉棒压在了你紧缩的");
            if(get_player().tail.type == 0)
            {
               outputText("屁眼上");
            }
            else
            {
               outputText("尾穴上");
            }
         }
         outputText("。那根马一样肉棒上残忍的、膨大的龟头在坚硬的入口处撞击了片刻，随着每一次痛苦的推进，慢慢地将你的直肠口撑得越来越大。你痛苦地喘息着，发出痛苦的叫喊，然后转为低沉的呻吟。你面前那根滴着液体的肉棒插入了你张开的孔洞，先列腺液润滑着它的通道，龟头被推到了你的喉咙深处。通常你的身体可能会试图拒绝这种入侵，但你感觉到的只是一种麻木的接受，你放松了喉咙，让先列腺液流入你的肚子。");
         outputText("[pg]你" + get_player().assholeDescript() + "上的压力突然减轻，不是因为牛头怪在后退，而是因为龟头冠状沟的一部分突然滑过了你那紧绷洞口的括约肌环。你头晕目眩，试图放松，与括约肌对入侵者本能的收紧反应做着抗争。身后传来一声满意的低鸣，插入你[asshole]的牛头怪猛力向前推。它的龟头冠状沟伴随着一声清晰可闻、令内脏震荡的\"噗\"声滑入其中。");
         get_player().buttChange(60,true,true,true);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 10)
         {
            outputText("聚集在一起的野兽们听到这声音窃笑起来，他们慢慢地抚摸着自己，等待着有机会进入你饥渴的穴洞。");
         }
         else
         {
            outputText("迷你牛头怪听到这声音咯咯地笑了起来，他抚摸着自己，发出呜呜的声音，等待着加入的许可。");
         }
         outputText("当两根牛头怪的肉棒都推得更深，完全、彻底地用他们乱伦的坚硬将你像烤肉一样串起来时，你除了发出咕噜声什么也做不了。[pg]");
         outputText("一寸一寸地，两根肉棒插得更深，你的脖子和肚子在不断变大的龟头周围鼓了起来。你甚至能感觉到他们漏出的、像毒品一样的先列腺液汩汩流出，填满你的肚子，滑入你的肠道。它给了你一种美妙的、麻痹疼痛的快感，让你很容易应付目前将你从地上举起的超大号肉棒。他们的手移过来抓住你的腰部，帮助稳定你悬在他们之间的身体。当你被平举到齐腰高时，那两根跳动的、漏着毒品的肉棒最后几英寸推入了你的穴洞。他们两个汗津津的阴囊同时拍打在你的[ass]和下巴上。[pg]");
         outputText("你的牛头怪主人们开始用长长的、刮擦孔洞的抽插来回拉锯他们跳动的肉棒。这本该是痛苦的，但它只是煽动了你被催情剂点燃的欲火。你的小穴");
         if(get_player().wetness() >= 5)
         {
            outputText("随着每一次抽插到处喷涌，你的润滑液在地上汇成水洼");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("随着每一次抽插流下一股浓稠的润滑液，在地上汇成水洼。");
         }
         else
         {
            outputText("随着每一次抽插滴下润滑液，在地上留下小块的湿痕。");
         }
         outputText("你的身体像个皮球一样在他们之间弹来弹去，被他们粗暴地对待、虐待，仅仅是为了几分钟的快感。每次那根堵住你喉咙的肉棒拔出时，你都会深吸一口气，努力保持清醒，但却被这群发情野兽无处不在的体味弄得更加兴奋。[pg]");
         outputText("占据你嘴巴的牛头怪抓住了你的");
         if(get_player().horns.value > 0)
         {
            outputText("角");
         }
         else
         {
            outputText("头");
         }
         outputText("然后粗暴地将他的肉棒深深埋入你的嘴里，直达根部。他的先列腺液停止了分泌，随着这只野兽那带有三道肉棱的阴茎开始在你体内膨胀，你下巴上的睾丸也开始跳动。你的下巴被微微撑开，你感觉到一大团精液沿着他阴茎底部的尿道膨胀起来。这团精液向着你的肚子推进，从他的龟头处爆炸性地喷射而出，当你的肠胃接收到第一发牛头怪的精液注射时，发出了清晰可闻的咕噜声。[pg]");
         outputText("在达到高潮前夕的快感巅峰时，牛头怪的龟头猛然膨胀，将你的食指死死堵住。毛茸茸的阴囊在你的下巴上跳动，里面沉甸甸的睾丸随着它们将催情、夺人心智的货物排空到你最深处而慢慢缩小");
         if(get_player().cor >= 66)
         {
            outputText("。你对此感到无比高兴");
         }
         outputText("。随着精液从你下巴上那可怜的、肿胀的睾丸中不可阻挡地排空，那些挤过你那兴奋地抽动着的舌头的精液团块慢慢变得越来越小。它们微微颤抖了一下，然后停了下来，牛头怪终于退了回去，慢慢变软，以便从你那被蹂躏的喉咙里拔出来。[pg]");
         outputText("一旦重获自由，这只野兽便将他粗大肉棒顶端的污物抹在你的嘴唇上。他把你推向那个正在侵犯你[asshole]的家伙，让他支撑着你。你对这种粗暴的对待发出呻吟，同时舔舐着嘴唇上美味的精液。你喉咙和胃里强效的精液已经让你无法进行任何比“找精液”和“操”更复杂的思考。迷你牛头怪犹豫地走上前，将他那沾满先列腺液的坚硬肉棒放在你手里让你抚摸，同时他呜咽着，[say: 大哥，求你了，我能操她的逼吗？][pg]");
         get_images().showImage("minomob-gangbang");
         outputText("[say: 今天不行，小矮子。]你身后的牛头怪哼了一声。他用沾满汗水的手臂将你举起，转过身来，将你那至今未被玷污的女性私处放在他那膨胀的、准备爆发的肉棒顶端。他得意地笑了笑，把你的脸按在");
         if(get_player().get_tallness() <= 70)
         {
            outputText("他的胸膛上");
         }
         else
         {
            outputText("他的肩膀上");
         }
         outputText("同时他笑着说，[say: 你可以操妈妈的后门。我已经帮你开好路了。]迷你牛头怪的脸上闪过一丝沮丧，但这并没有阻止他走到你身后，将他较小的肉棒对准你那大张着、湿漉漉的屁眼。[pg]");
         outputText("把你举在半空的那块坚如磐石的肌肉变软了，你的体重把你拖了下来。你多汁的阴户和被蹂躏的肛门跳动着，被你亲生骨肉的阴茎刺穿。");
         get_player().cuntChange(60,true,false,true);
         outputText("它们轻而易举地分开了你的血肉，深深地插入你的体内，并在你体内狭窄的缝隙中相互摩擦。你的屁眼感到一阵刺痛，实际上，由于深处那根更舒服的肉棒，你的屁眼比你那突然被撑开的阴道获得了更多的快感。它们越来越深，直到支撑你的种马顶到了你膨胀的子宫颈，而他的包皮则挤压着你的外阴唇。[pg]");
         outputText("[saystart]操，妈妈，你的小穴太棒了！");
         if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 216)
         {
            outputText("希望你不介意我再给你造个弟弟。");
         }
         else if(get_player().get_pregnancyType() == 2)
         {
            outputText("希望你不介意我跟小弟弟打个招呼。");
         }
         else
         {
            outputText("希望你生下这个小畜生后还能回来，这样我们就能给你一个真正的宝宝了！");
         }
         outputText("我感觉要来了，准备好了吗，妈？[sayend]兽人问道。你热情地点点头，前后摇晃着身体，而迷你牛头怪则抓住你的[ass]，操着你静止不动的身体。[pg]");
         outputText("一个巨大、肿胀的肉块撑开了你的阴唇，挤出了一股淫液和爱液。");
         get_player().cuntChange(60,true,false,true);
         outputText("龟头在射入你子宫时猛然膨胀；子宫内精液的沉积绽放出温暖，让你的肌肉变得松弛，并引发了你自己的高潮。你的小穴起伏着，挤压着入侵者，而你那被肉棒塞满的后庭也随着高潮的收缩而配合着。你身后的迷你牛头怪呜咽着，用他那相对轻盈的身体所能达到的最大力度将自己完全没入，他的睾丸拍打着他兄弟那慢慢变空的精囊。");
         if(get_player().hasCock())
         {
            outputText("" + get_player().SMultiCockDesc() + " 在牛头怪的肚子上爆发，微弱地喷出");
            if(get_player().cumQ() < 25)
            {
               outputText("几滴精液，落在他被汗水浸湿的皮毛上。");
            }
            else if(get_player().cumQ() < 50)
            {
               outputText("一股稳定的精液细流，流进他的皮毛里。");
            }
            else if(get_player().cumQ() < 100)
            {
               outputText("一股稳定的精液流，流进他纠结的皮毛里。");
            }
            else
            {
               outputText("一股源源不断的精液流，用你那浪费的、劣质的种子彻底浸透了牛头怪的皮毛和睾丸。");
            }
         }
         outputText("[pg]被完全刺穿，被药物迷得神魂颠倒，并且被注入了越来越高剂量的麻醉剂，你在高潮中失去了理智。你几乎变成了一只本能的性爱野兽，淫荡地呻吟着，舔舐着你儿子多毛身体上的汗水，在两个种马用粘稠的爱液淹没你的子宫和直肠的感觉中愉悦地咕哝着。你下方起伏的睾丸颤抖着、蠕动着，随着每一次蹒跚的、撑开洞穴的抽插而明显缩小。你的身体因高潮的冲击而颤抖，高潮那白热化的快感似乎烧毁了你思考的能力，直到除了满足感之外什么都没有留下。[pg]");
         outputText("被快感分散了注意力，你几乎没有意识到肉棒已经从你被捣烂的小穴中拔出。你被扔到泥土上，而仍在射精的迷你牛头怪被他那膨胀的肉棒拉倒，重重地压在你身上。他在射精时亲吻和舔舐你，温柔地用爱意沐浴你，同时用你的身体满足自己。对于这样一个野兽般、堕落的生物来说，他真的是一个温柔的情人。[pg]");
         outputText("迷你牛头怪留在你体内，伸手揉捏你肿胀、发红的下体嘴唇，同时他在你深处变软。这种犹豫让他的精液有时间通过你的肠道内壁吸收。一旦他拔出，你周围的世界都在旋转，但你试图爬向");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) <= 3)
         {
            outputText("那个给了你第一剂药的牛头怪。也许他准备好给你更多了？他假笑着，用他柔软的肉棒拍打你的脸。你醉醺醺地咯咯笑着，开始舔他的睾丸——他们一定有更多给你的！");
         }
         else
         {
            outputText("一个还没来得及占有你的牛头怪。野兽笑着，把你拉到你的膝盖上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) <= 5)
            {
               outputText("你张大嘴巴，舔着嘴唇，直到它们变得闪亮，足以吸引种马操弄。他没有让人失望。肥大的龟头推开你皱起的吸精嘴，滑入你的喉咙，通道被他前面那个人的遗留物润滑了。你快乐地叹了口气，开始像吃棒棒糖一样吸吮他的肉棒，尽管你想要的只是他那奶油般的中心。其他人围在周围，抚摸着自己，等待着下一次机会。");
            }
            else
            {
               outputText("你张大嘴巴，舔着嘴唇，直到它们变得闪亮，足以吸引种马操弄。他没有让人失望。肥大的龟头推开你皱起的吸精嘴，滑入你的喉咙，通道被他前面那个人的遗留物润滑了。你快乐地叹了口气，开始像吃棒棒糖一样吸吮他的肉棒，尽管你想要的只是他那奶油般的中心。另外两根肿胀的肉棒找到了你等待的洞穴，当你再次被你儿子们的精液塞满时，你在令人眼花缭乱的极乐中咯咯地笑了起来。");
            }
         }
         outputText("你在那一刻晕了过去，但当你醒来时，浑身被精液浸透，旁边还有一瓶精液，你知道这是一个美好的夜晚。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().MINOCUM.get_id());
         get_player().knockUp(2,432,75);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(0.5),DynStat.Sens(-0.5),DynStat.Cor(1));
         get_player().slimeFeed();
         get_player().minoCumAddiction(20);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_player().sleeping = true;
            get_inventory().takeItem(ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,234)),get_camp().returnToCampUseEightHours);
         }
      }
      
      public function negotiate() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         get_images().showImage("minomob-negotiate");
         outputText("你冷静下来，警告他们你不是好惹的，必要时你会自卫。你的爆发震惊了他们，他们甚至似乎对你的自信和镇定感到有些担忧。[pg]");
         outputText("第二强壮的儿子坏笑着反驳道，[say:冷静点，妈妈……会没事的。我知道你的问题出在哪里。你只是还没得到足够的精液……相信我，你会喜欢的！等我们在你的洞里射了几发，你就会欲罢不能的！我保证！！][pg]");
         outputText("[say:呵。你准备好被操和吸，直到你给我生另一个小母狗弟弟，好让你不在的时候我能操他了吗？]最强壮的兄弟问道。[pg]");
         outputText("那个温顺、安静的“迷你牛头怪”最后开口了。[say:求、求你了，妈妈？我从来没有在真正的逼里射过……][pg]");
         outputText("看来他们只对一件事感兴趣。");
         menu();
         addButton(0,"战斗",fightOTaurs);
         addButton(1,"屈服",submitToMinotaurMob);
         addButton(2,"逃跑",runFromMinotaurs);
      }
      
      public function minotaurGangBadEndPart3B() : void
      {
         clearOutput();
         outputText("像往常一样，部落里最大、最强壮的成员挤在你周围，争抢着第一个进入你的某个洞。你试图说，[say:温柔点，男孩们，我会照顾你们所有人的。]一根肉棒在第二个音节后让你闭嘴，把你清晰的话语变成了淫荡的满足哼哼声。你舔去肉棒底部的汗水，放松喉咙让它进入得更深。肉棒因为你嘴巴的紧致而抽搐，你用力吸吮，很高兴能把一团奶油吸进喉咙。麝香的皮毛在你的鼻子上发痒，你意识到你已经深喉了他整根肉棒。你能感觉到它撑开了你的喉咙，把你的口腔通道扩张得比它本来应该的还要宽。它以最奇妙的方式填满了你，但与此同时，你的另一个孔洞渴望着什么……任何东西……插进来。[pg]");
         outputText("你身后传来了一阵争吵声，伴随着拳头击打肉体的声音。谢天谢地，过了一会儿就平息了，暴力的声音逐渐消失，很快就被小穴吞噬粗大肉棒的湿润吧唧声所淹没。你的[vagina]也加入了这液体吧唧声的合唱，发出了自己黏糊糊的吧唧声。小穴的汁液顺着你的[legs]流下，把你下面的泥土变成了泥巴。随着每一次怀孕，你的蜜罐只会变得越来越湿润。");
         if(get_player().wetness() >= 5)
         {
            outputText("当然，你以前就是个潮吹体质，但现在，你甚至在达到高潮之前就会潮吹好几次。");
         }
         else
         {
            outputText("当然，你以前也能流很多水，但现在，你甚至在达到高潮之前就会喷水和滴落淫液。");
         }
         outputText("浸满淫液的肉棒拔出足够长的时间，让你欲求不满，然后又滑回原处，为你设定了一个美妙而快速的抽插节奏。[pg]");
         outputText("你在这根粗大、撑开喉咙的工具周围发出满足的呼噜声，享受着粗暴的插入。欲望的双柱在你身体的两端颤抖，受到它们似乎很容易就能高潮的鼓舞，你开始左右倾斜头部，转动你那浸满先列腺液的食道，环绕着这根野兽的肉棒。它被撑得很大，然后爆发了，因为压抑得太久，在这么紧致的孔洞里坚持不了多久。幸运的是，爆发的位置在你的喉咙深处，你甚至都不用吞咽。它只是把大量的精液直接咕噜咕噜地灌进你的肚子里。你有点失望没能在舌头上尝到它的味道，但排队的种马多的是。[pg]");
         get_images().showImage("badend-minomob-II");
         outputText("化学物质渗入你的血液，引发了连锁反应，让你那湿透、被填满的小穴紧紧裹住主人的肉棒喷水，你的头也变得晕乎乎的。你嘴里肿胀的肉棒变软并抽出了，让你有机会尖叫，[say:操，爽，操我，男孩们！用力操妈妈！][pg]");
         outputText("就在塞满你小穴的马屌爆发时，一根更大的肉棒打断了你。一阵熟悉而强烈的快感、性奋和头晕目眩席卷全身，让你对着那根撑开你嘴唇的肉棒咯咯傻笑。你的子宫被淹没，你的[vagina]喷出淫液，你的[legs]无力地瘫软着，你的身体试图应对这如毒品般的高潮快感。仅仅是那匹种马的播种，怀孕似乎就已成定局。[pg]");
         outputText("他拔了出来，换了另一个人，你想知道是哪个男孩在吃残羹冷炙。谁在乎呢，只要你能感觉到他在你体内射精，直到你头晕目眩就行！");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(100),DynStat.Sens(100));
         get_game().gameOver();
      }
      
      public function minotaurGangBadEndPart3A() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         get_images().showImage("badend-minomob-I");
         outputText("<b>一段时间后……");
         outputText("[pg]</b>");
         outputText("你眨了眨眼睛，试图适应阳光。过去几个月里，这间堆满枕头的小屋一直是你的家，你从未想过要离开它。你大部分时间都是仰卧着，坐在别人的腿上，或者四肢着地。当然，当你怀孕的时候，你不会有那么多的性生活，但只要你要求，他们仍然会把肉棒塞进你的喉咙，把你的肚子灌满精液。你脸红了，想起了你要求的频率。其他女孩仍然有点嫉妒你的儿子们对你倾注了多少爱。她们很快就会想通的——牛娘已经是你最好的朋友了。即使你们不知道彼此的名字，你们俩花在69式上的时间几乎和被部落轮流操弄的时间一样多。[pg]");
         outputText("今天，他们把你们所有人都带到了镇中心。你可以看到十几个颈手枷，你们每个人一个，还剩下一个。你耸耸肩，任由自己被带到它们面前。从你今天早上醒来开始，他们就没操过你们中的任何一个，所以你确信无论这次考验是什么，结果都会是你们每个人都能在一个洞里吃上几发。如果你运气好，你所有的洞都会被塞满。[pg]");
         outputText("停下来后，你把头和手臂穿过洞。它们内衬着带垫子的皮革，这让你非常高兴。你诱惑地扭动了一下你的[ass]，但换来的只是一记粗暴的拍打。你在失望和喜悦的混合中呻吟着，转过头看着其他女孩就位。在队伍的最后，迷你牛头怪羞愧地红着脸，任由自己被塞进位置。可怜的男孩。只要有机会，你就会尽量照顾他，但其他人对他总是那么粗暴。随着部落里新成员的增加，现在的后宫根本不够满足他们所有人。看来目前，他只能被迫成为女孩中的一员了。[pg]");
         outputText("人群中安静下来，他们站在那里，色眯眯地盯着他们忠诚的后宫那丰满多汁的臀部。另一边的人则撑起了他们的缠腰布，盯着他们母狗们微张、流着口水的嘴唇。一个熟悉的、低沉的声音响起，[say:操。]你最年长的儿子从来都不怎么爱说话。");
         dynStats(DynStat.Lust(35),DynStat.Sens(15));
         doNext(minotaurGangBadEndPart3B);
      }
      
      public function minotaurGangBadEndPart2B() : void
      {
         clearOutput();
         get_images().showImage("minotaur-gangbadend-part2b");
         outputText("你感觉自己像是在漂浮，躺在云朵般的床上，每一根神经都在释放着纯粹的快乐和幸福。有一阵湿润的啪啪声在纠缠着你，但你闭上眼睛，不去理会，让你的手指在你的[chest]上游走，去");
         if(get_player().hasFuckableNipples())
         {
            outputText("滑入你的乳头小穴，用手指抠弄你胸部的小穴，稍微模拟一下下面正在发生的事情。");
         }
         else if(get_player().biggestLactation() >= 1)
         {
            outputText("拉扯你滴水的乳头，释放出浓稠的奶油状乳汁。");
         }
         else
         {
            outputText("拉扯你酸痛的乳头。");
         }
         outputText("你像个婊子一样呻吟着，在你的牛头人情人身下喘息着，忘却了整个世界，每次你的" + get_player().vaginaDescript(0) + "收缩夹紧入侵者时，你都几乎要高兴地尖叫起来。你翻着白眼，嚎叫着，终于达到了你渴望的高潮。一想到是你儿子粗暴的操弄让你高潮，这种感觉就更加强烈了。意识到你永远也离不开这个地方，你接受了你的命运，让你的身体告诉你该怎么做，而现在，它想做的就是继续高潮。[pg]");
         outputText("你肉棒周围有节奏的收缩让迷你牛头怪兴奋起来。他沉重的睾丸在你的身体上弹跳，翻滚摇晃，通过插在你小穴里的粗大肉棒泵出大量的精液。你能感觉到他的龟头在你的子宫颈处紧绷，尿道泵出如洪流般的精液");
         if(get_player().get_pregnancyIncubation() == 0)
         {
            outputText("射入你空虚的子宫");
         }
         else
         {
            outputText("射在你怀孕子宫被堵住的入口上");
         }
         outputText("，释放出如此之多，以至于有一股喷射出来，顺着你的[leg]流下。那只是第一股！第二股精液填满了你[vagina]的每一个角落，你的入口变成了一团白色的粘液和湿滑的淫液。积蓄已久的肉棒在高潮中不断收缩，将一股又一股麻醉性的奶油射入你喷精的小穴，你身下的枕头很快就吸收了多余的、令人上瘾的精液。[pg]");
         outputText("你的儿子叹了口气，瘫倒下来，他的肉棒慢慢地从你被蹂躏的阴户中滑出，伴随着一声湿润的“啵”声拔了出来。一条白色的河流从你的身体里滚落出来，进一步弄脏了房间的陈设。你因这种感觉而颤抖，因为它引发了一系列微小的、迷你高潮。当你沉浸在快感中时，迷你牛头怪离开了，他缠腰布里的凸起明显变小了。与此同时，其他女孩挤在你周围，舀起她们能收集到的你男孩的液体爱意，并把它塞进她们贪婪、淫荡的嘴里。牛娘勤奋地开始工作，用她巨大的舌头在你的[vagina]上舔舐，舀出她能得到的每一滴。你高潮在她的脸上，把精液和你女性的淫液溅了她一身。她微笑着亲吻你仍然敏感的阴蒂，让你陷入了令人昏厥的高潮。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Inte(-10),DynStat.Lib(10),DynStat.Sens(10));
         doNext(minotaurGangBadEndPart3A);
      }
      
      public function minotaurGangBadEndPart2A() : void
      {
         clearOutput();
         get_images().showImage("minotaur-gangbadend-part2a");
         outputText("你因为自己的需求而颤抖着，站起身来，弯下腰");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("向前");
         }
         else
         {
            outputText("向后，像蛇一样");
         }
         outputText("向你最小的儿子展示你[vagina]饥渴的开口。这就是他所需要的所有邀请。他双腿间坚硬的工具向前射出，将野兽般的头部插入你润滑良好的开口，给你湿润的嘴唇带来一阵强烈的快感。向前滑动，这根宏伟的牛头人工具埋入你湿透的小穴中，仿佛它本来就该在那里，唾液、强效的牛头人精液和你自己饥渴的体液让它的进入变得容易。[pg]");
         outputText("迷你牛头怪低头看着你，他那怪物般的口鼻上带着感激的表情。当他骑上你时，他淫荡地让舌头挂在嘴外，几滴唾液滴落，因为他在占有你的激情中忘记了自己，这打破了这幅画面。当他推进时，他不断滴落的先列腺液形成一条小溪，从他的粗壮处流出，最终将他的顶端顶在你的子宫颈上，他包皮松弛的皮肤似乎在抚摸你的阴唇和阴蒂。你幸福地尖叫起来，感觉到温暖从你的小穴向外蔓延，因为他更多的精华滴入你的体内。[pg]");
         outputText("你已经感到一阵愉悦的嗡嗡声和刺痛感，你抓住他的臀部，将自己贴向他，让你们俩在这个铺满枕头的房间里弹跳。当你被她们渴望的人狂野地操弄时，激情的咕哝和呻吟声挑逗着其他女孩。你的[vagina]就像一个欲望的熔炉，里面渴求的火焰随着那根奇妙的牛头怪肉棒的每一次抽插而变得越来越热。你那最小的兽人喘着粗气，尽他最大的努力操你，虽然他的阴茎远没有他哥哥肿胀的肉棒那么大，但他滴入你子宫的浓稠、积蓄已久的药物让你一直处于高潮的边缘。[pg]");
         dynStats(DynStat.Lust(25));
         doNext(minotaurGangBadEndPart2B);
      }
      
      public function minotaurGangBadEnd() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("你瘫倒在地上，双膝跪地，抬头看着周围的人群。有几十个发情的野兽般的身影，他们牛一样的脸上都因为你现在的状态而扭曲出淫荡的笑容。你能闻到空气中浓烈的麝香，浓重得似乎模糊了你的视线。你大口大口地吸着这气味，瘫倒在地，任由你的[legs]不由自主地张开，向这些发情的兽人完全暴露你[vagina]的褶皱。他们围着你，急不可耐地脱下遮羞布，争先恐后地想要操他们乱伦的母亲。你脑海中闪过所有你曾经处于类似情况的画面，这些想法模糊在一起，变成了一场漫长的、充满药物刺激的性爱幻象。[pg]");
         outputText("你咯咯地笑着，意识到类似的一幕即将再次发生在你身上。一滴淫液从你的[vagina]漏到干燥的山地泥土上，向你的男孩们展示你有多么兴奋能承受他们滴着水的马鸡巴。[say:来妈妈这里，]你柔声说道，已经陷入了麝香精液欲望的迷雾中。[pg]");
         outputText("回答你的是一阵震耳欲聋的轰鸣笑声，大得让你的耳朵嗡嗡作响。汗水湿透的肌肉包裹着你松弛、神志不清的身体，将你扛在一个强壮的肩膀上。一个像岩石滑落般低沉温柔的声音说道：[say:来吧，你再躲着我们也没意义了。]他们把你带到一个不知道是哪里的地方，可能是一个隐藏在深山里的村庄。你漫不经心地想，那里是否还有更多性感……强壮……英俊的公牛来侵犯你。也许他们的鸡巴比他们兄弟的还要大！此时你深深地陷入了幻想中，以至于你意识的唯一外在暗示就是偶尔的呜咽，以及伴随着粘液喷射到那个野兽背上的声音。[pg]");
         outputText("突然，你从高处被扔进了一堆柔软的枕头里，你的身体像个破布娃娃一样扑通一声摔在柔软的枕头上。环顾四周，你意识到自己在一个简陋的小屋里，里面塞满了枕头，而且你不是唯一一个在这里的人！其他人四仰八叉地躺在床垫堆里，他们都赤身裸体，而且大多数都怀孕了。你不经意间看到一个地精，她怀孕的肚子大得让你怀疑她还能不能动；一个狼人，皮毛上沾满了精液；一个半人马娘，有着巨大的、充满乳汁的乳房；还有一个牛娘，她正忙着玩弄自己肿胀的阴蒂，同时抚摸着她装满婴儿的紧绷肚皮。还有一些身体半埋在枕头和毯子里，但他们似乎在绒毛中睡得太沉，你无法看清任何细节。[pg]");
         outputText("这个地方似乎很舒适，尽管其他女孩似乎用几乎掩饰不住的嫉妒甚至愤怒的眼神看着你。一个苗条的身影从阴影中走出来。你认出他是你孩子中最小的一个，迷你牛头怪。他一丝不挂，虽然他的信息素比他体型更大的同类要弱，但仅仅是他的出现就足以让你的小穴湿透。其他女孩向他爬去，抓着他的腿，向他承诺她们小穴的天鹅绒般的紧致。他的鸡巴变得坚硬如石，立刻开始在她们身上滴下液体，他颤抖的睾丸和肿胀的鸡巴里跳动的血液，痛苦地显露出他的需求。[pg]");
         outputText("这个小个子从女孩们中间挤了过去，无视她们失望的撅嘴，来到你面前。[say:嘿……其他人还在庆祝把你加入后宫。我想也许我可以确保你适应了，而且……嗯，如果你不介意的话，我真的憋坏了。他们通常不让我进后宫，]迷你牛头怪承认道，回头看着门，眼神中带着一丝担忧。[pg]");
         outputText("你咯咯地笑了。整天无所事事，还能一直吸几十个牛头人的精液？这就是天堂。当然，你本来应该在外面与恶魔战斗，但你却任由这些毛茸茸的大野兽一次又一次地强暴你，直到你甚至不确定自己为什么要反抗。现在呢？有一根鸡巴，顶端滴着先列腺液，正等着你把精液吸出来。只要能让你吸下去，感受到它在你湿透的下体中爆发，你愿意待在任何地方。[pg]");
         get_images().showImage("minotaur-gangbadend");
         outputText("你点点头，舔了舔这个可怜的男孩，手里握着他肿胀的肉棒，同时伸手去解开你的[armor]。当你的手指只碰到你自己的[skinfurscales]时，你吓了一跳。看来在来这里的路上，你身上所有的装备都被脱掉了。你和这里的其他荡妇一样赤身裸体！至少你的裸体能让你更容易让这个可怜的家伙高潮。此时穿衣服似乎是白费力气。[pg]");
         outputText("你用手托住沉重、颤抖的阴囊，抚摸着小牛头人颤抖的肉棒，每次你的手指摩擦过他鸡巴上三个中间隆起的敏感皮肤时，都会引起一阵阵快感的颤栗。你挑逗地用舌头绕着他的龟头转了几圈，接住从他尿道口滚落的新鲜先列腺液，让它们流回你的嘴里。他喘着粗气，显然很喜欢你的抚摸，想要爆发，但仅靠几下舔舐和手淫是不够的。感觉到他的需求，你将他扁平、宽大的鸡巴顶端塞进嘴唇，用力吸吮，让他的龟头完全充血，同时你的唾液浸透了他野兽般的皮肤。[pg]");
         outputText("你充满爱意地捏了捏小兽人沉重的睾丸，然后猛地向后一缩，让肿胀的鸡巴从你嘴里弹出来，悬在那里，沾满了唾液。");
         dynStats(DynStat.Lust(25),DynStat.Lib(5),DynStat.Sens(15));
         doNext(minotaurGangBadEndPart2A);
      }
      
      public function minotaurDeFeet() : void
      {
         clearOutput();
         if(get_player().get_gender() == 3)
         {
            get_images().showImage("minomob-falling-herm");
         }
         else if(get_player().get_gender() == 2)
         {
            get_images().showImage("minomob-falling-female");
         }
         else
         {
            get_images().showImage("minomob-falling-male");
         }
         if(!get_player().hasVagina())
         {
            outputText("当你颓然倒下认输时，你那群饥渴的野兽孩子们注意到了你缺失的女性特征。他们不满地咆哮着离开了，但在离开前把你踢晕了。[say: 婊子。]");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().get_HP() < 1)
         {
            outputText("你被彻底击败了。你遍体鳞伤，疲惫不堪的身体几乎无法动弹，颓然倒在地上。牛头怪们踩着沉重的步伐靠近，微笑着期待着即将发生的事情。你张大嘴巴，盯着他们脱下那浸满先列腺液的微小遮羞布，露出那让他们这个种族如此出名的巨大、独特的阴茎。不知是巧合还是恶意的安排，其中一块破布不偏不倚地落在了你的脸上，你惊讶地倒吸了一口凉气。就像一道闪电劈中你的脊椎，性欲以雷霆万钧之势击中你，当你把那块黏糊糊的布从脸上甩开时，你被震得向后退去。所有抵抗的念头都被你那渴望的潮水彻底冲刷殆尽，你张开[legs]，让自己成为一个更容易的目标。在血管中流淌的性欲赋予了你力量，你撕下你的[armor]，焦急地等待着这些兽人接下来的计划。[pg]");
         }
         else
         {
            outputText("你太兴奋了，无法战斗，太饥渴了，无法思考，颤抖得太厉害，无法站立。你瘫倒在泥土中，扯下你的[armor]并把它扔到一边；它只会碍事。你把屁股撅在半空中，诱人地来回扭动，因为你的渴望");
            if(get_player().wetness() <= 2)
            {
               outputText("开始从你的");
            }
            else if(get_player().wetness() <= 4)
            {
               outputText("从你的");
            }
            else
            {
               outputText("如潮水般从你的");
            }
            outputText(get_player().vaginaDescript(0) + "。");
            if(get_player().hasCock())
            {
               outputText("" + get_player().SMultiCockDesc() + " 变硬并悬垂在地面上方，与你饥渴的阴户产生共鸣，渗出液体。当然，它很可能会被无视——发情的牛头怪对别人的阴茎没什么兴趣。");
            }
            outputText("兽人们脱下他们那保养得极差的遮羞布并扔掉，不过其中一个在扔掉之前，把他的遮羞布抹在你的脸上，那麝香般的气味让你的身体陷入了疯狂。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 25 && get_player().minotaurNeed())
         {
            minotaurGangBadEnd();
         }
         else if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216)
         {
            if(get_player().get_pregnancyIncubation() > 120)
            {
               analSpearSemiPregMinotaurGangbang();
            }
            else
            {
               loseToMinoMobVeryPregnant();
            }
         }
         else
         {
            nonAddictMinotaurGangBang();
         }
      }
      
      public function meetMinotaurSons() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         dynStats(DynStat.Lust(10));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,325,FlagDict_Impl_.arrayReadInt(_loc1_,325) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,325) == 1)
         {
            get_images().showImage("monster-minomob");
            if(!get_player().minotaurAddicted())
            {
               outputText("你在丘陵般陡峭的高山中探索，寻找下一场战斗、物品或发现，以离你的目标更近一步。烈日如恶毒的火焰般炙烤着你的后背，似乎每走一步都要把你放在[armor]里烤熟。你抬起手臂擦去额头上流下的汗水，但当你放下手臂时，你面临着一个最不受欢迎的景象。[pg]");
               outputText("三个牛头人从铁锈红色的岩石后面出现，以你为中心排成一个粗略的半圆形。其中两只是体型巨大、肌肉发达的公牛，它们跺着蹄子，一边绕着你转，一边漫不经心地打着响鼻。从它们口鼻和眼睛相似的形状和大小来看，你猜它们是兄弟。然而，最后一只却和他的兄弟们完全不同。他们拥有巨大、笨重的肌肉，而他的肌肉却柔软且几乎看不见。他相对较小，只有五英尺多一点高，从他的表情到他娇小的步伐，都散发着害羞和女性化的气息。你甚至怀疑他是不是一个真正的牛头人。[pg]");
               outputText("你准备好你的[weapon]并摆出战斗姿势，肌肉已经因为如此多牛头人紧密聚集在一起而散发出的催情、麻痹神经的麝香而颤抖。他们不是你对付过的第一批散发春药的兽人，尽管你已经");
               if(get_player().cor < 33)
               {
                  outputText("享受了他们比你应该得到的更多的爱意");
               }
               else if(get_player().cor < 66)
               {
                  outputText("不止一次沉迷于他们美妙的精液中");
               }
               else
               {
                  outputText("从未想过拒绝这些美妙的射精机器的操弄");
               }
               outputText("，这些畜生会发现你不是容易对付的猎物。由于肾上腺素在你的血管中流淌，你微微颤抖着，你坚持住，但他们只是盯着你，甚至没有挥舞武器。你被激怒了，大声喊出挑战，希望能激怒他们犯下愚蠢的错误。[pg]");
               outputText("[say: 看来妈妈不认识我们了，]三个中最大的那个在低沉、隆隆的笑声中说道。[pg]");
               outputText("第二大的兄弟冷笑了一声，评论道，[say: 你会认为她至少在遇到她的孩子们时会认出他们。也许我们的爸爸把她打得太惨了？]过了一会儿，让他的评论深入人心，你惊呆了。[pg]");
               outputText("这么一想，毛发花纹");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 3)
               {
                  outputText("一些");
               }
               outputText("你生下的牛头人的毛发图案与这些牛头人的皮毛完美匹配——这些牛头人一定是你长大的后代。那个小个子结结巴巴地问，[say: 既-既然她看起来脑死亡了……你们这次能让我用她的屄吗？我从来没有得到过任何小穴！][pg]");
               outputText("你忍不住笑了，夹杂着母亲的骄傲和理性的担忧。你的后代为你计划了什么？从那三条变硬的缠腰布来看，他们不会再忍耐太久了。你会怎么做？");
               menu();
               addButton(0,"战斗",fightOTaurs);
               addButton(1,"屈服",submitToMinotaurMob);
               addButton(2,"谈判",negotiate);
               addButton(3,"逃跑",runFromMinotaurs);
            }
            else
            {
               outputText("你在丘陵般陡峭的高山中探索，寻找下一场战斗、物品或发现，以离你的目标更近一步。烈日如恶毒的火焰般炙烤着你的后背，似乎每走一步都要把你放在[armor]里烤熟。你抬起手臂擦去额头上流下的汗水，但当你放下手臂时，你面临着一个最不受欢迎的景象。[pg]");
               outputText("三个牛头人从铁锈红色的岩石后面出现，以你为中心排成一个粗略的半圆形。其中两只是体型巨大、肌肉发达的公牛，它们跺着蹄子，一边绕着你转，一边漫不经心地打着响鼻。从它们口鼻和眼睛相似的形状和大小来看，你猜它们是兄弟。然而，最后一只却和他的兄弟们完全不同。他们拥有巨大、笨重的肌肉，而他的肌肉却柔软且几乎看不见。他相对较小，只有五英尺多一点高，从他的表情到他娇小的步伐，都散发着害羞和女性化的气息。你甚至怀疑他是不是一个真正的牛头人。[pg]");
               outputText("你开始准备你的[weapon]并摆出战斗姿势，危险地摇晃着靠近你面前的一个强壮的、产生药物的标本。他们不是你对付过的第一批散发春药的兽人，差得远呢，但你的一部分只是迫不及待地想看看这些尝起来会是什么味道。由于压倒性的、成瘾引起的需要流经你的血管，你微微颤抖着，你试图克制自己并打一场好仗。他们只是盯着你，甚至懒得挥舞武器。天哪，他们闻起来太香了！他们为什么还没试着强奸你！？你心不在焉地挑逗着你的一个乳头，同时等待着天生占主导地位的牛头人采取行动。[pg]");
               outputText("[say: 看来妈妈认不出我们了，] 三个中最大的那个在低沉的隆隆笑声中说道。[pg]");
               outputText("第二大的兄弟坏笑着说：[say: 你会觉得她至少在见到自己的孩子时能认出来。也许她太渴望精液了，连怎么说话都忘了？是这样吗？妈妈是个渴望精液的婊子吗？][pg]");
               outputText("你目瞪口呆，满足渴望的欲望暂时被意识到真相的震惊所取代。[pg]");
               outputText("然而，现在你仔细想想，这些牛头人的毛发图案<b>确实</b>与");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 3)
               {
                  outputText("一些");
               }
               outputText("你的后代完美匹配……这些牛头人一定是你长大的孩子。那个小个子问道：[say: 既、既然她已经这么渴望精液了，这次我能用她的小穴吗？她生我们的时候可能已经精疲力尽了，所以我打赌那是她最差的洞。你们不介意吧？][pg]");
               outputText("从那三条变硬的缠腰布和随后湿润的凸起判断，你很难拒绝他们的提议。");
               if(get_player().cor < 33)
               {
                  outputText("你不会为了再尝一口精液就和自己的孩子做爱吧……对吧？");
               }
               else if(get_player().cor < 66)
               {
                  outputText("你在道德上不知道该作何感想，但你忍不住舔了舔嘴唇，幻想着你这些好孩子们如此乐意给你的满足感。");
               }
               else
               {
                  outputText("谁在乎他们是不是你的孩子？他们都长大了，而且闻起来那么……诱人。");
               }
               menu();
               addButton(0,"战斗",fightOTaurs);
               addButton(1,"屈服",submitToMinotaurMob);
               addButton(3,"逃跑",runFromMinotaurs);
            }
         }
         else
         {
            get_images().showImage("monster-minomob");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 20)
            {
               if(!get_player().minotaurAddicted())
               {
                  outputText("没过多久，你在山里的探索就让你再次与你的牛头人后代面对面。这里有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326)) + "个，在你周围排成一个松散的半圆形。你能闻到空气中他们那熟悉又催情的体味；虽然这让你的下体一阵酥麻，但你决心抵抗它。");
                  if(get_player().wetness() <= 2)
                  {
                     outputText("一股湿润的液体几乎立刻顺着你的[leg]流了下来。");
                  }
                  else if(get_player().wetness() <= 4)
                  {
                     outputText("仅仅是气味侵入你的鼻腔，源源不断的汁液几乎立刻就浸湿了你的[legs]。");
                  }
                  else
                  {
                     outputText("随着你的身体反映出血管中流淌的淫荡欲望，大量的淫液几乎立刻浸湿了你的[armor]和[legs]。");
                  }
                  outputText("[pg]这可能会有点困难。");
                  outputText("[pg]体型最大的那个将双臂交叉在他宽阔、轮廓分明的胸前，冷笑了一声，然后咕哝道，");
                  if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216 && get_player().get_pregnancyType() == 2)
                  {
                     outputText("[say: 怀着我们的另一个兄弟，你这就又回来要更多了？]");
                  }
                  else if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216)
                  {
                     outputText("[say: 呵……看来妈妈合不拢腿，被什么害虫搞大了肚子。你真是让你亲爱的家人失望。不过别担心，妈妈，我们还是会操你的。]");
                  }
                  else
                  {
                     outputText("[say: 嘿，妈妈，回来是想让我们再干你一次吗？我们正缺个弟弟呢。]");
                  }
                  outputText("[pg]");
                  outputText("[saystart]不，她只是回来继续上瘾的，不是吗，亲爱的母亲？你回来看望你的儿子们，狂饮我们的精液，直到你从你的");
                  if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 216)
                  {
                     outputText("即将");
                  }
                  outputText("怀孕的小穴里把剩下的残渣都掏出来，[sayend]另一只牛头人嘲笑道。[pg]");
                  outputText("这窝里最弱小的那只躲在后面，一边自慰一边抱怨，哀怨地嘟囔着什么时候轮到他。如果你不是大老远就能闻到他滴下的先列腺液的味道，那可真是太可悲了。[pg]");
                  outputText("你要怎么做？");
               }
               else
               {
                  outputText("你进山探索没多久，就再次与你的牛头人子嗣面对面了。这里有 " + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326)) + " 只，在你周围排成一个松散的半圆形。你能闻到它们熟悉的、令人兴奋的气味在你周围飘荡，虽然你想坚强，但你最想做的莫过于把脸埋在那些缠腰布下，开始吸吮你拥有如此优秀孩子们的奖励。");
                  if(get_player().wetness() <= 2)
                  {
                     outputText("一股湿润的液体几乎立刻顺着你的[leg]流了下来。");
                  }
                  else if(get_player().wetness() <= 4)
                  {
                     outputText("仅仅是气味侵入你的鼻腔，源源不断的汁液几乎立刻就浸湿了你的[legs]。");
                  }
                  else
                  {
                     outputText("随着你的身体反映出血管中流淌的淫荡欲望，大量的淫液几乎立刻浸湿了你的[armor]和[legs]。");
                  }
                  outputText("你心不在焉地捏了捏乳头，舔了舔嘴唇，满怀期待。[pg]");
                  outputText("体型最大的那只双臂交叉抱在宽阔、轮廓分明的胸前，坏笑了一下，然后咕哝道，");
                  if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216 && get_player().get_pregnancyType() == 2)
                  {
                     outputText("[say: 怀着我们的另一个弟弟，你这么快就回来再爽一次了？当初干嘛要走呢？]");
                  }
                  else if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216)
                  {
                     outputText("[say: 呵……你合不拢腿了，是吧，妈妈？看来你也怀上了害虫的种！你真是让我们家失望……不过别担心，我们还是会让你爽的。]");
                  }
                  else
                  {
                     outputText("[say: 嘿，妈妈！你回来是想让我们再把你肚子搞大吗？呵。了解你的话，你大概只是来这里再吸点精液的。]");
                  }
                  outputText("[pg]");
                  outputText("[say: 亲爱的弟弟，你怎么能说我们母亲的坏话呢？她是一个美丽而奇妙的精液垃圾桶——一个名副其实的吞精圣女，]第二大的牛头人嘲讽道。[say: 我们唯一应该问的问题是，她会不会像个好婊子一样把屁股撅到半空中，还是让我们费点力气。][pg]");
                  outputText("这窝里最弱小的那只，也就是“小牛头人”，躲在队伍后面，一边自慰一边怯生生地抗议说“该轮到他了”。他绕过他两个巨大的哥哥，抱怨道，[say: 妈妈，我能用你的小穴吗？我憋得太难受了，而且我的屁股被大哥弄得还疼呢！][pg]");
                  if(get_player().minotaurNeed())
                  {
                     outputText("在毒瘾的强烈需求下，你的大脑已经开始变得模糊，你做了像你这样的瘾君子在这种情况下唯一能做的事——四肢着地，准备好被使用。");
                     doNext(submitToMinotaurMob);
                     return;
                  }
                  outputText("空气中的气味让你的大脑变得模糊，但谢天谢地，你现在并没有出现戒断症状。你可以尝试反抗，甚至可能反败为胜，或者你可以逃跑。");
               }
               menu();
               addButton(0,"战斗",fightOTaurs);
               addButton(1,"屈服",submitToMinotaurMob);
               addButton(2,"逃跑",runFromMinotaurs);
            }
            else
            {
               if(!get_player().minotaurAddicted())
               {
                  outputText("在探索时，你再次偶然闯入了你儿子们的领地。你几乎能看到空气中弥漫的麝香，浓郁得仿佛能用刀切开。在远处的某个地方，欢愉的咕哝声和哞哞声响起，在岩石峭壁上回荡。显然，你的一个男孩找到了一位愿意为部落繁衍后代的雌性，从你听到的声音来看，他们似乎正在以狂热的激情交配。你发现自己开始想象一双强壮的大手，捏住你的臀部，引导你坐上一根粗壮的肉棒，被骑乘和配种。[pg]");
                  outputText("一声困惑的冷哼将你从白日梦中唤醒，你现在再次与你最大的儿子面对面。他冷笑着咕哝道，[saystart]嘿，妈妈……");
                  if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 216)
                  {
                     outputText("回来给部落添丁了？");
                  }
                  else if(get_player().get_pregnancyType() == 2)
                  {
                     outputText("回来炫耀你正在孕育的小弟弟？");
                  }
                  else
                  {
                     outputText("让一个弱鸡搞大肚子之后，回来看看真正的种马了？");
                  }
                  outputText("[sayend] 你的脸颊因为这淫荡的暗示而泛红，他的话唤起了你被无数牛头怪填满小穴、疯狂配种的愉悦记忆。[pg]");
                  outputText("[say:你这个肌肉长进脑子里的蠢货，妈妈才不是为了那个来的。她可能是来被精液塞满，直到感觉脑浆都要从耳朵里流出来为止，]第二个熟悉的声音嘲讽道。[say:妈妈知道和牛头怪做爱有多爽，我们会把她串烤的，对吧男孩们？]这是你第二大的儿子，而且他不是一个人——这里有一整个牛头人部落。你数了数，至少有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326)) + "个，在你周围围成了一个由肌肉和皮毛组成的坚不可摧的圆圈。你不可能逃脱，除非先撕开一个缺口。[pg]");
                  outputText("天哪，你湿透了。");
                  if(get_player().wetness() >= 5)
                  {
                     outputText("你能感觉到你的淫液从[armor]下毫无阻碍地流出；那是真正的渴望洪流，由你的身体对空气中信息素的原始反应所滋养。");
                  }
                  else if(get_player().wetness() >= 3)
                  {
                     outputText("你能感觉到你的淫液从[armor]下滴落，由你的身体对空气中信息素的原始反应所滋养。");
                  }
                  else
                  {
                     outputText("你能感觉到你的[armor]紧贴着你湿透的下体，空气中的信息素让这种液体的渴望不断增长。");
                  }
                  outputText("许多缠腰布都湿透了，几乎滴下了牛头人大量的先列腺液。你可以看到他们巨大、肿胀的睾丸的曲线和隆起——看起来这些可怜的家伙为你攒了相当大的一发。一个在牛头怪精液的海洋中迷失自我的幻想在你的脑海中闪过……[pg]");
                  outputText("不！");
                  if(get_player().cor < 33)
                  {
                     outputText("你不能这么想！当然，你生下的牛头怪足以建立这个庞大的发情怪物部落，但你是个勇者！");
                  }
                  else if(get_player().cor < 66)
                  {
                     outputText("你不该这么想！当然，你体内已经有过足够多的牛头怪，足以繁衍出这个肌肉发达的兽人部落，但你还有任务要专心完成。");
                  }
                  else
                  {
                     outputText("你不该这么想！外面还有一大群其他生物等着被干翻，如果你的男孩们想分一杯羹，他们才应该是跪下来准备被干的那个！");
                  }
                  outputText("你该怎么做？");
               }
               else
               {
                  outputText("在探索时，你再次偶然闯入了你儿子们的领地。你几乎能看到空气中弥漫的麝香，浓重得仿佛能用刀切开。在远处的某个地方，愉悦的咕哝声和牛叫声回荡在岩石悬崖上。显然，你的一个男孩找到了一个愿意为部落繁衍后代的雌性，从你听到的声音来看，他们似乎正在狂热地交配。你发现自己开始想象那个场景，想象着那双强壮的大手捏住你的臀部，引导你骑上一根粗壮的肉棒。你在期待中微微颤抖，想知道自己该如何获得下一剂精液。[pg]");
                  outputText("一声困惑的哼声将你从白日梦中唤醒，你再次与你最强壮的儿子面对面。他坏笑着咕哝道，[saystart]嘿，妈妈。");
                  if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 216)
                  {
                     outputText("来生个宝宝？还是只是想被精液填满？");
                  }
                  else if(get_player().get_pregnancyType() == 2)
                  {
                     outputText("回来要更多精液？我打赌你下一个儿子生出来会是个吸精的迷你牛头怪。我们这里正好需要另一个肉便器。");
                  }
                  else
                  {
                     outputText("让一个弱鸡搞大肚子后，回来看看真正的种马？别担心，我们会让你把那事忘得一干二净。");
                  }
                  outputText("[sayend] 淫荡的暗示让你的脸颊泛起红晕，他的话唤起了你与这些野兽在药物作用下进行性狂欢的愉悦记忆。[pg]");
                  outputText("[say:你这肌肉长脑子里的蠢货，别浪费妈妈的时间了。她宁愿被操也不想听你废话，]另一个熟悉的声音嘲讽道。[say:现在快点，她有很多洞需要填满。看看她的眼睛——如果要满足她，我们就得把她塞满。]那是你第二强壮的儿子，而且他不是一个人——这里有一整个牛头人部落。你数了数，至少有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326)) + "个，他们围成一个由肌肉和皮毛组成的坚不可摧的圆圈。你不可能逃脱，除非先打开一个缺口。[pg]");
                  outputText("天哪，你湿透了。");
                  if(get_player().wetness() >= 5)
                  {
                     outputText("你能感觉到你的淫液从[armor]下毫无阻碍地流出；那是真正的渴望洪流，由你的身体对空气中信息素的原始反应所滋养。");
                  }
                  else if(get_player().wetness() >= 3)
                  {
                     outputText("你能感觉到你的淫液从[armor]下滴落，由你的身体对空气中信息素的原始反应所滋养。");
                  }
                  else
                  {
                     outputText("你能感觉到你的[armor]紧贴着你湿透的下体，空气中的信息素让这种液体的渴望不断增长。");
                  }
                  outputText("许多缠腰布也同样被弄脏了，几乎滴着牛头人大量的先列腺液。你可以看到他们巨大、肿胀的睾丸的曲线和隆起。看起来这些可怜的家伙为你攒下了相当大的一发。你幻想自己漂浮在牛头人精液的海洋中……是的！");
                  if(get_player().minotaurNeed())
                  {
                     outputText("这太完美了……你太需要它了！你四肢着地趴下，扭动着你那适合生育的臀部，希望他们能快点射进你体内。");
                     doNext(submitToMinotaurMob);
                     return;
                  }
                  outputText("这太棒了——这么多发情、情愿的男孩，都在这里等着你把他们榨干。即使你想离开，你也必须和他们战斗才能打开一个缺口。倒不如直接把他们打服，然后慢慢品尝他们美妙的精液。");
               }
               menu();
               addButton(0,"战斗",fightOTaurs);
               addButton(1,"屈服",submitToMinotaurMob);
            }
         }
      }
      
      public function loseToMinoMobVeryPregnant() : void
      {
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("最大的种马咕哝着，[say: 嘿。妈妈的身体看起来好像要爆炸了。] 他的兄弟把他推开，用毛茸茸的手抚摸着你紧绷的[skin]肚子，说道，[saystart]");
         if(get_player().get_pregnancyType() != 2)
         {
            outputText("她不知道怎么闭上她那饥渴的小穴。你可以看到害虫在她肚子里蠕动。真恶心。");
         }
         else
         {
            outputText("我能感觉到我们的小弟弟。现在不会太久了。");
         }
         outputText("既然你的子宫满了，你就得用你的其他洞穴来照顾我们。……别那样看着我，妈妈——你这么荡妇又不是我的错。[sayend][pg]");
         outputText("你皱起眉头，感到");
         if(get_player().cor < 33)
         {
            outputText("对这种侮辱性的称呼感到恼火");
         }
         else if(get_player().cor < 66)
         {
            outputText("对他们的自来熟感到厌烦");
         }
         else
         {
            outputText("对失去对局面的控制感到恼火");
         }
         outputText("。当然，下体不断升温的期待感让你很容易就忘记了这一点。你接受了现实，张开嘴，抬头看着你那发情的后代。你输了，除了献出你的嘴巴，把你的屁股撅给这群饥渴的兽人之外，你别无选择。他们一边玩弄着自己肿胀的巨根，一边嘲笑你那目瞪口呆的样子。");
         outputText("[pg]其中一个把他的龟头抹在你的额头上，留下了一道麝香味的黏液。这清楚地表明你是他的，即使他");
         if(get_player().get_pregnancyType() != 2)
         {
            outputText("不是");
         }
         else
         {
            outputText("可能不是");
         }
         outputText("你腹中胎儿的父亲。你因这气味而颤抖，那美妙的液体在你的[skinfurscales]上逐渐干涸，而那滑溜溜的龟头则顺势移到了你的唇边。你把下巴张得更大，让那根散发着麝香的肉棒塞进嘴里。它的味道像是咸咸的汗水、皮肤，以及先列腺液那美妙滋味的混合体。肉棒插得更深了，三圈包皮挤过你的嘴唇，龟头开始钻进你的食道。谢天谢地，它不断滴落的先列腺液抑制了你的呕吐反射，你现在唯一担心的就是自己到底要憋气多久。[pg]");
         outputText("长满绒毛的睾丸擦过你的下巴，它们缓慢蠕动着，沉甸甸地压在你的[face]上。你犹豫地舔了舔它们，卷走毛发上的汗水。刺鼻的信息素刺激着你的鼻子，尽管此时你的喉咙被肉棒塞得紧紧的，根本无法呼吸。这番口交让你的[vagina]变得湿漉漉的，随着你[legs]的每一次抽动和移动，都能听到汁水挤压的吧唧声。它渴望着被插入，但你那怀孕肿胀的子宫让你清楚，你的儿子们是不会碰它的。");
         if(get_player().hasCock())
         {
            outputText("从你[cocks]漏出的先列腺液提醒着你那可怜的、被忽视的男性特征，但你只能满足于伺候你儿子们那美味的器官。[pg]");
         }
         outputText("随着一阵强烈的冲击震撼你的身体，疼痛在你的[ass]蔓延开来。你本想回头看一眼，但嘴里的阴茎固定住了你的头，同时开始在你的喉咙里进进出出。又一记响亮的巴掌拍在你的屁股上，这次你清楚地感觉到那只毛茸茸的牛头怪大手就是让你不适的源头。嘴里的肉棒向后抽退，虽然没有完全离开你的嘴，但也足以让你通过鼻子吸入甜美、甜美的空气。它再次猛插进来，恰好伴随着又一记把屁股打红的巴掌，将你最后几英寸的距离推向那对汗津津的蛋蛋。[pg]");
         outputText("你抬起头，色眯眯地盯着悬停在离你仅几英寸远的" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) - 1) + "根肉棒。甚至连那只迷你牛头怪也在那里，看到他那淫荡、彻底堕落的母亲，他那较小的肉棒滴下了渴望的甜美汁液。这让你兴奋极了，甚至比你肚子里的精液还要让你兴奋。你伸出手抓住两根肉棒开始套弄，用湿热的先列腺液润滑着手指。");
         if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 3 || get_player().tail.type == 4 || get_player().tail.type == 7 || get_player().tail.type == 9 || get_player().tail.type == 12)
         {
            outputText("甚至你的尾巴也伸了上来，卷住第三根，抚摸着那粗壮的肉棒。");
         }
         outputText("[pg][say: 看来妈妈真的很享受呢，是吧？看看她，深喉着还像个瘾君子一样流口水。你有什么想为自己辩解的吗，妈妈？哦？你宁愿继续吸鸡巴也不愿说话？好吧，那行；继续吸吧，我想我兄弟马上就要给你个礼物了，]第二大的牛头怪预言道。[pg]");
         outputText("当感觉到那龟头在你的食道中膨胀，将你的喉咙撑到极限时，他预言般的话语应验了。葡萄柚大小的睾丸蹭着你的下巴，紧紧贴着牛头怪的身体，在阴囊内脉动收缩。精液在肉柱中泵送，撑胀了牛头怪的尿道，直到最后伴随着可听见的咕噜声，从马眼喷射进你的肚子里。兽人向后抽退，粗大的顶端刮过你的喉咙，在腾出的喉咙通道里留下一道精液的痕迹。最后，它挣脱了你饥渴的双唇，在上面涂满了浓稠的精液，并在你的脸上溅满了大团的种子。[pg]");
         outputText("[say: 好母狗，]他大声宣告着，最后几股精液喷洒在你身上。完事后，他转过身，大摇大摆地走开，并喊道：[say: 下一个！][pg]");
         outputText("排在第二位的傲慢家伙低头坏笑着，用他肿胀的肉棒拍打你的脸颊。[say: 来吧，别吸那些剩下的精液了，来尝尝新鲜的。][pg]");
         outputText("你咽下嘴里的精液，满足地叹了口气，像只小狗一样喘着粗气，一想到还能再吃一顿就兴奋不已。就连你的[legs]都被你流出的淫液弄湿了。在欲望的驱使下，你抛开了一切顾虑，猛地扑上前，将下一根肉棒吞入饥渴的嘴里，用舌头舔舐着滴着精液的马眼，试图吸出更多。你斗鸡眼看着那根肉柱滑入你的嘴里，直到完全消失。此时，你几乎感觉不到深喉这么大一根肉棒带来的肿胀、凸起和困难，你只能想象自己现在的样子——像个荡妇一样吸吮和口交，而刚才被颜射留下的精液还挂在你湿透的脸上，拉出长长的丝。[pg]");
         get_images().showImage("minomob-pregfuck");
         outputText("[saystart]神魔啊，妈妈，你真是个荡妇。看看你，大着肚子怀孕了，乳头都快喷奶了，你身上还沾着你一个儿子的精液，嘴里却在给下一个儿子口交。你这个贪得无厌的骚货。");
         if(get_player().get_pregnancyType() == 2)
         {
            outputText("那孩子估计也是我的。你居然让你儿子给他弟弟当爹。");
         }
         else
         {
            outputText("那个宝宝甚至都不是同一个物种的。你大概是被你遇到的每一个雄性搞大肚子的，但你总是回来给你儿子们口交。");
         }
         outputText("感觉怎么样，婊子？[sayend]那个塞满你嘴巴的肉棒主人问道。[pg]");
         outputText("你哼哼着，[say: 很好，]虽然发出的声音更像是，[say: 嗯嗯嗯嗯嗯。]你被药物麻痹的视线此刻全都是泡泡和联觉的彩虹。当另一只牛头怪继续拍打你的屁股时，他恶毒地轻笑起来。那个主导的牛头怪抓住你的");
         if(get_player().horns.value > 0)
         {
            outputText("角");
         }
         else
         {
            outputText("头发");
         }
         outputText("把你往后拉，你的舌头拖过他肉棒的下侧。然后，他突然改变动作，再次猛插进来。一旦他插到底，他再次反转方向——从不停歇，从不减速。他狠狠地、快速地操着你的脸，同时你的屁股被反复拍打。");
         outputText("[pg]疯狂的操脸以最后爆发性的射精结束，粘稠的精液喷射进你已经饱满的肚子里。这个兽人冷酷地抽身。他拔出的速度很快，以至于他大部分的精液都喷到了你沾满白浊的脸上和[hair]上。其中很多流下来浸透了你的[chest]和巨大的、怀孕的肚子。你现在看起来更像是一个涂满奶油的甜甜圈，而不是一个人，当你脑海中浮现出自己巨大的、怀孕的身躯躺在牛头怪精液水坑里，而兽人们把你的脸当成精液容器的画面时，你几乎要高潮了。[pg]");
         outputText("[say: 你的喉咙真紧，妈妈……对于一个婊子来说，]牛头怪一边后退一边说。你从他语气中的赞美之词中高兴地笑了起来，你太嗨了，以至于没有意识到这实际上是一种侮辱。片刻之后，你甚至连这也忘记了，因为下一根肉棒压在了你的嘴唇上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 8)
         {
            outputText("是那个迷你牛头怪的！他的肉棒远没有他兄弟们的那么巨大，尽管它仍然大到足以让你感到被撑开。在经历了你不得不忍受的激烈深喉之后，较小的肉棒和它喷出的先列腺液感觉像是一种香脂，舒缓了你酸痛的、涂满精液的喉咙。你急切地吞下它，无视你肚子的饱胀感，试图从你女性化的儿子那里榨取每一滴。迷失在你的口交天堂中，你放松下来，让肉棒将你固定在原地，当你的食道在深深插入的肉棒周围起伏时，睾丸拍打着你的下巴。[pg]");
            outputText("迷你牛头怪呻吟着，[say: 谢-谢谢……哦……我嗯——哦——现在射可以吗？][pg]");
            outputText("你抬头看着他，把舌头伸进他的包皮里，舔去他肉棒最深处的汗水，同时微微点头表示同意。他哞哞叫着，不稳地颤抖着，像破布娃娃一样摇晃着你，而你把他在你喉咙里跳动的肉棒含住。他紧绷的、很少使用的阴囊微微跳动了一下，然后他的肉棒将一股稳定的精液射进你充满精液的胃里。你惊叹于他的射精与他兄弟们巨大、脉动的喷发有多么不同。迷你牛头怪的高潮不知何故更加柔和，几乎是顺从的，它只是一次慵懒的释放，泄漏并滴落着它的精液之河。[pg]");
            outputText("完事后，这个女性化的怪物男孩退后并用口型说道，[say: 谢谢你。]他甚至体贴地把滴水的肉棒擦在他的缠腰布上，而不是你的脸上。你倒在地上咯咯地笑，[say: 不客气，]作为回应。在充满精液的胃里流淌的药物慢慢淹没了你的意识，感觉无比神圣，你在你儿子们的精液池中晕了过去。你隐约听到他们评论道，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) > 3)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) == 4)
               {
                  outputText("[say: 抱歉兄弟，看来妈妈不行了。你得晚点再找机会搞她了——她怀孕得厉害，我不想把她弄坏。]");
               }
               else
               {
                  outputText("[say: 抱歉兄弟们，看来妈妈不行了。你们得晚点再找机会搞她了——她怀孕得厉害，我不想把她弄坏。]");
               }
            }
            else
            {
               outputText("[say: 妈的，真爽。谁能想到像妈妈这样怀孕的婊子会是个这么棒的吸精狂？]");
            }
         }
         else
         {
            outputText("这是迄今为止最大的一个！你抬头看看你众多儿子中哪一个天赋异禀。他甚至没那么高。他只是一个看起来很普通的牛头怪，但他妈的**巨根**。他龟头的膨大是最糟糕的部分——它太宽了，你担心它会使你的下巴脱臼。当它进入你的喉咙，进一步拉伸你可怜的脖子时，你注意到他也没有像他兄弟那样漏液，尽管他的睾丸看起来大到足以让他在走路时感到极度不适。[pg]");
            outputText("你叹了口气，让那根超大的肉棒将你固定在原地，通过牢牢地卡在你的喉咙里来防止你摔倒。当这头种马咕哝着努力把你的嘴唇拉向他的腹股沟，滑过他肉棒后面巨大、肿胀的睾丸时，你的目光向下扫视。一个只有瘾君子或溺水者才会赞同的想法在你迷糊的大脑中成型，在理智有机会恢复之前，你决定付诸行动。[pg]");
            outputText("你伸出手，用手掌抓住那两个出汗的球体，开始抚摸、挤压和揉捏那两个可怜的、憋坏了的精液罐。它们在你的握力下颤抖，牛头怪的龟头在你体内膨胀得更宽，牢牢地固定在原位。你觉得即使你想拔也拔不出来了。谢天谢地，你没有这种想法。你继续你的睾丸榨汁，当你感觉到第一股先列腺液滴入你的肚子时，你高兴地“嗯嗯”叫着。[pg]");
            outputText("片刻之后，巨大的睾丸明显地颤抖起来，你知道你期待的时刻已经到来。在喉咙的紧绷、不断的哼哼声和挤压他的睾丸之间，这只可怜的野兽连一分钟都憋不住。他发出一声在山间回荡的“哞-哦哦哦”，然后狠狠地射了。他第一次喷发的精液实际上把他的肉棒部分地推出了你塞满奶油的喉咙。第二波有类似的效果，尽管这次它滑得足够远，以至于一些精液从你的鼻子里逃了出来。他不停地射精，每次都往后滑一点，直到最后拔出来，让你咳出口腔和鼻孔里的精液，这样你才能呼吸。[pg]");
            outputText("天赋异禀的牛头怪用他剩下的精液给你洗了个澡，用快速、无情的抽插在他的肉棒上泵动，用精液把你从头到脚浸透，一直流到你下面不断扩大的水坑里。你醉醺醺地咯咯笑着，倒在身侧，你紧绷的肚子从你落入的水坑里溅起一阵波浪。你放声大笑，让你的手在你充满精液——和后代——的身体上游走，特别注意你的[chest]和鼓得像鼓一样的腹部。[pg]");
            outputText("当下一个兽人走近时，流淌在你体内的麻醉剂开始让你难以招架，你的眼睛不由自主地闭上了。但这似乎对你的儿子们来说无关紧要。一根新鲜的肉棒塞进了你滑溜溜的喉咙里。你最后记得听到的是其中一个男孩大声说道，[saystart]小心点，兄弟们——她怀孕了，而且");
            if(get_player().get_pregnancyType() == 2)
            {
               outputText("我们可不想让部落的下一个成员受伤。");
            }
            else
            {
               outputText("我们可不想弄坏我们最喜欢的玩具，对吧？");
            }
            outputText("看看她，嘴里含着肉棒晕过去的时候还在笑。妈妈最棒了。[sayend]");
         }
         get_player().orgasm("Lips");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Cor(1));
         get_player().slimeFeed();
         get_player().minoCumAddiction(15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            get_player().sleeping = true;
            doNext(get_camp().returnToCampUseEightHours);
         }
      }
      
      public function forceMinitaurToGiveOral(param1:Number = 0) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("你急忙脱下[armor]的下半部分，露出你的[vagina]");
         if(get_player().hasCock())
         {
            outputText("和[cocks]");
         }
         outputText("。这群战败的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 20)
         {
            outputText("暴徒");
         }
         else
         {
            outputText("部落");
         }
         outputText("牛头怪看到这一幕精神一振，但你对他们充满希望的表情嗤之以鼻。[say:我希望你们别指望能得到这些。给我滚出去，别让我再抓到你们试图伏击我！]疲惫不堪的他们拖着身子站起来，走的时候还用色眯眯的眼神盯着你的女性特征。不过，你用[foot]踩住了那只迷你牛头怪的尾巴。他的嘴巴出奇的可爱，你打算好好利用一下。[pg]");
         outputText("这个娇小、女性化的兽人充满希望地抬头看着你。你让他爬向你，粉碎了他的希望。如果他想要你的小穴，他大可以好好求你。和那群野蛮人混在一起在你这里可得不到任何分数，你特意把这点告诉了他。他呜咽着说：[say:我-我没有选择，妈妈！他们欺负我，总是让我给他们口交。如果我们找不到人操，我就得用屁股挨操。一开始很疼……但现在如果他们几个小时不让我给他们口交，我就会焦躁不安。][pg]");
         outputText("这个可悲的迷你牛头怪已经无可救药地对兄弟们的精液上瘾了。你耸了耸肩，厌倦了他的抱怨，只想得到你极度渴望的满足。[saystart]抱怨你的问题并不能让它们消失。现在把你的嘴用起来，然后");
         if(param1 == 0)
         {
            outputText("开始舔妈妈的小穴。[sayend]为了强调你的观点，你");
            if(get_player().isTaur())
            {
               outputText("转过身");
               if(get_player().tail.type > 0)
               {
                  outputText("并抬起你的尾巴");
               }
               outputText("露出你闪闪发光的粉嫩女性特征。");
            }
            else
            {
               if(get_player().balls > 0)
               {
                  outputText("托起你的蛋蛋，然后");
               }
               outputText("用手指将你的[vagina]大大地掰开，露出你那闪闪发光的粉嫩私处。");
            }
            outputText("你的[clit]慢慢地从包皮中探出头来");
            if(get_player().getClitLength() >= 8)
            {
               outputText("，直到它那巨大的尺寸完全显露出来");
            }
            else if(get_player().getClitLength() >= 3)
            {
               outputText("，直到你那如肉棒般修长的女性器官完全显露出来");
            }
            else if(get_player().getClitLength() >= 1)
            {
               outputText("，直到那巨大的女性器官完全显露出来");
            }
            else
            {
               outputText("，露出它那可爱的小豆豆");
            }
            outputText("。");
            outputText("[pg]这个像女孩一样的“怪物”向前爬行，");
            if(get_player().isTaur())
            {
               outputText("消失在你的后腿下，开始履行他新接受的职责。");
            }
            else
            {
               outputText("他渴望地抬头看着你，向你的入口靠拢。");
            }
            outputText("他张开嘴，犹豫地将舌头伸向你的私处。很明显，他没有多少为女性口交的经验。既然你没打算在山里待太久，你抓住他短短的小角，把他拉向你的裂口。[pg]");
            get_images().showImage("minomob-won-pussysucker");
            outputText("迷你牛头怪的舌头防御性地向外伸出，轻松地滑入你的阴道口。它非常非常长，而且异常湿润。他灼热的呼吸拂过你的[clit]，当你把他的牛鼻子压在你的阴唇上时，周围的空气都起雾了。他湿润鼻子的凉意与他呼吸和舌头的热度之间的温差让你发狂。这个女性化的兽人热情地适应了他的任务，饥渴地舔舐和吸吮着你的[vagina]");
            if(get_player().getClitLength() < 3)
            {
               outputText("，甚至把你的阴蒂吸进嘴里，用舌头沿着它的长度舔舐。");
            }
            else
            {
               outputText("，甚至用手配合着他的舔舐，抚摸着你的阴蒂。");
            }
            outputText("[pg]你开始将你的[hips]在迷你牛头怪的兽吻上起伏，在这强迫的口交中摩擦并快乐地呻吟。");
            if(get_player().getClitLength() >= 6)
            {
               outputText("他像撸管一样套弄着你巨大的阴蒂，这难以置信的刺激让你无法承受。");
            }
            else
            {
               outputText("他同时吸吮和舔舐着你的小穴和阴蒂，用他的牛舌展示着隐藏的天赋。这简直让你无法承受！");
            }
            outputText("你高潮了——猛烈地射进了牛男孩的嘴里。他热情地舔舐着你的汁液——简直是个天生的舔穴好手。");
            if(get_player().wetness() >= 5)
            {
               outputText("喷涌而出的液体从他毛茸茸的下巴滴落，流下他的胸膛。");
            }
            else if(get_player().wetness() >= 4)
            {
               outputText("滴滴答答的液体从他毛茸茸的下巴滴落，流下他的胸膛。");
            }
            else if(get_player().wetness() >= 3)
            {
               outputText("滴落的液体顺着他毛茸茸的下巴流下，滴向地面。");
            }
            else if(get_player().wetness() >= 2)
            {
               outputText("一些液体从他嘴里漏出，顺着他毛茸茸的下巴流下。");
            }
            else
            {
               outputText("你所有的湿润都被他的舌头收集并吸进嘴里。");
            }
            outputText("你颤抖的小穴试图把这可怜男孩的舌头当成肉棒一样榨取，在你高潮时，实际上把他更紧地拉向你沾满淫液的阴唇。");
            if(get_player().hasCock())
            {
               outputText("咸咸的精液从你喷射的[cocks]滴落到他的背上，你的男性部分与你的女性部分一起高潮，奏响了一曲变态的交响乐。[pg]");
            }
         }
         else
         {
            outputText("开始吸妈妈硬邦邦的肉棒。[sayend] 为了强调你的观点，你");
            if(get_player().isTaur())
            {
               outputText("弯曲你的[cocks]拍打你的肚子。");
            }
            else
            {
               outputText("用一只手抚摸你的[cocks]。");
            }
            outputText("" + get_player().SMultiCockDesc() + "");
            if(get_player().get_lust100() < 50)
            {
               outputText("变硬了");
            }
            else
            {
               outputText("变得更硬了");
            }
            outputText("在他眼前，牛头人条件反射地舔了舔嘴唇，显然很享受为你口交的想法。[pg]");
            outputText("这个娘娘腔的“怪物”向前爬行，");
            if(get_player().isTaur())
            {
               outputText("消失在你的后腿下，开始履行他新接受的职责。");
            }
            else
            {
               outputText("渴望地抬头看着你，同时向[onecock]靠拢。");
            }
            outputText("他那棕色的大眼睛与你对视，张开嘴，让舌头完全伸出。完全伸展时大约有一英尺半长，当你想象那会是什么感觉时，[eachcock]抽搐了一下。谢天谢地，他没有让你等太久。[pg]");
            get_images().showImage("minomob-won-cocksucker");
            outputText("蛇一样的舌头蜿蜒");
            if(get_player().balls > 0)
            {
               outputText("绕过你的[sack]，然后卷曲");
            }
            outputText("绕着你的[cocks]根部。它盘旋而上");
            if(get_player().cockTotal() > 1)
            {
               outputText("一根");
            }
            else
            {
               outputText("那根");
            }
            outputText("肉棒，最后停在系带处。他舌头湿润的热度似乎渗入了你的阴茎肉里，让你感觉自己都要融化了，但这只迷你牛头怪才刚刚开始。他张大嘴巴，将你的" + get_player().cockHead() + "含入口中；它在里面残留的平坦舌头上性感地摩擦着，他熟练地吸吮着它，直到你的先列腺液滴在他的舌头上。他因此颤抖了一下，但这并没有让他");
            if(!get_player().isTaur())
            {
               outputText("移开视线或");
            }
            outputText("有丝毫减速。[pg]");
            if(get_player().hasVagina())
            {
               outputText("迷你牛头怪开心地哼着歌，将一根手指滑入你的[vagina]，虽然你没要求，但这额外的刺激只会加剧你的渴望。");
            }
            outputText("他那打着圈、扭动着的舌头在你的肉棒上下来回滑动，同时吸吮着顶端，给你带来了一场奇妙的舌交");
            if(get_player().cockTotal() > 1)
            {
               outputText("同时他抚摸着");
               if(get_player().cockTotal() > 2)
               {
                  outputText("你被冷落的其中一根阴茎");
               }
               else
               {
                  outputText("在你被冷落的阴茎上");
               }
            }
            outputText("。");
            if(get_player().hasVagina())
            {
               outputText("你开始射入你儿子的嘴里，你的小穴紧紧地包裹着他深入其中的手指。");
            }
            outputText("[pg]你的精液");
            if(get_player().cumQ() < 100)
            {
               outputText("不断地喷射进他的嘴里，在他的舌头上积聚，然后他大声地将其吞下。");
            }
            else if(get_player().cumQ() <= 250)
            {
               outputText("一次又一次地喷射进他的嘴里，在他的舌头上积聚，迫使他的脸颊微微鼓起，然后他才将其吞下。");
            }
            else if(get_player().cumQ() <= 1000)
            {
               outputText("喷射进他的嘴里，仅第一股就填满了它。他及时吞下以迎接下一股，并大声吞咽以跟上你的高潮。");
            }
            else
            {
               outputText("猛烈地喷射进他的嘴里，从他的唇角滴落，他的喉咙大声地试图吞下这巨大的精液流。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("精液从他的鼻孔流出，因为他完全失败了。");
               }
            }
            outputText("他在你结束前退了回来，让最后几波精液射在他的脸上。");
            if(get_player().hasVagina())
            {
               if(get_player().wetness() >= 5)
               {
                  outputText("在整个过程中，你的小穴喷水在他的胸膛上。");
               }
               else if(get_player().wetness() >= 3)
               {
                  outputText("你的小穴到处滴着淫液，把你的[legs]弄得一团糟。");
               }
            }
            outputText("这个迷你牛头怪鼻子上积着一滩精液的样子，看起来其实还挺可爱的。[pg]");
         }
         outputText("完事后，你把他推开，让他倒在地上，他的脸上沾满了你的淫水。这个可怜的迷你牛头怪勃起得比以往任何时候都要厉害，虽然他的肉棒看起来很诱人，但你已经满足了。你穿好衣服，给这个可怜的男孩飞了一个吻。[say:要乖乖听妈妈的话，好吗？]当你漫步离开时，他呆呆地点了点头。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function fightOTaurs() : void
      {
         startCombatImmediate(new MinotaurMob());
         spriteSelect(SpriteDb.get_s_minotaurSons());
      }
      
      public function disciplineEldestMinotaurSon() : void
      {
         var _g:Combat;
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("你那些任性的儿子以为他们能偷袭你。他们那大男子主义的虚荣心蒙蔽了双眼，没有意识到他们根本不是你的对手。你叹了口气，意识到他们下次可能还会试图哄骗你和他们做爱。作为一个母亲该怎么办呢？当你俯视着他们伤痕累累的身体时，他们抬起头看着你，眼中充满了渴望，肿胀的肉棒还在抽动。你捏得指关节咔咔作响作为回应，让你那粗野的后代吓得瑟瑟发抖。他们挣扎着站起来，开始匆忙撤退。你最大的牛头怪儿子在绝望地试图逃离母亲时，被自己的蹄子绊倒了。当他试图重新站起来时，你把重量压在他身上，把他按住。他转过头，看到你踩在他的尾巴上，吓得浑身发抖。[pg]");
         outputText("[say:你是最年长的吗？]你双臂交叉，目光严厉地问他。[pg]");
         outputText("[say:是的，]他哼了一声，试图装出一副勇敢的样子。他翻了个身，现在仰面躺着，好像在地上休息。[pg]");
         outputText("[say:解释一下，]你要求道。[say:作为最年长的，你应该给你的弟弟们树立榜样。][pg]");
         outputText("[say:母亲才应该树立榜样，而你树立的唯一榜样就是一个肮脏的婊子，]他大笑道。[say:想给妈妈注射精液有错吗？][pg]");
         outputText("对儿子的回答感到不满，你立刻一巴掌扇得他晕头转向，提醒他谁才是真正掌权的人。这一巴掌的力度让他像个迷你牛头怪一样傻笑，毫无疑问，他平时经常虐待这种生物。有时候，母亲必须给儿子一些严厉的爱。[pg]");
         outputText("打完一巴掌后，你迅速脱下[armor]的下半部分，你儿子游移的目光遇上了你的" + get_player().vaginaDescript(0) + "。他显然对自己看到的很满意；他那像马一样的肉棒带着赞许和期待抽动着。你当然不是年度最佳母亲；你的女性特征因性奋而闪闪发光。你弯下腰，用右手抓住他的下巴，强迫他看着你的眼睛。[pg]");
         outputText("[say:你的肉棒别想碰妈妈的小穴，]你对他柔声说道，让他陷入了绝望。[pg]");
         outputText("[say:我-我只是想向你展示我有多爱你，]他说道，声音里带着一丝诚恳。[pg]");
         outputText("[say:顺便再把我的小穴操烂？]你指出来，想起了战斗中他说过的一句话。在他有机会编造一些半生不熟的借口之前，你抓住公牛的角，把他的头往前推，用你的" + get_player().vaginaDescript(0) + "让他闭嘴。[say:如果你想向妈妈展示你有多爱她，那就用你的舌头舔我的小穴，]你要求道。[pg]");
         get_images().showImage("minomob-discipline-eldest");
         outputText("这头粗壮的野兽显然不习惯取悦别人。他的眼睛困惑地看着你，不知道自己该做什么。有那么一会儿，他的鼻子只是贴在你的皮肤上。当你用不赞同的目光看着他时，他开始热情地舔你。你的儿子绝对没有任何技巧可言。他宽大的舌头在你" + get_player().vaginaDescript(0) + "上胡乱地舔舐。在他猛烈的舔舐之间，他冰冷的鼻子无意中抚摸着你。他鼻子冰冷的感觉很快就被他呼吸和舌头的温暖所淹没。你业余的儿子带来的意外快感让你的身体颤抖。[pg]");
         outputText("对你儿子来说，其他一切都是模糊的。你可以看出他已经完全沉浸在取悦你之中，别无其他。他的眼睛因欲望而变得呆滞，在每一次舔舐中迷失自我。当你瞥向你的大腿之间时，你可以看到他的蛋蛋已经肿得像沙滩排球一样大！他疼痛的肉棒跳动着，先列腺液从暴露的尿道中渗出。如果你愿意，你可以把小穴压下去让他释放，但这会违背惩罚的目的。尽管他的前戏毫无头绪，但他的舌头贴在你闪亮的阴唇上感觉真他妈爽！你微笑着抚摸你的儿子，鼓励他继续。他舔舐速度的突然加快，足以让你达到顶峰。你的" + get_player().vaginaDescript(0) + "痉挛着，用你的淫液浸透了他的嘴。他更加狂热地尽可能多地舔舐你甜美的汁液。你流淌的淫液最终滴落到他疼痛的肉棒上。这是一种极其残酷的折磨，你的儿子因为被拒绝释放而呜咽着。[pg]");
         outputText("完事后，你把你儿子推倒仰面躺着。你现在已经受够他了……如果他敢再次伏击你，那你很乐意再次教训他。穿好衣服后，你转身离开。你对儿子的最后印象是他徒劳地自慰，但他的肉棒太粗、太麻木了，根本无法真正高潮。你感到非常有趣，离开了山脉，回到了营地。");
         get_player().orgasm("Vaginal");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function analSpearSemiPregMinotaurGangbang() : void
      {
         spriteSelect(SpriteDb.get_s_minotaurSons());
         outputText("[say: 嘿，看看这个，妈妈有点怀孕了，]你第二个出生的儿子打趣道，让他肌肉发达的手指在你肚子上越来越大的隆起处游走。[pg]");
         outputText("最大的那个野蛮人把较弱的野兽推开，摸索着你的乳房，咕哝着，[say: 谁在乎？她依然是个火辣的尤物。]他粗暴的动作毫不温柔");
         if(get_player().biggestLactation() >= 1.5)
         {
            outputText("，你很快就把几滴乳汁挤到了他紧握的手套里。");
         }
         else
         {
            outputText("，你很快就在他粗鲁的抚摸下呻吟和扭动起来。");
         }
         outputText("很快，他那马一样肿胀的肉棒就戳到了你怀孕的肚子上，用麻醉性的精液润滑着它，你发现自己希望它在你的嘴里或小穴里。[pg]");
         outputText("一个紧张的声音打断了那个野蛮人的摸索。[saystart]嗯，大-大-大家……我们应该对她小心点。你们想");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 20)
         {
            outputText("让部落变得更大");
         }
         else
         {
            outputText("更多的兄弟");
         }
         outputText("，不是吗？[sayend] 相对较小的迷你牛头怪在说完时畏缩了一下，以为会挨他哥哥们的一记耳光。令人惊讶的是，并没有挨打。最大的那个呼出一口气，低沉的声音听起来更像是山体滑坡而不是呼吸。他承认，[saystart]我应该因为你打断我而操烂你的屁股，但你是对的。妈妈的小穴是禁区，兄弟们，我们不会弄坏");
         if(get_player().get_pregnancyType() == 2)
         {
            outputText("我们的小弟弟");
         }
         else
         {
            outputText("她的生育机器");
         }
         outputText("。[sayend]");
         outputText("[pg]其中一个牛头怪抓住你的下巴，把它掰开，迅速将他流着口水的肉棒塞进你的嘴里。[say: 好吧，我们还可以堵住她的嘴和她的屁股。我先占她的嘴。][pg]");
         outputText("那种美妙的、咸甜的、黏糊糊的味道刺激着你的舌头，向你的味蕾许诺了一次天堂之旅，让你的舌头陷入了疯狂的摇摆和舔舐之中。充满药物的先列腺液在你的嘴里晃荡，放松了你的喉咙，让越来越多那野兽般的肉棒侵犯你的喉咙。随着更多的肉棒滑下你的食道，包皮在你的嘴唇上弹跳了三下，你脑海中一种反常的、困惑的想法希望你生下的任何东西都能像你一样享受即将到来的快感。向前看，你看到兽人紧绷的、长满毛发的肌肉越来越近，直到你的鼻子蹭到了那厚厚的绒毛。沉重的、葡萄柚大小的睾丸压在你的下巴上，你意识到那根肿胀的马鸡巴已经完全进入了你的体内，快乐地跳动着，而那沉重的睾丸则在你身上翻滚和弹跳。[pg]");
         outputText("[say: 操，妈，你是怎么保持喉咙这么紧，还能像个专家一样吞下肉棒的？]你目前口交对象的那个声音问道，同时他粗重的手指滑过你的[hair]。你正忙着舔舐那根天堂般的肉棒，感受着尿道随着每一滴催情剂释放到你饥饿的胃里而膨胀。那匹种马的手指扭动着你的头发，只是稍微有点痛，把你从寻找药物的恍惚中拉出来，让你发出咕噜咕噜的赞同声。牛头怪得意地笑着，大喊道，[saystart]来吧，谁来操她的屁股。");
         if(!get_player().minotaurAddicted())
         {
            outputText("我们得让妈妈对我们上瘾，这样她就会飘回她的营地，明天再爬着回来找我们。");
         }
         else
         {
            outputText("我们得给妈妈解解馋。");
         }
         outputText("然后，我们再试着抓个魅魔来当我们的口交婊。[sayend][pg]");
         get_images().showImage("minomob-pregfuck-semi");
         outputText("[say: 没问题，兄弟，]你身后传来一个低沉的巨人声音。两只巨大的手掌紧紧抓住你的[hips]，将你的");
         if(get_player().isTaur())
         {
            outputText("臀部");
         }
         else
         {
            outputText(get_player().assDescript());
         }
         outputText("高高抬起，你的背部因为突如其来的拉扯而弓起。一个宽大、滴着液体的龟头顶住了你的后庭，尽管你在情欲的迷雾中听到了他们谈论要操你的屁股，但没有什么能让你准备好迎接一根火热的男性肉棒顶在你的雏菊上的感觉。你放松了你的[legs]，感觉到你的[asshole]松弛下来，慢慢扩张，让野兽滑腻的先列腺液流进你的直肠。然而，即使面对你完全的顺从，他还是忍住了，让你悬在半空中，嘴里含着一根肉棒喘息着，渴望着更深层次的插入。");
         get_player().buttChange(60,true,true,false);
         outputText("[pg]一个如雪崩般的声音爆发出大笑，[say: 看她扭的！好了，妈妈，别急。][pg]");
         outputText("[say: 应该说别急着吃马屌，]你面前的牛头怪开玩笑道。[pg]");
         outputText("一个尖锐的声音抱怨道，[say: 拜托，伙计们，对妈妈好点！][pg]");
         outputText("你身后传来的咆哮声似乎震动了你的整个身体。[say: 闭嘴，婊子。操完她就轮到你了。][pg]");
         outputText("你含着你儿子的肉棒哼哼着，任由这些嘲弄从你耳边掠过，在你给你后代口交的时候几乎没有察觉。你一直沉浸在那种幸福的、半迷幻的天堂中，但随着你的[asshole]爆发出一阵剧痛，这种感觉颤抖着消失了，你的后庭感觉就像被一个巨大的入侵物撕成了两半。你在这两根刺穿你怀孕身体的肉棒之间嚎叫和呻吟，慢慢习惯了后庭被完全填满的感觉。[pg]");
         outputText("随着你适应了这种情况，你发现自己开始享受起来，你又开始用舌头将唾液涂抹在一根粗大的肉棒上。你被两个高大强壮的兽人举在半空中，两端都被完全塞满，先列腺液从两端汇聚到你的消化道中。你应该感到恐惧。你应该感到愤怒。你应该担心他们会对你做什么。相反，你却在想还要多久他们才能射在你里面，清空他们那巨大肿胀的睾丸。这种被占有的想法让你欲火焚身，让你的[vagina]");
         if(get_player().wetness() >= 5)
         {
            outputText("喷出");
         }
         else if(get_player().wetness() >= 4)
         {
            outputText("分泌出");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("漏出");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText("滴下");
         }
         else
         {
            outputText("滴落");
         }
         outputText("淫水，弄得到处都是。[pg]");
         if(get_player().hasFuckableNipples())
         {
            outputText("试探的手抓住了你的[nipples]，探索着它们的表面。纤细、女性化的手指滑入你的乳头孔，一声低语的惊叹从你被粗暴操弄的身体下方某处传到你的耳朵里。[pg]");
            outputText("[say: 哦，哇……]迷你牛头怪的声音说道。[say: 我想知道我能不能用这个……][pg]");
            outputText("你向下瞥了一眼，看到你最小的牛头怪儿子正鬼鬼祟祟地四处张望，寻找他的兄弟们。他脸上带着心虚的笑容，一只手伸进你的乳头穴里，另一只手抚摸着他那根跳动的肉棒。他跪下来，将肉棒向上指，试图将它引导进你的乳头穴里，尽管你上方那两个巨大的牛头怪正前后摇晃着你，让你的身体剧烈起伏。在一个短暂的间隙，他抓住机会，将他那小巧的龟头塞进你的[nipple]里。随着上方两人的动作再次加快，他的龟头在你摇摆的胸部里被旋转和揉捏，他几乎立刻就向后倒在手上。[pg]");
            outputText("[say: 哦……哦哦，]他呻吟着，声音比之前更大了。[say: 太棒了，妈妈……你……真是太棒了。][pg]");
            outputText("不幸的是，现在能听到他狂热赞美的不仅仅是你。操着你嘴巴的野兽低下头，正好对上了迷你牛头怪的眼睛，此时他的头正因快感而后仰。当你感觉到他的肉棒因为惊慌而更深地塞进你的乳头时，你翻了个白眼，但他哥哥只是");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) < 7)
            {
               outputText("摇了摇头。[say: 你只是在给自己找麻烦，小婊子。记住，妈妈之后就轮到你的洞了。]迷你牛头怪恋恋不舍地抽出肉棒，爬开几步，坐在那里生闷气。");
            }
            else
            {
               outputText("朝部落里一个闲着的成员点了点头，那人伴随着“啵”的一声把这个小个子从你的乳头穴里拔了出来，然后把他带走了。发情的牛头怪队伍在他经过后分开，然后又重新排好。从他们身后，你可以听到痛苦的尖叫声，然后是狂喜的呻吟，因为你最小的儿子也加入了你这种被过度操弄、被药物迷幻的狂喜状态中。");
            }
            outputText("[pg]");
         }
         else if(get_player().biggestLactation() >= 1)
         {
            outputText("湿润的嘴唇含住一个[nipple]并轻轻吸吮，从你漏奶的乳房中吸出一小股乳汁。");
            if(get_player().totalBreasts() == 2)
            {
               outputText("你的");
            }
            else
            {
               outputText("另");
            }
            outputText("一个孤单的乳房被一只更柔软、更女性化的手抓住了，这时你才意识到，正在吸吮你的是这窝里最小的那个，你的迷你牛头怪儿子。他一边吸吮着你充满乳汁的球体，一边抚摸着它们。当他的哥哥们开始前后摆动臀部时，他把每个乳房都吸空了。他们把你当成家乡伐木工用来砍树的那种奇怪的双人锯一样使用，而你很喜欢这样。饥饿的迷你牛头怪吸空了一个乳房，又移到另一个乳房上，吸吮得既强烈又温柔，小心翼翼地不弄疼你，尽管他那些体型更大的亲属似乎一心想要摧毁他们选中的孔洞。[pg]");
         }
         else
         {
            outputText("湿润的嘴唇含住一个[nipple]并轻轻吸吮，让它在温暖、探索的嘴里变得坚硬而肿胀。");
            if(get_player().totalBreasts() == 2)
            {
               outputText("你的");
            }
            else
            {
               outputText("另");
            }
            outputText("一个孤单的乳房被一只更柔软、更女性化的手抓住了，这时你才意识到，正在取悦你乳头的是这窝里最小的那个，迷你牛头怪。他充满爱意地抚摸着你的[chest]，手指划过你的[skinfurscales]。与此同时，他的哥哥们开始前后摆动臀部，像家乡的一对伐木工一样前后摇晃，试图用双人锯砍倒一棵树。最小的儿子温柔地吸吮和舔舐着，不想弄疼你，尽管他那些体型更大的亲属似乎一心想要摧毁你身体的两个孔洞。[pg]");
         }
         outputText("你被抛来抛去，被彻底地、完全地操弄着");
         if(get_player().biggestTitSize() >= 3 && get_player().biggestLactation() >= 1)
         {
            outputText("，你那怀孕的、充满乳汁的乳房在你身下摇晃，同时被吸吮着");
         }
         else
         {
            outputText("，你那坚硬、疼痛的乳头在你身下摇晃时被吸吮和舔舐着");
         }
         outputText("。越来越多强效的先列腺液滴入你的体内，你开始感到麻木。从头到[feet]，你沉浸在各种感觉中，却得不到你渴望的女性交媾。你的[vagina]紧缩并分泌着汁液，褶皱渴望被触摸、舔舐和插入，但你知道不会有这样的释放。困惑中，你试图用你那变得迟钝的头脑去理解目前的状况，你意识到，尽管你被当作性玩具一样使用，但由于你怀孕了，你得到了特殊待遇。你觉得自己就像某种被驯养的繁殖动物，被束缚着，无法正常交配，被迫从每一个可用的来源获取快感。[say: 来了；全吞下去，你这头怀孕的母猪！]你嘴里的公牛喊道。他的肉棒变粗了，在你困惑、缺氧的意识中，似乎变大了一倍。龟头痛苦地撑开你的食道，整根颤抖的肉柱跳动着，将一大团野兽的精液直接射入你的肚子里。那微小的爆发与随之而来的洪流相比根本算不了什么，充满药物和催情剂的精液填满了你的胃。你被这股充满活力的精液弄得欲火焚身，以至于你的小穴似乎也从它湿滑的褶皱中滴落并喷射出等量的女性爱液");
         if(get_player().wetness() <= 3)
         {
            outputText("，尽管你通常不会那么湿");
         }
         outputText("。感觉太好了，你开始颤抖和痉挛，在这股充满活力的注射中高潮并紧缩。[pg]");
         outputText("随着你的[asshole]将其锁紧，另一根更大的肉棒也屈服并释放了。它的主人像野兽一样咆哮和咕哝着，用震动身体的力量将他那毛茸茸的臀部撞击在你的[ass]上。你高兴地发出咕噜咕噜的声音，不在乎精液倒流进你的喉咙并从你的鼻子里冒出来。你的[vagina]喷涌而出，即使没有被触摸也高潮了。两个毛茸茸的阴囊慢慢地贴着你的身体瘪了下去，当他们结束时，你看起来比以前更像怀孕了。你的大脑停止了运转，你含着喉咙里粗大的肉棒傻笑着，梦想着你的大脑被精液填得太满，除了被操之外什么也做不了。[pg]");
         outputText("两根肉棒从你体内滑出");
         if(!get_player().hasFuckableNipples() && get_player().biggestLactation() >= 1)
         {
            outputText("，迷你牛头怪的嘴唇也从你的[nipple]上松开");
         }
         outputText("。几双手温柔地将你放到地上");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 5)
         {
            outputText("，但你的姿势却是屁股撅在半空中。一个声音喊道：[say: 好了，妈妈现在神志不清了。一次一个，别弄坏她，好吗？][pg]你如梦似幻地咯咯笑着，被一次又一次地操弄，每一次抽插都有精液从你的肛门喷射而出。你就这样昏睡过去，感到十分满足。");
         }
         else
         {
            outputText("。他们退后一步，欣赏着他们的杰作，而你则漂浮在充满麻醉感的迷雾中。");
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Cor(1));
         get_player().slimeFeed();
         get_player().minoCumAddiction(15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            get_player().sleeping = true;
            doNext(get_camp().returnToCampUseEightHours);
         }
      }
   }
}

