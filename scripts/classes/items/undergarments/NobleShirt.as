package classes.items.undergarments
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Mutations;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.undergarments._NobleShirt.SaveContent;
   import classes.lists.ColorLists;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import flash.Boot;
   
   public class NobleShirt extends Undergarment implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var transformChecked:Boolean;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function NobleShirt()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         transformChecked = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "nobleshirt";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
         super("Nob.Shirt","Noble\'s Shirt","fancy shirt","a fancy shirt",0,100,"A fancy white shirt fit for nobility, with translucent-thin fabric.",2);
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(2),false);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function wearingEnchanted() : Boolean
      {
         if(saveContent.enchanted)
         {
            return get_player().get_upperGarment() == this;
         }
         return false;
      }
      
      override public function useText() : void
      {
         saveContent.isSoftReset = false;
         if(isNormalShirt())
         {
            super.useText();
         }
         else
         {
            outputText("虽然是在水边发现的，但这件看起来很华丽的衬衫很干燥，而且状况良好。胸前的褶边让它看起来有一种贵族的气质，而且布料是完美无瑕的白色——尽管薄得连你的[skinfurscales]都能看穿。这并不能提供很好的保护，但材料相当舒适，你可以很容易地在外面穿上盔甲。[if (!isnakedupper) {过了一会儿，你脱下了你的[armor]|事不宜迟}]，你把这件贵族衬衫套在自己身上，发现它很适合你的[if (isfatbuild) {\"体格\"|体格}]。你觉得可能需要做一些微调，因为你的[hand]徒劳地试图把臀部弄平。");
            outputText("[pg]不，你重新考虑了你的评估。在两侧，靠近背部的地方，有一些东西挤在一起。把它抖松后，一大段布料分成两片垂在你的[butt]上，很快就垂到了[if (singleleg) {离地不远的地方|[if (istaur) {你的兽躯上|你的膝盖处}]}]，就像燕尾服或者没有前面的裙子。你想知道整套衣服本来应该是什么样子的。");
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(!wearingEnchanted())
         {
            return false;
         }
         if(!get_player().sleeping || get_time().hours != 4)
         {
            return false;
         }
         if(saveContent.armorStage == 6)
         {
            return false;
         }
         if(!transformChecked && saveContent.transformDay != get_time().days)
         {
            transformChecked = true;
            if(Utils.randomChance(10 + (!get_player().hasPerk(PerkLib.LoliliciousBody) ? (get_time().days - saveContent.transformDay) * 10 : 0)))
            {
               nightTransformation();
               saveContent.transformDay = get_time().days;
               return true;
            }
         }
         if(saveContent.armorStage == 5)
         {
            nightTransformation();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         transformChecked = false;
         if(!saveContent.isSoftReset && isGoneCompletely())
         {
            softReset();
         }
         return false;
      }
      
      public function softReset() : void
      {
         saveContent = new SaveContent(null,null,null,saveContent.unequipTried,saveContent.campDay,null,saveContent.burnEvent,saveContent.rathazulEvent,saveContent.facePlant,saveContent.rathazulAsked,saveContent.izmaAsked,null,null,null,null,null,saveContent.arianAsked,null,null,true);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
      }
      
      override public function removeText() : void
      {
         if(isNormalShirt())
         {
            return;
         }
         if(!saveContent.bound)
         {
            outputText("[pg]暂时穿够了这件衬衫，你开始把它脱下来——它撕裂了！它在你[hands]里这么容易就散架了，能穿上简直是个奇迹。至少它很容易脱下来……[pg]");
            get_player().setUndergarment(UndergarmentLib.NOTHING,0);
            return;
         }
         if(saveContent.unequipTried)
         {
            outputText("[pg]拉扯着这件被诅咒的内衣，你的[if (hasgooskin) {史莱姆|[if (hasplantskin) {植物-}]肉体}]像被鞭打一样刺痛！这种疼痛令人不快，虽然可能还能忍受，但你的手臂拒绝使出全力。");
         }
         else
         {
            if(saveContent.armorStage >= 3)
            {
               outputText("[pg]能拉扯的只有你身后带褶边的布料，但那也足够抓握了。你向后伸出手，笨拙地用力一拉，痛得大叫起来！就好像有几十个钩子把你撕碎一样，而且大部分的疼痛来自裙子[i:内部]，就像你自己的[skin]一样生动。");
            }
            else
            {
               outputText("[pg]尽管这件衣服很吸引人，但你现在打算把它脱下来。然而，当你触摸它时，它紧贴着你的[skin][if (isgoo) {，增加了你薄膜的表面张力，直到它更像薄橡胶|[if (hasfur || hasscales) {，紧紧抓住下面的肉，就好像[skinfurscales] [if (hasScales) {根本不|根本不}]存在一样}]}]。衬衫在你的手指下变得更紧，拒绝了你。深吸一口气，你把[claws]抠进去，用力一拉——痛得[i:尖叫]了一会儿。这种感觉可以比作被几十个锋利的鱼钩钩住。即使它可能拒绝被脱下，你期望这种半透明的薄布料至少会撕裂！");
            }
            saveContent.unequipTried = true;
         }
      }
      
      public function pickMajorEvent() : Boolean
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as Array;
         if(get_player().gills.type == 3 && Utils.randomChance(20))
         {
            if(!saveContent.burnEvent)
            {
               outputText("[pg]你深吸了一口气——或者说，你试图深呼吸，但却引发了一阵短暂的咳嗽。");
               saveContent.burnEvent = true;
               get_player().changeFatigue(10);
               return true;
            }
            if(!saveContent.rathazulEvent && get_game().rathazul.followerRathazul())
            {
               outputText("[pg]猛吸一口气变成了一阵痛苦的咳嗽，引起了附近炼金术士的注意。拉萨祖尔似乎快速瞥了一眼你的鳃，并递给你一些水。[say:给，[name]。我手边备有干净的水，喝点吧。]你从他布满皱纹的手中接过水壶，表达了感谢，水流过喉咙的舒缓感让你感到极大的宽慰。[say:你必须更加小心，]他警告说。[say:这个世界上的许多东西都会改变你。]");
               saveContent.rathazulEvent = true;
               get_player().changeFatigue(-5);
               return true;
            }
            if(!saveContent.facePlant && get_player().isFullMermaid())
            {
               outputText("[pg]在地上滑行时，你遇到了意想不到的阻力，身体猛地向前倾！凭借稳健的姿势，你勉强没有脸朝下摔在干燥开裂的泥土上，但这还是让你吓了一跳。在陆地上移动需要一种特殊的技巧——每一个动作都必须优雅，以避免陷入泥土或肌肉僵硬。");
               femBoost(3);
               saveContent.facePlant = true;
               dynStats(DynStat.Spe(-1));
               return true;
            }
         }
         if(saveContent.armorStage >= 3 && wearingEnchanted() && Utils.randomChance(5))
         {
            _loc1_ = ["在营地闲逛时，你用[hand][if (!hasHair) {摸了摸头皮。也许你应该考虑恢复你的头发|梳理着你的[hair]，享受着它被打理得井井有条的感觉。保持这样的状态是非常值得的}]。"];
            if(get_player().isBiped())
            {
               _loc1_.push("在火坑旁休息时，你翘起二郎腿，感觉更加舒适，也更有精神了。");
            }
            outputText("[pg]");
            _loc2_ = _loc1_;
            outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
            decreaseCockAndBalls(0.2,0.1);
            femBoost(2);
            return true;
         }
         return false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nightTransformation() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as BreastRow;
         clearOutput();
         switch(saveContent.armorStage)
         {
            case 1:
               outputText("你睁开眼睛，看到了一片湛蓝的天空。水在你的[ears]边拍打的声音是你唯一能听到的。空气中弥漫着大海的气息。你对这一刻的宁静感到庆幸，但一个小浪头拍打在你的脸上，让你喘不过气来，使你陷入了恐慌！当你挣扎时，沉重的阻力减缓了你手臂的动作，你发现自己现在完全浸没在水中，胸口感到异常紧绷。");
               outputText("[pg]你睁开眼睛，看到了[if (builtcabin) {你的木屋|你的营地}]。一种压倒性的重量仍然压迫着你的肺部，你低头一看，发现原本宽松的衬衫现在紧紧贴在你的[skinfurscales]上。衣领也平整地贴在你的脖子上……然而，并没有迫在眉睫的危险。梦中的宁静感再次袭来，让你重新进入梦乡，[b:脸上带着温柔的表情。]");
               femBoost(4);
               dynStats(DynStat.Spe(-2));
               saveContent.armorStage = 2;
               break;
            case 2:
               outputText("横膈膜的剧烈收缩让你陷入了一阵咳嗽；你的喉咙干得似乎要塌陷了。你用尽全力，在沙滩上向绿洲爬去，并在最后一次冲刺中扑了进去！");
               outputText("[pg]你在营地附近的小溪中醒来，不停地咳嗽和吐水。你只能假设自己是在梦游。[if (hasgills) {你把自己拖上岸，呻吟着，感觉比平时吸了更多的水。虽然你伸展身体并深吸了几口气，但那种感觉仍然困扰着你，很明显它来自你的[b:鳃。]里面薄薄的组织细丝变得更加敏感了。|不知不觉中，你的[hand]紧紧抓住了你的脖子——感觉就像被几把剃刀割伤了一样[if (!isgoo) {，更令人不安的是，你发现手掌上有血}]！你把自己拖上岸，盯着水面，努力想看清自己的倒影：衬衫的领子不见了，取而代之的是脖子两侧的几道水平裂缝。你赶紧去冲洗伤口，水花溅在上面，液体在片刻间提供了难以置信的缓解。事实上，它令人精神振奋，就像呼吸到了新鲜空气；但是，[i:仅仅]是片刻，因为它很快就收缩了，就像你的喉咙变干了一样。轻微的窒息感让你感到担忧，你再次检查了那些裂缝。把它们撑开，你看到了许多薄薄的组织细丝，但在水外完全暴露出来会让它变得非常疼痛。[b:鳃。]}]");
               outputText("[pg]它又烧又痛。幸运的是，虽然很不舒服，但你[i:仍然]可以呼吸空气。你叹了口气，抬头看着天空。看来新的一天马上就要开始了。");
               get_mutations().updateGills(3);
               femBoost(4);
               dynStats(DynStat.Spe(-2));
               saveContent.armorStage = 3;
               break;
            case 3:
               outputText("冲破水面，开阔的空气让你的[skin]感到刺痛。当你把自己拖上岸时，晴朗的阳光温暖了你的鳃。流畅清晰的话语从你的唇间溜出，赞美着那柔和光线带来的舒缓热量，你尾巴上宽大的鳍将更多的水扫到自己身上，以防止自己变干。然后你叹了口气；你的胸部感觉肿胀且敏感。当你伸手抚摸你的[breasts]时，差异是显而易见的。");
               outputText("[pg]你在你的[cabin]里醒来，[hand]抚摸着你娇嫩的[skinfurscales]。衬衫不见了！无论谁为你提供了这项服务，都绝对赢得了你的感激，但也许这只是偶然。你兴高采烈地起身，[walk]到小溪边，看看重获自由的自己。");
               outputText("[pg]然而，在你迈步时，真相大白：垂在你身后的半身裙还在那里，薄如蝉翼，而且是[if (hasscales) {[scalecolor]|浅色}]的。你现在加快了脚步，凝视着水中的倒影。你的[skinfurscales]似乎变得更加精致了——除了肋骨处，衬衫的某种纹理还没有完全消失。背部的垂坠物与你相连，当你触摸它时，你打了个寒颤。它不再是布料了，这是你身体真正的延伸！复杂的情感笼罩着你的心。然而，扭动你的[hips]，至少能让裙子以一种迷人的方式旋转起来。你曾想过改善自己的风格，而这确实很适合……平静下来后，你直起身子，回到床上，度过夜晚剩下的几个小时。");
               femBoost(4);
               _loc1_ = 0;
               _loc2_ = get_player().breastRows;
               while(_loc1_ < int(_loc2_.length))
               {
                  _loc3_ = _loc2_[_loc1_];
                  _loc1_++;
                  if(_loc3_.breastRating < (get_player().isChild() ? 1 : 2))
                  {
                     _loc3_.breastRating += 1;
                     break;
                  }
               }
               decreaseCockAndBalls(2.5,1.5);
               saveContent.armorStage = 4;
               break;
            case 4:
               outputText("在漆黑的夜空下仰面漂浮，真的很宁静。鳃上的水能让你比在干燥的床上更好地放松，潮湿的空气和河边草地的气味比你在[cabin]里闻到的任何气味都要自然得多。你心想，这一定又是一个梦，就像其他梦一样，你[legs]的酸痛感让你确信这种平静不会持久。即使在冰冷的水中，你下半身的灼热感也很强烈。试图游向岸边只会让你僵硬的[if (singleleg) {肢体|肢体}]更加疼痛。恶心感充满了你的胃，你痛苦地皱起眉头；下面的压力越来越大，直到一种可怕且令人作呕的[i:断裂]感让这一切完全麻木。");
               outputText("[pg]盯着夜空，你不敢看其他任何地方，太紧张了，不敢看发生了什么。");
               saveContent.armorStage = 5;
               break;
            case 5:
               outputText("虽然时间一分一秒地过去，但你并没有感觉到胸口的紧张感消失。如果不是擦到了岸边——松散的泥土和沙子抓住了你的手臂，你可能会一直僵在这个姿势。这个变化让你从呆滞的凝视中解脱出来，你终于低头看了看你的——你修长而美丽的尾巴，末端装饰着半透明的鳍。人鱼的下半身在水外微微挣扎着向你弯曲，但你很快就够到了鳍，用手指摩擦着它柔软丝滑的纹理。如果受到挤压，它很容易贴合你的身体，并且可以张开得足够宽，以便在游泳时提供极好的控制力。");
               outputText("[pg]你不是在做梦。这就是你现在的身体。");
               if(get_player().smallestCockLength() <= 5 || !get_player().hasVagina())
               {
                  if(get_player().smallestCockLength() <= 5 && !get_game().get_hyper())
                  {
                     get_player().removeCock(get_player().smallestCockIndex(),1);
                     get_player().balls = 0;
                  }
                  if(!get_player().hasVagina())
                  {
                     get_player().createVagina();
                  }
                  outputText("你又摸索了一会儿，很快就探查到了耻骨下方不远处那道长满鳞片的裂隙。在这个泄殖腔里，你能明显感觉到少了些什么。很难说到底发生了什么，你注意到了[genitalsdetail]。一切都在你的意料之中，但还是感觉有些不对劲。");
               }
               outputText("你一路挣扎着爬上岸，决定回床上去，不幸的是，离开水后你拖着身体移动得相当缓慢。");
               get_player().lowerBody.type = 32;
               get_player().lowerBody.legCount = 1;
               get_player().tail.type = 0;
               get_player().tail.venom = 0;
               get_player().tail.recharge = 0;
               if(get_player().hasScales() || get_player().hasReptileUnderBody())
               {
                  get_player().underBody.setProps({
                     "type":7,
                     "skin":{
                        "type":6,
                        "desc":"鳞片"
                     }
                  });
               }
               else
               {
                  _loc2_ = ColorLists.MERMAID_SCALE;
                  get_player().underBody.setProps({
                     "type":7,
                     "skin":{
                        "type":6,
                        "tone":_loc2_[Utils.rand(int(_loc2_.length))],
                        "adj":"",
                        "desc":"鳞片"
                     }
                  });
               }
               get_player().arms.updateClaws(get_player().arms.claws.type);
               dynStats(DynStat.Spe(-20));
               get_player().createPerk(PerkLib.MermaidChant);
               saveContent.armorStage = 6;
         }
         doNext(playerMenu);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function knownBound() : Boolean
      {
         if(saveContent.bound)
         {
            return saveContent.unequipTried;
         }
         return false;
      }
      
      public function isNormalShirt() : Boolean
      {
         if(!saveContent.bound)
         {
            return !saveContent.enchanted;
         }
         return false;
      }
      
      public function isGoneCompletely() : Boolean
      {
         if(!saveContent.gretaBoughtUnbind && !saveContent.arianDisenchant)
         {
            return !get_player().hasItemAnywhere(this);
         }
         return false;
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = super.get_description();
         if(saveContent.unequipTried)
         {
            if(!saveContent.enchanted && !saveContent.bound)
            {
               _loc1_ += "[pg]目前未绑定且已驱散";
            }
            else if(!saveContent.bound)
            {
               _loc1_ += "[pg]目前未绑定";
            }
            else if(!saveContent.enchanted)
            {
               _loc1_ += "[pg]目前已驱散";
            }
            if(saveContent.enchanted && saveContent.bound)
            {
               _loc1_ += "[pg]目前被诅咒";
            }
         }
         return _loc1_;
      }
      
      public function get_debugName() : String
      {
         return "贵族衬衫";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function femBoost(param1:int) : void
      {
         get_player().modFem(get_player().femininityHigh(),param1);
      }
      
      public function decreaseCockAndBalls(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Cock;
         if(get_game().get_hyper())
         {
            return;
         }
         if(get_player().hasCock())
         {
            _loc3_ = 0;
            _loc4_ = get_player().cocks;
            while(_loc3_ < int(_loc4_.length))
            {
               _loc5_ = _loc4_[_loc3_];
               _loc3_++;
               if(_loc5_.cockLength >= 2 + param1)
               {
                  _loc5_.cockLength -= param1;
                  break;
               }
            }
         }
         if(get_player().hasBalls() && get_player().ballSize >= 1 + param2)
         {
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize - param2;
         }
         outputText("[pg]");
         get_player().lengthChange(param1 * -1,int(get_player().cocks.length));
         outputText("[pg]");
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null));
      }
      
      public function campEventsMinor() : void
      {
         var _loc3_:* = null as Array;
         if(Utils.randomChance(90))
         {
            return;
         }
         var _loc1_:Array = ["坐在相对安全的营地里，你考虑了一下自己的姿势。更好的姿势会对你更有利。","当你在营地里放松警惕时，你几乎发现自己无精打采，但你改变了主意，挺直了身子，摆出了一个更优雅的姿势。","在冒险的间隙，你花点时间努力擦去[hands]上积聚的任何沙砾或污垢。"];
         var _loc2_:Array = [];
         if(wearingEnchanted())
         {
            _loc2_.concat(["你的思绪飘忽了一会儿，渴望着什么。","你[walking]穿过营地时微微踉跄了一下。","你调整了一下你的[armor]，把它理平并拍掉上面的灰尘。"]);
         }
         if(saveContent.burnEvent && Utils.randomChance(50))
         {
            _loc2_.concat(["你的思绪飘忽了一会儿，渴望着什么。","你[walking]穿过营地时微微踉跄了一下。","你调整了一下你的[armor]，把它理平并拍掉上面的灰尘。"]);
         }
         if(wearingEnchanted() && Utils.randomChance(50))
         {
            _loc3_ = _loc1_;
            outputText("[pg]" + _loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
            femBoost(1);
         }
         else if(int(_loc2_.length) > 0)
         {
            _loc3_ = _loc2_;
            outputText("[pg]" + _loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
         }
      }
      
      public function campEventsMajor() : Boolean
      {
         if(saveContent.campDay == get_time().days)
         {
            return false;
         }
         var _loc1_:Boolean = pickMajorEvent();
         if(_loc1_)
         {
            saveContent.campDay = get_time().days;
         }
         return _loc1_;
      }
   }
}

