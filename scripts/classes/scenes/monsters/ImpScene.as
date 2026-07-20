package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.useables.SimpleUseable;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.camp.ImpGang;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.pregnancies.PlayerImpPregnancy;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   
   public class ImpScene extends BaseContent
   {
      
      public function ImpScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerImpPregnancy(param1);
      }
      
      public function takeStatue() : void
      {
         var timeUsed:int;
         var _g:Camp;
         var _loc1_:int = 1;
         if(get_player().get_str() < 90)
         {
            _loc1_++;
         }
         if(get_player().get_str() < 70)
         {
            _loc1_++;
         }
         if(get_player().get_str() < 40)
         {
            _loc1_++;
         }
         var _loc2_:String = "";
         _loc2_ = _loc1_ > 1 ? Utils.num2Text(_loc1_) + " 小时" : "小时";
         clearOutput();
         get_images().showImage("event-impStatue");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) <= 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1304,0);
            switch(_loc1_)
            {
               case 1:
                  outputText("你熟练地将雕像扛在肩上，对你来说，它就像一根小木头一样轻。在接下来的一小时里，你把它带回营地，你对这片土地让你的旅程如此漫长感到沮丧。你把雕像放在营地墙边，想知道它在阻止这些害虫方面会有多有效。");
                  break;
               case 2:
                  outputText("你熟练地将雕像扛在背上，尽管搬运这个笨重的东西比你想象的要困难。对于这么小的东西来说，它确实很重。在接下来的几个小时里，你把它带回营地，你对这片土地让你的旅程如此漫长感到沮丧。你把雕像放在营地墙边，伸展身体，揉着背部和肩膀上酸痛的地方，想知道它在阻止这些害虫方面会有多有效。");
                  break;
               case 3:
               case 4:
                  outputText("你试图举起雕像，但根本无法做到。你愤怒地喘着粗气，在它周围踱步，试图弄清楚如何把它带回营地。你在你的物品和周围区域寻找可以帮助你移动这个该死的东西的东西。经过20分钟的寻找，你设法找到了足够的资源来制作一个小雪橇，你可以用绳子拉着它。你把它放在雕像后面，把雕像踢倒，稍微笑了笑，发泄了一些愤怒。随着雕像很快固定到位，你开始了漫长的回家之旅，把雕像拖在身后。当你到达营地时，你已经筋疲力尽，你的手臂和[legs]都在抗议运输这东西所花费的过度劳动。你喘着粗气，解开雕像，把它拖起来靠在营地墙上，希望这个该死的东西值得拖到这里。");
            }
         }
         else
         {
            outputText("在[if (strength >= 70) {搬运|拖拽}]雕像回营地所需的" + _loc2_ + "里，你没有遇到任何进一步的麻烦，尽管你确信你现在放在墙周围的雕像的景象对此有所帮助。也许它在这里也会有所帮助。");
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,1304,FlagDict_Impl_.arrayReadInt(_loc3_,1304) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) == 1)
         {
            get_output().text("\n\n<b>你现在在营地里有一个大理石小恶魔雕像了！</b>");
         }
         else
         {
            get_output().text("\n\n<b>你现在在营地里有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304)) + "个大理石小恶魔雕像了！</b>");
         }
         if(_loc1_ >= 3)
         {
            get_player().changeFatigue(10);
         }
         if(_loc1_ >= 4)
         {
            get_player().changeFatigue(10);
         }
         _g = get_camp();
         timeUsed = _loc1_;
         doNext(function():void
         {
            _g.returnToCamp(timeUsed);
         });
      }
      
      public function takeSkull() : void
      {
         var _g:Combat;
         clearOutput();
         var _loc1_:Inventory = get_inventory();
         var _loc2_:SimpleUseable = get_useables().IMPSKLL;
         _g = get_combat();
         _loc1_.takeItem(_loc2_,function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function sprocketImp() : void
      {
         get_player().slimeFeed();
         clearOutput();
         get_images().showImage("monster-imp");
         outputText("你跪倒在地，脑海中满是想要小恶魔对你做些什么的念头。你的身体因欲望而燃烧，准备好迎接即将到来的后庭侵犯。至少你是这么想的。你向小恶魔伸出一只手，想把他拉向你，让他以你需要的方式占有你。但他没有，这次没有。[pg]");
         outputText("令你惊讶的是，小恶魔拍打着他那小巧的皮质翅膀向上飞起，向你冲来。");
         if(get_player().hair.length > 0)
         {
            outputText("他的爪子抓住了你的头发");
         }
         else
         {
            outputText("他的爪子抓住了你的手腕");
         }
         outputText("你发现自己被他拽着向上飞去，翱翔在树冠之上。冷风的吹拂丝毫没有减退你的欲火。相反，寒冷的刺激只会让你的身体更加意识到自己的需求。仅仅过了几秒钟，对你充满欲望的身体来说却仿佛过了一个世纪，小恶魔将你扔进了一棵树里。你坠落时胡乱挥舞着四肢，勉强在上面的树枝上稳住身形。你的手和[legs]被缠在下方光滑的木质蛛网中，你的大脑在对上方小恶魔的渴望和对坠落的恐惧之间挣扎。从那长角生物红色眼睛里的光芒中，你可以看出他已经把你逼到了他想要的地步。[pg]");
         outputText("小恶魔扯下腰间的遮羞布，露出他那根红彤彤、跳动着的肉棒。它确实很大，尽管比你自己的勃起要小一些。他把布扔到一边，就在那粗糙的布料落在你脸上之前，你看到他向你飞扑下来。他长着爪子的手指抓住了");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON || get_player().cocks[0].get_cockType().get_Index() > 4)
         {
            outputText("你的[cock]，将他肉棒的顶端在你的肉棒上摩擦，");
         }
         else if(get_player().hasKnot(0))
         {
            outputText("你的[cock]，将他肉棒的顶端在你尖锐的龟头上摩擦，");
         }
         else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("你的[cock]，将他肉棒的顶端在你伞状的龟头上摩擦，");
         }
         else if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("你巨大的绿色肉棒，将他肉棒的顶端在你紫色的龟头上摩擦，");
         }
         outputText("把你们的先列腺液抹在一起。当你把脸上的布摇掉时，你想知道他是不是打算就这样给你们俩打飞机。他向你露出了一个邪恶的微笑，当你意识到他打算做什么时，你惊恐地睁大了眼睛。在你甚至还没来得及想出阻止他的动作之前，小恶魔就");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON || get_player().cocks[0].get_cockType().get_Index() > 4)
         {
            outputText("将他的肉棒深深地插进了你肉棒顶端的尿道口里。");
         }
         else if(get_player().hasKnot(0))
         {
            outputText("找到了你尖锐龟头上的洞，并将他的肉棒深深地插了进去，字面意义上地操着你的尿道。");
         }
         else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("将他的肉棒抵在你伞状的龟头上，然后进一步推进。他的肉棒插进了你的肉棒里，比任何一次内射都更能填满你的肉棒。");
         }
         else if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("将他的肉棒深深插入你藤蔓状阴茎顶端的缝隙中。");
         }
         outputText("[pg]");
         outputText("他紧紧握住你的阴茎，一边操你，一边把你当作一个");
         if(get_player().skin.desc == "fur")
         {
            outputText("毛茸茸的飞机杯");
         }
         else if(get_player().skin.tone == "purple" || get_player().skin.tone == "blue" || get_player().skin.tone == "shiny black")
         {
            outputText("恶魔飞机杯");
         }
         else
         {
            outputText("人类飞机杯");
         }
         if(int(get_player().breastRows.length) > 0 && get_player().biggestTitSize() > 2)
         {
            outputText("，操得你那么用力，以至于你的" + get_player().allBreastsDescript() + "随着每一次抽插而弹跳。");
         }
         else
         {
            outputText("。");
         }
         outputText("你脑海中短暂地闪过这应该很痛的念头，但他或你的润滑液让这一切变得足够舒适，让你在快感中扭动。");
         outputText("他粗暴地在你体内抽插了几分钟，你的臀部向上挺起迎合他，");
         if(int(get_player().cocks.length) == 2)
         {
            outputText("你的另一根阴茎在与他的身体摩擦中找到了快感");
         }
         if(int(get_player().cocks.length) > 2)
         {
            outputText("你的其他阴茎在与他的身体摩擦中找到了快感");
         }
         outputText("大量的汗水从你们暴露的身体上流下，然后他颤抖着深深地陷入你体内。他猛烈地射精，他恶魔种子的热量燃烧着你的下体。他的高潮持续的时间比你想象的要长，迫使你也达到了高潮。你的精液在你的体内混合，变得超出你的承受能力，从你的尿道溢出，流到他侵入的阴茎周围。");
         if(int(get_player().cocks.length) == 2)
         {
            outputText("你的另一根阴茎同时射精，将你的精液大量溅到他的背上。");
         }
         if(int(get_player().cocks.length) > 2)
         {
            outputText("你其余的[cocks]同时抽搐并释放出它们的精液，形成了一场精液雨，落在你和小恶魔身上，覆盖了你们俩的身体。");
         }
         if(get_player().biggestLactation() >= 1)
         {
            outputText("同时，乳汁从你的[nipples]喷涌而出，溅了他一脸。当你报复他射在你体内时，你感到一种病态的胜利感。");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("你的小穴颤抖着，随着高潮的到来疯狂地收缩——就像它试图榨干一根幽灵般的阴茎一样。");
         }
         outputText("满足后，他的阴茎从你体内滑出，他飞走了，混合的精液继续从你被虐待的身体中溢出。你的四肢变得无力，你重重地从树上摔下来，然后失去了知觉。");
         get_mainView().statsView.showStatDown("hp");
         var _loc1_:Player = get_player();
         _loc1_.set_HP(_loc1_.get_HP() - 10);
         if(get_player().get_HP() < 1)
         {
            get_player().set_HP(1);
         }
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeImpWithPussy() : void
      {
         clearOutput();
         get_images().showImage("imp-win-female-fuck");
         get_player().slimeFeed();
         if(get_player().vaginalCapacity() < get_monster().cockArea(0) && get_player().isLoli())
         {
            outputText("你不假思索地脱下你的[armor]，走向正在手淫的小恶魔，打量着他那不成比例的器官。当你大步走向他时，你的[vagina]闪烁着汁液的光芒。作为少数几个体型与你相近的怪物之一，你感到一种舒适和安全感。[pg]");
            outputText("你跨坐在他身上，站在他那根凸起的恶魔肉棒上方，你的腿并不比这个恶魔矮子的阴茎粗多少，也不比它长多少。你把骨盆压向他，你的阴唇张开，覆盖在他的龟头上，却只能叹息，因为他太大了，根本塞不进你的小洞里。此时的激情让你无法就此离开，你将那根跳动的红色肉棒向前推向它主人的躯干。");
            outputText("[pg]当你跪下来，将你的[vagina]在身下那根跳动的肥大肉棒上摩擦时，你松了一口气。你的[hips]不断地前后抽插，享受着刺激的温暖。");
            outputText("[pg]当你慵懒地在小恶魔巨大的恶魔肉棒上抽插时，你忘记了时间。终于，你感觉到你的[vagina]在泛起涟漪，在颤抖。当你失去肌肉控制，瘫倒在小恶魔身上时，你的双腿发软。当他那根变态的肉棒在你身上爆发，将滚烫的恶魔精液溅在你的[chest]上，并迅速渗入你的皮肤时，你喘息着。当你从筋疲力尽的小恶魔身上站起来时，你咯咯地笑着，感到完全满足。");
         }
         else
         {
            outputText("你不假思索地脱下你的[armor]，走向正在手淫的小恶魔，充满威胁地俯视着他。当你低头看着他那根华丽的肉棒时，你的" + get_player().vaginaDescript(0) + "因期待而湿润。你毫不犹豫地降低身体，直到你的阴唇被他的恶魔龟头撑开，滚烫的先列腺液带来美妙的刺痛感。");
            if(get_player().vaginalCapacity() < get_monster().cockArea(0))
            {
               outputText("你皱着眉头推拒着他，但他那恶魔般的巨物对你的" + get_player().vaginaDescript(0) + "来说实在太大了。你叹了口气，改变姿势，开始用你的" + get_player().vaginaDescript(0) + "在他的" + get_monster().cockDescriptShort(0) + "上摩擦，用你的爱液涂抹它。当你的阴蒂蹭过他粗大肉棒上的每一根青筋时，传来一阵美妙的酥麻感。");
               if(int(get_player().breastRows.length) > 0 && get_player().breastRows[0].breastRating > 1)
               {
                  outputText("你愉快地拉扯、揉捏着自己挺立的乳头，这增加了你的快感，几乎让你直接高潮。");
               }
               outputText("[pg]当你慵懒地在小恶魔的" + get_monster().cockDescriptShort(0) + "上套弄时，你忘记了时间的流逝。终于，你感觉到你的" + get_player().vaginaDescript(0) + "泛起涟漪并开始颤抖。你的[legs]发软，失去了肌肉控制，瘫倒在小恶魔身上。当他的" + get_monster().cockDescriptShort(0) + "在你身上爆发时，你喘息着，滚烫的恶魔精液溅在你的胸膛上，并迅速渗入你的皮肤。当你从筋疲力尽的小恶魔身上站起来时，你咯咯地笑着，感到完全满足。");
            }
            else
            {
               outputText("你缓缓坐下，吞没他的" + get_monster().cockDescriptShort(0) + "，享受着逐渐深入的过程，以及他滴落的滚烫先列腺液带来的酥麻感。终于，你一坐到底，碰到了他的囊袋。");
               get_player().cuntChange(get_monster().cockArea(0),true);
               outputText("你的情欲和渴望驱使你动了起来，让你在他的" + get_monster().cockDescriptShort(0) + "上不断起伏。他那极品的肉棒将你推向了快感的顶峰，每次你坐到底时，你的" + get_player().vaginaDescript(0) + "都会不由自主地紧紧收缩。小恶魔臀部的紧绷是你得到的唯一警告，随后他便射在了你体内，滚烫的恶魔精液涌入你的子宫。你的[legs]一软，在他射满你的时候，将他推得更深。");
               outputText("[pg]你们俩躺了一会儿恢复体力，最后当你从他的" + get_monster().cockDescriptShort(0) + "上站起来时才分开。精液顺着你的腿流下，迅速渗入你的皮肤并消失不见。");
               dynStats(DynStat.Cor(1));
               get_player().knockUp(1,432);
            }
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeImpWithDick(param1:Boolean = false) : void
      {
         var _loc2_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(param1)
         {
            get_player().destroyItems(get_useables().CONDOM,1);
            outputText("你首先撕开避孕套的包装，将乳胶均匀地套在你的" + get_player().cockDescript(_loc2_) + "上，直到它被完全覆盖。");
         }
         clearOutput();
         get_images().showImage("monster-imp");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("你带着恶魔般的微笑，抓住那只失去理智的小恶魔，掐着他的脖子把他从地上提了起来。呼吸不畅似乎一点也没有减缓他狂热的手淫，反而让他变得更硬了。");
            if(!get_player().isTaur())
            {
               outputText("你随意地解开你的[armor]，露出你的" + get_player().cockDescript(_loc2_) + "，");
               if(int(get_player().breastRows.length) > 0 && get_player().breastRows[0].breastRating > 2)
               {
                  outputText("把他按在你的[breasts]上，同时用力撸动你的" + get_player().cockDescript(_loc2_) + "，让它完全勃起，青筋暴起。");
               }
               else
               {
                  outputText("慵懒地抚摸着它，直到它完全硬挺。");
               }
            }
            outputText("[pg]没有任何前戏，你将你的" + get_player().cockDescript(_loc2_) + "抵住他紧致的小穴，然后一插到底。小恶魔的眼睛惊讶地凸了出来，同时一股浓稠的先列腺液从他的" + get_monster().cockDescriptShort(0) + "中漏出。你抓住他肿胀的腰部，粗暴地强暴了这个小恶魔，而他的爪子还在忙着增加自己的快感。");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("感觉到柔软的倒刺抚摸着他敏感的内壁，这只小生物的爪子深深地陷入了你的身体两侧。");
            }
            if(get_player().cocks[0].cockLength >= 7 && get_player().cocks[0].cockLength <= 12)
            {
               outputText("你的每一次抽插都明显扭曲了小恶魔的腹部。让你惊讶的是，这似乎并没有让他感到疼痛。");
            }
            if(get_player().cocks[0].cockLength > 12)
            {
               outputText("每一次插入小恶魔紧致的屁眼，似乎都会扭曲它的整个身体，从它的肚子和胸部淫秽地凸起。令人惊讶的是，他似乎并不介意，他的努力完全集中在他那根剧烈跳动的恶魔肉棒上。");
            }
            outputText("[pg]小恶魔紧致的屁眼对你来说太刺激了，你感觉到高潮正在酝酿。");
            if(get_player().balls == 0 && int(get_player().vaginas.length) > 0)
            {
               outputText("当你的" + get_player().vaginaDescript(0) + "湿透时，精液似乎从你体内沸腾而出。伴随着美妙的缓慢感，你将一股又一股的精液射入" + (param1 ? "你的避孕套里。" : "小恶魔的直肠深处。") + "");
            }
            if(get_player().balls == 0 && int(get_player().vaginas.length) == 0)
            {
               outputText("精液似乎从你体内沸腾而出，顺着你的" + get_player().cockDescript(_loc2_) + "流淌。伴随着美妙的缓慢感，你将一股又一股的精液射入" + (param1 ? "你的避孕套里。" : "小恶魔的直肠深处。") + "");
            }
            if(get_player().cumQ() >= 14 && get_player().cumQ() <= 30)
            {
               outputText("你的高潮持续了很久，直到你滑腻的精液顺着你的" + get_player().cockDescript(_loc2_) + "滴落下来。");
            }
            if(get_player().cumQ() > 30 && get_player().cumQ() <= 100)
            {
               outputText("你的高潮似乎永远不会结束，当你无情地掠夺他时，精液顺着你的" + get_player().cockDescript(_loc2_) + "从" + (param1 ? "你的避孕套" : "小恶魔的屁眼") + "里滴落下来。");
            }
            if(get_player().cumQ() > 100)
            {
               outputText("你的高潮似乎随着时间的推移变得越来越强烈，每一次喷射都比上一次更强大、更丰富。" + (param1 ? "你的避孕套膨胀得几乎要爆裂，每一次抽插都有微小的精液流顺着你的" + get_player().cockDescript(_loc2_) + "喷射而出。" : "当你填满他时，小恶魔开始看起来有点怀孕了，每一次抽插都有微小的精液流顺着你的" + get_player().cockDescript(_loc2_) + "喷射而出。") + "");
            }
            outputText("[pg]终于满足了，你就在他达到自己的高潮时把他拉开，把他滚烫的恶魔精液溅得满地都是。你重重地扔下小恶魔，他晕了过去，滴落的" + (param1 ? "精液" : "混合液体") + "似乎一漏出来就被干燥的泥土吸收了。");
         }
         if(int(get_player().cocks.length) >= 2)
         {
            outputText("你带着恶魔般的微笑，抓住那只失去理智的小恶魔，掐着他的脖子把他从地上提了起来。呼吸不畅似乎一点也没有减缓他狂热的手淫，反而让他变得更硬了。");
            if(!get_player().isTaur())
            {
               outputText("你漫不经心地解开你的[armor]，露出你的[cocks]，");
               if(int(get_player().breastRows.length) > 0 && get_player().breastRows[0].breastRating > 2)
               {
                  outputText("把他按在你的[breasts]上，同时你用力撸动你的一根" + get_player().cockDescript(_loc2_) + "，让它完全勃起，跳动着。");
               }
               else
               {
                  outputText("慵懒地抚摸着你的一根阴茎，直到它完全勃起。");
               }
            }
            outputText("[pg]没有任何前戏，你将一根" + get_player().cockDescript(_loc2_) + "抵在他紧致的小穴上，直没至柄。小恶魔惊讶地瞪大了眼睛，同时一股浓稠的先列腺液从他的" + get_monster().cockDescriptShort(0) + "中漏出。你抓住他膨胀的腰部，粗暴地强暴了这个小恶魔，而他的爪子还在忙着增加自己的快感。");
            if(get_player().cocks[0].cockLength >= 7 && get_player().cocks[0].cockLength <= 12)
            {
               outputText("你的每一次抽插都明显扭曲了小恶魔的腹部。让你惊讶的是，这似乎并没有让他感到疼痛。");
            }
            if(get_player().cocks[0].cockLength > 12 && get_player().cocks[0].cockLength <= 18)
            {
               outputText("每一次插入小恶魔紧致的屁眼，似乎都会扭曲它的整个身体，从它的肚子和胸部淫秽地凸起。令人惊讶的是，他似乎并不介意，他的努力完全集中在他那根剧烈跳动的恶魔肉棒上。");
            }
            outputText("[pg]小恶魔紧致的屁眼对你来说太刺激了，你感觉到高潮正在酝酿。");
            if(get_player().balls > 0)
            {
               outputText("精液似乎在你的睾丸里沸腾，热量蔓延到你的" + get_player().cockDescript(_loc2_) + "，你的肌肉反射性地收缩，将滚烫的精液深深地射入小恶魔的直肠。你的其他器官也跳动着，源源不断地滴下精液。");
            }
            if(get_player().balls == 0 && int(get_player().vaginas.length) > 0)
            {
               outputText("精液似乎从你体内沸腾而出，浸湿了你的" + get_player().vaginaDescript(0) + "。你以一种美妙的缓慢节奏，将一波又一波的精液" + (param1 ? "射进你的避孕套里。" : "深深地射入小恶魔的直肠。") + " 你的其他器官也同情地滴下细小的精液流。");
            }
            if(get_player().balls == 0 && int(get_player().vaginas.length) == 0)
            {
               outputText("精液似乎从你体内沸腾而出，顺着你的" + get_player().cockDescript(_loc2_) + "流淌。你以一种美妙的缓慢节奏，将一波又一波的精液" + (param1 ? "射进你的避孕套里。" : "深深地射入小恶魔的直肠。") + " 你的其他器官也同情地滴下细小的精液流。");
            }
            if(get_player().cumQ() >= 14 && get_player().cumQ() <= 30)
            {
               outputText("你的高潮持续了很久，直到你滑腻的精液顺着你的" + get_player().cockDescript(_loc2_) + "滴落下来。");
            }
            if(get_player().cumQ() > 30 && get_player().cumQ() <= 100)
            {
               outputText("你的高潮似乎永远不会结束，当你无情地掠夺他时，精液顺着你的" + get_player().cockDescript(_loc2_) + "从" + (param1 ? "你的避孕套" : "小恶魔的屁眼") + "里滴落下来。");
            }
            if(get_player().cumQ() > 100)
            {
               outputText("你的高潮似乎随着时间的推移变得越来越强烈，每一次喷射都比上一次更强大、更丰富。" + (param1 ? "你的避孕套膨胀得几乎要爆裂，每一次抽插都有微小的精液流顺着你的" + get_player().cockDescript(_loc2_) + "喷射而出。" : "当你填满他时，小恶魔开始看起来有点怀孕了，每一次抽插都有微小的精液流顺着你的" + get_player().cockDescript(_loc2_) + "喷射而出。") + "");
            }
            outputText("[pg]终于满足了，你就在他达到高潮的时候把他拉开，把他滚烫的恶魔精液溅得满地都是。你重重地扔下小恶魔，他晕了过去，滴落的混合液体似乎刚一漏出就被干燥的土地吸收了。");
         }
         get_player().orgasm("Dick");
         if(!param1)
         {
            dynStats(DynStat.Cor(1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function putBeeEggsInAnImpYouMonster() : void
      {
         clearOutput();
         get_images().showImage("monster-imp");
         outputText("你低头看着正在自慰的小恶魔，感觉到你肿胀的昆虫腹部抽动了一下。当这个红皮肤的小矮人在地上扭动着打飞机时，你笑了，感觉到一滴甜美的花蜜从你的产卵管里渗了出来。");
         outputText("[pg]他正忙着操空气和抚弄自己，根本没注意到你用一只[feet]的脚尖勾住了他的身下。你抬起一条[legs]一踢，把这个正在打飞机的小恶魔翻了个面。他脸朝下摔在地上，倒吸了一口凉气，吓得停止了套弄他的家伙。");
         outputText("[pg]你咧嘴一笑，跨坐在他那出人意料翘挺的屁股上，将你的[hips]压在他那小巧圆润的臀瓣上。你的双臂按住他的肩膀，让他无法抚弄自己，他因为被束缚而呜咽起来。");
         outputText("[pg][say: 等等——怎么回事？]他喘息着说。");
         outputText("[pg]你不屑于回答他，沉浸在腹部在身后卷曲的独特感觉中。你向后仰起头，享受着你黑色的产卵管抵在小恶魔光滑发亮的屁股皮肤上冒出来的快感。");
         outputText("[pg][say: 不，不要啊……]小恶魔呜咽着，而你咬着嘴唇，将你器官的尖端推入他那出人意料柔软的后穴中。");
         outputText("[pg]你和小恶魔同时颤抖起来，你甜美的花蜜涂抹在他的臀瓣之间，顺着他的股沟流下，同时你将跳动的产卵管越挤越深。深深埋入他的肠道中，你感觉到你的第一枚卵穿过你橡胶般的器官，撑开了你的管子和他的屁眼。");
         outputText("[pg]当你在小恶魔体内产下第一枚卵时，他脸朝下趴在地上发出咯咯的声音，你感觉到他紧紧绞住了你的产卵管。小恶魔在你的身下扭动着，旁边是一滩慢慢扩散、冒着热气的精液；你猜他刚刚高潮了。");
         outputText("[pg]小恶魔喘着粗气，试图平复呼吸，而你抽动着腹部，调整着在他体内的产卵管。没等他缓过神来，你又把另一枚卵推下管子，将它深深地植入小恶魔体内，与第一枚卵并排。");
         outputText("[pg][say: 停、停下……]小恶魔呻吟着，即使你正将第三枚卵推入他小小的身体。但你已经停不下来了。一枚接一枚的卵，你填满了他在抽搐的身体。精液滩越来越大，渗到了你的");
         if(get_player().isGoo())
         {
            outputText("泛起涟漪的粘液边缘");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("颤抖的盘绕身体");
         }
         else
         {
            outputText("跨坐的膝盖");
         }
         outputText("因为你把这个小恶魔变成了你私人的孵化器。");
         outputText("[pg]产下几枚卵后，你闷哼了一声，意识到小恶魔体内已经没有空间了。你歪着头，考虑到小恶魔是面朝下的，他的肚子可能需要更多的空间来伸展。你半站起身，将他翻转过来，小心翼翼地让你的产卵管仍然埋在他的体内。");
         outputText("[pg]小恶魔的眼睛几乎完全翻白，他平坦的胸膛上沾满了他自己的精液。他的呼吸急促，坚硬巨大的阴茎上涂满了浓稠的白色精液。他的肚子已经因为你的卵而微微隆起，他那双小手捂着肚子，看起来就像一个堕落的孕母。");
         outputText("[pg]这个认知足以再次刺激你的产卵管。伴随着一声呻吟，你跪在地上，双手撑在他头部两侧，你的产卵管将另一枚卵泵入小恶魔的肠道。小恶魔颤抖着，他的肚子膨胀起来，装满了你的子嗣。");
         outputText("[pg][say:还要……还要！]身下的小恶魔呻吟着。你满足了他，并且");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("他那细小的爪子抓住了你的");
            if(get_player().bRows() > 1)
            {
               outputText("第一排");
            }
            outputText("[breasts]，在你把他操满的时候挤压着你的奶子。");
            if(get_player().lactationQ() >= 500)
            {
               outputText("当他笨拙地挤奶时，你的乳汁顺着他的前臂流下。");
            }
         }
         else if(get_player().hasCock())
         {
            outputText("他那肿胀的肚子很快就压在了[oneCock]上，你抽插的节奏让他那闪亮的红色肚子摩擦着你敏感的器官。");
         }
         else if(get_player().hasVagina())
         {
            outputText("小恶魔那长着爪子的小脚在你身上乱抓，他在快感中挣扎。一不小心，一只脚滑进了你小穴的唇间，小脚趾在你内壁上蠕动，你本能地向下压着那小小的肢体，用他的脚操着自己。");
         }
         else
         {
            outputText("你感觉到[asshole]处有一股坚实的压力，小恶魔那抽打着的尾巴尖疯狂地戳着你，狂躁地在你的[asshole]里进进出出。");
         }
         outputText("[pg]你呻吟着，紧贴着小恶魔达到了高潮，与此同时，他也从沾满精液的肉棒中射出又一股滚烫的精液。他把精液溅在你的身前，与你的体液交融在一起。他浑身颤抖着，将你最后的几枚卵收入体内，肚子已经胀得像个沙滩排球一样大。");
         outputText("[pg]你大口喘着粗气，伴随着一阵泥泞的吧唧声，你从小恶魔体内拔了出来，从蹲着的姿势站起身来。一股花蜜从小恶魔的屁股里涌出，但很快就被从里面滚落到位的一枚卵给堵住了，塞住了你的小恶魔孵化器。");
         outputText("[pg]你听到小恶魔发出一种奇怪的声音，听起来竟然像是在咯咯笑。你低头看了看他，本能地评估着他作为你卵子载体的价值。小恶魔还在喘着气，从他凌乱的黑发下抬头看着你。带着涨红的顺从表情和高高隆起的孕肚，这个小恶魔看起来竟然有点……可爱？他抱着自己塞满卵的巨大肚子，抚摸着它，然后红着脸回头看着你。");
         outputText("[pg]你眨了眨眼，然后站了起来。你摇着头走开，将这些奇怪的想法归结于你产卵的本能。毕竟，其中一些突变确实会产生一些奇怪的影响……");
         get_player().orgasm("Ovi");
         dynStats(DynStat.Sens(-1));
         get_player().dumpEggs();
         get_combat().cleanupAfterCombat();
      }
      
      public function pissDom() : void
      {
         clearOutput();
         outputText("战败的小恶魔四仰八叉地躺着，小手紧紧握着自己的肉棒。这个小个子恶魔上下撸动着他那恶魔般的肉棒，脑子里充满了欲望，已经完全忘记了你的存在。感觉到你内心的冲动在积聚，当你靠近这个小生物时，血液涌向了你的[cock]。他的眼睛翻白，撸动的速度开始加快，仍然完全没有意识到你的存在。");
         outputText("[pg]<i>*砰！*</i> 你飞起一脚踢在他的脸上，把小恶魔踢得翻滚到另一边。猝不及防之下，小恶魔结结巴巴地呻吟着，把手从他那跳动、抽搐的恶魔肉棒上移开，去捂住他新添的伤口。你用手握住你现在半勃起的肉棒，把它对准他的脸。感觉到你的靠近，他抬起头，你放松膀胱，尿在他的脸上。当你的热尿覆盖他的脸时，小恶魔退缩了，尿液顺着他的下巴流下，流遍他的全身。");
         outputText("[pg]你甩动你的[cock]的头部，浸湿了他的背。尿液顺着他的背流下，流进他紧绷的屁股沟里，开始在他周围汇聚成一个水坑。你用空闲的手抓住这个小生物的一只角，把他固定在原地，同时用你最后的一股尿液喷洒他的脸。小恶魔尖叫着抗议；你松开你的肉棒，反手给了他一巴掌，然后把他脸朝下扔进你脚间温暖的尿坑里。");
         outputText("[pg]恶魔的肉棒仍然在他身下抽搐，因为之前的自慰而没有得到满足。这一幕让你的肉棒完全勃起。你看到你的受害者背对着你，开始站稳脚跟；你盯着他屁股沟里那皱巴巴的红色屁眼，在黄金雨的洗礼下仍然闪闪发光。你抓住这个生物的脚踝，把你的肉棒头部对准他的后门。这种压力让他的肉棒再次抽搐，他稍微安静了一些。你再次把小恶魔按倒，脸朝下埋进满是尿液的泥坑里，同时把你的肉棒深深地埋进他的屁股里。");
         outputText("[pg]你以慵懒的节奏继续操着他的屁眼，感受着小恶魔的后穴在每一次抽插中紧紧夹住你的肉棒。你尿液的气味在空气中萦绕，与汗水和性爱的气味混合在一起。几分钟后，小恶魔的体内一阵痉挛，他高潮了，几股恶魔的精液喷洒在泥泞中。你操弄他屁眼的节奏加快了，小恶魔抗议的呻吟声与泥水被搅动的吧唧声交织在一起。");
         outputText("[pg]当你的高潮随之而来时，强烈的快感淹没了你的感官。你的" + (get_player().balls > 0 ? "阴囊" : "前列腺") + "紧缩着，将精液尽数射入恶魔被彻底肏开的屁眼。你因这快感而颤抖，拔出肉棒，最后几滴精液淫靡地顺着小恶魔的大腿滴落。");
         outputText("[pg]你穿好衣服，离开了这个因被凌辱而几乎失去意识的生物。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function petrifyImp() : void
      {
         var _g2:Combat;
         var nextFunc:Object;
         var _g1:Combat;
         var _g:Combat;
         var _loc1_:String = "";
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:String = get_game().bazaar.benoit.benoitMF("本诺瓦","本诺瓦特");
         get_output().clear();
         get_images().showImage("monster-imp");
         if(get_monster().get_HP() >= 1 && 50 + 50 * (1 - get_monster().HPRatio()) < Utils.rand(100))
         {
            outputText("你决定给这个小恶魔和他的同伙们一个终生难忘的教训。你粗暴地抓住小恶魔，在与他进行眼神交流时确保他注意到你。小恶魔在你的抓握中挣扎，并设法挣脱了。");
            outputText("[pg]也许在你试图把他变成雕像之前，你应该" + (get_monster().HPRatio() < 1 ? "再" : "") + "多揍他一顿？");
            _g = get_combat();
            doNext(function():void
            {
               _g.cleanupAfterCombatNewPage();
            });
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1303) <= 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1303,0);
            if(get_monster().get_HP() < 1)
            {
               _loc1_ = "那个被打得遍体鳞伤的生物正泪眼汪汪地蜷缩着，";
               _loc2_ = "";
            }
            else
            {
               _loc1_ = "这个可悲地自慰着的生物，注意力全集中在他那根污秽的鸡巴上，";
               _loc2_ = "尽管他的手还握着他的肉棒，";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) > 0)
            {
               _loc3_ = "完全无视了你那堵墙所给出的明确警告。";
            }
            else
            {
               _loc3_ = "无论你打倒了多少只。";
            }
            outputText("看着眼前的小恶魔，" + _loc1_ + "你感到一阵恶心。这些害虫不断试图入侵你的营地，想把你肏晕过去，" + _loc3_);
            outputText("[pg]你回想起在高山上的探索，山峰的危险让这些生物敬而远之。即便是你，也曾被那些长着利爪、叫声刺耳的鹰身女妖，以及危险的蛇怪石化能力所震慑。你随后得意地笑了，一个绝妙[if (corruption >= 30) {且恶毒}]的主意涌上心头。多亏了" + _loc4_ + "，你拥有了蛇怪的眼睛，想必你之前在它们手下遭受的石化，也能像震慑你一样震慑这些腐化的孽种。");
            outputText("[pg]你缓慢地眨了眨眼，做好准备，一把抓住小恶魔的后颈。当你将他的视线与你的目光对齐时，他似乎有些困惑" + _loc2_ + "。当你与他直接进行眼神交流时，他退缩并僵住了，被你的目光迷住了。你感觉到一种联系从你的脑海边缘形成，连接到小恶魔的脑海中，就像缓慢流动的瀑布，全力冲击着他。");
            outputText("[pg]你还记得蛇怪是如何利用这种强迫感来吸引你的目光，同时你的身体慢慢变成石头，那种舒缓的感觉，以及随着石头包裹你而传来的低沉沙哑的耳语。你开始把你的想法传递给小恶魔，用你的话语安抚他，告诉他继续看着你的眼睛，让他所有的烦恼都烟消云散。去拥抱那种被包裹的感觉，以及你的目光给他带来的温暖，驱散他感到的寒冷。你有些惊讶地看着他，当他试图移开视线时，他浑身发抖，仿佛一阵刺骨的寒风向他袭来。");
            outputText("[pg]你看到他的眼睛开始变得呆滞，知道是时候了。你眨了一下眼睛，短暂的视线接触中断让他发出可怜的呜咽声。当你再次与他目光相遇时，一层大理石开始在他的脚下形成。你放开他，他依然站在你面前，仿佛被木偶线支撑着，而你就是舞台监督。石头继续向上蔓延，他的四肢随之硬化。很快，他的腿被覆盖，中段也迅速跟上。");
            outputText("[pg]你得意地切断了你们之间的联系，看着他茫然的表情逐渐消失。当他迷迷糊糊地往下看时，他开始大喊大叫，试图用尽全力挣脱，但由于他的腿已经完全石化，而且石头还在迅速上升，你知道他没有机会了。石头现在几乎已经蔓延到了他的肩膀，他徒劳地挣扎着，手臂感觉像铅一样沉重。你着迷地看着小恶魔被石头吞噬，他的咒骂声逐渐消失在虚无中，而他愤怒和恐惧的表情则永远定格在了他的脸上。");
            outputText("[pg]一旦你确定小恶魔已经完全变形，你便伸出手去触摸雕像。你的手指触碰到光滑冰冷的石头，当你轻轻推它时，你意识到雕像非常坚固。");
         }
         else
         {
            outputText("你决定给这个小恶魔和他的同伙一个终生难忘的教训。你粗暴地抓住小恶魔，确保在进行眼神交流时引起他的注意。小恶魔在你的抓握中挣扎，但当你慢慢眨眼，目光完全集中在他身上时，你感觉到他僵住了。他变得迟钝，发现很难抵抗你的思想侵入他的脑海。当你用胡言乱语安抚小恶魔时，你看到他的战斗意志开始消退。你平静的话语席卷了他，他的目光变得涣散，由于想象中的后果，他的眼睛没有离开你的眼睛。");
            outputText("[pg]你眨了眨眼，让你的目光发挥出全部力量，当你在那短暂的一瞬间让它的思想陷入沉寂时，小恶魔发出了可怜的呜咽声。一层大理石开始吞没他的脚，他看着你那双闪亮的眼睛的时间越长，大理石就越往上爬。你看到石头在爬过他的腿时开始变硬，并突然切断了与他思想的联系。当石头开始覆盖他的中段时，他回过神来，被他现在已经石化的下半身吓得惊慌失措。");
            outputText("[pg]无论他如何挣扎，石头都纹丝不动，他睁大眼睛看着你。他咒骂你，对你大吼大叫，然后开始乞求，恳求你放他走。当然，他的恳求被当成了耳旁风，勇者绝不会对这些变态的害虫手下留情，因为它们也绝不会手软。当石头到达他的脖子时，你只是看着，好奇当一切结束时，雕像会是什么表情。当你的目光完成对小恶魔的石化后，你为[if (strength < 90) {漫长的}]返程做好了准备。");
         }
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,1303,FlagDict_Impl_.arrayReadInt(_loc5_,1303) + 1);
         _loc5_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,2208,FlagDict_Impl_.arrayReadInt(_loc5_,2208) + 10);
         menu();
         _g1 = get_combat();
         nextFunc = takeStatue;
         addButton(0,"带走雕像",function():void
         {
            _g1.cleanupAfterCombat(nextFunc);
         }).hint("把雕像带回营地，放在墙上或墙前");
         _g2 = get_combat();
         addButton(1,"离开",function():void
         {
            _g2.cleanupAfterCombat();
         });
      }
      
      public function noogaisNippleRape() : void
      {
         clearOutput();
         get_images().showImage("monster-imp");
         outputText("你慢慢走向正在自慰的小恶魔，每走一步，你的[hips]和[ass]都充满诱惑地摇曳着。[pg]");
         outputText("你脱下衣服，把小恶魔推倒在地，跨坐在他身上，不让他的手碰到他那抽搐的肉棒，同时迅速用他自己的缠腰布把他绑起来。这个被欲望冲昏头脑的恶魔完全失去了行动能力，你开始用双手自由地把玩你那黏糊糊的乳头洞，以及你的");
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("和");
         }
         if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript(0));
         }
         else if(get_player().get_gender() == 0)
         {
            outputText(get_player().assholeDescript());
         }
         outputText("。[pg]");
         outputText("你轻轻地将一根手指插入你的一个乳头小穴，");
         if(get_player().lactationQ() >= 1000)
         {
            outputText("释放出一股浓稠、奶油般的乳汁和");
         }
         else if(get_player().lactationQ() >= 50 && get_player().biggestLactation() >= 1)
         {
            outputText("释放出一股稳定的温热乳汁，并且");
         }
         outputText("因欲望而产生的淫液滴落在小恶魔的腿上；你的另一只手本能地向下移动，抚摸你的");
         if(get_player().hasCock())
         {
            outputText("坚硬如铁的肉棒");
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("湿漉漉的小穴");
         }
         if(get_player().get_gender() == 0)
         {
            outputText(get_player().assholeDescript());
         }
         outputText("，你发出淫荡的呻吟，头向后仰，沉浸在性爱的狂喜中，以此来挑逗他。");
         if(get_silly())
         {
            outputText("小恶魔感到恶心，但也很好奇。");
         }
         outputText("[pg]");
         outputText("你继续用手指抽插你的乳头，变得越来越兴奋，而小恶魔看着眼前这奇异的景象，也变得越来越硬。你很快就厌倦了看着小恶魔在你身下扭动，渴望得到性释放；你慢慢地把手从你的腹股沟移开，向下伸向他的胯部，开始把玩他苹果大小的睾丸，粗暴地抚摸和挤压它们。你漫不经心地将第二根手指滑入你湿润的乳头洞，挑逗地将它撑开，并将这个张开的孔洞举到小恶魔的面前，让他清楚地看到你那怪异、湿润的乳头小穴的内部。[pg]");
         if(get_player().cor >= 66)
         {
            outputText("[say:嗯，你难道不想把你那粗壮的肉棒插进这个湿透的洞里，然后深深地射在我的[chest]里吗？]你沙哑地在他耳边低语，手指从他的蛋蛋上滑开，沿着他那胀痛的阴茎底部向上滑动，挑逗着它的每一寸，直到你触碰到他肿胀的龟头，并开始用手指在他的龟头周围打着小圈摩擦。小恶魔喘着粗气，眼睛死死地盯着你");
            if(get_player().biggestLactation() < 1)
            {
               outputText("湿润的");
            }
            else
            {
               outputText("乳白色的");
            }
            outputText("，绝望地向上挺动着臀部。[pg]");
         }
         outputText("你觉得这个可怜的家伙已经受够了折磨，于是引导着你被撑开的[nipple]向下靠近他颤抖的阴茎，并在顶端停留了片刻。小恶魔沮丧地呻吟着，感觉到你淫荡的汁液滴落在他胀痛的肉棒和饱满的睾丸上，让他更加渴望深深地插入你等待着的乳房。毫无预兆地，你用力将乳房推向他肿胀的肉棒，");
         if(get_player().biggestTitSize() <= 4)
         {
            outputText("在他巨大的阴茎上插到底。");
         }
         else
         {
            outputText("直到你巨大的乳房碰到他颤抖的阴囊才停下来。");
         }
         outputText("[pg]");
         outputText("当你从他湿透的粗壮肉棒上抬起时，你因狂喜而颤抖；你的乳头孔因兴奋而变得湿滑，让你更容易滑下去，直到");
         if(get_player().biggestTitSize() <= 4)
         {
            outputText("你感觉到他肿胀的阴茎插到底，你娇小的乳房无法吞下更多他跳动的雄性特征");
         }
         else
         {
            outputText("他肿胀的阴茎和绝望地充满的睾丸完全被乳房的肉包裹住");
         }
         outputText("。最终，小恶魔开始配合你的动作调整他抽插的节奏，很快你们俩就以稳定的节奏运动起来——抽插，拔出，抽插，拔出。几分钟过去了，节奏慢慢地走向高潮，唯一的声响就是你的乳房伺候小恶魔肉棒时发出的淫荡的摩擦声，以及偶尔从你唇间溢出的呻吟。当一只手在疯狂地揉捏你空虚的乳头裂缝时，另一只手在疯狂地");
         if(get_player().hasCock())
         {
            outputText("套弄你的[cock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("用手指抠弄你饥渴的产道");
         }
         else
         {
            outputText("用手指抠弄你发麻的肛门");
         }
         outputText("。[pg]");
         outputText("最终，随着你和小恶魔接近高潮，抽插的节奏变得越来越不规律；当你感觉到小恶魔在你体内剧烈痉挛时，你的舌头从张开的嘴里伸了出来，脚趾也蜷缩起来，任由他那滚烫的精液源源不断地直接灌入你的[chest]中。强烈的灼热感将你推向了高潮的边缘，并且");
         if(get_player().hasCock())
         {
            outputText("一股");
            if(get_player().cumQ() < 500)
            {
               outputText("喷射的");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("间歇泉般的");
            }
            else
            {
               outputText("火山般的");
            }
            outputText("的精液从你的[cock]喷射而出，溅得你和那个倒霉的小恶魔满身都是");
            if(get_player().hasVagina())
            {
               outputText("，同时");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("你的淫水喷涌而出，你的" + get_player().vaginaDescript(0) + "在绝顶中抽搐着");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("你的后穴紧紧夹住了你的手指");
         }
         outputText("。[pg]");
         outputText("你重重地倒在小恶魔身上，再次让你的乳房被他仍然坚挺的肉棒贯穿。你这样躺了一会儿，直到你注意到小恶魔已经睡着了，被这番折腾弄得精疲力尽。你晕乎乎地站起来，混合着");
         if(get_player().biggestLactation() >= 1 && get_player().lactationQ() < 40)
         {
            outputText("乳汁，");
         }
         outputText("女性精液和滚烫恶魔精液的混合物从你大张的乳头穴里流了出来。[pg]");
         if(get_player().cor > 60)
         {
            outputText("你再次将手指插入你的[nipple]，尽可能多地挖出小恶魔的精液。你高兴地喝下这浓稠的黏液，品味着那甜腻的味道，然后迅速穿好衣服，留下小恶魔继续沉睡。");
         }
         else
         {
            outputText("你迅速穿好衣服，留下小恶魔继续沉睡，他的双手仍然被他的缠腰布绑在一起。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-3),DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function multiImpSpitroastLoss(param1:Boolean, param2:int) : void
      {
         clearOutput();
         registerTag("impAmount",TagFun_Impl_.fromInt(param2));
         registerTag("lustVictory",TagFun_Impl_.fromBool(param1));
         registerTag("impCock",TagFun_Impl_.fromFloat(get_enemy().cocks[0].cockLength));
         registerTag("stretched",TagFun_Impl_.fromBool(get_player().willCuntBeStretched(get_monster().cockArea(0))));
         registerTag("wasVirgin",get_player().hasVagina() ? TagFun_Impl_.fromBool(get_player().hasVirginVagina()) : TagFun_Impl_.fromBool(get_player().buttVirgin()));
         outputText("这[if (impAmount > 2) {群|对}]小恶魔立刻扑向了你，趁你放弃抵抗时将你推倒在泥地里。它们贪婪地想要得到你的身体[if (!isnaked) {，急切地抓挠并扯掉你的[armor]}]。当你恢复了一些理智时，你感觉到其中一只小恶魔正用它的肉棒拍打你的[vagORass]，结果却被[if (impAmount > 2) {另|}]一只扑倒了。[say:不！这个归我！]它尖叫着。两只小恶魔笨拙地扭打在一起争夺主导权，直到第一只大喊：[say:白痴！有两头呢！]并扇了袭击者一巴掌。受伤的小恶魔揉了揉脸颊，看着你的[face]。");
         outputText("[pg][say: 那[b:你]来搞那头。] [if (!lustVictory) {神志不清的|头晕目眩的}]你趁他们争吵时开始起身，[if (impAmount > 2) {这激起了[if (impAmount > 3) {一个|那个}]第三只小恶魔亲自扑向你|这激怒了那只满腹怨气的小恶魔，让他狠狠地揍了你一顿}]。[say: 我可没那么蠢，不会让到手的猎物跑掉，[b:我]才配得上更好的洞。]");
         outputText("[pg]等级秩序显然已经确立，那只瘦小的恶魔占据了你的[hips]位置，他那尺寸夸张的肉棒“咚”地一声砸在你的私处。 [if (hasCock && impCock > cocklength) {他瞥见自己的家伙远胜于你那[cock smallest]，得意地勾起嘴角，显然自我感觉极其良好。}]第一只恶魔不情不愿地挪到你头边就位，粗暴地将你的头扳到合适的位置[if (hasHorns) {，死死抓住你的[horn]|[if (hasAntennae) {，揪住你的触角}]}]。他那完全不成比例的巨大肉棒粗暴地怼上你的嘴唇，带着腐败虫豸的腥臊味， [if (cor + lib > 60) {然而你那淫荡堕落的本能却让你的嘴不由自主地张开，将这东西迎了进去|可你根本没有拒绝的余地，他焦躁地用双手硬生生掰开了你的嘴}]。它在你口腔里的触感比看上去还要骇人，把你的腮帮子塞得满满当当。你甚至来不及适应这强行的深喉，另一根凶器就已经抵在了你的[vagORass]。[if (stretched) {你的[if (hasslimecore) {核心|心脏}]被那根肥硕肉棒猛然撑开的冲击吓得一颤。|你那早已被操开的肉穴毫无抵抗，任凭你心里再怎么瞧不上那个正趴在你身上气喘吁吁的家伙，你的身体也做不出半分拒绝。}]");
         get_player().cuntChange(get_monster().cockArea(0),true,true,true);
         outputText("[if (hasVagina && wasVirgin || !hasVagina && wasVirgin) {你那纯洁的洞穴被这样一种低贱愚蠢的生物毁掉，[if (cor+lib > 60) {这痛苦地宣告了一段本不该持续这么久的纯洁的终结|这严重打击了你的尊严和自我价值感}]。}]小恶魔们异口同声地发出了愉悦的叹息。他们有了自己的飞机杯，这就是你现在的全部价值。");
         outputText("[pg]当嘴里的肉棒插得更深时，你干呕起来，拔出时还带出了缕缕唾液。但这只小恶魔对你被呛得有多难受毫无同情心，他迅速地再次猛插进来，与此同时，[if (hasVagina) {你双腿之间|你[ass]处}]的小恶魔也在疯狂地抽插。你的大脑几乎无法跟上这发生在两端的粗暴、毫无顾忌的强暴。你的[if (hasVagina) {子宫颈|肠道}]隐隐作痛，脖子也紧绷着。一股精液突然让你的腹部感到一阵燥热，你的身体随之颤抖。高潮中的小恶魔颤抖着，以不稳定的节奏操着你，尽可能多地射出精液，而填满你喉咙的那个还没满足的白痴则从你嘴里退了出来，一脚踢开了他的竞争对手。[say: 现在轮到我用好洞了！]他宣布道。[if (impAmount > 2) {愤怒的旁观者[if (impAmount > 3) {们要求|要求}]也要用“好洞”，但那只下定决心的小恶魔把他们踢到一边，指着你那曾经是他的飞机杯的酸痛下巴。}]");
         outputText("[pg]你的[vagORass]再次遭到猛烈而粗暴的强暴，让你忍不住闷哼退缩。[if (impAmount > 2) {一根新的肉棒被强行塞进你的喉咙，取代了上一根，而这[if (cor + lib > 70) {你尽管不愿承认却幸福地享受着的}]折磨就像刚才一样继续着。}]之前的疼痛让你感觉被操得生疼，但在你体内晃荡的粘稠精液抚平了这一切。动作很快，毫无技巧可言，但你却依然享受着被使用的感觉。[if (impAmount > 2) {你嘴里的那根肉棒远没有其他的持久，甚至在埋在你[if (hasVagina) {小穴|屁股}]里的那根爆发之前，它就已经抽搐着喷射了，而后者也在片刻之后爆发了|由于之前在你脸上的那番折腾，这只小恶魔很快就开始了他的高潮}]。空气中弥漫着愉悦的喘息声[if (impAmount > 3) {，而正在自慰的[if (impAmount < 5) {孤单旁观者|旁观者们}]将精液喷洒在你身上}]。在这短暂却狂热的事件中，你不可能不咳嗽和喘息。在你失去意识之前，精液的气味一直萦绕在你的感官中。");
         outputText("[pg]几个小时后你醒了过来，浑身酸痛，身上溅满的精液比你记忆中的还要多。小恶魔们显然已经吃饱喝足了，幸运的是，他们在得到满足后就抛弃了你。你收拾好自己，跌跌撞撞地朝营地走去。");
         get_player().orgasm("VaginalAnal");
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseTwoHours);
      }
      
      public function loliVirginRape() : void
      {
         clearOutput();
         outputText("你倒在地上，揉着酸痛的身体，因[if (hp <= 0) {痛苦|发情}]而呻吟着。你想要逃跑，但一切[if (hp <= 0) {都痛得要命|都变得如此模糊}]。小恶魔趁虚而入冲向你，用他长满利爪的手掐住了你的脖子。");
         outputText("[pg]小恶魔对你发出狡黠的轻笑。[say:能遇到体型和我这么接近的人，真是难得的享受。]泪水在你的眼眶里打转，随后小恶魔松开了你的喉咙，转而开始脱下你的[armor]。[say:哦，不过别担心，我[b:最喜欢]小孩子了。]");
         outputText("[pg]你徒劳地扭动挣扎，妄图逃脱，但窒息感早已榨干了你仅存的力气。每一下动作都让你精疲力竭，转眼间你便被剥了个精光，赤条条地暴露在这怪物面前。他眼中闪着贪婪的光，[if (singleleg) {跨骑在你[legs]上|猛地将你的双腿推高掰开}]，将那根粗硕得令人胆寒的巨物啪地甩落在你的肚皮上。他就这样拿那尺寸嘲弄着你——让你看清楚，这根东西比任何该进入一个小[boy]身体里的玩意儿都要大出不知多少。");
         outputText("[pg]恶魔向后仰身，将龟头压在你的阴缝上，戳弄着那个小穴。随着他努力想要挤进去，他那充满嘲弄的欢快咕哝声开始转变为沮丧。他痛苦地将爪子插进你的阴唇之间，试图将它们拉开，希望能借此把恶魔的阴茎塞进去。你呜咽着试图挣脱，但小恶魔抓住了你的身体，调整姿势，将更多的重量压在他的挺进上。");
         outputText("[pg]伴随着一声充满攻击性的咕哝声，小恶魔终于猛地刺穿了你，疼得你尖叫起来。");
         get_player().cuntChange(10,true,true);
         outputText("强烈的灼烧感占据了你的脑海，紧接着你感觉自己的阴蒂也快被撕成两半了。你甚至还没来得及感受更深处是什么感觉。泪水现在已经止不住地顺着你的脸颊流下。");
         outputText("[pg][say:天哪，没错。他们说得真对，孩子是上天赐予的最棒的礼物，]正在强奸你的混蛋带着嘲弄的冷笑说道，一边把鸡巴往你里面顶。摩擦力太大了，他没法动得太快——你那毫无准备的小穴像钳子一样死死咬住他——但这并不妨碍他使劲往里干。你不停地哭，但随着血液和体液开始混在一起，起到了润滑作用，他还是得逞了。里面依然像火烧一样疼。你的阴蒂依然像是要被撕碎了一样。你又试着挣开，但那小恶魔倾身向前，再次扼住了你的脖子。");
         outputText("[pg]小恶魔逼近你，在你耳边低语：[say:在我完事之前，你哪儿也去不了。[if (silly) { 这是我的权力幻想，不是你的。}]]");
         outputText("[pg]在缺氧和剧痛的夹击之下，一切开始搅成一团模糊。那小恶魔不停在你身上挺动的腰胯告诉你，你的身体已经彻底没了抵抗的力气。虽然疼得要命，可不知怎的，痛觉也正一点点麻木下去。那恶魔发出一声狂喜的嘶吼，你的神智猛一下被拉了回来——他那根肿胀的肉棒正在你体内爆发，温热的恶魔精液带着病态而污浊的腐化种子，把你灌得满满当当。每一滴邪秽的精液都在融化掉更多的疼痛。他的肉茎慢慢地从你体内滑出，艰难地挣脱着你那被糟蹋过的肉穴贪婪的吸吮。你两眼一黑，失去了意识。");
         outputText("[pg]几个小时后，你醒了过来。你麻木地坐起身，看着自己。你浑身是瘀伤和抓痕，滴落着鲜血和精液。也许如果你让自己变得更加堕落，下次就不会那么痛了。");
         outputText("[pg]你摇摇头甩掉这些想法，收拾好东西，跌跌撞撞地回到营地寻求安全和休息。");
         dynStats(DynStat.Cor(3));
         get_player().knockUp(1,432);
         get_combat().cleanupAfterCombat();
      }
      
      public function killImp() : void
      {
         var _g:Combat;
         clearOutput();
         registerTag("impAmount",TagFun_Impl_.fromInt(int(get_combat().get_monsterArray().length)));
         get_images().showImage("item-impSkull");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2203,FlagDict_Impl_.arrayReadInt(_loc1_,2203) + 1);
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你将闪耀的剑刃刺入这只恶魔害虫的胸膛，焚烧了他的心脏。");
         }
         else if(get_player().get_weapon() == get_weapons().DULLSC)
         {
            outputText("你举起被诅咒的镰刀来收割这只烦人的害虫，挥舞得沉重而流畅。刀刃毫无阻力地切断了他的脖子。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("你抓住小恶魔的一只角，把他拉近，将你的[weapon]枪管塞进他的喉咙。就在他开始发出紧张的呜咽声时，你扣动了扳机，终结了他。");
         }
         else if(get_player().get_weapon().isStaff() && get_player().get_weapon().isChanneling())
         {
            outputText("你念诵了一些基础的咒语，让你的[weapon]顶端散发出柔和的光芒。你粗暴而沉重地刺入小恶魔的胸膛，一股能量从法杖中传导进他的心脏，将其震碎。这个害虫一动不动地躺在地上。");
         }
         else if(get_player().get_weapon().isSpear() || get_player().get_weapon() == get_weapons().MRAPIER || get_player().get_weapon() == get_weapons().RRAPIER)
         {
            outputText("你挥舞着你的[weapon]向前猛扑，轻松地刺穿了恶魔的胸膛。世上又少了一个在各个领域游荡的邪恶生物。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("你把小恶魔的头踩在地上，让他更加晕眩，同时你站到他身侧。你举起你的[weapon]准备进行经典的处决，挥下武器终结这个害虫。那令人满足的砍击声对你来说就像音乐一样，提醒着你世上又少了一个小恶魔。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("你挥舞着你的[weapon]重重地砍向小恶魔的脖子，斩断了他的头。这个世界上的小恶魔已经够多了。");
         }
         else
         {
            outputText("你三下五除二地解决了这只小恶魔，然后把尸体拖走。这世上又少了一只四处游荡的邪恶生物。");
         }
         outputText("[pg][if (impAmount > 1) {[if (impAmount > 2) {另一只|另一只}]蠢货连滚带爬地想要逃跑，但很快也落得了同样的下场[if (impAmount > 2) {，不过[if (impAmount > 3) {其他的|第三只}]已经逃之夭夭了}].}]");
         if(get_player().cor < 25)
         {
            dynStats(DynStat.Cor(-0.5));
         }
         get_player().upgradeDeusVult();
         menu();
         addButton(0,"拿走头骨",takeSkull);
         _g = get_combat();
         addButton(1,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function impVictory() : void
      {
         clearOutput();
         outputText("你满意地微笑着，看着[themonster]倒下并开始狂热地自慰。");
         generateImpSexMenu();
      }
      
      public function impRapesYouHpLoss() : void
      {
         clearOutput();
         registerTag("noob",TagFun_Impl_.fromBool(get_player().level == 1));
         outputText("你不能让自己倒在这里，不能[if (noob) {这么快就倒下|像这样倒下}]，更不能倒在一个小恶魔手里。但你的[if (singleleg) {身体|双腿}]比平时沉重得多，你的[if (isgoo) {整个身体都在燃烧|肺部因过度用力而燃烧}]，每一次呼吸都短促而急促，永远不足以让你振作起来。即使你[if (singleleg) {瘫倒在地|踉跄不稳}]，他也没有停手，不断地抓挠、踢打、挥拳，直到你的视线随着他的攻击节奏忽明忽暗。甚至你的[if (isgoo) {凝聚力似乎都在减弱|骨头似乎都在隐隐作痛}]，一切都模糊成了小恶魔血肉和[if (isgoo) {玛瑞斯泥土|鲜血}]的酸涩红色。");
         outputText("[pg]当你挣扎着想要[if (singleleg) {起身|站起来}]时，世界在摇晃和摇摆，但小恶魔更快，在你反应过来之前就已经扑到了你身上。他爪子的每一次挥击都[if (isgoo) {撕裂你的身体|刺痛你的[skinshort]}]，直到你的[if (isunarmed) {抵抗意志消退|[weapon]从手中滑落}]，你才一动不动地躺在地上，嘴唇上沾满了灰尘，他才停下来。你几乎没有喘息的机会，两只穿着凉鞋的脚就踩在了你的手臂上，他的重量既轻微又令人难以承受，隐隐的疼痛和腐化的[if (cor > 60) {浓郁香气|恶臭}]不断提醒着你的失败。无论你如何挣扎，他都纹丝不动，你唯一能做的就是[if (isunarmed) {在他把你的[skindesc]按在[if (inlake) {沙子|泥土}]里摩擦时痛苦地皱眉|看着他把你的[weapon]扔到一边}]。");
         outputText("[pg]你从未想过你的冒险会是这样——[if (noob) {一年的|你所有的}]训练在爪子的闪烁和翅膀的拍打中化为乌有——虽然你尽量不去想接下来会发生什么，但你无法忽视他的缠腰布在系带处紧绷并在里面鼓起的样子。特别是当盐和麝香的气味几乎让你作呕时，小恶魔终于走开，让你能深吸一口[timeofday]的空气，这成了最小的仁慈。");
         outputText("[pg]但这并没有持续多久。当他的手滑到你的身侧，他的爪子顺着你的身体划过，仿佛在提醒你它们还在那里。他的每一次触摸都在你[if (!isgoo){的[skinshort]}]上爬行，就像一群蚂蚁，当他咕哝着拍打翅膀，不断推搡直到世界摇摇欲坠时，你的[if (isgoo) {粘液溅在地上|脊背发凉}]。你试图支撑自己，试图抓住他，但伤痕累累的你，甚至无法与他的力量抗衡。");
         outputText("[pg]伴随着最后的一推，你重重地摔在了背上。");
         outputText("[pg]在你的视线恢复之前，小恶魔就已经压在了你身上，[if (isnaked) {[if (singleleg) {他沉重的身体压在你的[leg]上，将你固定在原地|他滚烫而狂乱的呼吸喷洒在你的[legs]上，同时将它们掰开}]|[if (isnakedlower) {他甚至懒得脱下你的[armor]，就直接[if (singleleg) {跨坐|掰开}]了你的[legs]|他那肮脏的爪子撕扯着你的[armor]，直到你最后的防线也随之剥落}]}]。当他紧紧贴着你的[skinshort]时，他的遮阴布几乎无法掩盖他不断膨胀的尺寸，你的灵魂贪婪地汲取着他堕落的温度，直到你头晕目眩，热流在你的[if (isgenderless) {腹部|双腿之间}][if (lust > 60) {爆发|汇聚}]。你所能做的只有咽下身体背叛你时那种令人作呕的感觉，你的[genitalsdetail]正在[if (hascock) {变大[if (isherm) {并且}]}][if (hasvagina) {变得湿润|收缩}]，即使你现在最想做的就是让[if (isherm || multicock) {它们|它}]停下来。");
         outputText("[pg]但你越是试图[if (tailLeg) {甩动你的尾巴|[if (isgoo) {扭动身体|踢腿}]}]把他甩开，[if (isherm || multicock) {它们|它}]就越是随着一种不属于你的节奏跳动。每次你挣扎，他的魔法就会在你的[skinshort]上蔓延得更远，很快就带着病态的甜味停留在你的嘴唇上，并在你的舌头上变得浓稠，让你的脑海中只剩下沉闷的阴霾和沙哑的笑声。在远处，你听到了肉体摩擦和布料滑落地面的声音，他的气味比以往任何时候都要浓烈，当某种滚烫而湿滑的东西擦过你的[if (hasballs) {[balls]|大腿}]时，你身体的每一个部分都蜷缩得更紧了。");
         var _loc1_:Boolean = get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON;
         var _loc2_:Boolean = get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON;
         outputText("[pg]某种足够坚硬的东西告诉你，这一切都是真实发生的，你已经[if (noob) {像不知道多少个勇者一样倒下了|被一个小恶魔打败了}]，当你犯下向上瞥一眼的错误时，他那沾满焦油的眼睛燃烧着，闪烁着恶意的光芒。当他逼近时，它们死死地盯着你，即使你向后拖动身体，粘稠的温热感还是爬上了你的肚子，虽然你试图不去看，但当你第一眼看到他的肉棒时，你还是忍不住打了个寒颤，" + (_loc1_ ? "它甚至比你自己的还要变态" : "那真是一个非人的东西") + "，肿胀而凹凸不平地抵在你的[if (hasscales || isgoo) {身体|肉体}]上。光是那股味道就让你作呕，当他的爪子滑过你的[legs]并把它们猛地拉起来时，你几乎无法阻止自己吐出来，他抓得太紧了，你根本无法挣脱。你所能做的只有在他的手中扭动，因为他把他的肉棒在[if (multicock) {你的其中一根}]你的[if (hascock) {肉棒|[if (hasvagina) {[vagina]|光秃秃的腹股沟}]}]上摩擦，" + (_loc2_ ? "它的" : "那奇怪的") + "小结节和突起[if (hascock) {爱抚着你的[cocks]的龟头[if (multicock) {们}]|他欲望的最初痕迹[if (lust > 60 && hasvagina) {与你自己的混合在一起|弄脏了你的[skinshort]}]}]。");
         outputText("[pg]然后它以刻意的缓慢向下滑动，你可以数清它上面的每一个凸起和静脉，因为它[if (hasvagina) {分开了你的外阴唇|滑过你的[if (hasballs) {[balls]|身体}]}]，即使你试图[if (singleleg) {抵抗|合拢双腿}]也从未停止。当小恶魔靠近时，他身上散发出的热量夺走了你的呼吸，但无论你看向哪里，你都无法逃脱他饥渴的凝视。那双眼睛后面没有灵魂。不，那里除了空洞什么都没有，随着他每一次用力的咕哝，那空洞[if (hasplainskin) {让你的皮肤发麻|让你的[if (isgoo) {身体|脊背}]发抖}]，当他向前推，直到陈旧的汗水和恶臭的呼吸灼烧你的鼻子时，你的手指蜷缩进了[if (inlake) {沙子|泥土}]里。");
         outputText("[pg]当他擦过你[if (lust > 60 && hasvagina) {羞耻地湿润的}]入口时，他自己的鼻孔也张大了，只要你稍有挣扎的念头，他的手就会[if (hasscales) {紧紧抓住|深深陷入}]你的[if (isbiped) {大腿|[legs]}]。但你仍在尝试，仰起头，[if (singleleg) {用你的[if (tailLeg) {尾巴|身体}]猛烈反击|踢着双脚}]，即使他的爪子[if (isgoo) {撕下你大块的粘液|[if (hasscales) {阻断了你的血液循环|滴着你的鲜血}]}]。只有当你静静地躺着时，他才会松手，而他脸上绽放的笑容却像冰一样在你的肠胃里蔓延。");
         outputText("[pg]你甚至没有机会眨去眼泪，他就猛地向前冲去，一击便[if (isvirgin) {[if (hasvagina) {撕裂了你的纯洁|刺穿了你的[asshole]}]|撕裂了你最后的抵抗}]。");
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432);
            get_player().cuntChange(get_monster().cockArea(0),true);
         }
         else
         {
            get_player().buttChange(get_monster().cockArea(0),true);
         }
         outputText("当他[if (vaginallooseness < 2) {强行挤入|沉入你的深处}]时，他那被污染的阴茎上的每一个凸起都在你的肉壁上燃烧，你已经能感觉到他的堕落渗入你的[skindesc]，一种[if (cor > 60) {奇怪的愉悦|令人作呕的酸楚}]的温暖让你在他的掌控中无力地扭动。然而他并没有减速，每一寸都[if (vaginallooseness < 2) {将你撑到极限|将你撑得更开}]，直到他的臀部撞击你的臀部，将你[if (isgoo) {唇间|肺里}]的空气挤出。你大口喘气，但空气却没有进来，当他把你的[if (isbiped) {双腿|身体}]固定在原地，并将你一直拉到他的根部时，空气被[if (isgoo) {夺走|从你的唇边夺走}]。");
         outputText("[pg]当[if (hasvagina) {他顶到你的子宫|每一寸都又热又硬地压在你的肠子上，他的睾丸紧紧贴着你的[skinshort]}]时，你的整个存在似乎都萎缩了。他恶魔种子的痕迹已经玷污了你的灵魂，当你意识到这就是[if (noob) {你旅程的终点，而现在你|你现在的命运，成为}]不过是一个恶魔的[if (hasvagina) {孵化器，你自己的身体被偷走，去[if (noob) {进一步诅咒你被派去拯救的世界|给世界带来更多的[if (cor < 20) {邪恶|小恶魔}]}]|战利品，另一个供他们使用和虐待的勇者，直到你也像其他人一样崩溃}]时，你无法控制地颤抖。至少有那么一瞬间，但随后，即使是那个想法也消失在一声沉重的咕哝和[if (inlake) {沙子|泥土}]摩擦你背部的声音中。下一次抽插在深处燃烧起隐隐的疼痛，并将他的汗水溅在你的[skindesc]上，即使你每次受到撞击都发出呜咽，小恶魔也从未停止过对你[if (hasvagina) {[vagina]|[asshole]}]的猛烈撞击。");
         outputText("[pg]令你沮丧的是，这似乎只会让他更加兴奋。他肆无忌惮地将自己完全埋入你的体内，他的眼睛疯狂而迷失在欲望中，随着他的节奏加快到疯狂的节拍，他阴茎上的每一个凸起和结节都狠狠地撞击着你瘀伤的肉壁。他的爪子紧紧抓住你的[legs]，虽然你无法摆脱胃里翻滚的恶心感，但你尽量不去想即将发生的事情。");
         outputText("[pg]没有用的。当他把你紧紧按住，用尽全力挺进，一寸一寸地沉入你的体内，直到你被完全填满、彻底玷污时，一切挣扎都是徒劳的。他肉棒的每一次跳动都在[if (isgoo) {你的核心中回荡|化作一阵战栗顺着脊背爬下}]，当他第一股污秽的精液喷发时，一股[if (cor > 60) {猛烈|冰冷}]的火焰流遍你的全身。当精液渗入你的深处，带着一种令人溃烂的温热感笼罩着你时，你贴着他扭动着身体。但他仍在挺动着臀部，你已经感觉到那[if (cor > 60) {令人愉悦|令人窒息}]的腐化阴霾正威胁着要将你吞噬，随着他越来越多的精液在体内积聚，这种感觉变得越来越强烈。");
         outputText("[pg]当他最后一次颤抖并拔出时，那感觉就像[if (hasplainskin) {第二层皮肤|一层污垢}]一样附着在你的身上，但你已经被折磨得筋疲力尽，几乎没有察觉到他的手从你大腿上松开。以至于你几乎没有时间支撑自己，就伴随着一声麻木的[i:砰]响摔在了[if (inlake) {沙滩|地上}]，但即使是这样，疼痛也不足以掩盖那种令人作呕的温热感，它正从你的[vagorass]里滴落下来，在你的[skindesc]上干涸。");
         outputText("[pg]你最后记得的是一阵翅膀的扑腾声和[if (inlake) {拍打着海岸的波浪声|风的轻柔触碰}]，随后一切都被黑暗吞噬……");
         get_player().orgasm("VaginalAnal");
         get_player().slimeFeed();
         dynStats(DynStat.Cor(1));
      }
      
      public function impRapesYou(param1:Boolean) : void
      {
         clearOutput();
         if((get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties)) && !get_player().isTaur() && get_player().hasVagina())
         {
            get_images().showImage("imp-loss-female-fuck");
            outputText("你瘫倒在地，摆出了一个现在对你来说再自然不过的姿势，身体前倾，让你那" + get_player().allBreastsDescript() + "微微下垂。小恶魔上下打量着你，邪恶地盯着你那准备就绪、微微张开的嘴唇。他扯下遮羞布，露出一根正在变硬的肉棒。你的眼睛随着它变得越来越大……越来越大……越来越大而凸出！小恶魔的肉棒最终膨胀到了整整十二英寸……而且它正在靠近。你努力去思考……但你就是做不到！你太想把它含在嘴里了！[pg]");
            outputText("你的" + get_player().vaginaDescript(0) + "因期待而滴着水，你发现自己不由自主地将膝盖分得更开，准备好被填满。他笑了笑，将他的肉棒压在你的" + get_player().vaginaDescript(0) + "上，把你往后推，以便获得更好的角度。你试图说话，但你的大脑一次只能思考这么多！现在，它满脑子都是肉棒，这自然让你张开嘴，发出一声荡妇般的呻吟。[pg]");
            outputText("小恶魔粗暴地挺进你的身体，将他的肉棒直捣到底，让你在痛苦和惊讶中喘息。他把它留在你那淫荡的小穴里，给你一秒钟的时间去……哦，他在骗谁呢……他从你那空洞的眼神就能看出，你这辈子除了挨操什么都没做过。他用力地操你，拍打你的[ass]，提醒你谁才是老大。你忍不住去想，你有多喜欢男人掌控一切的感觉。少想点！");
            get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            outputText("[pg]");
            outputText("随着时间的推移，粗暴的性交变得越来越令人愉悦。你随着每一次抽插空洞地呻吟着，臀部紧紧夹住恶魔的肉棒——享受着被填满的感觉。没过多久，你忍不住在他身上高潮了，你的阴道像老虎钳一样锁住他的肉棒，肌肉起伏，榨取着他的精液。小恶魔的肉棒在你体内爆发，每一次喷发都将大量滚烫的恶魔之种泵入你的体内。你晕了过去，感觉到它填满了你的子宫，撑大了你的肚子，小恶魔的高潮用疯狂的精液填满了你。[pg]");
            outputText("伴随着一声叹息，他拔出了他的肉棒，你瘫倒在地，精液从你那被操透的洞里漏到地上。如果你能集中注意力的话，你绝对会担心自己是不是怀孕了之类的。但你失去了意识。");
            get_player().knockUp(1,418);
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
            get_combat().cleanupAfterCombat();
            return;
         }
         if(param1)
         {
            impRapesYouHpLoss();
         }
         else
         {
            clearOutput();
            if(int(get_player().cocks.length) >= 1 && Utils.rand(2) == 0)
            {
               if(get_player().cocks[0].cockThickness >= 4)
               {
                  sprocketImp();
                  return;
               }
            }
            if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
            {
               get_player().slimeFeed();
               get_images().showImage("imp-loss-female-fuck");
               outputText("你瘫倒在地，被欲望和渴求淹没，无力反抗。小恶魔笑了，眼中闪烁着邪恶的光芒。他扯下遮羞布，露出一根正在变硬的肉棒。你的眼睛随着它变大……变大……变大而微微凸出！那个小恶魔有一根十二英寸长的肉棒……而且他正向你走来。你的" + get_player().vaginaDescript(0) + "几乎因为期待而流出了汁液，你发现自己张开了[legs]做好了准备。");
               outputText("[pg]他笑了笑，将他的肉棒压在你的" + get_player().vaginaDescript(0) + "上。你那被欲望驱使的大脑说不出话来，只能像个妓女一样喘息和呻吟。");
               if(get_player().vaginalCapacity() < get_monster().cockArea(0))
               {
                  if(get_player().vaginas[0].virgin)
                  {
                     outputText("他用力挺进，冲破了你的处女膜，夺走了你的童贞。他脸上闪过一丝惊讶，随后被狂喜所取代。如果你脑子里还有一点理智的话，你会注意到他看起来……不知怎么的变强了，但你太饥渴了，根本不在乎。");
                  }
                  else
                  {
                     outputText("他顶着你紧致的小穴，努力想要插入你。");
                  }
                  outputText("他的肉棒只插进去了几英寸，但他开始用力地操你，每一次都为他的恶魔工具占据你更多的小穴。当他把一半插进你体内时，你感到一阵痛苦的拉扯，这毁了你的" + get_player().vaginaDescript(0) + "，让大多数人类都无法满足你。他像这样操了你似乎很久，但始终没有插得更深。");
                  get_player().cuntChange(get_monster().cockArea(0),true);
               }
               else
               {
                  outputText("他粗暴地挺进，将他的" + get_monster().cockDescriptShort(0) + "直捣到底，让你在痛苦和惊讶中喘息。他把它留在那里，给你一秒钟的时间去适应他，然后开始用力地操你，每抽插几次就拍打你的屁股，提醒你谁才是老大。");
                  get_player().cuntChange(get_monster().cockArea(0),true,true,false);
               }
               if(get_player().get_gender() == 3)
               {
                  outputText("[pg]随着时间的推移，粗暴的性交变得越来越令人愉悦，直到你忍不住随着他在你的" + get_player().vaginaDescript(0) + "里的每一次抽插而抚摸你的[cock]。当你的性器官释放时，你感觉到自己紧紧夹住他，喷射出精液，像抓住救命稻草一样榨取着恶魔的肉棒。");
               }
               if(get_player().get_gender() == 2)
               {
                  outputText("[pg]随着时间的推移，粗暴的性交变得越来越令人愉悦。你随着每一次抽插大声而淫荡地呻吟着，臀部紧紧夹住恶魔的肉棒，享受着被填满的感觉。没过多久，你忍不住在他身上高潮了，" + get_player().vaginaDescript(0) + "像老虎钳一样锁住他的肉棒，肌肉起伏，榨取着他的精液。");
               }
               outputText("小恶魔的" + get_monster().cockDescriptShort(0) + "在你体内爆发，每一次喷发都将大量滚烫的恶魔之种泵入你的体内。你晕了过去，感觉到它填满了你的子宫，撑大了你的肚子，小恶魔的高潮用异常大量的腐败精液填满了你。");
               outputText("[pg]伴随着一声叹息，他拔出了他的肉棒，你仰面瘫倒，精液从你那被狠狠操过的洞里喷涌而出，流到地上。");
               if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() <= 216)
               {
                  outputText("你想知道这会对你子宫里孕育的东西产生什么影响……");
               }
               else if(get_player().get_inHeat())
               {
                  outputText("在你迅速失去意识时，你发现自己竟然希望已经怀孕了。");
               }
               else if(get_player().get_pregnancyIncubation() <= 0)
               {
                  if(get_player().cor > 75)
                  {
                     outputText("伴随着一声满足的呻吟，你将手指埋入那黏滑的温暖中，期盼着自己能怀上某个恶魔的子嗣，随后便失去了意识。");
                  }
                  else
                  {
                     outputText("你希望自己没有怀孕，但在你来得及进一步思考这个可能性之前，就迅速失去了意识。");
                  }
               }
               get_player().knockUp(1,418);
               dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(1),DynStat.Cor(1));
               get_player().orgasm("Vaginal");
            }
            if(get_player().get_gender() == 0 || get_player().get_gender() == 1)
            {
               get_images().showImage("monster-imp");
               if(get_player().get_gender() == 1 && Utils.rand(2) == 0)
               {
                  outputText("小恶魔的黑暗魔法摧毁了你继续战斗的意志，你的双眼因情欲而变得迷离。你瘫倒在");
                  if(get_player().isTaur())
                  {
                     outputText("飞节和膝盖上，你的[cock]因为无法抑制的情欲导致的巨大血压而隐隐作痛。他走到你面前，停在离你大约两英尺的地方，满心欢喜地看着你这副无助的模样");
                  }
                  else
                  {
                     outputText("膝盖上，掏出你的[cock]开始无意识地自慰，而小恶魔则带着邪恶的笑容向你走来。你的脑海中飞速闪过吸吮小恶魔肉棒的念头和画面。他走到你面前，停在离你大约两英尺的地方，满心欢喜地看着你屈服于自己的情欲");
                  }
                  outputText("。你的目光向下扫过他的腰间，看到他的缠腰布下鼓起了一个巨大的包，这景象让你的[cock]抽搐起来，开始渗出先列腺液。[pg]");
                  outputText("小恶魔扯下他的缠腰布，露出他那根巨大的12英寸肉棒，然后用力抓住你的头，将你按向他那根坚硬跳动的恶魔肉棒。他缓慢而用力地一挺，将肉棒塞过你的嘴唇，深深插入你的喉咙。你几乎无法容纳他那巨大的肉棒，然而你的情欲却让你渴望更多。你咳嗽着、干呕着，而小恶魔则继续用力操着你的嘴，滚烫的睾丸拍打着你的下巴，完全不顾你需要呼吸。");
                  if(get_player().isTaur())
                  {
                     outputText("你瘫倒在地上，你的[cock]随着小恶魔抽插的节奏在你的身体上颤抖，让你的下腹部沾满了它自己分泌的先列腺液。[pg]");
                  }
                  else
                  {
                     outputText("你现在四肢着地，你的[cock]随着小恶魔抽插的节奏在你身上上下弹跳，让你的肚子沾满了你自己的先列腺液。[pg]");
                  }
                  if(get_player().ballSize >= 5)
                  {
                     outputText("你巨大的[balls]也随着小恶魔抽插的力量沉重地摆动着，拍打着你自己的屁股，让你的[cock]因情欲而变得更加坚挺，先列腺液随着拍打的节奏从你的肉棒中喷涌而出。[pg]");
                  }
                  outputText("由于缺氧，你开始感到头晕目眩，就在这时，小恶魔紧紧抓住你的头，开始在你的喉咙里进行快速而短促的抽插，他快要高潮了。突然，他猛地收紧肌肉，爪子深深陷入你的头皮，将肉棒尽可能深地插入你的喉咙，将他巨大的肉棒顶在你的胃里。当你感觉到小恶魔的睾丸在你的下巴上剧烈痉挛时，你猛地睁大了眼睛。他的肉棒在你的嘴里跳动，浓稠的恶魔精液被猛烈地泵入你的喉咙。小恶魔继续用他滚烫的精液填满你的肠胃，感觉就像过了一个世纪那么漫长，他的高潮持续时间远超任何人类。");
                  get_player().refillHunger(40);
                  outputText("他缓慢地将仍在喷射的肉棒从你体内抽出，用几乎不间断的、异常滚烫粘稠的恶魔精液喷洒在你的喉咙和嘴里。小恶魔在高潮结束前及时将肉棒从你嘴里拔出，将精液溅了你一脸，让你嘴唇、鼻子、眼睛和头发上都沾满了他那极其浓稠粘滑的精液。[pg]");
                  outputText("你瘫倒在地上喘息着，筋疲力尽，无法动弹，你脸上和体内的恶魔精液仍在散发着强烈的热量和腐化气息。你失去了意识，你的[cock]依然坚挺，你的情欲仍未得到满足。");
                  dynStats(DynStat.Lust(20),DynStat.Cor(2));
                  get_combat().cleanupAfterCombat();
                  get_player().slimeFeed();
                  get_player().orgasm("Lips",false);
                  return;
               }
               get_player().slimeFeed();
               outputText("你瘫倒在地，被情欲和渴望彻底淹没，无力反抗。小恶魔微笑着绕着你转圈，边走边解下他的缠腰布。你被粗暴地推倒在地，屁股被狠狠地拍了一下。你发情得厉害，除了因疼痛而呻吟外，什么也做不了");
               if(!get_player().isTaur())
               {
                  outputText("当你被脱去衣服时");
               }
               outputText("。当小恶魔将一个巨大的物体压在你的屁股上时，你意识到他有一根巨大的肉棒！");
               outputText("[pg]小恶魔将他的" + get_monster().cockDescriptShort(0) + "插入你的屁股，狠狠地操你，几乎不顾及你的感受。经过一番粗暴的抽插后，他高潮了，用滚烫的恶魔精液塞满了你的屁股。他的高潮持续时间远超任何人类，让你的肚子微微隆起。");
               get_player().buttChange(get_monster().cockArea(0),true,true,false);
               dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(1),DynStat.Cor(1));
               if(get_player().sens > 40)
               {
                  outputText("被滚烫精液填满的感觉让你高潮了。");
                  if(get_player().get_gender() == 1)
                  {
                     outputText("你把精液射得满地都是，随着恶魔的抽插，精液大股大股地喷涌而出。");
                  }
                  get_player().orgasm("Anal");
                  dynStats(DynStat.Cor(1));
               }
               outputText("[pg]当他完事后，你瘫倒在地，精液从你被蹂躏的屁股里流得满地都是，你已经筋疲力尽，无法动弹。意识逐渐模糊。");
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function impPetrifyable() : Boolean
      {
         if(get_player().isBasilisk())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 100;
         }
         return false;
      }
      
      public function impMultiVictory(param1:Boolean, param2:int) : void
      {
         if(param2 == 1)
         {
            impVictory();
            return;
         }
         clearOutput();
         registerTag("impAmount",TagFun_Impl_.fromInt(param2));
         registerTag("lustVictory",TagFun_Impl_.fromBool(param1));
         outputText("小恶魔们倒下了，[if (lustVictory) {色眯眯地盯着你，同时握住他们的肉棒|虚弱地瘫倒成一团}]。你可以专注于用其中一个来满足自己，尽管当你忙碌时，另一个[if (impAmount > 2) {们}]可能会设法溜走。");
         generateImpSexMenu();
      }
      
      public function impGangabangaEXPLOSIONS(param1:Boolean = false) : void
      {
         var loss2:Boolean;
         var _g1:ImpScene;
         var loss1:Boolean;
         var _g:ImpScene;
         var _loc3_:* = null as Function;
         var _loc4_:* = null as Function;
         get_player().slimeFeed();
         spriteSelect(SpriteDb.get_s_impMob());
         var _loc2_:Boolean = false;
         set_monster(new ImpGang());
         outputText("[pg]");
         get_images().showImage("event-impGang");
         if(!param1)
         {
            outputText("<b>你睡得很不安稳。营地边缘传来的一点小声音打破了你的休息，你突然醒来，发现自己被[themonster]包围了</b>！[pg]");
         }
         if(get_camp().impGangBang.sleepingInside())
         {
            outputText("你看着门，发现它是开着的。该死。你睡觉前忘了锁门！[pg]");
         }
         if(!param1 && Utils.randomChance(50 + (get_player().get_inte() + get_player().get_spe()) / 4))
         {
            outputText("这些小恶魔身高在[if (metric) {半米到一米多|两到四英尺}]之间，骨瘦如柴，长着小小的恶魔翅膀。它们红橙相间的皮肤很脏，黑色的头发看起来油腻腻的。有些是裸体的，但大多数都穿着破烂的缠腰布，几乎无法遮掩它们的腹股沟。它们都有一根像男人的手臂一样长而粗的" + get_monster().cockDescript(0) + "，对它们的身体来说太大了。看着一个小恶魔被它的" + get_monster().cockDescript(0) + "绊倒会很有趣，如果你没有被一群从四面八方逼近的色眯眯的小恶魔包围的话……[pg]");
            outputText("你迅速起身，及时准备好你的[weapon]！战斗开始了！");
            _g = this;
            loss1 = true;
            _loc3_ = function():void
            {
               _g.impGangabangaEXPLOSIONS(loss1);
            };
            _g1 = this;
            loss2 = true;
            _loc4_ = function():void
            {
               _g1.impGangabangaEXPLOSIONS(loss2);
            };
            startCombatMultiple(new Imp(),new ImpGang(),null,null,impGangGetsWhooped,_loc3_,impGangGetsWhooped,_loc4_,"这些小恶魔身高在两到四英尺之间，骨瘦如柴，长着小小的恶魔翅膀。它们红橙相间的皮肤很脏，黑色的头发看起来油腻腻的。有些是裸体的，但大多数都穿着破烂的缠腰布，几乎无法遮掩它们的腹股沟。它们都有一根像男人的手臂一样长而粗的恶魔阴茎，对它们的身体来说太大了。");
            get_monsterArray()[0].scaleToLevel(10);
            return;
         }
         if(param1)
         {
            clearOutput();
         }
         if(get_player().isTaur())
         {
            if(Utils.rand(2) == 0 && (get_player().cockTotal() == 0 || get_player().get_gender() == 3))
            {
               if(!get_player().hasStatusEffect(StatusEffects.ImpGangBang))
               {
                  outputText("这些小恶魔身高在[if (metric) {半米到一米多|两到四英尺}]英尺之间，骨瘦如柴，长着小小的恶魔翅膀。它们红橙相间的皮肤很脏，黑色的头发看起来油腻腻的。有些是裸体的，但大多数都穿着破烂的缠腰布，几乎无法遮掩它们的腹股沟。它们都有一根像男人的手臂一样长而粗的" + get_monster().cockDescriptShort(0) + "，对它们的身体来说太大了。看着一个小恶魔被它的" + get_monster().cockDescriptShort(0) + "绊倒会很有趣，如果你没有被一群从四面八方逼近的色眯眯的小恶魔包围的话……[pg]");
                  get_player().createStatusEffect(StatusEffects.ImpGangBang,0,0,0,0);
                  outputText("就在你准备好你的[weapon]时，小恶魔们向前扑来，一个满身是汗的小恶魔紧紧抓住你的手臂");
                  if(!get_player().get_weapon().isAttached())
                  {
                     outputText("而另一个则把你的武器踢得远远的");
                  }
                  outputText("。" + Utils.cnName(get_monster().get_short()) + "向前涌来并抓住了你。小恶魔们抚摸你的身体，用它们的" + get_monster().cockDescriptShort(0) + "摩擦你的马腿，将它们的汗水和先列腺液涂抹在你的[skindesc]上。其余的[monster.short]，十几个或更多的小恶魔，都色眯眯地看着你，一边拍打和捏你的身体一边大笑。小恶魔有锋利的爪子、细小锋利的牙齿和头上的短角。当它们试图把你拉倒在地时，它们用所有这些武器抓、挠、咬你。一个大胆的小恶魔向前跃起，抓住了你的");
                  if(get_player().cockTotal() > 0)
                  {
                     outputText(get_player().cockDescript(0));
                  }
                  else
                  {
                     outputText(get_player().nippleDescript(0));
                  }
                  outputText("，用力扭捏，疼得你大叫起来。一只小恶魔跳上来骑在你身上，像抓缰绳一样抓住你的[hair]。他那长长的肉棒" + get_monster().cockDescriptShort(0) + "在你的后腰上摩擦。[monster.short]散发着汗水和先列腺液的臭味，它湿润的抓握和淫秽的冷笑让你毫不怀疑，如果你输掉这场战斗，它们会对你做什么。[pg]");
               }
               outputText("这群怪物把你拖得跪倒在地，抓住你的腿，爬过你的半人马身体把你按倒。你试图把它们甩下来，但数量太多了，根本无法反抗。小恶魔们把你的手臂拖到背后，绕在骑着你的小恶魔身上。另一只小恶魔扯下他的遮羞布，露出流着先列腺液的" + get_monster().cockDescriptShort(0) + "，并把布扔给抓住你手臂的小恶魔。它们迅速用被汗水浸湿的遮羞布把你的手臂绑在背后。");
               if(get_player().biggestTitSize() > 1)
               {
                  outputText("手臂被绑在背后迫使你挺起胸膛，让你的" + get_player().allBreastsDescript() + "凸显出来。当你挣扎时，它们也跟着跳动。");
               }
               outputText("[monster.short]一边抚摸自己，一边用手在你挺出的胸部上摩擦，把它们的先列腺液涂抹在你的皮肤上。骑在你身上的小恶魔上下颠簸，一边拉扯你的头发，一边用他汗津津的" + get_monster().ballsDescriptLight() + "在你的[skindesc]上摩擦。");
               if(get_player().cor < 50)
               {
                  outputText("你的脸因屈辱而涨得通红。骑着你的小恶魔用力扭扯你的[hair]，你痛苦地呜咽着。小恶魔们用他们的肉棒在你的[hips]上摩擦，而其他小恶魔则抚摸着自己，嘲笑你的无助。");
               }
               else
               {
                  outputText("[Themonster]在你的身体上蜂拥而至，有些一边看着你扭动一边抚摸自己，有些则用他们的肉棒在你的侧腹上摩擦。骑着你的小恶魔扭扯你的头发，把你的头往后拉，你在这粗暴的对待中舒服地呻吟起来。你的[skindesc]感到一阵刺痛，你开始因欲望而涨红了脸。");
               }
               outputText("你感到屁股上挨了重重的一巴掌，震惊地大叫起来。你回头一看，一只小恶魔正把你的尾巴拉起来。他对着你咧嘴一笑，又在你的[hips]上拍了一巴掌。他猛拉你的尾巴，最后在你的屁股上拍了一下，然后俯下身，把脸埋进你的" + get_player().vaginaDescript(0) + "里。他那非人般灵活的舌头挑逗着你小穴的褶皱，并在你的[clit]上弹动。");
               if(get_player().balls > 0)
               {
                  outputText("舌头滑过你的[sack]，在上面涂满温暖的口水。");
               }
               if(get_player().cor < 50)
               {
                  outputText("你扭动臀部，试图逃离那恶魔的舌头。小恶魔抓住你的[hips]，把脸更深地埋进你的阴部，灵活的舌头在你的阴唇上滑动。你咬紧牙关，试图忽略从你的" + get_player().vaginaDescript(0) + "蔓延开来的温暖。");
               }
               else
               {
                  outputText("当小穴的热量蔓延到你身体的其他部位时，你发出一声颤抖的叹息。当舌头滑过你" + get_player().vaginaDescript(0) + "的褶皱时，你的[hips]颤抖着。小恶魔更用力地抓住你的侧腹，将他灵活的舌头探入你的肉洞。");
               }
               outputText("[pg]");
               if(get_player().biggestTitSize() > 1)
               {
                  outputText("几只手滑过你的" + get_player().allBreastsDescript() + "，把你的注意力拉回暴徒的前方。两只小恶魔摸索着你的" + get_player().biggestBreastSizeDescript() + "，在你的胸部周围拉扯你的奶子，揉捏着你的肉。它们舔舐着你的乳肉，慢慢地向你的[nipple]移动。骑着你的小恶魔松开你的头发，伸手环抱住你，一边挤压你的" + get_player().biggestBreastSizeDescript() + "，一边把他的肉棒顶在你的背上。最后，小恶魔们碰到了你的乳头，它们的舌头缠绕并拉扯着那刺痛的肉。");
                  if(get_player().cor < 50)
                  {
                     outputText("你无法逃脱舔舐和拉扯你[nipple]的舌头，它们与你小穴里的舌头相呼应。你摇着头想要拒绝这种快感，但随着欲望侵入你的身体，你的呼吸越来越急促。");
                  }
                  else
                  {
                     outputText("挤压和拉扯你乳头的舌头与在你" + get_player().vaginaDescript(0) + "里运作的舌头相呼应，让你的身体充满了欲望。你呻吟着拱起背，把你的奶子献给小恶魔们。当你因欲望而喘息时，你能听到脉搏在耳边跳动的声音。");
                  }
                  outputText("突然，你感到细小如针尖般的牙齿刺穿了你的[nipple]。当毒液注入你的奶子时，你尖叫起来，那滚烫的毒液让你的" + get_player().allBreastsDescript() + "感觉就像被蜜蜂蛰了一样。当你的乳房开始肿胀时，你痛苦地呻吟着，小恶魔们继续把恶魔的污秽注入其中。[pg]");
                  get_player().growTits(2,int(get_player().breastRows.length),false,1);
                  get_player().boostLactation(0.3);
                  _loc2_ = true;
               }
               get_images().showImage("gangbang-loss-centaur");
               outputText("在欲望和痛苦的迷雾中，你隐约看到一只巨大的小恶魔从暴徒中走出来。他有四英尺高，看起来比你见过的任何小恶魔都要宽阔强壮，脸长得既像牛又像小恶魔，这只新的小恶魔有着斑驳的灰色皮肤，宽大的紫色恶魔翅膀，头上长着两根弯曲的牛角，还有一根大到足以让牛头人窒息的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "。它那蘑菇状的头部在他的嘴下晃动，他蛇一般的舌头伸出来，从龟头上舔下一点先列腺液弹到你的脸上。当滚烫的液体刺痛你嘴唇敏感的皮肤时，你颤抖了一下。他的" + get_monster().ballsDescriptLight() + "每一个都有你的拳头那么大，上面满是汗水。他把汗津津的龟头拍在你的脸颊上，那热度几乎要把你烫伤。");
               if(get_player().cor < 50)
               {
                  outputText("你大叫一声，扭过头去躲避那热度。");
               }
               outputText("他慢慢地用他的肉棒在你的脸颊和嘴唇上摩擦，他那热得像恶魔一样的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "的每一道褶皱都在拉扯你的嘴唇。滚烫的先列腺液滴在你敏感的肉上，那麝香味让你的鼻腔发痒。当你呜咽时，那只巨大的小恶魔冷笑着，挥动他的牛鞭抽打你的脸。其他小恶魔一边看着他们的主人用肉棒抽打你，一边抚摸自己。[pg]");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("巨大的小恶魔双手各抓住你一只痛苦肿胀的乳房，揉捏并颠动着那团肉，仿佛在称它们的重量。当你的" + get_player().allBreastsDescript() + "在他的触碰下进一步肿胀时，你痛苦地喘息着。");
               }
               outputText("滚烫的先列腺液顺着你的嘴唇滴到你的舌头上。这热气腾腾、咸咸的粘液几乎热得让人受不了，你伸出舌头想让它凉快一下。当你喘息着，舌头挂在嘴外时，小恶魔们更用力地撸动他们的肉棒。小恶魔主人退后一步，上下打量着你，欣赏着他的杰作。他蛇一般的舌头伸出惊人的长度，缠绕在你的舌头上。他从你身上舔下他的先列腺液，然后把舌头强行伸进你的嘴里。小恶魔主人的舌头在你的嘴里弯曲，把那团先列腺液压进你的喉咙。");
               if(get_player().cor < 50)
               {
                  outputText("要么吞下去，要么让那条恶魔的舌头一直伸进你的喉咙。你违背自己的意愿，咽下了那团液体。");
               }
               else
               {
                  outputText("你急切地吞下那团先列腺液，试图将恶魔的舌头吸进喉咙里。");
               }
               outputText("[pg]");
               outputText("那只大个子小恶魔绕着你走，目光扫视着你被压制住的身体。");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("其他小恶魔重新霸占了你酸痛的乳房，吸吮着你的[nipple]，粗暴地揉捏着你的" + get_player().allBreastsDescript() + "，力道之大，连他们的手指都陷进了你肿胀的肉里。");
               }
               outputText("小恶魔的手在你的侧腹和腰间摩擦，他那" + Appearance.cockNoun(CockTypesEnum.HORSE) + "随着他的走动上下晃动。其他小恶魔注视着他们的主人绕着你转。只有那只正在吸吮你" + get_player().vaginaDescript(0) + "的小恶魔没有注意到，他的舌头深深地刺入你的褶皱中。大个子小恶魔一把抓住他的脖子，轻松地将他扔到一边，当他被拉开时，他的舌头在你的阴户里拖拽着。小恶魔首领走到你身后，抓住他的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "，将蘑菇头对准你的小穴。你浑身发抖，知道接下来会发生什么。其他小恶魔一边看着，一边抚摸着自己，而他们的主人则准备挺动臀部刺入你体内。[pg]");
               if(get_player().cor < 50)
               {
                  outputText("你大声呼救");
               }
               else
               {
                  outputText("你因欲望而呻吟");
               }
               outputText("，当那异常灼热的龟头撑开你的阴唇时，你的哭喊声消失在上方黑暗的天空中。骑在你身上的小恶魔抓住你的头发，把你的头往后拉，当他的主人将那根堕落的肉棒插进你体内时，你大叫起来。");
               if(get_player().biggestTitSize() > 1)
               {
                  outputText("揉捏你乳房的小恶魔吸得更用力了，揉捏着你的乳肉，仿佛想把你挤出奶来。");
               }
               outputText("你在压制你的小恶魔身下扭动挣扎，那根滚烫的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "几乎要烧伤你敏感的阴户。你能闻到他肉棒上蒸发的汗水味，当他强行将龟头塞进你的" + get_player().vaginaDescript(0) + "时，你的爱液也开始蒸发。他巨大的龟头让你的腹股沟鼓了起来，你呻吟着");
               if(get_player().cor < 50)
               {
                  outputText("，在无助的恐惧中，你感觉到那鼓包从腹股沟底部向胃部移动。你发出一声颤抖的痛苦呻吟，那根巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "一寸寸地撑开你的肚子");
               }
               else
               {
                  outputText("，在欲望中喘息着，那根巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "推开你的血肉，为自己腾出空间");
               }
               outputText("。");
               get_player().cuntChange(get_monster().cockArea(1),true);
               outputText("你能感觉到它肉棒上的每一道隆起和跳动的静脉都在拉扯着你被撑开的小穴内壁。你无助地在那根巨大的肉棒周围颤抖，完全被小恶魔变异的牛鞭刺穿了。[pg]");
               outputText("他心脏的每一次跳动都让他的肉棒抽动，让你随着肉棒在阴户里的跳动而颤抖。小恶魔们嘲笑你，对着你颤抖的身体自慰。大个子小恶魔弯曲大腿，他的龟头在你肚子深处跳动。其他小恶魔大笑着，看着你");
               if(get_player().cor < 50)
               {
                  outputText("呜咽着，当滚烫的肉棒压在新的区域时痉挛着");
               }
               else
               {
                  outputText("在快感中呻吟，转动你的臀部，迎合这根不可思议的肉棒");
               }
               outputText("，在你被塞满的" + get_player().vaginaDescript(0) + "里。大个子小恶魔冷笑着，再次弯曲他的肉棒，看着");
               if(get_player().biggestTitSize() >= 2)
               {
                  outputText("当你扭动时，你的" + get_player().allBreastsDescript() + "在你的胸前滚动");
               }
               else
               {
                  outputText("当你扭动时，你的眼睛翻白");
               }
               outputText("。[pg]");
               outputText("最后，那只大个子小恶魔拔出了他的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "，当他滑出时，每一道凸起都拉扯着你的阴道肉。当蘑菇头卡在你的褶皱上时，你尖叫着挣扎起来。");
               if(get_player().cockTotal() > 0)
               {
                  outputText("当那个凸起经过时，你的[cocks]也跟着弹跳起来。");
               }
               outputText("当蘑菇头到达你的" + get_player().vaginaDescript(0) + "入口时，你呻吟着，你被撑开的阴道肉慢慢恢复正常。小恶魔首领再次向前推进，用他那巨大的肉棒重新占据了你的小穴。");
               if(get_player().cor < 50)
               {
                  outputText("你试图扭动你的[hips]，努力挣脱，因为他龟头的凸起已经深入你的腹部。你被太多的小恶魔按住了。你只能在撑开你" + get_player().vaginaDescript(0) + "的滚烫肉棒周围扭动。当他的龟头顶过你的子宫颈时，大个子小恶魔咕哝了一声，你痛苦地呻吟着颤抖起来。");
               }
               else
               {
                  outputText("当滚烫的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "深深插入你的" + get_player().vaginaDescript(0) + "时，你狂喜地呻吟着，你小穴的每一寸都变成了这只大个子小恶魔的快乐鞘。你知道你只是这个堕落生物的性玩具，只是一个让他用精液填满的湿润小穴，当他强行将巨大的龟头顶过你的子宫颈时，这个想法几乎让你高潮。");
               }
               outputText("最后，那根堕落的肉棒顶到了你的子宫。小恶魔再次拔出，开始慢慢地操你。[pg]");
               if(get_player().biggestTitSize() >= 2)
               {
                  outputText("缓慢的抽插让你的乳房摇晃起来，吸吮你乳头的小恶魔紧紧抓住你肿胀得可怕的" + get_player().allBreastsDescript() + "。自从这些小恶魔把毒液注入你的体内后，你的" + get_player().biggestBreastSizeDescript() + "已经长大了三个罩杯。一阵疼痛从你乳房的深处开始，一直蔓延到你酸痛的[nipple]。当你原本就肿胀的乳头在小恶魔的吸吮下进一步膨胀时，你喘息着，第一股乳汁溢入他们的口中。骑在你身上的小恶魔伸出手开始挤奶，他的手在你的" + get_player().allBreastsDescript() + "之间移动，为他的同伙挤出更多的乳汁。[pg]");
               }
               outputText("大个子小恶魔在抽插时磨蹭着臀部，用他肉棒上的凸起摩擦着你" + get_player().vaginaDescript(0) + "的每一个部位。当他在你体内进出那根变异的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "时，小恶魔的手在你的阴阜上揉搓，在占有你时将它扒开或用力夹紧。随着他的抽动，你的淫液在他的肉棒上冒着热气，滚烫的先列腺液顺着你的股沟滴落，并且");
               if(get_player().cockTotal() > 0)
               {
                  outputText("流过你的[cocks]，在那里它");
               }
               outputText("滴在地上。");
               if(get_player().cor < 50)
               {
                  outputText("这根巨大的肉棒撑开你时的痛苦是压倒性的，但每一次抽插都会将更多堕落的先列腺液摩擦进你的阴道壁。当小恶魔强暴你，利用你的身体来满足他自己的快乐时，你开始喘息。当他先列腺液的热量浸透你的身体时，你颤抖起来。巨大的肉棒迫使你的[clit]暴露出来，溅在上面的滚烫液体让它产生几乎痛苦的刺痛感。你痛苦的呜咽和呻吟开始带上不同的语调，小恶魔首领开始加快操你的速度。");
               }
               else
               {
                  outputText("当巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "撑开你，将先列腺液摩擦进你冒着热气的小穴时，痛苦和快乐融为一体。当大个子小恶魔操你时，你呻吟着，变成了一个没有思想的性爱木偶。当滚烫的汁液溅在上面时，你的[clit]痛苦地肿胀起来。你颤抖的身体只会增加小恶魔首领的快乐。");
               }
               outputText("[pg]");
               outputText("当大个子小恶魔一次又一次地用他的肉棒刺穿你时，其他小恶魔继续在你身上打飞机。他们的先列腺液开始溅在你的身上，当他们看着你的高潮积聚时，他们喘息着。");
               if(get_player().biggestTitSize() > 1)
               {
                  outputText("小恶魔们大口吞咽着从你肿胀的" + get_player().biggestBreastSizeDescript() + "中流出的乳汁。当一个小恶魔喝饱了，挺着晃荡的肚子摇摇晃晃地走开时，另一个小恶魔走上前来，挤压你喷射乳汁的乳房。");
               }
               if(get_player().cockTotal() > 0)
               {
                  outputText("当粗暴的操弄将血液泵入你的腹股沟时，你的[cocks]痛苦地肿胀起来。");
               }
               outputText("大个子小恶魔的蛇信子弹出来，在你的" + get_player().vaginaDescript(0) + "周围滑动，拉扯着你的阴唇。他的舌头在你冒着热气的小穴两侧来回移动，交替着拉伸和弹拨阴唇。");
               if(get_player().totalCocks() > 0)
               {
                  outputText("他收回舌头，将其缠绕在你的[cock]上，顺着你的肉棒滑动，并在你的龟头上弹拨。");
               }
               outputText("你随着大个子小恶魔的抽插喘息着，当他的肉棒或舌头碰到敏感点时，你会发出呜咽声。");
               if(get_player().cor < 50)
               {
                  outputText("你正在被恶魔强暴，像母牛一样被挤奶，而且你马上就要迎来猛烈的高潮。这片堕落的土地已经在你身上留下了印记。");
               }
               else
               {
                  outputText("这片堕落的土地已经在你身上留下了印记。在你来到这里之前，你绝对无法承受这么大的肉棒。");
               }
               outputText("当你走向高潮时，你呻吟着。[pg]");
               if(get_player().biggestTitSize() > 3)
               {
                  outputText("你的乳房在胸前随着粗暴的抽插前后摇晃。你弓起背，将你的[nipple]压入急切的嘴里，当骑在你身上的人挤奶你肿胀的" + get_player().allBreastsDescript() + "时，你呻吟出声。");
               }
               if(get_player().cor < 50)
               {
                  outputText("你心中仍有一丝羞耻感，当想要像母牛一样<i>哞哞</i>叫的冲动升起时，你呜咽着咬紧了牙关。");
               }
               else
               {
                  outputText("在被操弄和挤奶时，你不知羞耻地呻吟着，那呻吟逐渐变成了长长的、充满狂喜的<i>哞哞</i>声。");
               }
               outputText("[pg]");
               outputText("首领小恶魔拼尽全力地撞击着你，将他的" + get_monster().cockDescriptShort(1) + "深深地插入你的小穴。他的喘息声越来越急促。骑在你身上的小恶魔将他的肉棒在你的背上摩擦，龟头在你的头发里蹭来蹭去。他一边喘气，一边轻咬你的脖子和肩膀。首领小恶魔不断地撞击你，你能感觉到他的" + get_monster().ballsDescriptLight() + "在拍打你时肿胀起来。在即将高潮的迷离中，你意识到接下来会发生什么。那对巨大的睾丸即将把比任何正常男人能产生的都要多的精液泵入你的体内。他们要把恶魔的精液直接射进你的子宫里。");
               if(get_player().cor < 50)
               {
                  outputText("你尖叫起来，因为他" + Appearance.cockNoun(CockTypesEnum.HORSE) + "的根部因腐化的精液而膨胀，那粗大的凸起在小恶魔的肉棒上泵动时，将你的小穴撑得更开。凸起让你的肚子鼓了起来，你能感觉到它穿过你被撑开的小穴，向你的子宫移动。首领小恶魔的肉棒根部又形成了一个粗大的凸起，你疯狂地挣扎，大声抗议。[say: 不——不——不——啊啊啊！] 滚烫的精液涌入你的子宫，你也达到了高潮，身体颤抖着，你的" + get_player().vaginaDescript(0) + "紧紧夹住他的肉棒，榨取出一波又一波的精液。紧接着又是一次高潮，随着更多恶魔精液涌入你的子宫，你猛地挺起腰。你大口喘着气，随着肚子隆起，你继续高潮。即使他把更多腐化的精液泵入你的体内，这只巨大的小恶魔仍在强暴你，迫使你在从上一次高潮中平息下来之前，再次达到顶峰。");
               }
               else
               {
                  outputText("一想到子宫里装满了恶魔的精液，你就彻底崩溃了。你猛烈地高潮，臀部迎合着那根将滚烫精液泵入你肚子里的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "。你翻着白眼，在狂喜中尖叫，浓稠的精液喷射而出，填满了你的小穴。小恶魔一边用精液填满你的子宫，一边继续在他的性玩具体内抽插，迫使你在从上一次高潮中平息下来之前，再次达到顶峰。这只巨大的小恶魔现在是你的主人了。");
               }
               outputText("当高潮席卷全身时，你几乎要晕厥过去，你尖叫到嗓子沙哑，高潮折磨着你的身体，随着子宫的肿胀，你翻起了白眼。[pg]");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("当高潮折磨着你的身体时，你的乳房泵出更多的乳汁，多到下面的小恶魔都应付不过来。乳汁顺着你的胸膛大量流下，浸湿了小恶魔，溅到了你下方的地面上。从你娇嫩的[nipple]喷涌而出的乳汁将你推向了另一次高潮。你在高潮时摇晃着乳房，在无脑的快感中哞哞叫着，到处喷射着乳汁。骑在你身上的小恶魔高潮了，小恶魔的精液喷射而出，浸湿了你的[hair]，顺着你的头皮流下，流过你的脸颊。");
               }
               if(get_player().cor >= 50)
               {
                  outputText("你急切地舔舐着咸咸的精液，尽可能多地舔食和吞咽。");
               }
               outputText("[pg]");
               outputText("小恶魔的精液如雨点般落在你无助痉挛的身体上。小恶魔们把精液喷在你的头发上，喷在你的背上和[hips]上，喷在你的脸上");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("，以及弹跳的" + get_player().allBreastsDescript());
               }
               outputText("。[monster.short]不再按住你。他们在你身上自慰，而你用手抓挠着地面，蹄子在地上摩擦，大腿紧紧夹住那只巨大的小恶魔。又一股恶魔精液的脉动击中了你的子宫。你向后推挤你的主人，尽可能多地把他的肉棒吞入体内。你弓起背，翻着白眼，随着子宫痛苦地扩张，你发出哞哞的叫声，最后一次高潮席卷了你被精液胀满的身体。你围绕着刺穿你的肉棒痉挛，挣扎着，同时");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("乳汁从你的[nipple]喷涌而出，并且");
               }
               outputText("热气腾腾的液体从你过度充盈的小穴中喷涌而出。在这最后一次高潮之后，你很快就失去了意识，即使你的身体仍在颤抖，你的大脑也已经停止了运转。[pg]");
               outputText("你后来醒了，身体仍在抽搐，微小的高潮在你的" + get_player().vaginaDescript(0) + "中闪烁。外面天还是黑的。你侧躺在一滩冷却的精液、乳汁和爱液中。你的身体上覆盖着长条状正在变干的小恶魔精液，你的头发紧贴在地面上。没有那群小恶魔或他们巨大主人的踪影。你的皮肤在依然因乳汁而肿胀的乳房上被撑得紧绷发亮。你的肚子紧绷而隆起，就像一匹即将分娩的母马。它随着你" + get_player().vaginaDescript(0) + "的血肉痉挛而颤抖。越过你隆起的肚子曲线，你可以看到双腿之间升腾起蒸汽。你开始再次陷入昏迷。");
               if(get_player().cor < 50)
               {
                  outputText("你最后的清晰念头是找到一种方法更好地隐藏你的营地，这样这种事就不会再发生了。");
               }
               else
               {
                  outputText("你最后的清醒念头是想办法制造属于你自己的变异首领小恶魔，也许甚至是一整个马厩的他们……");
               }
               if(_loc2_)
               {
                  get_player().orgasm("Tits");
               }
               else
               {
                  get_player().orgasm("Generic");
               }
               dynStats(DynStat.Lib(2),DynStat.Cor(3));
               get_player().knockUp(1,418);
            }
            else
            {
               if(get_player().hasStatusEffect(StatusEffects.ImpGangBang))
               {
                  if(get_player().cor < 50)
                  {
                     outputText("你分不清这是否和上次是同一群[monster.short]。你不是种族主义者，但在你看来所有小恶魔都长得一样。[Themonster]向前涌来，抓住你的胳膊和腿，双手在你的身体上游走。你挣扎着，但他们数量太多，根本无法反抗。结果和上次一样……[pg]");
                  }
                  else
                  {
                     outputText("他们也该出现了。在这些岩石里又没多少事可做，你都快无聊死了。你两手各抓着一根小恶魔的鸡巴，张开双腿，任由其他小恶魔摸索你的大腿……[pg]");
                  }
               }
               outputText("小恶魔群扑向你，抓住你的手臂，而你");
               if(get_player().cor < 50)
               {
                  outputText("疯狂地挥舞着你的[weapon]，决心不让他们得逞");
               }
               else
               {
                  outputText("在他们的抓握中扭动挣扎，决心让他们为自己的乐趣付出代价");
               }
               outputText("！你向后踢去，感觉到你的蹄子砸在一个小恶魔的胸口，把他踢飞了。但是[monster.short]抓住了你的腿，更多的小恶魔抓住了你的手臂。这群小恶魔把你拖到地上的一根旧圆木旁，你拼命挣扎着。[pg]");
               outputText("你的人类躯干被[monster.a]拖到圆木上，另外两只小恶魔跳到你的背上。[monster.short]迅速解开带子，扒光了你的[armor]。");
               if(get_player().biggestTitSize() >= 1)
               {
                  outputText("你那不受束缚的" + get_player().biggestBreastSizeDescript() + "在风化的圆木上弹跳着。");
               }
               outputText("小恶魔们把你的手臂张开，强迫你挺起胸膛，用满是汗水的缠腰布把你的手臂绑在圆木上。你的[hips]高高撅起。小恶魔们用他们满是汗水的肉棒和" + get_monster().ballsDescriptLight() + "在你的腿上摩擦，并抚摸你的胯部。骑在你背上的两只小恶魔开始互相抚摸和舔舐。");
               if(get_player().cor < 50)
               {
                  outputText("当他们把注意力转向彼此，用手和舌头在对方的肉棒上动作时，你的脸因屈辱而涨得通红。这些恶魔怎么敢把你当成满足他们欲望的床？！");
               }
               else
               {
                  outputText("当他们把注意力转向彼此，用手和舌头在对方的肉棒上动作时，你的脸因愤怒而涨得通红。你为了这具完美的身体付出了那么多努力，现在他们居然不用它？！");
               }
               outputText("[pg]");
               outputText("一只小恶魔迅速爬上你的身体，把脚踩在你的肩膀上，一只手抓住你的[hair]作为支撑。他把他的" + get_monster().ballsDescriptLight() + "在你的嘴上摩擦，把麝香味的汗水涂在你的嘴唇上，同时用另一只手撬开你的下巴。");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("一只小恶魔爬上圆木，把他的" + get_monster().cockDescriptShort(0) + "拍在你的" + get_player().allBreastsDescript() + "之间，紧紧地挤压着他的肉棒，来回摩擦。他残忍地蹂躏着你的乳房，把手指深深地挤进你柔软的肉里。");
               }
               if(get_player().cockTotal() == 1)
               {
                  outputText("一只小恶魔钻到你的身下，抓住你的[cock]。他灵活的舌头在你的龟头上弹动，同时用他小小的爪子刺着你的肉棒。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("两只小恶魔钻到你的身下，抓住你的[cocks]，用他们那非人般灵活的舌头舔舐着龟头，同时抚摸着肉棒。");
               }
               if(get_player().cor < 50)
               {
                  outputText("你努力挣脱后腿，想把背上的小恶魔甩下来，而满是汗水的手在你的胯部滑动。当锋利的爪子刺向你敏感的肉体时，你咬紧牙关发出呜咽声。[pg]");
               }
               else
               {
                  outputText("你在小恶魔的抓握中扭动，沉浸在小爪子和牙齿咬你敏感胯部时的感觉中。你舔着悬挂在你嘴上方的肿胀睾丸上的咸味麝香。[pg]");
               }
               outputText("[pg]");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("操你" + get_player().biggestBreastSizeDescript() + "的小恶魔粗暴地对待你柔软的肉体，按压和拉扯你的乳房，为他的恶魔肉棒弄出一条通道。其他小恶魔拍打你的" + get_player().allBreastsDescript() + "，在你大叫时大笑。");
               }
               if(get_player().cor < 50)
               {
                  outputText("当[monster.short]拍打你的胸部和侧腹时，你因受虐的肉体上数十处针扎般的抓伤和咬伤而呜咽。虐待从四面八方落到你身上，让你无处可逃。你肩膀上的小恶魔撬开你的下巴，你被他的" + get_monster().ballsDescriptLight() + "塞住了嘴。");
               }
               else
               {
                  outputText("你急切地吸吮着嘴里的麝香味睾丸。虐待从四面八方落到你身上，小恶魔们在咬和抓你时，在你的皮肤上留下微小的痕迹。当小手拍打你的胸部和侧腹时，你高兴地呜咽着。");
               }
               outputText("[pg]");
               get_images().showImage("gangbang-loss-centaur");
               outputText("伴随着一声响亮的吸吮声，小恶魔把他的睾丸从你嘴里拔了出来。当他重新调整姿势，几乎完全弯腰在你的肩膀上，把他的龟头在你的嘴唇上摩擦时，口水和睾丸汗滴在你的脸颊上。当先列腺液滴入你的嘴里并顺着你的喉咙流下时，你几乎窒息了。" + get_monster().cockDescriptShort(0) + "挡住了你大部分的视线，但在你的眼角，你看到这群小恶魔的主人走上前来。他身高四英尺，比这群小恶魔中的任何一个都要宽阔强壮，有着" + (get_noFur() ? "毛茸茸的狗耳朵" : "一张像狗又像小恶魔的脸") + "，这个新的小恶魔有着黑色的皮毛" + (get_noFur() ? "覆盖着他的小腿" : "") + "，宽大的红色恶魔翅膀，头上长着两根长长的恶魔角，还有一根大到足以让牛头人窒息的" + Appearance.cockNoun(CockTypesEnum.DOG) + "。他色眯眯地看着你无助的身体，抓住了");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("你那酸痛的" + get_player().biggestBreastSizeDescript() + "中的一个，用他长满老茧的手残忍地把手指按进你的肉里");
               }
               else
               {
                  outputText("你的尾巴，猛地一拽，粗暴地拉扯着它");
               }
               outputText("，直到你尖叫出声。骑在你肩膀上的小恶魔将他的" + get_monster().cockDescriptShort(0) + "插入你的嘴里，在你的喉咙深处猛烈抽插。[pg]");
               outputText("首领小恶魔走回你的臀部，用锋利的爪子轻轻划过你的侧腰。他一脚踢开另一只小恶魔，在你的[hips]后面站定。他掏出那根长得离谱的" + Appearance.cockNoun(CockTypesEnum.DOG) + "，将龟头在你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("。");
               if(get_player().cockTotal() > 0)
               {
                  outputText("先列腺液从宽大的龟头上滴落，一直流到你的[cocks]根部。");
               }
               outputText("大个子小恶魔滚烫的先列腺液刺痛了你的肌肤。正在舔弄你胯下的小恶魔们舔舐着这滚烫的液体，用他们的唾液为你降温。当你呜咽时，大个子小恶魔冷笑了一声，将他的" + Appearance.cockNoun(CockTypesEnum.DOG) + "龟头抵在你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("。");
               if(get_player().cor < 50)
               {
                  outputText("你试图躲开在你的穴口摩擦的滚烫龟头，但[monster.short]紧紧地抓住了你。");
               }
               else
               {
                  outputText("从" + Appearance.cockNoun(CockTypesEnum.DOG) + "上散发出的麝香味让你发狂，你向后顶去，试图吞下那根龟头。");
               }
               outputText("[pg]");
               outputText("首领小恶魔那尖锐的" + Appearance.cockNoun(CockTypesEnum.DOG) + "龟头猛地插入你的穴中，将你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("撑得大开。当那根堕落的狼鸡巴在你的穴里越插越深时，你含着操弄你喉咙的肉棒呻吟出声。那根烫得惊人的肉棒一寸寸地占据你的肉体，强行深入到任何正常人类都无法承受的深度。被绑在圆木上的你只能在痛苦中颤抖，大个子小恶魔粗大的肉结撞上了你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("。");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("操着你酸痛的" + get_player().biggestBreastSizeDescript() + "的小恶魔把一大股精液射在你的乳房上。他从圆木上摔了下来，另一个小恶魔跳上来接替他的位置。");
               }
               outputText("[pg]");
               outputText("那只大个的小恶魔粗暴地操着你，他那长着爪子的手紧紧抓住你的[hips]，将他的" + Appearance.cockNoun(CockTypesEnum.DOG) + "狠狠地捣入你的体内。他那变异的肉棒头部猛烈地撞击着");
               if(get_player().hasVagina())
               {
                  outputText("你的子宫口");
               }
               else
               {
                  outputText("你的肠道深处");
               }
               outputText("，同时肉结也狠狠地撞击着你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("。每一次用力的抽插都把你撞在圆木上，你随着肉棒在你洞里活塞运动的节奏发出闷哼。[pg]");
               if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
               {
                  get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
               }
               outputText("这只小恶魔头领似乎操了你几个小时，他那狗一样的肉结不断撞击着你酸痛的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("，每抽插几下就拍打一下你的屁股，提醒你谁才是老大。一个小恶魔接着一个小恶魔用他们的肉棒撑开你的喉咙，用恶魔的种子填满你的肚子，这群恶魔轮流强暴着你的脸。");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("粗暴的操弄让你沾满精液的乳房不断摇晃，操着你" + get_player().allBreastsDescript() + "的小恶魔紧紧抓着你红肿的乳肉。当这只[monster.short]像打鼓一样拍打你的乳房时，你的" + get_player().biggestBreastSizeDescript() + "痛得像火烧一样。");
               }
               if(get_player().cor < 50)
               {
                  outputText("你又一次被恶魔强暴了，像烤乳猪一样被肉棒刺穿，而你却能感觉到自己的欲望在不断攀升。这片堕落的土地已经在你身上留下了印记。");
               }
               else
               {
                  outputText("这片堕落的土地已经在你身上留下了印记。在你来到这里之前，你绝对无法承受这么大的肉棒。");
               }
               outputText("[pg]");
               if(get_player().cor < 50)
               {
                  outputText("当强暴你喉咙的肉棒灌入浓稠的");
               }
               else
               {
                  outputText("你贪婪地吞咽着撑开你喉咙的肉棒射出的浓稠精液，努力蠕动喉咙迫使更多的");
               }
               outputText("精液进入你肿胀的肚子。小恶魔把他的肉棒尽可能深地插进你的喉咙，用他的" + get_monster().ballsDescriptLight() + "拍打你的脸。他射精的时间长得不可思议，一股股精液涌入你的体内。你能感觉到你的胃被撑大了，但你更担心的是呼吸。你的视线边缘开始变红，你的胸膛剧烈起伏，努力争取空气。最后，小恶魔把他的肉棒从你的喉咙里拔了出来，把最后几滴精液喷在你的脸上，你大口大口地喘着粗气。突然涌入的氧气把你推向了高潮，你猛烈地高潮了。你的双手在空中乱抓，眼睛翻白，身体扭曲着迎合那根捣入你体内的恶魔" + Appearance.cockNoun(CockTypesEnum.DOG) + "。你尖叫着，你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("在刺穿它的滚烫肉柱上痉挛。当你尖叫时，另一个小恶魔把肉棒塞进你嘴里，你的喉咙在它的龟头周围抽搐。");
               if(get_player().cockTotal() > 0)
               {
                  outputText("你的[cocks]将精液射在地上，射进舔着你胯部的小恶魔们张开的嘴里。");
               }
               outputText("[pg]");
               outputText("另一根小恶魔的肉棒在你的喉咙里痉挛，它的主人深深地插入了你。他用非人量的精液淹没了你已经肿胀的胃。当恶魔把精液注入你体内时，你再次感到自己快要晕过去了。他拔了出来，当你喘息着呼吸时，你再次高潮了。当你呻吟和喘息时，另一只小恶魔把他的肉棒塞进你的喉咙。你的身体在大恶魔的" + Appearance.cockNoun(CockTypesEnum.DOG) + "上因快感而颤抖。大恶魔紧紧抓住你的[hips]，嚎叫着把他的肉棒猛地插进你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("。他那异常巨大的肉结撑开了你洞口的边缘，再次狠狠地撞进你的体内。");
               if(get_player().cor < 50)
               {
                  outputText("你含着撑开你喉咙的小恶魔肉棒嚎叫着。肿胀的肉结撑开了你的洞，远远超出了你以前所能忍受的程度。你剧烈的挣扎把小恶魔从你的背上甩了下来，你徒劳地扭动着，随着肿胀的" + Appearance.cockNoun(CockTypesEnum.DOG) + "更深地插入你体内而挣扎。");
               }
               else
               {
                  outputText("大恶魔肿胀的肉结撑开了你的入口，伴随着一声响亮的<i>噗</i>声插入了你的洞里。当" + Appearance.cockNoun(CockTypesEnum.DOG) + "更深地撞击你时，另一次高潮击中了你。你含着撑开你喉咙的小恶魔肉棒嚎叫着，随着高潮的震颤而扭动。你剧烈的挣扎把小恶魔从你的背上甩了下来，把你的臀部撞向大恶魔，把他推得更深。");
               }
               outputText("大小恶魔在射精时再次嚎叫起来，每一波滚烫的恶魔精液都让他的肉结和肉棒撑得更大。他那不断喷精的" + Appearance.cockNoun(CockTypesEnum.DOG) + "深深地插到了你的");
               if(get_player().hasVagina())
               {
                  outputText("子宫");
               }
               else
               {
                  outputText("肠道");
               }
               outputText("深处，他注入你体内的精液量似乎比他的蛋蛋能装下的还要多。你的肚子随着每一次精液的喷射而膨胀，你含着喉咙里的另一根肉棒尖叫着。[pg]");
               if(get_player().biggestTitSize() > 2)
               {
                  outputText("骑在你" + get_player().biggestBreastSizeDescript() + "上的小恶魔射精了，他的精液消失在从你被虐待的乳房上滴落的精液洪流中。");
               }
               outputText("你的主人还没有放过你，他那" + Appearance.cockNoun(CockTypesEnum.DOG) + "的肉结在你的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("里搅动着他的" + Appearance.cockNoun(CockTypesEnum.DOG) + "肉结，同时继续射精。你被两端灌满了恶魔的精液，一只小恶魔把精液射在你的喉咙里，另一只小恶魔走上前来代替他的位置。你在自己无尽的高潮中颤抖着，被撑开的洞里的快感与肿胀的肚子的痛苦混合在一起。当大恶魔在你被可怕地撑开的");
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               else
               {
                  outputText(get_player().assholeDescript());
               }
               outputText("里移动他巨大的肉结时，你的手指抓挠着圆木。当你感觉到更多的恶魔精液顺着他的肉棒进入你已经巨大的肚子时，你的双腿发软了。[pg]");
               outputText("当又一波堕落的精液喷射进你的穴里，又一股小恶魔的精液灌进你的喉咙，在中间某处汇合时，你晕了过去……[pg]");
               outputText("你醒来时，身体仍在因微小的高潮而颤抖。你呼吸时，嘴里的精液发出咕噜声，你的[hair]被精液浸透了。自从你晕倒后，你就没有动过。你的手臂仍然被绑在圆木上，");
               if(get_player().biggestTitSize() >= 1)
               {
                  outputText("你那布满瘀伤、隐隐作痛的乳房紧贴着粗糙的木头，");
               }
               outputText("你的身体躺在一滩逐渐冷却的精液中。即使你的[legs]感觉更有力气，你也动弹不得。你那可怕地胀大的肚子把你压得喘不过气来，随着每一次高潮的抽搐而颤抖。你那胀大的肚皮紧绷得像鼓面一样，闪闪发光。当你再次陷入昏迷时，最后一个念头在你的脑海中闪过。");
               if(get_player().cor < 50)
               {
                  outputText("当你的身体被这片土地上居民的病态欲望扭曲得如此可怕时，你还能在这片堕落的土地上坚持多久？");
               }
               else
               {
                  outputText("既然你才刚刚体验到这片土地所能提供的乐趣的皮毛，为什么还要去管你那愚蠢的任务呢？[pg]");
               }
               get_player().orgasm("VaginalAnal");
               dynStats(DynStat.Lib(2),DynStat.Cor(3));
               get_player().knockUp(1,418);
               if(get_player().hasVagina())
               {
                  if(get_player().cuntChange(get_monster().cockArea(2),true))
                  {
                     outputText("[pg]");
                  }
               }
               else if(get_player().buttChange(get_monster().cockArea(2),true))
               {
                  outputText("[pg]");
               }
            }
         }
         else if(Utils.rand(2) == 0 && (get_player().cockTotal() == 0 || get_player().get_gender() == 3))
         {
            if(!get_player().hasStatusEffect(StatusEffects.ImpGangBang))
            {
               outputText("这些小恶魔身高在[if (metric) {半米到一米多|两到四英尺}]英尺之间，骨瘦如柴，长着小小的恶魔翅膀。它们红橙相间的皮肤很脏，黑色的头发看起来油腻腻的。有些是裸体的，但大多数都穿着破烂的缠腰布，几乎无法遮掩它们的腹股沟。它们都有一根像男人的手臂一样长而粗的" + get_monster().cockDescriptShort(0) + "，对它们的身体来说太大了。看着一个小恶魔被它的" + get_monster().cockDescriptShort(0) + "绊倒会很有趣，如果你没有被一群从四面八方逼近的色眯眯的小恶魔包围的话……[pg]");
               get_player().createStatusEffect(StatusEffects.ImpGangBang,0,0,0,0);
            }
            outputText("就在你准备好你的[weapon]时，小恶魔们向前扑来，一个满身是汗的小恶魔紧紧抓住你的手臂");
            if(!get_player().get_weapon().isAttached())
            {
               outputText("而另一个则把你的武器踢得远远的");
            }
            outputText("。" + Utils.cnName(get_monster().get_short()) + "向前涌来并抓住了你。小恶魔们摸索着你的身体，把他们的" + get_monster().cockDescriptShort(0) + "在你的腿上蹭来蹭去，把他们的汗水和先列腺液涂抹在你的[skindesc]上。其余的[monster.short]，十几个或更多的小恶魔，都色眯眯地看着你，一边拍打和捏你的身体一边大笑。小恶魔有锋利的爪子、细小锋利的牙齿，头上还有短角。当他们试图把你拉倒在地时，他们用所有这些武器抓、挠、咬你。一个大胆的小恶魔向前跳跃并抓住了你的");
            if(get_player().cockTotal() > 0)
            {
               outputText(get_player().cockDescript(0));
            }
            else
            {
               outputText(get_player().nippleDescript(0));
            }
            outputText("，用力扭捏，让你痛得叫出声来。[monster.short]散发着汗水和先列腺液的臭味，他们湿润的抓握和淫秽的笑容让你毫不怀疑，如果你输掉这场战斗，他们会对你做什么。[pg]");
            outputText("[Themonster]压倒了你，用绝对的数量把你拖到地上。你的每条肢体上至少有两个小恶魔，把你呈大字型按在冰冷的地上，而其他小恶魔则抚摸着你的身体。");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("小恶魔们包围了你的胸部，把他们的" + get_monster().cockDescriptShort(0) + "拍打在你的" + get_player().allBreastsDescript() + "上，把他们滑溜溜的先列腺液揉进你的[nipple]里。");
            }
            outputText("其他人站在你的头顶，他们的鸡巴在离你脸几英寸的地方上下晃动，一边打飞机。一股浓烈的麝香味从他们的鸡巴上飘散出来，这种气味让你的鼻窦发痒。另外两个小恶魔在你两腿之间就位，把他们的鸡巴沿着你的大腿滑动，同时抚摸你的" + get_player().vaginaDescript(0) + "并弹拨你的[clit]。");
            if(get_player().cockTotal() > 0)
            {
               outputText("一个小恶魔用手摩擦他的龟头，涂满了他的先列腺液。他用手摩擦你的[cocks]，当他的体液浸透你时，你的阴茎皮肤感到一阵刺痛。");
            }
            outputText("[pg]");
            outputText("当你的乳头变硬，你的小穴变湿时，[monster.short]淫荡地窃笑。你两腿之间的一个小恶魔把他的肉棒沿着你的阴唇滑动，用他的龟头挑逗你的[clit]。");
            if(get_player().cor < 50)
            {
               outputText("你重新开始挣扎，试图挣脱俘虏你的人。他们只是大笑，并更用力地压在你身上。");
            }
            else
            {
               outputText("你挺起臀部，试图用你的" + get_player().vaginaDescript(0) + "套住他的" + get_monster().cockDescriptShort(0) + "。");
            }
            outputText("在它插进你之前，这只小恶魔被你见过的最大的一只小恶魔推开了。[pg]");
            get_images().showImage("gangbang-loss-human");
            outputText("这个新出现的小恶魔身高四英尺，比你见过的任何小恶魔都要宽阔和健康，脸庞一半像牛一半像小恶魔，有着斑驳的灰色皮肤，宽大的紫色恶魔翅膀，头上长着两根弯曲的牛角，还有一根大到足以让牛头人窒息的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "。它蘑菇状的头部就在他的嘴下晃动，他蛇一样的舌头伸出来，将龟头上的一点先列腺液舔掉，滴在你的腹股沟上。当滚烫的液体刺痛你" + get_player().vaginaDescript(0) + "敏感的皮肤时，你浑身发抖。");
            if(get_player().cockTotal() > 0)
            {
               outputText("和[cocks]");
            }
            outputText("。它的" + get_monster().ballsDescriptLight() + "每个都有你的拳头那么大，上面满是汗水。它将它满是汗水的睾丸拍打在你的" + get_player().vaginaDescript(0) + "上，那热度几乎要将你烫伤。");
            if(get_player().cor < 33)
            {
               outputText("你尖叫着扭动臀部，想要躲避那股热量。");
            }
            outputText("它抓住你的臀部，慢慢地将它的肉棒顺着你的小穴拖下，它那恶魔般滚烫的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "的每一道隆起都撞击着你的阴蒂，拉扯着你的阴唇。最后，它那宽大的像马一样的龟头勾住了你的[clit]，滚烫的先列腺液滴落在你敏感的肉体上。当你呜咽时，这只巨大的小恶魔冷笑着，将它的龟头拖到你" + get_player().vaginaDescript(0) + "的开口处。其他的小恶魔看着，一边抚摸着自己，一边看着它们的主人将臀部向后拉，准备插进你体内。[pg]");
            if(get_player().cor < 50)
            {
               outputText("你大声呼救");
            }
            if(get_player().cor >= 50)
            {
               outputText("你因欲望而呻吟");
            }
            outputText("当那根热得不似人类的龟头撑开你的阴唇时，你的哭喊声消失在上方黑暗的天空中。两只小恶魔抓住你的头发，把你的头拉起来，强迫你看着它们的主人将它那堕落的肉棒插进你体内。其他的小恶魔将你的[legs]张得更开，让你在巨大的小恶魔将它肿胀的肉棒滑入你的" + get_player().vaginaDescript(0) + "时无能为力。当滚烫的肉体几乎要烧伤你敏感的小穴时，你扭动着身体，反抗着按住你的小恶魔。你能闻到它肉棒上蒸发出的热汗，当它强行将龟头插进你的" + get_player().vaginaDescript(0) + "时，你的爱液也开始蒸发。它巨大的龟头让你的腹股沟鼓了起来，你看着");
            if(get_player().cor < 50)
            {
               outputText("在无助的恐惧中，看着那凸起从你腹股沟的底部一寸寸地向你的胃部移动。当那根巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "一寸寸地撑开你的肚子时，你发出一声痛苦的颤抖的呻吟");
            }
            else
            {
               outputText("在欲望中喘息着，因为那根巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "推开你的肉体，为自己腾出空间");
            }
            outputText("。");
            get_player().cuntChange(get_monster().cockArea(1),true);
            outputText("[pg]");
            outputText("你能感觉到它肉棒上的每一道隆起和跳动的静脉都在拉扯着你被撑开的小穴内壁。你无助地在那根巨大的肉棒周围颤抖，完全被小恶魔变异的牛鞭刺穿了。[pg]");
            outputText("它心脏的每一次跳动都会让它的肉棒抽动，让你随着肉棒在你小穴里的跳动而颤抖。小恶魔们嘲笑你，在你颤抖的身体上自慰。巨大的小恶魔弯曲它的大腿，它龟头的凸起在你的肚子里高高弹起。其他的小恶魔笑着，看着你");
            if(get_player().cor < 50)
            {
               outputText("呜咽着，当滚烫的肉棒压在新的区域时痉挛着");
            }
            else
            {
               outputText("在快感中呻吟，转动你的臀部，迎合这根不可思议的肉棒");
            }
            outputText("在你被塞满的" + get_player().vaginaDescript(0) + "里。巨大的小恶魔冷笑着，再次弹动它的肉棒，看着");
            if(get_player().biggestTitSize() >= 3)
            {
               outputText("当你扭动时，你的" + get_player().allBreastsDescript() + "在你的胸前滚动");
            }
            else
            {
               outputText("当你扭动时，你的眼睛翻白");
            }
            outputText("。");
            if(get_player().cockTotal() > 0)
            {
               outputText("当你颤抖时，你的[cocks]拍打着你隆起的腹部。");
            }
            outputText("[pg]");
            outputText("最后，大个子小恶魔拔出了他的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "，当他滑出时，每一道凸起都拉扯着你的阴道肉。一个小恶魔伸出手，在它拔出时拍打着那凸起，让你尖叫并挣扎。");
            if(get_player().cockTotal() > 0)
            {
               outputText("当凸起从下面经过时，你的[cocks]弹跳着。");
            }
            outputText("当蘑菇头到达你的" + get_player().vaginaDescript(0) + "入口时，你呻吟着，你被撑开的阴道肉慢慢恢复正常。小恶魔首领再次向前推进，用他那巨大的肉棒重新占据了你的小穴。");
            if(get_player().cor < 50)
            {
               outputText("你试图把臀部往后拉，挣扎着想要挣脱，因为他龟头的凸起一直顶到了你的腹部深处。你被太多的小恶魔按住了。你只能在撑开你" + get_player().vaginaDescript(0) + "的滚烫肉棒周围扭动。你的头被两个小恶魔固定住，当他们的首领强暴你时，你甚至无法移开视线。大个子小恶魔咕哝着，他的龟头顶过了你的子宫颈，你在痛苦中呻吟颤抖。");
            }
            else
            {
               outputText("当滚烫的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "深深地插入你的" + get_player().vaginaDescript(0) + "时，你在狂喜中呻吟，把你小穴的每一寸都变成了这个大个子小恶魔的快乐护套。你知道你只不过是这个堕落生物的性玩具，只是一个让他用精液填满的湿润小穴，当他强行将他巨大的龟头顶过你的子宫颈时，这个想法几乎让你高潮。");
            }
            outputText("最后，堕落的肉棒顶到了你的子宫。小恶魔再次拔出，开始慢慢地操你。[pg]");
            outputText("大个子小恶魔在抽插时磨蹭着他的臀部，将他的肉棒凸起摩擦着你" + get_player().vaginaDescript(0) + "的每一个部位。当他将变异的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "在你体内滑进滑出时，小恶魔用手沿着你的阴阜摩擦，在占有你时将其拉开或强行夹紧。当他抽插时，你的爱液从他的肉棒上蒸发，滚烫的先列腺液顺着你的股沟滴落到你的[asshole]上。");
            if(get_player().cor < 50)
            {
               outputText("这根巨大的肉棒撑开你时的痛苦是压倒性的，但每一次抽插都会将更多堕落的先列腺液摩擦进你的阴道壁。当小恶魔强暴你，利用你的身体来满足他自己的快乐时，你开始喘息。当他先列腺液的热量浸透你的身体时，你的乳头肿胀起来。巨大的肉棒迫使你的[clit]凸出，溅在上面的滚烫液体让它产生几乎痛苦的刺痛感。你痛苦的呜咽和呻吟开始呈现出不同的音调，小恶魔首领开始更快地操你。");
            }
            else
            {
               outputText("当巨大的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "撑开你，将先列腺液摩擦进冒着热气的小穴时，痛苦和快乐融为一体。当大个子小恶魔操你，把你变成一个没有思想的性爱傀儡时，你呻吟着。当滚烫的汁液溅在上面时，你的[clit]痛苦地肿胀起来。当他先列腺液的热量蔓延到你的全身时，你的[nipple]产生几乎痛苦的刺痛感。");
            }
            outputText("[pg]");
            outputText("当大个子小恶魔一次又一次地用他的肉棒刺穿你时，其他小恶魔继续在你身上打飞机。他们的先列腺液开始溅落在你的身体上，当他们看着你走向高潮时，他们喘息着。");
            if(get_player().biggestTitSize() >= 3)
            {
               outputText("当小恶魔首领粗暴地操你时，你的" + get_player().allBreastsDescript() + "来回弹跳和晃动。");
            }
            if(get_player().totalCocks() > 0)
            {
               outputText("当粗暴的操弄将血液泵入你的腹股沟时，你的[cocks]痛苦地肿胀起来。");
            }
            outputText("大个子小恶魔的蛇信子伸出惊人的长度，缠绕在你的一侧[nipples]上，拉扯着它并拉伸它下面的肉。他在你的乳头之间来回移动他的舌头，交替着拉伸和弹拨它们。");
            if(get_player().cockTotal() > 0)
            {
               outputText("他收回舌头，将其缠绕在你的[cock]上，沿着你的肉棒滑动，并用舌头弹拨你的龟头。");
            }
            else
            {
               outputText("他的舌头向下弹拨到你的[clit]，分叉的舌尖挑逗着你的阴蒂。");
            }
            outputText("你随着大个子小恶魔的抽插节奏喘息着，当他的肉棒或舌头触碰到敏感点时呜咽着。");
            if(get_player().cor < 50)
            {
               outputText("你正在被一个恶魔强暴，被迫接受一根非人的肉棒，而且你马上就要猛烈地高潮了。这片堕落的土地在你身上留下了印记。");
            }
            else
            {
               outputText("这片堕落的土地已经在你身上留下了印记。在你来到这里之前，你绝对无法承受这么大的肉棒。");
            }
            outputText("当你走向高潮时，你呻吟着。[pg]");
            outputText("小恶魔首领拼尽全力地撞击着你，将他的" + get_monster().cockDescriptShort(1) + "深深地插进你的体内。他的喘息声越来越急促。你依然仰着头，看着周围的小恶魔们开始射精。他们将浓稠的精液喷洒在你的身上，溅满了你的肚子");
            if(get_player().biggestTitSize() >= 3)
            {
               outputText("和" + get_player().allBreastsDescript());
            }
            outputText("。小恶魔首领不断地抽插着，你可以看到他的" + get_monster().ballsDescriptLight() + "肿胀起来。在即将到来的高潮的迷雾中，你意识到将要发生什么。那对巨大的睾丸即将把比任何正常男人能产生的还要多的精液泵入你的体内。他们要把恶魔的精液直接泵进你的子宫里。");
            if(get_player().cor < 50)
            {
               outputText("你尖叫起来，因为他的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "根部被堕落的精液胀大，粗大的鼓包在小恶魔的肉棒上泵动时，将你的小穴撑得更开。鼓包让你的肚子肿胀起来，你看着它向你的子宫移动。小恶魔首领的肉棒根部又形成了一个粗大的鼓包，你疯狂地挣扎，大声抗议。[say:不——不——不——啊啊啊！]滚烫的精液涌入你的子宫，你迎来了自己的高潮，身体颤抖着，你的" + get_player().vaginaDescript(0) + "紧紧夹住他的肉棒，榨取出一波又一波的精液。紧接着第一次高潮，又一次高潮袭来，随着更多的恶魔精液涌入你的子宫，你猛地挺起腰。你大口喘着气，随着肚子肿胀，你继续高潮。即使他把更多堕落的精液泵入你的体内，这只巨大的小恶魔仍在强暴你，迫使你在从上一次高潮中平息下来之前，再次达到顶峰。");
            }
            else
            {
               outputText("一想到子宫里充满了恶魔的精液，你就彻底崩溃了。你猛烈地高潮，臀部迎合着" + Appearance.cockNoun(CockTypesEnum.HORSE) + "的抽插，滚烫的精液泵入你的肚子。你翻着白眼，在浓稠的精液注满你的小穴时，尖叫着释放出你的狂喜。小恶魔继续在他的性玩具体内抽插，即使他用精液填满了你的子宫，也迫使你在从上一次高潮中平息下来之前，再次达到顶峰。这只巨大的小恶魔现在是你的主人了。");
            }
            outputText("当高潮席卷全身时，你几乎要晕厥过去，高潮折磨着你的身体，你弓起背离开地面，随着子宫的肿胀，你翻着白眼。[pg]");
            outputText("小恶魔的精液如雨点般落在你无助痉挛的身体上。小恶魔们把精液喷在你的头发上，喷在你肿胀的肚子上，喷在你的脸上");
            if(get_player().cockTotal() > 0)
            {
               outputText("，以及滴着精液的[cock]上");
            }
            if(get_player().biggestTitSize() >= 3)
            {
               outputText("，以及弹跳的" + get_player().allBreastsDescript());
            }
            outputText("。这群[monster.short]不再按住你了。当你在地上用手抓挠，脚趾蜷缩，大腿紧紧夹住那只巨大的小恶魔时，他们在你身上自慰。又一股恶魔精液脉动着击中你的子宫。你用双腿缠住你的主人，尽可能多地把他的肉棒吞入体内。你弓起背，翻着白眼，随着子宫痛苦地扩张，你尖叫起来，最后一次高潮冲击着你被精液胀满的身体。你围绕着刺穿你的肉棒痉挛，在地上挣扎，同时");
            if(get_player().biggestTitSize() >= 3 && get_player().biggestLactation() > 1)
            {
               outputText("乳汁从你的[nipple]喷涌而出，并且");
            }
            outputText("冒着热气的液体从你过度充盈的小穴中喷出。在最后一次高潮之后，你很快就失去了意识，即使你的身体还在颤抖，你的大脑也已经停止了运转。[pg]");
            outputText("你后来醒了，身体还在抽搐，微小的高潮在你的" + get_player().vaginaDescript(0) + "中闪烁。外面天还黑着。你躺在一滩正在冷却的精液和爱液中。你的身体上覆盖着长长的、正在变干的小恶魔精液，你的头发贴在地上。没有那群小恶魔或他们巨大主人的踪迹。你的肚子紧绷而膨胀，就像一个即将分娩的女人。随着你的" + get_player().vaginaDescript(0) + "的血肉痉挛，它在颤抖。在你肿胀的肚子曲线上方，你可以看到双腿之间升起蒸汽。你开始再次陷入昏迷。");
            if(get_player().cor < 50)
            {
               outputText("你最后的清晰念头是找到一种方法更好地隐藏你的营地，这样这种事就不会再发生了。");
            }
            else
            {
               outputText("你最后的清晰念头是找到一种方法，制造你自己的变异小恶魔首领，一个你可以作为性玩具保留的……");
            }
            get_player().orgasm("VaginalAnal");
            dynStats(DynStat.Lib(2),DynStat.Cor(3));
            get_player().knockUp(1,418);
         }
         else
         {
            if(get_player().hasStatusEffect(StatusEffects.ImpGangBang))
            {
               if(get_player().cor < 50)
               {
                  outputText("你分不清这是否和上次是同一群[monster.short]——对你来说，所有的小恶魔看起来都一样。[Themonster]向前涌来，抓住你的[legs]和手臂，双手在你的身体上游走。你挣扎，但他们太多了，无法抗衡。结果和上次一样……[pg]");
               }
               else
               {
                  outputText("他们也该出现了。在这些岩石里又没多少事可做，你都快无聊死了。你两手各抓着一根小恶魔的鸡巴，张开双腿，任由其他小恶魔摸索你的大腿……[pg]");
               }
            }
            outputText("一群小恶魔蜂拥而上，把你拖到地上，同时");
            if(get_player().cor < 50)
            {
               outputText("你疯狂地拳打脚踢，决心不让他们得逞");
            }
            else
            {
               outputText("你在他们的抓取中扭动挣扎，决心不让他们轻易得逞");
            }
            outputText("！他们把你拉倒在一根倒下的圆木上，屁股高高翘起。两只小恶魔坐在你的手臂上，他们的睾丸在你的二头肌上摩擦，双手在你的肩膀和胸部游走。其他小恶魔则拉扯着你的");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("蛇尾，将它们缠绕在圆木上以固定住你。[pg]");
            }
            else
            {
               outputText("[legs]大张，将它们按在圆木上。[pg]");
            }
            outputText("这群[monster.short]三下五除二就脱下了你的[armor]，解开带子，迅速剥光了你。");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("一只小恶魔骑在你的胸口，将他的" + get_monster().cockDescriptShort(0) + "拍在你的" + get_player().allBreastsDescript() + "之间，紧紧夹住他的肉棒，来回摩擦。");
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]被一只小恶魔抓住，他用那非人般灵活的舌头舔舐着龟头，同时撸动着柱身。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("两只小恶魔抓住了你的[cocks]，用他们非人般灵活的舌头舔舐着龟头，同时撸动着柱身。");
            }
            if(get_player().cor < 50)
            {
               outputText("你拼命挣扎，试图抽出手臂，把胸口的小恶魔甩下去，但一双双小手却在你的脸上游走。他们拉扯着你的嘴唇，试图撬开你的下巴");
            }
            else
            {
               outputText("你在小恶魔们的抓握中扭动着，沉浸在被完全掰开、任由这些恶魔摆布的快感中。一双双小手在你的脸上游走，你舔舐并吮吸着他们的手指");
            }
            outputText("。[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("一双双手在你的" + get_player().allBreastsDescript() + "上游走，捏弄拉扯着你的乳头。骑在你" + get_player().biggestBreastSizeDescript() + "上的小恶魔舔舐着你的乳肉，舌头慢慢向你的[nipple]移动。终于，小恶魔的舌头触碰到了你的乳头，包裹住并拉扯着那发麻的软肉。");
               if(get_player().cor < 50)
               {
                  outputText("你无法逃脱那舔舐拉扯着你[nipple]的舌头。你摇着头试图拒绝这种快感，但随着欲望侵袭你的身体，你的呼吸越来越急促。");
               }
               else
               {
                  outputText("那挤压拉扯你乳头的舌头让你的身体充满了欲望。你呻吟着挺起背，将你的乳房献给骑在你胸口的小恶魔。当你因欲望而喘息时，你能听到自己的脉搏在耳边跳动。");
               }
               outputText("突然，你感觉到细小如针尖般的牙齿刺穿了你的乳头。当毒液注入你的乳房时，你尖叫起来，那滚烫的毒液让你的" + get_player().allBreastsDescript() + "感觉像是被蜜蜂蛰了一样。当你的乳房开始肿胀时，你痛苦地呻吟着，骑在上面的小恶魔咬住你的另一个乳头，将恶魔的污秽注入其中。");
               if(get_player().hasFuckableNipples())
               {
                  outputText("随着小恶魔的污秽渗入你的[nipple]，每一个像小穴一样的形状都开始肿胀。这些可以操的孔洞肿胀成更大更肥厚的阴唇，变成了更饱满的小穴，每一个都有一个高尔夫球大小的肿胀阴蒂结节。随着你乳头小穴的皮肤变得更紧致光滑，它们的颜色也加深了。小恶魔咯咯笑着，继续啃咬着新肿胀的敏感软肉，注入更多的毒液。");
               }
               outputText("[pg]");
               get_player().growTits(2,int(get_player().breastRows.length),false,1);
               get_player().boostLactation(0.5);
            }
            get_images().showImage("gangbang-loss-human");
            outputText("这群[monster.short]的首领走上前来");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("沿着你紧绷的尾巴");
            }
            else
            {
               outputText("走到你的[legs]之间");
            }
            outputText("，色眯眯地低头看着你被困住的身体。这只新来的小恶魔身高四英尺，比这群小恶魔中的任何一只都要宽阔强壮，有着" + (get_noFur() ? "毛茸茸的狗耳朵" : "一张既像狗又像小恶魔的脸") + "，灰色的皮毛" + (get_noFur() ? "覆盖着他的小腿" : "") + "，宽大的黑色恶魔翅膀，头上长着两根长长的恶魔角，还有一根大到足以让牛头人窒息的" + Appearance.cockNoun(CockTypesEnum.DOG) + "。先列腺液从它宽大的龟头上滴落，滴在你的");
            if(get_player().cockTotal() > 0)
            {
               outputText(get_player().multiCockDescriptLight());
            }
            else
            {
               outputText(get_player().vaginaDescript(0));
            }
            outputText("。");
            outputText("那股热流刺痛了你的肉体。舔舐你腹股沟的小恶魔们贪婪地舔舐着滚烫的液体，用他们的唾液为你降温。当你呜咽时，那只大恶魔冷笑了一声，将他的" + Appearance.cockNoun(CockTypesEnum.DOG) + "的龟头拖向你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("。他粗暴地挺进，将他的" + get_monster().cockDescriptShort(2) + "的龟头塞进你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("。");
            if(get_player().cor < 50)
            {
               outputText("当大恶魔将他变异的狼鸡巴强行塞进你的洞里时，你痛苦地尖叫起来，他粗暴地将一寸又一寸滚烫的" + Appearance.cockNoun(CockTypesEnum.DOG) + "塞进你的体内，深度超乎想象。");
            }
            else
            {
               outputText("恶魔首领那滚烫的" + Appearance.cockNoun(CockTypesEnum.DOG) + "把你的洞撑得比以往任何时候都要大，你在变态的狂喜中呻吟着。");
            }
            outputText("他巨大的肉结撞击着你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("。[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("大恶魔越过骑在你胸前的小恶魔，双手各抓住你一只痛苦胀大的乳房，揉捏着、颠弄着那团肉，仿佛在掂量它们的重量。你痛苦地喘息着，你的" + get_player().allBreastsDescript() + "在他的触摸下进一步肿胀。");
            }
            outputText("你张开嘴，一只小恶魔趁机把鸡巴塞满了你的嘴。");
            outputText("恶魔首领抓住你的臀部，开始用力操你，他那冒着热气的鸡巴在你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("。");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("粗暴的操弄让你的双乳剧烈晃动，吸吮你乳头的小恶魔紧紧攀附在你那肿胀得惊人的" + get_player().allBreastsDescript() + "上。自从他把毒液注入你体内后，你的" + get_player().biggestBreastSizeDescript() + "已经暴涨了三个罩杯。");
            }
            outputText("操你脸的小恶魔抓住你的[hair]和下巴，强迫你把头往后仰，好让他把肉棒捅进你的喉咙。你喉咙里滑动的下流凸起与你肚子里的凸起相呼应。较小的小恶魔稍微往后退了一点，让你能喘口气，然后再次猛插进你的喉咙。大恶魔用他" + Appearance.cockNoun(CockTypesEnum.DOG) + "的肉结狠狠撞击你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("，完全不在乎他已经把你撑到了超越常人忍受极限的地步。");
            if(get_player().cor < 50)
            {
               outputText("你又一次被恶魔强暴了，像烤乳猪一样被肉棒刺穿，而你却能感觉到自己的欲望在不断攀升。这片堕落的土地已经在你身上留下了印记。");
            }
            else
            {
               outputText("这片堕落的土地已经在你身上留下了印记。在你来到这里之前，你绝对无法承受这么大的肉棒。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("一阵酸痛从你乳房的深处开始，一直蔓延到你酸痛的[nipple]。当你身上的骑手吸吮时，你本已肿胀的乳头变得更加肿胀，当第一股乳汁涌入他嘴里时，你喘息起来。骑手挤奶般揉捏你的乳房，他的双手在你的" + get_player().allBreastsDescript() + "之间游走，挤出的乳汁多得他根本喝不完。其他小恶魔则舔舐着你肿胀乳房那闪亮皮肤上的乳汁。[pg]");
            }
            outputText("较小的小恶魔把他的肉棒尽可能深地插进你的喉咙，用他的" + get_monster().ballsDescriptLight() + "拍打你的脸。他高潮了，蛋蛋抽搐着，把精液泵进你的喉咙。你能感觉到胃被撑大了，但你更担心的是呼吸。小恶魔高潮的时间长得不可思议，一股股精液倾泻进你体内。你的视线边缘开始发红，胸口剧烈起伏，拼命想要呼吸。最后，小恶魔把肉棒从你喉咙里拔出来，把最后几团精液喷在你脸上，你大口大口地喘着粗气。突然涌入的氧气把你推向了顶峰，你猛烈地高潮了。你的身体弓起，双眼翻白，在恶魔那根不断捣弄你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "上扭动着。你尖叫着，你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("在刺穿它的滚烫肉柱上痉挛。当你尖叫时，另一个小恶魔把肉棒塞进你嘴里，你的喉咙在它的龟头周围抽搐。");
            if(get_player().cockTotal() > 0)
            {
               outputText("你的[cocks]将精液射过你的肚子，射进那些舔舐你胯部的小恶魔们张开的嘴里。");
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("当骑手挤奶时，小恶魔们舔舐着你肿胀的" + get_player().biggestBreastSizeDescript() + "上的乳汁。当一个小恶魔喝饱了，挺着圆滚滚的肚子摇摇晃晃地走开时，另一个小恶魔又走上前来，从你喷涌乳汁的乳房中痛饮。[pg]");
               if(get_player().hasFuckableNipples())
               {
                  outputText("骑在你身上的小恶魔抓住了你乳头穴上肥厚的“阴唇”褶皱，露出恶作剧般的笑容。他用那根下流的勃起物在你乳头穴阴蒂上沾满乳汁的表面来回摩擦，然后开始逆着乳汁的流向，将他那球状的小恶魔肉棒龟头挤进肿胀的孔洞里。你知道你们村里没有哪个女人能承受这么大的勃起肉棒，然而现在，这个趴在你" + get_player().allBreastsDescript() + "上的小恶魔，正要把这样一根勃起物塞进你的一个[nipples]里。他一次又一次地拉扯着你乳头穴敏感的阴唇，强迫他的肉棒挤进你" + get_player().biggestBreastSizeDescript() + "的血肉之中。你紧绷的肌肤已经被他的毒液灼烧，现在又被他恶魔般的肉棒侵犯。");
                  if(get_player().biggestTitSize() <= 5)
                  {
                     outputText("你感觉到他球状的龟头越挤越深，直到顶到了你的肋骨。");
                  }
                  else
                  {
                     outputText("你感觉到那根异常巨大的勃起肉棒刺穿了你" + get_player().biggestBreastSizeDescript() + "充满脂肪的深处，直到最后小恶魔将自己连根没入。他微笑着，享受着自己的男子气概被你的" + get_player().biggestBreastSizeDescript() + "完全吞没的感觉。");
                  }
                  outputText("他开始前后抽插你的乳房，就好像它是一个真正的小穴一样，而你意识到这种描述其实离真相不远。你喘息着享受着快感，一种奇怪的轻微高潮在你的乳房中荡漾，你感觉到乳房紧绷的皮肤变得更紧了，因为" + get_player().biggestBreastSizeDescript() + "在小恶魔的肉棒周围短暂地痉挛。这个好色的小恶魔得意洋洋地拍打着你乳头穴的阴蒂，然后跳到另一个乳房上，在一个新的洞里重复他下流的操弄。");
                  outputText("[pg]");
               }
            }
            outputText("你喉咙里的小恶魔肉棒痉挛着，它的主人尽可能深地撞进你体内。他用非人量的精液淹没了你本已肿胀的胃。当恶魔把精液泵进你体内时，你再次感觉到自己快要晕过去了。他拔了出来，当你喘息着呼吸时，你再次高潮了。另一个小恶魔把肉棒塞进你的喉咙，你呻吟着喘息。你的身体在大恶魔的" + Appearance.cockNoun(CockTypesEnum.DOG) + "上因快感而颤抖。大恶魔收紧了对你[hips]的抓握，嚎叫着把他的肉棒猛插进你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("。他那异常巨大的肉结撑开了你洞口的边缘，再次狠狠地撞进你的体内。");
            if(get_player().cor < 50)
            {
               outputText("你含着撑开你喉咙的小恶魔肉棒嚎叫着。那肿胀的肉结将你的洞口撑开到了前所未有的程度。你剧烈的挣扎把小恶魔们从你的[legs]上甩了下来，你徒劳地踢打着，随着那肿胀的" + Appearance.cockNoun(CockTypesEnum.DOG) + "更深地插入你的体内，你不断地扭动挣扎着。");
            }
            else
            {
               outputText("首领小恶魔肿胀的肉结撑开了你的入口，伴随着一声响亮的<i>噗嗤</i>声，猛地插进了你的洞里。当那根" + Appearance.cockNoun(CockTypesEnum.DOG) + "更深地撞进你体内时，又一次高潮袭来。你含着撑开你喉咙的小恶魔肉棒嚎叫着，在高潮的颤抖中不断扭动挣扎。你剧烈的挣扎把小恶魔们从你的腿上甩了下来，你用双腿缠住那只大小恶魔，将他拉得更深。");
            }
            outputText("大小恶魔在射精时再次嚎叫起来，每一波滚烫的恶魔精液都让他的肉结和肉棒撑得更大。他那不断喷精的" + Appearance.cockNoun(CockTypesEnum.DOG) + "深深地插到了你的");
            if(get_player().hasVagina())
            {
               outputText("子宫");
            }
            else
            {
               outputText("肠道");
            }
            outputText("深处，他注入你体内的精液量似乎比他的蛋蛋能装下的还要多。你的肚子随着每一次精液的喷射而膨胀，你含着喉咙里的另一根肉棒尖叫着。[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("骑在你" + get_player().biggestBreastSizeDescript() + "上的小恶魔终于射了，用他巨大的精量涂满了你肿胀的乳房。");
            }
            outputText("你的主人还没有放过你，他那" + Appearance.cockNoun(CockTypesEnum.DOG) + "的肉结在你的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("，同时他继续射精。你两端都被灌满了恶魔精液，一个小恶魔把精液射进你的喉咙，另一个则走上前来接替他的位置。你在自己无尽的高潮中颤抖摇晃，被撑开的穴道传来的快感与肿胀肚子的疼痛交织在一起。你的[legs]乱蹬着，因为首领小恶魔移动着他巨大的肉结，在你被撑得极其夸张的");
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText(get_player().assholeDescript());
            }
            outputText("里。当你感觉到更多股恶魔精液顺着他的肉棒涌入你已经巨大的肚子里时，你的脚趾蜷缩起来。[pg]");
            outputText("当又一股小恶魔的精液灌进你的喉咙，又一波堕落的精液喷进你的洞里，并在中间的某个地方汇合时，你昏了过去……[pg]");
            outputText("过了一会儿你醒了过来，身体仍然因为余韵而颤抖着。你呼吸时，嘴里的精液发出咕噜咕噜的声音。自从你昏过去后，你就没动过。你的臀部仍然撑在圆木上，你躺在一滩逐渐变凉的精液中，你的[hair]被干涸的精液粘在地上。即使你的[legs]感觉恢复了力气，你也动弹不得。你那可怕地肿胀的肚子把你压得死死的，");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("而你那充满乳汁的乳房仍然因小恶魔的毒液而肿胀着，");
            }
            outputText("随着每一次高潮的抽搐，你的身体都在颤抖。你那胀大的肚皮");
            if(get_player().biggestTitSize() > 3)
            {
               outputText("和巨大的乳房");
            }
            outputText("紧绷得像鼓面一样，闪闪发亮，你的肚脐也凸了出来。当你再次陷入昏迷时，最后一个念头在你的脑海中闪过。");
            if(get_player().cor < 50)
            {
               outputText("在这个腐败的土地上，当你的身体为了满足这里居民的变态欲望而被如此可怕地扭曲时，你还能坚持多久？[pg]");
            }
            else
            {
               outputText("既然你才刚刚体验到这片土地所能提供的乐趣的皮毛，为什么还要去管你那愚蠢的任务呢？[pg]");
            }
            get_player().orgasm("VaginalAnal");
            dynStats(DynStat.Lib(2),DynStat.Cor(3));
            get_player().knockUp(1,418);
            if(get_player().hasVagina())
            {
               if(get_player().cuntChange(get_monster().cockArea(2),true))
               {
                  outputText("[pg]");
               }
            }
            else if(get_player().buttChange(get_monster().cockArea(2),true))
            {
               outputText("[pg]");
            }
         }
         if(!param1)
         {
            get_game().camp.saveContent.hasBeenImpSleepRaped = true;
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(playerMenu);
         }
      }
      
      public function impGangGetsWhooped() : void
      {
         clearOutput();
         outputText("打败小恶魔后，你在回去睡觉前检查了它们的尸体，看看有没有宝石。");
         get_combat().cleanupAfterCombat();
         get_player().sleeping = true;
         goNext(get_timeQ(),false);
      }
      
      public function impFunWithUnbirthing() : void
      {
         clearOutput();
         get_player().slimeFeed();
         outputText("你拍着手咯咯笑了起来，你的孩子们蜂拥向那个小怪物，将它拖向你等待着的" + get_player().vaginaDescript(0) + "。小恶魔并不是特别管饱的生物，所以，当这个尖叫着求饶的生物被拖向你，然后被一团蠕动黏滑的触手塞进你的子宫时，你开始自慰来打发时间。你太享受了，甚至没有注意到求饶声是什么时候停止的，当你达到高潮，将黏液般的淫水喷洒了一地时，你才意识到你的宝宝们又饿了。[say:可怜的小家伙们，]你啧啧地说着，在巨大的肚子两侧打着圈抚摸，沉浸在一种自我陶醉的母爱中。[say:妈妈忘记喂你们了吗？我们去给你们找点吃的吧。][pg]");
         get_images().showImage("imp-win-female-fuck");
         outputText("你已经完全忘记了刚刚被你用小穴吞噬的小恶魔。当你重新开始狩猎时，你的口水都流出来了。");
         get_player().cuntChange(get_monster().cockArea(0),true);
         get_player().orgasm("Vaginal");
         get_player().addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,-2);
         dynStats(DynStat.Spe(-0.5),DynStat.Sens(3),DynStat.Cor(2));
         get_player().knockUp(1,408);
         get_combat().cleanupAfterCombat();
      }
      
      public function impFeminization() : void
      {
         clearOutput();
         outputText("你低头看着刚刚被你狠狠揍了一顿的小恶魔。现在看来，你似乎走不出十步就会遇到另一只试图把你扑倒在地，好好强暴你一顿的小恶魔。");
         outputText("[pg]你走近那只气喘吁吁的恶魔，把脚重重地踩在他的胸口上，考虑着该怎么处置他。直接杀了他很容易，但你脑海中又浮现出另一个想法。也许是这片腐败的土地影响了你，但你为什么不一箭双雕呢？你正好欲火焚身，而这个小混蛋也需要学学己所不欲勿施于人的道理。");
         outputText("[pg]当你把重量从他的肺部移开时，小恶魔如释重负地喘息着，但你连一秒钟的时间都不给他来恢复方向感。在他来得及防备之前，你已经掏出了一些魅魔乳液，把瓶口塞进他的嘴唇之间，强行灌进他的食道。");
         outputText("[pg]当这种乳白色的转化剂接触到他的舌头时，小恶魔的眼睛睁得大大的，但他被打得遍体鳞伤，根本无力反抗。他虚弱地呛咳着，拒绝吞咽，于是你摇了摇头，捏住他的鼻子，直到他只有两个选择：要么喝下乳液，要么被它憋死。");
         outputText("[pg]干呕声逐渐消失，取而代之的是沉重的吞咽声，小恶魔屈服于你这非传统的正义。他那棱角分明的脸庞变得稍微圆润了一些，饱经风霜的皮肤变得柔软，臀部伴随着微弱的噼啪声变宽，平坦的胸部迅速膨胀成适中的乳房，顶端是坚挺的乳头，乞求着被吸吮。最后消失的是他那曾经令人印象深刻的肉棒。它在魅魔乳液的影响下萎缩，伴随着他迅速干瘪的阴囊，它们似乎一起爬回了他的体内，安顿下来，变成了一个完美无瑕的小穴。");
         outputText("[pg]当你最终扔掉空瓶子时，她发出了一声轻微的抽泣，但你根本不在乎。看着这个企图强暴你的家伙得到了应有的惩罚，你的肉棒硬得像石头一样，渴望着把它派上用场。");
         outputText("[pg]你没有浪费时间，[if (isnaked) {脱下你的装备|脱下衣服扔成一堆}]，然后跪了下来。小恶魔试图反抗你，当你靠得太近时，她交叉双腿并抓挠你。最终你的挫败感占了上风，你对着她现在肉感十足的奶子狠狠地扇了两巴掌。突如其来的疼痛让她震惊得僵住了，在她反应过来之前，你用力掰开她的双腿，在它们之间安顿下来。");
         outputText("[pg][say: 不，停下！]小恶魔嚎叫着，用她长着利爪的手指抓向你的眼睛。[say: 我不是女孩！]");
         outputText("[pg]受够了她对惩罚的抵抗，你利用你更大的力量，用一只手把她的手腕按在她的头顶上，而另一只手抓住你肉棒的根部，引导你的龟头进入她那流着淫液的裂缝的褶皱中。尽管她抗议，但似乎她无法控制地被你绝对的支配所唤醒，你短暂地想知道这是魅魔乳液的副作用，还是她一直都是个受虐狂。然后，你毫不迟疑地将肉棒猛插到底，撕裂了她新形成的处女膜，将她的阴道初夜据为己有。");
         outputText("[pg]一声荡妇般的呻吟从她红润的嘴唇中溢出，你感觉到你新驯服的母狗不会再给你惹任何麻烦了。");
         outputText("[pg]松开她的手腕，你抓住小恶魔宽阔的臀部以获得更好的发力点，然后开始粗暴地将你的肉棒猛插进她体内。当你耕耘时，你肉棒的头部撞击着恶魔的子宫颈，你彻底享受着她紧致小穴带来的肉体上的愉悦，以及知道你把那个想强暴你的雄性变成了顺从地接受你肉棒的雌性所带来的心理上的愉悦。征服的感觉令人陶醉，当小恶魔最后的抵抗被打破，她沦落到紧紧抓住你的肩膀，呜咽着求你操她——求你让她怀孕时，这种感觉只会更加强烈。");
         outputText("[pg]她变成了一个多么淫荡的婊子啊。");
         outputText("[pg]随着你加快步伐，空气中麝香般的性爱气味变得更加浓烈，你一遍又一遍地敲打着她子宫的大门，直到它屈服。当你的肉棒穿过她子宫颈圆润的紧致处时，你确切地感觉到了它，为了把这一刻深深印在你飞机杯的脑海里，你抓住她的下巴，强迫她看着你的[eyes]。然后伴随着一声低沉的咆哮，你高潮了，你的睾丸收紧，你的肉棒将滚烫的白色果冻喷射进小恶魔新造的子宫里。她变成女人还不到一个小时，就已经被强行压倒并被迫接受了你的种子。");
         if(get_player().cumQ() >= 750)
         {
            outputText("[pg]你的睾丸继续喷射出一股又一股乳白色的精液，小恶魔体内的压力不断增加。她用惊恐的黑眼睛看着自己的肚子肿胀、肿胀，直到快要撑破的地步。直到那时，你才抽出身来，让你那慢慢变软的肉棒头部从她小穴紧密的密封中挣脱出来。");
            outputText("[pg]小恶魔呻吟着捂住肚子，你浓稠的精液从她被塞满的小穴里不断溢出。她一时半会儿是走不动了，但这可不是你需要操心的问题。也许下次她再想给你找麻烦时会三思而后行。");
         }
         else
         {
            outputText("[pg]你的睾丸继续将一股又一股浓稠的精液射入小恶魔的子宫。当你伴随着最后几下无力的抽插度过高潮时，她用惊恐的黑眼睛看着自己被填得满满当当。直到这时，你才向后退去，让你慢慢变软的肉棒头部从她紧致的小穴中拔出。");
            outputText("[pg]小恶魔呻吟着捂住肚子，你的一缕精液从她被蹂躏过的小穴里渗出。她一时半会儿是走不动了，但这可不是你需要操心的问题。也许下次她再想给你找麻烦时会三思而后行。");
         }
         outputText("[pg]你把刚干完的猎物丢在泥地里，带着强烈的满足感大步离开。");
         dynStats(DynStat.Cor(1));
         get_player().orgasm("Dick");
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            get_player().destroyItems(get_consumables().SUCMILK,1);
         }
         else
         {
            get_player().destroyItems(get_consumables().P_S_MLK,1);
         }
         if(get_player().hasItem(get_consumables().SUCMILK))
         {
            get_player().destroyItems(get_consumables().SUCMILK,1);
         }
         else
         {
            get_player().destroyItems(get_consumables().P_S_MLK,1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function generateImpSexMenu() : void
      {
         var _g3:Combat;
         var condomed:Boolean;
         var _g2:ImpScene;
         var _g1:LustyMaidensArmor;
         var _g:ImpScene;
         var _loc1_:* = null as String;
         var _loc2_:* = null as Function;
         var _loc3_:int = 0;
         menu();
         addButtonDisabled(0,"男性强奸","此场景需要你有一根尺寸合适的肉棒和足够的兴奋度。","男性强奸");
         addButtonDisabled(1,"女性强奸","此场景需要你有一个阴道和足够的兴奋度。","女性强奸");
         addButtonDisabled(2,"乳头交","此场景需要你有可插入的乳头和足够的兴奋度。","乳头交");
         addButtonDisabled(3,"喂奶","这个场景需要你有足够的乳汁。","Breastfeed");
         addButtonDisabled(4,"使用安全套","这个场景需要你有一个合适的阴茎和足够的性奋度。它不适用于半人马形态。","Use Condom");
         addButtonDisabled(5,"产卵","此场景需要你拥有蜜蜂产卵管和足够的卵。","Oviposit");
         if(get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
         {
            addButtonDisabled(7,"子宫吞噬","此场景需要你成为络新妇女王。","Unbirth Him");
         }
         if(get_pc().get_lust() >= 33)
         {
            outputText("遗憾的是，你意识到自己的需求并没有得到满足。当然，你总是可以强暴这个可怜的小东西……");
            if(get_pc().hasCock())
            {
               if(get_player().cockThatFits(get_monster().analCapacity()) == -1)
               {
                  addButtonDisabled(0,"男性强奸","你太大了，无法强暴小恶魔。");
               }
               else
               {
                  _loc1_ = get_pc().isTaur() ? "半人马强奸" : "男性强奸";
                  if(get_pc().isTaur())
                  {
                     _loc2_ = centaurOnImpStart;
                  }
                  else
                  {
                     _g = this;
                     _loc2_ = function():void
                     {
                        _g.rapeImpWithDick();
                     };
                  }
                  addButton(0,_loc1_,_loc2_);
                  if(get_watersportsEnabled() && !get_pc().isTaur())
                  {
                     addButton(5,"操屁眼&撒尿",pissDom).hint("操小恶魔的屁股，并释放你自己。");
                  }
               }
            }
            if(get_pc().hasVagina())
            {
               if(get_pc().isTaur())
               {
                  addButton(1,"群体阴道",centaurGirlOnImps);
               }
               else
               {
                  addButton(1,"女性强奸",rapeImpWithPussy);
               }
            }
            if(get_pc().hasFuckableNipples())
            {
               addButton(2,"乳头交",noogaisNippleRape);
            }
            if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armor() is LustyMaidensArmor)
            {
               _g1 = get_pc().get_armor();
               addButton(6,"B.Titfuck",function():void
               {
                  _g1.lustyMaidenPaizuri();
               });
            }
            if(get_pc().cockThatFits(get_enemy().analCapacity()) != -1 && !get_pc().isTaur() && get_pc().hasItem(get_useables().CONDOM))
            {
               _g2 = this;
               condomed = true;
               addButton(4,"使用安全套",function():void
               {
                  _g2.rapeImpWithDick(condomed);
               });
            }
            _loc3_ = get_player().itemCount(get_consumables().SUCMILK) + get_player().itemCount(get_consumables().P_S_MLK);
            addNextButton("雌化",impFeminization).hint("使用魅魔乳液，和小恶魔找点乐子。").disableIf(get_player().cockThatFits(2,"width") == -1 || _loc3_ < 2,"需要2份魅魔乳液和一根能塞进新长出的小穴的肉棒。");
         }
         else
         {
            outputText("[pg]<b>你还没饥渴到要强暴他。</b>");
         }
         if(get_pc().lactationQ() >= 500 || get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            addButton(3,"喂奶",areImpsLactoseIntolerant);
         }
         if(get_pc().canOvipositBee())
         {
            addButton(5,"产卵",putBeeEggsInAnImpYouMonster);
         }
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
         {
            addButton(7,"子宫吞噬",impFunWithUnbirthing).hint("喂养你子宫里的寄生虫。");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         addKillPetrifyButtons(12,13);
         _g3 = get_combat();
         setSexLeaveButton(function():void
         {
            _g3.cleanupAfterCombat();
         });
      }
      
      public function centaurOnImpStart() : void
      {
         var vape1:Boolean;
         var _g1:ImpScene;
         var vape:Boolean;
         var _g:ImpScene;
         clearOutput();
         outputText("当小恶魔在你面前倒下时，");
         if(get_monster().get_HP() == 0)
         {
            outputText("精疲力竭地喘息着");
         }
         else
         {
            outputText("疯狂地自慰着");
         }
         outputText("，你向这个可怜的生物走去。当你高高在上地俯视它时，恶魔的目光扫过你强健的马匹肌肉。看着这个小生物肿胀的阴茎和它那双小眼睛里充满的无尽欲望，你很难掩饰自己的笑容。");
         if(get_player().cor < 50)
         {
            outputText("你微微舔了舔嘴唇，开始靠近这个小小的身影。");
         }
         else
         {
            outputText("你淫秽地舔了舔嘴唇，靠近这个小小的身影。[pg]");
         }
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ >= 0 && !get_player().hasVagina())
         {
            centaurOnImpMale();
         }
         else if(get_player().hasVagina() && _loc1_ < 0)
         {
            centaurOnImpFemale();
         }
         else
         {
            outputText("你打算把注意力集中在你的男性器官还是女性器官上？");
            menu();
            _g = this;
            vape = true;
            addButton(0,"男性",function():void
            {
               _g.centaurOnImpMale(vape);
            });
            _g1 = this;
            vape1 = true;
            addButton(1,"女性",function():void
            {
               _g1.centaurOnImpFemale(vape1);
            });
         }
      }
      
      public function centaurOnImpResults(param1:Number) : void
      {
         var _loc2_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(param1 == 1)
         {
            if(get_player().cumQ() >= 250)
            {
               if(!get_player().hasKnot(_loc2_))
               {
                  outputText("很快，精液就从被蹂躏的" + get_monster().assholeDescript() + "中溢出，在你继续向小恶魔体内抽插时，精液在你们之间滴落，没有停止的迹象。");
               }
               else
               {
                  outputText("很快，被蹂躏的" + get_monster().assholeDescript() + "就满了，尽管你的肉结阻止了精液的流出，但越来越多的精液泵入其中。很快，这生物的肚子就鼓了起来，小恶魔无言地喘息着。");
               }
               outputText("当你的" + get_player().cockDescript(_loc2_) + "终于拔出时，一股精液从扩张的洞口喷涌而出，覆盖了这生物的后腿。");
               if(get_player().cockTotal() == 2)
               {
                  outputText("你的另一根阴茎用自己的分泌物浸透了小恶魔的背部，这些分泌物立刻开始顺着它的身体两侧滴落。");
               }
               if(get_player().cockTotal() > 2)
               {
                  outputText("你的其他阴茎将精液射在小恶魔的背部和两侧，让它变成了一团黏糊糊的烂摊子。");
               }
               outputText("你留下它在你的精液池中喘息和舔舐。");
            }
            else
            {
               outputText("随着对这个精液容器的最后一次抽插，你开始放慢速度，甚至它自己的" + get_monster().cockDescriptShort(0) + "也将它的种子洒在了地上。");
               if(get_player().cockTotal() == 2)
               {
                  outputText("你的另一根阴茎用自己的分泌物浸透了小恶魔的背部，这些分泌物立刻开始顺着它的身体两侧滴落。");
               }
               if(get_player().cockTotal() > 2)
               {
                  outputText("你的其他阴茎将精液射在小恶魔的背部和两侧，让它变成了一团黏糊糊的烂摊子。");
               }
               outputText("你留下它在长满青苔的巨石上喘息，身上披着你们共同的精液。");
            }
            return;
         }
         if(param1 == 2)
         {
            if(get_player().cumQ() >= 250)
            {
               outputText("小恶魔的眼睛因涌入的精液量而睁大，大团的精子开始顺着它的下巴溢出。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("无论它吞咽得多快，似乎都不够，很快它的肚子就鼓了起来，皮肤上覆盖着一层厚厚的精液。");
               }
            }
            outputText("满足后，你小跑着离开，留下这生物舔着嘴唇和手指，它的眼睛带着色欲的狡黠注视着你。");
            return;
         }
         if(param1 == 3)
         {
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("随着感觉的加强，你伸出手开始按摩你的[breasts]，玩弄你的[nipples]。");
               if(get_player().hasFuckableNipples())
               {
                  if(get_player().biggestLactation() >= 1)
                  {
                     outputText("乳汁从你的[nipples]中流出，就好像它们刚刚被滴落的精液填满了一样。");
                  }
                  else
                  {
                     outputText("你的手指越来越快地滑入你的[nipples]，甚至连小恶魔也开始在你身下抚摸自己。");
                  }
               }
               else if(get_player().biggestLactation() > 0)
               {
                  if(get_player().biggestLactation() <= 1)
                  {
                     outputText("乳汁开始顺着你的胸膛滴落，偶尔还会向外喷射。");
                  }
                  else
                  {
                     outputText("乳汁从你的[breasts]中涌出，顺着你的身体流下。");
                  }
               }
            }
            return;
         }
      }
      
      public function centaurOnImpMale(param1:Boolean = false) : void
      {
         var _loc2_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(param1)
         {
            clearOutput();
         }
         if(get_player().get_gender() == 3)
         {
            get_images().showImage("player-centaur-herm");
         }
         else
         {
            get_images().showImage("player-centaur-male");
         }
         outputText("当你的阴影笼罩在小恶魔身上时，它带着一丝恐惧看着你的[legs]。");
         if(get_player().cockArea(_loc2_) <= 15)
         {
            outputText("它如释重负，紧接着强烈的欲望涌上心头，它把自己扔在一块长满青苔的岩石上，急切地展示着它的" + get_monster().assholeDescript() + "。你的蹄子在它身体两侧移动的声音似乎让这个生物陷入了疯狂，它开始对着空气抽插，嘴里发出微弱的喵喵声。");
            if(get_player().cor < 50)
            {
               outputText("你慢慢地在它的臀瓣间摩擦你的" + get_player().cockDescript(_loc2_) + "，让你的先列腺液润滑那个小洞，然后慢慢开始插入。还没等你插进一半，这个生物就向后迎合你，把它的" + get_monster().assholeDescript() + "套在你的" + get_player().cockDescript(_loc2_) + "上，发出非人的狂喜声。它的" + get_monster().assholeDescript() + "在你的" + get_player().cockDescript(_loc2_) + "周围放松下来，将它完全吞没，同时它熟练的肌肉在内部紧紧抓住并为你撸动。[pg]");
            }
            else
            {
               outputText("你把你的" + get_player().cockDescript(_loc2_) + "对准它干燥的肛门，用你强健的马腿把自己推进去。当它的内脏被强行撑开时，这个生物发出一声尖叫，你感觉到它生涩的紧致试图抵抗你的入侵。不给这个生物放松的机会，你开始像活塞一样在它体内抽插，当你听到痛苦的声音被快乐的咕哝和尖叫声取代时，你咧嘴笑了。你在这个生物的洞里坚持不了多久，很快，精液就开始喷射出来，填满了它的肠道。[pg]");
            }
            centaurOnImpResults(1);
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().cor < 50)
         {
            outputText("小恶魔睁大了眼睛，当你看到它试图转身逃跑时，你看到了它的恐惧。你一边发出安抚的声音靠近这个容易受惊的生物，一边轻松地跟上它的步伐。看到逃跑的机会渺茫，这个生物再次转向你，小心翼翼地开始在你的[legs]之间移动，睁大眼睛祈求着。你的笑容似乎让它放松下来，欲望再次填满了它的眼睛，它慢慢开始按摩你的" + get_player().cockDescript(_loc2_) + "。越来越自信，这个生物很快就用双手握住你的" + get_player().cockDescript(_loc2_) + "，它湿润的蛇形舌头在你的勃起物上游走。你的" + get_player().cockDescript(_loc2_) + "几乎不可能塞进它的小嘴里，但它还是尽力取悦你，变得越来越狂野。");
            if(get_player().cocks[0].cockThickness > 3)
            {
               outputText("没过多久，你就感觉到它的舌头滑进了你的尿道，精液从你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else
               {
                  outputText("前列腺");
               }
               outputText("涌出，你感觉到外来入侵者在里面蠕动。");
            }
            outputText("你无法承受太久的刺激，你的蹄子在地上摩擦，精液从你的" + get_player().cockDescript(_loc2_) + "喷射而出，顺着它等待的喉咙流下。[pg]");
            centaurOnImpResults(2);
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("小恶魔睁大了眼睛，当你看到它试图转身逃跑时，你看到了它的恐惧。它没跑多远就被你追上了，你用肌肉发达的侧腹把它撞倒。在它再次尝试逃跑之前，你把它按倒在地，把你的" + get_player().cockDescript(_loc2_) + "对准它的" + get_monster().assholeDescript() + "。它感觉太小了，无法承受你的粗壮，但你强健的双腿一推，就插进去了几英寸。小恶魔痛苦地尖叫起来，你在它老虎钳般的紧握中微微皱眉。你咬紧牙关，把剩下的长度推了进去，痛苦的声音只会让你更加用力地向前推进。很快，你的" + get_player().cockDescript(_loc2_) + "进出变得更加容易，尽管小恶魔娇嫩的肛门异常扩张以适应入侵的器官。尽管你渴望延长你的快乐，但穿透的感觉和不自然的声音证明你无法坚持太久。[pg]");
         centaurOnImpResults(1);
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function centaurOnImpFemale(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
         }
         get_player().slimeFeed();
         get_player().knockUp(1,432);
         get_images().showImage("player-centaur-herm");
         outputText("当小恶魔被打倒在地时，它的手抚摸着它的" + get_monster().cockDescriptShort(0) + "，眼睛看着你，希望你能以某种方式虐待它。你盯着那根粗大的肉棒，舔了舔嘴唇，转过身展示你的" + get_player().vaginaDescript(0) + "。");
         if(get_player().vaginas[0].vaginalLooseness <= 3)
         {
            outputText("小恶魔带着淫荡的笑容向前跳跃，抓住你的侧腹，将它的肉棒挺进你的" + get_player().vaginaDescript(0) + "。");
            if(get_player().vaginas[0].virgin)
            {
               outputText("当你的处女小穴被粗大的肉棒撕裂时，你痛呼出声，而这生物在意识到它夺走了你的什么后，发出了愉悦的叫声。");
            }
            else
            {
               if(get_player().vaginalCapacity() < get_monster().cockArea(0))
               {
                  outputText("它因你那令人难以置信的紧致而发出愉悦的呻吟，并更加用力地向前挺进。");
               }
               if(get_player().vaginalCapacity() >= get_monster().cockArea(0) && get_player().vaginalCapacity() <= get_monster().cockArea(0) * 1.25)
               {
                  outputText("当它深深滑入你的" + get_player().vaginaDescript(0) + "时，发出了一声愉悦的声响。");
               }
               if(get_player().vaginalCapacity() >= get_monster().cockArea(0) * 1.25)
               {
                  outputText("它的肉棒轻松滑入，你的后庭开始发出黏糊糊的水声。你的一部分甚至希望它粗大的肉棒能再大一些，你的思绪飘向了过去那些曾插入过你的怪物巨根。");
               }
            }
            outputText("当这生物完全插到底时，你带着邪恶的笑容开始向前小跑。这生物的手拼命抓住你的侧腹，它的" + get_monster().cockDescriptShort(0) + "在你的" + get_player().vaginaDescript(0) + "里跳动，增加了你的快感。这动作让小恶魔为了不掉下去而更加用力地贴紧你，而你只能勉强看清自己要去哪里。很快你就能感觉到小恶魔的精液填满了你的" + get_player().vaginaDescript(0) + "，甚至在你的阴道肌肉试图榨干它所有精液时溢了出来。欲求不满的你开始加速，用它的" + get_monster().cockDescriptShort(0) + "来带给自己高潮。这小生物无法在不伤害自己的情况下松手。它拼命抓紧，而你加快步伐，开始短距离跳跃，迫使它插得更深。精液滴落并流过你[clit]的感觉将你推向顶点，你在强烈的快感中大叫。当你终于慢下来并清醒头脑时，小恶魔已经不见踪影。沿着你留下的精液痕迹往回走，你只找到了它的小背包。");
            get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            get_player().orgasm("Vaginal");
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("小恶魔带着淫荡的笑容向前跳跃，抓住你的侧腹，将它的肉棒挺进你的" + get_player().vaginaDescript(0) + "。虽然在你来到这个地方之前，你可能会觉得他很大，但现在的感觉仅仅是舒服而已，你忍不住发出一声轻微的失望呻吟。");
         if(get_player().cor >= 50)
         {
            outputText("你至少因为体内有一根肉棒而感到安慰，而且很快它就会用精液填满你。也许它甚至会让你怀孕！");
         }
         outputText("小恶魔似乎也察觉到了你最初的不满，突然你感觉到有奇怪而粗糙的物体在你的" + get_player().vaginaDescript(0) + "附近被插入的地方戳刺。突然你感觉自己被强行撑得更开，感觉就像有人在你的小穴里踢踹。第二个物体触碰到了第一个物体进入的地方附近，你赶紧靠在附近的一棵树上支撑自己。第二次的冲击更加猛烈，感觉就像你的子宫颈被踩踏一样。你痛得大叫，你的小穴几乎被撕裂，小恶魔利用你的尾巴作为杠杆，不仅将他的" + get_monster().cockDescriptShort(0) + "，甚至将他的腿也塞进了你的" + get_player().vaginaDescript(0) + "。");
         if(get_player().cor < 80)
         {
            outputText("眼泪从你的眼眶涌出，你确信自己肯定流血了，");
         }
         if(get_player().cor < 50)
         {
            outputText("你紧紧抱住树，害怕哪怕是最轻微的动作也会带来疼痛。");
         }
         else
         {
            outputText("你紧紧抱住树，像发情的野兽一样发出呼噜声，享受着这强烈的痛苦。");
         }
         if(get_player().cor >= 80)
         {
            outputText("你在痛苦和快感中大叫，扭动身体希望能增强这种感觉，像个荡妇一样对小恶魔抛出诱惑和辱骂。");
         }
         if(get_player().cor >= 50 && get_player().biggestTitSize() >= 2)
         {
            outputText("你松开树，开始玩弄你的" + get_player().allBreastsDescript());
            if(get_player().hasFuckableNipples())
            {
               outputText("并将手指塞进你的[nipple]。");
            }
            else
            {
               outputText("。");
            }
         }
         outputText("小恶魔越插越深，没过多久你再次大叫，因为你感觉到先是它的蹄子，然后是它的" + get_monster().cockDescriptShort(0) + "撕开了你的子宫颈，直捣你的子宫。");
         if(get_player().analCapacity() >= 35)
         {
            outputText("当小恶魔意识到它无法再深入时，你感觉到它的手抵在了你的屁眼上，你瞪大了眼睛，意识到它打算做什么。在现在流淌的淫液的润滑下，它的拳头用力推入你的[asshole]，挤过你的括约肌。");
            if(get_player().ass.analLooseness < 4 && get_player().cor < 80)
            {
               outputText("你痛苦的嚎叫让你的喉咙变得沙哑。");
            }
            else
            {
               outputText("你变态般愉悦的嚎叫让你的喉咙变得沙哑。");
            }
         }
         outputText("[pg]当你感觉到这生物的精液填满你的子宫，润滑你红肿的子宫颈时，你松了一口气，在它让你受孕的同时，你自己的身体也因强烈的性高潮而崩溃。你晕了过去，醒来时发现小恶魔已经从你体内滑出，躺在地上不省人事，身上完全涂满了你的淫液和它自己的精液的混合物。在寻找了任何你可能从它身上拿走的东西后，你一瘸一拐地离开了，你");
         if(get_player().cor < 80)
         {
            outputText("向自己保证你不会再这样做了。");
         }
         else
         {
            outputText("发现你的淫液已经顺着你的腿滴落下来，期待着再次这样做。");
         }
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function centaurGirlOnImps() : void
      {
         clearOutput();
         get_images().showImage("player-centaur-female");
         outputText("你站在被彻底击败的恶魔上方，产生了一个有趣的想法。这些小生物远非威胁，但它们的特征似乎可能有用。你把小恶魔抱起来放在树上，明确命令他待在那里，这让他很困惑。一旦你确定他不会动，你就吹了一声口哨，然后等待。[pg]");
         outputText("一只地精从你身后的灌木丛中出现，但你一记飞踢将她踢飞；她不是你想要的。你很快就得到了回报，三只小恶魔飞向你，肉棒已经准备就绪。你抓住那只被打败的小恶魔的头，向这群人解释你的需求，并用尾巴将你的一点气味扇向他们。他们只简短地商量了一下，就做出了决定，你把他们较弱的同伴扔到他们下面。这三只中最大的一只，显然是首领，淫荡地对你笑着，同意了你的“要求”。[pg]");
         if(get_player().hasVagina())
         {
            outputText("小恶魔们向你走来，他们各种各样的生殖器在阳光下闪闪发光，吸引了你的注意力。他们每次拍打翅膀，肉棒都会淫荡地摆动，但你转过身去，希望他们的服侍能成为一个惊喜。[pg]");
            outputText("手在你身上滑动，抚摸和拍打着你马一般的身体。游移的手指很快找到了你的后部，开始在你的[vagina]和[asshole]周围挑逗。他们四处试探但没有插入，你沮丧地跺着蹄子。你身后传来一声轻笑，除了几只手外，其他的手都消失了。[pg]");
            outputText("一只稍大的手拍打着你的" + get_player().assDescript() + "，然后向上滑动，将一根粗壮的手指插了进去。你的[asshole]试图把它吸得更深，但失去了机会，因为它在做任何事情之前就被抽出了。相反，那只手回到了你的侧腹，慢慢向前滑动到你的躯干。[pg]");
            outputText("“首领”小恶魔进入你的视线，在你面前盘旋，让你好好看看他长长的阴茎。他拉扯着它，将一大滴先列腺液挤到另一只手上。你张开嘴，他把咸咸的液体抹在你的舌头上。你高兴地吞下它，感觉口水直流，你的[vagina]也分泌出液体。[pg]");
            outputText("首领看向你身后，向你看不见的人发出了信号，但你没时间转身，一根巨大的狗肉棒滑入了你流着口水的小穴，一根更大的带刺肉棒插入了你的[asshole]。他们开始用力地在你体内抽插，你满足地嘶鸣，而你面前的恶魔则看着，自己撸动着。");
            get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            get_player().buttChange(get_monster().cockArea(0),true,true,false);
            outputText("[pg]");
            outputText("他消失在你身后，在你的后腿上拍了一巴掌，大喊道，[say:驾！]并开怀大笑。不管他是否期望你这样做，你决定放手一搏，用前腿蹬地，在空中踢腾着，感觉骑在你身上的恶魔们拼命地想要抓紧，然后你以最快的速度奔跑起来。你在泥土中狂奔，泥块和杂草被甩在身后。[pg]");
            outputText("在空地的边缘是那个首领，他笑着看着你，还在撸动着自己。似乎意识到有更好的选择，他抓起那只被打败的小恶魔，将自己插入他体内，把他当成一个活生生的飞机杯，那只小恶魔似乎并不介意这个姿势，在屁股被蹂躏时不断地叫唤着。[pg]");
            outputText("你意想不到的奔跑让体内的肉棒暂时停了下来，它们的主人摸索着抓住你的[hips]和" + get_player().assDescript() + "。在他们的位置相对稳定后，他们又开始在你体内捣弄，让你几乎在快感中跌倒。[pg]");
            outputText("你设法稳住自己，跑得更快，感觉体内疯狂的肉棒爆发了。滚烫的精液在里面喷洒，你在狂喜中尖叫。");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("你的手条件反射地抓住你的[chest]并揉捏着。");
            }
            outputText("[pg]");
            outputText("你[vagina]里那根狗肉棒的主人设法在精液排空时将他的肉结插入你体内，但那根猫肉棒的身体就没那么幸运了，他对你的抓握变弱了。他从你的[asshole]滑出，但设法抓住了你背上的毛并跨坐在你身上，同时他的肉棒继续向你喷洒精液。[pg]");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("他滑到你的躯干，抓住你狂乱挥舞的" + get_player().allBreastsDescript() + "，粗暴地按摩着它们。他的服侍出奇地粗鲁，你想知道他尝试过多少次取悦女人。");
               if(get_player().hasFuckableNipples())
               {
                  outputText("他的手指滑入你的[nipples]并开始撑开和挤压它们。你的淫水流到他的手上，很快你的前面就变得光滑闪亮。");
               }
               else
               {
                  outputText("他的手指摸索并抓住你的乳头，不舒服地拉扯着它们。在你抱怨之前，他似乎意识到了自己的错误并松开了它们。");
               }
               if(get_player().biggestLactation() >= 1 && get_player().lactationQ() < 50)
               {
                  outputText("随着他绝望的挤压继续，乳汁从你身上滴落和喷射，在地上形成小水坑。");
               }
               else if(get_player().biggestLactation() >= 1)
               {
                  outputText("随着他绝望的挤压继续，乳汁从你身上喷射而出，形成巨大的乳汁水坑，你在继续移动时溅起水花。");
               }
               outputText("[pg]");
            }
            outputText("你停止奔跑，喷洒出巨大的泥土扇面，将你背上的小恶魔撞飞到一棵树上，他毫不客气地倒在地上。长着狗肉棒的小恶魔从你体内瘫倒，被你的高潮喷洒，身上沾满了淫水和他自己的精液。[pg]");
            outputText("你小跑向首领，他还在把那只几乎失去知觉的小恶魔当飞机杯用，你把那只受虐的生物从他身上拉下来。当你抓住他的肉棒并挤压他的睾丸时，他看起来很震惊，这导致他猛烈地高潮，将白热的精液喷洒在你身上。他瘫倒在地上，精疲力竭，你尽力擦拭自己。");
            outputText("收拾好你的东西，你最后看了一眼各种各样的尸体，跌跌撞撞地走回营地。");
            get_player().knockUp(1,432);
            get_player().orgasm("Vaginal");
            get_player().orgasm("Anal",false);
            dynStats(DynStat.Cor(1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function areImpsLactoseIntolerant() : void
      {
         clearOutput();
         get_images().showImage("monster-imp");
         outputText("你走向正在自慰的小恶魔，露出你的" + get_player().allBreastsDescript() + "并左右摇晃。这个小生物看着它们，被迷住了，一边自慰着他一英尺长的勃起。[pg]");
         outputText("你在这个小生物面前坐下，抓住他的头发。小恶魔痛苦地尖叫了一声，然后他的叫声被一个[nipple]堵住了。当他屈服、被打败时，它填满了他的嘴。他立刻开始尽可能多地喝下你的乳汁。[pg]");
         outputText("过了一会儿，他把一只手从他巨大的阴茎上拿开，放在你的" + get_player().biggestBreastSizeDescript() + "上，以在继续吸吮时稳住自己。你满意地叹了口气，只是沉浸在被吸吮带来的愉悦感中。你亲切地揉了揉小恶魔的头发。[say:当这些生物把心思从他们的阴茎上移开时，和他们在一起要好得多，]当你看到他的另一只手放松并停止摩擦他肿胀的恶魔阴茎时，你心想。[pg]");
         outputText("你感觉到小恶魔大口吞咽的速度开始减慢，直到他松了一口气。虽然小恶魔可能很小，但它们是非常饥饿的生物。你的[nipple]从小恶魔的嘴里滑落，你轻轻地把它放在地上。它轻轻地打了几下嗝，然后睡着了；你可以看到小恶魔的勃起已经缩回，它的肚子明显变大了。你对自己笑了笑，感到完全满足，你站了起来。");
         dynStats(DynStat.Lib(0.2),DynStat.Lust(-50));
         get_player().milked();
         get_combat().cleanupAfterCombat();
      }
      
      public function addKillPetrifyButtons(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         if(get_monster().get_short() == "imp overlord")
         {
            return false;
         }
         if(Boolean(Math.isNaN(param1)))
         {
            param1 = 0;
         }
         if(param1 >= 0 && get_monster().get_HP() < 1)
         {
            addButton(param1,"杀了他",killImp);
            _loc3_++;
         }
         if(Boolean(Math.isNaN(param2)))
         {
            param2 = param1 + 1;
         }
         if(impPetrifyable())
         {
            addButton(param2,"石化他",petrifyImp);
            _loc3_++;
         }
         return _loc3_ > 0;
      }
   }
}

