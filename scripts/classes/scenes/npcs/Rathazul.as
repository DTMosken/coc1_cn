package classes.scenes.npcs
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.undergarments.NobleShirt;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.FollowerInteractions;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.npcs._Rathazul.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class Rathazul extends NPCAwareContent implements Encounter, TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var shopReturn:Function;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function Rathazul()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         shopReturn = null;
         globalSave = false;
         saveVersion = 1;
         saveName = "rathazul";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) > 1)
         {
            _loc1_ = 274;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) < 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,274,1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) > 300)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,274,24);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,87) > 0)
         {
            _loc1_ = 87;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,87) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,87,0);
            }
         }
         return false;
      }
      
      public function takethatTotrice() : void
      {
         get_images().showImage("item-totrice");
         outputText("[pg]过了一会儿，这只老鼠递给你一个贴着\"鸡蛇药剂\"标签的瓶子，并点了点头。");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_consumables().TOTRICE,returnToShopMenu);
      }
      
      public function takethatTaurico() : void
      {
         get_images().showImage("item-taurico");
         outputText("[pg]过了一会儿，老鼠递给你一瓶贴着“半人马药剂”标签的药水，并点了点头。");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_consumables().TAURICO,returnToShopMenu);
      }
      
      public function takethatOculum() : void
      {
         get_images().showImage("item-taurico");
         outputText("[pg]过了一会儿，拉萨祖尔递给你一个贴着\"蜘蛛复眼\"标签的药瓶，并点了点头。");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_consumables().OCULUMA,returnToShopMenu);
      }
      
      public function takethatMotion() : void
      {
         get_images().showImage("item-lactaid-pro");
         outputText("[pg]几分钟后，他拿着药水回来了。[say: 准备好了。如果你有泌乳问题或者你想永远产奶，喝下这个。请记住，这可能是不可逆转的，] 他说。他把药水递给你，然后回去工作了。");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_consumables().MILKPTN,returnToShopMenu);
      }
      
      public function takethatMarmorD() : void
      {
         clearOutput();
         get_images().showImage("item-bArmor-pure");
         outputText("甲片洁白如雪。这套护甲包括胸甲、肩甲、全臂护甲和及膝长靴。你注意到没有裤子。当你转头问他裤子在哪时，你看到他正挠着头，慌忙在抽屉里翻找着。他小声嘟囔着，[say: 抱歉，抱歉，我太专注于做肩甲了，忘了做腿部的护甲！给，这个搭配起来应该很好看，而且不会限制你的行动。]他递给你一条丝绸缠腰布。尽管犯了错，他看起来还是有点沾沾自喜" + (get_silly() ? "，甚至还有点吹嘘的意思。[say: 让我给你看看我用的不同长度的线。]" : "。"));
         if(get_player().hasCock() && get_player().biggestCockArea() >= 40)
         {
            outputText("[pg]丝绸材质几乎掩盖不住你胯下的凸起，甚至看起来还有点淫荡。拉萨祖尔嘟囔着转过头去，摇了摇头。");
         }
         if(get_player().biggestTitSize() >= 8)
         {
            outputText("[pg]你的" + get_player().biggestBreastSizeDescript() + "勉强塞进胸甲里，露出了一大片晃动的乳沟。[pg]");
         }
         get_player().removeKeyItem("Divine Bark Plates");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_armors().DBARMOR,returnToRathazulMenu);
      }
      
      public function takethatMarmorC() : void
      {
         clearOutput();
         get_images().showImage("item-bArmor-corrupt");
         outputText("甲片洁白如雪。绿色的触手从肩甲上生长出来。这套护甲包括胸甲、肩甲、全臂护甲和及膝长靴。你意识到这套护甲没有裤子。");
         outputText("[pg][say: 怎么了？没有遮羞的东西？惊喜吧！]他递给你一条丝绸缠腰布。你为这套护甲向他道谢。");
         if(get_player().hasCock() && get_player().biggestCockArea() >= 40)
         {
            outputText("[pg]丝绸材质几乎掩盖不住你胯下的凸起，甚至看起来还有点淫荡。拉萨祖尔嘟囔着转过头去，摇了摇头。");
         }
         if(get_player().biggestTitSize() >= 8)
         {
            outputText("[pg]你的" + get_player().biggestBreastSizeDescript() + "勉强塞进胸甲里，露出了一大片晃动的乳沟。");
         }
         get_player().removeKeyItem("Tentacled Bark Plates");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_armors().TBARMOR,returnToRathazulMenu);
      }
      
      public function takethatHoney() : void
      {
         get_images().showImage("item-pHoney");
         outputText("[pg]几分钟后，他拿着一个装有闪闪发光的液体的水晶瓶回来了。[say: 完成了。现在蜂蜜应该是纯净的了，] 他惊呼道。他把那瓶蜂蜜递给你，然后回去工作了。");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_consumables().PURHONY,returnToShopMenu);
      }
      
      public function set_mixologyXP(param1:int) : int
      {
         saveContent.mixologyXP = Utils.boundInt(0,param1,200);
         return param1;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function returnToShopMenu() : void
      {
         if(shopReturn == null)
         {
            returnToRathazulMenu();
         }
         else
         {
            shopReturn();
         }
      }
      
      public function returnToRathazulMenu() : void
      {
         if(followerRathazul())
         {
            campRathazul();
         }
         else
         {
            execEncounter();
         }
      }
      
      public function reset() : void
      {
         saveContent.metRathazul = false;
         saveContent.campFollower = false;
         saveContent.campOffer = false;
         saveContent.mixologyXP = 0;
         saveContent.offeredGel = false;
         saveContent.offeredChitin = false;
         saveContent.offeredSilk = false;
         saveContent.offeredScale = false;
         saveContent.offeredEbonbloom = false;
         saveContent.offeredDye = false;
         saveContent.offeredPhilter = false;
         saveContent.offeredHoney = false;
         saveContent.offeredReducto = false;
         saveContent.offeredMarae = false;
         saveContent.offeredGolemHeart = false;
         saveContent.offeredTBark = false;
         saveContent.offeredDBark = false;
         saveContent.offeredTrice = false;
         saveContent.offeredOculum = false;
         saveContent.offeredPurify = false;
         saveContent.offeredDemonTF = false;
         saveContent.offeredDelight = false;
         saveContent.offeredMinoCum = false;
         saveContent.offeredLaBova = false;
         saveContent.offeredLactaidTaurinum = false;
         saveContent.offeredDebimboPlayer = false;
         saveContent.offeredDebimboSophie = false;
         saveContent.giftedBear = false;
      }
      
      public function rathazulWorkOffer() : void
      {
         var _g:Camp;
         var _loc3_:* = null as Object;
         spriteSelect(SpriteDb.get_s_rathazul());
         var _loc1_:Boolean = get_player().keyItemv1("Marae\'s Lethicite") > 0 && !get_player().hasStatusEffect(StatusEffects.DefenseCanopy);
         var _loc2_:NobleShirt = get_undergarments().SEA_SHIRT;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275) > 0)
         {
            collectSilkArmor();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2090) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2087) < 10)
         {
            purificationByRathazulBegin();
            return;
         }
         if(get_player().get_gems() >= 50 && !saveContent.offeredDye)
         {
            saveContent.offeredDye = true;
            outputText("[pg]拉萨祖尔提议道，[saystart]既然你有足够的宝石来支付材料费，你可以买一种我的染发剂来染你的头发。");
            if(get_mixologyXP() >= 32)
            {
               outputText("如果你感兴趣的话，我应该能制作出异国情调颜色的染料。");
            }
            outputText("或者如果你想改变一下你的皮肤，我有护肤油和润肤露。我需要50颗宝石。[sayend]");
         }
         if(get_player().get_gems() >= 500 && get_mixologyXP() >= 100 && !saveContent.offeredPhilter)
         {
            saveContent.offeredPhilter = true;
            outputText("[pg]拉萨祖尔提议道，[say: 我可以制作一些东西来对抗这个领域的腐化，或者如果你觉得太敏感了，我有这些麻木油。我需要500颗宝石。]");
         }
         if((get_player().hasItem(get_consumables().BLACKEG) || get_player().hasItem(get_consumables().L_BLKEG)) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,661) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,661,1);
            outputText("[pg]他看着你物品栏里的黑蛋，提供了一点建议。[say: 小心黑蛋。它们会把你的皮肤变成活体乳胶或橡胶。较小的通常比较安全，但每个人的反应都不同。如果听我的，我会把它们扔掉。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2090) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2087) < 10 && !get_player().hasKeyItem("Rathazul\'s Purity Potion"))
         {
            outputText("[pg]这位啮齿动物炼金术士突然用疑问的眼神看着你。[say: 你找到那些物品了吗？我需要纯蜂蜜和至少两份其他净化剂的样本；你朋友的泉水可能会生长出你需要的物品。]");
         }
         if(get_mixologyXP() >= 30 && !saveContent.offeredLactaidTaurinum)
         {
            saveContent.offeredLactaidTaurinum = true;
            outputText("[pg]老鼠提到，[say: 你知道，如果你能给我带来两瓶马化药剂、一瓶牛头人血液和一百颗宝石，我就能制作出新东西。或者五瓶催乳剂和两瓶纯化的拉波娃，外加250颗宝石。]");
         }
         if(followerRathazul() && get_mixologyXP() >= 20 && !saveContent.offeredReducto)
         {
            saveContent.offeredReducto = true;
            outputText("[pg]老鼠急忙走到他的补给品旁，拿出一罐糊状物，看起来相当自豪，[say: 好消息[if (silly) {，各位}]！我研发出了一种糊状物，你可以用它来缩小任何，呃，过大的身体部位。不过材料很贵，所以你每要一罐药膏，我都需要" + get_reductoCost() + "颗宝石。或者，如果出现了相反的问题，我也研发出了一种注射剂，可以促进局部区域的生长。价格一样。]");
         }
         if(_loc1_ && followerRathazul() && !saveContent.offeredMarae)
         {
            saveContent.offeredMarae = true;
            outputText("[pg]当他看到你从玛莱那里拿来的莱希石水晶时，他的眼睛睁得大大的，几乎要被震惊了。拉萨祖尔结结巴巴地说：[say: 诸神啊……这是我见过的最大的一块莱希石。我不知道你是怎么弄到它的，但这些水晶里蕴含着巨大的力量。如果你愿意，我知道一种方法可以利用它的力量生长出一片带刺的藤蔓，把营地隐藏起来，让入侵者无法靠近。生长出这样的防御工事将消耗这块莱希石三分之一的力量。]");
         }
         menu();
         addNextButton("外貌",rathazulAppearance);
         addNextButton("交谈",rathazulTalkMenu).disableIf(!followerRathazul(),"你和他还不太熟。");
         addNextButton("服务",rathazulServicesMenu);
         if(get_silly() && followerRathazul())
         {
            addNextButton("调情",getThatRatAss).hint("试着和拉萨祖尔调情。");
         }
         if(_loc1_ && saveContent.offeredMarae)
         {
            addButton(5,"莱希石",growLethiciteDefense).hint("让他利用你从玛莱那里获得的莱希石。");
         }
         if(get_player().hasItem(get_useables().TELBEAR) && !saveContent.giftedBear)
         {
            addButton(7,"送熊",rathazulBear).hint("给这只老鼠一个泰迪熊。");
         }
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDRA) == 0)
         {
            addButton(10,"藤蔓",get_game().swamp.alrauneScene.askRathazul).hint("知道怎么解决这个问题吗？");
         }
         if(get_player().hasItem(get_consumables().LIDDELL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) >= 0)
         {
            addButton(11,"奇怪药水",idLiddellium);
         }
         if(get_player().get_upperGarment() == _loc2_ && _loc2_.knownBound() && !_loc2_.saveContent.rathazulAsked)
         {
            addRowButton(2,"诅咒衬衫",askRathazulAboutNobleShirt).hint("这件衬衫有点不对劲。");
         }
         if(followerRathazul())
         {
            _g = get_camp();
            _loc3_ = function():void
            {
               _g.campFollowers();
            };
         }
         else
         {
            _loc3_ = get_camp().returnToCampUseOneHour;
         }
         setExitButton("离开",_loc3_);
      }
      
      public function rathazulTalkYouth() : void
      {
         clearOutput();
         outputText("考虑到他比你遇到过的几乎所有人都要年长得多，你认为拉萨祖尔对事物一定有不同的看法。你问他怎么看待年轻一代，或者无论如何，他们还剩下什么。听到你的问题，他皱起眉头，实际上转过整个身体面对你。");
         outputText("[pg][say:嗯，我必须说，[if (iselder) {那些|你们}]年轻人真的把事情搞得一团糟。我把我余生都奉献给了寻找拯救这个世界残存部分的方法，但我发现了什么？感激？对席卷这片土地的堕落有任何抵抗？不，所有那些粗野的年轻人想做的就是……就是和那些邪恶的恶魔交配！呸！]他在空中挥舞着骨瘦如柴的拳头，不过片刻之后，当他露出更加沉思的神情时，拳头又放下了。");
         outputText("[pg][say:虽然我想[if (iselder) {我们周围还有一些人|你[if (cor >= 50) {至少算得上是}]个例外，[name]}]。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,82) != 0 ? "你带来的那个年轻鼠娘也很勤奋。" : "") + " 并非一切都毫无希望。但是现在的风气啊！]");
         outputText("[pg]拉萨祖尔转头继续摆弄他的设备，嘴里嘟囔着关于\"皮肤\"的事情。");
         doNext(rathazulTalkMenu);
      }
      
      public function rathazulTalkPast() : void
      {
         clearOutput();
         outputText("你想知道拉萨祖尔是否介意向你讲述一些他的过去。他显然已经活了很久，所以一定对这个世界有着丰富的经验。然而，当你问他时，老鼠只是耸了耸肩。");
         outputText("[pg][say:我一生中大部分时间要么躲在实验室里，要么独自外出收集材料，所以我很难说自己是生活专家。]他抬头看了你一眼。[say:毫无疑问，我读过大量各种历史和其他文献，但就目前世界的状况而言，我想其中大部分都没有直接用处……]");
         outputText("[pg]你问他是否至少能告诉你一些关于他村庄的事，在一切毁灭之前那里是什么样的。");
         outputText("[pg][say:抱歉，[name]，]他说，[say:这仍然是个敏感话题。我，呃，即使在灾难发生之前，也和村里的领导者意见不合。而当灾难降临时，他们证明了自己和那些夺走我们生活的恶魔一样黑心。]");
         outputText("[pg]他怒视着地面，你觉得你无法从他那里得到更多信息了。");
         doNext(rathazulTalkMenu);
      }
      
      public function rathazulTalkMenu() : void
      {
         clearOutput();
         outputText("你想谈点什么？");
         menu();
         addNextButton("炼金",rathazulTalkAlchemy).hint("询问他的兴趣爱好。");
         addNextButton("他的过去",rathazulTalkPast).hint("询问他在遇到你之前的生活。");
         addNextButton("希望",rathazulTalkHope).hint("是什么支撑着他继续前进？");
         addNextButton("年轻人",rathazulTalkYouth).hint("问问拉萨祖尔对现在的年轻人有什么看法。");
         setExitButton("返回",returnToRathazulMenu);
      }
      
      public function rathazulTalkHope() : void
      {
         clearOutput();
         outputText("尽管年事已高，这只老鼠还没有放弃，所以你很好奇是什么在驱使他前进。有什么让他对未来抱有希望吗？");
         outputText("[pg]你的问题似乎引起了深深的共鸣，他花了一些时间来思考他的答案。最终，拉萨祖尔的手抚摸着下巴上的胡须，说道：[say:嗯，我想最主要的是这个地方。在恶魔入侵以来的这些年里，我四处流浪，但我遇到的都是孤独的落伍者和只关注生存的小社区。[if (cor >= 50) {即使你不是最纯洁的，|[if (cor < 20) {面对这个世界上所有的邪恶，你表现出了非凡的勇气|到目前为止，你似乎抵制住了屈服于这个世界的邪恶}]，而且}]你是唯一一个采取这种立场的人。]");
         outputText("[pg]他直视着你的眼睛，凝视了片刻。显然他找到了他要找的东西，他点了点头，转过身继续工作。[say:如果玛瑞斯还希望能有恢复的机会，就需要像你这样的[menboys]。]");
         doNext(rathazulTalkMenu);
      }
      
      public function rathazulTalkAlchemy() : void
      {
         clearOutput();
         outputText("你问拉萨祖尔关于他对炼金术的兴趣。这似乎占据了他几乎所有的时间，所以你想听听他的看法。");
         outputText("[pg][say:啊，这个嘛……] 他用爪子敲了敲桌子，若有所思。[say:我从小就当学徒。我父亲想让我学习这门手艺，我很快就上手了。我想它一直是我生活的一部分，所以我从来没有质疑过它，但是……] 他笑了。[say:但是没有什么能比得上发现的快感。当你把新的东西带到这个世界上时，那种纯粹的、无法抑制的喜悦，当你——！]");
         outputText("[pg]他似乎意识到自己有点激动了，于是平静下来，清了清嗓子。[say:无论如何，我必须继续我的工作。即使我无法修复一切，知识也应该被保存下来，并为后代扩展。我不想去想我死后……]");
         outputText("[pg]他摇了摇头，用轻松得多的语气继续说道。[say:这些想法毫无用处。抱歉，我刚才扯远了，[name]。] 拉萨祖尔叹了口气，然后转过头直视你的眼睛，说道：[say:事实是，我心里还有那个年轻老鼠的影子，他惊奇地看着师傅架子上那些五颜六色的药瓶，我忍不住乐在其中。]");
         outputText("[pg]老鼠人再次露出微笑，带着些许梦幻的神情仰望云端。");
         doNext(rathazulTalkMenu);
      }
      
      public function rathazulShopMenu() : void
      {
         shopReturn = rathazulShopMenu;
         menu();
         addNextButton("染发剂",buyDyes).hint("让他为你制作染发剂。[pg]花费：50宝石。");
         addNextButton("护肤油",buyOils).hint("让他为你制作护肤油。[pg]花费：50宝石。");
         addNextButton("润肤乳",buyLotions).hint("让他为你制作润肤乳。[pg]花费：50宝石。");
         if(saveContent.offeredReducto)
         {
            addShopItem(get_consumables().REDUCTO,get_reductoCost(),"item-reducto");
            addShopItem(get_consumables().GROPLUS,get_reductoCost(),"item-gro-plus");
         }
         addShopItem(get_consumables().H_PILL,100);
         if(saveContent.offeredPhilter)
         {
            addShopItem(get_consumables().PPHILTR,500);
            addShopItem(get_consumables().NUMBOIL,500);
         }
         setExitButton("返回",rathazulServicesMenu);
      }
      
      public function rathazulServicesMenu() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc4_:* = null as Consumable;
         clearOutput();
         outputText("你问拉萨祖尔作为一名炼金术士提供什么服务。他稍微精神了一点。");
         outputText("[pg][say:是的，当然，只是，呃……]他似乎有一瞬间失去了思绪，眼睛变得有些模糊，然后突然继续说道，[say:只要给我看看你可能有的任何值得注意的物品。试剂之类的，我可以在工作中使用。]");
         outputText("[pg]你翻找你的[pouch]，拿出你为老鼠准备的东西。");
         var _loc1_:Boolean = false;
         if(get_player().hasItem(get_useables().GREENGL) && !saveContent.offeredGel)
         {
            saveContent.offeredGel = true;
            outputText("[pg]他带着一丝希望的声音说道：[say:我能闻到你打败的被污染的湖泊史莱姆的精华，如果你愿意，我可以把它变成对你更有用的东西。你看，史莱姆充满了世界母亲本身被污染的精华，一旦污染被烧掉，剩下的物质仍然非常柔软，但变得几乎无法切断。用五个被击败的史莱姆的凝胶，我可以为你制作一套耐用的盔甲。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_useables().B_CHITN) && !saveContent.offeredChitin)
         {
            saveContent.offeredChitin = true;
            outputText("[pg]年迈的老鼠专注地看着你，提议道：[say:我看到你收集了一块森林巨蜂的甲壳。如果你给我五块，我大概能把它做成一些坚固的盔甲。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_useables().T_SSILK) && !saveContent.offeredSilk)
         {
            saveContent.offeredSilk = true;
            outputText("[pg][say:哦，那是一些巨型蜘蛛或蜘蛛人的网吗？太棒了！经过一点炼金处理，我有可能把纤维弄松，足以把它们编织成真正华丽的东西——盔甲，甚至是一件奇妙的长袍，]拉萨祖尔提议道。");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_useables().D_SCALE) && !saveContent.offeredScale)
         {
            saveContent.offeredScale = true;
            outputText("[pg]拉萨祖尔皱起眉头，注意到了你的一件物品。[say:那是龙鳞吗？" + (followerEmber() || followerKiha() ? "在和" + (followerKiha() && followerEmber() ? "那些龙族暴脾气" : "那个龙族暴脾气") + "吵架吗？" : "") + "]他看着它，似乎在琢磨着什么。[say:如果你有足够多的材料，我或许能把这种材料加工成有用的东西。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_useables().EBNFLWR) && !saveContent.offeredEbonbloom)
         {
            saveContent.offeredEbonbloom = true;
            outputText("[pg]拉萨祖尔看着你手中的花。[say:我已经好几年没见过这种花了……也许有十年了吧。这是一朵黑檀花。它们生长在地下深邃黑暗的洞穴里。没人知道它们是怎么长出来的，毕竟它们是金属做的，但这也赋予了它们非常独特的性质。]他把花还给你。[say:你能弄到更多这种花吗？如果你能给我带来十朵，我就能给你做一套盔甲。不过，八朵就足够做一件轻甲了，三朵可以做内衣……我还需要五百颗宝石。]");
            _loc1_ = true;
         }
         if(!saveContent.offeredPurify)
         {
            _loc2_ = [get_consumables().INCUBID,get_consumables().SUCMILK,get_consumables().SDELITE,get_consumables().LABOVA_,get_consumables().MINOCUM];
            _loc3_ = 0;
            while(_loc3_ < int(_loc2_.length))
            {
               _loc4_ = _loc2_[_loc3_];
               _loc3_++;
               if(get_player().hasItem(_loc4_))
               {
                  saveContent.offeredPurify = true;
                  break;
               }
            }
         }
         if(get_player().hasItem(get_consumables().BEEHONY) && !saveContent.offeredHoney)
         {
            saveContent.offeredHoney = true;
            outputText("[pg]拉萨祖尔提议道，[say:如果你需要纯净的蜂蜜，我可以提炼普通的蜜蜂蜂蜜。你还需要预付20颗宝石。]");
            _loc1_ = true;
         }
         if(get_player().hasKeyItem("Golem\'s Heart") && !saveContent.offeredGolemHeart)
         {
            saveContent.offeredGolemHeart = true;
            outputText("[pg]看到你从悬崖上遇到的巨大魔像外壳中找到的发光红宝石，他的眼睛亮了起来。从不同角度检查了一会儿后，他说道，[say:嗯，是的。这看起来非常了不起，[name]。我还需要做进一步的检查才能确定，但我认为我可以用这颗宝石制作某种盔甲。]");
            _loc1_ = true;
         }
         if(get_player().hasKeyItem("Tentacled Bark Plates") && !saveContent.offeredTBark)
         {
            saveContent.offeredTBark = true;
            outputText("[pg]看到你手里那块长着奇怪触手的树皮，拉萨祖尔吓得往后一跳，眼睛睁得大大的。[say:仁慈的玛莱啊，那[b:是]什么？]他惊恐地问道。");
            outputText("[pg]你告诉他这是玛莱。或者至少，是她剩下的部分。老鼠的目光垂了下来，看起来相当沮丧。");
            outputText("[pg][say:真不敢想象她会遭遇这样的命运……]他沉默了一分多钟，只是呆呆地望着远方。不过，他最终还是振作了一点，眼中闪烁着一种奇怪的决心。[say:好吧，没关系，[name]。我们不能让它白白浪费。请让我用这块树皮为你做点什么吧。]");
            _loc1_ = true;
         }
         if(get_player().hasKeyItem("Divine Bark Plates") && !saveContent.offeredDBark)
         {
            saveContent.offeredDBark = true;
            outputText("[pg]神圣树皮散发的柔和光芒吸引了老鼠的目光，他踉跄着走近了几步。他看起来几乎被它迷住了，张着嘴却说不出话来。过了一会儿，拉萨祖尔摇了摇头，眨了几下眼睛，然后问道，[say:你从哪里弄到这个的，[name]？它身上有一种……我感觉女神就在这里，和我们在一起。]");
            outputText("[pg]你告诉他你是怎么得到它的细节，他点了点头，眼睛仍然盯着树皮。当你讲完后，他迅速而兴奋地开始说道。[say:我知道该怎么处理这份礼物了，[name]。我可以让玛莱的祝福无论你走到哪里都保护着你。是的……]");
            outputText("[pg]老鼠突然绽放出灿烂的笑容，看起来出奇的年轻。[say:是的，]他最后点了点头总结道。");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_consumables().TOTRICE) && !saveContent.offeredTrice)
         {
            saveContent.offeredTrice = true;
            outputText("[pg]他的目光扫过你的物品，没有在任何特定的东西上停留，但当他看到那瓶蓝色液体时，他停顿了一下。");
            outputText("[pg][say:这是什么，[name]？]他问道。你向老鼠描述了你发现它的生物，他点了点头，目光仍然盯着瓶子。当你讲完后，他甚至没有真正听进去，而是陷入了沉思。");
            outputText("[pg][say:啊哈！]他突然大喊道。[say:如果你碰巧有这个意向，我可以借助一些鳞族药水和一颗金色种子轻松地制作更多这种东西。蜥蜴人和鹰身女妖有着奇妙的兼容性——]他抬头看了你一眼，似乎意识到了什么。[say:好吧，别管细节了。简而言之，我可以做一些东西，把你变成……一只鸡蛇，我相信他们是这么叫的。]他对自己的发现感到很高兴。");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_consumables().S_GOSSR) && !saveContent.offeredOculum)
         {
            saveContent.offeredOculum = true;
            outputText("[pg]拉萨祖尔一只手拿着一捆甜美的蛛丝，另一只手抚摸着他的胡须。他的目光在上面来回扫视，过了好一会儿他才开口说话。");
            outputText("[pg][say:你知道吗，[name]，我可以用这个做点什么……是的，我也许能调制出某种混合物，它能提供蜘蛛视觉的所有好处，而不会在受试者身上引起任何其他突变。]他那双小眼睛向上看着你。[say:也就是说，如果你不介意变成那种……生物的话。无论如何，我需要一些东西来抵消突变效果……]");
            _loc1_ = true;
         }
         if((get_player().hasItem(get_consumables().SUCMILK) || get_player().hasItem(get_consumables().INCUBID)) && !saveContent.offeredDemonTF)
         {
            saveContent.offeredDemonTF = true;
            outputText("[pg]老鼠瞥了一眼你提供的物品，当他看到你手里的恶魔体液瓶时，短暂地停顿了一下。");
            outputText("[pg][say:我真的建议你不要碰这些东西，[name]，]他开始说道，[say:但如果你真的必须这样做，至少让我为你净化它们。这是一个快速的过程，不会花太多钱，而且它将消除饮用者被腐化污染的所有危险。嗯，我是说，从药剂本身来说。]他停顿了一会儿，显然不确定他要说什么。[say:类似的过程应该适用于任何其他恶魔物质，但我必须再次建议你不要再涉足它们了。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_consumables().SDELITE) && !saveContent.offeredDelight)
         {
            saveContent.offeredDelight = true;
            outputText("[pg]拉萨祖尔找到了那瓶魅魔之悦，你觉得你几乎能看到他布满皱纹的脸颊上泛起了一丝红晕。");
            outputText("[pg][say:被魅魔追求了吗，[name]？]他叹了口气。[say:好吧，如果你真的必须有这样的交易，至少要注意安全。我应该能够消除这种混合物的大部分有害影响，但我不能确定它们是否完全没有。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_consumables().MINOCUM) && !saveContent.offeredMinoCum)
         {
            saveContent.offeredMinoCum = true;
            outputText("[pg]当老鼠看到牛头人精液混在你的其他物品中时，他的眼睛猛地睁大了。");
            outputText("[pg][say:[Name]，你不知道这有多危险吗？牛头人的精液极易上瘾，哪怕只有一点点！如果现在还不算太晚，我强烈建议你不要让这东西进入你的身体。]他的目光在瓶子上停留了一会儿，似乎在思考着什么。");
            outputText("[pg][say:不过，]他开口道，[say:也许有可能……是的，如果你让我稍微研究一下，我很有可能想出一种方法来抵消它的成瘾性……虽然我不知道你一开始为什么要喝这个。]");
            _loc1_ = true;
         }
         if(get_player().hasItem(get_consumables().LABOVA_) && !saveContent.offeredLaBova)
         {
            saveContent.offeredLaBova = true;
            outputText("[pg]拉萨祖尔拿起那瓶拉波娃，上面淫秽的图案似乎丝毫没有影响到他。");
            outputText("[pg][say:嗯，]他说。[say:我以前遇到过这种物质。当时我没怎么在意，但在这里看到它让我想起来了。我大概能去除它的腐化特性，但这也会产生副作用，使其转化效果减弱。]他抬头看着你。[say:我想，根据个人的观点，这可能是一个好处，也可能是一个缺点。]");
            _loc1_ = true;
         }
         if(!_loc1_)
         {
            outputText("[pg]他对你的选择点了点头，虽然他似乎没有什么新话要说。");
         }
         menu();
         addNextButton("商店",rathazulShopMenu).hint("查看拉萨祖尔的商品。");
         addNextButton("制作",rathazulArmorMenu).hint("让拉萨祖尔为你制作一些东西。");
         addNextButton("炼金",rathazulAlchemyMenu).hint("让拉萨祖尔用你携带的材料制作一些东西。");
         if(saveContent.offeredPurify)
         {
            addNextButton("净化",purifySomething).hint("请他净化任何被污染的药水。[pg]花费：20 宝石。");
         }
         addButton(14,"返回",returnToRathazulMenu);
      }
      
      public function rathazulPurifyItem(param1:ItemType, param2:ItemType, param3:int = 20) : void
      {
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - param3);
         get_player().destroyItems(param1,1);
         statScreenRefresh();
         get_images().showImage("item-box");
         get_inventory().takeItem(param2,returnToShopMenu);
         set_mixologyXP(get_mixologyXP() + 8);
      }
      
      public function rathazulMoveToCamp() : void
      {
         clearOutput();
         get_images().showImage("encounter-rathazul");
         outputText("拉萨祖尔高兴地对你笑了笑，开始收拾他的设备。他转过头嘟囔着，[say: 把我的设备搬过去需要一段时间，你先回去吧，我一小时内就到。哦，天哪，太好了。]");
         outputText("[pg]他看起来就像是一个很久以来第一次体验到希望的人。");
         saveContent.campFollower = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rathazulMoveDecline() : void
      {
         clearOutput();
         get_images().showImage("encounter-rathazul");
         outputText("拉萨祖尔气喘吁吁地叹了口气，点了点头。");
         outputText("[pg][say: 也许我在这里还是能派上点用场的，]他一边嘟囔着，一边收拾营地，准备前往湖边的另一个地方。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rathazulMakesTaurPotion() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_player().destroyItems(get_consumables().EQUINUM,2);
         get_player().destroyItems(get_consumables().MINOBLO,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 100);
         statScreenRefresh();
         get_images().showImage("rathazul-lab");
         outputText("你把两瓶 马化药剂、一瓶牛头人血液和一百颗宝石交给拉萨祖尔，他小心翼翼地接过它们，开始为你制作一种特殊的药水。");
         doNext(takethatTaurico);
      }
      
      public function rathazulMakesPurifyPotion() : void
      {
         clearOutput();
         if(get_player().hasItem(get_consumables().PURHONY))
         {
            get_player().destroyItems(get_consumables().PURHONY,1);
         }
         else
         {
            get_player().destroyItems(get_consumables().PPHILTR,1);
         }
         get_player().destroyItems(get_consumables().C__MINT,1);
         get_player().destroyItems(get_consumables().PURPEAC,1);
         get_images().showImage("item-pPotion");
         outputText("你急忙赶到拉萨祖尔那里，告诉他你带来了他可能需要的物品。当你把它们展示给他看时，他震惊地睁大了眼睛，二话不说立刻从你手中抢过它们，匆匆走向他的炼金设备。你看着他摆弄着那些东西，不确定他在做什么，但几分钟内他就配制出了一瓶看起来很奇怪的药水，并把它带回给你。");
         outputText("[pg][say:让她喝下这个，至少应该能杀死她体内的寄生虫。]");
         outputText("[pg]你感激地接过来，但还是忍不住问他说的“应该”是什么意思。");
         outputText("[pg]拉萨祖尔无奈地耸了耸肩。[say:这个配方还没经过测试；它的效果是不可预测的……但是，肯定不会让情况变得更糟吧？]");
         outputText("[pg]你承认他说得有道理，收下了药水；你现在需要做的就是把它给米内瓦，然后祈祷一切顺利。");
         get_player().createKeyItem("Rathazul\'s Purity Potion",0,0,0,0);
         doNext(campRathazul);
      }
      
      public function rathazulMakesPureHoney() : void
      {
         clearOutput();
         get_player().destroyItems(get_consumables().BEEHONY,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 25);
         statScreenRefresh();
         get_images().showImage("rathazul-lab");
         outputText("你递过去一瓶蜂蜜和 25 颗宝石。");
         outputText("[pg][say: 我看看能做点什么，] 他一边说，一边接过蜂蜜，开始酿造什么东西。");
         doNext(takethatHoney);
      }
      
      public function rathazulMakesMilkPotion() : void
      {
         clearOutput();
         get_player().destroyItems(get_consumables().LACTAID,5);
         get_player().destroyItems(get_consumables().P_LBOVA,2);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 250);
         statScreenRefresh();
         get_images().showImage("rathazul-lab");
         outputText("你递交了材料和 250 颗宝石。");
         outputText("[pg][say: 我看看能做点什么，] 他一边说，一边接过材料，开始酿造什么东西。");
         doNext(takethatMotion);
      }
      
      public function rathazulMakesEyePotion() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-lab");
         get_player().destroyItems(get_consumables().S_GOSSR,2);
         get_player().destroyItems(get_consumables().HUMMUS_,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 100);
         statScreenRefresh();
         outputText("你把两缕粉色蛛丝、一罐人形剂和一百颗宝石交给拉萨祖尔，他小心翼翼地接过它们，开始为你制作一种特殊的药剂。");
         doNext(takethatOculum);
      }
      
      public function rathazulMakesCockatricePotion() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_player().destroyItems(get_consumables().REPTLUM,1);
         get_player().destroyItems(get_consumables().GLDSEED,1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 100);
         statScreenRefresh();
         get_images().showImage("rathazul-lab");
         outputText("你把一瓶鳞族药水、一颗金色种子和一百颗宝石交给拉萨祖尔，他小心翼翼地接过它们，开始为你制作一种特殊的药剂。");
         doNext(takethatTotrice);
      }
      
      public function rathazulDebimboOffer() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-lab");
         if((get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties)) && !saveContent.offeredDebimboPlayer)
         {
            saveContent.offeredDebimboPlayer = true;
            outputText("[pg]当你靠近他的实验室时，拉萨祖尔瞥了你一眼，他布满皱纹的脸上带着若有所思的表情。[say: 告诉我，[name]，你真的喜欢在那种被诅咒的药剂的虚弱效果下生活吗？即使是现在，你眼中的智慧火花也几乎消失殆尽。你甚至明白我在说什么吗？]");
            outputText("[pg]你把一缕头发绕在手指上，咯咯地笑着。这只愚蠢的老鼠认为你很笨！他根本不知道拥有一个火辣的身体和随时准备好吸吮和做爱的性欲有多棒。这太有趣了！你回头看着那只老鼠，意识到你还没有回答他，当他失望地叹气时，你感到有些尴尬。");
            outputText("[pg][say: 孩子，求你了……给我带五杯学者茶，还有250颗宝石作为试剂，然后我就能治好你！我能帮你！只要……把茶拿来！]炼金术士恳求道，他用爪子般的指头数到五以加强语气，同时拼命摇晃着他的宝石袋。你咬着下唇——他似乎对这件事非常非常生气。也许你应该，去拿茶？");
         }
         else if(get_player().hasPerk(PerkLib.BroBrains) && !saveContent.offeredDebimboPlayer)
         {
            saveContent.offeredDebimboPlayer = true;
            outputText("[pg]当你靠近他的实验室时，拉萨祖尔瞥了你一眼，他布满皱纹的脸上带着若有所思的表情。[say: 我看你以前碰巧喝过一罐兄弟特酿。如果你需要我恢复你的智力，给我带五份学者茶和 250 颗宝石。感谢玛莱你不是个无脑花瓶；那会更糟。]");
         }
         else if(get_sophieBimbo().bimboSophie() && !saveContent.offeredDebimboSophie)
         {
            saveContent.offeredDebimboSophie = true;
            outputText("当你靠近他的实验室时，拉萨祖尔瞥了你一眼，他布满皱纹的脸上带着若有所思的表情。[say: 告诉我，[name]，你真的喜欢让那个空虚的白痴整天围着你转，对你垂涎三尺吗？] 他问道，沮丧地摇了摇头。[say: 她显然受到了傻妞液的影响，正如你所见，这种影响确实非常强烈。然而，就像玛瑞斯的大多数东西一样，它是可以被抵消的——至少部分可以。] 拉萨祖尔将他长着爪子的手指交叉在一起，他的尾巴在身后甩动着，陷入了沉思。[say: 也许如果有足够数量的叫做学者茶的东西……我就可以抵消这种药剂的麻痹效果……哦，天哪，是的……嗯……] 拉萨祖尔点点头，抚摸着下巴上垂下的几缕长毛。");
            outputText("[pg]你等待着进一步的澄清，但那只老鼠只是站在那里，凝视着远方。你礼貌地咳嗽了一声，重新引起了他的注意，吓了他一跳。");
            outputText("[pg][say: 哦？嗯，是的，无脑花瓶，没错！正如我所说，五份学者茶以及 250 颗宝石作为其他试剂，应该能给我提供制造击败无脑花瓶的药剂所需的一切！哦，天哪，这头韵！太荒谬了。] 拉萨祖尔慢慢地轻笑着，擦去眼角的一滴眼泪，然后他猛地回头看着你，[say: 这是一个值得的目标——任何生物都不应该受到智力下降的折磨。当你获得了所需的东西时告诉我。]");
         }
         doNext(campRathazul);
      }
      
      public function rathazulBear() : void
      {
         clearOutput();
         outputText("你在包里翻找了一下，拿出一个毛绒玩具。虽然它的设计很简单，也许没有什么实用价值，但你还是把它送给了老炼金术士，希望他会喜欢。");
         outputText("[pg][say: 嗯，] 他轻笑着接过熊。[say: [if (ischild){孩子|[Name]}]，我不确定我是不是最适合收这种礼物的人；你肯定认识其他更想要这个的人。]");
         outputText("[pg]别人的需求和渴望并不能否定他的，而且这也是一种心意。这个玩具很柔软、可爱，在某种意义上也很纯粹。");
         if(get_player().isChild())
         {
            outputText("[pg]老鼠把手放在你的头上。[say: 谢谢你，孩子。如果我怀疑一个年轻人想让别人微笑的智慧，那我就是个傻瓜。我希望你能保持这种心态，这个世界上有太多人想夺走它。]");
         }
         else
         {
            outputText("[pg]老鼠向后靠了靠，仔细端详着那只熊。[say: 我已经很多年没有拿过这样的东西了。甚至几十年了。] 他叹了口气。[say: 愚蠢的老鼠是我这么长时间没有看到这种纯真安慰的原因。如果我拒绝这样的提醒，我就会和他们一样愚蠢。我们应该保护这个世界的孩子们。]");
         }
         outputText("[pg]拉萨祖尔咳嗽了一声，调整了一下姿势。[say: 啊，不过，我扯远了。谢谢你的礼物，[name]。我会留着它的。]");
         get_player().consumeItem(get_useables().TELBEAR);
         saveContent.giftedBear = true;
         doNext(playerMenu);
      }
      
      public function rathazulArmorMenu() : void
      {
         var divine1:Boolean;
         var _g1:Rathazul;
         var divine:Boolean;
         var _g:Rathazul;
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         menu();
         if(saveContent.offeredGel)
         {
            addNextButton("凝胶护甲",craftOozeArmor).hint("他可以用 5 团绿色凝胶制作护甲。").disableIf(!get_player().hasItem(get_useables().GREENGL,5));
         }
         if(saveContent.offeredChitin)
         {
            addNextButton("蜜蜂护甲",craftCarapace).hint("他可以用 5 块甲壳碎片制作护甲。").disableIf(!get_player().hasItem(get_useables().B_CHITN,5));
         }
         if(saveContent.offeredSilk)
         {
            addNextButton("蜘蛛丝",craftSilkArmor).hint("他可以用坚韧的蜘蛛丝制作护甲或衣服。").disableIf(!get_player().hasItem(get_useables().T_SSILK)).disableIf(craftingInProgress(),"拉萨祖尔已经在制作这个了。");
         }
         if(saveContent.offeredScale)
         {
            addNextButton("龙鳞",craftDragonscaleArmor).hint("他可以用龙鳞制作护甲或衣服。").disableIf(!get_player().hasItem(get_useables().D_SCALE,2));
         }
         if(saveContent.offeredEbonbloom)
         {
            addNextButton("黑檀花",craftEbonweaveArmor).hint("他可以用黑檀花制作护甲或衣服。[pg]花费：500 宝石").disableIf(!get_player().hasItem(get_useables().EBNFLWR,3));
         }
         if(get_player().hasKeyItem("Golem\'s Heart"))
         {
            addNextButton("火山护甲",craftGolemArmor).hint("看看拉萨祖尔能不能用你从那个魔像身上搜刮来的巨大宝石为你制作一些护甲。");
         }
         if(get_player().hasKeyItem("Tentacled Bark Plates"))
         {
            _g = this;
            divine = false;
            addNextButton("树皮护甲",function():void
            {
               _g.craftMaraeArmor(divine);
            });
         }
         if(get_player().hasKeyItem("Divine Bark Plates"))
         {
            _g1 = this;
            divine1 = true;
            addNextButton("腐化树皮",function():void
            {
               _g1.craftMaraeArmor(divine1);
            });
         }
         if(get_output().menuIsEmpty())
         {
            outputText("你没有材料让拉萨祖尔制作任何东西。");
         }
         else
         {
            outputText("你想和拉萨祖尔一起进行哪个项目？");
         }
         setExitButton("返回",rathazulServicesMenu);
      }
      
      public function rathazulAppearance() : void
      {
         clearOutput();
         outputText("拉萨祖尔是一只年迈的[if (!nofur) {鼠人}]，身高大约[if (metric) {160厘米|5英尺3英寸}]，不过从他驼背的样子很难看出来。他的头秃了，皮肤也布满了皱纹，但他眼中的火花让你知道他还没有完全老糊涂。[if (nofur) {他身上唯一能看出非人特征的，就是头上长出的两只老鼠耳朵，脸上粗硬的胡须，以及|他长着老鼠一样的口鼻和两只毛茸茸的耳朵，身上覆盖着一层薄薄的毛发，还有一条无毛的}]尾巴从衣服里伸出来。他穿着一件破旧的长袍，似乎在过去的几年里缝补过很多次。当你打量他时，他短暂地从炼金设备上抬起头，向你点了点头，微微一笑。");
         doNext(returnToRathazulMenu);
      }
      
      public function rathazulAlchemyMenu() : void
      {
         var _loc1_:Boolean = false;
         shopReturn = rathazulAlchemyMenu;
         menu();
         if(saveContent.offeredHoney)
         {
            addNextButton("提纯蜂蜜",rathazulMakesPureHoney).hint("让他将一瓶巨蜂蜂蜜提纯成纯净蜂蜜。[pg]花费：25 宝石\n需要 1 瓶巨蜂蜂蜜。").disableIf(get_player().get_gems() < 25,"你负担不起。[pg]花费：25 宝石\n需要 1 瓶巨蜂蜂蜜。").disableIf(!get_player().hasItem(get_consumables().BEEHONY),"你没有可以提纯的蜂蜜。[pg]花费：25 宝石\n需要 1 瓶巨蜂蜂蜜。");
         }
         if(get_offeredDebimbo())
         {
            addNextButton("去花瓶化",makeADeBimboDraft).hint("让拉萨祖尔为你制作一瓶解除花瓶药水。[pg]花费：250宝石\n需要5份学者茶。").disableIf(get_player().get_gems() < 250,"你买不起。[pg]花费：250宝石\n需要5份学者茶。").disableIf(!get_player().hasItem(get_consumables().SMART_T,5),"你没有足够的茶。[pg]花费：250宝石\n需要5份学者茶。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2090) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2087) < 10)
         {
            _loc1_ = get_player().hasItemArrayAny([get_consumables().PURHONY,get_consumables().PPHILTR]) && get_player().hasItemArray([get_consumables().C__MINT,get_consumables().PURPEAC]);
            addNextButton("纯净药水",rathazulMakesPurifyPotion).hint("让他为米内瓦酿造一瓶净化药水。").disableIf(!_loc1_,"你没有制作净化药水所需的材料。[pg]需要1份纯净蜂蜜或纯净灵药、1份宁静薄荷、1份纯净桃子。").disableIf(get_player().hasKeyItem("Rathazul\'s Purity Potion"),"You already have the potion made. Bring it to Minerva.");
         }
         if(saveContent.offeredLactaidTaurinum)
         {
            _loc1_ = get_player().hasItemArray([get_consumables().LACTAID,get_consumables().P_LBOVA],[5,2]);
            addNextButton("强效催乳剂",rathazulMakesMilkPotion).hint("让他酿造一瓶特殊的催乳药水。[pg]花费：250宝石\n需要5份催乳剂和2份纯净拉波娃。").disableIf(get_player().get_gems() < 250,"你买不起。[pg]花费：250宝石\n需要5份催乳剂和2份纯净拉波娃。").disableIf(!_loc1_,"你没有必需的材料。[pg]花费：250宝石\n需要5份催乳剂和2份纯净拉波娃。");
            _loc1_ = get_player().hasItemArray([get_consumables().EQUINUM,get_consumables().MINOBLO],[2,1]);
            addNextButton("半人马药剂",rathazulMakesTaurPotion).hint("让他酿造一瓶有助于变成半人马的特殊药水。[pg]花费：100宝石\n需要2份马化药剂和1份牛头人血液。").disableIf(get_player().get_gems() < 100,"你买不起。[pg]花费：100宝石\n需要2份马化药剂和1份牛头人血液。").disableIf(!_loc1_,"你没有必需的材料。[pg]花费：100宝石\n需要2份马化药剂和1份牛头人血液。");
         }
         if(get_mixologyXP() >= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1311) > 0)
         {
            _loc1_ = get_player().hasItemArray([get_consumables().REPTLUM,get_consumables().GLDSEED]);
            addNextButton("鸡蛇药剂",rathazulMakesCockatricePotion).hint("让他酿造一瓶有助于变成鸡蛇的特殊药水。[pg]花费：100宝石\n需要1份鳞族药水和1颗金色种子。").disableIf(get_player().get_gems() < 100,"你买不起。[pg]花费：100宝石\n需要1份鳞族药水和1颗金色种子。").disableIf(!_loc1_,"你没有必需的材料。[pg]花费：100宝石\n需要1份鳞族药水和1颗金色种子。");
         }
         if(get_mixologyXP() >= 50)
         {
            _loc1_ = get_player().hasItemArray([get_consumables().S_GOSSR,get_consumables().HUMMUS_],[2,1]);
            addNextButton("蜘蛛复眼",rathazulMakesEyePotion).hint("让他酿造一瓶能让你长出第二对眼睛的特殊药水。[pg]花费：100宝石\n需要2份粉色蛛丝和1份人形剂。","蜘蛛复眼").disableIf(get_player().get_gems() < 100,"你买不起。[pg]花费：100 宝石\n需要 2 份粉色蛛丝和 1 份人形剂。").disableIf(!_loc1_,"你没有必要的材料。[pg]花费：100 宝石\n需要 2 份粉色蛛丝和 1 份人形剂。");
         }
         if(get_output().menuIsEmpty())
         {
            clearOutput();
            outputText("拉萨祖尔目前还不能为你制作任何东西。也许如果你委托他制作更多的药剂，他会开发出新的配方。");
         }
         setExitButton("返回",rathazulServicesMenu);
      }
      
      public function purifySomething() : void
      {
         shopReturn = purifySomething;
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         outputText("拉萨祖尔问道，[say:你想让我净化什么？]");
         menu();
         addPurify(get_consumables().INCUBID,get_consumables().P_DRAFT);
         addPurify(get_consumables().SUCMILK,get_consumables().P_S_MLK);
         addPurify(get_consumables().SDELITE,get_consumables().PSDELIT);
         addPurify(get_consumables().LABOVA_,get_consumables().P_LBOVA);
         addPurify(get_consumables().MINOCUM,get_consumables().P_M_CUM);
         setExitButton("返回",rathazulServicesMenu);
      }
      
      public function purificationByRathazulBegin() : void
      {
         clearOutput();
         get_images().showImage("rathazul-lab");
         outputText("你希望这位鼠人炼金术士能帮上忙，于是毫不犹豫地走向他。拉萨祖尔看到你时抬起头，好奇地挑起眉毛。[say:有什么事吗，[name]？]");
         outputText("[pg]你点点头，问他是否知道如何消灭害虫，或者如何净化人与物品上的腐化。看到他困惑的表情，你向他解释了米内瓦和她的情况，并再次询问他是否能帮上忙。拉萨祖尔神色黯然地摇了摇头。");
         outputText("[pg][say:恐怕我从未真正成功研制出能净化被腐化者本身的药剂。]鼠人炼金术士悲伤地解释道。[say:问题在于，这个世界上几乎没有什么东西能够消除服用者体内的腐化……不过，我确实有一个理论上的配方。如果你能帮我找到一些可以降低腐化并平息性欲的食物，并把它们带给我，那我或许就能完成它。我建议将纯净的巨蜂蜂蜜作为其中一种，但我还需要至少两种能产生上述至少一种效果的物品。你说过那泉水能控制你朋友的腐化？也许那里生长的一些植物会有效；给我带些样本来，再带一份新鲜的纯净蜂蜜，我们来看看我能做些什么，]他大声说道，努力摆脱了先前的沮丧，语气变得坚定起来。");
         outputText("[pg]带着这个想法，你离开了他；收集能治愈米内瓦的物品是你的责任。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2090,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function makeADeBimboDraft() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         outputText("拉萨祖尔用他干瘪的手掌接过茶和宝石，将闪闪发光的珠宝塞进一个小袋子里，将茶倒进一个大玻璃瓶里。他迅速将混合的药剂放在火焰上，然后拖着脚步走到他的工作台前，在那里他拿起了许多各种颜色和描述的小袋子和药瓶，一个接一个地加入混合物中。混合物在明火上翻滚冒泡，就像一个可怕的、怪异的东西，但很快就平息下来，变成安静的沸腾。拉萨祖尔让它煮了一会儿，偶尔搅拌一下，同时拿出一个更小的药瓶。一旦大部分多余的液体蒸发掉，他就将混合物倒入玻璃容器中并塞上软木塞，将其举到光线下检查其颜色。");
         outputText("[pg][say: 这样<b>应该</b>就行了，] 他喃喃自语道。拉萨祖尔转过身，小心翼翼地把混合物递给你。[say: 这应该能抵消傻妞液抑制心智的效果，但我不知道喝下它的人会在多大程度上保留他们作为无脑花瓶时度过的时光……]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 250);
         get_player().consumeItem(get_consumables().SMART_T,5);
         statScreenRefresh();
         set_mixologyXP(get_mixologyXP() + 8);
         get_images().showImage("item-debimbo");
         get_inventory().takeItem(get_consumables().DEBIMBO,returnToShopMenu);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function idLiddellium() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         outputText("你把在恶魔营地找到的奇怪药瓶拿给拉萨祖尔看，问他能不能弄明白这是什么东西。");
         outputText("[pg][say: 嗯？某种奇特的药剂……] 他一边摆弄着药瓶一边嘟囔着。老鼠把它拿到某种仪器前，倒了极少的一点在一个小碟子里。");
         if(get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            outputText("你以前在家里学的那点炼金术知识，除了让你认出他是在采取安全措施之外，并没有什么卵用。");
         }
         outputText("[pg]拉萨祖尔做了一系列简短的测试，然后转过身来，把瓶子还给你。[say: 我不知道这是什么，但我知道它非常强效。不管它有什么作用，肯定会对身体产生严重的影响。我建议不要服用这个。]");
         outputText("[pg]有什么办法能弄清楚它<i>到底</i>有什么用吗？");
         outputText("[pg][say: 也许可以找个活体实验对象，但这不太符合道德规范。你说这是从恶魔那里弄来的？试着去问问他们吧。]");
         doNext(returnToRathazulMenu);
      }
      
      public function growLethiciteDefenseYesYesYes() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-canopy");
         outputText("拉萨祖尔点了点头，从长袍里拿出一把木槌和一把凿子。对于他这么大年纪的人来说，他的手出奇地稳，他把凿子抵在水晶上敲击，轻松地敲下了一大块碎片。拉萨祖尔把它捧在手里，然后猛地砸进泥土里，直到只露出水晶最小的尖端。他像变魔术一样从长袍里拿出装有各种物质的药瓶，开始把它们倒在水晶上。几秒钟后，他完成了，跑回了他的设备旁。");
         outputText("[pg][say: 你可能想退后一步，]他警告说，但还没等你来得及做任何事，一根长满带刺藤蔓的粗壮树干就从地下喷发而出。成千上万根藤蔓状的树枝从主干上分裂出来，当它伸向三十英尺的高空时，从主干向外辐射，并在向地面弯曲时与相邻的树枝交织在一起。在几分钟的时间里，你的营地里长出了一棵长满荆棘的树，以及一层厚厚的带刺藤蔓网，阻止了从上方进入的可能。");
         get_player().createStatusEffect(StatusEffects.DefenseCanopy,0,0,0,0);
         get_player().addKeyValue("Marae\'s Lethicite",1,-1);
         doNext(playerMenu);
      }
      
      public function growLethiciteDefenseGuessNot() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("encounter-rathazul");
         outputText("拉萨祖尔睿智地点了点头，[say: 这也许是明智的。也许这种力量还有其他用途。]");
         doNext(returnToRathazulMenu);
      }
      
      public function growLethiciteDefense() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("encounter-rathazul");
         outputText("拉萨祖尔问道，[say: 你绝对确定吗？生长出这种荆棘天篷作为防御，将消耗这块水晶三分之一的力量。]");
         outputText("[pg]你要让拉萨祖尔使用水晶生长出防御天篷吗？");
         doYesNo(growLethiciteDefenseYesYesYes,growLethiciteDefenseGuessNot);
      }
      
      public function get_reductoCost() : int
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,82) >= 2)
         {
            return 50;
         }
         return 100;
      }
      
      public function get_offeredDebimbo() : Boolean
      {
         if(!saveContent.offeredDebimboPlayer)
         {
            return saveContent.offeredDebimboSophie;
         }
         return true;
      }
      
      public function get_mixologyXP() : int
      {
         return saveContent.mixologyXP;
      }
      
      public function get_debugName() : String
      {
         return "Rathazul";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getThatRatAss() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-accident");
         outputText("你滑到拉萨祖尔在营地的位置，向他眨了眨眼，说道，[say: 嘿，小可爱，你有11个质子吗？因为你钠么迷人。]");
         outputText("[pg]拉萨祖尔从他正在忙活的事情中抬起头，疲惫地眨了眨眼。[say: 什么？]");
         outputText("[pg][say: 哦，没什么。]你轻声笑了起来。[say: 只是我们之间产生了化学反应，所以我觉得是时候尝试一下生物学了。]");
         outputText("[pg]一阵沉默之后，他咳嗽了一声。[say: 我——我很抱歉，你想说什么？]他的眼睛里闪烁着恳求的光芒，请求你停下来。");
         outputText("[pg]没门。你一定要得到你来这里的目的。你挺起胸膛，宣布道，[say: 我想操你。]");
         outputText("[pg][say: 哦……哦哦哦，不……]他后退了几步，喃喃自语，[say: 不，不不不不不不，不，不……]他的眼神变得呆滞，步伐变得不协调，仿佛他的灵魂离开了他的身体。[say: 不，不，不……不……不……]");
         outputText("[pg]他的脚踩进了一个碗里，滑倒了，摔在地上。他的头撞在了一块石头上。你听到了一声不该有的碎裂声。你四肢着地，把手放在他的肩膀上，大喊他的名字。他没有回应。你把手放在他的脖子上。他的脉搏已经停止了，他的头部周围聚集着血液。");
         outputText("[pg]你站起身，非常缓慢地后退。你不知道刚才发生了什么，但你确定一件事——你需要离开这里。");
         outputText("[pg]一个小时后，你鼓起勇气回到了你的犯罪现场。然而，令你大吃一惊的是，没有现场。拉萨祖尔又站起来了，尽管他明显在避免看你。他只在地上留下了一张纸条。你捡起来读了读。");
         outputText("[pg][say: 不。请不要再问我那个问题了。\n——拉萨祖尔]");
         outputText("[pg]天啊，真是个戏精。简单的一句“不用了，谢谢”不就行了。你气呼呼地把纸条扔到一边，转身回营地去了。");
         outputText("[pg]不过，一想到那只老鼠的屁股，你还是会觉得兴奋……");
         dynStats(DynStat.Lust(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function followerRathazul() : Boolean
      {
         return saveContent.campFollower;
      }
      
      public function execEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("encounter-rathazul");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 2 && saveContent.metRathazul)
         {
            get_marblePurification().visitRathazulToPurifyMarbleAfterLaBovaStopsWorkin();
            return;
         }
         if(saveContent.metRathazul)
         {
            outputText("你瞥见了湖边熟悉的景象——炼金术士拉萨祖尔的营地。这只年迈的老鼠在设备间穿梭，似乎完全没有注意到你的存在，但你对他足够了解，敢打赌他绝对知道你来了。");
            unlockCodexEntry(2740);
         }
         else
         {
            outputText("当你绕过一个大灌木丛时，你遇到了一个正在劳作的佝偻身影。他穿着破烂的长袍，遮住了大部分身躯，但你还是能看到" + (get_noFur() ? "像老鼠一样的胡须" : "像老鼠一样的口鼻") + "从遮蔽他大部分身形的阴影兜帽中伸出来。只需看一眼他的背后，就能证实你的猜测——这是某种鼠人。他似乎没有注意到你的存在，正用一只手搅拌着一锅粘稠的液体；在他左边的泥土上，整齐地堆放着烧杯和小瓶。你看到他苍老的脸上绽放出笑容，他说道，[say: 走近点，孩子。我不会咬人的。][pg]出于对这片未知土地上危险的担忧，你小心翼翼地靠近。[pg][say: 我是炼金术士拉萨祖尔。我曾因我的奇迹疗法而闻名。现在我只能在这个湖边闲逛，除了测量污染这片水域的日益增加的腐化之外，我无能为力，]他一边说一边拉下兜帽，露出了他那完全秃顶且布满皱纹的整个脑袋" + (get_noFur() ? "；除了胡须和老鼠般的小耳朵外，完全像个人类" : "") + "。");
            saveContent.metRathazul = true;
            unlockCodexEntry(2740);
         }
         if(get_mixologyXP() >= 16 && !saveContent.campOffer && get_player().isPureEnough(75))
         {
            outputText("[pg][say: 你知道吗，我觉得如果在你的营地里，我能为这个破败的世界做更多的好事，而不是在这个湖边游荡。你觉得怎么样？]老鼠问道。");
            outputText("[pg]让拉萨祖尔搬进你的营地？");
            doYesNo(rathazulMoveToCamp,rathazulMoveDecline);
            saveContent.campOffer = true;
            return;
         }
         rathazulWorkOffer();
      }
      
      public function encounterName() : String
      {
         return "rathazul";
      }
      
      public function encounterChance() : Number
      {
         if(followerRathazul())
         {
            return 0;
         }
         return 0.5;
      }
      
      public function declineSilkArmorCommish() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("encounter-rathazul");
         outputText("你从拉萨祖尔那里拿回丝绸，告诉他你现在不能花500宝石在这样的项目上。他叹了口气，给了你一个沮丧的眼神，并微微点了点头，他那戴着兜帽的" + (get_noFur() ? "头。" : "口鼻。"));
         doNext(returnToRathazulMenu);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null));
      }
      
      public function craftingInProgress() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) > 0;
      }
      
      public function craftSilkArmor() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-lab");
         outputText("你小心翼翼地把成捆的蛛丝递给拉萨祖尔，生怕伤到这只年迈的老鼠。他冲你困惑地笑了笑，一把从你手中夺过东西，嘴里嘟囔着：[say: 我还没老到要散架的地步呢。]");
         if(!get_player().hasItem(get_useables().T_SSILK,2))
         {
            outputText("[pg]老鼠摇了摇头，把它还给了你。[say: 这点东西不够我做任何东西。我总共至少需要五捆这种材料，所以你还得去找更多，]他解释道。");
            if(get_player().tail.type == 5)
            {
               outputText("[pg]作为回应，你向他展示了你蜘蛛般的腹部，提出可以为他生产更多的蛛丝。拉萨祖尔干笑了几声，那声音让你想起热风吹过死寂山谷的呼啸声。[say: 亲爱的孩子，这可不行。这么坚韧的丝只有纯种蜘蛛才能吐出来。无论你怎么改变自己，你的内心始终是个人类。]");
               outputText("[pg]老鼠摇了摇头，补充道：[say: 嗯，现在想想，红寡妇的毒液也许能把你彻底变成蜘蛛，但我完全不知道那会对你造成什么影响。如果你哪天想尝试这种危险又鲁莽的想法，一定要告诉我。我要准备好我的笔记本，为了科学！]");
            }
            doNext(returnToRathazulMenu);
            return;
         }
         outputText("[pg]老鼠手里拿着蛛丝，一瘸一拐地走到他的设备前。他动作熟练高效，进行了一些测试。完成后，他叹了口气解释道：[say: 这比我想象的要难。这种蛛丝对我的大多数炼金试剂都有很强的抗性。哪怕只是开始处理这种材料，我也需要许多稀有昂贵的元素。我至少需要500颗宝石才能启动这个项目。]");
         outputText("[pg]当他报出这么大一笔数字时，你忍不住叹了口气。你要把500颗宝石和蛛丝交给他，让他为你制作一件衣服吗？");
         if(get_player().get_gems() < 500)
         {
            outputText("<b>等等……你连500颗宝石都没有。该死。</b>");
            doNext(returnToRathazulMenu);
            return;
         }
         doYesNo(commissionSilkArmorForReal,declineSilkArmorCommish);
      }
      
      public function craftOozeArmor() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("item-gelArmor");
         outputText("拉萨祖尔从你手中接过绿色凝胶，扔进一个空坩埚里。他以远超你对这种年迈生物预期的速度，敏捷地拔开几个小瓶的塞子，将它们倒入坩埚中。他让混合物沸腾起来，从你原以为是一堆废料的东西中准备好一个简单的人形模具。没过多久，他就把沸腾的液体倒进了模具里，几分钟后，他敲开模具，露出了一套闪闪发光的护甲。");
         get_player().destroyItems(get_useables().GREENGL,5);
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_armors().GELARMR,returnToRathazulMenu);
      }
      
      public function craftMaraeArmor(param1:Boolean = false) : void
      {
         clearOutput();
         get_images().showImage("rathazul-lab");
         if(!param1)
         {
            outputText("你向他展示了那些长着触手的厚树皮。");
            outputText("[pg][say: 哎呀呀。这绝对是我见过的最奇怪的东西了。不过既然你要求了，我会为你制作护甲的，]老鼠人说道。他接过那堆树皮，小心翼翼地避免碰到那些还在蠕动的触手。他在工作台上忙碌了一个小时，而你在一旁等待。");
            outputText("[pg]完成后，拉萨祖尔脸上交织着自豪与羞愧的神情，[say: 我想你会满意的。去看看吧。我再也不做这种护甲了。我差点被那些触手吓了一跳。]");
            outputText("[pg]他把护甲递给了你。");
            doNext(takethatMarmorC);
         }
         else
         {
            outputText("你向他展示了那些发着白光的厚树皮。");
            outputText("[pg][say: 哎呀呀。我听到了玛莱的声音，指示我为你制作这套护甲，]老鼠人说道。他接过那堆树皮，在工作台上忙碌了一个小时，而你在一旁等待。");
            outputText("[pg]完成后，拉萨祖尔脸上交织着自豪与羞愧的神情，[say: 我想你会满意的。去看看吧。我再也不做这种护甲了。我试了好多次才把这些树皮甲片弯成合适的形状。]");
            outputText("[pg]他把护甲递给了你。");
            doNext(takethatMarmorD);
         }
      }
      
      public function craftGolemArmor() : void
      {
         clearOutput();
         outputText("你向他展示了在火山石人闷烧的残骸中发现的那颗奇特的宝石。");
         outputText("[pg][saystart]哦，令人印象深刻。这似乎是一颗魔像之心。现在还在运作的魔像可不多了。你要么是运气好在地上捡到了这颗宝石，要么就是运气好在战斗中击败了一只魔像。");
         outputText("[pg]不管怎样，我都能把它打造成极其强大的盔甲，[sayend]老鼠人说道。他接过这颗不同寻常的宝石，手碰到它时因为惊人的热量而猛地缩了一下。他在工作台上忙活了一个小时，而你在一旁等待。");
         outputText("[pg]当他完成时，拉萨祖尔脸上洋溢着既自豪又有些遗憾的笑容，[say: 我想你会满意的。去看看吧。可惜我可能再也没有机会处理魔像之心了。我相信还能做些改进。]");
         outputText("[pg]这套看起来华丽威严的全身甲有着明显的黑曜石质感，漆黑且呈结晶状。金色的光芒从胸甲中心向外辐射，魔像之心就镶嵌在那里，依然闪烁着橙色的光芒。");
         outputText("[pg][say: 除了提供堪比魔像的防护外，它还能通过喷射魔法岩浆来伤害任何试图在近战范围内攻击你的敌人。别担心，你不会被烧伤的。不过里面可能会感觉有点热，我在制作它的时候差点把手给烫伤了。]你向他道谢并收下了盔甲。");
         get_player().removeKeyItem("Golem\'s Heart");
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_armors().GOLARMR,returnToRathazulMenu);
      }
      
      public function craftEbonweaveArmorForReal(param1:int = 0) : void
      {
         var _loc3_:* = null as ItemType;
         spriteSelect(SpriteDb.get_s_rathazul());
         if(param1 == 0 || param1 == 1 || param1 == 2)
         {
            get_player().destroyItems(get_useables().EBNFLWR,10);
         }
         else if(param1 == 3)
         {
            get_player().destroyItems(get_useables().EBNFLWR,8);
         }
         else
         {
            get_player().destroyItems(get_useables().EBNFLWR,3);
         }
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 500);
         clearOutput();
         outputText("拉萨祖尔接过花，微微点头，然后开始工作。你决定趁这段时间去散散步。");
         outputText("[pg]当你回来时，你注意到了一些不寻常的东西。");
         switch(param1)
         {
            case 0:
               get_images().showImage("item-ebonArmor");
               outputText("拉萨祖尔的工作台旁放着一套板甲，由于缺乏光泽，它几乎隐形。你走近工作台，注意到灰色金属的表面似乎有一种油腻的质感。这套盔甲分为两层——内层由光滑而有弹性的黑檀布制成，外层则是黑檀板甲。拿起其中一块板甲，你发现板甲很薄，盔甲本身也非常轻。");
               outputText("[pg]出于对其强度的的好奇，你从拉萨祖尔的工具中拿出一把刀，试探性地敲击胸甲。敲了几下后，刀变钝了，但板甲却没有受到任何损伤。拉萨祖尔在告诉你黑檀花的独特性质时并没有夸大其词……当你把整套盔甲组装起来准备穿上时，你意识到，尽管这套盔甲很轻，但它对你行动的限制并不亚于任何一套板甲。你向拉萨祖尔道谢，然后收起了你的新盔甲。");
               _loc3_ = get_armors().EBNARMR;
               break;
            case 1:
               get_images().showImage("item-ebonJacket");
               outputText("拉萨祖尔的工作台旁放着一件长外套和一件胸甲。这两件物品都是油腻的深灰色。附近的一个小架子上，还有一件颜色相似的衬衫和一条裤子。你走近工作台，注意到皮革表面有一种油腻的质感。长外套的质感比胸甲自然得多。你很确定它是皮革做的，但它看起来又不太像。也许拉萨祖尔将黑檀花融入了一件普通的夹克中，改变了皮革的属性。胸甲就更奇怪了。它摸起来像金属，但却像海绵一样。在你的手指下它会微微弯曲，当你移开手时又会恢复原状。你发现附近有一把刀，拿起来试探性地想切开胸甲。什么也没发生。即使你越来越用力地尝试了几次，板甲上也没有留下任何痕迹。你觉得这套盔甲会非常实用。你向拉萨祖尔道谢，然后收起了你的新盔甲。");
               _loc3_ = get_armors().EBNJACK;
               break;
            case 2:
               get_images().showImage("item-ebonRobe");
               outputText("拉萨祖尔的架子上挂着一件飘逸的长袍。深灰色的布料在风中泛起涟漪，但在光线下却像金属一样闪闪发光。你的手指滑过长袍，感受着柔软的材料在你的触摸下凹陷。你还注意到顶部有一个兜帽。它软绵绵地垂在长袍的背面，但很容易拉起来遮挡刺眼的阳光或雨水。除了物理方面，你还能感觉到一股神奇的力量流过这件长袍。你觉得这种力量在施展魔法时会非常有帮助。你向拉萨祖尔道谢，然后收起了你的新长袍。");
               _loc3_ = get_armors().EBNROBE;
               break;
            case 3:
               get_images().showImage("item-ebonRobent");
               outputText("拉萨祖尔的架子上挂着一件飘逸的长袍。深灰色的布料在风中泛起涟漪，但在光线下却像金属一样闪闪发光。仔细一看，你发现这件长袍更像是一件长外套，旨在展示你的胸部和腹股沟。你的手指滑过这件深灰色的衣服，感受着柔软的材料在你的触摸下凹陷。你还注意到顶部有一个兜帽。它软绵绵地垂在背面，但可以拉起来遮挡刺眼的阳光或雨水。把手伸进外套，你发现里面有一层黑檀带，可能是为了保持长袍前面敞开，防止它破坏你的平衡。这些带子非常隐蔽，你怀疑穿上长袍时甚至都不会注意到它们。除了物理元素之外，你还能感觉到一股神奇的力量流过这件外套。这种力量给你一种印象，它在施展法术时会非常有用。你向拉萨祖尔道谢，然后收起了你的新长袍。");
               _loc3_ = get_armors().EBNIROB;
               break;
            case 4:
               get_images().showImage("item-ebonVest");
               outputText("拉萨祖尔的架子上挂着一件背心。当你检查它时，你注意到深灰色的布料有一种油腻的光泽。你的手滑过这件衣服，发现这种布料比英格纳姆最好的布料还要光滑。然而，它有一种奇怪的滑腻感，不同于你所知道的任何布料。你还注意到这件背心是有弹性的，无论你的身材有多大，它都能贴合你的身形。你向拉萨祖尔道谢，然后收起了你的新背心。");
               _loc3_ = get_undergarments().EBNVEST;
               break;
            case 5:
               get_images().showImage("item-ebonCorset");
               outputText("拉萨祖尔的架子上挂着一件紧身胸衣。你检查了一下，注意到深灰色的布料泛着油亮的光泽。你的手滑过这件衣服，发现这种面料比英格纳姆最好的布料还要光滑。然而，它有一种奇怪的滑腻感，不同于你所知道的任何面料。你还注意到这件紧身胸衣很有弹性，无论你的身材有多丰满，它都能完美贴合。你向拉萨祖尔道谢，收下了你的新紧身胸衣。");
               _loc3_ = get_undergarments().EBNCRST;
               break;
            case 6:
               get_images().showImage("item-ebonJockstrap");
               outputText("拉萨祖尔的架子上挂着一件护裆。你检查了一下，注意到深灰色的布料泛着油亮的光泽。你的手滑过这件衣服，发现这种面料比英格纳姆最好的布料还要光滑。然而，它有一种奇怪的滑腻感，不同于你所知道的任何面料。你还注意到这件护裆很有弹性，无论你的本钱有多大，它都能完美贴合。你向拉萨祖尔道谢，收下了你的新护裆。");
               _loc3_ = get_undergarments().EBNJOCK;
               break;
            case 7:
               get_images().showImage("item-ebonThong");
               outputText("挂在拉萨祖尔的架子上的是一条丁字裤。你仔细端详，发现深灰色的布料上泛着油光。你用手抚过这件衣物，发现它的布料比英格纳姆最上等的布料还要光滑。然而，它有一种奇怪的滑腻感，与你所知的任何布料都不同。你还注意到这条丁字裤很有弹性，无论你的“本钱”有多大，它都能贴合你的身形。你向拉萨祖尔道谢，收下了你的新丁字裤。");
               _loc3_ = get_undergarments().EBNTHNG;
               break;
            case 8:
               get_images().showImage("item-ebonLoincloth");
               outputText("挂在拉萨祖尔的架子上的是一块缠腰布。你仔细端详，发现深灰色的布料上泛着油光。你用手抚过这件衣物，发现它的布料比英格纳姆最上等的布料还要光滑。然而，它有一种奇怪的滑腻感，与你所知的任何布料都不同。你还注意到这块缠腰布很有弹性，无论你的“本钱”有多大，它都能贴合你的身形。你向拉萨祖尔道谢，收下了你的新缠腰布。");
               _loc3_ = get_undergarments().EBNCLTH;
               break;
            case 9:
               get_images().showImage("item-ebonJockstrapune");
               outputText("挂在拉萨祖尔的架子上的是一条护裆。你仔细端详，发现深灰色的布料上泛着油光。护裆的罩杯上装饰着一个涌动着黑魔法的符文。");
               if(get_player().hasStatusEffect(StatusEffects.KnowsArouse))
               {
                  outputText("你脸红了，认出这个符文代表着情欲。");
               }
               outputText("你用手抚过这件衣物，发现它的布料比英格纳姆最上等的布料还要光滑。然而，它有一种奇怪的滑腻感，与你所知的任何布料都不同。你还注意到这条护裆很有弹性，无论你的“本钱”有多大，它都能贴合你的身形。你向拉萨祖尔道谢，收下了你的新护裆。");
               _loc3_ = get_undergarments().EBNRJCK;
               break;
            case 10:
               get_images().showImage("item-ebonThongune");
               outputText("拉萨祖尔的架子上挂着一条丁字裤。当你检查它时，你注意到深灰色的布料上泛着油光。正面装饰着一个散发着黑魔法气息的符文。");
               if(get_player().hasStatusEffect(StatusEffects.KnowsArouse))
               {
                  outputText("你脸红了，认出这个符文代表着情欲。");
               }
               outputText("你用手抚摸着这件衣服，发现它的布料比英格纳姆最好的布料还要光滑。然而，它有一种奇怪的滑腻感，不同于你所知道的任何布料。你还注意到这条丁字裤是有弹性的，无论你的本钱有多大，它都能贴合你的身形。你向拉萨祖尔道谢，收下了你的新丁字裤。");
               _loc3_ = get_undergarments().EBNRTNG;
               break;
            case 11:
               get_images().showImage("item-ebonLoinclothune");
               outputText("拉萨祖尔的架子上挂着一块缠腰布。当你检查它时，你注意到深灰色的布料上泛着油光。正面装饰着一个散发着黑魔法气息的符文。");
               if(get_player().hasStatusEffect(StatusEffects.KnowsArouse))
               {
                  outputText("你脸红了，认出这个符文代表着情欲。");
               }
               outputText("你用手抚摸着这件衣物，发现它的面料比英格纳姆最上乘的布料还要光滑。然而，它有一种奇怪的滑腻感，与你所知的任何面料都不同。你还注意到这条缠腰布是有弹性的，无论你的本钱有多大，它都能贴合你的身形。你向拉萨祖尔道谢，收下了你的新缠腰布。");
               _loc3_ = get_undergarments().EBNRLNC;
               break;
            default:
               outputText("出bug了！请把这个bug报告给管事的人。");
               _loc3_ = get_armors().EBNARMR;
         }
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(_loc3_,returnToRathazulMenu);
      }
      
      public function craftEbonweaveArmor() : void
      {
         var type11:int;
         var _g11:Rathazul;
         var type10:int;
         var _g10:Rathazul;
         var type9:int;
         var _g9:Rathazul;
         var type8:int;
         var _g8:Rathazul;
         var type7:int;
         var _g7:Rathazul;
         var type6:int;
         var _g6:Rathazul;
         var type5:int;
         var _g5:Rathazul;
         var type4:int;
         var _g4:Rathazul;
         var type3:int;
         var _g3:Rathazul;
         var type2:int;
         var _g2:Rathazul;
         var type1:int;
         var _g1:Rathazul;
         var type:int;
         var _g:Rathazul;
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-lab");
         var _loc1_:int = get_player().itemCount(get_useables().EBNFLWR);
         outputText("老鼠看着黑檀花，说道：[say: 我可以把这些做成盔甲。或者如果你想要的话，也可以做成内衣。我有必要的材料。不过我需要500宝石。]");
         if(get_player().get_gems() < 500)
         {
            outputText("[pg]<b>等等……你没有500宝石。该死。</b>");
            doNext(returnToRathazulMenu);
         }
         else
         {
            if(_loc1_ < 8)
            {
               outputText("[pg]你意识到你身上的黑檀花还不够，现在只能做内衣。");
            }
            else if(_loc1_ < 10)
            {
               outputText("[pg]你意识到你身上的黑檀花还不够做完整的长袍或盔甲，但你可以选择做暴露的长袍或内衣。");
            }
            menu();
            _g = this;
            type = 0;
            addNextButton("盔甲",function():void
            {
               _g.craftEbonweaveArmorForReal(type);
            }).hint(get_armors().EBNARMR.get_tooltipText(),get_armors().EBNARMR.get_tooltipHeader()).disableIf(_loc1_ < 10,"需要10朵黑檀花。");
            _g1 = this;
            type1 = 1;
            addNextButton("夹克",function():void
            {
               _g1.craftEbonweaveArmorForReal(type1);
            }).hint(get_armors().EBNJACK.get_tooltipText(),get_armors().EBNJACK.get_tooltipHeader()).disableIf(_loc1_ < 10,"需要10朵黑檀花。");
            _g2 = this;
            type2 = 2;
            addNextButton("长袍",function():void
            {
               _g2.craftEbonweaveArmorForReal(type2);
            }).hint(get_armors().EBNROBE.get_tooltipText(),get_armors().EBNROBE.get_tooltipHeader()).disableIf(_loc1_ < 10,"需要10朵黑檀花。");
            _g3 = this;
            type3 = 3;
            addNextButton("暴露长袍",function():void
            {
               _g3.craftEbonweaveArmorForReal(type3);
            }).hint(get_armors().EBNIROB.get_tooltipText(),get_armors().EBNIROB.get_tooltipHeader()).disableIf(_loc1_ < 8,"需要8朵黑檀花。");
            _g4 = this;
            type4 = 4;
            addNextButton("背心",function():void
            {
               _g4.craftEbonweaveArmorForReal(type4);
            }).hint(get_undergarments().EBNVEST.get_tooltipText(),get_undergarments().EBNVEST.get_tooltipHeader());
            _g5 = this;
            type5 = 5;
            addNextButton("束腰",function():void
            {
               _g5.craftEbonweaveArmorForReal(type5);
            }).hint(get_undergarments().EBNCRST.get_tooltipText(),get_undergarments().EBNCRST.get_tooltipHeader());
            _g6 = this;
            type6 = 6;
            addNextButton("护裆",function():void
            {
               _g6.craftEbonweaveArmorForReal(type6);
            }).hint(get_undergarments().EBNJOCK.get_tooltipText(),get_undergarments().EBNJOCK.get_tooltipHeader());
            _g7 = this;
            type7 = 7;
            addNextButton("丁字裤",function():void
            {
               _g7.craftEbonweaveArmorForReal(type7);
            }).hint(get_undergarments().EBNTHNG.get_tooltipText(),get_undergarments().EBNTHNG.get_tooltipHeader());
            _g8 = this;
            type8 = 8;
            addNextButton("缠腰布",function():void
            {
               _g8.craftEbonweaveArmorForReal(type8);
            }).hint(get_undergarments().EBNCLTH.get_tooltipText(),get_undergarments().EBNCLTH.get_tooltipHeader());
            _g9 = this;
            type9 = 9;
            addNextButton("符文护裆",function():void
            {
               _g9.craftEbonweaveArmorForReal(type9);
            }).hint(get_undergarments().EBNRJCK.get_tooltipText(),get_undergarments().EBNRJCK.get_tooltipHeader());
            _g10 = this;
            type10 = 10;
            addNextButton("符文丁字裤",function():void
            {
               _g10.craftEbonweaveArmorForReal(type10);
            }).hint(get_undergarments().EBNRTNG.get_tooltipText(),get_undergarments().EBNRTNG.get_tooltipHeader());
            _g11 = this;
            type11 = 11;
            addNextButton("符文缠腰布",function():void
            {
               _g11.craftEbonweaveArmorForReal(type11);
            }).hint(get_undergarments().EBNRLNC.get_tooltipText(),get_undergarments().EBNRLNC.get_tooltipHeader());
            setExitButton("算了",rathazulArmorMenu);
         }
      }
      
      public function craftDragonscaleArmorForReal(param1:int = 0) : void
      {
         var _loc2_:* = null as ItemType;
         spriteSelect(SpriteDb.get_s_rathazul());
         if(param1 == 0 || param1 == 1)
         {
            get_player().destroyItems(get_useables().D_SCALE,5);
         }
         else
         {
            get_player().destroyItems(get_useables().D_SCALE,2);
         }
         clearOutput();
         outputText("老鼠接过鳞片，在工作台上忙活了一个小时，而你在一旁等待。完成后，拉萨祖尔满脸自豪，[say: 我想你会满意的。来看看吧。]");
         switch(param1)
         {
            case 0:
               get_images().showImage("item-dragonscalearmor");
               outputText("[pg]这套盔甲是红色的，胸甲上有装饰精美的肩甲，看起来气势逼人。你摸了摸盔甲，感受到了鳞片的纹理。[say: 它非常灵活，应该能提供很好的保护，]拉萨祖尔说道。");
               _loc2_ = get_armors().DSCLARM;
               break;
            case 1:
               get_images().showImage("item-dragonscalerobes");
               outputText("[pg]这件长袍是红色的，表面似乎带有鳞片的纹理。你摸了摸长袍，感受到了鳞片的纹理。[say: 它非常灵活，应该能提供很好的保护，]拉萨祖尔说道。");
               _loc2_ = get_armors().DSCLROB;
               break;
            case 2:
               get_images().showImage("item-dragonscalebra");
               outputText("[pg]这件胸罩带有精美的龙鳞纹理。[say: 我用了皮带以保持其灵活性。它应该既舒适又具有保护性，]拉萨祖尔说道。");
               _loc2_ = get_undergarments().DS_BRA;
               break;
            case 3:
               get_images().showImage("item-dragonscalethong");
               outputText("[pg]这条丁字裤带有精美的龙鳞纹理。[say: 我用了皮带以保持其灵活性。它应该既舒适又具有保护性，]拉萨祖尔说道。");
               _loc2_ = get_undergarments().DSTHONG;
               break;
            case 4:
               get_images().showImage("item-dragonscaleloincloth");
               outputText("[pg]这条缠腰布带有精美的龙鳞纹理。[say: 我用了皮带以保持其灵活性。它应该既舒适又具有保护性，]拉萨祖尔说道。");
               _loc2_ = get_undergarments().DS_LOIN;
               break;
            default:
               outputText("出bug了！请把这个bug报告给管事的人。");
               _loc2_ = get_armors().DSCLARM;
         }
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(_loc2_,returnToRathazulMenu);
      }
      
      public function craftDragonscaleArmor() : void
      {
         var type4:int;
         var _g4:Rathazul;
         var type3:int;
         var _g3:Rathazul;
         var type2:int;
         var _g2:Rathazul;
         var type1:int;
         var _g1:Rathazul;
         var type:int;
         var _g:Rathazul;
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         var _loc1_:Boolean = get_player().hasItem(get_useables().D_SCALE,5);
         get_images().showImage("rathazul-lab");
         outputText("老鼠看着你带来的龙鳞，说道：[say: 我可以把这些做成盔甲。或者如果你想要的话，也可以做成内衣。我有必要的材料。]");
         if(!_loc1_)
         {
            outputText("[pg]你意识到你身上的龙鳞还不够做盔甲，但你可以选择做内衣。");
         }
         menu();
         _g = this;
         type = 0;
         addNextButton("盔甲",function():void
         {
            _g.craftDragonscaleArmorForReal(type);
         }).hint(get_armors().DSCLARM.get_tooltipText(),get_armors().DSCLARM.get_tooltipHeader()).disableIf(!_loc1_,"需要五片龙鳞。");
         _g1 = this;
         type1 = 1;
         addNextButton("长袍",function():void
         {
            _g1.craftDragonscaleArmorForReal(type1);
         }).hint(get_armors().DSCLROB.get_tooltipText(),get_armors().DSCLROB.get_tooltipHeader()).disableIf(!_loc1_,"需要五片龙鳞。");
         _g2 = this;
         type2 = 2;
         addNextButton("胸罩",function():void
         {
            _g2.craftDragonscaleArmorForReal(type2);
         }).hint(get_undergarments().DS_BRA.get_tooltipText(),get_undergarments().DS_BRA.get_tooltipHeader());
         _g3 = this;
         type3 = 3;
         addNextButton("丁字裤",function():void
         {
            _g3.craftDragonscaleArmorForReal(type3);
         }).hint(get_undergarments().DSTHONG.get_tooltipText(),get_undergarments().DSTHONG.get_tooltipHeader());
         _g4 = this;
         type4 = 4;
         addNextButton("缠腰布",function():void
         {
            _g4.craftDragonscaleArmorForReal(type4);
         }).hint(get_undergarments().DS_LOIN.get_tooltipText(),get_undergarments().DS_LOIN.get_tooltipHeader());
         setExitButton("算了",rathazulArmorMenu);
      }
      
      public function craftCarapace() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("item-chitinArmor");
         outputText("老鼠接过鳞片，在工作台上忙活了一个小时，而你在一旁等待。完成后，拉萨祖尔满脸自豪，[say: 我想你会满意的。来看看吧。]");
         outputText("[pg]这些甲片闪耀着黑钢般的光泽。他用黄色的甲壳为甲片添加了点缀和刺绣，其细节和工艺水平在你的家乡都极为罕见。用碎片上找到的毛发制成了一条黄色的毛皮领衬。这套盔甲包括胸甲、护肩、全套护臂和及膝长靴。你注意到没有裤子。当你转头问他裤子在哪时，你看到他正挠着头，慌忙地在抽屉里翻找。他小声嘟囔着，[say: 抱歉，抱歉，我太专注于做护肩了，忘了做腿部护甲！给，这个搭配起来应该不错，而且不会限制你的行动。]他递给你一条丝绸缠腰布。尽管犯了错，他看起来还是有些沾沾自喜" + (get_silly() ? "，甚至还有点吹嘘。[say: 让我给你看看我用的不同长度的线。]" : "。"));
         if(get_player().hasCock() && get_player().biggestCockArea() >= 40)
         {
            outputText("[pg]丝绸材质几乎掩盖不住你胯下的凸起，甚至看起来还有点淫荡。拉萨祖尔嘟囔着转过头去，摇了摇头。");
         }
         if(get_player().biggestTitSize() >= 8)
         {
            outputText("[pg]你的" + get_player().biggestBreastSizeDescript() + "勉强塞进胸甲里，露出了一大片晃动的乳沟。");
         }
         get_player().destroyItems(get_useables().B_CHITN,5);
         set_mixologyXP(get_mixologyXP() + 8);
         get_inventory().takeItem(get_armors().BEEARMR,returnToRathazulMenu);
      }
      
      public function commissionSilkArmorForReal() : void
      {
         var robeType4:int;
         var _g4:Rathazul;
         var robeType3:int;
         var _g3:Rathazul;
         var robeType2:int;
         var _g2:Rathazul;
         var robeType1:int;
         var _g1:Rathazul;
         var robeType:int;
         var _g:Rathazul;
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("rathazul-lab");
         var _loc1_:Boolean = get_player().hasItem(get_useables().T_SSILK,5);
         outputText("你把500颗宝石装进一个小袋子里，连同剩下的蛛丝一起扔给拉萨祖尔。这位干瘪的炼金术士以闪电般的速度在半空中接住这些东西，并立即开始工作。他精力充沛地忙碌着，被眼前充满挑战的任务激发了活力。拉萨祖尔似乎完全忘记了你的存在，但当你转身准备离开时，他大声喊道：[saystart]你想让我做什么？");
         if(_loc1_)
         {
            outputText("法师长袍还是坚不可摧的盔甲？如果你想要内衣也可以。[sayend]");
         }
         else
         {
            outputText("你带来的丝只够做内衣，长袍或盔甲需要五捆。[sayend]");
         }
         menu();
         _g = this;
         robeType = 1;
         addNextButton("盔甲",function():void
         {
            _g.chooseArmorOrRobes(robeType);
         }).hint(get_armors().SSARMOR.get_tooltipText(),get_armors().SSARMOR.get_tooltipHeader()).disableIf(!_loc1_,"你没有足够的蛛丝。");
         _g1 = this;
         robeType1 = 2;
         addNextButton("长袍",function():void
         {
            _g1.chooseArmorOrRobes(robeType1);
         }).hint(get_armors().SS_ROBE.get_tooltipText(),get_armors().SS_ROBE.get_tooltipHeader()).disableIf(!_loc1_,"你没有足够的蛛丝。");
         _g2 = this;
         robeType2 = 3;
         addNextButton("胸罩",function():void
         {
            _g2.chooseArmorOrRobes(robeType2);
         }).hint(get_undergarments().SS_BRA.get_tooltipText(),get_undergarments().SS_BRA.get_tooltipHeader());
         _g3 = this;
         robeType3 = 4;
         addNextButton("内裤",function():void
         {
            _g3.chooseArmorOrRobes(robeType3);
         }).hint(get_undergarments().SSPANTY.get_tooltipText(),get_undergarments().SSPANTY.get_tooltipHeader());
         _g4 = this;
         robeType4 = 5;
         addNextButton("缠腰布",function():void
         {
            _g4.chooseArmorOrRobes(robeType4);
         }).hint(get_undergarments().SS_LOIN.get_tooltipText(),get_undergarments().SS_LOIN.get_tooltipHeader());
         setExitButton("算了",declineSilkArmorCommish);
      }
      
      public function collectSilkArmor() : void
      {
         var _loc1_:* = null as ItemType;
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         outputText("拉萨祖尔满面笑容地宣布：[saystart]好消息[if (silly) {，各位}]！你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275) == 1)
         {
            outputText("护甲");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275) == 2)
         {
            outputText("长袍");
         }
         else
         {
            outputText("内衣");
         }
         outputText("做好了！[sayend]");
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275))
         {
            case 1:
               get_images().showImage("item-silkArmor");
               outputText("[pg]一套闪闪发光的白色护甲放在一个简陋的护甲架上，表面反射着美丽的光芒。你绝对没料到会是这样的东西！它看起来几乎和一套轻型板甲一模一样，但它的表面并没有金属的冰冷感，摸起来反而有些海绵般的质感，带有一点点弹性。");
               outputText("[pg]当你对这件奇怪的装备感到惊叹时，拉萨祖尔解释道：[say: 当你说你想要护甲时，我意识到我可以省去一些用来软化材料的炼金工序。省下来的钱让我买了一套便宜的金属护甲作为底模，我把一半的材料绕着每个部件塑形，然后把它取下来，用剩下的蛛丝做成了外层的防御层。遗憾的是，我没有足够的蛛丝来做一个结实的护裆，但我确实用剩下的边角料为你做了一条薄薄的缠腰布——为了遮羞。]");
               _loc1_ = get_armors().SSARMOR;
               break;
            case 2:
               get_images().showImage("item-silkRobes");
               outputText("[pg]一个小架子上挂着一件飘逸的长袍。它在光线下闪闪发光，珍珠白色的丝线似乎随着微风吹过柔软布料泛起的每一丝涟漪而闪烁发亮。你的手指滑过这件丝绸衣物，感受着柔软材料在你触碰下的弹性。长袍带有一个兜帽，边缘绣着金色的镶边。现在它软绵绵地垂在背后，但很容易就能拉起来，以遮挡刺眼的阳光或蒙蒙细雨。袖子与兜帽相配，上面环绕着错综复杂的丝线，编织成奥术图案。");
               outputText("[pg]拉萨祖尔小心翼翼地取下这件衣服递给你。[say: 别被这材料的柔软给骗了。这件长袍比许多护甲都要坚韧，而且蛛丝的特性甚至可能对你施法也有帮助。]");
               _loc1_ = get_armors().SS_ROBE;
               break;
            case 3:
               get_images().showImage("item-silkBra");
               outputText("[pg]桌子上放着一件白色的胸罩。它在光线下闪闪发光，珍珠白色的丝线似乎随着微风吹过柔软布料泛起的每一丝涟漪而闪烁发亮。你的手指滑过这件丝绸衣物，感受着柔软材料在你触碰下的弹性。");
               outputText("[pg]拉萨祖尔小心翼翼地拿起这件衣服递给你。[say: 别被这材料的柔软给骗了。这件胸罩非常耐用，穿起来应该也很舒服。]");
               _loc1_ = get_undergarments().SS_BRA;
               break;
            case 4:
               get_images().showImage("item-silkPanties");
               outputText("[pg]桌子上放着一条白色的内裤。它在光线下闪闪发光，珍珠白色的丝线似乎随着微风吹过柔软布料泛起的每一丝涟漪而闪烁发亮。你的手指滑过这件丝绸衣物，感受着柔软材料在你触碰下的弹性。");
               outputText("[pg]拉萨祖尔小心翼翼地拿起这件衣服递给你。[say: 别被这材料的柔软给骗了。这条内裤非常耐用，穿起来应该也很舒服。]");
               _loc1_ = get_undergarments().SSPANTY;
               break;
            case 5:
               get_images().showImage("item-silkLoincloth");
               outputText("[pg]桌子上放着一条白色的缠腰布。它在光线下闪闪发光，珍珠白色的丝线似乎随着微风吹过柔软布料泛起的每一丝涟漪而闪烁发亮。你的手指滑过这件丝绸衣物，感受着柔软材料在你触碰下的弹性。");
               outputText("[pg]拉萨祖尔小心翼翼地拿起这件衣服递给你。[say: 别被这材料的柔软给骗了。这条缠腰布非常耐用，穿起来应该也很舒服。]");
               _loc1_ = get_undergarments().SS_LOIN;
               break;
            default:
               outputText("[pg]出Bug了！请向有关人员报告此Bug。");
               _loc1_ = get_armors().SS_ROBE;
         }
         set_mixologyXP(get_mixologyXP() + 8);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,275,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,274,0);
         get_inventory().takeItem(_loc1_,returnToRathazulMenu);
      }
      
      public function chooseArmorOrRobes(param1:int) : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         if(param1 == 1 || param1 == 2)
         {
            get_player().destroyItems(get_useables().T_SSILK,5);
         }
         else
         {
            get_player().destroyItems(get_useables().T_SSILK,2);
         }
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 500);
         statScreenRefresh();
         clearOutput();
         outputText("[pg]拉萨祖尔咕哝了一声作为回应，然后回去工作了。");
         if(followerRathazul())
         {
            outputText("你转身回到营地中心");
         }
         else
         {
            outputText("你走回营地");
         }
         outputText("，心里纳闷这只老耗子是否真的能交出他向你承诺的那件神奇物品。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,275,param1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,274,24);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function campRathazul() : void
      {
         spriteSelect(SpriteDb.get_s_rathazul());
         clearOutput();
         get_images().showImage("encounter-rathazul");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 2 && saveContent.metRathazul)
         {
            get_marblePurification().visitRathazulToPurifyMarbleAfterLaBovaStopsWorkin();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275) > 0)
         {
            collectSilkArmor();
            return;
         }
         if(!saveContent.offeredDebimboPlayer && get_player().isRetarded() || !saveContent.offeredDebimboSophie && get_sophieBimbo().bimboSophie())
         {
            rathazulDebimboOffer();
            return;
         }
         if(Utils.rand(6) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,87) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,87,3);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,84) == 0 && jojoFollower())
            {
               get_finter().jojoOffersRathazulMeditation();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,82) == 0 && get_amilyScene().amilyFollowerPure())
            {
               get_finter().AmilyIntroducesSelfToRathazul();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,82) == 1 && get_amilyScene().amilyFollowerPure())
            {
               get_finter().amilyIngredientDelivery();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,82) == 2 && get_amilyScene().amilyFollowerPure())
            {
               get_finter().amilyAsksAboutRathazulsVillage();
               return;
            }
         }
         get_images().showImage("rathazul-himself");
         get_akky().locationDesc("拉萨祖尔");
         outputText("拉萨祖尔从他的设备中抬起头，给了你一个不确定的微笑。");
         outputText("[pg][say: 哦，别管我，]他说，[say: 我只是在这里做一些测试。你需要什么吗，[name]？]");
         unlockCodexEntry(2740);
         rathazulWorkOffer();
      }
      
      public function buyOils() : void
      {
         shopReturn = buyOils;
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         get_images().showImage("rathazul-oils");
         outputText("拉萨祖尔微笑着拿出了几瓶护肤油。你想要哪一种？");
         menu();
         addOil("深色",get_consumables().DARK_OL);
         addOil("乌木色",get_consumables().EBONYOL);
         addOil("白皙色",get_consumables().FAIR_OL);
         addOil("浅色",get_consumables().LIGHTOL);
         addOil("红木色",get_consumables().MAHOGOL);
         addOil("橄榄色",get_consumables().OLIVEOL);
         addOil("赤褐色",get_consumables().RUSS_OL);
         if(get_mixologyXP() >= 50)
         {
            addOil("红色",get_consumables().RED__OL);
            addOil("绿色",get_consumables().GREENOL);
            addOil("白色",get_consumables().WHITEOL);
            addOil("蓝色",get_consumables().BLUE_OL);
            addOil("黑色",get_consumables().BLACKOL);
            addOil("紫色",get_consumables().PURPLOL);
            addOil("银色",get_consumables().SILVROL);
         }
         if(get_mixologyXP() >= 100)
         {
            addOil("橙色",get_consumables().ORANGOL);
            addOil("黄色",get_consumables().YELLOOL);
         }
         if(get_mixologyXP() >= 120)
         {
            addOil("黄绿色",get_consumables().YELGROL);
            addOil("春绿色",get_consumables().SPRGROL);
            addOil("青色",get_consumables().CYAN_OL);
            addOil("海蓝色",get_consumables().OCBLUOL);
         }
         if(get_mixologyXP() >= 150)
         {
            addOil("电紫",get_consumables().ELVIOOL);
            addOil("洋红",get_consumables().MAGENOL);
            addOil("深粉",get_consumables().DPPNKOL);
            addOil("粉色",get_consumables().PINK_OL);
         }
         setExitButton("返回",rathazulShopMenu);
      }
      
      public function buyLotions() : void
      {
         shopReturn = buyLotions;
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         get_images().showImage("rathazul-vials");
         outputText("拉萨祖尔微笑着拿出了几瓶润肤露。你想要哪种？");
         menu();
         addLotion("透明",get_consumables().CLEARLN);
         addLotion("粗糙",get_consumables().ROUGHLN);
         addLotion("性感",get_consumables().SEXY_LN);
         addLotion("光滑",get_consumables().SMTH_LN);
         setExitButton("返回",rathazulShopMenu);
      }
      
      public function buyItem(param1:ItemType, param2:int, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         clearOutput();
         if(param3 == "")
         {
            param3 = "item-box";
         }
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - param2);
         statScreenRefresh();
         get_images().showImage(param3);
         get_inventory().takeItem(param1,returnToShopMenu);
         set_mixologyXP(get_mixologyXP() + 4);
      }
      
      public function buyDyes() : void
      {
         shopReturn = buyDyes;
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         get_images().showImage("rathazul-vials");
         outputText("拉萨祖尔微笑着拿出了几瓶彩色液体。你想要哪种染发剂？");
         menu();
         addDye("赤褐色",get_consumables().AUBURND);
         addDye("黑色",get_consumables().BLACK_D);
         addDye("金色",get_consumables().BLOND_D);
         addDye("棕色",get_consumables().BROWN_D);
         addDye("红色",get_consumables().RED_DYE);
         addDye("白色",get_consumables().WHITEDY);
         addDye("灰色",get_consumables().GRAYDYE);
         if(get_mixologyXP() >= 32)
         {
            addDye("蓝色",get_consumables().BLUEDYE);
            addDye("绿色",get_consumables().GREEN_D);
            addDye("橙色",get_consumables().ORANGDY);
            addDye("黄色",get_consumables().YELLODY);
            addDye("紫色",get_consumables().PURPDYE);
            addDye("粉色",get_consumables().PINKDYE);
            addDye("赤褐色",get_consumables().RUSSDYE);
         }
         if(get_mixologyXP() >= 48)
         {
            addDye("彩虹色",get_consumables().RAINDYE);
         }
         setExitButton("返回",rathazulShopMenu);
      }
      
      public function askRathazulAboutNobleShirt() : void
      {
         clearOutput();
         registerTag("shirtStage",TagFun_Impl_.fromInt(get_undergarments().SEA_SHIRT.saveContent.armorStage));
         outputText("你直接向这位知识渊博的老鼠说明了情况，解释说你在湖边从一个疯子那里得到的衬衫粘在了你的身体上。他上下打量了你一番，轻声哼了一下。[say: 我不太确定我能做什么，但让我们来看看……]");
         outputText("[pg]他摸了摸那[if (shirtStage > 3) {东西和它那肉一样的褶皱|布料}]，用手在上面抚摸着。[say: 也许强效的碱液能破坏它——不得不承认，这与其说是炼金术的推论，不如说是我年轻时洗衣服的一段不幸经历。] 他的回忆伴随着一声轻笑。拉萨祖尔在他的炼金术用品里翻找了一会儿，很快就开始混合材料。");
         outputText("[pg]几分钟过去了，一小份碱液混合物很快就配好了。[say: 碱液在制作肥皂和中和某些东西时非常有用，] 他一边解释，一边掀起你身后的布料。[say: 但它本身对皮肤甚至织物都非常危险。] 碱液被揉进材料里，然后——");
         outputText("[pg][b:一种令人担忧的、灼热的、腐蚀性的感觉折磨着你。] 拉萨祖尔看到你立刻的反应，挑了挑眉，迅速用另一种化学物质擦拭那个地方。[say: 看来这对炼金术来说没那么简单。也许那些精通魔法的人会有答案？] 他沉思着。");
         outputText("[pg]考虑到他在湖边待了那么长时间，你本来对他的见解抱有更高的期望。唉，你得去找别人了。");
         get_undergarments().SEA_SHIRT.saveContent.rathazulAsked = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function addShopItem(param1:ItemType, param2:int, param3:String = undefined) : void
      {
         var image1:String;
         var cost1:int;
         var item1:ItemType;
         var _g:Rathazul;
         if(param3 == null)
         {
            param3 = "";
         }
         _g = this;
         item1 = param1;
         cost1 = param2;
         image1 = param3;
         var _loc4_:Function = function():void
         {
            _g.buyItem(item1,cost1,image1);
         };
         addNextButton(param1.get_shortName(),_loc4_).hint("花费：" + param2 + " 宝石。[pg]" + param1.get_tooltipText(),param1.get_tooltipHeader()).disableIf(get_player().get_gems() < param2,"需要 " + param2 + " 宝石。");
      }
      
      public function addPurify(param1:ItemType, param2:ItemType, param3:int = 20) : void
      {
         var _g:Rathazul = this;
         var item1:ItemType = param1;
         var result1:ItemType = param2;
         var cost1:int = param3;
         var _loc4_:Function = function():void
         {
            _g.rathazulPurifyItem(item1,result1,cost1);
         };
         addNextButton(param1.get_shortName(),_loc4_).disableIf(!get_player().hasItem(param1),"你没有这个物品。").disableIf(get_player().get_gems() < param3,"需要 " + param3 + " 宝石。");
      }
      
      public function addOil(param1:String, param2:ItemType) : void
      {
         addNamedShopItem(param1,param2,50,"item-oil");
      }
      
      public function addNamedShopItem(param1:String, param2:ItemType, param3:int, param4:String = undefined) : void
      {
         var image1:String;
         var cost1:int;
         var item1:ItemType;
         var _g:Rathazul;
         if(param4 == null)
         {
            param4 = "";
         }
         _g = this;
         item1 = param2;
         cost1 = param3;
         image1 = param4;
         addNextButton(param1,function():void
         {
            _g.buyItem(item1,cost1,image1);
         }).hint("花费：" + param3 + " 宝石。[pg]" + param2.get_tooltipText(),param2.get_tooltipHeader()).disableIf(get_player().get_gems() < param3,"需要 " + param3 + " 宝石。");
      }
      
      public function addLotion(param1:String, param2:ItemType) : void
      {
         addNamedShopItem(param1,param2,50,"item-lotion");
      }
      
      public function addDye(param1:String, param2:ItemType) : void
      {
         addNamedShopItem(param1,param2,50,"item-dye");
      }
   }
}

