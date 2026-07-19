package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class InfestedChameleonGirlScene extends BaseContent
   {
      
      public var dreams:Array;
      
      public function InfestedChameleonGirlScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         dreams = [minotaurDream,mouseDream,impDream,anemoneDream,tentacleBeastDream];
      }
      
      public function tentacleBeastDream() : int
      {
         outputText("<b>野兽用它的一根触手给了你决定性的一击，将你击溃。</b>");
         outputText("[pg]你倒在地上，虚弱得无法自卫。注意到你的失败，野兽开始向你滑行，它那许多长着鸡巴尖的触手在你的身体周围和上面爬行，寻找可以侵犯的孔口。它们在你的[skin]上留下的粘液痕迹让你的皮肤变得格外敏感，没过多久你就注意到这些触手在不用于战斗时有多么娇嫩。它们在你的身体上游走，从你的[legs]到你的[breasts]尖端，你注意到你的呼吸越来越急促。欲望在你体内慢慢滋长，你越来越难以否认你现在有多想取悦自己。");
         outputText("[pg]思绪侵入你的脑海。你为什么认为你能赢这场战斗？当你明知道这些危险的树林里到处都是这种生物时，你为什么还敢来探索？");
         outputText("[pg]一根长满卷须的触手缠绕在你的一个乳房上，然后锁住你的一个乳头，猛烈地捏着它，引得你发出一声颤抖的呻吟。真相变得不可否认：你这样做是因为你想输。你想被这个怪物以不可思议的方式蹂躏，被锁在被迫的快感中几个小时，然后像个物品一样被扔掉，每个孔口都渗出腐败的体液。");
         outputText("[pg]你不由自主地挺起你的[hips]，引起了一根特别粗大的触手的注意。它迅速滑过你的臀部，钻到你的[butt]下面，毫不浪费时间，深深地插入你的屁眼。当它在你体内扭动时，你在痛苦和快感中尖叫，已经把大量非人的精液倾注到你体内。");
         outputText("[pg]一根触手缠绕在你的腹部，将你的身体举起，把你从恍惚中拉出来，让你能够真正专注于正在蹂躏你的生物。一根触手靠近你的嘴，猛烈地跳动着，渗出精液。你张大嘴巴，流着口水，但它在你够到之前就降了下来。它在你肿胀的[pussy]附近盘旋，引得你发出饥渴的呻吟。尽管你有强烈的欲望，但它并没有进去，只是摩擦你的[clit]和阴唇，仅仅是戏弄你的褶皱。你很快就明白了野兽在做什么；它想让你自己把它插进去，作为你投降的最终象征。");
         outputText("[pg]你给了它想要的东西。你伸出双臂，抓住那根粗大的触手鸡巴，抚摸着它跳动的尖端几下，让你的手上沾满了它的体液。然后你强行把它塞进自己体内，怪物粗暴地把它剩下的部分推入你的子宫。你的身体紧绷起来，你试图尖叫，但你所能发出的只有一声愉悦的呜咽。野兽开始以疯狂的节奏抽插你的两个洞，你瘫软下来，享受着被腐败怪物使用的快感，渴望它用精液淹没你的子宫。");
         outputText("[pg]你回过神来。你在做白日梦！与触手怪交配的想法充斥着你的脑海，你很难集中注意力，也很难控制自己不一直对着它自慰。你渴望触手鸡巴，最重要的是，触手怪的精液。");
         return 39;
      }
      
      public function parasiteUpdate() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc1_:Boolean = false;
         if(get_player().hasStatusEffect(StatusEffects.ParasiteEel))
         {
            if(!get_player().hasVagina())
            {
               outputText("[pg]没有了子宫来容纳寄生虫，它们枯萎死亡了。你想知道你的身体将如何摆脱它们，但想起你刚刚失去了一个子宫，没有任何痛苦或副作用；它们会以某种方式消失的。");
               get_player().removeStatusEffect(StatusEffects.ParasiteEel);
               get_player().removeStatusEffect(StatusEffects.ParasiteEelNeedCum);
               if(get_player().hasPerk(PerkLib.ParasiteQueen))
               {
                  get_player().removePerk(PerkLib.ParasiteQueen);
               }
               _loc1_ = true;
            }
            _loc2_ = get_player().statusEffectv1(StatusEffects.ParasiteEel);
            if(get_player().statusEffectv3(StatusEffects.ParasiteEelNeedCum) / _loc2_ >= 4)
            {
               _loc1_ = true;
               outputText("[pg]寄生鳗泵入你体内的致幻物质几乎让你瘫痪，但你的“冷火鸡疗法”似乎奏效了。<b>一只寄生虫饿死了！</b>");
               get_player().removeStatusEffect(StatusEffects.ParasiteEelNeedCum);
               dynStats(DynStat.Spe(-1),DynStat.Tou(-1),DynStat.Str(-1),DynStat.Sens(2),DynStat.Cor(2));
               get_player().addStatusValue(StatusEffects.ParasiteEel,1,-1);
               if(get_player().statusEffectv1(StatusEffects.ParasiteEel) <= 0)
               {
                  get_player().removeStatusEffect(StatusEffects.ParasiteEel);
                  outputText("\n很难计数，但你相信那是<b>你体内最后一只寄生鳗</b>了。");
                  if(get_player().hasPerk(PerkLib.ParasiteQueen))
                  {
                     get_player().removePerk(PerkLib.ParasiteQueen);
                  }
               }
            }
            if(get_player().statusEffectv2(StatusEffects.ParasiteEel) >= 2)
            {
               _loc1_ = true;
               outputText("[pg]你感觉到子宫里的蠕动蔓延得更深更广了。<b>你已经喂食了寄生虫足够多次。它们繁殖了。</b>");
               get_player().addStatusValue(StatusEffects.ParasiteEel,1,1);
               if(get_player().statusEffectv1(StatusEffects.ParasiteEel) == 5)
               {
                  outputText("你已经成了这些寄生虫名副其实的育母。你的大脑发生了一些变化；你感觉自己和它们之间产生了某种联系。它们明白自己的生存仰仗于你，现在你可以在战斗中向它们寻求帮助了！");
                  outputText("[pg]获得特质：<b>寄生虫女王！</b>");
                  awardAchievement("寄生虫女王",277,true,true);
                  get_player().createPerk(PerkLib.ParasiteQueen,0,0,0,0);
               }
               get_player().addStatusValue(StatusEffects.ParasiteEel,2,-3);
            }
            if(int(get_game().time.days % 3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2654) != get_game().time.days)
            {
               if(!get_player().hasStatusEffect(StatusEffects.ParasiteEelNeedCum))
               {
                  _loc1_ = true;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2654,int(get_game().time.days));
                  _loc3_ = int(dreams[Utils.rand(int(dreams.length))]());
                  get_player().createStatusEffect(StatusEffects.ParasiteEelNeedCum,0,_loc3_,_loc2_,0);
               }
               else if(get_game().time.days != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2654))
               {
                  _loc1_ = true;
                  outputText("\n<b>你体内的寄生虫变得更加饥饿了。</b>它们分泌出更多那种能扭曲心智的化学物质，这不仅削弱了你的身体，还让你越来越难以忽视那不断高涨的欲望。\n");
                  dynStats(DynStat.Spe(-1),DynStat.Tou(-1),DynStat.Str(-1),DynStat.Sens(2),DynStat.Cor(2));
                  get_player().addStatusValue(StatusEffects.ParasiteEelNeedCum,3,_loc2_);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2654,int(get_game().time.days));
               }
            }
            return _loc1_;
         }
         return _loc1_;
      }
      
      public function mouseDream() : int
      {
         outputText("[pg]<b>你脑海中浮现出你将一个年轻鼠人引诱到床上，在他的肉棒上起伏，听着他吱吱叫声而呻吟的画面。</b>你感到了欲望，你发现自己很难集中注意力，也很难克制自己不一直对着这些画面自慰。你渴望鼠人的肉棒，最重要的是，渴望鼠人的精液。");
         return 4;
      }
      
      public function minotaurDream() : int
      {
         if(get_player().hasPerk(PerkLib.ParasiteQueen))
         {
            outputText("[pg]<b>虽然费了一番功夫，但牛头人领主还是倒在了你面前。</b>");
            outputText("[pg]这头野兽瘫坐在地上，气喘吁吁，不服气地瞪着你。你带着胜利者的姿态走上前去，迫不及待地想要领取你的奖赏。你脱下衣服，露出饥渴的[vagina]，这让牛头人爆发出了一股原始的能量。你迅速一击再次将他打晕，并决定用他自己的锁链把他的双臂绑在一起。");
            outputText("[pg]牛头人还在试图挣脱，但很快就意识到这是徒劳的。他平静了下来，除了他那因为你刚才的展示而勃起、跳动着的阴茎。你笑了笑，用手指慢慢地挑逗着他那粗壮的肉棒，引得先列腺液拉成一条条长长的丝线喷涌而出。");
            outputText("[pg]你转过身，将你的小穴滑过他的龟头，准备好接纳他那巨大的肉棒。你慢慢来，享受着这头巨兽发出的沮丧呻吟。你稍微往下坐了一点，然后又退了出来，对这种程度的疼痛并不满足。你能看出牛头人很痛苦，但你知道他最终会享受的；在被他那令人迷醉的精液灌满之前，你不打算离开。");
         }
         else
         {
            outputText("[pg]<b>尽管你拼尽全力，但还是被牛头人打败了，毫无还手之力地任其摆布。</b>");
            outputText("[pg]然而，你知道自己为什么大老远跑到山里来。当牛头人靠近你时，他那巨大的肉棒硬了起来，你心中可能存在的任何恐惧都被对他精液的强烈渴望所取代。");
            outputText("[pg]他把肉棒对准你的脸，你流着口水，渴望着他的精液。想要舔舐他那膨大的龟头、舔尽他先列腺液的欲望几乎要将你淹没，但你勉强控制住了自己。你需要他用另一种方式来满足你。");
            outputText("[pg]你转过身，向他展示自己。他立刻挺身刺入你的体内，快感让你的大脑一片空白。被如此迅速地贯穿可能会很痛，但你不在乎。只有在被他的精液灌满之后，你才会满足。");
         }
         outputText("[pg]你猛地回过神来。你刚才在做白日梦！仅仅是想象着某个牛头人将你掰开，用他那令人上瘾的精液填满你，同时他的体味充满你的鼻腔，你就差点高潮了。你感到了欲望，你发现自己很难集中注意力，也很难克制自己不一直对着这些画面自慰。你渴望牛头人的肉棒，最重要的是，渴望牛头人的精液。");
         return 2;
      }
      
      public function loseToChameleonWithCockAnBallsAnCunt() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         spriteSelect(null);
         outputText("[pg][say:哈！你不会以为在</i>我的<i>沼泽里能打败我吧？]傲慢的变色龙大笑道。她向你走来，熟练地模仿着施虐狂的姿态扭动着宽大的臀部，一边走一边脱下备用的衣服。她停下来站在你面前，那锐利、充满欲望的目光相当吓人。你想知道她到底为你计划了什么，等待着你的命运。从她眼中担忧的神情，你能看出她根本不知道自己在做什么。");
         outputText("[pg][say:脱衣服。现在。如果逼我动手，你不会喜欢的，]她强硬地命令道。你虚弱得只能顺从，脱下了你的[armor]。");
         outputText("[pg]当你把最后一点[armor]放在水里时，你突然被击中胸部，被推倒在地。变色龙女孩宽大的脚把你按住，她看着你，眼中充满了疯狂的欲望。她突然皱起眉头。[say:你知道吗？我不渴望你的精液。我会用另一种方式使用你。]她脱下湿漉漉的丁字裤，坐在你旁边，把你的其中一条腿抬到她的肩膀上，靠近你，她的小穴几乎碰到了你的。触手慢慢地从她的阴道内部离开。尖端开始在你的" + get_player().vaginaDescript(0) + "周围探测，刷过你的[clit]，因为它在寻找你的入口。");
         outputText("[pg]她的眼睛依然死死盯着你，燃烧着欲望，要求你的配合。终于，她找到了位置，你无法抗拒，放松了小穴，任由她的一根触手滑入。她将自己的阴户紧贴着你的，你感觉到触手慢慢滑得更深。");
         get_player().cuntChange(25,true,true,false);
         outputText("尽管你身处困境，但这种刺激还是唤起了你的性欲；润滑液从你的小穴滴落，促使入侵者探索你体内的每一寸。就在你以为自己再也受不了的时候，触手缩了回去，回到了主人的体内。她恶意地咧嘴一笑，突然，触手再次爆发出来，猛烈地穿透了你。它缩了回去，开始在你体内抽插，同时挑逗你和它的主人");
         outputText("[pg]当触手在你的[vagina]里进进出出时，你喘着粗气；站在你旁边的女孩看起来对自己非常满意。她开始用她的小穴轻轻地摩擦你的，它的每一个动作都让你充满快感，你的嘴唇和阴蒂在被穿透时被摩擦。你被这种感觉弄得太兴奋了，以至于无法对她占你便宜感到生气，你的体液像水龙头一样从你的小穴和勃起的阴茎滴落");
         outputText("[pg]你被填满你的东西固定在原地。变色龙女孩摩擦得更用力了，注意到你勃起的[oneCock]，她解开尾巴，把它缠在你的阴茎上。她一边摩擦你一边抚摸，偶尔用她长尾巴的尖端慢慢地挑逗你的[cockhead]和尿道。她看着你的呼吸因为快感而变成喘息，笑了起来。");
         outputText("[pg]被填满和让你的" + get_player().cockDescript(_loc1_) + "被她的尾巴服务的快感实在是太好了，你很快就达到了高潮，把滚烫的精液溅在她的尾巴上。然而，她并没有停止摩擦你，你很快又被引向了高潮，这次是在你的女性部位。你呻吟着发出即将潮吹的信号，她迅速抓住你的手臂，确保你被锁定在她身上，直到她对你做完。当你喷出淫液时，触手完全滑了进去，离开了原来的主人，扭曲盘旋，仿佛在寻找什么。她放开了你，你在地上挣扎，入侵者不断的动作让你一直处于高潮状态。");
         outputText("[pg]她站起身，微笑着看着你的窘境，同时又有几根触手在她的阴道里进进出出，操着她直到她也高潮。[say:恭喜你，我的一个孩子喜欢你！起初，不停地渴望精液会很烦人，但你会学会享受它的。你可以把它当成一个任务！现在，我还需要我的那份，所以我就留你和你的新朋友好好享受吧。]");
         outputText("[pg]她把你留在地上翻滚，直到你因为持续的高潮而晕厥。当你晕倒时，那根像鳗鱼一样的触手找到了你子宫的入口，并在里面安顿下来。");
         eelInfest();
         get_player().orgasm("Vaginal");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToChameleonGirl() : void
      {
         clearOutput();
         spriteSelect(null);
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你失去了对自己不断增长的性欲的控制，你跪倒在地，拼命地想要脱下你的[armor]，去抚慰你那饥渴的身体。");
         }
         else
         {
            outputText("你虚弱得无法继续战斗，踉跄着后退，跪倒在地。");
         }
         if(get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            loseToChameleonWithCockAnBallsAnCunt();
         }
         else if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            dudesLoseToChamChams();
         }
         else if(get_player().hasVagina())
         {
            loseToChamChamWithPCCunt();
         }
         else
         {
            outputText("[pg]变色龙女孩把你从头到脚打量了一番，但没有发现生殖器，她呻吟着，狠狠地扇了你一巴掌，让你晕了过去。");
            get_player().takeDamage(20);
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function loseToChamChamWithPCCunt() : void
      {
         spriteSelect(null);
         outputText("[pg][say:哈！你不会以为在</i>我的<i>沼泽里能打败我吧？]傲慢的变色龙大笑道。她向你走来，熟练地模仿着施虐狂的姿态扭动着宽大的臀部，一边走一边脱下备用的衣服。她停下来站在你面前，那锐利、充满欲望的目光相当吓人。你想知道她到底为你计划了什么，等待着你的命运。从她眼中担忧的神情，你能看出她根本不知道自己在做什么。");
         outputText("[pg][say:脱衣服。现在。如果逼我动手，你不会喜欢的，]她强硬地命令道。你虚弱得只能顺从，脱下了你的[armor]。");
         outputText("[pg]当你把最后一件[armor]放在水里时，你突然胸口挨了一击，被推倒在地。变色龙女孩宽大的脚把你按住，她看着你，眼中充满了疯狂的欲望。她突然皱起眉头。[say:我希望你的小穴是个好归宿。]她脱下湿漉漉的丁字裤，坐在你旁边，把你的其中一条腿抬到她的肩膀上，然后靠近，她的小穴几乎碰到了你的。触手慢慢地从她的阴道里伸出来。触手尖端开始在你的" + get_player().vaginaDescript(0) + "周围探测，刷过你的[clit]，摸索着你的入口。");
         outputText("[pg]她的眼睛依然死死盯着你，燃烧着欲望，要求你的配合。终于，她找到了位置，你无法抗拒，放松了小穴，任由她的一根触手滑入。她将自己的阴户紧贴着你的，你感觉到触手慢慢滑得更深。");
         get_player().cuntChange(25,true,true,false);
         outputText("尽管处境堪忧，这种刺激还是唤起了你的情欲；润滑液从你的小穴滴落，促使入侵者探索你体内的每一寸。就在你以为自己再也受不了的时候，触手缩了回去，回到了主人的体内。她恶意地咧嘴一笑，突然，触手再次猛烈地刺出，粗暴地插入了你。它缩回，然后开始在你体内抽插，同时挑逗着你和它的主人。");
         outputText("[pg]当触手在你的[vagina]里进进出出时，你喘息着；站在你旁边的女孩看起来对自己非常满意。她开始用她的小穴轻轻地摩擦你的，它的每一次移动都让你充满快感，在被插入的同时，你的阴唇和阴蒂也被摩擦着。你被这种感觉弄得太兴奋了，以至于无法对她占你便宜感到生气，你的爱液像水龙头一样从小穴里滴落。她看着你的呼吸因为快感而变成喘息，笑了起来。");
         outputText("[pg]被填满以及阴唇和阴蒂被挑逗的感觉实在是太好了。你呻吟着，示意你即将潮吹，她迅速抓住你的手臂，确保你被锁定在她身上，直到她完事。当你喷出淫液时，触手完全滑入，离开了它原来的主人，扭动盘旋着，仿佛在寻找什么。她松开了你，你在地上翻滚，入侵者不间断的动作让你一直处于高潮状态。");
         outputText("[pg]她站起身，微笑着看着你的窘境，同时又有几根触手在她的阴道里进进出出，操着她直到她也高潮。[say:恭喜你，我的一个孩子喜欢你！起初，不停地渴望精液会很烦人，但你会学会享受它的。你可以把它当成一个任务！现在，我还需要我的那份，所以我就留你和你的新朋友好好享受吧。]");
         outputText("[pg]她把你留在地上翻滚，直到你因为持续的高潮而晕厥。当你晕倒时，那根像鳗鱼一样的触手找到了你子宫的入口，并在里面安顿下来。");
         eelInfest();
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function impDream() : int
      {
         if(get_player().hasPerk(PerkLib.ParasiteQueen))
         {
            outputText("[pg]<b>经过一场漫长而艰苦的战斗，你击倒了一名小恶魔领主。</b>他仰面倒下，你舔了舔嘴唇，期待着品尝你的战利品。你走到倒下的恶魔身边，轻轻踢了踢他的臀部，他的肉棒立刻有了反应。它在他的缠腰布里顶起了一个帐篷，你笑了。");
            outputText("[pg]你抓住那根恶魔的肉棒撸动了几下，看着它在你的手中变硬，你流下了口水。小恶魔试图抓住你的手臂来控制局面，但你迅速挣脱，再次将他推倒在地。你将你那酥麻的[vagina]对准他的肉棒，将你那寄生虫的粘液滴在上面，使它变得肿胀，淫靡地跳动着。");
            outputText("[pg]你缓缓坐下，当它轻易地滑入你体内时，你发出了愉悦的呻吟。静止了片刻，感受着小恶魔阴茎的尺寸和质感后，你开始骑乘他。你大概要几个小时后才会结束。");
         }
         else
         {
            outputText("[pg]<b>你被击倒了，在一群小恶魔的围攻下败下阵来。</b>");
            outputText("[pg]他们向你走来，向你展示着他们已经硬起来的肉棒，跳动着，喷吐着先列腺液。你没有感到排斥，反而感到了欲望。你满怀期待地涨红了脸，[if (tailLeg) {用手指滑过你的胯部|跪了下来}]，露出你的[vagina]，准备好被他们占有、蹂躏几个小时，甚至几天。");
         }
         outputText("[pg]你猛地回过神来。你刚才在做白日梦！被小恶魔操的念头充斥着你的大脑，你发现自己很难集中注意力，也很难克制自己不一直对着它自慰。你渴望小恶魔的肉棒，最重要的是，渴望小恶魔的精液。");
         return 1;
      }
      
      public function encounterChameleon() : void
      {
         clearOutput();
         spriteSelect(null);
         outputText("你在沼泽茂密的植被中穿行，拨开树枝，在厚厚的泥浆中跋涉，寻找着新的东西。你感到精疲力竭，放慢了脚步，寻找一个可以休息的地方；一个小空地，有浅水和坚实的地面，似乎符合要求，你靠在树上坐下，喘口气。你现在已经湿透了，几乎没有注意到你下面浑浊的水和树干上滑溜溜的泥浆渗入你的[armor]。");
         outputText("[pg]身后突然传来一阵刮擦声！你及时转过身，看到一个变色龙女孩熟悉的身影从树上剥落下来。她这样做缓慢而挑逗，让你有些惊讶。");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            outputText("[pg][say:这味道……精液，而且正是那种味道。我最近太饿了，简直要疯了！你闯入了我的沼泽，所以我有权强奸你，直到你失去知觉。]");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("[pg][say:这味道……一个新鲜的，等待着的小穴！我会给你一份礼物，让你的子宫一直刺痛，即使你闯入了我的沼泽。]");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[pg][say:这味道——什么？！你入侵了我的沼泽，甚至连让我操的东西都没有？]");
         }
         outputText("你举起你的[weapon]，准备迎接她的攻击！");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,561,FlagDict_Impl_.arrayReadInt(_loc1_,561) + 1);
         startCombat(new InfestedChameleonGirl());
      }
      
      public function eelInfest() : void
      {
         get_player().createStatusEffect(StatusEffects.ParasiteEel,1,0,0,0);
         if(get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
         {
            outputText("[pg]生活在你体内的史莱姆被新的寄生虫毫不费力地杀死了。");
            get_player().removeStatusEffect(StatusEffects.ParasiteNephila);
            get_player().removeStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2921,0);
            get_player().removePerk(PerkLib.NephilaQueen);
            get_player().removePerk(PerkLib.NephilaArchQueen);
         }
      }
      
      public function dudesLoseToChamChams() : void
      {
         var _loc1_:int = Utils.rand(get_player().totalCocks());
         spriteSelect(null);
         outputText("[pg]意识到你没有危险后，她微笑着向你走来。她诱人地扭动着臀部，慢慢地在水中跋涉，伴随着响亮的咂嘴声舔了舔嘴唇，然后伸出手，在你甚至来不及抵抗她的攻势之前，强行将你的[armor]拉到腰部以上，并将你推到一棵树上。她三下五除二地脱掉了自己的衣服，把丁字裤扔到了一根低垂的树枝上。她用另一条丝带迅速绑住了你的手腕。如果你有反抗的余地，你本可以挣脱，但你太");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("被欲望冲昏了头脑");
         }
         else
         {
            outputText("遍体鳞伤");
         }
         outputText("以至于连这临时的束缚都无法撕开。");
         outputText("[pg]她急于看到她的战利品，三下五除二地脱掉了你的[armor]，然后站起身来，仍然低着头，让她的舌头从嘴里伸出来，找到了[oneCock]。她展现出惊人的控制力，成功地将那条温暖的粉红色附肢缠绕在你的肉棒上，用她温暖的舌头在你阴茎上滑上滑下，几乎就像在给你按摩一样。当她只用舌尖在你的阴茎下方搔痒，在龟头周围留下粘稠的唾液时，你轻轻地颤抖着。你的阴茎很快就勃起并因为渴望而跳动；她满意地将那条细长的肌肉吸回嘴里。");
         outputText("[pg]变色龙女孩用右手和右脚抓住树干，将自己拉起来，让她的私处悬挂在你的面前。当她调整姿势时，你试图跌跌撞撞地逃出她的触及范围，但她用左手抓住了你的手腕，强行将它们举过你的头顶按在树干上，并将你的手腕背面摩擦树干作为惩罚。她悬挂在你身旁的左腿，将你猛地拉回树干上，让你和树之间几乎没有移动的空间。你虚弱地试图挣脱，但她的抓握力出奇地大，像老虎钳一样将你困住。伴随着一声呻吟，你放松下来，听任自己被强暴。");
         outputText("[pg]她那湿漉漉的阴户在你的脸上摩擦，显然渴望得到关注。你本能地转过头去，但她立刻又把你的手臂在粗糙的树皮上蹭破了皮。你把脸埋进她的小穴里，尽你所能地舔舐她，好让这个过程快点结束。你上方传来一声尖锐的喘息；显然，她没想到对她私处的攻势来得这么快。她那带着麝香的气味充满了你的鼻腔，与潮湿的沼泽空气出奇地相配。你感觉到有什么东西抓住了你的" + get_player().cockDescript(_loc1_) + "，并意识到她一定是把脚移到了上面。她的脚趾显然和手指一样擅长抓握，幸运的是，她的脚底覆盖着和她躯干正面一样柔软的皮肤。由于沼泽水的缘故，它仍然湿润光滑，在你的肉棒上轻松滑动，她的脚趾以令人印象深刻的灵巧度揉弄着你的肉棒，带给你的快感超乎你的想象。随着她的呻吟，一股女性的体液涌出，浸湿了你的脸，然后她把自己推了回去。当她移开脚并小心翼翼地往下爬了一点时，你感激地喘了几口气，她拉着你被绑住的手臂，这样她现在就处于可以把自己刺穿在你的" + get_player().cockDescript(_loc1_) + "上的位置了。");
         outputText("[pg]她用她小穴光滑的褶皱挑逗着你的龟头，一边一点一点地向前爬行，一边稍微旋转着。到现在，你的渴望已经变得如此强烈，以至于你甚至不在乎自己被强暴，或者她如何进行，只在乎你必须发泄出来。你充满欲望地呻吟着，变色龙女孩绽放出灿烂的笑容，顺着你的肉棒滑下，将你");
         if(get_player().cockArea(_loc1_) <= get_monster().vaginalCapacity())
         {
            outputText("吞没至根部");
         }
         else
         {
            outputText("尽可能深地插入她体内");
         }
         outputText("。她眯起眼睛，呻吟着。她开始喘息，并扭动着宽大的臀部，在你的阴茎上微微上下滑动，没有将自己拉开超过几英寸。她在树干上支撑着自己时，臀部能够做出的动作范围令人惊叹，你看着女孩有节奏地左右、前后、一圈又一圈地摇摆着臀部，慢慢地，慢慢地在你的阴茎上挑逗着向上移动几英寸，在向下滑动时做出同样受控的动作。你不知道自己还能承受多少这种快感。你想猛烈地撞击她光滑的小穴，但你被迫只能站在那里，感受她臀部每一次平滑的动作让你因欲望而发狂。");
         outputText("[pg]显然，变色龙女孩也快到极限了。几英寸长的舌头从她嘴里伸出来，每次她因快感而喘息或呻吟时，都会滑出更多，当她茫然地盯着你的阴茎根部时，她的眼睛看起来几乎是对眼的。她的臀部开始更加不规则地移动，每次推拉都会将你更多地吞入和吐出。很快，她就放弃了缓慢、挑逗的动作，只是在你的阴茎上上下骑乘，拼命地将它猛烈地插入和拔出，试图达到高潮。她的乳房狂野地弹跳着，头向后仰，每次她压在你身上时，都会有更多的舌头伸出来。快感太强烈了，你觉得你几乎无法再忍受一刻。射精的渴望在你的脑海中轰鸣，将所有其他想法都排挤出去。骑在你" + get_player().cockDescript(_loc1_) + "上的女孩的呻吟声你几乎没有注意到，因为你将你的精华释放到她体内");
         if(get_player().cumQ() > 1500)
         {
            outputText("，大量的精液灌满了她，甚至溢了出来，滴落到下方的水面上");
         }
         outputText("。你惊讶地感觉到，有什么东西从她的阴道里缠上了你的阴茎，试图强行榨出你最后几滴精液。高潮后如此迅速的刺激让你在束缚中挣扎，但无济于事。变色龙女孩加快了速度，继续用臀部摩擦你的腹股沟，而她体内的奇怪附肢则在帮助套弄你的阴茎。尽管你正经历着痛苦的快感，但她们还是成功地从你身上榨出了另一次高潮，几乎让你晕厥过去。");
         outputText("[pg]你那疲软的阴茎从她体内滑出，她跳了下来，已经开始抚摸自己的阴蒂，充满了欲望。她猛地将你依然被绑着的手腕拉向地面。你瘫倒在地，反正也站不住了。变色龙女孩嘟囔着，[say:我的宝宝们吃饱了。我还能再来，但操一根射不出来的鸡巴也没什么意思。]");
         outputText("[pg]一点精液从她的小穴里漏了出来，她迅速用手将其舀起。她看着它，欣赏着它的浓稠度。[say:当你充满精液又饥渴的时候，随时欢迎来我的沼泽，]她一边说着，一边解开你手腕上的丝线，重新穿好衣服。她踩着水花离开了，留下你一个人在寂静中。你花了好一会儿才从刚才的经历中恢复过来，然后才勉强打起精神，从泥潭里爬出来，回到你的营地。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function defeatChameleonGirl() : void
      {
         var _g:Combat;
         clearOutput();
         spriteSelect(null);
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("变色龙女孩无法控制自己的情欲，跪倒在地，开始在丁字裤下自慰，已经完全失去了与你战斗的能力；她呻吟着，仰起头，手在她跪着的水里拍打着。她的皮肤恢复了通常的[monster.skin]，然后继续变化，随着她呻吟声的音量和语速的增加，越来越接近粉红色。");
            if(get_player().get_lust() >= 33)
            {
               outputText("你考虑帮她高潮，但突然，几根触手从她流着淫液的小穴里猛地伸出，愤怒地朝你的方向抽打。你显然不受她生殖器的欢迎。");
            }
         }
         else
         {
            outputText("变色龙女孩虚弱得无法继续战斗，筋疲力尽地跪倒在地。她的皮肤恢复了通常的[monster.skin]，无法维持伪装。");
            if(get_player().get_lust() >= 33)
            {
               outputText("你考虑用她来发泄，但突然，几根触手从她流着淫液的小穴里猛地伸出，愤怒地朝你的方向抽打。你显然不受她生殖器的欢迎。");
            }
         }
         if(get_player().get_lust() < 33 || get_player().get_gender() == 0)
         {
            get_combat().cleanupAfterCombat();
            return;
         }
         _g = get_combat();
         addButton(0,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function anemoneDream() : int
      {
         outputText("[pg]<b>你脑海中充满了你被海葵的催情液充满，然后被无情地操弄的画面。</b>你感到了欲望，你发现自己很难集中注意力，也很难克制自己不一直对着这些画面自慰。你渴望海葵的肉棒，最重要的是，渴望海葵的精液。");
         return 10;
      }
   }
}

