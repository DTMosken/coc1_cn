package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.FollowerInteractions;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._JojoScene.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.npcs.pregnancies.PlayerMousePregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   import haxe.ds.IntMap;
   
   public class JojoScene extends NPCAwareContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public static var JOJO_FULL_CORRUPTION_STATUS:int = 6;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var doClear:Boolean;
      
      public var buttPregnancy:PregnancyStore;
      
      public var _jojoForest:Encounter;
      
      public function JojoScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         doClear = true;
         _jojoForest = null;
         globalSave = false;
         saveVersion = 2;
         saveName = "jojo";
         saveContent = new SaveContent(null,null);
         super();
         buttPregnancy = new PregnancyStore(1209,591);
         buttPregnancy.addPregnancyEventSet(25,[150,120,96,72,48]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
         new PlayerMousePregnancy(param1);
      }
      
      public function wormRemoval() : void
      {
         jojoSprite();
         clearOutput();
         outputText("[say: 很好，年轻人，]乔乔继续说道。[say: 你对净化的奉献精神令人钦佩。放松点，要知道这些寄生虫很快就会离开你的。][pg]");
         outputText("乔乔站起身，走到藏在灌木丛中的一个背包前。他拿出一个漆盒。他取出一些草药、精油和其他混合物，将这种相当有害的组合放入研钵中，用杵捣碎。几分钟后，他点燃了混合物，并用羽毛扇将烟雾扇向你。混合物的气味令人作呕且反胃。你胃里翻江倒海，强忍着呕吐的冲动。最终，你再也无法抵抗，吐在了地上。呕吐引起的痉挛让你痛苦不堪，这种不适感慢慢演变成了真正的疼痛。");
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("随着疼痛的加剧，你感觉到胯部深处一阵骚动。你体内的虫子在蠕动，从而迫使你再次迎来一次不想要的性高潮。你无法控制自己的身体，你的肉棒爆发了，将精液和虫子喷得到处都是。乔乔看到虫子离开你的身体，开始扇得更快了。[pg]");
         }
         outputText("[say: 还需要进一步的忍耐，年轻人，]乔乔说道。[say: 在你追求进一步净化之前，你问题的根源必须离开。治疗总是比需要关注的疾病本身要难受两倍。][pg]");
         outputText("当你感觉到那条肥胖的虫子在挣扎时，你的身体蜷缩了起来。你感觉到它在你的尿道里向上推挤，拼命想要逃离你被熏蒸过的身体。那条虫子很快从你的阴茎末端探出头来。乔乔眼疾手快，一把抓住虫子，把它从你体内拉了出来，引发了最后一次高潮。这位武僧将肥胖的虫子扔到地上，用他的法杖将其击毙。[pg]");
         outputText("[say: 罪魁祸首已被驱除，不会再困扰你了。在这里休息一会儿，和我一起冥想，治愈你疲惫的身心吧。][pg]");
         outputText("你实在太累了，什么都不想做，于是你和乔乔一起冥想，这大大缓解了你之前的烦恼。");
         if(get_player().get_HP() > int(get_player().maxHP() * 0.5))
         {
            get_player().set_HP(int(get_player().maxHP() * 0.5));
         }
         get_player().damageHunger(30);
         get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
         get_player().removeStatusEffect(StatusEffects.Infested);
         get_player().removePerk(PerkLib.ParasiteMusk);
         get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
         dynStats(DynStat.Sens(Math.max(get_player().sens - 25,10),DynStatOp.Eq),DynStat.Lust(-99),DynStat.Cor(-15));
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function whisperJojobait() : void
      {
         clearOutput();
         get_images().showImage("akbal-deepwoods-male-jojosex");
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你闭上眼睛，开始想念乔乔。你能感觉到这位前僧侣在森林深处的存在，徒劳地试图冥想，摆脱你如此慷慨地赐予他的腐化。他坐着，一只" + (get_noFur() ? "手" : "爪子") + "放在膝盖上，另一只放在他坚硬的工具上。[pg]");
         outputText("当一阵合唱般的声音开始在他耳边低语时，他退缩了。他环顾四周，想知道自己是否真的听到了什么，或者他只是在想象许多生物在谈论关于他的如此下流的事情。当你开始想象他的身体被支配，被迫屈服于你每一个扭曲的奇思妙想时，他开始扭动，一股清澈的老鼠前列腺液开始顺着他隆起的肉棒流下。犹豫了片刻后，他开始朝你的方向走去。[pg]");
         outputText("你带着邪恶的微笑增加压力，看着这只老鼠开始大步走，他的睾丸慢慢肿胀。他很快就被极度唤起，以至于他大叫一声跪倒在地。通过你的心眼，你看到他用拳头包裹着他的肉棒。他试图自慰，绝望地想要释放自己，但无济于事。你的法术每次他伸手去拿时都会麻痹他的阴茎，戏弄和挫败这只老鼠，因为他越来越意识到只有你才能解除他不断增长的欲望。他再也无法直立行走，手脚并用地爬向你的营地，他的嘴巴紧闭，以阻止自己大声呼喊，吸引任何不是他主人的恶魔或生物的注意。[pg]");
         outputText("乔乔哀嚎着进入你营地的边缘，他曾经骄傲的声音破裂了，他乞求你随心所欲地对待他。你更加集中精力施展法术，坐下来，乔乔向全世界嚎叫着他的悲伤。他抓挠着地面，拖着肚子在泥土中爬行。他的睾丸肿胀到巨大的尺寸，除了脚趾尖外，其他部分都无法接触地面。他巨大肿胀的阴茎拖在身后，留下了一条精液的河流。[pg]");
         outputText("当他最终到达你身边时，他气喘吁吁地尽其所能地向你展示自己。");
         outputText("[pg]");
         outputText("你弯下腰拍了拍乔乔极其肿胀的阴囊；你决心清空你在里面听到的晃动的液体。当你这样做时，乔乔尖叫起来，你的法术让他的身体对你的触摸变得极其敏感。");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("当你摆好姿势时，他那啮齿动物的尾巴缠绕在你的腰上，导致你的" + get_player().cockDescript(_loc1_) + "扭动得更加剧烈，寻找着乔乔的尾巴正拉着你靠近的那个洞。一旦你靠得足够近，你的" + get_player().cockDescript(_loc1_) + "就推入乔乔体内，扭动着将这只老鼠的洞撑得更开。当你粗暴地将他撑开时，乔乔扭动着身体，一旦他的洞被撑到极限，他就会变得僵硬。在欣赏了你这只老鼠荡妇现在淫秽地大张着的洞之后，你开始研磨你的肉棒，导致乔乔在狂喜中尖叫，因为你的" + get_player().cockDescript(_loc1_) + "在他饥渴的肠道内疯狂地抽插。[pg]");
         }
         else if(get_player().cockArea(_loc1_) < 13)
         {
            outputText("他的洞不断地收缩，仿佛渴望着你的" + get_player().cockDescript(_loc1_) + "。当你摆好姿势时，乔乔的尾巴缠绕在你的腰上，你将你的" + get_player().cockDescript(_loc1_) + "沉入他饥渴的老鼠洞中。当你开始在他体内抽插时，乔乔的洞在你的" + get_player().cockDescript(_loc1_) + "周围颤抖的感觉让你微笑。乔乔在你身下像个发情的婊子一样呻吟，他的屁股随着你的抽插而移动。当你们毫无保留地操这只小老鼠时，你们身体拍打在一起的声音就像是掌声。[pg]");
         }
         else if(get_player().cockArea(_loc1_) < 25)
         {
            outputText("当你用你的" + get_player().cockDescript(_loc1_) + "戏弄他时，他的尾巴占有欲极强地缠绕在你的腰上，将你渗出的预精涂满了他被撑开的尾巴洞。你叹了口气滑入他体内，感觉到他的洞在你入侵的性器官周围颤抖。乔乔在你身下像个发情的婊子一样哀号，当你开始像活塞一样将你肿胀的性器官在他贪婪的老鼠洞里抽插时，他发出咕哝声。[pg]");
         }
         else
         {
            outputText("当你走到他身后摆好姿势时，乔乔的尾巴缠绕在你的腰上，占有欲极强地收紧，试图让你靠得更近。你顺从了这个荡妇，将你的" + get_player().cockDescript(_loc1_) + "滑上这只老鼠张开的屁股，用底侧戏弄他的屁股。当你将你过大的性器官滑入他饥渴的洞时，你感觉到一阵退缩的涟漪传遍他的全身。你很快就能感觉到乔乔肚子下面的泥土，因为你的" + get_player().cockDescript(_loc1_) + "缓慢的入侵被这只老鼠的横膈膜阻止了；你无法将超过一英尺的长度塞进乔乔过度填充的尾巴洞里。你慢慢地抽出，然后突然将臀部向前推，把这只小老鼠的呼吸都打断了。尽管被撑开并填满超出了他的极限，这只老鼠还是发出了一声满足的呻吟，并乞求更多。[pg]");
         }
         outputText("当你将你的" + get_player().cockDescript(_loc1_) + "在乔乔的尾巴洞里进进出出，粗暴地操这只老鼠时，你感觉到压力在增加。乔乔在狂喜和痛苦中呻吟，每一次抽插都发出一声尖锐的吱吱声。他抓挠着地面，既渴望更多，又绝望地想要释放。他的尾巴尖从你快速抽插的臀部解开，滑下你的[ass]，刺激你更快地像手提钻一样操他的内脏。尾巴尖滑入你的[asshole]，当你虐待这只老鼠的前列腺时，它也在刺激你的前列腺。[pg]");
         if(get_player().cumQ() >= 1500)
         {
            outputText("当你和乔乔一起高潮时，你发出一声咆哮。你的臀部在你的高潮中工作，将你的种子操进这位前僧侣的更深处，甚至当你将几加仑的精液泵入他体内时也是如此。他的肠道和胃在极短的时间内被填满，导致你的每一次抽插都从他过度填充的身体里喷出精液。[pg]");
            outputText("乔乔像个发情的婊子一样嚎叫，在你仍在抽插的" + get_player().cockDescript(_loc1_) + "周围扭动，因为他的" + (get_noFur() ? "" : "毛茸茸的") + "囊袋缩小了，一旦他的性器官恢复到正常大小，你粗暴的抽插迫使他的身体平贴在地面上。[pg]在你的高潮平息后，乔乔对你微笑，并一遍又一遍地感谢你“拯救”了他。你拔出来，一片乳白色的海洋洒在他已经溅满精液的" + (get_noFur() ? "皮肤" : "皮毛") + "上，用渗出的乳白色液体勾勒出他的尾巴洞。[pg]");
            outputText("当你离开这只老鼠时，你踩进了一大滩乔乔乳白色的啮齿动物精液中，然后回头看。你看到他的阴茎仍然被压在他的身体下面，指向你们两个的后面，将长长的浓稠老鼠精液喷射到森林深处。感觉到你巨大高潮的余波，你躺在你的老鼠婊子旁边闭上眼睛，让他蜷缩在你旁边，因为你们都睡着了，筋疲力尽，无比满足。[pg]");
         }
         else
         {
            outputText("当你和乔乔一起高潮时，你咬紧牙关。伴随着最后一次巨大的抽插，你将你的肉棒猛地插入他的老鼠尾巴洞，并卸载到他紧紧夹住的肠道里。[pg]");
            outputText("乔乔的蛋蛋开始缩小，因为他射出了自己的种子，一旦他的囊袋缩小到正常大小，你的重量就迫使他的身体平贴在地面上。他的尾巴仍然在你的[ass]里滑动，刺激你在高潮后奖励他几次抽插。他的肠道因为你的精液而变得又热又湿，你脸上带着极度幸福的表情研磨着你的" + get_player().cockDescript(_loc1_) + "。当你拔出来时，乔乔呻吟着，释放出一股乳白色的水流，滑落到他现在正常大小的蛋蛋上。好吧……对乔乔来说是正常的。[pg]");
            outputText("当你离开这只老鼠时，你踩进了一大滩乔乔乳白色的啮齿动物精液中，然后回头看。你看到他的阴茎仍然被压在他的身体下面，指向你们两个的后面，将长长的浓稠老鼠精液喷射到森林深处。感到无比满足，你在这只老鼠荡妇昏过去时，快速地在他耳后抓了抓——他身上溅满了精液，面带微笑。");
         }
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function vaginaOrDicksOrCrotch() : String
      {
         if(get_player().get_gender() == 0)
         {
            return "胯部";
         }
         if(get_player().get_gender() == 1)
         {
            return get_player().multiCockDescriptLight();
         }
         if(get_player().get_gender() == 2)
         {
            return get_player().vaginaDescript(0);
         }
         if(get_player().get_gender() == 3)
         {
            return get_player().multiCockDescriptLight() + "和" + get_player().vaginaDescript(0);
         }
         return "FUKK: ERROR";
      }
      
      public function useTentacleJojo() : void
      {
         jojoSprite();
         get_player().slimeFeed();
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         outputText("你大喊：[say: 小骚货！][pg]");
         outputText("几秒钟后，乔乔四肢着地跳进营地，脸红得厉害，屁股高高翘起，试图不让他肿胀的老鼠肉棒拖在地上。他向你展示自己，把手背在身后，展示着他的肉棒。它以一种那么粗的东西不应该能做到的方式淫秽地蠕动和扭动着。乔乔咬着嘴唇，因为他无法控制的展示而脸红。你注意到，尽管他脸红了，但他肩膀上的小肿块正在变大并呈现出紫色的色调，而他的三条尾巴已经开始在他身后解开。[pg]");
         outputText("当他新长出的器官对你的召唤做出反应时，空气中弥漫着他绝望的气息。不知为何，他知道你想使用它们，但他正努力像个好婊子一样克制自己。你稍微怂恿了他一下，嘲弄道：[say: 哎呀，看看这些可爱的小触手，正乞求着出来玩呢，]同时你开始用指尖轻轻拂过他那根扭动着的肉棒的底部。乔乔爽得斗鸡眼都出来了，他的阴茎在你的抚摸下变得越来越长，直到像蛇一样在空中摇摆，那紫色的龟头就躺在你的手心里。[pg]");
         outputText("你松开手，任由它“啪”的一声湿漉漉地砸在地板上，在地上留下一滩淫液。腾出双手后，你很容易就迅速脱下你的[armor]，把它扔回你的[cabin]。当你转过身来时，他那蛇一样的阴茎正顺着你的大腿卷曲而上，朝着你的[assholeorpussy]而去。");
         if(get_player().hasVagina())
         {
            outputText("你感觉到它从中间裂开，一分为二，为了能同时从两头干你。");
         }
         outputText("你惊叹于要支配一个能在几英尺外操你，还能用半打附肢把你缠起来的人是多么困难，最后你干脆放弃抵抗，决定好好享受。[pg]");
         outputText("你双手叉腰，说道：[say: 那就来蹂躏我吧，但如果我不能享受每一秒，你会后悔的。][pg]");
         outputText("乔乔看起来很像一个饿汉盯着一块牛排，他平静地微笑着，猛地伸出肩膀上的触手，抓住你的手臂，把它们固定在你的腰间。它们缠绕在你的腰部，轻松地把你举离地面。你被悬挂在他面前，毫不费力地在原地旋转，直到你的[asshole]朝天，双腿张开，这只变异老鼠的主触手离你的[asshole]越来越近");
         if(get_player().hasVagina())
         {
            outputText("和" + get_player().vaginaDescript(0));
         }
         outputText("。[pg]");
         if(get_player().totalCocks() > 0)
         {
            outputText("倒挂着，你被迫看着他的尾巴触手从双腿间卷曲出来，向你脆弱的[cocks]伸去。这三根触手在几英寸外停顿了似乎有一个世纪那么长，露出了滴着粘液的圆形孔洞，里面长满了滑溜溜、蠕动着的纤毛。[pg]");
            if(get_player().cockTotal() == 1)
            {
               if(get_player().balls > 0)
               {
                  outputText("其中一根猛地向前伸出，");
                  if(get_player().cockArea(0) > 60)
                  {
                     outputText("费力地包裹住");
                  }
                  else if(get_player().cockArea(0) >= 20)
                  {
                     outputText("吞没");
                  }
                  else
                  {
                     outputText("轻松地吞下");
                  }
                  outputText("你的[cock]，带来紧致的快感。另外两根触手滑到下面，各自将一颗" + get_player().ballDescript() + "部分含进它们的“嘴”里，并轻柔地按摩着。");
                  outputText("[pg]");
               }
               else
               {
                  outputText("其中一根猛地向前伸出，");
                  if(get_player().cockArea(0) > 60)
                  {
                     outputText("费力地包裹住");
                  }
                  else if(get_player().cockArea(0) >= 20)
                  {
                     outputText("吞没");
                  }
                  else
                  {
                     outputText("轻松地吞下");
                  }
                  outputText("你的[cock]，带来紧致的快感。另外两根触手滑到下面，");
                  if(!get_player().hasVagina())
                  {
                     outputText("在你的会阴处来回摩擦，把它们的粘液涂抹在你身上。");
                  }
                  else
                  {
                     outputText("在你的大腿上摩擦，涂抹着润滑液，而其中一根触手则轻松地将你的[clit]吸了进去。");
                     if(get_player().getClitLength() >= 4)
                     {
                        outputText("阴蒂受到的刺激让你几乎当场高潮；这感觉就像你有一根超级敏感的阴茎，正在被一千条舌头舔舐。");
                     }
                  }
                  outputText("[pg]");
               }
            }
            if(get_player().cockTotal() == 2)
            {
               if(get_player().balls > 0)
               {
                  outputText("其中两根触手向前猛扑，");
                  if(get_player().cockArea(0) > 60)
                  {
                     outputText("费力地包裹住");
                  }
                  else if(get_player().cockArea(0) >= 20)
                  {
                     outputText("吞没");
                  }
                  else
                  {
                     outputText("轻松地吞下");
                  }
                  outputText("你的[cocks]，将它们紧紧地夹在快感的台钳中。剩下的一根触手滑到下方，交替着将你的[ballsfull]部分吞入它的“嘴”里，用它那成千上万蠕动的刺激器按摩着它们。[pg]");
               }
               else
               {
                  outputText("其中两根触手向前猛扑，");
                  if(get_player().cockArea(0) > 60)
                  {
                     outputText("费力地包裹住");
                  }
                  else if(get_player().cockArea(0) >= 20)
                  {
                     outputText("吞没");
                  }
                  else
                  {
                     outputText("轻松地吞下");
                  }
                  outputText("你的[cocks]，将它们紧紧地夹在快感的台钳中。剩下的一根触手滑到下方，寻找着");
                  if(get_player().hasVagina())
                  {
                     outputText("你的[clit]并将其吸入。");
                     if(get_player().getClitLength() >= 4)
                     {
                        outputText("阴蒂受到的刺激让你几乎当场高潮；这感觉就像你有一根超级敏感的阴茎，正在被一千条舌头舔舐。");
                     }
                  }
                  else
                  {
                     outputText("在你的会阴处摩擦，用它那黏糊糊的润滑液按摩着敏感的肌肤。");
                  }
                  outputText("[pg]");
               }
            }
            if(get_player().cockTotal() >= 3)
            {
               outputText("三根触手同时向前猛扑，");
               if(get_player().cockArea(0) > 60)
               {
                  outputText("费力地吞下");
               }
               else if(get_player().cockArea(0) >= 20)
               {
                  outputText("吞没");
               }
               else
               {
                  outputText("轻松地吞下");
               }
               outputText("你的[cocks]，将它们紧紧地夹在快感的台钳中。这种感觉带来了压倒性的快感，就像有三根阴茎同时被一千条舌头舔舐和吸吮着。");
               if(get_player().cockTotal() > 3)
               {
                  outputText("剩下的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "因为嫉妒的欲望而脉动抽搐，直到其中一根触手滑落并将其捕获。它们轮流滑落并捕获你的每一个奉献物，直到你希望它们能永远吸吮下去。");
               }
               outputText("[pg]");
            }
         }
         if(get_player().totalCocks() == 0 && get_player().hasVagina())
         {
            outputText("乔乔的一根尾巴触手滑到他身体下方，向前射出，寻找你的[clit]。它在距离一两英寸的地方停下，张开一个可怕的孔洞，里面充满了蠕动的触须和光滑的液体。下一刻，它向前猛扑，将其吸入其中。");
            if(get_player().getClitLength() >= 4)
            {
               outputText("阴蒂受到的刺激让你几乎当场高潮；这感觉就像你有一根超级敏感的阴茎，正在被一千条舌头舔舐。");
            }
            else
            {
               outputText("这种感觉太不真实了，你发现自己希望阴蒂能更大一些，这样你就能感受到更多触须带来的快感。");
            }
            outputText("[pg]");
         }
         outputText("那");
         if(get_player().hasVagina())
         {
            outputText("对触手");
         }
         else
         {
            outputText("根触手");
         }
         outputText("悬挂在你的臀部上方，决定");
         if(!get_player().hasVagina())
         {
            outputText("");
         }
         outputText("现在是插入你毫无防备的开口的好时机");
         if(get_player().hasVagina())
         {
            outputText("");
         }
         outputText("，并紧贴着你，");
         if(get_player().hasVirginVagina() || get_player().ass.analLooseness == 0)
         {
            outputText("勉强滑入你处女般的开口");
            if(get_player().hasVirginVagina() && get_player().ass.analLooseness == 0)
            {
               outputText("");
            }
         }
         else if(get_player().hasVagina())
         {
            if(get_player().vaginas[0].vaginalLooseness >= 4)
            {
               outputText("几乎是掉进了你那过大的精液容器里");
            }
            else if(get_player().vaginas[0].vaginalWetness >= 3)
            {
               outputText("多亏了你分泌的丰富润滑液，轻松滑入");
            }
            else
            {
               outputText("强行挤进你的" + get_player().vaginaDescript(0) + "和[asshole]");
            }
         }
         else if(get_player().ass.analLooseness >= 4)
         {
            outputText("几乎是掉进了你那过大的精液容器里");
         }
         else if(get_player().ass.analWetness >= 3)
         {
            outputText("多亏了你分泌的丰富润滑液，轻松滑入");
         }
         else
         {
            outputText("强行挤进你的[asshole]");
         }
         outputText("。你的" + mouthMuzzle() + "张开，发出一声无言的惊呼");
         if(get_player().hasVagina())
         {
            outputText("和愉悦");
         }
         outputText("当乔乔的触手");
         if(get_player().hasVagina())
         {
            outputText("开始");
         }
         else
         {
            outputText("开始");
         }
         outputText("彻底地侵犯着你，无情地进进出出。");
         if(get_player().totalCocks() > 0)
         {
            outputText("每次它深深地插入你的屁股，撞击你的前列腺时，你都会感到一种奇怪的快感。");
            if(get_player().cockTotal() == 1)
            {
               outputText("你[cocks]上的触手似乎很感激，开始吸吮，吞下你所有的先兆液。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你[cocks]上的触手似乎很感激，开始吸吮，吞下你所有的先兆液。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "在入侵者周围痉挛，被粗大的藤蔓状阴茎抽插时无法控制地收紧。");
         }
         outputText("[pg]");
         outputText("你感觉到腰部的束缚在滑动和扭曲，释放出一些长度。这对触手阴茎在你的" + get_player().allBreastsDescript() + "前立起，就像饥饿的蛇盯着老鼠一样。[pg]");
         if((get_player().biggestTitSize() >= 4 || get_player().biggestTitSize() >= 4 && int(get_player().breastRows.length) > 1) && get_player().biggestLactation() < 2)
         {
            _loc4_ = true;
            outputText("两根触手像突然松开的扭结水管一样喷发，将浓稠的白色粘液溅在你的胸前。它们不断喷射，直到你所有的" + get_player().breastDescript(0) + "都被涂满了温暖滴落的粘液。其中一个紫色的怪物滑入这片混乱中，而另一个则将自己绑在你的[breasts]上，将其兄弟紧紧地挤压在沾满精液的乳肉之间。肿胀的紫色头部撞击着你的下巴，在开始操你的乳房时，将精液涂抹在你身上。一团又一团的老鼠精液从你的胸部溅到你的下巴和嘴里，最终浸透了你的" + faceMuzzle() + "和脖子。[pg]");
         }
         if(get_player().biggestLactation() >= 2)
         {
            _loc1_ = true;
            outputText("头部裂开，分成四瓣，露出湿润的开口和粉红色、舌头状的附属物。当它们的意图变得清晰时，乳汁开始从你的乳头漏出，你在心里责骂自己");
            if(get_player().cor < 80)
            {
               outputText("是个如此放荡的荡妇");
            }
            else
            {
               outputText("太容易就屈服了");
            }
            outputText("。乔乔的阴茎嘴吸附并用力吸吮，将你的[nipples]深深拉入它们的内部储液器，刺激你的乳房释放出如洪流般的乳汁。");
            if(get_player().cowScore() >= 5)
            {
               outputText("你发现自己满足地发出哞哞声，因为你的性奴正在努力挤奶。");
            }
            outputText("你带着幸福的微笑看着，享受着触手膨胀的感觉，并将充满乳汁的肉结沿着它们的长度向下移动到乔乔那里。它们是如此的饱满，以至于晃动的白色实际上可以透过他触手的“皮肤”看到。");
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("[pg]除了享受这种感觉直到你的[breasts]被清空之外，别无他法，但在那发生之前，它们脱落了，多余的乳汁浸透了你的胸部，然后移动到下一排。很明显，它们会继续挤奶，从一排移动到另一排，让每一排都有机会恢复，这样它们就可以无限期地进食……");
            }
            outputText("[pg]");
         }
         else if(get_player().biggestTitSize() < 4 && Utils.rand(2) == 0)
         {
            _loc1_ = true;
            outputText("头部裂开，分成四瓣，露出一个湿润的粉红色开口，中间有一条扭动的舌头。它们吸附并用力吸吮，每一个都将你整个[nipple]拉入它们的内部。在感觉中喘息着，当触手状的舌头扭曲在你的乳头周围时，你只能呻吟。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("一股乳汁喷出，很快就被饥饿的触手吸了下去。");
            }
            outputText("吸吮和戏弄是无情的，在乔乔对你为所欲为时，保持你的乳头坚挺和难以置信的敏感。[pg]");
         }
         else if(get_player().biggestTitSize() < 4 && get_player().biggestLactation() < 2)
         {
            _loc3_ = true;
            outputText("你感觉到腰部的束缚在滑动和扭曲，释放出一些长度。这对触手阴茎在你的脸前立起，从它们被污染的紫色头部滴下精液。一个卷曲在另一个周围，在它周围旋转，直到两根触手看起来更像某种淫秽的双头假阳具。它们涂抹在你的嘴唇上，给它们涂上精液，乞求被放进去。越来越用力地推，它们最终撬开你的下巴，把自己塞进去。一股精液立刻喷射在你的喉咙后部，让你几乎要作呕片刻。这种感觉很快就过去了，就好像你的呕吐反射不知何故被麻木了。[pg]");
            outputText("两根肉棒强行塞进你的喉咙深处，你甚至觉得乔乔都能从你的脖子上清楚地看到它们的轮廓。老鼠肉棒继续深入，一直顶到你的食道底部才抽出来，一路上不断滴落着精液。时不时地，你会感到肚子里一阵饱胀，意识到其中一根肯定直接把精液射进了你体内。这场粗暴的口交丝毫没有减缓的迹象，迫使你每次触手抽回时都只能用鼻子大口喘气。[pg]");
         }
         outputText("乔乔发出一声野兽般欢愉的嚎叫，你感觉到");
         if(get_player().hasVagina())
         {
            outputText("你" + assholeOrDP() + "里的触手明显变粗了。一团团精液顺着触手往下流，撑开你的" + assholeOrDP() + "，然后用老鼠精液把你填满。你能感觉到你的肠道和子宫都在被填满，把你撑得看起来");
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("有点像怀孕了");
            }
            else
            {
               outputText("更像怀孕了");
            }
            outputText("。你的身体紧紧缠绕着它们痉挛，陷入高潮的阵痛中");
            if(get_player().vaginas[0].vaginalWetness == 5)
            {
               outputText("，并用一股淫水将他浸湿。");
            }
            else if(get_player().vaginas[0].vaginalWetness >= 3)
            {
               outputText("，你流着口水的小穴形成了一滩湿滑的水洼。");
            }
            else
            {
               outputText("。");
            }
            if(get_player().cockTotal() <= 2 && get_player().balls == 0)
            {
               outputText("锁住你[clit]的触手随着你高潮时阴蒂的跳动而微微凸起，然后它吸得更用力了，让你的阴蒂变得更大。你因为这原始的感觉而尖叫，直到触手心满意足地弹开，留下你的阴蒂看起来像一根愤怒的红色肉棒。");
               get_player().changeClitLength(0.25);
            }
            outputText("两根触手都拔了出来，仍然滴着白色的液体，在你的洞里汇聚成水洼。");
         }
         else
         {
            outputText("你" + get_player().assholeDescript() + "里的触手明显变粗了。一团团精液顺着主触手往下流，撑开你的[asshole]，然后用老鼠精液把你填满。你能感觉到你的肠道正在被填满，把你撑得看起来有点像怀孕了。你的身体紧紧缠绕着它们痉挛，陷入高潮的阵痛中。触手拔了出来，仍然滴着白色的液体，在你那被过度使用的洞里汇聚成水洼。");
         }
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("在你" + get_player().multiCockDescript() + "上劳作的触手紧紧夹住，在你周围美妙地蠕动着。你忍不住在这攻势下射精，用你滚烫的精液喂养着触手。它贪婪地喝了下去");
               if(get_player().cumQ() >= 100)
               {
                  outputText("，但过了一会儿，它开始难以承受这庞大的输出量。");
                  if(get_player().cumQ() >= 300)
                  {
                     outputText("当你终于结束时，它已经胀得鼓鼓的，把你的精液滴得满裆都是。");
                     if(get_player().cumQ() >= 600)
                     {
                        outputText("你把触手灌得太满，以至于它变成了粉白色，并且猥亵地膨胀起来，然后突然释放出一股回流，把你的腰部以下都浸泡在精液中。它软绵绵地掉在地上，精疲力竭");
                        if(get_player().cumQ() >= 800)
                        {
                           outputText("但你并没有停止射精，直到它躺在深深的精液水洼中");
                        }
                        outputText("。");
                        _loc5_ = true;
                     }
                  }
               }
               else
               {
                  outputText("。");
               }
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("在你" + get_player().multiCockDescript() + "上劳作的触手紧紧夹住，在你周围美妙地蠕动着。你忍不住在这攻势下射精，用你滚烫的精液喂养着触手。它们贪婪地喝了下去");
               if(get_player().cumQ() >= 100)
               {
                  outputText("，但没过多久，它们就开始难以承受你惊人的射精量。");
                  if(get_player().cumQ() >= 300)
                  {
                     outputText("当你终于射完时，它们已经胀得鼓鼓的，把你的精液滴得满裆都是。");
                     if(get_player().cumQ() >= 600)
                     {
                        outputText("你把触手灌得满满的，它们变成了粉白色，胀得不成样子，然后突然喷出一股回流，把你的下半身都浸透了。它们软绵绵地掉在地上，精疲力尽");
                        if(get_player().cumQ() >= 800)
                        {
                           outputText("但你并没有停止射精，直到它们躺在一大滩精液中");
                        }
                        outputText("。");
                        _loc5_ = true;
                     }
                  }
               }
               else
               {
                  outputText("。");
               }
            }
         }
         if(get_player().biggestLactation() >= 2 && _loc1_)
         {
            outputText("你的[breasts]喷出更多的乳汁，用泌乳的力量把触手从你身上推开。你的[nipples]看起来就像");
            if(get_player().nippleLength >= 2)
            {
               outputText("更大了");
            }
            else
            {
               outputText("淫秽的");
            }
            outputText("奶牛的乳头，因为被吸吮得太多，乳汁像喷泉一样到处飞溅，在地上汇成水洼。几秒钟后，乳汁的流量逐渐减少，让你感到被拉扯的酸痛。");
            if(get_player().nippleLength < 4 && get_player().breastRows[0].breastRating >= 1)
            {
               outputText("不知怎么的，你知道它们不会完全缩回正常大小了。");
               var _temp_1:* = get_player();
               _temp_1.nippleLength = _temp_1.nippleLength + 0.25;
            }
            else
            {
               outputText("不知怎么的，你知道它们不会因为他粗暴的对待而变得更大了。");
            }
            outputText("你的" + get_player().allBreastsDescript() + "终于感觉被排空了；这真是一种解脱。[pg]");
            _loc6_ = true;
         }
         if(_loc4_)
         {
            outputText("操乳的触手紧紧挤压着你的" + get_player().allBreastsDescript() + "，然后再次射精，比之前猛烈得多。每次它从你的肉体中拔出，都会带出一波精液，从你的胸部滚落，滴入你已经湿透的脸和嘴里。");
            if(get_player().cor >= 80 && get_player().lib >= 70)
            {
               outputText("你舔了舔嘴唇，尽可能多地吞咽下去，沉浸在老鼠的精液中。");
            }
            if(get_player().hair.length > 0)
            {
               outputText("他不停地射精，直到你感觉到它弄到了你的[hair]上");
            }
            else
            {
               outputText("他不停地射精，直到你感觉到它弄到了你的头上");
            }
            outputText("，然后两根触手突然松开，变得软绵绵的。[pg]");
         }
         if(_loc3_)
         {
            outputText("一个巨大的凸起撑开你的下巴，撑大你的喉咙，最后排空到你的肠胃里，让你充满温暖。这个动作不断重复，直到你感觉腹胀饱满，比之前糟糕得多，因为你现在两头都被填满了。你看起来更像");
            if(get_player().get_pregnancyIncubation() == 0 && get_player().get_buttPregnancyIncubation() == 0)
            {
               outputText("一个怀孕八个月的女人");
            }
            else
            {
               outputText("一个被不断成长的后代压得动弹不得的育母");
            }
            outputText("现在的你已经完全不像以前的自己了，乔乔毫不迟疑地拔出肉棒，把他的精液射在你的 " + faceMuzzle() + " 上。[pg]");
            _loc5_ = true;
            dynStats(DynStat.Cor(0.5));
         }
         outputText("乔乔所有的触手似乎都失去了力量，他轻轻地将你被侵犯的身体放下");
         if(_loc5_)
         {
            if(_loc6_)
            {
               outputText("放在精液和乳汁的混合物中");
            }
            else
            {
               outputText("放在精液中");
            }
         }
         else if(_loc6_)
         {
            outputText("放在乳汁中");
         }
         else
         {
            outputText("放在地上");
         }
         outputText("。你沮丧地呻吟着，感觉液体浸透了你的皮肤，暗自希望他能把你操到失去意识。");
         outputText("老鼠跪在你身上，开始舔舐你的身体，用他的舌头清理你。触手也加入了进来，吵闹地吸吮着你身上的每一滴液体，直到你变得干净而满足。你在这种关注下如梦似幻地叹了口气，闭上眼睛低语道：[say: 好孩子。] 当你睁开眼睛时，他正小跑着走向森林，他的触手再次被很好地隐藏了起来……[pg]");
         get_player().buttChange(40,true);
         get_player().cuntChange(40,true);
         get_player().orgasm("VaginalAndAnal");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         buttPregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,332) > 0)
         {
            _loc1_ = 332;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         if(get_player().hasStatusEffect(StatusEffects.NoJojo))
         {
            get_player().removeStatusEffect(StatusEffects.NoJojo);
         }
         if(buttPregnancy.get_isPregnant() && buttPregnancy.get_incubation() == 0)
         {
            jojoLaysEggs();
            return true;
         }
         return false;
      }
      
      public function tentacleJojo() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.TentacleJojo);
      }
      
      public function talkMenu(param1:Object = undefined) : void
      {
         var from:Object = param1;
         var _gthis:JojoScene = this;
         jojoSprite();
         menu();
         var _loc2_:Function = function(param1:int, param2:String = undefined, param3:Function = undefined, param4:String = undefined):void
         {
            if(param2 == null)
            {
               param2 = "";
            }
            if(param4 == null)
            {
               param4 = "";
            }
            if(from != param3)
            {
               _gthis.addButton(param1,param2,param3).hint(param4);
            }
            else
            {
               _gthis.addButtonDisabled(param1,param2,param4);
            }
         };
         _loc2_(0,"村庄",jojoTalkVillage,"问他关于他长大的村庄的事。");
         _loc2_(1,"僧侣",jojoTalkJoiningTheMonks,"问他如何以及为什么成为一名僧侣。");
         _loc2_(2,"僧侣陨落",jojoTalkFallOfTheMonks,"问他关于僧侣们的灭亡。");
         _loc2_(3,"森林",jojoTalkForestConvo,"问他怎么会来到森林里。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1044) >= 4)
         {
            _loc2_(4,"你",jojoTalkYourOrigin,"告诉他关于英格纳姆和你的过去。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0)
         {
            _loc2_(5,"工厂",jojoTalkFactory,"告诉他你是如何关闭工厂的。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,847) == 1)
         {
            _loc2_(6,"沙洞",jojoTalkSandCave,"告诉他你在沙漠沙洞里的遭遇。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1046) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1044) >= 4)
         {
            addButton(7,"训练",apparentlyJojoDOESlift).hint("问他是否愿意训练你。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2089) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2087) < 10)
         {
            addButton(8,"净化",get_game().highMountains.minervaScene.minervaPurification.purificationByJojoPart1).hint("问他是否能驱除寄生在米内瓦身上的恶魔寄生虫。");
         }
         addButton(14,"返回",jojoCamp);
      }
      
      public function suckJojosCock() : void
      {
         jojoSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2187) <= 0)
         {
            outputText("你告诉乔乔，你觉得这次该轮到他享受了。" + get_player().clothedOrNaked("你脱下你的[armor]，") + "乔乔犹豫地脱下裤子，露出了他包皮包裹的肉棒。");
         }
         else
         {
            outputText("你告诉乔乔，你今天想尝尝他的肉棒。" + get_player().clothedOrNaked("你脱下你的[armor]，") + "乔乔脱下裤子，露出了他疲软的、包皮包裹的肉棒。");
         }
         outputText("[pg]你走近他，在他面前摆好姿势，思考着如何开始。你决定尽可能地挑逗乔乔。你用舌头裹住他的龟头，开始拉扯他的包皮。你没有用手把他的包皮拉回来，而是用嘴拉扯。包皮被拉回来的那一刻，乔乔身上令人陶醉的动物麝香几乎让你窒息。你感觉自己变得更热了" + (get_player().get_gender() > 0 ? "，" : "") + (get_player().hasCock() ? "你的[cocks]渗出了前列腺液" : "") + (get_player().get_gender() == 3 ? " 并且 " : "") + (get_player().hasVagina() ? "你的[pussy]流出了淫液" : "") + "。你灼热的呼吸刺激着乔乔的肉棒完全勃起。");
         outputText("[pg]你满怀期待地舔了舔嘴唇。[say: 谢谢你的款待，] 你一边说，一边开始从龟头一直舔到睾丸。首先冲击你的是味道。乔乔的肉棒尝起来像汗水和陈年奶酪，令人惊讶的是，这味道让人兴奋。再加上令人陶醉的麝香，你用尽了所有的自制力才没有扑倒他。");
         outputText("[pg]当你舔到他的睾丸时，乔乔开始呻吟。当你抬头看时，你注意到流出了一些前列腺液。你松开他湿润的睾丸，开始舔舐他的前列腺液。它尝起来咸咸的，是一道很棒的开胃菜。你开始按摩乔乔的睾丸，让前列腺液不断流出。你没有注意到，乔乔的手慢慢移到了你的身后。他突然抓住你的[hair]，强迫你的头一直后仰到他的根部。你既惊讶又差点窒息，试图把头往后仰，但乔乔紧紧地抓住了你。你抬头看着乔乔，看到他兴奋地喘着粗气，眼神涣散。该死，你把他逼得太紧了。不过，反正你也有点喜欢粗暴的。");
         outputText("[pg]你没有反抗他，而是开始配合他的节奏，深喉他美味的肉棒。乔乔开始大声呻吟，并开始快速前后摇晃他的臀部。感觉就像他在强奸你的喉咙。乔乔似乎不打算很快射精，你开始变得不耐烦了。你突然把手指插进乔乔的屁股，刺激他的前列腺。乔乔喘着粗气大喊：[say: 我要射了！] 并尽可能地把你的头往前拉。滚烫的精液像水管一样喷涌而出，瞬间" + (jojoCumQ() >= 600 ? "撑大了" : "填满了") + "你的胃。乔乔向后倒去，他的肉棒把精液喷得你[face]上到处都是，顺着你的[fullchest]流下来。" + (jojoCumQ() >= 900 ? "他的高潮似乎永远不会结束，他继续射了好一会儿。" : ""));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2187) <= 0)
         {
            outputText("[pg]乔乔仰面倒下，气喘吁吁。当他缓过来时，他说：[say: 我的腿没知觉了……我不知道我怎么了，对不起，[name]。] 你揉着饱满的肚子，微笑着告诉他，他必须补偿你。他问：[say: 怎么补偿？我什么都愿意做。] 你告诉他，下次他们吃饭时他请客。你凑近他，告诉他你更喜欢老鼠精液。乔乔脸红了，你向后靠去，微笑着说：[say: 嗯……当然。既然我答应了，我就必须履行。]");
         }
         else
         {
            outputText("[pg]乔乔仰面倒下，气喘吁吁。当他缓过来时，你说那很美味，下次也要请你。乔乔累得说不出话来，只是微笑着回应。");
         }
         outputText("[pg]休息了好一会儿后，" + get_player().clothedOrNaked("你们俩重新穿好衣服，","乔乔重新穿好衣服，你们俩") + "回到了营地。");
         if(jojoCumQ() < 2500)
         {
            get_player().refillHunger(jojoCumQ() / 25);
         }
         else
         {
            get_player().refillHunger(100);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2187,FlagDict_Impl_.arrayReadInt(_loc1_,2187) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2184,FlagDict_Impl_.arrayReadInt(_loc1_,2184) + 1);
         dynStats(DynStat.Lust(20),DynStat.Cor(-1));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stuffAmilysMouthWithPostBJCUM() : void
      {
         get_amilyScene().amilySprite();
         clearOutput();
         outputText("你告诉艾米莉快点爬上来。她发出一声喜悦的尖叫，跳进你的怀里，立刻将她那柔软的小穴沉入你的大腿，吞下了你的龟头。她的控制力让你感到惊讶，她保持着那个姿势，克制着自己不吞下你整个[cock biggest]，而是在你的顶端上下跳动，而乔乔则用他热切的舌头照顾你阴茎的下半部分。他试探性地沿着你阴茎的隆起处舔舐，吸吮着敏感的下侧，在你的阴茎上印下绝望的吻，当艾米莉骑在你跳动的龟头上时，他舔舐着她自由流淌的汁液。鼠娘的耳朵刷过你时让你感到痒痒的，她的声音因绝望的需要而变得沙哑。[say:求求你，[master]，给荡妇你的精液吧。她的小穴太需要被填满了。让我成为你怀孕的、肚子胀鼓鼓的荡妇吧，[master]！]");
         outputText("[pg]好像你会拒绝这样的邀请似的！你紧紧抱住你的恶魔小老鼠，把她往下按，刺穿她多汁的小穴");
         outputText("在你坚硬的肉棒上");
         outputText("。她惊讶地尖叫起来，随着你的[cockHead biggest]为了即将到来的高潮而膨胀，她的尖叫变成了高亢的呻吟。精液冲开你的马眼，喷射进艾米莉紧缩的子宫里，用她渴望的充满活力的种子填满她淫荡的小穴。你抱着她，让她被刺穿并扭动着，同时你继续喷射，用一波又一波渗出的精液让湿润的小穴受孕。[if (cumQuantity > 500) { 她的肚子因为额外的填充物而愉快地鼓了起来。你用手掌抚摸着它，当你感觉到你的精子在她被撑开的皮肤下翻滚时，你笑了。}][if (cumQuantity >= 1000) { 浓稠的珍珠色粘液像瀑布一样从她溢出的小穴中流出。乔乔尽力跟上，但即使他越来越渴望吞下你的精液，也无法与从痉挛女孩潮红的小穴中涌出的咸味泡沫的体积相匹配。}][if (cumQuantity >= 2000) { 艾米莉的眼睛因为完全的快感而翻白，因为你精液的压力开始导致精液从她充满精液的小穴中喷出。乔乔放弃了吞下所有的精液，向后靠去，张大嘴巴尽可能多地接住你的二手种子，一场由热粘液组成的象牙色雨从你刚被填满的荡妇被奶油满足的小穴中溅落到堕落的武僧身上。}]");
         outputText("[pg]满足后，你拔出来，让艾米莉失去知觉的身体滑落到泥土里。她颤抖着捂住自己的私处，试图把所有的精液都留在她漏水的小穴里，因为她从作为你私人肉便器的极乐中恢复过来。你得意地笑着，开始穿衣服。当你准备好离开时，你意识到艾米莉已经醒了，足以把乔乔拉到她的双腿之间。他的" + (get_noFur() ? "舌头" : "口鼻") + "深深地埋在精液荡妇的小穴里，她不停地呻吟着鼓励的话语。[say: 好孩子……舔干净[master]的精液。品尝它的味道，它的质地。别担心，你永远无法把它从我的子宫里弄出来。只要喝下去，也许——如果你是个乖巧的小母狗——[master]可能会让你吃下一发。]");
         outputText("[pg]你迈着轻快的步伐把他们留在身后。有这样一个尽职尽责的奴隶训练你的后宫，你毫不怀疑你会得到很好的照顾。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         get_amilyScene().amilyPreggoChance();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stopHarvestJojoDraft() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你告诉乔乔停止生产男魅魔原液；你简直要被这玩意儿淹没了。乔乔闭上眼睛，你咧嘴一笑，因为你想象到了你刚刚在他脑海中植入的画面。");
         outputText("[pg][say: 你喜欢那样吗，乔乔？真的被你 [master] 的体液淹没？嗯，也许以后吧。现在，当你在对着这个想法自慰时，把你那没用的精液射到瓶子以外的地方，明白了吗？]");
         outputText("[pg][say: 是的，[master]，]乔乔低声说道。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1098,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你告诉你的宠物老鼠");
         if(tentacleJojo())
         {
            outputText("兼触手怪");
         }
         outputText("去湖边找一个农场，向在那里工作的女士报到，并听从她的吩咐。");
         outputText("[pg]乔乔消化着这个消息，脸上交织着复杂的表情；你咧嘴一笑，因为你知道，在农场工作只会放大他离开你时的那种既高兴又恐惧的矛盾心理。");
         outputText("[pg]你告诉乔乔，你希望他不仅仅是幻想着服侍你来打手枪，如果他运气好的话，你甚至可能时不时地去把他操得死去活来。");
         outputText("[pg][say: 如……如您所愿，[master]，]乔乔低语着，颤颤巍巍地向湖边走去。你觉得他会成为惠特尼手下一名不错的工人，而且他那如同幽灵般在午夜徘徊的习惯，至少能给农场增加一点警觉性。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1080,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.forgiven = false;
         saveContent.postRapeCampOffer = false;
      }
      
      public function repeatMilkJojo(param1:Boolean = false) : void
      {
         jojoSprite();
         clearOutput();
         if(!param1 || !tentacleJojo())
         {
            outputText("你呼唤你那充满腐化的老鼠宠物，乔乔立刻四肢着地从树林里蹦了出来，他那肿胀的肉棒几乎拖在地上，在身后滴滴答答地流着液体。他满怀希望地看着你，显然还记得上次去农场时的快感。你叹了口气，说道：[say:是的，我要带你再去榨一次精。你的蛋蛋是不是又大又满？我希望你能给我赚点宝石，我的小精牛。][pg]");
            outputText("乔乔急切地点点头，用后腿坐了起来，手迅速伸下去抚摸自己的肉棒，向你展示它现在流了多少水。他似乎已经为下一次榨精做好了充分的准备。你开始带他去农场，听着他在你身后呻吟喘息。随着他的每一个动作，前列腺液滴落在地上，你意识到他似乎比你们上次踏上这段旅程时漏得更厉害了。不知怎么的，要么是榨精机，要么是你最初做的事，随着他被榨干的次数增加，他的“产量”也在慢慢提高。太完美了！[pg]");
            outputText("没过多久，你们俩就回到了谷仓里。乔乔几乎是跳进了隔间，以创纪录的速度帮你把他绑在挽具上。他的肉棒");
            if(jojoCumQ() < 1000)
            {
               outputText("已经滴得到处都是，把地板弄得一团糟。");
            }
            else if(jojoCumQ() < 4000)
            {
               outputText("正稳定地流淌着男人的黏液，在地板上积成一滩。");
            }
            else
            {
               outputText("已经流出了一条前列腺液的小河，把地板变成了一片湿滑的泥沼。");
            }
            outputText("这只老鼠很快就被固定住了，悬挂在那里，等着你把他绑好。你对他的疯狂哀鸣充耳不闻，欣赏着你的杰作。乔乔被完全束缚住，悬在半空中。他的肉棒在期待中跳动滴水。甚至他的蛋蛋也在抽搐颤抖，渴望释放出沉甸甸的精液。你捏了捏他沉甸甸的球体，把最后一根带子拉到位，启动了机器。[pg]");
            outputText("你那白" + (get_noFur() ? "耳" : "毛") + "的荡妇被吊到了半空中，悬得足够高，让他没有任何着力点。他几乎动弹不得！好吧，他大部分身体都动弹不得——他肉棒上下摆动的样子清楚地表明，无论你怎么绑他，乔乔总能找到像个婊子一样扭动的方法。墙壁再次弹开，伸出一根粗大的管子。光是看着那跳动的紫色开口，你就能看出它几乎完美契合你性宠那跳动的勃起。微弱的吸吮声混合着湿润的挤压声，管子升起，瞄准了乔乔跳动的肉棒。[pg]");
            outputText("管子的开口向前猛冲，滑过你老鼠的龟头，将其吞没，机械吸吮的声音变得更高亢。乔乔的声音也随之提高，与机器的音调相匹配，在极乐中呻吟。当管子贪婪地吞噬着老鼠的勃起时，谷仓里充满了令人毛骨悚然的吸吮声，最终紧紧贴在他的腹股沟上，并在他跳动、扭动的性腺上弹跳。现在他的阴茎已经被机器完全包裹，乔乔幸福地叹了口气。他的臀部在束缚带上轻轻摇晃，仿佛这能增加流经他阴茎的快感。你很清楚——在接下来的一个小时里，他大部分时间都得挂在边缘。[pg]");
            outputText("你拍了一下你那" + (get_noFur() ? "" : "毛茸茸的") + "荡妇紧绷的屁股，走到他面前，在你改变位置时差点被跳动的管子绊倒。乔乔喘着粗气，眼睛几乎翻到了后脑勺。每隔十五秒左右，他的身体就会紧绷起来，结果却发现吸精机的动作慢得折磨人。他每次都会尖叫和吱吱叫，就好像这是第一次一样。你挠了挠他那像盘子一样大的耳朵后面，话语从你心底涌出。[say:好宠物。你喜欢被榨精。你的蛋蛋变得又满又重……装满了精液。它们很疼，不是吗？是的……它们让你疼得厉害。你里面积攒了那么多精液，你放不出来，除非像这样被吸。嘘……嘘……没关系。只要享受你的蛋蛋肿胀得多么完美就行了。你最终会把它放出来的。][pg]");
            outputText("乔乔的眼睛完全翻白了一会儿，嘴里开始吐白沫，他完全屈服于动物追求快感的本能。你靠在墙壁光滑的部分，脱下衣服，开始在你的隔间前自慰。过了一会儿，你愉悦的呻吟声将你的宠物从快感引起的昏迷中拉了出来，他睁大布满血丝的眼睛看着你一次又一次地达到高潮");
            if(!get_player().hasCock() && !get_player().hasVagina())
            {
               outputText("，即使这样做你不得不刺激你的[asshole]");
            }
            outputText("。他抽搐的老鼠鼻子在喘息时疯狂地嗅着空气，在长长而凄凉的呻吟声中吸入你的气味。[pg]");
            outputText("乔乔的肌肉紧绷，你能看出他的高潮已经到来。你假笑了一下，凑近了一点，拉着他的一只耳朵靠近你的嘴，给他另一剂“鼓励”。[say:为我射吧，宠物。让所有堵塞你蛋蛋的精液都沸腾到榨精机里。把一切都交给我。把你每一升……浓稠的……积压的……种子都释放出来。全部排空！射精喷水，直到你的蛋蛋像你的贞操一样空虚！][pg]");
            if(jojoCumQ() < 1000)
            {
               outputText("你可怜的精奴没有让你失望。他的蛋蛋看起来比你刚来时肿胀得多，在他身下随着他跳动的肉棒颤抖，开始服从你的命令时抽搐着。大团的精液突然使管子膨胀，用它们的液体重量拉伸着它，被泵向墙壁。乔乔每次释放出新的精液时都会高兴地吱吱叫，尽管随着他的肉棒开始不断抽搐，他很快就退化为不断地尖叫和呻吟，将剩下的精液货物像倾盆大雨一样卸下。他悬挂在微微扩张、呼呼作响的管子上，管子吸干了他所有的精液。最终，这只老鼠被完全榨干，他的身体在挽具中软绵绵地垂下。[pg]");
               outputText("管子从乔乔变软的阴茎上滑落，退回墙壁，沿途留下一道老鼠黏液的痕迹。与此同时，乔乔被放回地面。他摇摇晃晃地站起来，跌跌撞撞地跪在你面前。他抬起头，喘着粗气，[say:我射得够多吗？][pg]");
               outputText("你摸了摸他的头，回答道：[say:是的，目前来说够了。不过我希望你肿胀的蛋蛋下次能做得更好，不是吗？][pg]");
            }
            else if(jojoCumQ() < 4000)
            {
               outputText("你那可怜的、欲求不满的精液奴隶并没有让你失望。他肿胀的睾丸看起来就像沉甸甸的葡萄柚，只是里面装着截然不同的汁液。为了服从你的命令，他颤抖着，那沉甸甸的球体弹跳着、摇晃着，开始将他那糖浆般的鼠人浊液泵入惠特尼改装的恶魔机器中。就在他肿胀的龟头下方，管子在一个高潮的瞬间被精液极度撑大，伴随着你这荡妇发出的愉悦尖叫。你能听到机器的嗡嗡声因为被迫承受的沉重负荷而提高了一个八度，但它似乎还能应付。当精液被吸入那吞噬精液的管子时，那团凸起慢慢变平，刚好赶上另一个肥大的球体再次撑起管子。乔乔翻着白眼，只露出眼白，他只是坐在那里颤抖着，将非人数量的精液注入榨乳器贪婪的管道中。过了一会儿，被榨干的老鼠瘫软下来，即使在他失去意识后，他的肉棒仍在释放出一点点白浊。[pg]");
               outputText("结束后，管子从乔乔坚硬、流着精液的肉棒上滑落，缩回墙壁，在身后留下一道凌乱的鼠人精液痕迹。与此同时，乔乔被放到了地板上。他回过神来，清醒过来，跌跌撞撞地走到你面前跪下。他抬起头，喘着粗气，[say:那……那够了吗？][pg]");
               outputText("你亲昵地抚摸着他，回答道：[say:还不错，小宠物。我还是觉得你那对蛋蛋能做得更好。也许有一天，你能射出多到机器都承受不了的量。只有到那时，你射的量才算让我满意。][pg]");
            }
            else
            {
               outputText("你那可怜的、欲求不满的精液奴隶并没有让你失望。他肿胀的睾丸巨大而沉重，随着它们积聚的巨量精液的颤抖和摇晃而前后摇摆。突然，它们同步痉挛，绝对是用倾盆大雨般的鼠人精液淹没了榨乳器的管子。精液珠从乔乔胯部的密封处漏出，顺着他被拉伸的阴囊滴落，变成粘稠的丝状滴在地板上。管子的尺寸翻了一倍，更像是一个橡胶气球，而不是一个机械装置。乔乔射精的力度和速度实在太快，机器根本无法承受。与此同时，榨乳器马达的噪音提高了三个八度，变成了震耳欲聋的哀鸣。随着你奴隶肉棒周围的密封失效，管子开始滑落。他这次真的做到了！你冲到乔乔下面，用双手抓住管子，在他下一次巨大的精液脉冲冲刷管子之前，将其重新推回他的肉棒上。有些精液从密封处喷射出来，但你拼命抓紧，因为你老鼠惊人的高潮淹没了容器。他很快就软了下来，但你一直将榨乳器固定在原位，直到从他体内吸出最后一滴精液。[pg]");
               outputText("终于结束了，你松开管子，让它滑向墙壁里的原位。它打了个嗝，吐出一股精液，弄脏了地板。与此同时，乔乔的肉棒依然坚硬如石，倾泻着他雪白的粘液。一旦被放到地上，他从状态中醒来，跪倒在他自己精液水坑的正中间。他半睁着眼睛，问道：[say:我射得够多吗？][pg]");
               outputText("你亲昵地抚摸着他，回答道：[say:是的，你做到了。你真是个好精奴。][pg]");
            }
            jojoMilkPay();
            outputText("你继续上路，拖着一只筋疲力尽的老鼠朝营地走去。");
         }
         else
         {
            outputText("你呼唤你变异的老鼠，乔乔立刻四肢着地从树林里笨重地走出来，他肿胀的触手肉棒拖在地上，在身后画出一条精液的痕迹。他满怀希望地看着你，肩膀上两个模糊的凸起兴奋地抽动着，因为他想起了你上次带他去农场的情景。你叹了口气，问道：[say:我想你是在想我会给你的触手好好地、狠狠地榨一次乳，对吧，荡妇？看来你今天运气不错，但你最好用那三根肉棒狠狠地射出来，让我刮目相看。][pg]");
            outputText("乔乔点点头，他肩膀上的触手开始充血并" + (get_noFur() ? "离开他的身体" : "从他的皮毛中伸出") + "，已经渴望着下一次的榨乳了。你拍了其中一根，让它们缩回去，然后开始带他走向农场。整个过程中，他到处滴落着预先分泌的精液，让他肿胀的阴茎在草地上拖拽，在身后留下一条粘液的痕迹。真是一团糟。你漫不经心地想，他在榨乳器里的时间是否增加了他的男子气概，但考虑到他随时都在漏精，如果没有客观的测量，很难说得清。幸运的是，你马上就能得到一个结果了。[pg]");
            outputText("很快，你们俩就溜回了惠特尼的谷仓。乔乔冲向隔间，立刻将自己依偎在安全带里。他的肉棒从胯部解开，垂到地板上，而他肩膀上的两根触手变大，慢慢地沿着它垂下来。当你努力将他完全扣入安全带时，这三根肉棒都开始滴落预先分泌的精液。虽然他无法动弹，但在你固定他的束缚时，他并没有闲着。三根能抓握的阴茎都转向你，缠绕在你的[legs]上，沿着你的身体滑动，展示出一种变态的感情。甚至他沉甸甸的睾丸也在期待中颤抖。当他安全带的最后一部分被固定好时，你温柔地抚摸了它们一下。[pg]");
            outputText("伴随着突然的倾斜，乔乔被抬向天花板，以便固定他进行榨乳。显然，这种机器的设计者并没有考虑到受害者会有长长的触手肉棒。墙板一打开释放管子，乔乔藤蔓般的肉棒就陷入了疯狂，它们互相缠绕，等待着被榨乳的机会。三根管子从墙上蜿蜒而出，以奇怪的起伏滑过地板。安全带里的触手老鼠似乎不打算等待，在一阵模糊的动作中，他迅速将他的三根阴茎分别插入了合适的孔洞中。紫色的、肉质的内部很容易就容纳了突然的插入，至少一开始是这样。乔乔的阴茎继续推进，你看到管子被撑大，因为它们被迫吞下几英尺长的老鼠肉棒。[pg]");
            outputText("你微笑着，开始抚摸他肩膀上伸出的一根触手，鼓励他将更多的阴茎组织塞进榨乳器吸吮的怀抱中。当然他已经在尝试了，但增加的刺激并没有坏处。你真的把这只老鼠变成了完美的性玩具。如果有一种方法能从他尾巴上的三根触手中吸出小穴的汁液，那就完美了！在乔乔有力的抽插和榨乳器不断的推进之间，老鼠的三根肉棒很快就被包裹在灵活的、肉质内衬的管子里。它们在光滑的地板上挥舞着，受到脉动吸力和你宠物疯狂痉挛的驱使。[pg]");
            outputText("你小心翼翼地绕着隔间的边缘踱步，小心移动以避免被狂舞的管子绊倒。一旦你走到他面前，你抓住变异啮齿动物的耳朵，开始向他低声下达指令。[say:你需要淹没这台机器，小宠物。感受所有的精液，感受它在你体内积聚，在你肿胀、沉甸甸的蛋蛋里倒流。你只是被精液填满了，不是吗？很好。待在那里，享受肉棒按摩，同时看着我自慰。我希望我们做完后，你能弄得一团糟，需要拖把来清理，明白吗？]你的话语中有一种黑暗的潜台词，类似于你最初腐化这只老鼠时使用的那种。它摧毁了你对他产量的任何怀疑——他会像你指示的那样弄得一团糟。[pg]");
            outputText("你向后靠去，让你的手指漫不经心地满足你自己日益增长的需求。看到乔乔非凡的形态屈服于它的欲望，激起了你自己");
            if(get_player().get_gender() > 0)
            {
               outputText("下半身");
            }
            else
            {
               outputText("身体");
            }
            outputText("的性欲。你闭上眼睛，忘记了老鼠，脱掉衣服，将你的裸体暴露在探索的双手下。当你让自己陷入性狂热时，你越来越意识到乔乔充满欲望、气喘吁吁的目光盯着你暴露的皮肤。");
            if(get_game().ceraphScene.hasExhibition())
            {
               outputText("一想到在进行这种肉欲行为时被注视，一种暴露狂的快感就传遍了你的全身。");
            }
            outputText("你的高潮来得又快又猛，在极乐的冲击波中席卷了你。[pg]");
            outputText("你眨了眨眼，眼冒金星，抬头看到乔乔挂在那里，喘着粗气，浑身发抖。一直存在的机械嗡嗡声逐渐提高音调，一直攀升到足以让报丧女妖自愧不如的尖锐哀鸣。肿胀的精液块在触手荡妇的肉棒中涌动，撑大了肉棒和努力包裹新粗度的管子。乔乔翻着白眼，泡沫状的唾液从他张开的嘴巴和悬垂的舌头上滴落。他的身体在安全带的束缚下紧绷着，双腿之间巨大、悬垂的球体在释放货物时明显收缩。精液从管子边缘的密封处冒出气泡，你的宠物用精液淹没了阴茎榨乳器。墙上的仪表迅速一个接一个地切换到“F”。最后一个仪表达到顶峰，然后压力将吸盘从他的肉棒上炸开，纯粹的精液压力将装满精子的机器炸飞。[pg]");
            outputText("乔乔在束缚带里瘫软下来，他的阴茎终于释放完了所有的精液。他高潮的残余物轻易地将隔间淹没在至少一英尺深的精液中。你叹了口气，意识到你和你的衣服都完全湿透了。束缚带毫不客气地将乔乔扔进了他自己制造的水坑里，当他站起来时，他抱住你的[legs]说，[say: 谢谢你。[master]……我射得够多吗？下次我会射更多的，我保证！][pg]");
            outputText("你" + (get_noFur() ? "拍了拍他沾满精液的头" : "挠了挠他沾满精液的皮毛") + "，让他知道他做得很好。");
            jojoMilkPay(true);
            outputText("你继续上路，拖着一只筋疲力尽的老鼠朝营地走去。");
         }
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatJojoEncounter() : void
      {
         var _g1:JojoScene;
         var _g:JojoScene;
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 1)
         {
            jojoSprite();
            outputText("当你走近这位宁静的僧侣时，你看到他的鼻子抽动了一下，打断了他的冥想。[pg]");
            outputText("[say:看来腐化的使者已经在你身体这座神殿里安家落户了。]乔乔平静地说。[say:这真是一个不幸的进展。不过没有理由绝望，因为总有办法对抗腐化。然而，要对抗这种形式的腐化需要付出巨大的努力，而且可能会给你留下持久的印记。如果你准备好了，我们可以清除你体内那些失控的欲望生物。][pg]");
            unlockCodexEntry(2740);
            menu();
            addButton(0,"冥想",meditateInForest);
            addButton(1,"净化",wormRemoval).hint("请求他清除你体内的虫子。");
            if(get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2136) == 0 && get_player().get_lust() >= 33)
            {
               _g = this;
               addButton(2,"强暴",function():void
               {
                  _g.jojoRape();
               }).hint(saveContent.forgiven ? "你还没放弃那只老鼠的[if (hasCock) {屁股|鸡巴}]。" : "强暴这只可怜的鼠人僧侣。" + (get_player().cor < 25 ? "你为什么要这么做？" : ""));
            }
            setExitButton();
            return;
         }
         jojoSprite();
         if(saveContent.forgiven)
         {
            outputText("树叶和树枝的剧烈摇晃吸引了你的注意力，紧接着一根木棍" + (get_player().get_spe() > 50 || get_player().get_inte() > 50 ? "差点打中你的脖子，幸好你反应及时" : "停在离你脖子只有一根头发丝距离的地方") + "。你毫不迟疑地与袭击者拉开距离，转过身去面对他们，看到乔乔那张[if (nofur) {浅肤色|毛茸茸的白色}]脸正盯着你。");
            outputText("[pg]僧侣控制着呼吸，将木棍的一端放在身侧。[say:[Name]，是你。我信守我的诺言。你]——他犹豫了一下——[say:如果你想改善自己，你并非没有希望。你想冥想吗？]");
            outputText("[pg]虽然你因为失败而感到[if (cor > 33) {屈辱|谦卑}]，但你还是可以尝试再次强暴他。然而，你不认为在做了那些事之后，还有多少人会再给你一次机会；也许接受这个提议是值得的。通过冥想来净化你的心灵？");
         }
         else
         {
            outputText("僧侣乔乔出现在你面前，长袍" + (get_noFur() ? "" : "和柔软的白毛") + "在微风中飘扬。他问道，[say:你准备好进行冥想了吗？]");
         }
         unlockCodexEntry(2740);
         menu();
         doYesNo(meditateInForest,get_camp().returnToCampUseOneHour);
         if(get_player().get_gender() > 0 && get_player().get_lust() >= 33 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2136) == 0)
         {
            _g1 = this;
            addButton(2,"强暴",function():void
            {
               _g1.jojoRape();
            }).hint(saveContent.forgiven ? "你还没放弃那只老鼠的[if (hasCock) {屁股|鸡巴}]。" : "强暴这只可怜的鼠人僧侣。" + (get_player().cor < 25 ? "你为什么要这么做？" : ""));
         }
      }
      
      public function refuseOfferOfHelp() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你向乔乔保证你没事，并表示会考虑他的提议。[say: 可是……我……我们……] 他结结巴巴地说。[say: 好吧，但请不要让腐化控制了你。你是我的朋友，我无法忍受你被它邪恶的影响所吞噬。] 他重新振作起来，问道：[say: 那么……有什么我可以帮你的吗？][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,102,get_time().days);
         jojoCampMenu();
      }
      
      public function refuseJojosApology() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你微笑着握紧拳头，一拳敲在这个毫无防备的鼠人头上，打得他丢下了法杖，揉着被你揍的地方。当他抬头看向你时，你对他愤怒的表情耸了耸肩，告诉他现在你们俩扯平了。[pg]");
         outputText("[say: 好——吧，]这只老鼠慢吞吞地说道，突然用他那双敏锐的小眼睛紧紧盯着你的动作，[say: 但我想这很公平，没造成什么伤害，对吧？][pg]");
         outputText("对你来说，这事儿现在已经翻篇了；毕竟你确实狠狠地揍了他一顿。你们俩同意重新认识一下。[pg]");
         lowCorruptionIntro();
      }
      
      public function pureJojoSexMenu() : void
      {
         var _loc1_:int = 40;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 10)
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) * 3;
         }
         else
         {
            _loc1_ += 30;
         }
         set_monster(new Jojo());
         jojoSprite();
         clearOutput();
         outputText("你问乔乔现在有没有心情做爱。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) < 3)
         {
            outputText("乔乔看着你的眼睛说道，[say: 除非你能温柔一点。]");
         }
         else
         {
            outputText("乔乔看着你的眼睛说道，[say: 好的，年轻人。我们走吧。]");
         }
         outputText("[pg]乔乔带你来到森林里，挑了一个最隐蔽的地方。");
         outputText("[pg](你想和乔乔怎么做？)");
         if(get_debug())
         {
            outputText("[pg]<b><u>乔乔的调试属性</u></b>");
            outputText("\n<b>肛门容量：</b> " + _loc1_);
            outputText("\n<b>精液产量：</b> " + jojoCumQ() + "mL");
         }
         menu();
         if(get_player().hasCockThatFits(_loc1_))
         {
            addButton(0,"操他后庭",anallyFuckTheMouseButtSlut).hint("操这个武僧鼠人的屁股。");
         }
         addButton(1,"被操后庭",getAnallyFuckedByMouseYouSlut).hint("让乔乔插你的屁股。");
         if(get_player().hasVagina())
         {
            addButton(2,"被操小穴",getVagFuckedByMouse).hint("让乔乔插你的小穴。");
         }
         addButton(3,"给他口交",suckJojosCock).hint("吸吮乔乔的肉棒，尝尝老鼠精液的味道！");
         addButton(14,"算了",jojoCampMenu);
      }
      
      public function postRapeCampOffer() : void
      {
         clearOutput();
         outputText("你拦住这只老鼠，邀请他来你的营地加入你。那里比森林更安全，而且他的到来也会很受欢迎。");
         outputText("[pg]乔乔紧张了一会儿，仍然背对着你。[say: 抱歉，[name]。我的归宿在这里，在森林中游荡，努力净化腐化，并帮助那些可能寻求帮助的人。]他继续走开了。尽管他对你有信心，但似乎有些伤口并没有那么容易愈合。");
         saveContent.postRapeCampOffer = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postCombatRape() : void
      {
         var postCombat:Boolean;
         var _g:JojoScene;
         jojoSprite();
         outputText("你脱下衣服，准备");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 5)
         {
            outputText("把你这个暴力的小荡妇操得失去意识。");
         }
         else
         {
            outputText("给这个傲慢的武僧一点教训……[pg]");
         }
         menu();
         _g = this;
         postCombat = true;
         addButton(0,"继续",function():void
         {
            _g.jojoRape(postCombat);
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function offerSexFirstTimeHighAffection() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你和乔乔度过了一段美好的时光。你和他一起冥想，和他讨论，甚至和他一起训练！现在是时候约他出去了。");
         outputText("[pg]你走向乔乔。[say: 怎么了，[name]？你需要什么？]乔乔问道。你问他是否愿意做爱。");
         outputText("[pg][say: 对不起。我还是不能打破我的贞洁誓言，]他满怀歉意地说。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,-2);
         menu();
         addButton(0,"冥想",jojoFollowerMeditate);
         addButton(1,"放弃",noThanksToMeditate);
         if(get_player().get_inte() >= 60 && get_player().isPureEnough(10))
         {
            addButton(2,"对峙",confrontChastity);
         }
      }
      
      public function offerSexFirstTime() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你问乔乔是否愿意帮你解决一个……私人问题。");
         outputText("[pg][say: 当然可以！是什么事，[name]？]");
         outputText("[pg]你告诉他，这与你的一些……需求有关。你需要满足一些欲望。你宁愿找一个友善的面孔，在双方自愿的情况下解决，也不愿出去把自己献给那些腐化生物的堕落欲望，或者去做那种令人不适的恶魔行径——把这片腐化土地上游荡的堕落者打倒然后再强暴他们。");
         outputText("[pg]乔乔恍然大悟，眼睛睁得大大的，脸红得" + (get_noFur() ? "厉害" : "甚至能透过他白色的皮毛看到") + "。[say: 我……我很荣幸你能考虑我……而且我觉得你真的" + (get_player().get_femininity() >= 50 ? "很漂亮" : "很英俊") + "，[name]，" + (get_player().thickness >= 60 && get_player().tone < 60 ? "虽然你应该更努力地保持身材。" : "而且你显然保持着很好的身材。") + " 你对我也很好，我也确实觉得你很有吸引力，但是……]");
         outputText("[pg]但是……？你追问道。毕竟，你们俩互相满足欲望，难道不比把事情憋在心里，或者去找这片土地上游荡的怪物更好吗？");
         outputText("[pg][say: 我-我不能……我发过贞洁誓言……我不能就这样打破我的誓言……请理解，[name]……]他满怀歉意地看着你说道，尽管你在他移开视线并摇头甩掉脑海中那些可能困扰他的想法之前，察觉到了他眼中那一丝微弱的欲望。");
         outputText("[pg]你表示理解他的立场并准备离开，但在你离开之前，他叫住了你。[say: 等等，[name]！]他站起身向你走来。[say: 虽然我不能真的和你做爱，但这并不意味着我不能帮你。如果你愿意，我们可以通过冥想来帮你……嗯……克制你的需求？]他建议道。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,-1);
         doYesNo(agreeToMeditate,noThanksToMeditate);
      }
      
      public function noThanksToMeditate() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你摇了摇头，告诉他没关系，然后离开了。");
         doNext(playerMenu);
         cheatTime(0.25);
      }
      
      public function mutateJojo() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你大喊一声，乔乔顺从地走进了营地。不知什么时候，他决定改穿缠腰布，但这对他来说毫无用处——它垂在他的阴茎上，勉强遮住了一半，因为你的存在而抽搐和跳动。你示意他脱掉那块小布，他立刻照做了。当他走到离你几英尺远的地方时，他跪了下来，双手背在身后，顺从地低下头。你看到他的身体在努力克制不去碰自己时，出现了轻微的抽搐和痉挛，所以你故意拖延时间，看看他能等多久。[pg]");
         outputText("没过多久。当他的手摸向腰间时，他发出了一声哀怨的呜咽。你咧嘴一笑，把他推倒仰面躺下，踩住他的手腕把他的手固定住。你把水晶假阳具扔到他的胸前，只下了一个命令：[say: 用它。][pg]");
         outputText("乔乔颤抖着，用他空闲的手接过你的赏赐，慢慢地举起它，把它拉低。他疑惑地抬头看着你，你不耐烦地向他做手势，让他别浪费你的时间。假阳具的头部压在他的括约肌上，在这个小贱货放松的时候停顿了一下，然后开始了它漫长的向内旅程。乔乔的眼睛向上翻了一点，他的肉棒开始喷出一股清澈的预精液，弄湿了他大部分的肚子。最后，粉红色的睾丸压在了他的屁股上。他把整个东西都吞进去了。[pg]");
         outputText("当你还把这只老鼠的一只手压在你的[foot]下时，他的另一只手已经松开了被污染的性玩具，并向上游走到了他喷射着预精液的肉棒上。你毫不犹豫地推开他的手，跳到他身上，确保把你的" + vaginaOrDicksOrCrotch() + "磨蹭在他光滑的勃起上。他不停地哀怨地呜咽着，扭动着臀部蹭着你，但你拒绝给他任何进一步的刺激，而是专注于让他保持饥渴，同时让被污染的假阳具安顿下来。[pg]");
         outputText("随着一阵轻柔的嗡嗡声开始充满你身后的空气，乔乔的呻吟声达到了狂热的程度。你转过身，看到那根用莱希石制作的假阳具已经开始在他体内震动了！不知何故，你能感觉到这是改变他的时候了——他的形态是可塑的，已经准备好了。你的手不由自主地握住了他肉棒的根部，把他堵住，直到你准备好，同时你凑近他可爱的老鼠耳朵，开始低语：[say: 哎呀，我的小啮齿动物婊子想高潮了吗？][pg]");
         outputText("他摇摇头，再次呜咽，在你身下颤抖着。[pg]");
         outputText("[say: 太糟糕了，荡妇，]你一边捏着他的睾丸一边说，[say: 在我把你变成完美的性玩具之前，你不能高潮。一个可以不断高潮，不止一次的玩具。一个可以同时填满不止一个洞的玩具。一个我可以和朋友分享的玩具，一个可以同时应付魅魔和男魅魔的玩具。你将成为我的那个玩具。我美味的性爱木偶，只要我一声令下，就会用触手肉棒和阴道藤蔓高潮。][pg]");
         outputText("乔乔的眼睛向后翻，直到你只能看到眼白。他的嘴巴因为快感而张开，发出一连串的喘息和呻吟。你已经能感觉到他的肉棒在你的手中蠕动，挣扎着想要挣脱。假阳具开始震动得更大声，尽管你紧紧抓着他的阴茎，他的预精液还是设法再次喷射出来。你看到他的肩膀鼓了起来，好像有什么东西在他的皮肤下蠕动，来回挣扎，直到它们像一对触手一样长出来。[pg]");
         outputText("不受控制的触手卷曲到乔乔藤蔓状的阴茎上，把它缠绕成一圈圈，直到你的手被迫松开，并在它周围蠕动。你注意到他的每一个新附肢的尖端都在变宽，而且预精液的水坑似乎比以前长得更快了。[pg]");
         outputText("你低语道：[say: 好婊子，你将能够操你周围的每一个洞，不是吗？但我看到的只是一个屁股和一张用来吸肉棒的嘴。你需要一些漂亮紧致的肉棒套，不是吗？][pg]");
         outputText("正如你所料，你感觉到他的尾巴顺着你的背卷了上来，已经比以前长得多了。令你惊讶的是，上面的毛发正在消失，取而代之的是光滑的橡胶般触感。它瞬间分裂成三根，但每一根都比他以前的尾巴还要粗。其中一根卷过你的肩膀，似乎在寻找什么，并露出了一个奇怪的吸盘状开口，上面粘着某种液体，里面长满了起伏的肉质褶皱。[pg]");
         outputText("你微笑着舔了舔那个开口——味道很甜——然后转头对着他的耳朵，[say: 现在你就在我想要的位置了，小贱货。感觉到那个假阳具在挤压你的前列腺了吗？光是那样你就会高潮的，对吧？把那些新触手从你的老二上拿开，对准你的脸，我想看你只靠我的另一个玩具就给自己颜射，弄得满身都是。][pg]");
         outputText("尽管看起来已经沉浸在快感中，他的身体还是服从了，松开了他的老二，将肩膀上的触手对准了张开的嘴。你现在可以看到，每一根触手都是深绿色的，顶端有一个闪亮的紫色头部，就像腐化林地里的藤蔓一样。它们每一个都开始张得更开，你感觉到他的肉棒像蛇一样在你们的");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("身体");
         }
         else
         {
            outputText(get_player().allBreastsDescript());
         }
         outputText("之间蜿蜒而上，直到从他的下巴下面探出头来，看起来就像是他肩膀上那对双胞胎的肥大版本。这三根触手都开始张得更开做准备，你知道他马上就要爆发了。[pg]");
         outputText("[say: 好玩具，]你轻声说道，[say: 为你的[master]高潮吧。][pg]");
         outputText("他快乐地屈服了，尽管翻着白眼，舌头上的口水流满了他的" + (get_noFur() ? "脸" : "口鼻") + "，但脸上还是洋溢着笑容。他的整个身体都在颤抖，你感觉到有肿块开始在你的");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText(get_player().allBreastsDescript());
         }
         else
         {
            outputText("胸部");
         }
         outputText("下移动。你可以看到它们以令人痛苦的缓慢速度顺着肩膀上的触手向上移动，直到三根肉棒藤蔓同时喷发，将乔乔自己的精液溅满他的脸。当他的主触手将一团精液喷到他的头发上时，这种完美的同步立刻被打破了，然后整个场景退化成一团颤抖的触手和飞溅的精液。乔乔的嘴里接住了很多，他开始本能地吞咽，而他的触手则尽力想要淹没他。[pg]");
         outputText("你退后一步看着，");
         if(get_player().cockTotal() > 0)
         {
            outputText("抚摸着你自己的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("");
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("抚摸着你酸痛的小穴");
         }
         outputText("看着这只老鼠慢慢地用精液涂满自己。当他结束时，他从头到脚都湿透了，躺在自己制造的水坑里。触手软绵绵地垂下来，开始慢慢缩回，直到它们存在的唯一可见迹象是每个肩膀上的一个小肿块。他的尾巴似乎在瞬间重新长出了毛发，但它们保持分离，并保留了更粗的尺寸。最后但同样重要的是，你看到他的肉棒已经缩回到了将近一英尺半长，但变得相当粗壮。它的大部分恢复了自然的粉红色肤色，但头部仍然保持着愤怒的紫色，因为它保持坚挺并不断流着口水。[pg]");
         outputText("假阳具不见了，只在他的菊花" + (get_noFur() ? "" : "周围的毛发") + "上留下了一抹亮粉色。无论你设法在其中注入了什么黑魔法，都在变形中耗尽了。乔乔仍然昏迷不醒，可能无法应对他改变后的高潮的力量，但他的身体在适应方面做得令人钦佩。你甚至看到他的三条尾巴卷在一起，直到它们看起来像一条更大的尾巴。只有仔细检查才能发现区别。[pg]");
         outputText("你转身回到你的[cabin]，兴奋得无以复加，现在就需要自慰。你想知道当乔乔醒来时，他的新器官在你的身体上会有什么感觉，但现在你必须用另一种方式发泄。");
         dynStats(DynStat.Lust(300),DynStat.Cor(10));
         get_player().createStatusEffect(StatusEffects.NoJojo,0,0,0,0);
         get_player().createStatusEffect(StatusEffects.TentacleJojo,0,0,0,0);
         doNext(playerMenu);
      }
      
      public function mouthMuzzle() : String
      {
         if(get_player().hasMuzzle())
         {
            return "口鼻";
         }
         return "嘴巴";
      }
      
      public function milkJojoFirst() : void
      {
         jojoSprite();
         var _loc1_:int = get_player().cockThatFits(40);
         clearOutput();
         outputText("一个邪恶的想法浮现在脑海中，你呼唤你最喜欢的鼠人");
         if(tentacleJojo())
         {
            outputText("触手");
         }
         else
         {
            outputText("男孩");
         }
         outputText("玩具。他带着肿胀、滴着精液的生殖器，尽可能快地跑了过来。他的睾丸那么大，真不知道他怎么还能跑。乔乔的眼睛蒙着一层雾，眼睑下垂，舌头伸在外面，他正慢慢地抚摸着自己肿胀的肉棒，每一次抽动都伴随着呻吟。你握住他干净的手，吩咐他：[say: 现在还不能射精，我的玩具；今天我要给你一个特别的奖励。][pg]");
         outputText("白" + (get_noFur() ? "耳" : "毛") + "老鼠失望地喵呜了一声，但他还是不情愿地服从了，放慢了他不断抚摸的速度，变成了更有节奏的爱抚。没有进一步的指示，你开始向惠特尼的农场走去，这只堕落的害兽像一只迷路的小狗一样跟在你身后。那持续不断的、令人毛骨悚然的喘息声是你唯一能确定他在服从你的线索，尽管在这一点上，你确信你已经把你的玩物身上每一丝不服从都操得一干二净了。也许在森林的某个地方有一滩这样的东西，正在帮助播种一片堕落的林地。没关系，你快到了。[pg]");
         outputText("在下一座小山丘上，你可以看到惠特尼农场那巨大且维护良好的屋顶。考虑到这似乎主要是一个女人的独角戏，她在保持一切运转方面做得非常出色。不管怎样，现在看起来她不在谷仓附近。这是把你最喜欢的两个玩具介绍给彼此的绝佳时机！你扯着乔乔的耳朵，开始把他拖下山坡，走向空荡荡的谷仓。他一点也没有反抗，在你身后呻吟着，滴着水，好像他知道接下来会发生什么。也许在你弄坏他之前，他从某个地方学到了一点关于“挤奶”的知识？[pg]");
         outputText("谷仓的门很容易就滑开了，当你推开它并把乔乔送进去时，它几乎没有发出吱吱声。你偷偷地环顾四周，确保你没有被看到，然后你关上了身后的门。乔乔瘫倒在一些稻草里，又开始自慰了，他拉扯着他那因堕落而肿胀的肉棒，好像那是房间里唯一重要的事情。你拍打他的睾丸以引起他的注意，然后把他引向你的隔间。它像往常一样空荡荡的，很干净");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,333) > 0)
         {
            outputText("，即使它散发着你洒在挤奶机机械怀抱中的精液的恶臭");
         }
         outputText("。乔乔对你耸耸肩，呜咽着，恳求允许他再次抚摸自己。[pg]");
         outputText("你得意地笑了笑，把他推了进去，让他和悬挂的挤奶安全带缠绕在一起。这只惊讶的老鼠挣扎着，回头看着你，他那顺从的眼睛里交织着困惑和欲望。你把一根令人安心的指尖放在他的鼻子上，当你把他正确地绑好时，你对他发出平静的嘘声。谢天谢地，安全带是非常可调的，你能够在这个堕落的性交野兽被挤奶之前给他一个合适的尺寸。每次你拉紧其中一条带子时，你都会确保轻轻捏一下他的睾丸或他的肉棒。当你越来越固定他时，额外的注意力让乔乔保持平静。只剩下一个配件需要拧紧了，你太清楚会发生什么了，于是你拉了它一下。[pg]");
         outputText("一旦这只白色的荡妇老鼠被固定好，机器就开始运转了。首先是安全带呼呼作响并上升，把乔乔举得足够高，以至于他的胳膊和腿都无法抓地。他整个过程都将被完全固定，他对此无能为力。与此同时，远墙上的一个舱口突然打开，露出一团乱七八糟的电线。一根内部有粘液、有脉动纹理的软管从机器里钻了出来，像蛇一样滑过地板。");
         if(get_player().hasCock())
         {
            outputText("它开始转向你，然后停下来并升起，似乎在嗅着正上方的啮齿动物。");
         }
         else
         {
            outputText("它慢慢开始升起，似乎在嗅着上方的啮齿动物，因为它正在定位。");
         }
         outputText("它向上升起，在空中起伏，一秒钟后，它靠近了乔乔抽搐着、滴着水的勃起。[pg]");
         outputText("当一滴乔乔的预精液落在软管潮湿的内部时，紫粉色的内部扭动着、颤动着。它看起来确实是活的。也许是对你的老鼠漏水、流口水的肉棒的反应，挤奶机的软管似乎扩张得更宽，并向上倾斜。它瞬间吸食了乔乔的阴茎，它快速吞噬阴茎的唯一证据是响亮的湿漉漉的“吸溜”声，这声音仍然在整个谷仓里回荡。这个荡妇男孩立刻因为吸吮的感觉而呻吟起来，试图把他的臀部推入脉动的肉棒管中。当然，这是徒劳的——安全带牢牢地把他固定在原地，让他保持不动，同时把每一滴珍贵的“牛奶”从他的身体里吸出来。[pg]");
         outputText("挤奶机上下前后弹跳着，随着每一次压力的变化和乔乔狂跳的心脏的跳动而抽搐。他可怜地呜咽着，声音混合着乞求和强烈的色情快感。你轻轻地抚摸着他抽搐的阴囊，让沉重的球体在你的手指间来回滚动。它们甚至不时地弹跳，每次机器让他接近高潮时，它们都会被拉紧。这真是一个绝对的恶魔技术奇迹。它能够把身体带到释放的边缘，然后退缩。它让受害者尽可能长时间地处于边缘状态，以最大化用户（或受害者？）最终的“输出”。[pg]");
         if(get_player().hasCock())
         {
            if(_loc1_ < 0)
            {
               _loc1_ = get_player().biggestCockIndex();
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,333) > 0)
               {
                  outputText("凭经验你知道，这台机器通常需要一个小时才会允许释放");
               }
               else
               {
                  outputText("你估计这台机器可能会抽插他好一会儿才会允许释放");
               }
               outputText("，这场表演让你欲火焚身。你脱下[armor]，掏出[onecock]，感觉");
               if(get_player().get_lust100() < 50)
               {
                  outputText("它在你手中变硬");
               }
               else
               {
                  outputText("它在你手中的硬度");
               }
               outputText("。就乔乔而言，他甚至没有注意到。每当他特别接近高潮时，他只是呻吟、蠕动和抽搐。你叹了口气，希望你足够小，能钻进他体内，但操老鼠的方法不止一种。把你沉重的男性天赋放在他的屁股沟之间，你把他的尾巴缠绕在你的阴茎上，把它变成一个临时的阴茎环。乔乔把头向后仰，看看发生了什么。看到这一幕，他的脸红似乎加深了三个色度。你对他眨了眨眼，开始前后摇晃。他的屁股是完美的热狗“面包”，而他尾巴的紧绷感让你的" + get_player().cockDescript(_loc1_) + "硬得感觉要爆炸了。[pg]");
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,333) > 0)
               {
                  outputText("凭经验你知道，这台机器通常需要一个小时才会允许释放");
               }
               else
               {
                  outputText("你估计这台机器可能会抽插他好一会儿才会允许释放");
               }
               outputText("，这场表演让你欲火焚身。你脱下[armor]，掏出[onecock]，感觉");
               if(get_player().get_lust100() < 50)
               {
                  outputText("它在你手中变硬");
               }
               else
               {
                  outputText("它在你手中的硬度");
               }
               outputText("。而乔乔甚至没有注意到。每当他快要高潮时，他只是呻吟、扭动、抽搐。你微笑着向前挺进，将自己埋入乔乔痉挛的屁眼。他那快乐抽搐的肌肉紧紧夹住你，将你的" + get_player().cockDescript(_loc1_) + "紧紧锁在他火热的内脏里。你拍打着他丰满的" + (get_noFur() ? "" : "毛茸茸的") + "脸颊，开始操他，注意到机器几乎停止了它有节奏的运动。看来把乔乔的前列腺捣成肉泥，和那台邪恶的寻精机器一样能有效地榨取他的鸡巴。[pg]");
            }
            get_player().orgasm("Dick");
         }
         else if(get_player().hasVagina())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,333) > 0)
            {
               outputText("凭经验你知道，这台机器通常需要一个小时才会允许释放");
            }
            else
            {
               outputText("你估计这台机器可能会抽插他好一会儿才会允许释放");
            }
            outputText("，这场表演让你欲火焚身。你脱下[armor]，露出你的[vagina]，感觉你的[clit]变得坚挺。而乔乔甚至没有注意到。每当他快要高潮时，他只是呻吟、扭动、抽搐。你在他下方坐下，让手指在你现在湿润的褶皱间游走，抚摸着你的阴唇，然后将几根手指滑入其中。你用拇指摩擦你的阴蒂包皮，因快感而颤抖，享受着看着你的宠物被榨取，就像他享受被榨取一样。");
            if(get_player().getClitLength() > 3)
            {
               outputText("你的另一只手抓住你那阴茎大小的“豆豆”开始套弄，这个动作让快感的颤栗传遍你的[hips]。");
            }
            outputText("你感到有些调皮，坐直身子舔舐乔乔抽搐的睾丸，观察着他在你鼻子上扭动时的羞态。[pg]");
            get_player().orgasm("Vaginal");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,333) > 0)
            {
               outputText("凭经验你知道，这台机器通常需要一个小时才会允许释放");
            }
            else
            {
               outputText("你估计这台机器可能会抽插他好一会儿才会允许释放");
            }
            outputText("，虽然这场表演让你欲火焚身，但你缺乏能令人满意地解决欲望的器官。与此同时，乔乔每次快要高潮时，只是呻吟、扭动、抽搐。你坐下来，看着机器对你的老鼠玩具进行惩罚，希望你现在也有类似的器官可以解决。[pg]");
            dynStats(DynStat.Lust(50));
         }
         outputText("终于，约定的时间到了，乔乔发出了你听过的最淫荡的吱吱声。他的屁股和腿紧紧夹住并对抗着束缚");
         if(get_player().hasCock())
         {
            outputText("，用令人痛苦又愉悦的压力挤压着你的" + get_player().cockDescript(_loc1_));
         }
         outputText("。他的背在狂喜中弓起。最引人注目的是，吸吮他鸡巴的管子突然变形，因为浓稠圆润的老鼠精液被吸向墙壁。这些凸起很快被抚平，变成了一条长长的、撑开软管的啮齿动物精液河。");
         if(!get_player().hasCock() && get_player().hasVagina())
         {
            outputText("他的睾丸在你的嘴里颤抖收缩，泵出他惊人的精液，为了换取一点点宝石而浪费掉。");
         }
         outputText("[pg]");
         if(get_player().hasCock())
         {
            if(get_player().cockThatFits(40) < 0)
            {
               outputText("你把精液射在乔乔的背上，" + (get_noFur() ? "涂满他的皮肤" : "弄脏他白色的皮毛") + "。每一次精液的飞溅都让这只老鼠看起来更像一个被精液浸透的婊子。这很适合他。");
            }
            else
            {
               outputText("你拔出来，把精液射在乔乔的背上，" + (get_noFur() ? "涂满他的皮肤" : "弄脏他白色的皮毛") + "。每一次精液的飞溅都让这只老鼠看起来更像一个被精液浸透的婊子。这很适合他。");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你高潮了，紧紧夹住你的手指，挤压着你的手，你自己的快乐叫声与你的鸡巴玩具被榨干的呻吟声混合在一起。");
         }
         else
         {
            outputText("当乔乔射精时，你渴望地叹了口气，希望你能感受到如此美妙的感觉。也许你很快就能找到一些东西给你一些合适的性器官？");
         }
         outputText("尽管他连续射精了好几分钟，但这台机器似乎并没有什么压力。最后，管子弹开，拖向墙壁，在地板上留下了一小条老鼠精液的痕迹。[pg]");
         outputText("乔乔被放回地面并松开。他立刻蹭向你，身体仍因高潮的余韵而颤抖，显然对这次款待充满感激。");
         jojoMilkPay();
         outputText("你继续上路，拖着一只筋疲力尽的老鼠朝营地走去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function meditateInForest() : void
      {
         jojoSprite();
         clearOutput();
         dynStats(DynStat.Str(0.5),DynStat.Tou(0.5),DynStat.Inte(0.5),DynStat.Lib(-1),DynStat.Lust(-5),DynStat.Cor(-1 - get_player().countCockSocks("alabaster")));
         if(!get_player().hasStatusEffect(StatusEffects.JojoMeditationCount))
         {
            get_player().createStatusEffect(StatusEffects.JojoMeditationCount,1,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.JojoMeditationCount,1,1);
         }
         if(saveContent.forgiven)
         {
            outputText("乔乔微笑着，带你离开小路，来到一片宁静的小空地。空地中央有一个树桩，表面被打磨得十分光滑，弯曲的弧度坐上去很舒服。他示意你坐下，并指导你进行冥想。");
            outputText("[pg]");
            if(get_player().statusEffectv1(StatusEffects.JojoMeditationCount) >= 5 && !saveContent.postRapeCampOffer)
            {
               addButton(1,"加入营地",postRapeCampOffer).hint("在营地里，你可以借助他的帮助，也能有他作伴。");
            }
         }
         else
         {
            outputText("乔乔微笑着，带你离开小路，来到一片宁静的小空地。空地中央有一个树桩，表面被打磨得十分光滑，弯曲的弧度坐上去很舒服。他示意你坐下，并指导你进行冥想。");
            outputText("[pg]不知过了多久，你感觉自己更能控制自己了。乔乔祝贺了你，但也提出了警告。[say: 时刻留意你现在的状态，在这个世界的污秽让你迷失自我之前来找我。也许有一天，这个被污染的世界能再次恢复正常。]");
            if(get_player().statusEffectv1(StatusEffects.JojoMeditationCount) >= 5)
            {
               outputText("[pg]冥想结束后，乔乔向你恭敬地点了点头，并露出了微笑。");
               if(get_holliScene().holliFollower() && get_player().statusEffectv1(StatusEffects.JojoMeditationCount) % 5 == 0)
               {
                  if(get_player().hasKeyItem("Jojo\'s Talisman"))
                  {
                     outputText("乔乔对你微笑着。[say: [name]，做得好。你专注的天赋依然不减。关于另一件事……你还留着我给你的那个东西吗？]");
                     outputText("[pg]你举起护身符，他点了点头。[say: 很好。注意安全，如果需要帮助就用它向我发信号。]");
                  }
                  else
                  {
                     outputText("乔乔向你恭敬地点了点头。[say: 今天做得很好；你的专注令人印象深刻。我们可以更经常地一起冥想。]");
                     outputText("[pg]尽管你很想，但你不能留在森林里，现在也不能邀请他和你一起回去。你勉强提到了在你营地边缘那个顽固的、恶魔般的神之种的存在。乔乔皱起眉头，陷入了沉思。");
                     outputText("[pg][say: 是的，那是个问题。唉，要是我们不必抵抗这片土地的灵魂就好了！[name]，拿着这个。如果那个恶魔找你麻烦，就用它来叫我；我会来尽我所能提供帮助。]这位武僧在长袍里摸索了一下，将一个小护身符放在你的手里。");
                     outputText("[pg](获得关键物品：乔乔的护身符)");
                     get_player().createKeyItem("Jojo\'s Talisman",0,0,0,0);
                  }
                  doNext(get_camp().returnToCampUseTwoHours);
                  return;
               }
               outputText("[say: 看来你在这方面很有天赋。我们应该更经常地一起冥想。]");
            }
            if(get_player().statusEffectv1(StatusEffects.JojoMeditationCount) % 5 == 0)
            {
               outputText("[pg]你思索了一下，有了一个主意——这只老鼠可以留在你的营地。人多力量大，而且你们俩也更容易聚在一起进行冥想。你想让乔乔在营地里陪你吗？");
               doYesNo(acceptJojoIntoYourCamp,get_camp().returnToCampUseTwoHours);
               return;
            }
            outputText("[pg]他悲伤地低下头，让你离开了。");
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function lowCorruptionJojoEncounter() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,1);
         clearOutput();
         jojoSprite();
         outputText("暂时厌倦了探索森林，你决定回营地。不想走风景优美的路线，你准备穿过一些灌木丛，但你的大脑立刻捕捉到了一声尖叫。就在你转头看向声音来源的那一刻，一个白色的模糊身影直接砸在你的头上。");
         if(get_player().get_tou() >= 50 && get_player().isBiped())
         {
            outputText("你后退了几步，暂时有些发晕。甩了甩头，你准备好你的[weapon]并摆出战斗姿态。[pg]");
         }
         else if(get_player().get_tou() < 50 && !get_player().isBiped())
         {
            outputText("这一击的力量把你平平地击倒在[ass]上。甩了甩头，你立刻爬起来并摆出战斗姿态。[pg]");
         }
         else if(get_player().isTaur())
         {
            outputText("这一击除了让你暂时发晕之外，并没有把你击倒。你甩了甩头，准备好你的[weapon]，并摆出战斗姿态。[pg]");
         }
         else
         {
            outputText("你被击中后退缩了一下，但这一击的力量除了让你暂时发晕之外，并没有造成什么影响。你摆出战斗姿态，准备自卫。[pg]");
         }
         outputText("令你惊讶的是，迎接你的是一只相当惊讶的老鼠的面孔。[pg]");
         outputText("[say:哦……呃……对不起。你吓到我了，]他歉意地说，尴尬地揉着后颈。[pg]");
         outputText("你接受他的道歉吗？[pg]");
         unlockCodexEntry(2740);
         menu();
         addButton(0,"是",acceptJojosApology);
         addButton(1,"否",refuseJojosApology);
      }
      
      public function lowCorruptionIntro() : void
      {
         var _g:JojoScene;
         outputText("他伸出一只手，你高兴地握了握。[say: 我叫乔乔，很高兴认识你。]你也同样介绍了自己。[pg]");
         outputText("现在你有机会好好打量他了，你注意到他穿着让人联想到僧侣的简单装束。一件浅蓝色的长袍遮住了他平坦的胸膛，腰间系着一条简单的腰带。他的裤子和长袍一样，也很贴身。[pg]");
         outputText("他的体格很轻盈，但你察觉到他绝不虚弱。他握手很有力，传递出自信；很明显这只老鼠训练有素，尽管在长袍的遮掩下你看不到任何肌肉的痕迹。他的头发很短，和他的" + (get_noFur() ? "皮肤" : "皮毛") + "一样白，如果不是因为他有一双棕色的眼睛，你可能会猜他是个白化病患者。令人惊讶的是，除了戴着一串珠子项链外，他身上似乎没有带任何东西。[pg]");
         outputText("他会意地笑了笑，[say: 是的，我是一名僧侣，是的，对于我这样的人来说，这是一个奇怪的地方……这个世界并不总是这样。很久以前，这个世界有许多村庄，包括我自己的村庄。但后来恶魔来了。我不确定它们是被召唤出来的、被创造出来的，还是仅仅是魔法或繁衍的扭曲产物，但它们从山里蜂拥而出，摧毁了它们前进道路上的一切。][pg]");
         outputText("乔乔悲伤地叹了口气，[saystart]不说我的烦心事了。虽然我");
         if(get_player().cor <= 5)
         {
            outputText("没有");
         }
         else
         {
            outputText("几乎没有");
         }
         outputText("感觉到你体内有任何腐化，但有备无患总是好的。你愿意和我一起冥想吗？[sayend][pg]");
         menu();
         addButton(0,"冥想",meditateInForest);
         addButton(1,"离开",get_camp().returnToCampUseOneHour);
         if(get_player().isCorruptEnough(10) && get_player().get_lust() >= 33 && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2136) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 0)
         {
            _g = this;
            addButton(4,"强暴",function():void
            {
               _g.jojoRape();
            }).hint("强暴这个可怜的僧侣鼠人。" + (get_player().cor < 50 ? " 你为什么要这么做？" : ""));
         }
      }
      
      public function loseToJojo() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 3)
         {
            outputText("乔乔低头怒视着你，开始祈祷，慢慢地将祈祷纸贴满你伤痕累累的身体。你感到愤怒，但很快就消散了，取而代之的是一种平静的安宁感。你很快就失去了意识，但很高兴他打败了你。");
            if(!saveContent.forgiven)
            {
               outputText("[pg]当你醒来时，你发现了一张纸条：");
               outputText("[pg][saystart]这场战斗让我驱除了你内心的大部分恶魔。我的一部分想要为你对我所做的事情寻求报复，但我知道这是你灵魂上的污点造成的。如果我们再次相遇，我很乐意与你一起冥想。");
               outputText("[pg] ——乔乔。[sayend]");
               saveContent.forgiven = true;
            }
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-10),DynStat.Cor(-15));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,1);
         }
         else
         {
            outputText("乔乔察觉到你的败北，邪恶地咧嘴一笑，" + get_monster().cockDescriptShort(0) + "硬挺地跳动着。");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               if(get_player().get_gender() == 1)
               {
                  outputText("你欲火焚身，无暇思考，只是弯下腰，展示出你的屁股，任由你的[cocks]自由晃荡。这只老鼠毫不犹豫，用力将他的" + get_monster().cockDescriptShort(0) + "狠狠地插了进来。你被那尺寸弄得踉跄了一下，努力保持清醒，而他像一头发狂的野兽一样操着你，以惊人的力量猛击你的屁股。");
                  if(get_player().cockTotal() == 1)
                  {
                     outputText("前列腺液和精液从你的[cock]滴落，这是由于前列腺受到粗暴的撞击而被挤压出来的。你感觉到体内一阵温暖的湿润，意识到乔乔射精了。当最后一股精液从你的臀瓣间喷出时，你感到一阵解脱，但随之而来的是一种渐渐升起的恐惧感，因为他继续以比以前更猛烈的力度操你。[pg]在他射了几十次，你自己也高潮了一两次之后，你晕了过去，你的肠道被精液撑得痛苦不堪。");
                  }
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("前列腺液和精液从你的[cock]s滴落，这是由于前列腺受到粗暴的撞击而被挤压出来的。你感觉到体内一阵温暖的湿润，意识到乔乔射精了。当最后一股精液从你的臀瓣间喷出时，你感到一阵解脱，但随之而来的是一种渐渐升起的恐惧感，因为他继续以比以前更猛烈的力度操你。[pg]在他射了几十次，你自己也高潮了一两次之后，你晕了过去，你的肠道被精液撑得痛苦不堪。");
                  }
                  get_player().buttChange(get_monster().cockArea(0),true);
               }
               if(get_player().get_gender() >= 2)
               {
                  outputText("你欲火焚身，无暇思考，弯下腰，将你的屁股和" + get_player().vaginaDescript(0) + "作为敞开的目标展示给乔乔。这只老鼠毫不客气，狠狠地插入了你。他肆无忌惮地操着你，猛烈地撞击你那放荡的小穴，完全不顾及你的感受。尽管如此，你还是享受这种粗暴的对待。当乔乔射精时，你体内爆发出一阵温暖的痉挛。你担心他可能会停下来，但当这只老鼠的高潮结束后，他以更大的活力继续操你。你强烈地高潮了，他的精液顺着你的大腿流下，你开始失去理智。");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("你的[cock]不断地将精液喷洒在地上，直到你的双性器官都变得红肿疼痛。");
                  }
                  else
                  {
                     outputText("你的" + get_player().vaginaDescript(0) + "在他身上高潮了许多次，直到它变得酸痛娇嫩，滴着精液。");
                  }
                  outputText("当乔乔再次射精时，你晕了过去，一股精液的河流从你已经过度充盈的子宫中涌出。");
                  get_player().cuntChange(get_monster().cocks[0].cockThickness,true);
                  get_player().knockUp(4,432,101);
               }
               if(get_player().get_gender() == 0)
               {
                  outputText("你欲火焚身，无暇思考，只是弯下腰，展示出你的屁股，诱人地扭动着。这只老鼠毫不犹豫，用力将他的" + get_monster().cockDescriptShort(0) + "狠狠地插了进来。你被那尺寸弄得踉跄了一下，努力保持清醒，而他像一头发狂的野兽一样操着你，以惊人的力量猛击你的屁股。");
                  get_player().buttChange(get_monster().cockArea(0),true);
                  outputText("你感觉到体内一阵温暖的湿润，意识到乔乔射精了。当最后一股精液从你的臀瓣间喷出时，你感到一阵解脱，但随之而来的是一种渐渐升起的恐惧感，因为他继续以比以前更猛烈的力度操你。");
                  outputText("[pg]在他射了几十次，你自己也高潮了一两次之后，你晕了过去，你的肠道被精液撑得痛苦不堪。");
               }
               get_player().slimeFeed();
               hideUpDown();
               get_player().orgasm("VaginalAnal");
               dynStats(DynStat.Cor(1));
               statScreenRefresh();
            }
            else
            {
               outputText("你因伤痛而昏了过去。[pg]");
               statScreenRefresh();
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         var _loc3_:* = null;
         Utils.extend(saveContent,param2);
         if(param1 < 2)
         {
            _loc3_ = Reflect.field(param2,"forgiven");
            saveContent.postRapeCampOffer = _loc3_ > 1;
            saveContent.forgiven = _loc3_ != 0;
         }
      }
      
      public function jojosThirdRape() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("难怪这位武僧的身体会如此彻底地背叛他，他的" + get_monster().cockDescriptShort(0) + "将近十英寸长，正因炽热的渴望而跳动着。[pg]");
         if(get_player().get_gender() == 1)
         {
            outputText("你一把将乔乔从地上拽起来，让他跪在地上，");
            if(get_player().cockTotal() == 1)
            {
               outputText("将你的[cock]展示给他看。");
            }
            else
            {
               outputText("将你的[cocks]展示给他看。");
            }
            outputText("这位武僧暴露了他被侵犯的心态，端庄地舔了舔嘴唇，张大了嘴巴。这个邀请正是你所需要的");
            if(get_player().cockTotal() == 1)
            {
               outputText("你将[cock]深深地捅进他的嘴里。你粗暴地抓住他的耳朵，用力地操着他的嘴，他的舌头则努力地取悦着你。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你将两根肉棒深深地塞进他的嘴里，撑得他的下巴夸张地张开。你粗暴地抓住他的耳朵，用力地操着他的嘴，他的舌头则努力地取悦着你。");
            }
            outputText("乔乔的一只" + (get_noFur() ? "手" : "爪子") + "埋在胯下，狂热地抚摸着他的" + get_monster().cockDescriptShort(0) + "。他越是发情，喉咙似乎就越放松，让你能插得更深。他脸上那迷离、充满情欲的神情太性感了，你再也忍不住了。");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]紧紧收缩，喷射出");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你的双茎紧紧收缩，喷射出");
            }
            outputText("滚烫的精液射入这个现在温顺屈从的婊子男孩嘴里。他的喉咙紧紧挤压着你，同时将鼻子紧紧贴在你的胯部，尽可能多地将你吞入。当他和你一起高潮时，老鼠的精液溅到了你的腿上。[pg]");
            if(get_player().lib > 60 && get_player().cor > 40)
            {
               outputText("你把他翻转过来，让他仰面躺着，你们俩都还硬着，准备再来一次。他四肢着地爬起来，诱人地扭动着屁股。你继续推进，");
               if(get_player().cockTotal() == 1)
               {
                  outputText("侵犯他松弛的括约肌，开始用力地操他。他发出痛苦与快感交织的呜咽，你沾满唾液的[cock]无情地捣弄着他的前列腺。随着你每一次撑开他肛门的抽插，浓稠的老鼠精液不断滴落，在你们身下汇聚成一滩。你邪恶地笑着，拍打着他的屁股，想象着他被撑得更开，屁股大张，肉棒巨大且滴着精液的样子。脑海中这些奇怪的念头似乎直接传到了你的蛋蛋里，化作了满满的精液。就像一座沉睡已久的火山，你爆发了，滚烫的液体喷射进乔乔体内，灌满他的屁股，顺着他的腿流下来。他再次高潮了，比之前更加猛烈，他跳动的肉棒在整个高潮过程中似乎变得更大了。[pg]");
               }
               else
               {
                  outputText("侵犯他松弛的括约肌，开始用力地操他。他发出痛苦与快感交织的呜咽，沾满唾液的肉棒无情地捣弄着他的前列腺。随着你每一次撑开他肛门的抽插，浓稠的老鼠精液不断滴落，在你们身下汇聚成一滩。你邪恶地笑着，拍打着他的屁股，想象着他被撑得更开，屁股大张，肉棒巨大且滴着精液的样子。脑海中这些奇怪的念头似乎直接传到了你的蛋蛋里，化作了满满的精液。就像一座沉睡已久的火山，你爆发了，滚烫的液体喷射进乔乔体内，灌满他的屁股，顺着他的腿流下来。他再次高潮了，比之前更加猛烈，他跳动的肉棒在整个高潮过程中似乎变得更大了。[pg]");
               }
            }
            outputText("你把筋疲力尽的小老鼠留在身后，想着下次该怎么对付他。");
            get_player().orgasm("Dick");
            if(get_player().lib > 60 && get_player().cor > 40)
            {
               outputText("听到他在你身后开始自慰，你笑了。毫无疑问，你正在一步步地腐化他……");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
            }
            else
            {
               dynStats(DynStat.Lib(2),DynStat.Cor(1));
            }
         }
         if(get_player().get_gender() == 2)
         {
            if(get_player().isBiped())
            {
               outputText("你张开双腿，勾了勾手指");
            }
            else
            {
               outputText("你勾了勾手指");
            }
            outputText("，示意他靠近你的" + get_player().vaginaDescript(0) + "。他看起来有些沮丧，但还是顺从地跪在你面前，他的" + (get_noFur() ? "" : "胡须扫过你的" + get_player().vaginaDescript(0) + "，湿润的") + "鼻子蹭着你的阴蒂，舌头在你的阴唇间长长地舔舐着。");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你叹了口气，舒服地揉捏着自己的乳房。");
            }
            if(get_player().biggestLactation() >= 1.5 && get_player().biggestTitSize() > 2 && get_player().mostBreastsPerRow() >= 2 && int(get_player().breastRows.length) >= 1)
            {
               outputText("你体内的每一次感官高潮，都伴随着乳头喷出的小股乳汁。它最终滴落到乔乔的舌头上，刺激着他更加卖力。");
            }
            outputText("这只小老鼠越来越沉迷于舔食你的小穴，让你越来越难以抑制高潮的到来。你用");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你的蛇尾");
            }
            else if(get_player().lowerBody.type == 8)
            {
               outputText("你摇晃的凝胶身体");
            }
            else
            {
               outputText("你的大腿");
            }
            outputText("缠住他的头，充满激情地颤抖着，");
            if(get_player().averageVaginalWetness() <= 1)
            {
               outputText("将他紧紧地挤进你的" + get_player().vaginaDescript(0) + "。");
            }
            if(get_player().averageVaginalWetness() > 1 && get_player().averageVaginalWetness() <= 3)
            {
               outputText("用淫水肆意地涂满他的舌头。");
            }
            if(get_player().averageVaginalWetness() == 4)
            {
               outputText("用你泥泞的小穴将淫水喷得他满身都是。");
            }
            if(get_player().averageVaginalWetness() == 5)
            {
               outputText("用你" + get_player().vaginaDescript(0) + "喷出的爱液溅了他一身。");
            }
            outputText("[pg]你依依不舍地推开这只被小穴迷得神魂颠倒的老鼠，弯下腰，");
            if(get_player().isBiped())
            {
               outputText("张开双腿，并且");
            }
            outputText("摇晃着你的屁股。");
            if(get_player().hasLongTail())
            {
               outputText("你的尾巴挑逗地来回摆动。");
            }
            outputText("你诱人的背影让他无法抗拒。他瞬间扑向你的屁股，用力地插入你的" + get_player().vaginaDescript(0) + "。一想到你恶魔般的影响力是他变成这样的罪魁祸首，你几乎要把淫水喷满他的肉棒。你幻想着你的小穴让他的肉棒变得更长更粗，进一步腐化他，将他的道德和价值观转化为肉棒和精液。乔乔在你身上剧烈地抽插，在他高潮时粗暴地捣弄着你的" + get_player().vaginaDescript(0) + "。他的" + get_monster().cockDescriptShort(0) + "在你体内爆发，被老鼠精液填满的感觉让你和他一起达到了高潮。越来越多的精液喷洒在你体内，对于他这种体型的生物来说，这数量简直不合常理。随着你的肚子隆起，浓稠的精液顺着你的大腿流下。");
            get_player().cuntChange(2,true);
            outputText("[pg]");
            outputText("你让被榨干的老鼠拔出肉棒，沉浸在精液从");
            if(get_player().isBiped())
            {
               outputText("你的双腿间");
            }
            else
            {
               outputText("你的小穴");
            }
            outputText("流出的感觉中。乔乔已经在你身后晕倒了。");
            get_player().orgasm("Vaginal");
            if(get_player().lib > 60 && get_player().cor > 50)
            {
               outputText("你弯下腰，一边抚摸着他的肉棒，一边低声说着奇怪的非人类语言。它痉挛着变大，精液缓慢但不断地从里面泵出。你转身离开，把他留在一滩越来越大的、曾经是他的道德的液体中。你不知道这些词是从哪里来的，但你知道你在诱惑和腐化方面变得越来越熟练了。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
            }
            else
            {
               dynStats(DynStat.Lib(2),DynStat.Cor(1));
            }
            get_player().knockUp(29,432);
         }
         if(get_player().get_gender() == 3)
         {
            if(get_player().isBiped())
            {
               outputText("你张开双腿，勾了勾手指");
            }
            else
            {
               outputText("你勾了勾手指");
            }
            outputText("，示意他靠近你的" + get_player().vaginaDescript(0) + "。他看起来有些沮丧，但还是顺从地跪在你面前，他的" + (get_noFur() ? "" : "胡须轻挠着，湿润的") + "鼻子碰触着你的阴蒂，舌头在你的阴唇间长长地舔舐着。");
            if(get_player().cockTotal() == 1)
            {
               outputText("当你的[cock]垂在他的头上时，你叹了口气。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("当你的[cocks]堆叠在他的头上时，你叹了口气。");
            }
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你揉捏着自己的乳房，兴奋且充满快感。");
            }
            if(get_player().biggestLactation() >= 1.5 && get_player().biggestTitSize() > 2 && get_player().mostBreastsPerRow() >= 2 && int(get_player().breastRows.length) >= 1)
            {
               outputText("你体内的每一次感官高潮，都伴随着乳头喷出的小股乳汁。它最终滴落到乔乔的舌头上，刺激着他更加卖力。");
            }
            outputText("这只小老鼠越来越沉迷于舔食你的小穴，让你越来越难以抑制高潮。你用大腿夹住他的头，充满激情地颤抖着，");
            if(get_player().averageVaginalWetness() <= 1)
            {
               outputText("将他紧紧地挤进你的" + get_player().vaginaDescript(0) + "。");
            }
            if(get_player().averageVaginalWetness() > 1 && get_player().averageVaginalWetness() < 4)
            {
               outputText("用淫水肆意地涂满他的舌头。");
            }
            if(get_player().averageVaginalWetness() == 4)
            {
               outputText("用你泥泞的小穴将淫水喷得他满身都是。");
            }
            if(get_player().averageVaginalWetness() >= 5)
            {
               outputText("用你" + get_player().vaginaDescript(0) + "喷出的爱液溅了他一身。");
            }
            if(get_player().cockTotal() > 0)
            {
               outputText("浓稠的先列腺液顺着他的脖子流下，粘在他的" + (get_noFur() ? "皮肤" : "皮毛") + "上。");
            }
            outputText("[pg]你依依不舍地推开这只被小穴迷得神魂颠倒的老鼠，弯下腰，");
            if(get_player().isBiped())
            {
               outputText("张开双腿，并且");
            }
            outputText("摇晃着你的屁股。");
            if(get_player().hasLongTail())
            {
               outputText("你的尾巴挑逗地来回摆动。");
            }
            outputText("你诱人的背影让他无法抗拒。他瞬间扑向你的屁股，用力地插入你的" + get_player().vaginaDescript(0) + "。一想到你恶魔般的影响力是他变成这样的罪魁祸首，你几乎要把淫水喷满他的肉棒。你幻想着你的小穴让他的肉棒变得更长更粗，进一步腐化他，将他的道德和价值观转化为肉棒和精液。乔乔在你身上剧烈地抽插，在他高潮时粗暴地捣弄着你的" + get_player().vaginaDescript(0) + "。他的" + get_monster().cockDescriptShort(0) + "在你体内爆发，被老鼠精液填满的感觉让你和他一起达到了高潮。越来越多的精液喷洒在你体内，对于他这种体型的生物来说，这数量简直不合常理。随着你的肚子隆起，浓稠的精液顺着你的大腿流下。");
            get_player().cuntChange(2,true);
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]在高潮中颤抖，将你的精液喷射到厚厚的森林腐殖土上。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你的[cocks]在高潮中颤抖，将它们滚烫的精液喷洒在厚厚的森林腐殖土上。");
            }
            outputText("[pg]");
            outputText("你让被榨干的老鼠拔出肉棒，沉浸在精液从");
            if(get_player().isBiped())
            {
               outputText("你的大腿间");
            }
            else
            {
               outputText("你的小穴");
            }
            outputText("流出的感觉中。乔乔已经在你身后晕倒了。");
            get_player().orgasm("Generic");
            if(get_player().lib > 60 && get_player().cor > 50)
            {
               outputText("你弯下腰，一边抚摸着他的肉棒，一边低声说着奇怪的非人类语言。它痉挛着变大，精液缓慢但不断地从里面泵出。你转身离开，把他留在一滩越来越大的、曾经是他的道德的液体中。你不知道这些词是从哪里来的，但你知道你在诱惑和腐化方面变得越来越熟练了。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
            }
            else
            {
               dynStats(DynStat.Lib(2),DynStat.Cor(1));
            }
            get_player().knockUp(29,432);
         }
      }
      
      public function jojosSecondRape() : void
      {
         clearOutput();
         outputText("可怜的老鼠已经硬了……他的肉棒急切地跳动着，从他长袍的开口处伸出来，看起来将近八英寸长。你很确定上次它没这么大。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-10),DynStat.Cor(4));
         if(get_player().get_gender() == 1)
         {
            outputText("你强迫乔乔趴在一根圆木上，双手" + (get_noFur() ? "抚摸他的身体" : "穿过他的皮毛") + "并拍打他的屁股。他咕哝着，但无法分辨是因为沮丧、愤怒还是兴奋。你迅速强行再次进入他的屁股，发现它因为你上次的入侵而明显被撑大了。");
            if(get_player().averageCockThickness() >= 3)
            {
               outputText("这对你的[cock]来说没什么区别，对你来说他感觉仍然像处女的小穴一样紧。");
            }
            outputText("你抓住他的腰，强有力地操他，粗暴而快速地将你的[cock]猛烈地撞击进去。你注意到他的手在胯部，像个荡妇一样狂热地自慰着他那不成比例的巨大肉棒。你开始像筛子一样漏出前列腺液，意识到你正在做，真的在做——把这只贞洁的老鼠变成一个淫荡的荡妇！当你射入他的肠道时，你紧紧地挤压他，随着你高潮的持续，他的肚子微微隆起。精液顺着他的" + (get_noFur() ? "腿" : "皮毛") + "流下，因为这已经超出了他屁股能承受的极限。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你剩下的装备向他喷洒精液，比你想象的还要多。");
            }
            outputText("老鼠呻吟着，自己也高潮了，伴随着大声的呻吟，每次你们的臀部相遇时，都会有凌乱的精液喷溅在地上。[pg]");
            outputText("最终一切结束了，你把他像用过的避孕套一样扔进精液水坑里。他躺在那里，茫然地无所事事地抚摸着自己，他的肉棒仍然因为需求而肿胀，滴着液体。你迫不及待地想进一步腐化他。");
         }
         if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
         {
            outputText("你把他扔在森林柔软的泥土上，骑在他身上，熟练地引导他的阴茎滑向你现在湿漉漉的洞口。当你滑下去时，你惊叹于他感觉比以前更大更粗了，真是太美妙了。当你强暴他娇小的身躯时，你的" + get_player().vaginaDescript(0) + "以最令人愉悦的方式跳动着。你玩弄着你的阴蒂，看着乔乔的脸在狂喜和厌恶之间掠过。你舔了舔嘴唇，微笑着，当厌恶消失时，他滚烫的精液喷射在你的阴道壁上。你咯咯地笑着，继续操他，希望你的腐化和欲望能以某种方式影响他，把他变成你个人的性玩具。这个想法让你达到了顶点。你夹紧，你的" + get_player().vaginaDescript(0) + "榨取着，挤出他的最后一滴精液，因为他的肉棒在你体内爆发。");
            get_player().cuntChange(1.5,true);
            if(get_player().biggestLactation() >= 1 && get_player().biggestLactation() < 2)
            {
               outputText("乳汁从你的乳头喷射而出，化作点点奶滴洒在他身上。");
            }
            if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() < 3)
            {
               outputText("随着你小穴的收缩，乳汁如泉涌般从你的乳头喷出，将这只可怜的老鼠浇了个透" + (get_noFur() ? "" : "，在他的皮毛上汇聚成水洼") + "。");
            }
            if(get_player().biggestLactation() >= 3)
            {
               outputText("大量的乳汁从你的乳头喷涌而出，伴随着你的高潮不断喷洒。这只可怜的老鼠从头到脚都被浸透了，你的乳汁彻底浇透了这位武僧。");
            }
            if(get_player().averageVaginalWetness() == 5)
            {
               outputText("你的" + get_player().vaginaDescript(0) + "喷出大量淫液，混合着他自己的精液，将他彻底浸透。");
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("精液从你的[cock]喷洒到他的胸膛上。");
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("一阵精液雨从你的[cocks]喷洒而出，溅落在乔乔身上。");
            }
            if(get_player().cockTotal() == 3)
            {
               outputText("无数股浓稠的精液从你的[cocks]喷射而出，像水管一样将乔乔从头到腰浇了个透。");
            }
            outputText("[pg]终于满足后，你从这只晕乎乎的老鼠身上抽离。他的肉棒依然因渴望而肿胀，双手情不自禁地抚摸着它，眼神空洞。下次你一定要让他堕落得更深。[pg]");
            get_player().knockUp(29,432);
         }
      }
      
      public function jojosFourthRape() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("乔乔瘫倒在地，眼中充满了期待。他的自制力已经完全消失了。眼前这只堕落发情的老鼠，与你之前遇到的那位好学的僧侣截然不同。他的肉棒将近一英尺长，两英寸多粗，因兴奋而青筋暴起。[pg]");
         if(get_player().get_gender() == 1)
         {
            outputText("当你脱下衣服时，这位老鼠般的前僧侣跪了下来，他的意志几乎被欲望摧毁。");
            if(get_player().cockTotal() == 1)
            {
               outputText("你温柔地抚摸他的头，引导他靠近你的" + get_player().cockDescript(0) + "，看着他满怀期待地舔着嘴唇，你微笑着。当他取悦你时，他柔软的嘴唇和湿润的舌头让你喘息，他的努力让你的膝盖发软。乔乔托住你的睾丸，将一根" + (get_noFur() ? "" : "毛茸茸的") + "手指滑入你的屁股。他努力将你尽可能多地含入嘴里，在你的[cock]周围温暖湿润地喘息着。当他交替按压你的前列腺和用光滑的舌头平稳地舔舐时，你在快感中抽搐。");
            }
            else
            {
               outputText("你温柔地抚摸他的头，引导他靠近你的[cocks]，看着他满怀期待地舔着嘴唇，你微笑着。当他取悦你时，他柔软的嘴唇和湿润的舌头在你的龟头上让你喘息，他的努力让你的膝盖发软。乔乔托住你的睾丸，将一根" + (get_noFur() ? "" : "毛茸茸的") + "手指滑入你的屁股。他努力含住两根肉棒，挣扎着尽可能深地吞下它们，在你周围湿润地喘息着。当他交替按压你的前列腺和用光滑的舌头平稳地舔舐时，你在快感中抽搐。");
            }
            if(get_player().averageCockThickness() > 3 || get_player().dogCocks() > 0 && get_player().averageCockThickness() > 3)
            {
               outputText("乔乔不得不时不时地从你的[cock]上退开以呼吸空气，他勉强张开下巴，刚好能把你的粗壮重新含入嘴里。");
            }
            if(get_player().averageCockLength() > 10 || get_player().countCocksOfType(CockTypesEnum.HORSE) > 0 && get_player().averageCockLength() > 10)
            {
               outputText("他努力不被你[cock]的长度噎住，尽可能地张开喉咙。");
            }
            outputText("你在他的脸上前后摇晃，他熟练地让你保持在性高潮的边缘。");
            if(get_player().cumQ() > 25)
            {
               outputText("你源源不断流出的浓稠前列腺液几乎让这只可怜的老鼠窒息，他无情地把你逼到高潮边缘，他自己的那活儿也因为感同身受的欲望而滴着水。");
            }
            outputText("乔乔把他的" + (get_noFur() ? "手" : "爪子") + "用力按在你的屁股上，紧紧挤压着你的前列腺，同时他火热的" + (get_noFur() ? "嘴" : "口鼻") + "深深地吞下你的肉棒。你感觉到高潮带来的紧绷感越来越强，随着压力的增加，你把他紧紧地拉向自己。");
            if(get_player().cumQ() < 25)
            {
               outputText("你在高潮时用力顶向他，你喷出的小股精液被这只淫荡的老鼠急切地吞食着。");
            }
            if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
            {
               outputText("你在高潮时用力顶向他，这只淫荡老鼠的喉咙紧紧挤压着你，努力吞咽着你的精液。");
            }
            if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
            {
               outputText("你在高潮时在他身上痉挛，快感在淫荡老鼠的喉咙里爆发，他试图把它们全部吞下。当你完全释放自己时，多余的精液从他的嘴角滴落。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("你在高潮时用力顶向他，这只淫荡老鼠的脸颊因为惊讶而鼓起，你的精液在他的嘴里爆发。浓稠的精液从他的" + (get_noFur() ? "嘴唇" : "口鼻") + "角落流出，你的精液涌入他体内的速度比他吞咽的速度还要快。最终你射完了，看到这只老鼠身上滴着你的精液，几乎到了腰部，他的肚子也微微鼓起。");
            }
            outputText("乔乔向后靠去，喘着粗气，脸上带着呆滞的笑容。他把一大口你的精液吐在他的" + (get_noFur() ? "手" : "爪子") + "里，开始用它自慰，淫荡地为你表演。[pg]");
            if(get_player().lib > 50 && get_player().cor > 80)
            {
               outputText("<b>你感觉到体内一股熟悉的力量正在增长，并决定释放它。</b>你从他的衣服上抓起念珠，在上面吐口水，让它们变得湿滑。你把它们拿在疲软的肉棒下面，集中注意力在脑海中的恶魔幻象上，缓慢但不断地将越来越大的精液滴在曾经神圣的念珠上。乔乔明白了你的意图，呻吟着转过身来，向你摇晃着他柔软的老鼠屁股。你俯身在他身上，在他耳边低语，[say:我塞进你体内的每一颗被玷污的念珠都会让你变成一个更心甘情愿的荡妇。更心甘情愿地成为恶魔精液的容器。更像是一个等待魅魔开发的欲望喷泉。更像我的玩具。][pg]");
               outputText("当你滑入第一颗珠子时，他呜咽了一声，他的眼睛变得雾蒙蒙的，他的屁股扭动得更加急切了。你把第二颗珠子推入他体内，感觉到他的屁眼被撑开并放松，欢迎着这种堕落。第三颗珠子直接滑了进去，他呻吟着，[say:荡——妇——]在呻吟的过程中，他的阴茎变得更长更粗，停在超过一英尺长、3英寸粗的地方，滴落着精液。你低语道，[say:射吧，我的玩具，]然后把剩下的珠子推入他体内。他翻着白眼，他的" + (get_noFur() ? "手" : "爪子") + "疯狂地套弄着他的" + get_monster().cockDescriptShort(0) + "，精液像喷泉一样从他身上喷涌而出。乔乔颤抖着，完全失去了控制，从你身边倒下。你仍然握着他念珠的末端，微笑着看着它们弹出来，被染得几乎和这只可怜老鼠的灵魂一样黑。[pg]");
               outputText("你走开了，留下你的新宠物去探索他的人生观，并测试你觉醒的力量。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-10),DynStat.Cor(10));
            }
            else
            {
               outputText("乔乔最终猛烈地射精，瘫倒在一滩精液中。你微笑着走开，希望能再次遇到他。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(2),DynStat.Cor(1));
            }
         }
         if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
         {
            outputText("当你脱下衣服时，这位曾经是僧侣的老鼠跪了下来，他的意志几乎被欲望击垮。");
            outputText("你温柔地抚摸着他的头，引导他来到你的" + get_player().vaginaDescript(0) + "，当他带着欲望舔嘴唇时，嘴角露出了笑容。当他" + (get_noFur() ? "" : "湿润的") + "鼻子撞击你的腹股沟时，你喘息着，从你的[clit]射出阵阵快感。他用舌头攻击，用他那长长的、几乎像蛇一样的舌头猛烈地攻击你的" + get_player().vaginaDescript(0) + "。你颤抖着，知道当你看到它时，这就是堕落的明显迹象，水分润滑了老鼠的脸。[pg]");
            outputText("乔乔在你的肉缝里呻吟，他的" + get_monster().cockDescriptShort(0));
            if(get_player().isBiped())
            {
               outputText("摩擦着你的小腿");
            }
            else
            {
               outputText("摩擦着你的[leg]");
            }
            outputText("。你产生了一个邪恶的想法，");
            if(get_player().lowerBody.type == 8)
            {
               outputText("把他的" + get_monster().cockDescriptShort(0) + "推入粘液的褶皱之间，把它夹在一团湿滑、粘稠的紧致中。你扶着他的肩膀保持平衡，慢慢地挤压他，轻轻地挤出小股前列腺液。他加倍努力，把鼻子埋进你的" + get_player().vaginaDescript(0) + "，舌头在你的肉缝和[clit]周围盘旋。对于他的每一次努力，你都加快了自己的步伐，用你的粘液挤压和抚摸他，尽你最大的努力在他慢慢扭曲的脑海中灌输一种被别人的下半身手淫的癖好。你感觉到粘液中有一股热热的湿润感，而且每一秒都变得更滑更湿。乔乔的精液从你体内滴出，把你果冻般的身体染成了白色。");
            }
            else
            {
               outputText("用你的" + get_player().foot() + "推他的" + get_monster().cockDescriptShort(0) + "，把它夹在一只" + get_player().foot() + "下面和另一只上面。你扶着他的肩膀保持平衡，慢慢地挤压他，轻轻地挤出小股前列腺液。他加倍努力，把鼻子埋进你的" + get_player().vaginaDescript(0) + "，舌头在你的肉缝和[clit]周围盘旋。对于他的每一次努力，你都加快了自己的步伐，用你的" + get_player().feet() + "挤压和抚摸他，尽你最大的努力在他慢慢扭曲的脑海中灌输一种[foot]癖。你感觉到[feet]上有一股热热的湿润感，而且每一秒都变得更滑更湿。乔乔的精液从它们之间滴出，把它们染成了白色。");
            }
            if(get_player().averageVaginalWetness() <= 1)
            {
               outputText("你在高潮中扭动时，紧紧夹住他的" + (get_noFur() ? "脸" : "口鼻") + "。");
            }
            if(get_player().averageVaginalWetness() > 1 && get_player().averageVaginalWetness() <= 3)
            {
               outputText("当高潮席卷你的身体时，你的双腿将他的" + (get_noFur() ? "脸" : "口鼻") + "紧紧夹在你的" + get_player().vaginaDescript(0) + "里。");
            }
            if(get_player().averageVaginalWetness() == 4)
            {
               outputText("你的双腿将他的" + (get_noFur() ? "脸" : "口鼻") + "夹在你的" + get_player().vaginaDescript(0) + "里，在你因快感而痉挛时，用淫液弄湿了他的" + (get_noFur() ? "脸" : "口鼻") + "。");
            }
            if(get_player().averageVaginalWetness() == 5)
            {
               outputText("你的双腿将他挤压在你的" + get_player().vaginaDescript(0) + "上，淫液喷发在他的脸上，将他浸透，你在高潮中享受着极乐");
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]将精液滴落在他的头发上，有些顺着他的耳朵滴落下来。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你的[cock]将精液滴落在他身上，用浓稠的白色精液覆盖了他的头。");
            }
            outputText("你在快感中无力地抽搐着，倒了下去。[pg]");
            outputText("这种快感太棒了……但你还想要更多。你撑起身子，高兴地看着乔乔抚摸着他那沾满精液的" + get_monster().cockDescriptShort(0) + "，浓稠的精液从顶端漏出。你扑向他，把他推倒在地上，将你的" + get_player().vaginaDescript(0) + "对准他，让他闻到你私处的味道。带着胜利的微笑，你坐到他身上，将自己刺入他的" + get_monster().cockDescriptShort(0) + "。");
            if(get_player().averageVaginalLooseness() == 0)
            {
               outputText("他大得让你感到痛苦，以至于你感到的痛苦多于快感。");
            }
            if(get_player().averageVaginalLooseness() == 1)
            {
               outputText("他像乳胶手套一样撑开你，用他的" + get_monster().cockDescriptShort(0) + "把你的" + get_player().vaginaDescript(0) + "拉得紧紧的，这种感觉游走在快感和痛苦的边缘。");
            }
            if(get_player().averageVaginalLooseness() == 2)
            {
               outputText("他的" + get_monster().cockDescriptShort(0) + "完全塞满了你，把你的" + get_player().vaginaDescript(0) + "撑到了极限。");
            }
            if(get_player().averageVaginalLooseness() == 3)
            {
               outputText("他的" + get_monster().cockDescriptShort(0) + "非常适合你，深深地埋在你的肉褶里。");
            }
            if(get_player().averageVaginalLooseness() == 4)
            {
               outputText("你轻松地将他的肉棒容纳进你的" + get_player().vaginaDescript(0) + "里。");
            }
            if(get_player().averageVaginalLooseness() == 5)
            {
               outputText("他的" + get_monster().cockDescriptShort(0) + "几乎没有遇到什么阻力就滑进了你的" + get_player().vaginaDescript(0) + "，轻松地没入根部。你暗自思忖，[say:要是他再粗一点就好了……]");
            }
            outputText("你缓慢地骑乘着他，臀部做着微小的画圈研磨动作，同时你的手" + (get_noFur() ? "抚摸着他的身体" : "穿过他的皮毛") + "。他的臀部随着微小的抽搐轻轻地顶弄着你，精液从你的" + get_player().vaginaDescript(0) + "中涌出，同时也不断地从他身上滴落。");
            outputText("他逐渐加快了节奏，你被迫跟着他的节奏，开始在他的" + get_monster().cockDescriptShort(0) + "上弹跳。你抓起一把他的" + (get_noFur() ? "头发" : "皮毛") + "紧紧抓住，他开始猛烈地撞击你的" + get_player().vaginaDescript(0) + "，他巨大的睾丸拍打着你。随着他每一次猛烈的抽插，精液从你的小穴中喷射而出，更多的精液不断地倾注到你的深处。乔乔高兴地尖叫着，最后一次将他的臀部猛地撞向你，在你的通道中引发了精液的喷发。你感觉到它涌入你的子宫，随着每一次颤抖的精液泵送，慢慢地撑大你的肚子。你无助地高潮了，整个过程中手指一直在揉捏你的[clit]。");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockTotal() == 1)
               {
                  if(get_player().countCocksOfType(CockTypesEnum.HORSE) == 1)
                  {
                     outputText("你的" + get_player().cockDescript(0) + "感觉到压力在不断积聚，整个肉棒随着你的每一次心跳狂野地跳动着，最明显的是顶端，它狂野地膨胀开来。强烈的收缩折磨着你的[sheath]和[cock]，前列腺液几乎像喷泉一样喷涌而出。");
                  }
                  if(get_player().hasKnot())
                  {
                     outputText("你的[cock]感觉到强烈的压力，开始在你的[sheath]上方淫秽地凸起。肉结无端地变厚，随着需求的脉动而充血。精液从你的[cockhead]滴落，它继续膨胀得更宽，让你充满了难以忍受的压力。");
                  }
                  if(get_player().countCocksOfType(CockTypesEnum.HUMAN) == 1)
                  {
                     outputText("你的[cock]抽搐着，肌肉收缩慢慢地从根部向上蔓延。");
                  }
                  if(get_player().cumQ() < 25)
                  {
                     outputText("你的身体紧绷并射精，将精液喷洒在老鼠身上。");
                  }
                  if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
                  {
                     if(get_player().countCocksOfType(CockTypesEnum.HORSE) == 1)
                     {
                        outputText("你的[cock]狂野地膨胀，麝香马精液从中喷发而出，溅在乔乔身上。");
                     }
                     if(get_player().hasKnot())
                     {
                        outputText("你[cock]里那可怕的压力终于得到了释放，狗精像喷泉一样从你的[cock]里喷涌而出，形成了一股似乎永无止境的稳定水流。");
                     }
                     if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[0].get_cockType().get_Index() > 2)
                     {
                        outputText("你的身体紧绷着，喷射出远超常人能产生的浓稠精液。乔乔被这东西溅了一身。");
                     }
                  }
                  if(get_player().cumQ() >= 250)
                  {
                     if(get_player().countCocksOfType(CockTypesEnum.HORSE) == 1)
                     {
                        outputText("你的[cock]带着野兽般的活力起伏膨胀，每一次收缩都将马精溅得到处都是。麝香般的野兽精液似乎永远不会停止从你的马具中倾泻而出，把这只老鼠的腰部以上都浸透了。");
                     }
                     if(get_player().hasKnot())
                     {
                        outputText("你的[cock]突然释放了压力，一股持续不断的精液像某种精液软管一样从你的[cock]里喷涌而出。它似乎永无止境，随着你的肉结慢慢缩小到正常大小，浓稠的精液带覆盖了这只老鼠的腰部以上。");
                     }
                     if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[0].get_cockType().get_Index() > 2)
                     {
                        outputText("你的身体紧绷着，喷射出远超常人能产生的浓稠精液。乔乔被这东西溅了一身。");
                     }
                  }
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的阴茎根部感觉到一股不断积聚的压力。它似乎越来越强，直到最后从你体内爆发出来，精液覆盖了这只可怜老鼠的腰部以上。");
               }
            }
            if(get_player().biggestLactation() >= 1 && get_player().biggestTitSize() > 3)
            {
               if(get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) < 8)
               {
                  outputText("在性高潮的刺激下，乳汁从你的[breasts]中喷射出细小的水流。");
               }
               if(get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) < 20 && get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) >= 8)
               {
                  outputText("乳汁从你的[breasts]中喷发出来，喷洒在老鼠身上，随着每一次令人战栗的高潮收缩而喷射。");
               }
               if(get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) < 35 && get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) >= 20)
               {
                  outputText("乳汁从你的[breasts]中喷发出来，以脉冲式的冲击喷洒，浸透了老鼠。每一次令人神经紧绷的高潮似乎都从你身上榨出越来越多的乳汁，直到它在周围汇聚成水坑。");
               }
               if(get_player().biggestTitSize() * get_player().biggestLactation() * int(get_player().breastRows.length) >= 35)
               {
                  outputText("乳汁从你的[breasts]中如喷泉般涌出，用源源不断的奶油河浸透了老鼠。每当你感觉到一团精液被推入你那过度充盈的子宫时，就会有另一股乳汁喷涌而出。随着你那令人神魂颠倒的高潮不断持续，你周围形成了一个小小的乳汁湖。");
               }
            }
            get_player().cuntChange(3,true);
            get_player().knockUp(29,432);
            if(get_player().lib > 50 && get_player().cor > 80)
            {
               outputText("[pg]<b>你感觉到体内有一股熟悉的力量在增长，并决定释放它。</b>你从他的衣服上抓起念珠，在上面吐了口唾沫，让它们变得湿滑。你把它们举在他那疲软的阴茎下方，将注意力集中在脑海中的恶魔幻象上，缓慢但持续地将越来越大的精液挤到曾经神圣的念珠上。乔乔明白了你的意图，呻吟着转过身来，向你摇晃着他那轻盈的老鼠屁股。你俯身在他耳边低语，[say:我推入你体内的每一颗被玷污的珠子，都会让你更像一个心甘情愿的荡妇。更像一个心甘情愿接受恶魔精液的容器。更像一个等待魅魔开发的欲望喷泉。更像我的玩具。][pg]");
               outputText("当你滑入第一颗珠子时，他呜咽了一声，他的眼睛变得雾蒙蒙的，他的屁股扭动得更加急切了。你把第二颗珠子推入他体内，感觉到他的屁眼被撑开并放松，欢迎着这种堕落。第三颗珠子直接滑了进去，他呻吟着，[say:荡——妇——]在呻吟的过程中，他的阴茎变得更长更粗，停在超过一英尺长、3英寸粗的地方，滴落着精液。你低语道，[say:射吧，我的玩具，]然后把剩下的珠子推入他体内。他翻着白眼，他的" + (get_noFur() ? "手" : "爪子") + "疯狂地套弄着他的" + get_monster().cockDescriptShort(0) + "，精液像喷泉一样从他身上喷涌而出。乔乔颤抖着，完全失去了控制，从你身边倒下。你仍然握着他念珠的末端，微笑着看着它们弹出来，被染得几乎和这只可怜老鼠的灵魂一样黑。[pg]");
               outputText("你走开了，留下你的新宠物去探索他的人生观，并测试你觉醒的力量。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Lib(-10),DynStat.Cor(10));
            }
            else
            {
               outputText("[pg]精疲力竭的你从老鼠身上挣脱出来，虽然欲望被抽干，但感觉非常下流。乔乔甚至懒得起身，他只是继续自慰，迷失在你那湿滑汁液和他的精液的气味中。当你迈着性感的步伐走开时，性液被吸收到地下。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Lib(2),DynStat.Cor(1));
            }
         }
      }
      
      public function jojosFirstRape(param1:Boolean = false) : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         if(!param1)
         {
            outputText("你假装同意，跟着乔乔走进了树林。你耐心等待，等他放松警惕。终于，这只老鼠绊了一下，你的机会来了！[pg]");
         }
         if(get_player().get_gender() == 1)
         {
            outputText("你用力推他，顺势将他娇小的身躯压住。他挣扎着，但你熟练地扭过他的手臂，用你更大的体重将他按倒。当你撕下他衣服的下摆时，他扭动着，当你强行将他按在泥土里并露出他结实的臀部时，他极力抗议。[pg]");
            if(get_player().cockTotal() == 1)
            {
               outputText("你咧嘴一笑，将你的" + get_player().cockDescript(0) + "压向他，让他发出抗议的尖叫。你继续用力，渴望侵犯他紧闭的后庭，沉醉在那令人窒息的紧致感中。当你粗暴地操弄他时，他的肌肉无力地颤抖着，随着你注意到他身下迅速肿胀的凸起，他微弱的抗议声变得越来越弱。你伸手绕过去，一边操他一边开始给他手淫，幻想着用堕落的恶魔力量灌满他，让他成为你的奴隶。这些肮脏的念头让你的睾丸感到胀满；随着你的[cock]在猎物体内弯曲膨胀，你的下体产生了一种脉动、挤压的紧绷感。你猛烈地高潮了，将他的" + (get_noFur() ? "脸" : "口鼻") + "按在泥土里，一团又一团的精液泵入他的屁股，将他彻底侵犯。[pg]");
               outputText("伴随着满足的叹息，你伴随着一声清晰的“啵”声拔出了你的[cock]。你的精液开始流出，在他身下汇聚成一滩，并与他自己的精液混合在一起。这个小家伙一定也高潮得很厉害；他看起来几乎昏迷了。当你离开你那失去意识的受害者时，你意识到你感到前所未有的满足，几乎就像你高潮得太厉害，带走了一些你的性欲一样。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2311,FlagDict_Impl_.arrayReadInt(_loc2_,2311) + 1);
            }
            else
            {
               outputText("你咧嘴一笑，将你的[cocks]压向他，让他发出抗议的尖叫。你继续用力，渴望侵犯他紧致的后庭，沉醉在那令人窒息的紧致感中。当你粗暴地操弄他时，他的肌肉无力地颤抖着，随着你注意到他身下迅速肿胀的凸起，他微弱的抗议声变得越来越弱。你伸手绕过去，一边操他一边开始给他手淫，幻想着用堕落的恶魔力量灌满他，让他成为你的奴隶。这些肮脏的念头让你的睾丸感到胀满，随着你的[cock]在猎物体内弯曲膨胀，你的下体产生了一种脉动、挤压的紧绷感。你猛烈地高潮了，将他的" + (get_noFur() ? "脸" : "口鼻") + "按在泥土里，一团又一团的精液泵入他的屁股，将他彻底侵犯。精液喷洒在他的屁股上，你其余的装备也像你插入老鼠洞的那根一样猛烈地射精，将他浸透。[pg]");
               outputText("伴随着满足的叹息，你伴随着一声清晰的“啵”声拔出了你的[cock]。你的精液开始流出，在他身下汇聚成一滩，并与他自己的精液混合在一起。这个小家伙一定也高潮得很厉害，他看起来几乎昏迷了。当你离开你那失去意识的受害者时，你意识到你感到前所未有的满足，几乎就像你高潮得太厉害，带走了一些你的性欲一样。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2311,FlagDict_Impl_.arrayReadInt(_loc2_,2311) + 1);
            }
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("你用力拍打他的后脑勺，让他晕头转向。你将他转过身，同时扫倒他的双腿，一只手拉扯他的裤子，另一只手划破他的腰带。他简直是“从裤子里掉了出来”，摔在森林柔软的泥土上。你扑向这个被惊呆的武僧，脱掉自己的衣服，将他按倒在地。他开始反抗，在你身下扭动，");
            if(get_player().wetness() < 2)
            {
               outputText("但你用肉缝摩擦他的感觉暂时瓦解了他的意志。");
            }
            else
            {
               outputText("但你的" + get_player().vaginaDescript(0) + "摩擦他那正在变硬的肉棒的感觉剥夺了他所有的意志。");
            }
            outputText("当你意识到相对于他的体型来说他有多大时，你笑了，然后骑上他，小心地将他死死按在地上。");
            get_player().cuntChange(12,true,true,false);
            outputText("[pg]");
            outputText("当你用力骑乘他时，他发出微弱的咕噜声和抗议的呜咽，但很快就高潮了。你阴道内涌入的温暖只会刺激你，让你用粗暴的力量将你的" + get_player().vaginaDescript(0) + "砸向他。你想象着自己强暴别人，用你那饥渴的小穴腐化所有遇到的人。你想象着成为一个魅魔会是什么样子，就这样操着可怜的武僧，你的魔法让受害者的男子气概变得越来越大。这个念头如潮水般席卷了你，你猛烈地高潮了；你的" + get_player().vaginaDescript(0) + "紧紧夹住乔乔的肉棒，他发现自己再次高潮，双眼翻白。你颤抖着呻吟，每一次在可怜的老鼠身上弹跳，精液都会从你的淫洞里喷射出来。");
            if(get_player().biggestLactation() >= 1 && get_player().biggestLactation() < 2)
            {
               outputText("乳汁从你的乳头喷射而出，用你那奶油般的乳汁小水滴喷洒他。");
            }
            if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() < 3)
            {
               outputText("乳汁随着你小穴的收缩从你的乳头喷射而出，将可怜的老鼠冲洗了一遍" + (get_noFur() ? "" : "并在他的皮毛上积成水坑") + "。");
            }
            if(get_player().biggestLactation() >= 3)
            {
               outputText("大量的乳汁从你的乳头喷涌而出，随着你的高潮不断喷洒。可怜的老鼠从头到脚都被浸透了，你的乳汁完全浸透了武僧。");
            }
            outputText("[pg]你双腿发软地站着，很高兴能如此彻底地操弄这样一个贞洁善良的生物。你发誓很快还要再来一次，你意识到自己感觉头脑更清醒了，虽然也变得更邪恶了一点。");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(-10),DynStat.Cor(4));
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2311,FlagDict_Impl_.arrayReadInt(_loc2_,2311) + 1);
            get_player().knockUp(29,432);
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("你用力推他，顺势将他娇小的身躯压住。他挣扎着，但你熟练地扭过他的手臂，用你更大的体重将他按倒。当你撕下他衣服的下摆时，他扭动着，当你强行将他按在泥土里并露出他结实的臀部时，他极力抗议。[pg]");
            if(get_player().cockTotal() == 1)
            {
               outputText("你咧嘴一笑，将你的" + get_player().cockDescript(0) + "压向他，让他发出抗议的尖叫。你继续用力，渴望侵犯他紧致的屁眼，陶醉在那令人窒息的紧致感中。当你粗暴地操弄他时，他的肌肉无力地颤抖着，当你注意到他身下迅速肿胀的凸起时，他微弱的抗议声变得越来越弱。你伸手绕过去，一边操他一边开始给他打飞机，幻想着给他灌满堕落的恶魔力量，让他成为你的奴隶。这些肮脏的念头让你的睾丸感到饱满，当你的[cock]在猎物体内弯曲膨胀时，你的下体产生了一种脉动的挤压感。你猛烈地高潮了，将他的" + (get_noFur() ? "脸" : "口鼻") + "按在泥土里，一团又一团的精液泵入他的屁股，从核心侵犯他。你的小穴颤抖着，也高潮了，感觉空虚。你决定下次要夺走他肉棒的童贞。");
               if(get_player().biggestLactation() >= 1 && get_player().biggestLactation() < 2)
               {
                  outputText("乳汁从你的乳头喷射而出，用你奶油般的乳汁小水滴喷洒他。");
               }
               if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() < 3)
               {
                  outputText("乳汁随着你小穴的收缩从你的乳头喷射而出，冲刷着可怜的老鼠" + (get_noFur() ? "" : "，并在他的皮毛上积成水坑") + "。");
               }
               if(get_player().biggestLactation() >= 3)
               {
                  outputText("大股的乳汁从你的乳头喷涌而出，在你高潮时不断喷洒。可怜的老鼠从头到脚都湿透了，你的乳汁完全浸透了这位武僧。");
               }
               outputText("[pg]伴随着满足的叹息，你伴随着一声清晰的“啵”声拔出了你的[cock]。你的精液开始漏出，在他身下汇聚并与他自己的精液混合。这个小家伙一定高潮得很厉害，他看起来相当昏迷。当你离开你失去知觉的受害者时，你意识到你感觉比一段时间以来都要满足，几乎就像你高潮得太厉害，带走了你的一些性欲。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2311,FlagDict_Impl_.arrayReadInt(_loc2_,2311) + 1);
            }
            else
            {
               outputText("你咧嘴一笑，将你的[cocks]压向他，让他发出抗议的尖叫。你继续用力，渴望侵犯他紧致的屁眼，陶醉在那令人窒息的紧致感中。当你粗暴地操弄他时，他的肌肉无力地颤抖着，当你注意到他身下迅速肿胀的凸起时，他微弱的抗议声变得越来越弱。你伸手绕过去，一边操他一边开始给他打飞机，幻想着给他灌满堕落的恶魔力量，让他成为你的奴隶。这些肮脏的念头让你的睾丸感到饱满，当你的[cock]在猎物体内弯曲膨胀时，你的下体产生了一种脉动的挤压感。你猛烈地高潮了，将他的" + (get_noFur() ? "脸" : "口鼻") + "按在泥土里，一团又一团的精液泵入他的屁股，从核心侵犯他。精液喷洒在他的屁股上，你其余的装备也浸透了他，因为它们高潮得和那个沉入老鼠洞的家伙一样猛烈。你的小穴颤抖着，也高潮了，感觉空虚。你在心里决定下次要夺走他肉棒的童贞。");
               if(get_player().biggestLactation() >= 1 && get_player().biggestLactation() < 2)
               {
                  outputText("乳汁从你的乳头喷射而出，用你奶油般的乳汁小水滴喷洒他。");
               }
               if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() < 3)
               {
                  outputText("乳汁随着你小穴的收缩从你的乳头喷射而出，冲刷着可怜的老鼠" + (get_noFur() ? "" : "，并在他的皮毛上积成水坑") + "。");
               }
               if(get_player().biggestLactation() >= 3)
               {
                  outputText("大股的乳汁从你的乳头喷涌而出，在你高潮时不断喷洒。可怜的老鼠从头到脚都湿透了，你的乳汁完全浸透了这位武僧。");
               }
               outputText("[pg]伴随着满足的叹息，你伴随着一声清晰的“啵”声拔出了你的[cock]。你的精液开始漏出，在他身下汇聚并与他自己的精液混合。这个小家伙一定高潮得很厉害，他看起来相当昏迷。当你离开你失去知觉的受害者时，你意识到你感觉比一段时间以来都要满足，几乎就像你高潮得太厉害，带走了你的一些性欲。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-10),DynStat.Cor(4));
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2311,FlagDict_Impl_.arrayReadInt(_loc2_,2311) + 1);
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function jojosFifthRape() : void
      {
         clearOutput();
         outputText("乔乔平静地微笑着，对这个结果感到满意，一英尺长的肿胀老鼠肉棒在立正。[pg]");
         outputText("你操了你那像老鼠一样的荡妇感觉好几个小时，直到你们俩都筋疲力尽才高潮。");
         get_player().orgasm("Generic");
         get_player().changeFatigue(-20);
         if(get_player().lib > 40)
         {
            outputText("当你完成后，你感觉头脑更清醒了，但乔乔看起来比以往任何时候都更饥渴。");
            dynStats(DynStat.Lib(-4));
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2311,FlagDict_Impl_.arrayReadInt(_loc1_,2311) + 1);
      }
      
      public function jojoTalkYourOrigin() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("当你开始和乔乔交谈时，你们俩聊了很久，其实都没什么重要或值得注意的，只是闲聊。直到武僧提起你的背景。你告诉他关于英格纳姆和你在那里的家人，以及通过传送门送勇者的传统。当他问为什么会有人选择来这里时，你告诉他传说中如果有一年没有送勇者穿过传送门，村庄就会发生可怕的事情。[pg]");
         outputText("[say: 那个传送门？]乔乔指着你跌跌撞撞穿过的那个传送门问道。你点点头，他接着问，[say: 那么……你在英格纳姆的时候是什么样的？][pg]");
         if(get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你曾是一名炼金术士，在村里经营着一家药剂店。他询问了你的工作，以及你的家人对你从事炼金术的看法。你告诉他，当你决定退休并成为下一任勇者时，你把店铺留给了一个朋友。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你曾是村里炼金术士里库的助手。他询问了你和炼金术士在一起的时光，以及你的家人对你从事炼金术的看法。你告诉他，你正准备进行进阶学习时，就被宣布成为下一任勇者，而你真正学到的只是如何提高某些类型物品的效力。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistoryFighter))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你年轻时经常打架，这也让你加入了村庄卫队。你提到了你值班时发生的各种有趣的事情，以及你如何决定成为下一任勇者，以另一种方式保护村庄。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你在成长过程中是如何经常打架的。你指名道姓地告诉他，那些小兔崽子为什么以及如何得到了他们应得的教训。你告诉他你曾计划加入村庄卫队，但当宣布你成为下一任勇者时，这成了一个白日梦。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistoryHealer))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你一生中大部分时间都在做村里的治疗师。你谈到了你为什么想把时间花在照顾病弱者身上，以及你学到的技能。你让他知道，当你决定成为下一任勇者时，你刚刚完成了一个学徒的培训，让他接手你的工作。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你花了很多时间在村里的治疗师丹迪身边。你谈到了你为什么想花时间陪这位老人照顾病弱者，以及你在那里学到的技能。你让他知道，当你被宣布成为下一任勇者时，你刚刚决定接受训练成为一名正式的治疗师。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistoryReligious))
         {
            outputText("你告诉乔乔你大部分时间都在神庙里度过。他似乎很喜欢听天莲宗和你们村庄在宗教实践上的差异。你告诉他你家乡的各种神职人员，以及埃丝特修女如何花时间教你冥想[if (wasElder) {在年轻时}]。[pg]");
         }
         else if(get_player().hasPerk(PerkLib.HistoryScholar))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你对知识有着永不满足的渴望，以及你如何花大量时间将这些知识传授给你的学生。你描述了你收集的一些珍稀书籍，并提到你来到这里时不得不把它们留下来的失望之情。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你对知识有着永不满足的渴望，以及你如何在学校里度过了大量时间。你给他讲了你是如何“说服”[if (silly) {萨文|塞莱特}]先生让你阅读他收藏的一些珍稀书籍的故事，略过了你实际上进行了多少乞求和恳求。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistorySlut))
         {
            outputText("你告诉乔乔你是如何花时间……交朋友的。乔乔奇怪地看着你，当你告诉他你有很多朋友时……[pg]");
            outputText("[say: 我想那很好，[name]，但除了，呃……受欢迎之外，你没有别的抱负吗？]他质疑道。[pg]");
            outputText("你笑着告诉他你只是很擅长交朋友，而不是告诉他你实际上是个多大的荡妇的真相。[pg]");
         }
         else if(get_player().hasPerk(PerkLib.HistorySlacker))
         {
            outputText("你告诉乔乔你基本上是和你的狐朋狗友们一起放松度日的。你用你通常惹人厌烦的故事掩盖了你是个多大的懒汉。你没有告诉他，你很确定你被选为下一任勇者是为了把你打发走。[pg]");
         }
         else if(get_player().hasPerk(PerkLib.HistoryThief))
         {
            outputText("你告诉乔乔你是如何……帮助别人搬东西，并清理他们房子里的旧垃圾的。你提到了你“获得”的一些更有趣的物品，并告诉他你如何决定自愿成为下一任勇者，因为村里的生活开始变得危险（对你来说）。他似乎很困惑，但耸耸肩不以为意。[pg]");
         }
         else if(get_player().hasPerk(PerkLib.HistorySmith))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你花时间做铁匠的工作。他对锻造知之甚少，问了你做过的事情，你尽你所能回答了他。最后，你非常详细地描述了试穿盔甲的过程，并告诉他，当你成为下一任勇者时，你有一个很有前途的学徒接管了你的店铺。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你花时间训练成为一名铁匠。他对锻造知之甚少，问了你学到的东西，你尽你所能回答了他。最后，你非常详细地描述了试穿盔甲的过程，以及你打算开始学习高级技术，但被宣布成为下一任勇者。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistoryWhore))
         {
            if(get_player().wasElder())
            {
               outputText("你告诉乔乔你花了很多时间……赚钱。当天真的小武僧问你怎么赚时，你只是微笑着，深情地回忆起年长的妓女毒药教你诀窍和行业技巧的情景。不管这让人们怎么看你，那确实是一笔好钱。为了向武僧隐瞒你过去一些更混乱的细节，你解释了你是如何管理一家为人们提供……各种服务的商店的，这是一项除了你的“员工”之外没有多少人愿意做的重要工作。他似乎很困惑，但耸耸肩不以为意。[pg]");
            }
            else
            {
               outputText("你告诉乔乔你花了很多时间……赚钱。当天真的小武僧问你怎么赚时，你只是微笑着，深情地回忆起年长的妓女毒药教你诀窍和行业技巧的情景。不管这让人们怎么看你，那确实是一笔好钱。为了向武僧隐瞒你过去一些更混乱的细节，你解释了你是如何接受……人们的零工的，这是一项村里没有多少其他人愿意接受的重要工作。他似乎很困惑，但耸耸肩不以为意。[pg]");
            }
         }
         else if(get_player().hasPerk(PerkLib.HistoryFortune))
         {
            outputText("你告诉乔乔你很幸运，赚了不少钱。当武僧问你怎么赚时，你耸耸肩告诉他这纯粹是运气。[pg]");
         }
         else if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            outputText("你向乔乔讲述了你严苛的成长经历，从出生起就被塑造成为了与一切腐化抗争的战士。你提到了残酷的体能训练，无数个熬夜学习骑士团所知的关于腐化的知识的夜晚，以及为了惩罚色欲之念而进行的鞭笞。");
            outputText("[pg][say: 玛莱啊，[name]，那听起来真难熬。我的童年也很严格，但远没有到那种程度。不过我确信，这些痛苦都会有回报的。我知道你一定能击败莉希丝的大军。]");
         }
         else
         {
            outputText("不知为何，你似乎没有一个明确的背景特质……<b>请报告这个Bug！</b>[pg]");
         }
         outputText("乔乔现在对你有了更多的了解，他微笑着。[pg]");
         talkMenu(jojoTalkYourOrigin);
      }
      
      public function jojoTalkVillage() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你决定向乔乔询问他的村庄。[pg]");
         outputText("他轻声说着，脸上和声音里都带着微笑，[say:那是一个靠近美丽大湖的小村庄。我们是和平的人民，彼此欢笑，相互信任，就是那种善良淳朴的人，你知道吗？[pg]贝尔里奇的大多数人要么是渔民，要么是农民，他们有着庞大的家庭，住在村庄附近。还有一些猎人和工匠。我们不与任何人结怨，也不想伤害别人，]乔乔说着，笑容渐渐消失。[pg]");
         outputText("还没等你对他的悲伤做出反应，他那" + (get_noFur() ? "嘴唇" : "毛茸茸的脸颊") + "又咧开了，他用明亮的眼睛抬头看着你。[pg]");
         outputText("[say: 我父亲是个渔夫。他是个平静而强壮的男人，留着许多银白色的胡须，身上总是带着鱼腥味。我记得我以前经常和他还有几个兄弟一起出海，他总是会把我抱起来放在他的肩膀上……直到我长得太大。他总是让一切看起来那么容易，好像这个世界就是为了和他握手并让他微笑而存在的。没有人能像他那样烹饪海鲜，没有人。[pg]然后是我母亲，她有点神经质，但没有人能比她更热烈地拥抱你，或者更深切地爱你。她是个小个子女人，但有着伟大的灵魂，她爱她的家人胜过一切。在遇到我父亲之前，她是个裁缝，总是房间里最耀眼的一个，当你身边有十七个吵闹的孩子争夺你的注意力时，这可不容易。[pg]即使有19个人住在同一个屋檐下，我的家庭也不是镇上最大的，但总是有干不完的活和吃不完的食物。那是一种美好而简单的生活，我很感激在那个村子里和大家共度的时光，]他带着平静的微笑结束了讲述。[pg]");
         if(get_player().cor < 40)
         {
            outputText("看来乔乔的童年还不错……既然谈话结束了，你感谢这位鼠人武僧与你分享他珍贵的记忆。[pg]");
         }
         else
         {
            outputText("看来乔乔的童年还不错。虽然有点甜得发腻，而且没有湿润的小穴和流着淫液的肉棒，但还不赖。你告诉他你很高兴有他在你身边，他笑得合不拢嘴，对你的想法一无所知。[pg]");
         }
         talkMenu(jojoTalkVillage);
      }
      
      public function jojoTalkSandCave() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你告诉乔乔，你发现了一个洞穴，那里是沙漠中沙漠女巫的基地。你向他讲述了整个磨难，他睁大眼睛，张着嘴听着。当你告诉他你遇到了沙之母时，乔乔倒吸了一口凉气。[pg]");
         outputText("[say: 等等……所以你是说这些沙漠女巫是……玛莱的盟友？但她们那么……淫荡。]他似乎真的很困惑，但你告诉他，性毕竟是自然的一部分，这并没有什么不对或可耻的。他同意你的观点，但谴责沙漠女巫使用力量的方式。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 1)
         {
            outputText("你绘声绘色地描述了你与沙之母的战斗，当你讲到最后你强暴了沙之母时，你看着乔乔，然后……撒了谎。你完全掩盖了你性侵了沙之母的事实，因为尽管他很感兴趣，但他还是有点天真，对性征服的世界感到反感。他对你的行为进行了评价，却不知道实际发生了什么。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,847) == 1)
         {
            outputText("你绘声绘色地描述了你与沙之母的战斗。当你讲到最后，你告诉他，在你打败她之后，她其实很通情达理。[pg]");
            outputText("乔乔歪着头说道：[say: 也许整件事一开始就不需要演变成冲突。双方多一点外交手段……]——他意味深长地看了你一眼——[say: 也许会有很大的帮助。][pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,847) == 0)
         {
            outputText("你告诉乔乔，当你一路杀到沙之母面前时，她是如何与你交谈的。你告诉他她很通情达理，整件事最终只是一个简单的误会。[pg]");
            outputText("他对你处理情况的方式感到惊叹。[say: 很多人会以为她试图与他们交谈是个陷阱，然后急于攻击她，但你没有……这真是……不可思议，[name]，你真的是一个伟大的人。][pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,871) == 1)
         {
            outputText("你告诉乔乔，你发现了一个可怜的、神志不清的女孩坐在牛奶浴缸里，充当沙漠女巫集会的奴隶。[pg]");
            outputText("他像个听恐怖故事的孩子一样打了个寒颤，问道：[say: 你做了什么？][pg]");
            if(!get_milkWaifu().milkSlave())
            {
               outputText("你告诉乔乔，沙之母是如何告诉你那个浴缸女孩不适合获得自由，以及她们是如何照顾她的，因为她无法照顾自己。[pg]");
               outputText("乔乔托着下巴，陷入了沉思。[say:嗯……我想这是人类会做的事，特别是她看起来并没有被腐化。也许这些沙漠女巫集会并不全是坏人，不过还是很难相信她们会站在我们这边……]他抬起头，耸了耸肩。[say:不过，任何善举都是好事。我真希望那个可怜的女孩能好起来。][pg]");
            }
            else
            {
               outputText("当这个问题从他嘴里说出来时，你困惑地看了乔乔一眼，然后用眼神示意他看向[bathgirlname]。[pg]");
               outputText("他拍了拍自己的额头，说道：[say:哦……对……没错。]显然，他因为没有把这两件事联系起来而感到尴尬。不过他还是好脾气地笑了笑，[say:我不知道，我可能只是以为你找到了某个可怜的、神志不清的灵魂，然后决定救她。]乔乔一边说着，一边看向[bathgirlname]。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
               {
                  outputText("[say:在我们的照顾下，她会比在集会里过得好得多，]他坚定地说道。[pg]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
               {
                  outputText("[say:她现在已经比刚来的时候好多了，]他笑着说道。[pg]");
               }
               else
               {
                  outputText("[say:集会可不会像你这样为她付出。你给了她一个好得多的生活，甚至还帮她改善了状况，你真的是个勇者，[name]，]他说道，给了你一个充满感情的微笑，并拍了拍你的背。[pg]");
               }
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,839) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,855) == 1)
         {
            outputText("你告诉乔乔关于精液女巫的事，那个负责让集会里的女巫受孕的双性女巫，扮演着其他女巫父亲的角色。当你这么说的时候，他挠了挠耳朵，[say:就像我说的，我不明白为什么性对这些生物来说如此重要，但不管怎样，继续吧。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,852) == 1)
            {
               outputText("你告诉他，你是如何试图通过请求沙之母制造更多的精液女巫来改善当前精液女巫的处境的。[pg]");
               outputText("他低声吹了个口哨，[say:这可是个大胆的举动，[name]。不过看起来她们应该会想要这样，这能让她们，呃，你知道的……更频繁地做那事，而且从长远来看，能制造出更多的沙漠女巫，不是吗？]因为这个问题听起来像是在反问，所以你继续往下说。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,853) == 1)
            {
               outputText("你向他描述了你是如何说服沙之母允许她的精液女巫和沙漠女巫一起在沙漠中漫游的，他惊讶地看着你，[say:你真是个慷慨的灵魂，[name]，而且这位沙之母似乎也并非完全不讲道理。][pg]");
            }
            else
            {
               outputText("你告诉乔乔你其实已经说完了。他说：[say:哦……好吧，这挺奇怪的。]在一段尴尬的沉默之后，你们俩都大笑起来。[pg]");
            }
         }
         talkMenu(jojoTalkSandCave);
      }
      
      public function jojoTalkJoiningTheMonks() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你决定问问乔乔，他当初为什么决定成为一名武僧。[pg]");
         outputText("他说话时对你露出温暖的微笑，[say:嗯，我在一个有19口人的大家庭里长大，所以我小时候总是最安静的那个。我想我只是比较内向，但安静意味着我并不总是能得到很多关注。这并没有困扰我，恰恰相反，我喜欢安静地自省，但有这么多兄弟姐妹，在家里几乎不可能有片刻的宁静。][pg]");
         outputText("[say:所以我经常溜出去。我父亲能理解，但这让我母亲抓狂。每当她发现我溜走时，她就会放下家里的所有活计，带着我两个最大的哥哥来找我。我一直不明白为什么这有什么大不了的。我们住在一个著名修道院附近的小村庄里，非常安全。父母们会让孩子们出去玩耍、奔跑和探索，因为大家都互相认识，但我妈妈不是这样。她必须知道你要去哪里，你在做什么，以及你多久才能回来。我本来会告诉她的，但说我想去探索并不是一个能让她满意的答案。][pg]");
         outputText("[say:每当她找到我时，她都会吼我几句，然后紧紧抱住我，就像她刚刚看着我躲过一头冲锋的犀牛一样。每当她问我为什么要这么做时，我只是告诉她实话，家里太吵太拥挤了。这样过了几个星期后，她提出了一个折中方案。她说如果让我的一位哥哥陪我走到神庙，我就可以出门，然后我得待在那里，让神职人员看着我，保证我的安全并给我吃的。老实说，我认为是我爸爸想出的这个主意，他总是擅长折中和维持和平。][pg]");
         outputText("[say:神庙对我来说变得非常重要。我阅读关于世界的书籍，与神职人员交谈，静坐思考。我痴迷于学习，但我不想成为一名牧师，我不知道为什么……我想这只是对我没有吸引力。当我第一次看到造访神庙的武僧时，就像是破晓的曙光照亮了我。在那之后，我一直等到自己到了可以加入的年纪，然后进行了前往天莲宗修道院的短暂朝圣。][pg]");
         outputText("乔乔说完后，脸上挂着一抹宁静的微笑。然后他轻声笑着说，[say:谢谢你让我回忆起这些，[name]。我很喜欢我们的交谈。][pg]");
         talkMenu(jojoTalkJoiningTheMonks);
      }
      
      public function jojoTalkForestConvo() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你想了一会儿，决定问问乔乔他是怎么来到森林的。[pg]");
         outputText("他用突然疲惫的眼神看着你，说道，[say: 嗯，当时我正和一位师兄在田野里训练，我们看到修道院遭到了袭击。他让我去村子里，因为我是个新手，想救我一命。我决定去召集那里的人。我想，我已经像个懦夫一样逃跑了，我不能再像个懦夫一样躲起来。那是我出生的村庄，也是我许多兄弟姐妹的家，无论是比喻意义上还是字面意义上。我拼尽全力跑向村庄，希望能带着一支老鼠民兵回来帮助我的教团成员，以此来救赎我的懦弱。]他的声音哽咽了，他转过头去，显然在努力组织语言。[pg]");
         outputText("当你张开嘴想说话时，他举起手，用一根" + (get_noFur() ? "" : "毛茸茸的") + "手指请求你等一下。[pg]");
         outputText("[say: 我太迟了。恶魔们先袭击了那里，完事后才转向我的修道院。我花了几个小时在街道上寻找；每一个地下室，每一条小巷，每一个阁楼，每一个我能想到的有人可能藏身的地方。除了被毁坏的建筑物、各种被污染的体液污迹，以及偶尔出现的尸体——一些恶魔，更多的是老鼠——什么都没有。][pg]");
         if(get_player().cor < 35)
         {
            outputText("太可怕了……你只能想象如果你回到英格纳姆，看到它被摧毁……你的家人，你的朋友……你把手放在僧侣的肩膀上，打算暂时安慰他一下。[pg]");
         }
         else if(get_player().cor >= 35 && get_player().cor <= 75)
         {
            outputText("真倒霉……幸好你的村庄还在，你怀疑有任何恶魔敢在你的眼皮底下发动攻击……不过你觉得你应该为这位僧侣做点什么，所以你把手放在他的肩膀上，暂时安慰他一下。[pg]");
         }
         else
         {
            outputText("老鼠……如果几个恶魔就能把他们消灭，那一定是个懦夫村……这位僧侣显然很痛苦……也许你应该暂时安慰他一下，哪怕只是为了让他停下来。你把手放在他沉默的肩膀上……[pg]");
         }
         outputText("[say: 谢谢你，[name]。我在那里出生，看到那一切……]僧侣再次陷入沉默。[pg]");
         if(get_player().cor < 35)
         {
            outputText("你用手臂搂住乔乔的肩膀，试图安抚这位僧侣。他抬起头看着你，勉强挤出一个微笑。一滴眼泪顺着他的" + (get_noFur() ? "脸颊" : "口鼻") + "滑落，他说道，[say: 谢谢你，我的朋友。][pg]");
         }
         else if(get_player().cor >= 35 && get_player().cor <= 75)
         {
            outputText("你试着进一步安慰悲伤的武僧，把手放在他的背上，友好地拍了几下。乔乔明显振作了起来。[say: 谢谢你，我现在没事了，]他抬起头，给了你一个虚弱的微笑。[pg]");
         }
         else
         {
            outputText("看到机会，你搂住武僧，而他正默默地试图控制自己的情绪。紧紧抱着他，你能感觉到鼠人精瘦的肌肉，当你揉他的背时，“不小心”摸得太低，摸到了他尾巴的根部和他紧实挺翘的小屁股。当你“拥抱”这只老鼠时，你确保他没有注意到你的真实意图，当你放开他时，他居然还向你道谢。[pg]");
            dynStats(DynStat.Lust(10));
         }
         outputText("在你安慰了武僧之后，你问他接下来做了什么。[pg]");
         outputText("当他回答你时，他的肩膀挺直了，声音也恢复了一些以前的音量，[say: 我做了任何看到自己生活支离破碎的人都会做的事。我埋葬了他们。在接下来的几天里，我花时间将每一位村民安葬，然后为他们所有人祈祷。然后我回到了我的修道院，全心全意地祈祷他们能坚持住，至少能坚持到逃跑，而不是被抓住并扭曲成他们以前自我的变态躯壳。然而修道院是另一个墓地。我在那里发现了很多尸体。有些是教团的，但也有无数的小恶魔和不少恶魔。这个地方被精液和散发着腐败气息的乳汁玷污了。][pg]");
         outputText("你看到武僧眼中闪烁着愤怒，他握紧了拳头，[say: 他们彻底玷污了修道院，我对此无能为力，只能缅怀它。我劳作了感觉像几个星期的时间；埋葬阵亡者；寻找幸存者；收集我信仰中少数逃过恶魔亵渎的物品。]他意味深长地摸了摸脖子上的大珠子。[pg]");
         outputText("[say: 然后，我把修道院烧成平地，并放火烧了所有的田地……从那天起，我一直在荒野中勉强维持生计；我尽可能地研究我能找到的文本，尽可能地锻炼我的身体，并试图强化我的灵魂以抵御恶魔的诱惑。虽然我在技术上已经在我的道路上取得了很大的进步，但没有师傅，而且我能支配的教团文本也只有一小部分，我可能永远无法成为一个真正的宗师。][pg]");
         outputText("他用评估的眼神看了你一眼，然后移开视线，[say: 直到我遇到你，[name]，我唯一的目的就是找到摧毁我教团的恶魔，让他们为他们夺走的生命付出代价。这就是为什么我在森林里，我正在进行一项严酷的训练计划，以增加我的力量和技能，这样我就可以寻找那些夺走我所爱的一切的邪恶畜生……但复仇不是天莲宗的道路。天莲宗不训练恶霸或刺客。找到你并帮助你保护你的村庄免受这些变态恶魔生物的侵害，给了我新的目标，也会让我死去的兄弟姐妹感到自豪。我不能诚实地说我已经放弃了复仇，但是……我会先帮助你完成你的任务，哪怕只是为了纪念我们的友谊，纪念教团及其教义。][pg]");
         outputText("尽管你知道他小小的身躯里一定在经历着情感的风暴，但乔乔看起来焕然一新，内心平静，他感谢你给了他新的目标。[pg]");
         talkMenu(jojoTalkForestConvo);
      }
      
      public function jojoTalkFallOfTheMonks() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你决定问问乔乔，他是否愿意告诉你他的教团里的僧侣们到底发生了什么事。[pg]");
         outputText("乔乔低垂着眼睛，声音轻柔得像羽毛落在阵亡士兵身上，[say: 说实话？……我不知道到底是怎么发生的……也不知道为什么……但我的教团被消灭了。虽然从那以后我一直在寻找天莲宗的兄弟姐妹，但据我所知，我是唯一的幸存者。你知道，恶魔袭击修道院时，我正和一位师兄在外面。我只是个新手，而他是比较有趣的老师之一，所以我们忘记了时间。太阳快落山了，我们在回修道院的半路上，看到中央建筑升起了一股巨大的烟柱。当我们走近时，我们才看清那团云的真面目，那是一座由小恶魔组成的翻滚的塔。我们被发现了，几只小恶魔朝我们飞来——它们跨越距离的速度比我们快得多。][pg]");
         outputText("[say: 洛格雷师兄毫不犹豫——他跳到我面前，挥舞着法杖，每一次扫击都击碎头骨、打断四肢。当他挡住它们的去路时，他大声喊我逃跑，跑到村子里去避难……我照做了。我被恶魔身上散发出的苦乐参半的腐败恶臭所淹没，像一只受惊的小田鼠一样逃跑了。我是个懦夫，我丢下了我的师傅和所有的朋友，让他们少了一只老鼠去面对那群怪物。][pg]");
         outputText("你看着乔乔羞愧地低下了头。然而，当他再次抬起头时，他的眼中燃烧着火焰。[pg]");
         outputText("[say: 绝不重蹈覆辙……][pg]");
         outputText("你试图安慰乔乔，告诉他作为一只老鼠，他不可能改变什么，但他挥手打断了你。他告诉你他没事，并感谢你的关心。[pg]");
         outputText("你能看出这个故事对他产生了影响，但你惊讶地听到他声音中的决心，并看到他眼中不屈的力量。[pg]");
         talkMenu(jojoTalkFallOfTheMonks);
      }
      
      public function jojoTalkFactory() : void
      {
         clearOutput();
         jojoSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1044,FlagDict_Impl_.arrayReadInt(_loc1_,1044) + 1);
         outputText("你告诉乔乔你成功找到并阻止了恶魔工厂的事。你向他讲述了你是如何发现工厂的位置，以及如何击败里面的恶魔的。他看起来印象深刻。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("听到这个消息，他的耳朵竖了起来，你继续告诉他，你摧毁了工厂的控制系统，永久关闭了工厂——但这也向环境中释放了大量的腐化液体。[pg]");
            outputText("乔乔歪着头，仔细斟酌着他的话语，然后说道：[say: 我想这似乎是正确的做法。永久关闭工厂不仅能给恶魔带来沉重的打击，还能给我们其他人争取时间来收复森林……但我不知道。如果释放的液体真的像你说的那么多，那就有可能弊大于利。我见过腐化对这个世界造成了什么影响，那么多腐化液体一下子涌出来，真的会严重损害我们的事业。我不是说你做错了，也不是在贬低你的成就，但你必须小心。恶魔不仅强大，而且狡猾。][pg]");
            outputText("你听取了这位武僧的建议，尽管他有些担忧，但他似乎真的很高兴听到你对恶魔政权造成了打击。[pg]");
         }
         else
         {
            outputText("听到这个消息，他的耳朵竖了起来，你继续告诉他，为了保护周围的环境，你关闭了工厂并摧毁了控制系统。[pg]");
            outputText("乔乔的胸膛因骄傲而挺起，他用一种全新的眼光看着你，然后说道：[say: 哇，[name]，我不知道该说什么好。我知道这颠覆了你的生活，让你离开了你爱的人，但我真心相信，你穿过那扇传送门的那一天，对整个玛瑞斯来说都是美好的一天。我为你感到骄傲，也很荣幸能称你为我的朋友。]他站起身，给了你一个充满坚定奉献和友好感情的拥抱，然后松开你说道：[say: 不过我们必须盯着那座工厂……绝不能让恶魔重新开放那个邪恶的地方。][pg]");
         }
         talkMenu(jojoTalkFactory);
      }
      
      public function jojoSprite() : void
      {
         if(tentacleJojo())
         {
            spriteSelect(SpriteDb.get_s_jojoTentacle());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_jojo());
         }
      }
      
      public function jojoRape(param1:Boolean = false) : void
      {
         jojoSprite();
         get_player().slimeFeed();
         get_player().removeStatusEffect(StatusEffects.JojoNightWatch);
         get_player().removeStatusEffect(StatusEffects.PureCampJojo);
         if(!get_player().hasStatusEffect(StatusEffects.EverRapedJojo))
         {
            get_player().createStatusEffect(StatusEffects.EverRapedJojo,1,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.EverRapedJojo,1,1);
         }
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311))
         {
            case 0:
            case 1:
               if(!param1 && saveContent.forgiven)
               {
                  jojoPredictsRape();
               }
               else
               {
                  jojosFirstRape(param1);
               }
               return;
            case 2:
               jojosSecondRape();
               break;
            case 3:
               jojosThirdRape();
               break;
            case 4:
               jojosFourthRape();
               break;
            case 5:
               jojosFifthRape();
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function jojoPredictsRape() : void
      {
         clearOutput();
         outputText("你没有太明显地表露你的意图，而是慢慢靠近武僧，但迎接你的是离你[face]只有[if (metric) {centimeters|inches}]的杖尖。");
         outputText("[pg]乔乔的脸上浮现出严厉而悲伤的表情。[say:我本希望能看到你善良的一面，从另一个恶魔手中拯救这个世界。]他重新握紧了法杖，声音因压抑的情感而颤抖。[say:这是我[b:绝不]会让你夺走的美德。]");
         outputText("[pg]武僧以为他能把你身上那堕落的欲望打散，但他无法掩饰自己内心的恐惧——他害怕你这次不会再输了。");
         startCombat(new Jojo());
      }
      
      public function jojoPaysForPerms() : void
      {
         jojoSprite();
         clearOutput();
         outputText("地精林奈特打开门让你进去，挥手示意你往店里走。她闪亮的黑色连衣裙几乎包不住她丰满的臀部和晃动的胸部，她向你打招呼，[say: 欢迎回来，亲爱的！这个小可爱是谁？][pg]");
         outputText("你回答说，你的宠物老鼠乔乔今天会替你付钱。林奈特看起来有些怀疑，但她很快就在老鼠面前跪了下来，决心无论如何都要拿到她的报酬。乔乔前臂长的勃起立刻显现出来。地精主母看到这一幕，发出咕咕的叫声，当她看到你的荡妇老鼠的阴茎上流下前列腺液时，她高兴地哼起了歌。她动作流畅地吞下了粗壮的老鼠阴茎，嘴唇一直滑到根部。[pg]");
         outputText("乔乔呻吟着伸手去抓林奈特的头发，但你用严厉的命令阻止了他。他今天是来为你付钱的，不是来拿奖励的。一双充满欲望的大眼睛从他的下体仰视着他，他浑身发抖，沉甸甸的睾丸因为地精完美的深喉而收缩放松。她伸手去抚摸它们，");
         if(jojoCumQ() >= 4000)
         {
            outputText("当她感觉到它们变得多么沉重和饱满时，发出了一声惊讶的咕噜声。在榨精机上的所有时间显然对乔乔的身体有好处，林奈特很可能会带着老鼠精液的胡须离开。");
         }
         else if(jojoCumQ() >= 1000)
         {
            outputText("当她发现它们的大小时，发出了一声惊讶的咕噜声。显然，所有去榨精机的旅行都给了乔乔一对令人印象深刻的睾丸。");
         }
         else
         {
            outputText("并在她的手指间来回滚动它们，熟练地取悦乔乔。");
         }
         outputText("没过多久，他就达到了忍耐的极限。[pg]");
         outputText("至于林奈特，她的衬衫上有两块湿漉漉的污渍，但她没有理会，而是轻轻地捏了捏老鼠的睾丸。因为那一点额外的刺激，他轻易而猛烈地射精了。地精的喉咙努力吞咽着一切");
         if(jojoCumQ() < 1000)
         {
            outputText("，轻易地吞下了大部分。过了一小会儿，她退了回来，让他把精液射满她的嘴来结束。然后，她把粘稠的精液吐进了一个漏斗里，谁知道漏斗通向哪里。");
         }
         else if(jojoCumQ() < 4000)
         {
            outputText("，尽可能多地吞咽。尽管如此，乔乔射出的精液还是足够多，林奈特的肚子很快就变得更加鼓胀，精液在她的嘴唇边缘起泡。最终她只好放弃并退开，将他瞄准一个漏斗。当他被那样抽干时，她继续抚摸他沾满口水的阴茎，看到收集了这么多精液，地精的笑容变得有些疯狂。");
         }
         else
         {
            outputText("，但她根本无法跟上乔乔惊人的精液产量。两股精液让她的肚子撑到了极限，地精主母迅速退后，眼中带着惊恐的神色，勉强及时将乔乔的喷精器对准漏斗，以便接住下一波喷射。绿皮肤的女孩全神贯注地看着，当她意识到你的宠物能产生多少精液时，她的笑容越来越灿烂。过了好一会儿，他的精液才逐渐减少，但林奈特似乎一点也不介意。");
         }
         outputText("也许她的某个女儿把那根管子的另一端塞进了她的阴道里？[pg]");
         outputText("林奈特喘着气");
         if(jojoCumQ() >= 1000 && jojoCumQ() < 4000)
         {
            outputText("带着微笑");
         }
         else if(jojoCumQ() >= 4000)
         {
            outputText("带着一种茫然、疯狂的微笑");
         }
         outputText("，[say: 今天要点什么？][pg]");
         get_game().mountain.salon.salonPurchaseMenu();
      }
      
      public function jojoNoRape() : void
      {
         var eventNo:Function;
         var _g:JojoScene;
         var _loc1_:* = null as Either;
         var _loc2_:* = null as Encounter;
         var _loc3_:* = null as Either;
         var _loc4_:* = null as Encounter;
         var _loc5_:* = null as Either;
         var _loc6_:* = null as Encounter;
         var _loc7_:* = null as Either;
         clearOutput();
         outputText("乔乔注意到了你的犹豫，扬起眉头表达了关切。[say: [Name]？你还好吗？你看起来心不在焉的。]");
         outputText("[pg]你打消了他的担忧，将这次外出的注意力重新集中在可能潜伏在这个区域的邪恶生物上。武僧点点头，握紧法杖准备应对任何突发情况。在灌木丛和小径上迈出的每一步，都让你心中萦绕的冲动稍微平息了一些。[pg]");
         if(get_player().emptySlot() >= 0)
         {
            _loc1_ = OneOf_Impl_.fromA(get_game().forest.findChitin);
            _loc2_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("chitin",EncounterChance_Impl_.fromFloatConst(0.05),null,_loc1_,null));
            _loc3_ = OneOf_Impl_.fromA(get_game().forest.findHPill);
            _loc4_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("healpill",EncounterChance_Impl_.fromFloatConst(0.1),null,_loc3_,null));
            _loc5_ = OneOf_Impl_.fromA(get_game().forest.findTruffle);
            _loc6_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("truffle",EncounterChance_Impl_.fromFloatConst(0.35),null,_loc5_,null));
            _g = this;
            eventNo = get_camp().returnToCampUseOneHour;
            _loc7_ = OneOf_Impl_.fromA(function():void
            {
               _g.doNext(eventNo);
            });
            Encounters.group("jojo",_loc2_,_loc4_,_loc6_,EncounterOrDef_Impl_.fromDef(new EncounterDef("nothing",EncounterChance_Impl_.fromFloatConst(0.5),null,_loc7_,null))).execEncounter();
         }
         outputText("[pg]虽然你们没有碰巧遇到任何腐化生物，但能和乔乔一起出来走走也是件好事，你甚至开始稍微回忆起以前这里是你们唯一能见面的地方。既然今天没有战斗，你们俩便启程返回营地。武僧思索着你们这一路的安全，猜测道：[say:也许愿意同时对付多个旅行者的生物变少了。]");
         outputText("[pg]回到营地安顿下来，你正准备把乔乔留在他的行李旁，他却叫住了你。[say:[Name]，等一下。]他的目光与你交汇。[say:如果有什么不对劲的地方，你可以跟我说。如果你不想说，冥想在清除心中的疑虑和困境方面，可能比大多数人意识到的更有用。]");
         outputText("[pg]你脑海中闪过一个念头，怀疑他是否看穿了你的计划，但这似乎不太可能。你感谢了这只老鼠的关心，然后[walk]开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function jojoMutationOfferYes() : void
      {
         jojoSprite();
         get_player().addKeyValue("Marae\'s Lethicite",2,1);
         outputText("毫无疑问，这是个绝妙的主意。这可能源于你血液中的腐化，但为什么要抗拒呢？你拿出玛莱的莱希石，抓住其中一个较大的结晶突起。用力一扯，你把它从主晶簇上掰了下来，细小的水晶碎片散落在营地上。还没等你来得及收集，它们就消失在泥土里了。[pg]");
         outputText("不知是运气使然，还是某种无意识的恶魔魔法，这块较小的莱希石看起来相当像阴茎。如果不是那些尖锐的棱角，它看起来就像一根巨大的假阳具，底部还有一对睾丸。你收起那块大的，把注意力集中在这个工具和你对宠物的计划上。[pg]");
         outputText("你舔着那根尖锐的水晶假阳具，用唾液把它涂满。你不确定，但你似乎无法停下来。就好像某种恶魔的力量在引导着你。除了你自己的性唤起，以及品尝这块女神精华时传遍全身的刺痛感之外，你很难把注意力集中在其他事情上。你的思绪飘向了一个变态的幻想，无法应对完全失控和口交的放荡。");
         outputText("[pg]==========================================");
         outputText("[pg]<i>");
         if(get_player().get_gender() <= 1)
         {
            outputText("在你的幻想中，你又在操乔乔了，一次又一次地顶到底，撞击着他那可爱的、像女孩一样的屁股。随着你的每一次抽插，他的阴茎都会喷出老鼠奶，在他身下汇聚成十几个越来越大的水洼，并慢慢融合在一起。他扭动着身体，下巴抵着一对水晶睾丸，同时深喉着一根巨大的假阳具。你又向他那超载的精液垃圾桶里射了一波，迫使一股浓稠的液体从他体内喷出，落入你身下的精液水洼中。[pg]");
            outputText("厌倦了前戏，你从他体内拔出，看着一条精液河从被拔掉塞子的洞口流出。你把他拉起来，看着水晶鸡巴从他嘴里滑出，随着每一寸的拔出，他喉咙上的凸起慢慢消失。他踉跄了一下，完全筋疲力尽，但从他的眼神来看，他依然坚挺且饥渴。[pg]");
            outputText("你把他推倒在一根圆木上，抓住他那沾满唾液的玩具，在精液水洼里拖拽，直到它变得雪白并滴着液体。乔乔呜咽着，他那不成比例的器官夹在双腿之间，因期待而抽搐着。假阳具轻松地滑入他被撑开的洞口，将你剩余的被污染的种子封锁在他的肠道深处，而你的魔法开始改变他……</i>");
            outputText("[pg]==========================================[pg]");
            outputText("你猛地从幻想中惊醒。那块水晶碎片就放在你面前的地上，但它已经不再是碎片了——它是你幻想中的那根假阳具，上面还覆盖着厚厚一层你的精液。你设法把手从你正在变软的器官上移开");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("并拿起那件被污染的神器，现在它已经准备好被使用了。</i>[pg]");
         }
         else
         {
            outputText("在你的幻想中，你正骑在乔乔身上猛烈地抽插，用你的小穴榨取着他肿胀的肉棒");
            if(get_player().biggestLactation() < 2)
            {
               outputText("，同时你的乳房覆盖着他的头，几乎让他窒息");
            }
            else
            {
               outputText("，而他则饥渴地吸吮着你的一个乳房，大口吞咽着你的乳汁");
            }
            outputText("。一根水晶假阳具深深地埋在他的屁股里，由你自己设计的背带固定着，每次他移动时都会扭动它。你再次高潮，享受着这只可怜老鼠绝望而渴求的眼神。你痉挛的小穴立刻被更多的温暖填满，你感觉到浓稠的精液强行挤进你的核心，直到你感到腹部胀满。[pg]");
            outputText("你平复了颤抖的身体，从他身上站起来，用他自己流出的体液浸湿了他。乔乔呻吟着，开始抽动他的肉棒，扭动着臀部，而他的高潮则因为假阳具挤压他的前列腺而延长。你蜷缩在他的耳边，开始向他的脑海中低语，看着你的话语渗透进去，并在水晶肉棒魔力的帮助下开始改变他。</i>");
            outputText("[pg]==========================================[pg]");
            outputText("你猛地从幻想中惊醒。水晶碎片正放在你面前的地上，但它不再是碎片了——它是你幻想中的那根假阳具，现在沾满了淫液。你摸了摸酸痛的小穴，当你意识到它去了哪里时，倒吸了一口凉气。");
            if(get_player().vaginas[0].virgin)
            {
               outputText("（然而不知何故，你的童贞依然完好无损）。");
            }
            outputText("假阳具消失回你的物品栏中，你邪恶地微笑着，期待着下次与乔乔的会面。[pg]");
         }
         outputText("[pg]<b>你简直等不及了！你现在就要把他叫过来……</b>");
         doNext(mutateJojo);
      }
      
      public function jojoMutationOfferNo() : void
      {
         jojoSprite();
         outputText("有些底线连你也不会去触碰。再说，有一只满脑子都是性、长着一英尺长还总是滴着淫液的肉棒的老鼠，就已经够你乐的了。");
         outputText("[pg]决定好之后，你准备呼唤你的荡妇。");
         doNext(corruptJojoSexMenu);
      }
      
      public function jojoMutationOffer() : void
      {
         clearOutput();
         jojoSprite();
         outputText("想到乔乔，你脑海中浮现出一个邪恶的念头。你从湖之女神那里拿走的莱希石——也许可以用来增强你自身初露端倪的恶魔力量，把你这只老鼠性偶扭曲成一个真正合格的宠物？");
         outputText("[pg]<b>你要这么做吗？</b>（警告：仅提供一次，且会解锁触手内容）");
         doYesNo(jojoMutationOfferYes,jojoMutationOfferNo);
      }
      
      public function jojoMilkPay(param1:Boolean = false) : void
      {
         var _loc5_:* = null as Player;
         var _loc6_:* = null as IMap;
         jojoSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,332,4);
         outputText("一声响亮的“叮”声响起，面板上显示");
         var _loc2_:int = 0;
         var _loc3_:int = 500;
         var _loc4_:Number = 0;
         if(get_easyMode())
         {
            _loc3_ *= 2;
         }
         if(get_debug())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,104,0);
            _loc3_ = 9999;
         }
         _loc4_ = jojoCumQ();
         if(param1)
         {
            _loc4_ += 40000 + Utils.rand(1000);
         }
         _loc4_ -= Utils.rand(_loc4_ / 10);
         _loc4_ = Math.round(_loc4_);
         outputText(_loc4_ / 1000 + " 升。");
         if(_loc4_ > 100)
         {
            _loc2_ = 2 + int(_loc4_ / 200) * 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) + _loc2_ >= _loc3_)
         {
            _loc2_ = _loc3_ - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104);
            outputText("它还显示了一个警告：<b>宝石不足以支付全额。宝石现已耗尽。</b>");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) >= _loc3_)
         {
            _loc2_ = 0;
            outputText("它还显示了一个警告：<b>资金已耗尽。</b>");
         }
         if(_loc2_ > 0)
         {
            _loc5_ = get_player();
            _loc5_.set_gems(_loc5_.get_gems() + _loc2_);
            _loc6_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc6_,104,FlagDict_Impl_.arrayReadInt(_loc6_,104) + _loc2_);
            statScreenRefresh();
            _loc6_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc6_,331,FlagDict_Impl_.arrayReadInt(_loc6_,331) + 1);
            if(_loc2_ == 1)
            {
               outputText(Utils.Num2Text(_loc2_) + " 颗宝石滚落到一个收集盘里。惠特尼真的在这上面花了不少心思！你把宝石装进口袋，然后");
            }
            else
            {
               outputText(Utils.Num2Text(_loc2_) + " 颗宝石滚落到一个收集盘里。惠特尼真的在这上面花了不少心思！你把宝石装进口袋，然后");
            }
         }
         else
         {
            outputText("你");
         }
      }
      
      public function jojoLaysEggs() : void
      {
         outputText("[pg]在打发时间的时候，你听到森林方向传来愉悦的咕哝声。你漫步过去查看，发现乔乔弯着腰，屁股朝上。他不停地拉扯着自己的肉棒，射出一串又一串的精液，同时沉甸甸的、沾满蜂蜜的卵从他张开的肛门里滚出来，堆成一堆琥珀色的卵堆。");
         outputText("[pg]你无聊地看着那只老鼠收集滴落的蜂蜜作为润滑剂，涂抹在他的阴茎上，让他那抽搐着、高潮中的肉棒变成了金色。他撸动的速度越来越快，挤压着、抽插着，在淫靡、毫无节制的快感中呻吟。乔乔完全专注于产卵和发泄，或者他只是在从产卵的行为中获得快感。他甚至没有支撑自己的上半身——他只是坐在那里，脸朝下趴在泥土里，产卵、射精，产卵、射精。他的卵上甚至沾满了他浪费的精液，这证明了它们代孕“母亲”的堕落。");
         outputText("[pg]老鼠转过头迎上你的目光，呜咽着，[say:我……我做得好吗？]");
         outputText("[pg]你刚要回答，但这个筋疲力尽的、肛门大开的荡妇瘫倒在一边，开始打呼噜，精疲力竭，滴着白色和黄色的液体。整个事情让你感到有点燥热，但现在除了回营地别无他法。[pg]");
         buttPregnancy.knockUpForce();
      }
      
      public function jojoFollowerMeditate() : void
      {
         var _loc1_:int = 0;
         jojoSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,102) == get_game().time.days)
         {
            outputText("乔乔微笑着和你一起冥想。这种体验令人平静，但这离你上次冥想的时间太近了，你并没有从中得到太多好处。");
            dynStats(DynStat.Lust(-30));
         }
         else
         {
            outputText("鼠僧带你来到一个远离传送门的安静地方，你们俩坐下来，他盘腿而坐，你尽你所能地模仿，背靠背。你闭上眼睛冥想了半个小时，集中你的身心。之后，他指导你进行拉伸和锻炼，以帮助保持你们身体的健康。");
            outputText("[pg]当你完成后，乔乔向你点点头，爬回他的石头上，仍在思考。");
            dynStats(DynStat.Lust(-30));
            _loc1_ = -2;
            if(get_player().cor > 80)
            {
               _loc1_ -= 3;
            }
            else if(get_player().cor > 60)
            {
               _loc1_ -= 2;
            }
            else if(get_player().cor > 40)
            {
               _loc1_--;
            }
            dynStats(DynStat.Cor(_loc1_ - get_player().countCockSocks("alabaster")));
            if(get_player().get_str100() < 45)
            {
               dynStats(DynStat.Str(1));
            }
            if(get_player().get_tou100() < 45)
            {
               dynStats(DynStat.Tou(1));
            }
            if(get_player().get_spe100() < 75)
            {
               dynStats(DynStat.Spe(1));
            }
            if(get_player().get_inte100() < 80)
            {
               dynStats(DynStat.Inte(1));
            }
            if(get_player().get_lib100() > 0)
            {
               dynStats(DynStat.Lib(-1));
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,102,get_game().time.days);
            get_player().addStatusValue(StatusEffects.JojoMeditationCount,1,1);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function jojoFollower() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.PureCampJojo))
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) == 0;
         }
         return false;
      }
      
      public function jojoEncounterFn() : void
      {
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,0);
         }
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 0)
         {
            if(get_player().cor < 25)
            {
               lowCorruptionJojoEncounter();
            }
            else
            {
               highCorruptionJojoEncounter();
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 2)
         {
            corruptJojoEncounter();
         }
         else
         {
            repeatJojoEncounter();
         }
      }
      
      public function jojoDefenseToggle() : void
      {
         jojoSprite();
         clearOutput();
         if(get_camp().isGuard("Jojo"))
         {
            get_player().removeStatusEffect(StatusEffects.JojoNightWatch);
            outputText("你告诉乔乔，你不再需要他晚上守夜了。他点点头，然后说道。[say: 好的。如果你还需要我的帮助，请告诉我。]");
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.JojoNightWatch,0,0,0,0);
            outputText("你问这位武僧是否可以在晚上为你守卫营地。他礼貌地微笑着。[say: 当然，[name]。]");
         }
         doNext(jojoCamp);
      }
      
      public function jojoCumQ() : Number
      {
         var _loc1_:Number = 0;
         _loc1_ = 400;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) < 4)
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) * 200;
         }
         else
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) * 100;
         }
         if(tentacleJojo())
         {
            _loc1_ += 500 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) * 100;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2187) < 10)
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2187) * 50;
         }
         else
         {
            _loc1_ += 500;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) < 10)
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) * 25;
         }
         else
         {
            _loc1_ += 250;
         }
         return _loc1_;
      }
      
      public function jojoCampMenu() : void
      {
         var _g1:Camp;
         var _g:JojoScene;
         if(get_camp().isGuard("Jojo"))
         {
            outputText("（乔乔目前正在夜间守夜，防范敌人。）[pg]");
         }
         unlockCodexEntry(2740);
         menu();
         addButton(0,"外貌",jojoAppearance).hint("查看乔乔的外貌。");
         _g = this;
         addButton(1,"交流",function():void
         {
            _g.talkMenu();
         }).hint("和他讨论一些话题。");
         addButton(2,"冥想",jojoFollowerMeditate);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1046) == 1)
         {
            addButton(3,"训练",apparentlyJojoDOESlift).hint("和他一起训练。");
         }
         addButton(4,get_camp().isGuard("Jojo") ? "停止守卫" : "守卫营地",jojoDefenseToggle).hint(get_camp().isGuard("Jojo") ? "让他停止守卫营地。" : "让他晚上守卫营地。");
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 1)
         {
            addButton(5,"净化",wormRemoval).hint("请求他清除你体内的虫子。");
         }
         if(get_player().isCorruptEnough(10) && get_player().get_lust() >= 33 && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2136) <= 0)
         {
            addRowButton(2,"强暴",jojoAtCampRape).hint("强暴这个可怜的僧侣鼠人。" + (get_player().cor < 25 ? " 你为什么要这么做？" : ""));
         }
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDJO) == 0)
         {
            addRowButton(2,"藤蔓",get_game().swamp.alrauneScene.askJojo).hint("知道怎么解决这个问题吗？");
         }
         _g1 = get_camp();
         addButton(14,"离开",function():void
         {
            _g1.campFollowers();
         });
      }
      
      public function jojoCamp() : void
      {
         clearOutput();
         jojoSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,74) == 0 && get_amilyScene().amilyFollowerPure())
         {
            get_game().followerInteractions.amilyMeetsPureJojo();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,84) == 1 && Utils.rand(2) == 0)
         {
            get_game().followerInteractions.catchRathazulNapping();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 1)
         {
            outputText("当你走近这位宁静的武僧时，你看到他的鼻子抽动了一下。[pg]");
            outputText("[say: 看来腐化的爪牙已经在你身体这座神殿里安家了，] 乔乔平静地说，[say: 这是一个非常不幸的进展。不过没有理由绝望，因为总有办法对抗腐化。然而，对抗这种形式的腐化需要付出巨大的努力，并且可能会对你产生持久的影响。如果你准备好了，我们可以清除你体内那些失控的欲望生物。][pg]");
            jojoCampMenu();
            return;
         }
         if(get_player().cor > 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,102) != get_game().time.days)
         {
            if(get_player().cor >= 40)
            {
               outputText("你走向乔乔平时坐的那块巨石，刚一靠近，乔乔就急切地迎了上来。[say: 玛莱啊！[name]，我们必须做点什么！我感觉到腐化像浓雾一样包围着你。我们需要冥想，否则我就要失去你了！] 乔乔恳求道。[pg]");
            }
            else
            {
               outputText("你走到乔乔平时坐的那块巨石前，看到他闭着眼睛盘腿坐着。他似乎正在深度冥想中，但当你靠近时，他突然睁开眼睛，站起身来，显得有些苦恼，[say: 呃……[name]，我能感觉到你体内有一点腐化。虽然不多，但我认为你应该在它失控、让你做出后悔的事情之前重视它。如果你愿意，我很乐意和你一起冥想，帮你清除它，] 他带着关切的神情提议道。[pg]");
            }
            outputText("你接受乔乔的帮助吗？[pg]");
            menu();
            addButton(0,"是",acceptOfferOfHelp);
            addButton(1,"否",refuseOfferOfHelp);
            if(get_player().get_lust() >= 33 && !get_player().isGenderless() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 0)
            {
               addButton(4,"强暴",jojoAtCampRape);
            }
         }
         else
         {
            if(get_player().cor > 10)
            {
               outputText("你走到乔乔平时坐的那块巨石前，看到他闭着眼睛盘腿坐着" + (get_akky().location == "乔乔" ? "，[akky]蜷缩在他的腿上" : "") + "。他似乎正在深度冥想中，但当你靠近时，他突然睁开眼睛，站起身来，显得有些苦恼，[say: 呃……[name]，" + (get_player().cor >= 40 ? "我感觉到腐化像浓雾一样包围着你。我们需要更多地冥想，否则我就要失去你了！" : "我仍然能感觉到你体内有一点腐化。虽然不多，但我认为你应该在它失控、让你做出后悔的事情之前重视它。") + " 如果你愿意，我很乐意和你一起冥想，帮你清除它，] 他带着关切的神情提议道。[pg]");
            }
            else
            {
               switch(Utils.rand(3))
               {
                  case 0:
                     outputText("你走向乔乔平时坐的那块巨石，看到他闭着眼睛盘腿坐着" + (get_akky().location == "乔乔" ? "，他的腿上睡着[akky]" : "") + "。起初他似乎正在深度冥想，但当你靠近时，他的嘴角泛起一丝微笑；他站起身，睁开眼睛，用欢迎的神情看着你。[say: 你好，[name]，有什么我可以帮你的吗？][pg]");
                     break;
                  case 1:
                     outputText("你走到乔乔平时坐的那块巨石前，发现他在巨石后面几步远的地方。他正站着练习招式，优雅地从一个姿势转换到另一个姿势。当你靠近他时，你看到他的耳朵明显竖了起来，他没有停下动作，转头对你说：[say: 你好，[name]，有什么我可以帮你的吗？][pg]");
                     break;
                  default:
                     outputText("你发现乔乔盘腿坐在一块平坦的岩石上，他的法杖靠在肩膀上，正在思考。他看向你，点了点头，[say: 你好，[name]。有什么我可以帮你的吗？][pg]");
               }
            }
            jojoCampMenu();
         }
      }
      
      public function jojoAtCampRape() : void
      {
         var _g:JojoScene;
         jojoSprite();
         clearOutput();
         outputText("你向乔乔提议，你们俩一起去树林里狩猎，清理掉一些被腐化的生物，他很痛快地答应了。你带着他一起向森林出发。");
         outputText("[pg][say:采取积极主动的方式让这个世界变得更安全，感觉真好，]他心情不错地说道。[say:不过，也许你叫我一起去是因为你觉得快憋疯了？在相对安全的营地里有伴固然好，但也会让人觉得受限。]");
         outputText("[pg]你觉得，受限只是一种说法，因为开阔的地形会给他太多周旋和逃跑的空间。森林的隐蔽性和幽闭环境更能限制他的选择。他似乎还没有察觉到什么。你停顿了片刻，心想：如果你真的这么做了，可能就无法回头了。");
         menu();
         _g = this;
         addNextButton("强暴",function():void
         {
            _g.jojoRape();
         }).hint("“虔诚与纯洁”这套已经过时了。");
         addNextButton("算了",jojoNoRape).hint("你还没准备好这样破坏你们的友谊。");
      }
      
      public function jojoAppearance() : void
      {
         clearOutput();
         jojoSprite();
         get_images().showImage("jojo-appearance");
         outputText("乔乔是一个白[if (nofur) {发|毛}]鼠[if (nofur) {男孩|人}]，身高" + (get_player().get_tallness() > 45 && get_player().get_tallness() < 51 ? "和你差不多，" : "") + "[if (tallness > 54) {仅仅}][if (metric) {121厘米|四英尺}]。他那像碟子一样的大耳朵和粗壮的粉色尾巴立刻暴露了他的种族血统，更不用说他那小小的[if (nofur) {纽扣鼻|，长在像啮齿动物一样的口鼻部顶端的粉色鼻子}]了。他的脸庞白皙，没有任何瑕疵，加上他身上雪白的[if (nofur) {皮肤|皮毛}]，只有他那棕色的眼睛才能将他与白化病患者区分开来。");
         outputText("[pg]尽管乔乔长着一张娃娃脸，但由于多年作为僧侣的修行，他的身体精瘦而结实。掩盖他结实身材的是一件淡蓝色的长袍，用布腰带系着，还有一条有点宽松的裤子，刚好到他的[if (nofur) {脚|像老鼠一样的爪子}]上方，这些衣服既合身又足够宽松，让他可以自由活动。他的其他装备包括脖子上的念珠和一根抛光的木制法杖，目前放在他的铺盖卷旁。");
         outputText("[pg][if (silly) {他的[i:其他]装备|乔乔的性器官}]仍然被隐藏着，他不太可能炫耀它。");
         doNext(jojoCamp);
      }
      
      public function isJojoCorrupted() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 6;
      }
      
      public function highCorruptionJojoEncounter() : void
      {
         var _g:JojoScene;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,1);
         jojoSprite();
         outputText("当你惊叹于森林中奇怪的树木和植被时，灌木丛发出了不祥的沙沙声。一处灌木丛似乎突然炸开，卷起一阵飞舞的树叶和动静。你还没来得及反应，就感觉你的[feet]被扫倒，重重地仰面摔在地上。[pg]");
         outputText("一只轻盈的白老鼠带着愤怒的面容，疑惑地俯视着你倒在地上的身体。");
         outputText("[pg][say:抱歉，我感觉到了一股强大的腐化气息，还以为是恶魔或怪物闯进了我的森林，]那只老鼠说道，[say:哦，我真是太失礼了！][pg]他把你扶起来，自我介绍说他叫乔乔。现在你仔细打量他，很明显这只老鼠是个僧侣，穿着长袍，佩戴着神圣的符号，还挂着念珠。[pg]他会意地笑了笑，[say:是的，我是个僧侣，而且对于我这样的人来说，这确实是个奇怪的地方……这个世界并不总是这样。很久以前，这个世界有许多村庄，包括我自己的村庄。但后来恶魔来了。我不确定它们是被召唤出来的、被创造出来的，还是仅仅是魔法或繁衍的扭曲产物，但它们从山里蜂拥而出，摧毁了沿途的一切。]");
         outputText("[pg]乔乔悲伤地叹了口气，[say:不说我的悲惨遭遇了。你被腐化得很深。如果你不能得到充分的净化，你迟早也会变成它们中的一员。你愿意让我帮你吗？]");
         unlockCodexEntry(2740);
         menu();
         addButton(0,"接受",meditateInForest);
         addButton(1,"拒绝",get_camp().returnToCampUseOneHour);
         if(get_player().isCorruptEnough(10) && get_player().get_lust() >= 33 && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2136) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 0)
         {
            _g = this;
            addButton(2,"强暴",function():void
            {
               _g.jojoRape();
            }).hint("强暴这只可怜的鼠人僧侣。" + (get_player().cor < 50 ? "你为什么要这么做？" : ""));
         }
      }
      
      public function harvestJojoDraft() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你告诉乔乔，你希望他一有机会就接上榨精机；你需要他的体液。");
         outputText("[pg][say: 这、这就是你想让我来这里的原因？为了……收集我的体液？] 乔乔张大嘴巴，对这种可怕的想法感到震惊，尽管他的肉棒却无可奈何地因为这个想法而勃起。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1094) == 0)
         {
            outputText("[pg][say: 对、对不起 [master]，但这里没有可以用来做那件事的设备。去跟惠特尼女主人谈谈，也许她能让人造一个。]");
         }
         else
         {
            outputText("[pg][say: 如您所愿，[master]，] 他低声说道。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1094) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1098,1);
         }
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function giveBirthToPureJojoBabies() : void
      {
         var _loc1_:* = null as IMap;
         outputText("当它们强行撑开你的子宫颈时，一阵剧痛传遍全身，让你不由自主地大叫起来。乔乔跑到你身边说：[say: 我感觉到有事情发生，是时候了吗？]你尖叫道：[say: 不，我只是喜欢痛苦地尖叫。是的，是时候了！]你紧紧抓住地面，喘着粗气，随着分娩的阵痛淹没你，你用力推挤。乔乔紧紧握住你的手，似乎在祈祷着什么。在疼痛把你拉回现实之前，你从祈祷中感到了一丝安慰。你感觉到你的臀部被顺着产道移动的生物群强行撑宽。你张开双腿，仰起头，痛苦地呻吟和哭喊着，第一个孩子移出你的子宫，穿过你的子宫颈，向下进入你的小穴。你的嘴唇微张，伴随着一声闷哼，你把第一个孩子排到了乔乔等待的手中。乔乔看着它，仿佛它是他见过的最美丽的东西。他把它举起来，让你能看到你的长子；那是一只小老鼠，有着大大的无辜的眼睛，更大的耳朵，一个可爱的、抽动着的鼻子，还有一条细长的粉红色尾巴。乔乔帮你把它抱到你的[chest]上，它急切地含住你的[nipples]开始吸吮。当它喝奶时，它开始长得更大" + (get_noFur() ? "" : "，和你的头发颜色一样的毛发开始覆盖它的身体") + "。它很快就喝饱了，然后松开嘴，它的父亲把它放在一边，这很好，因为这个时候还有另一个婴儿在等着轮到它……还有一个……还有一个……[pg]");
         outputText("很快，你又恢复了原来的样子，疲惫地躺着，乔乔坐在旁边，你那群喧闹的后代已经开始在你周围走动和玩耍了。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2189) == 0)
            {
               outputText("艾米莉跑到你身边大喊：[say: 发生什么事了，你为什么尖叫？]然后敬畏地看着这窝老鼠说：[say: [name]，那些不是我的……它们是谁的？]乔乔咬着嘴唇说：[say: 它们是我的。]艾米莉只是盯着乔乔看了一秒钟。乔乔试图安抚她：[say: 我……我只是想帮[name]，然后就发生了，而且……]他停了下来，艾米莉开始笑了起来。[say: 自从我们还是小老鼠以来，我还没见过你这么担心过……我没意见。我很高兴你找到了像[name]这么棒的人。如果你愿意，我可以把这些孩子带到我的孩子们建立的一个秘密定居点。]乔乔对艾米莉没有生气感到惊讶，但很快喜悦就爬上了他的脸庞。[say: 谢谢你，艾米莉。我们一直担心该把他们送到哪里，你解决了我们所有的问题。谢谢你。]艾米莉笑着说：[say: 这是我至少能做的。][pg]");
               outputText("筋疲力尽的你开始陷入沉睡。当你闭上眼睛时，你瞥见艾米莉把你的孩子们带走了。[pg]");
            }
            else
            {
               outputText("很快，你又恢复了原来的样子，疲惫地躺着，乔乔坐在旁边，你那群喧闹的后代已经开始在你周围走动和玩耍了。[pg]");
               outputText("当你躺下休息时，你注意到你和乔乔以及艾米莉生的一些孩子过来了，带走了刚出生的宝宝。他们过来打招呼并叙旧。天色渐晚，他们不得不道别离开。你看着他们离去，心中隐隐有些担忧。你的孩子们还这么小，他们会没事吗？乔乔似乎察觉到了你的情绪，握紧你的手安慰你。你抬头看着他，缓缓点头。他们会没事的；毕竟，他们是你的孩子。[pg]");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2189,FlagDict_Impl_.arrayReadInt(_loc1_,2189) + 1);
         }
         else
         {
            outputText("[say: 看看他们。你……当我的村庄被毁时，我从未想过自己还能有孩子，但你让这一切成真了。谢谢你，] 乔乔真诚地对你说。你问他打算怎么抚养他们。乔乔若有所思地皱起眉头，说道：[say: 嗯，你说得对……我们不能在这里抚养他们……我知道一个可以送他们去的地方。那里没有腐化，在我们找到更好的安排之前，那里应该可以。] 尽管送走孩子们让你很难过，但你同意乔乔的看法；这是最好的选择。你太累了，无法长时间睁开眼睛，但他答应会照看他们，就在你入睡时，他正抱起你的孩子们带他们离开。[pg]");
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2186,FlagDict_Impl_.arrayReadInt(_loc1_,2186) + 1);
      }
      
      public function get_jojoForest() : Encounter
      {
         var _gthis:JojoScene;
         var _loc1_:* = null as Either;
         _gthis = this;
         if(_jojoForest == null)
         {
            _loc1_ = OneOf_Impl_.fromA(jojoEncounterFn);
            _jojoForest = Encounters.build(new EncounterDef("jojo",function():Number
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) >= 2)
               {
                  return _gthis.get_game().commonEncounters.furriteMod();
               }
               return 1;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !(_gthis.jojoFollower() || _gthis.get_camp().campCorruptJojo() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) > 0 || _gthis.get_player().level < 4 && _gthis.get_player().cor < 25 && _gthis.get_time().days < 28);
            }),_loc1_,null));
         }
         return _jojoForest;
      }
      
      public function get_debugName() : String
      {
         return "乔乔";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getVagFuckedByMouse() : void
      {
         var _loc1_:Boolean = get_player().looseness(true) == 0;
         jojoSprite();
         clearOutput();
         outputText("你终于下定决心；你想要他的老鼠肉棒插进你的[vagina]里。" + get_player().clothedOrNaked("你脱下你的[armor]并且") + "乔乔" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) < 4 ? "犹豫地" : "") + "脱下他的长袍，露出赤裸的身体。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2188) == 0)
         {
            outputText("[pg]你看到乔乔有些不自在，于是你向后靠在腿上，拉开你[vagina]的阴唇，向他展示你湿润、火热的内部。乔乔惊得下巴都掉下来了，他的肉棒完全勃起。你逗弄乔乔，告诉他快点，不然你就去找些小恶魔了。乔乔猛地闭上嘴巴，说道：[say: 不。我答应过帮你解决欲望，这样你就能避开腐化的生物了。只是……嗯，这是我第一次。]你很惊讶，毕竟在玛瑞斯这样的地方，保持童贞几乎是不可能的。你告诉他，如果他把童贞交给你，你会感到很荣幸。乔乔看着你，过了一秒钟，点了点头。[say: 你是我唯一能信任的人……我现在准备好了。]");
            outputText("[pg]乔乔在你[vagina]的入口处犹豫了一下，突然一下把他的肉棒深深地插进了你的体内。");
            get_player().cuntChange(get_monster().biggestCockArea(),true);
            outputText("被他的突然举动吓了一跳，你紧紧地收缩肌肉，以至于乔乔的肉棒卡在了你体内。乔乔在痛苦和快感中嚎叫起来。你责骂乔乔的鲁莽行为，但心里却很高兴他采取了主动。你指导乔乔开始时慢一点，然后随着时间的推移加快速度。乔乔点点头，紧张地笑了笑。你说别担心，你会引导他的。");
            outputText("[pg]你放松下来，让乔乔温柔地按照他的节奏来。他勃起的肉棒顺畅地在你的[vagina]里进进出出。到目前为止，一切顺利。乔乔开始加快节奏。你无法阻止狂喜的呻吟从嘴里溢出，这似乎鼓励了乔乔更加卖力。他开始猛烈撞击你的子宫颈，仿佛想要入侵你的子宫。你不再试图克制，放声尖叫出快感。乔乔的体力似乎快到极限了，因为他开始慢下来。他大喊：[say: 我要射了！]你把双腿勾在乔乔的背后，把他锁在原位。乔乔的肉棒紧贴着你子宫的入口。当乔乔射精时，他射精的力量穿透了你的子宫，把它塞满了滚烫的老鼠精液。" + (jojoCumQ() >= 750 ? "他的高潮似乎永无止境，他继续填塞着你的子宫。" + (jojoCumQ() >= 900 ? "过多的老鼠精液从你的[pussy]里溢出。天哪，太激烈了！" : "") : ""));
            outputText("[pg]你同时达到了高潮，把女孩的淫液喷了乔乔一身" + (get_player().hasCock() ? "；[eachCock]释放出一阵精液雨，浸湿了你的肚子和大腿" : "") + "。四肢失去力量，你松开了乔乔。乔乔倒在草地上，喘着粗气。[say: 那真是……那真是太棒了……我们还会再来一次的，对吧？]你对他笑了笑，点点头，私下里想，如果他还是个处男就这么厉害，等你调教完他，他会有多棒。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2188) == 1)
         {
            outputText("[pg]你看到乔乔还是有点不自在，于是你向后靠在腿上，拉开你[vagina]的阴唇，向他展示你湿润、火热的内部。乔乔的肉棒完全勃起了。只犹豫了一下，他就在你面前摆好了姿势。你对乔乔的成长印象深刻。很快他就能毫不犹豫地操你了。当你还在思考乔乔的变化时，他已经低下头，开始用他温暖柔软的舌头舔你的[clit]。你颤抖着，几乎被带到了高潮的边缘。");
            outputText("[pg]你尴尬地问他是在哪里学到这些的。他回答说：[say: 我听说过一种叫前戏的东西。显然，我必须先让你足够湿润，然后才能插进去，否则会弄疼你的。]你印象深刻，放松下来，让他继续服侍。过了一会儿，乔乔说：[say: 我觉得现在够湿了，所以这次应该不会痛了。]说完，他一下就插进了你的[vagina]。");
            get_player().cuntChange(get_monster().biggestCockArea(),true);
            outputText("[pg]乔乔开始时很慢，摇晃着臀部，尽可能地模仿你。很难想象他不久前还是个处男。渐渐地，他加快了速度，越来越深地进入你。你无法阻止狂喜的呻吟从嘴里溢出，这似乎鼓励了乔乔更加卖力。他开始猛烈撞击你的子宫颈，仿佛想要撞破你的子宫。你不再试图克制，放声尖叫出快感。乔乔的体力似乎快到极限了，因为他开始慢下来。他大喊：[say: 我要射了！]你把双腿勾在乔乔的背后，把他锁在原位。乔乔的肉棒紧贴着你子宫的入口。当乔乔射精时，他射精的力量穿透了你的子宫，把它塞满了滚烫的老鼠精液。" + (jojoCumQ() >= 750 ? "他的高潮似乎永无止境，他继续填塞着你的子宫。" + (jojoCumQ() >= 900 ? "过多的老鼠精液从你的[pussy]里溢出。天哪，太激烈了！" : "") : ""));
            outputText("[pg]你同时达到了高潮，把女孩的淫液喷了乔乔一身" + (get_player().hasCock() ? "；[eachCock]释放出一阵精液雨，浸湿了你的肚子和大腿" : "") + "。四肢失去力量，你松开了乔乔。乔乔倒在草地上，喘着粗气。[say: 我做得怎么样？]你对他笑了笑，说如果他一直这样操你，你可能就能完全避开小恶魔了。他笑了，显然很高兴听到这话。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2188) >= 2)
         {
            outputText("[pg]现在没必要再挑逗他了；乔乔的肉棒已经完全勃起了。他毫不犹豫地在你面前摆好了姿势。你对乔乔的成长印象深刻。当你还在思考乔乔的变化时，他已经低下头，开始用他温暖柔软的舌头舔你的[clit]。你颤抖着，几乎被带到了高潮的边缘。乔乔已经很擅长用他的舌头了。你得小心点，否则你会在他之前高潮的。过了一会儿，乔乔把手伸进你的[vagina]，发现它足够湿润了，说：[say: 我现在要插进去了，]然后一下就插进了你的小穴。");
            get_player().cuntChange(get_monster().biggestCockArea(),true);
            outputText("[pg]乔乔开始时很慢，摇晃着臀部，尽可能地模仿你。很难想象他不久前还是个处男。渐渐地，他加快了速度，越来越深地进入你。你无法阻止狂喜的呻吟从嘴里溢出，这似乎鼓励了乔乔更加卖力。他开始猛烈撞击你的子宫颈，仿佛想要把它撞开。你不再试图克制，放声尖叫出快感。乔乔只是不停地捣弄你，就像发情了一样。他那点可怜的体力已经耗尽了；他现在就是一台做爱机器。就在你快要高潮的时候，他大喊：[say: 我要射了！]你把双腿勾在乔乔的背后，把他锁在原位。乔乔的肉棒紧贴着你子宫的入口。当乔乔射精时，他射精的力量穿透了你的子宫，把它塞满了滚烫的老鼠精液。");
            outputText("[pg]你同时达到了高潮，把女孩的淫液喷了乔乔一身" + (get_player().hasCock() ? "；[eachCock]释放出一阵精液雨，浸湿了你的肚子和大腿" : "") + "。四肢失去力量，你松开了乔乔。乔乔倒在草地上，喘着粗气。[say: 我等不及想再来一次了。]你笑着逗他说，这本来是为了满足你的欲望，而不是他的。乔乔脸红了。你微笑着告诉他，你随时都愿意让他操你。他笑了，显然很高兴听到这话。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) >= 4 ? "你给了乔乔一个缠绵的吻。" : ""));
         }
         outputText("[pg]恢复过来后，" + get_player().clothedOrNaked("你们俩重新穿好衣服，","乔乔重新穿好衣服，你们俩") + "回到了营地。");
         dynStats(DynStat.Sens(1),DynStat.Cor(-1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2188,FlagDict_Impl_.arrayReadInt(_loc2_,2188) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2184,FlagDict_Impl_.arrayReadInt(_loc2_,2184) + 1);
         get_player().knockUp(29,432,int(jojoCumQ() < 2000 ? int(100 - jojoCumQ() / 50) : 60));
         get_player().orgasm("Vaginal");
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getAnallyFuckedByMouseYouSlut() : void
      {
         var _loc1_:Boolean = get_player().looseness(false) == 0;
         jojoSprite();
         clearOutput();
         outputText("你终于下定决心；你想要他的老鼠肉棒插进你的[ass]。" + get_player().clothedOrNaked("你脱下你的[armor]，") + "乔乔" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) < 4 ? "犹豫地" : "") + "脱下他的长袍，露出了赤裸的身体。");
         outputText("[pg][say:四肢着地趴下，我就可以开始了，]乔乔指示道。你点点头，四肢着地趴下，把你的[butt]对着乔乔。他的肉棒完全勃起。[say:我得先把它润滑一下，]乔乔说。他往手上吐了口唾沫，将口水均匀地涂抹在他的肉棒上。");
         outputText("[pg]乔乔轻轻地按摩你的[butt]，向你保证他会很温柔的。[say:我来了，]乔乔宣布着，慢慢地将他的肉棒滑入你的[ass]。");
         get_player().buttChange(get_monster().biggestCockArea(),true);
         if(_loc1_)
         {
            outputText("[say:真紧；我要好好享受你这紧致的感觉，趁它还在，]乔乔评论道。");
         }
         else if(get_player().looseness(false) < 2)
         {
            outputText("[say:真紧，]乔乔说。");
         }
         else
         {
            outputText("[say:真舒服，]乔乔评论道。");
         }
         outputText("慢慢地，他开始前后摇摆臀部，把手放在你的[hips]上作为支撑。");
         outputText("[pg][say:感觉好吗，[name]？]乔乔问。你回答说你希望他能再快一点。为了取悦你，乔乔开始将他勃起的肉棒插得比以前更深更快。当他的阴茎掏空你的内脏时，你开始在快感中呻吟。");
         outputText("[pg]随着紧张感的建立，乔乔抽插得越来越快。不想让他被冷落，你开始跟着他的节奏移动，将他的肉棒吞没至根部。乔乔呻吟得更大声了，喊道：[say:我要射了！]乔乔最后一次猛烈地撞击你，用尽全力顶到了你的前列腺。他开始将他大量的精液注入你体内" + (jojoCumQ() >= 750 ? "，填满你的肠道" + (jojoCumQ() >= 1000 ? "并撑起你的肚子" : "") : "") + "。伴随着一阵剧烈的颤抖，你高潮了，你的[asshole]紧紧地夹住他的阴茎，试图榨干它所有美味的精液。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]因快感而抽搐，在你身下的地面上浸出了一小滩精液。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[pussy]不由自主地" + (get_player().averageVaginalWetness() >= 4 ? "喷出" : "漏出") + "汁液，洒满了一地。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("你的身体因狂喜而摇摆。");
         }
         outputText("[pg]他的肉棒伴随着“啵”的一声从你的[ass]里滑了出来。精液开始从你的[ass]里滴落。[say:那真是……你太棒了，[name]。]你一边揉着鼓胀的肚子一边对他微笑，告诉他他自己也不赖。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) >= 4 ? "你给了乔乔一个缠绵的吻。" : ""));
         outputText("[pg]休息了好一会儿后，" + get_player().clothedOrNaked("你们俩重新穿好衣服，","乔乔重新穿好衣服，你们俩") + "回到了营地。");
         dynStats(DynStat.Sens(1),DynStat.Cor(-1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2190,FlagDict_Impl_.arrayReadInt(_loc2_,2190) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2184,FlagDict_Impl_.arrayReadInt(_loc2_,2184) + 1);
         get_player().orgasm("Anal");
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fillJojosMouthWithHotStickyCum() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你指着乔乔命令道，[say: 张大嘴巴。]这位前僧侣高兴地张大了他的" + (get_noFur() ? "嘴巴" : "口鼻") + "，张得那么大，以至于他的龅牙几乎消失在了上颚。艾米莉看起来有些失望，但随后她通过[if (hasBalls) {俯下身贪婪地吸吮你肿胀的睾丸，同时}]拉扯你的肉棒，从根部到顶端用力、快速地套弄来安慰自己。乔乔的舌头伸出来，舔舐着你[cock biggest]上渗出的先锋汁，它在另一个荡妇的紧握中强有力地跳动着。当你感觉到高潮即将来临时，一股暖流涌遍了你的下半身。");
         outputText("[pg]当[eachCock]喷射出它的存货时，一阵极乐的爆炸在你的脑海中燃烧。浓稠的、压抑已久的精液从你的马眼中喷涌而出，用蜂蜜般浓稠的奶油填满了乔乔的嘴巴，并溅到了他的鼻子和头发上。当他的嘴里充满了你那麝香般的精液时，他发出咯咯的声音，并把嘴张得更大，敏锐地试图用他那沾满精液的脸接住尽可能多的种子，然后他咕噜一声把它吞了下去。[if (cumQuantity < 500) { 你一次又一次地排出你那雪白的漆液，把你那已经很苍白的" + (get_noFur() ? "皮肤" : "皮毛") + "刷得雪白，直到他的脸看起来就像一个闪闪发光的面具，滴着你那沸腾的药膏。受你的意志束缚，他耐心地等待着你允许他吞咽，他那被安抚的嘴巴装得满满的，从两侧漏出两道象牙色的瀑布。你简短地点了点头，被驯服的鼠男孩高兴地服从了，品尝着你那压倒性的精液滚落喉咙时令人谦卑的咸味。| 你一次又一次地喷射，把沉重的粘液绳索溅满他的脸" + (get_noFur() ? "" : "和皮毛") + "。他的嘴里被精液淹没了，装得太满了，给这位被征服的僧侣涂上了一层厚厚的精液釉，很快就让他的身体闪烁着油腻的光泽。}][if (cumQuantity >= 1000) { 他吞咽着，额头上挨了一记精液的冲击，然后再次张开嘴，给了你另一个瞄准的洞。你的雄性种子的另一次喷发冲过他的嘴唇，用你那象牙色的液体涂满了他的喉咙后部，几乎淹没了他，因为精液柱涌入他的气管和鼻孔，从他的鼻子里涌出。被驯化的老鼠绝望地吞咽着你粘稠的激情，而你喷泉般的精液在空中划出一道弧线，把大团大团的精液倾倒在他颤抖的身体上。}] 你完事了，把你的[cock biggest]塞进他的喉咙里清理。乔乔高兴地照办了。");
         outputText("[pg]当你的一个老鼠玩具在擦亮你的肉棒时，另一个正在自慰并喘息着。[say: 求你了，[master]，我能……我能要点精液吗？我能……我能把他舔干净吗？他太……]她吸了一口气，可怕地呻吟着，[say: ……脏了。]当你把被口水擦亮的肉棒从乔乔的嘴里抽出来时，你同意了她的请求，不在乎他们俩怎么发泄，只要你的后宫训练有素且心甘情愿就行。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fillAmilysMouth() : void
      {
         get_amilyScene().amilySprite();
         clearOutput();
         outputText("你让艾米莉张大嘴巴，她高兴地把你的[cock biggest]从乔乔那里拽了过来。他可怜巴巴地呜咽着，但作为奴仆，这个老鼠男孩");
         if(get_player().balls > 0)
         {
            outputText("俯下身拼命地吸吮你的[sack]，顺从地膜拜你肿胀的睾丸，一个接一个地品尝着里面的液体；他用舌头舔舐、吸吮，并在你那充满精液的美味阴囊上呻吟。");
         }
         else
         {
            outputText("俯下身贪婪地吸吮着你肉棒的底部，每当艾米莉给他机会时，他都会用舌头慵懒地舔舐。");
         }
         outputText("艾米莉抬头看着你，她那可爱的、如同魅魔般的角在光线下闪闪发光，她发出满足的呼噜声，[say:求求你，[master]，给这个荡妇的喉咙灌满浓稠的精液吧。用你黏糊糊的精液填满你这个色情狂的嘴巴，把剩下的精液溅在她那张淫荡的脸上。]");
         outputText("[pg]小鼠娘那因药物而肿胀的嘴唇张成了一个“O”形，然后开心地吞下了你大部分紧绷的阴茎，在根部留出空间让她的手和乔乔的舌头发挥作用。她又快又猛地套弄着你，你感觉到内部肌肉那标志性的抽搐，预示着你即将到来的高潮。当快感压倒了你的控制时，你的[hips]痉挛性地抽动着，但艾米莉像个专业人士一样坚持着。当你的尿道充满精液时，她又用她那湿热的小舌头沿着你阴茎的下侧滑动，在一个爆炸性的时刻，你将浓稠的精液猛烈地射入这个饥渴的瘾君子的喉咙里。你看到她气喘吁吁地吞咽着[if (cumQuantity >= 250) {大部分|全部}]精液。你为她射了又射，用你喷涌而出的精液填满她那毫无价值的喉咙，即使她（在乔乔的帮助下）尽力把你榨干，你也在不断地释放。[if (cumQuantity >= 500) { 没过多久，她的肚子就因为吞下了所有的精液而变得圆滚滚的，在她轻盈的身躯上可以看到一个快乐的小凸起。}][if (cumQuantity >= 1000) { 她太饱了，喝不下了，她发出一声充满热情的喘息，松开了你的[cock biggest]，并高兴地让下一股精液直接射在她的脸上和头发上。巨大的精液团浸透了她热情的面容，精液如瀑布般慵懒地流向地面。}][if (cumQuantity >= 3000) { 你不断地用越来越多的精液喷射她，直到她被精液完全染白，并欣快地躺在深深的精液水坑里。}]");
         outputText("[pg]这个装满精液的女孩打了个嗝，转身去亲吻乔乔，这位曾经纯洁的僧侣热切地回应着拥抱，当艾米莉热情地用舌头将精液送入他的嘴里时，他好好地品尝了你的精液。她最终退了回来，用一声夸张的叹息鼓励他。[say:也许如果你更好地侍奉[master]，下次你就会被允许接受[his]精液。]乔乔喘着粗气，舔了舔嘴唇，双手迅速向下伸去，照顾他那被长期忽视的阴茎。");
         outputText("[pg]你的私人荡妇笑着抱住你的腿，低声说，[say:精液荡妇谢谢你，[master]。]你把她拉起来，对她微笑，很高兴她正在努力让你初具规模的后宫在性方面尽可能地熟练。她笑容满面，用尾巴抓住乔乔，毫无疑问是急于把他拖走进行更多的训练。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faceMuzzle() : String
      {
         if(get_player().hasMuzzle())
         {
            return "口鼻";
         }
         return "脸";
      }
      
      public function defeatedJojo(param1:Boolean) : void
      {
         var _g:Combat;
         jojoSprite();
         if(get_player().get_lust() > 33 && get_player().get_gender() > 0)
         {
            clearOutput();
            outputText("你满意地微笑着，看着乔乔" + (param1 ? "倒下，无法继续战斗" : "倒下并开始狂热地自慰") + "。遗憾的是，你意识到你自己的需求还没有得到满足。当然，你总是可以强暴这个可怜的小家伙……");
            outputText("[pg]你要强暴他吗？");
            _g = get_combat();
            doYesNo(postCombatRape,function():void
            {
               _g.cleanupAfterCombat();
            });
         }
         else
         {
            get_combat().finishCombat();
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function corruptJojoVaginalSmother() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你感到需要一些性释放，一个恶作剧的念头浮现，让你露出邪恶的笑容。你溜进丛林寻找你的老鼠武僧性玩具，当你找到他时，你几乎是扑到他身上，将他按倒在地。他惊讶地挣扎，直到认出是你，这才红着脸试图移开视线，却无法控制你跨坐时压着的那根勃起。");
         outputText("你顺着他的身体向上爬，低头对他咧嘴一笑，将已经湿透的小穴压在他的嘴上，严厉地命令道：[say:想喘气就给我舔。]他瞪大了眼睛，但你能感觉到他的舌头已经开始在你那充满欲望的裂口处工作了。");
         if(get_player().vaginas[0].vaginalWetness > 4)
         {
            outputText("当他工作时，你呻吟着，你的淫液自由地流过他的" + (get_noFur() ? "脸" : "口鼻") + "，进入他的嘴和鼻子，让他挣扎着不被你的快感淹没，因为他专注于给你带来更多的快感。");
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("当他舔舐你时，你将裂口在他身上摩擦，发出欢愉的呻吟，在他上方扭动。你时不时地从他的脸上抬起，给他刚好够喘口气的休息时间，然后再次用你的小穴堵住他的呼吸。");
         }
         else
         {
            outputText("你将全身的重量压在他的脸上，感受着他为了取悦你而挣扎，你忍不住笑出声来。他的口鼻被紧紧地压在你的小穴上，每一次呼吸的尝试都被阻断，让他在你身下因窒息而颤抖。");
         }
         outputText("他的舌头深深地探入你的体内，最终带给你爆炸性的高潮，让你在他上方无意识地颤抖。你甚至有一瞬间忘记了你正坐在他的脸上，感觉到他几乎因为缺氧而昏厥，直到你站起身来。");
         outputText("他大口喘气，咳嗽了几声，一旦你确定他安全了，你轻声笑了笑，走回你的营地。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoVaginalGentle() : void
      {
         jojoSprite();
         clearOutput();
         outputText("感觉到被填满的渴望，你召唤你的老鼠荡妇来到你身边。看着他迅速回应，恭敬地跪在你面前，你微笑了。你让手抚摸他的头部侧面，然后命令他躺下。");
         outputText("他咽了口唾沫，点点头，紧张地服从了，在地上仰面躺平。他看着你慢慢爬上他的身体，并在他的" + (get_noFur() ? "嘴唇" : "口鼻") + "上印下一个坚定的吻，他以你植入他体内的那种不可思议的欲望回应了这个吻。你能感觉到他的阴茎在你双腿间搅动，当你将滴着淫液的阴道口沿着它摩擦时，它坚挺地抵在你的" + (get_player().hasCock() ? "自己的老二" : "胯部") + "上。");
         if(get_player().vaginalCapacity() < 10)
         {
            outputText("你放下手握住他的阴茎，将它与你的入口对齐，然后伴随着一声轻柔的咕哝，你开始将你的重量压在他身上。[pg]");
            get_player().cuntChange(36.4,true);
            outputText("[pg]你能感觉到他粗大勃起上的每一根血管和隆起，撑开了你紧致的小穴。你开始尽你所能地骑乘他，只将他一半的长度纳入你紧致的身体，因为你知道你们俩都坚持不了多久。然而，他先射精了，你能感觉到精液冲破你内部肌肉的紧密密封，涌入你的身体。");
         }
         else if(get_player().vaginalCapacity() < 36)
         {
            outputText("你放下手握住他的阴茎，将它与你的入口对齐，然后伴随着一声愉悦的呻吟，你将你的重量压在他身上。他的阴茎滑入你的小穴，就像手伸进手套一样，完美契合，仿佛他就是为你而生的。[pg]");
            get_player().cuntChange(36.4,true);
            outputText("[pg]你开始在他身上起伏，随着你臀部的滚动，设定了一个充满爱意的节奏。然而，这并没有持续你希望的那么久，因为很快你就能感觉到他在你体内射精，用他的精液填满你。你并没有被劝退，你继续在他身上摩擦，让你的阴蒂摩擦着他的包皮和肚子" + (get_noFur() ? "" : "上的毛发") + "。");
         }
         else
         {
            outputText("你向前移动，然后倾斜臀部向后推，将他的长度纳入你宽阔伸展的身体中。[pg]");
            get_player().cuntChange(36.4,true);
            outputText("[pg]你嘲笑他，几乎感觉不到他的老二在你体内，并在他耳边低语，[say: 就像老鼠一样小……] 你看着他脸红，开始在他的阴茎和肚子上摩擦滚动，从你的小荡妇那里获取你所能得到的所有快感。");
         }
         outputText("当高潮席卷你的身体时，你愉悦地叫喊出声，导致你的淫液飞溅在你的老鼠荡妇的阴茎周围" + (get_player().hasCock() ? "，你自己的[cocks]也爆发了，将浓稠滚烫的精液喷洒在他的胸膛和肚子上" : "") + "。你一直坐在他的臀部上，直到你的高潮消退，然后伴随着一声愉悦的叹息，你从他身上站起来，挥了挥手让他退下。");
         get_player().knockUp(29,432);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoSexMenu() : void
      {
         menu();
         if(get_player().hasVagina())
         {
            addButton(2,"温柔阴道交",corruptJojoVaginalGentle);
            addButton(7,"阴道窒息",corruptJojoVaginalSmother);
            addButton(8,"肛门窒息",corruptJojoAnalSmother);
         }
         if(get_player().hasCock())
         {
            addButton(0,"温柔口交",corruptJojoBJGentle);
            addButton(5,"残暴口交",corruptJojoBJCruel);
            addButton(3,"温柔肛交",corruptJojoAnalGentle);
            if(get_player().hasPerk(PerkLib.Whispered))
            {
               addButton(8,"低语",whisperJojobait);
            }
            else
            {
               addButton(8,"粗暴肛交",corruptJojoAnalCruel);
            }
         }
         addButton(1,"口交",corruptJojoCunnilingus);
         if(get_player().biggestTitSize() >= 2)
         {
            addButton(6,get_player().biggestLactation() > 1 ? "哺乳" : "乳交",corruptJojoBreasts);
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function corruptJojoEncounter() : void
      {
         jojoSprite();
         outputText("你正享受着在树林里平静的散步，这时乔乔从前面的树上跳了下来，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 2)
         {
            outputText("他那张老鼠脸扭曲成凶狠的咆哮。[say:你！]他尖叫着，伸出爪子向你扑来。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 3)
         {
            outputText("脚步不稳，但却一副要打架的架势！");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 4)
         {
            outputText("长袍明显被顶起，但却一心想要和你战斗。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) == 5)
         {
            outputText("气喘吁吁，一丝不挂，他的" + (get_noFur() ? "头发" : "毛发") + "在微风中沙沙作响，双腿间一根抽动着的巨大鸡巴在跳动。");
         }
         unlockCodexEntry(2740);
         startCombat(new Jojo());
      }
      
      public function corruptJojoCunnilingus() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你决定最终奖励你的荡妇为你所做的一切服务，把他召唤到你的营地来寻欢作乐。他温顺地听从你的召唤出现，你指示他躺在你面前的地上。他按照你的要求做了，你轻轻地分开他的双腿，在他两腿之间坐下。");
         outputText("他困惑地看着你，当你开始舔舐和抚摸他的包皮和睾丸，催促这个雄性完全勃起时，他的困惑变成了幸福。");
         switch(Utils.rand(3))
         {
            case 0:
               outputText("你将他阴茎的顶端含入嘴里，吸吮着它，你的舌头在冠状沟处卷曲，挑逗着顶端细小的缝隙。你慢慢地对待他，让你的手在他的阴茎上上下摩擦，缓慢地为他手淫，偶尔抚摸他那饥渴的睾丸。");
               break;
            case 1:
               outputText("你将他阴茎的顶端含入嘴中，开始慢慢地上下套弄，一只手温柔地揉捏着他的睾丸，另一只手则抚摸着你嘴唇够不到的阴茎部分。你逐渐加快速度，模仿着剧烈的抽插。");
               break;
            default:
               outputText("你将他阴茎的顶端含入嘴里，然后通过鼻子深吸一口气，接着低下头，听着他喘息，因为他的阴茎完全滑入你的嘴里，顺着你的喉咙而下，直到你的鼻子压在他散发着麝香的包皮上。你的手挑逗并挤压着他的睾丸，催促他射精，同时你的喉咙有节奏地吞咽着他的阴茎，做着挤奶的动作。");
         }
         outputText("你一直努力到你的荡妇爆发，然后，把所有的精液都含在嘴里，你抬起头，把嘴唇紧紧地贴在他的嘴唇上，喂他吃下他刚刚释放的精液。当你这样做时，他脸红了，但顺从地把它们都接受了，当你喂他时，他把它们吞了下去。");
         outputText("一旦这个粗俗的吻结束，你站起来微笑着，随意地挥了挥手让他退下。");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoBreasts() : void
      {
         var _loc1_:* = null as IMap;
         jojoSprite();
         clearOutput();
         outputText("你躺下享受片刻宁静的自我安慰，双手移到乳房上轻轻抚摸，这时一声树枝折断的声音将你的注意力吸引到营地边缘。乔乔胆怯地站着，半隐藏在营地外的阴影中，用顺从和渴望的眼神看着你。你微笑着抬起手，弯曲手指召唤他过来。");
         outputText("你的老鼠荡妇顺从地从黑暗中溜进你的营地，走近你并跪在你的身边。当他看着你的乳房时，你能看到他眼中的欲望，渴望和爱意奇妙地交织在一起。你点头表示赞许，让他崇拜你的胸部。");
         if(get_player().biggestLactation() > 1)
         {
            outputText("他凑近，开始沿着你的乳头亲吻，然后将其中一个含入嘴里。他用力吸吮着肿胀的乳头，你可以看到他的眼睛因为突然涌入他" + (get_noFur() ? "嘴里" : "口鼻") + "的乳汁而惊讶地睁大。他颤抖着，开始认真地吸吮，先喝一个乳房，然后喝另一个，");
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("然后是所有其他的，");
            }
            outputText("分享着你的恩赐，直到他的肚子被填满。");
            get_player().milked();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 3)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2185,FlagDict_Impl_.arrayReadInt(_loc1_,2185) + 1);
         }
         else if(get_player().biggestTitSize() <= 5)
         {
            outputText("他凑近你的乳房蹭了蹭，亲吻着，他的手移动着，温柔地膜拜着那柔软饱满的球体。他的亲吻和舔舐慢慢地在你的乳头上盘旋，使它们变得坚挺，当他最终将它们含入嘴里时，一阵阵温暖的愉悦感传遍你的全身。你伸手到双腿之间，" + (get_player().hasCock() ? "握住你的肉棒，在他工作时慵懒地自慰。" : "将手指滑入你的阴缝，在他带来的愉悦中慵懒地自慰。"));
         }
         else
         {
            outputText("他凑近，先在一个乳头上印下一个吻，然后在另一个乳头上印下一个吻，开始充满爱意地膜拜你的乳房。然而，你有其他的计划，一只手抓住他脖子后面的" + (get_noFur() ? "" : "皮毛") + "，另一只手滑到你的乳房下面，将它们拉到他脸的两侧，当你将他紧紧地压在你的乳沟曲线中时，迫使这只老鼠为每一次呼吸而挣扎。");
         }
         outputText("你能听到乔乔的呼吸变得急促，接着他的身体猛地一颤，自发地达到了高潮，将精液溅在你的臀部和肚子上。看着他这副顺从的模样，你忍不住笑出声来，看着羞愧之色爬满他的脸庞，耳朵也耷拉了下来。");
         outputText("他在你愉悦的笑声中，灰溜溜地退回了树林。");
         get_player().orgasm("Tits");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoBJGentle() : void
      {
         jojoSprite();
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("仿佛听到了命令，乔乔从丛林的阴影中溜进你的营地，跪倒在地，眼中带着怯生生的恐惧。你走上前，用手指抚摸他贝壳状耳朵之间的" + (get_noFur() ? "头发" : "毛发") + "，温柔地对他低语，[say:没事的，我美丽的骚货，一切很快就会结束的。]");
         outputText("当你这么说时，他呜咽着，感觉到腐化像一种诱人的麝香一样从你身上流出，吸引他更深地为你服务。");
         if(get_player().cocks[_loc1_].cArea() < 10)
         {
            outputText("他张开嘴想要抗议，但你根本不给他机会，将你的" + get_player().cockDescript(_loc1_) + "滑入他的双唇之间，直达他的喉咙。你能感觉到他喉咙的肌肉紧紧抓住你的" + get_player().cockDescript(_loc1_) + "，随着他被肉棒噎住而痉挛，他薄薄的嘴唇在你的粗度周围颤抖，他的舌头滑过你布满青筋的底部。" + (get_player().biggestTitSize() >= 2 ? "你的双手抬起，按摩你的乳房，拉扯你的乳头，你可以看到当你操他的喉咙时，他看呆了。" : ""));
         }
         else if(get_player().cocks[_loc1_].cArea() < 36)
         {
            outputText("他张开嘴想要抗议，但你根本不给他机会，强行将你的" + get_player().cockDescript(_loc1_) + "塞进他的双唇之间，它的粗度几乎让他的下巴脱臼。你能感觉到他的喉咙被你撑开，就像一个又热又湿又紧的套子，随着你进出他的嘴巴，伴随着他狂跳的心脏的脉动而颤抖。" + (get_player().biggestTitSize() >= 2 ? "你的双手抬起，按摩你的乳房，拉扯你的乳头，你可以看到当你操他的喉咙时，他看呆了。" : ""));
         }
         else
         {
            outputText("他张开嘴想要抗议，却被你的" + get_player().cockDescript(_loc1_) + "堵住了嘴。你能感觉到他的龅牙刮擦着你" + get_player().cockDescript(_loc1_) + "冠状沟的上下，但这并不能阻止即将发生的事情。他举起手试图推开你巨大的勃起，既然你的粗度塞不进他的嘴里，你决定利用这一点；抓住他的手，用它们来套弄你的肉棒。" + (get_player().biggestTitSize() >= 2 ? "他的目光从你巨大的肉棒移到你上方跳动的乳房上，带着一种放肆的欲望，让你轻声笑了起来。" : ""));
         }
         outputText("他的眼睛转向你，充满恐惧和敬畏，恳求释放，你的脚滑到他自己紧绷的勃起上，让你知道他有多需要高潮，但这次是你的。当你的睾丸紧绷，翻腾着你堕落的精液时，你舒服地呻吟着，然后猛地把它喂给他，当一波又一波滚烫的精液喷射穿过你的肉体进入他的喉咙时，你的高潮吞没了你。" + (get_player().hasVagina() ? "你的小穴也迎来了高潮，导致一股女性的淫液溅在他的胸膛上，淫荡地顺着你的大腿滴落。" : ""));
         outputText("你的高潮似乎持续了永远，用你堕落的精华填满了他的肚子，巨大的体积让他的胃微微凸起。你终于抽身离开，让他大口喘气，倒在地上，蜷缩着他那肿胀的肚子。");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("你将他拉入怀中，亲吻他的额头，然后站起身去处理你的事务，留他从这激烈的遭遇中恢复，然后退回丛林。");
         }
         else
         {
            outputText("你给了他最后一次深情的抚摸，用手指穿过他的" + (get_noFur() ? "头发" : "毛发") + "，动作几乎像是在屈尊降贵地抚摸宠物，然后一言不发地转身，留下他退回丛林。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoBJCruel() : void
      {
         jojoSprite();
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你冲着丛林大喊，[say:骚货！]几分钟后，乔乔从丛林的阴影中溜进你的营地，跪倒在地，眼中带着怯生生的恐惧。你走上前，紧紧抓住他贝壳状耳朵之间的" + (get_noFur() ? "头发" : "毛发") + "，愤怒地嘶吼道，[say:我叫你的时候，你就得马上过来。还需要我再教教你规矩吗？]");
         outputText("当你这么说时，他摇了摇头，试图积攒力量来反抗你。你因为他的反抗而愤怒地龇牙咧嘴，一拳打在老鼠的肚子上，让他跪倒在地，大口喘气。");
         if(get_player().cocks[_loc1_].cArea() < 10)
         {
            outputText("你一手紧紧抓住他头上的" + (get_noFur() ? "头发" : "毛发") + "，把他的嘴拉向你的" + get_player().cockDescript(_loc1_) + "，猛地插进他的" + (get_noFur() ? "脸" : "口鼻") + "，丝毫不顾及他是否能喘过气来。你把你的肉棒塞进他的喉咙，开始抽插，让这只老鼠因为窒息而翻白眼。你能感觉到他喉咙的肌肉紧紧抓住你的肉棒，随着他被肉棒噎住而痉挛，他薄薄的嘴唇在你的肉棒周围颤抖。");
         }
         else if(get_player().cocks[_loc1_].cArea() < 36)
         {
            outputText("你一手紧紧抓住他头上的" + (get_noFur() ? "头发" : "毛发") + "，把他的嘴拉向你的" + get_player().cockDescript(_loc1_) + "，猛地插进他的" + (get_noFur() ? "脸" : "口鼻") + "，丝毫不顾及他是否能喘过气来。你" + get_player().cockDescript(_loc1_) + "的粗度几乎让他的下巴脱臼。你能感觉到他的喉咙被你撑开，就像一个又热又湿又紧的套子，随着你进出他的嘴巴，伴随着他狂跳的心脏的脉动而颤抖。");
         }
         else
         {
            outputText("你一手紧紧抓住他头上的" + (get_noFur() ? "头发" : "毛发") + "，把他的嘴拉向你的" + get_player().cockDescript(_loc1_) + "，用你的" + get_player().cockDescript(_loc1_) + "顶住他的" + (get_noFur() ? "脸" : "口鼻") + "。你能感觉到他的龅牙刮擦着你" + get_player().cockDescript(_loc1_) + "冠状沟的上下，但这并不能阻止即将发生的事情。他举起手试图推开你巨大的勃起，既然你的粗度塞不进他的嘴里，你决定利用这一点；抓住他的手，用它们来套弄你的肉棒。");
         }
         outputText("他恐惧地看着你，身体因为缺氧而颤抖，但这只会让你欲火焚身。当你的睾丸紧绷，翻腾着你堕落的精液时，你舒服地呻吟着，然后猛地把它喂给他，当一波又一波滚烫的精液喷射穿过你的肉体进入他的喉咙时，你的高潮吞没了你。" + (get_player().hasVagina() ? "你的小穴也迎来了高潮，导致一股女性的淫液溅在他的胸膛上，淫荡地顺着你的大腿滴落。" : ""));
         outputText("你的高潮似乎持续了永远，用你堕落的精华填满了他的肚子，巨大的体积让他的胃微微凸起。你终于抽身离开，让他大口喘气，倒在地上，蜷缩着他那肿胀的肚子。");
         outputText("你对他冷笑，摇了摇头，嘶嘶地说，[say: 如果你不试图反抗，对你来说会好得多，我的荡妇。]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoAnalSmother() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你感到需要一些性释放，一个恶作剧的念头浮现，让你露出邪恶的笑容。你溜进丛林寻找你的老鼠武僧性玩具，当你找到他时，你几乎是扑到他身上，将他按倒在地。他惊讶地挣扎，直到认出是你，这才红着脸试图移开视线，却无法控制你跨坐时压着的那根勃起。");
         outputText("你爬上他的身体，低头对他咧嘴笑，他盯着你暴露的小穴。你突然转过身，换个方向坐下，让你的臀瓣包裹住他的" + (get_noFur() ? "脸" : "口鼻") + "，将他的口鼻困在你紧致的后庭上。[say:把舌头伸进去，荡妇。]");
         switch(Utils.rand(3))
         {
            case 0:
               outputText("当他舔你时，你将臀部在他身上摩擦，愉悦地呻吟着，在他上方扭动。你时不时地从他的脸上抬起，给他足够的休息时间来喘口气，然后再次用你的臀部切断他的呼吸。");
               break;
            case 1:
               outputText("你将全身的重量压在他的脸上，当你感觉到他挣扎着取悦你时，你笑了，他的鼻子和嘴巴被紧紧地困在你的臀部上，以至于每一次呼吸的尝试都被阻止了，让他在你身下气喘吁吁地颤抖。");
               break;
            default:
               outputText("当他听从你的话时，你呻吟着，将他的舌头深深地刺入你的肛门，像一根光滑的肌肉棒一样进进出出，让你的身体在愉悦中颤抖。这让你想知道他作为一个虔诚的武僧，在生活中是从哪里学到这种技巧的。");
         }
         outputText("他的舌头继续在你的后庭上工作，最终给你带来爆炸性的高潮，让你在他上方无意识地颤抖。你甚至有一瞬间忘记了你坐在他的脸上，感觉到他一动不动，因为他在你站起来之前几乎因为缺氧而晕倒。");
         outputText("他大口喘气，咳嗽了几声，一旦你确定他安全了，你轻声笑了笑，走回了你的营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoAnalGentle() : void
      {
         jojoSprite();
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你看着乔乔从茂密的丛林中溜进你的营地，他怯生生地移动着，目光紧紧盯着你的脚。看到曾经虔诚的僧侣沦为你顺从的性玩具，你的下腹一阵燥热，嘴角也泛起了一丝微笑。");
         outputText("你将他紧紧抱在怀里，充满占有欲，然后强硬地吻上他的唇。当你结束这个吻，看到他局促不安的样子时，你忍不住笑了起来。你毫不在意地将他轻轻按倒在地，分开他的双腿。你能从他的眼神中看出他知道接下来会发生什么，也能看出他既渴望又因为这种渴望而感到羞耻。");
         if(get_player().cocks[_loc1_].cArea() < 10)
         {
            outputText("你拨开老鼠的睾丸，往他那布满褶皱的肛门上吐了口唾沫，然后将你的龟头对准那个被频繁使用的穴口。没有太多仪式或前戏，但他的阴茎已经硬挺起来。当你一寸一寸地挺进他的后庭时，他的脸颊泛起了红晕。起初你保持着缓慢而温柔的节奏，但随着高潮的临近，你的抽插变得更加野性且充满渴求。");
         }
         else if(get_player().biggestCockArea() < 36)
         {
            outputText("你将粗大且流着淫水的龟头滑入老鼠的蛋蛋下方，将你那带有麝香味的预精液涂抹在他那被过度使用的肛门皱褶上，然后将你那布满青筋的粗大" + get_player().cockDescript(_loc1_) + "强行插入他的体内。你看着那粗大、下流的肉棒一寸一寸地消失在他的体内，看着他的脸因为痛苦和快乐的混合而扭曲，你咧嘴笑了，然后开始认真地操他，看着他的肚子随着你巨大肉棒的每一次抽插而鼓起。");
         }
         else
         {
            outputText("你强行将你的" + get_player().cockDescript(_loc1_) + "抵在老鼠的屁股上，看着他摇着头，无声地乞求你不要这样做。你微笑着抓住他的臀部，然后用力向前推，迫使他的身体适应你的粗细，危险地撑开他的屁股和肚子。你勉强只能将一英尺多一点的" + get_player().cockDescript(_loc1_) + "插入他的体内，然后就顶到了他的横膈膜，所以你只能尽你所能地操他，每一次抽插都在搅动他的内脏。");
         }
         outputText("你尽情地在老鼠紧致的身体里冲刺，直到高潮猛烈袭来。你的睾丸紧缩，精液翻滚着喷涌而出，射入老鼠的后庭，用你的欲望和堕落填满他的肚子。你看着他的肚子因精液而膨胀，呈现出一幅美丽而淫秽的画面。");
         outputText("强烈的快感让他的眼神变得迷离，他紧咬着牙关，接着你听到他发出一声尖锐的呻吟，他也迎来了自己的高潮。他那未被触碰的老鼠阴茎在他的肚子上跳动、抽搐，浓稠的精液淫靡地喷洒在他的胸前和脸上。他为你对他所做的一切感到愉悦，这明显的证据让他羞红了脸，在你身下颤抖着。");
         outputText("你看着这一幕，忍不住笑出声来，伴随着一声愉悦的呻吟，从他的后庭中抽了出来。你看着他羞愧地爬回丛林，一路上留下一道你的精液痕迹。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptJojoAnalCruel() : void
      {
         jojoSprite();
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你决定是时候去找你的宠物武僧荡妇了，于是你跟着老鼠潜入丛林。没过多久就找到了他，你悄无声息地移动，以免引起他的注意。你像捕食者一样优雅地潜行到他身后，伸手紧紧抓住他的尾巴，将他推到附近的一棵树上。");
         outputText("你从后面贴上他的身体" + (get_player().biggestTitSize() >= 2 ? "，将乳房挤压在他的背上" : "") + "，并在他耳边嘶嘶地说道：[say:你好啊，小荡妇……]你紧紧抓住他尾巴的根部，向上提起，让他的屁股抬高，迫使他不得不踮起脚尖才能站稳。你听着他发出轻柔的呜咽声，感受着你那躁动的下体压在他那诱人的股沟上。");
         if(get_player().cocks[_loc1_].cArea() < 10)
         {
            outputText("你那肿胀的勃起在他的臀瓣间摩擦了几下，然后毫无预兆地，你深深地插入了他的体内，当你填满他那被过度使用的后庭时，这只老鼠喘息出声。当你进出他的身体，肆无忌惮地操着你的荡妇玩具时，你感觉到他的肛门括约肌在你的" + get_player().cockDescript(_loc1_) + "上颤动着收紧，你舒服地呻吟起来。");
         }
         else if(get_player().cocks[_loc1_].cArea() < 36)
         {
            outputText("你把老鼠紧紧地压在树上，吸入他的气味，将你的" + get_player().cockDescript(_loc1_) + "滑入他紧实的臀瓣之间。当你深深地刺入他的身体时，几乎没有任何温柔可言。你可以听到他发出呻吟，因为你的" + get_player().cockDescript(_loc1_) + "迫使他的肠道移位以容纳你。");
         }
         else
         {
            outputText("当你的老鼠荡妇因为你的" + get_player().cockDescript(_loc1_) + "刺入他的肠道而大叫时，你咧嘴笑了。当你迫使他的肚子粗俗地鼓起以容纳那巨大的粗细时，你能感觉到树干压在你的" + get_player().cockDescript(_loc1_) + "上的重量。");
         }
         outputText("你在扭动和呜咽的老鼠体内抽插，在他身上发泄你的快感，毫不关心他是否享受。不过这也不是什么大问题，因为在你射精之前，你感觉到他紧绷起来，他把你把他压在上面的那棵树给“施肥”了。他高潮的感觉让你也在他肚子里爆发，伴随着一声低沉的如释重负的呻吟，清空了你的蛋蛋。");
         outputText("高潮消退后，你从乔乔的屁股里拔出来，把你的" + get_player().cockDescript(_loc1_) + "在" + (get_noFur() ? "" : "他背上的毛发") + "上擦干净，然后走开，让他自己待着。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptCampJojo() : void
      {
         var _g2:Camp;
         var tentacle:Boolean;
         var _g1:JojoScene;
         var _g:JojoScene;
         clearOutput();
         jojoSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 0)
         {
            if(get_amilyScene().amilyFollowerCorrupt() && campCorruptJojo() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,435) <= 0 && Utils.rand(5) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,435,7);
               hideMenus();
               amilyTeachingJojoBJ();
               return;
            }
            if(get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,81) == 0 && Utils.rand(10) <= 1 && get_player().hasStatusEffect(StatusEffects.TentacleJojo))
            {
               get_finter().amilyDiscoversJojoWithTentaclesAndShitOhBoy();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,76) == 0 && Utils.rand(10) <= 1 && get_amilyScene().amilyFollowerPure() && !get_player().hasStatusEffect(StatusEffects.TentacleJojo))
            {
               get_finter().amilyIsPissedAtYouForRuiningJojo();
               return;
            }
            if(!get_player().hasStatusEffect(StatusEffects.JojoTFOffer) && get_player().hasKeyItem("Marae\'s Lethicite") && get_player().keyItemv2("Marae\'s Lethicite") < 3 && get_player().isCorruptEnough(75))
            {
               jojoMutationOffer();
               get_player().createStatusEffect(StatusEffects.JojoTFOffer,0,0,0,0);
               return;
            }
            outputText("在呼唤你那堕落的宠物之前，你想怎么使用他？");
         }
         else
         {
            outputText("当你呼唤乔乔的名字时，他从谷仓里溜了出来，他走向你的每一步都充满了爱恨交织的情感。他看起来灰头土脸、疲惫不堪，但一看到你，他的肉棒依然紧绷着。");
            outputText("[pg]乔乔是一个" + (get_noFur() ? "长着完美无瑕的白色毛茸茸耳朵的鼠人" : "长着完美无瑕的白色皮毛的拟人化老鼠") + "。他棕色的眼睛盯着你，眼神中混合着绝望和单相思的渴望。虽然他只有四英尺高，但他全身覆盖着精瘦的肌肉，动作快得不可思议。他赤身裸体，一根硕大、被污染且跳动着的阴茎正精神抖擞地弹跳着。一个" + (get_noFur() ? "无毛的" : "毛茸茸的") + "阴囊悬挂在他的双腿之间，里面装着看起来大得令人痛苦的睾丸。");
            if(tentacleJojo())
            {
               outputText("几根隐约像肉棒的触手从他的背部和腹股沟长了出来。它们在他周围不安地摇摆着，从尖端渗出浓稠、芳香的淫液。");
            }
            if(get_game().farm.farmCorruption.hasTattoo("jojo"))
            {
               outputText("[pg]");
               if(get_game().farm.farmCorruption.jojoFullTribalTats())
               {
                  outputText("他从头到尾都布满了部落纹身，色情的线条在他赤裸的身体上蜿蜒，让他看起来像一个几乎未被驯服的野蛮人。");
               }
               else
               {
                  if(get_game().farm.farmCorruption.numTattoos("jojo") > 1)
                  {
                     outputText("他的身体上印有以下纹身：\n");
                  }
                  else
                  {
                     outputText("他有");
                  }
                  if(1141 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1141) + "\n");
                  }
                  if(1142 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1142) + "\n");
                  }
                  if(1143 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1143) + "\n");
                  }
                  if(1144 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1144) + "\n");
                  }
                  outputText("\n");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1101) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1101,2);
               outputText("[pg]你一言不发地伸出手。乔乔颤抖着，把一瓶男魅魔药剂放在上面。");
               outputText("[pg][say: 惠、惠特尼女主人说，她、她会把剩下的和您在农场利润中的分成放在一起，[master]。][pg]");
               get_inventory().takeItem(get_consumables().INCUBID,corruptCampJojo);
               return;
            }
            outputText("[pg][say: 我能为[master]做些什么？]");
         }
         unlockCodexEntry(2740);
         menu();
         addButtonDisabled(0,"做爱");
         addButtonDisabled(1,"触手交");
         addButtonDisabled(2,"Milk Him");
         addButtonDisabled(3,"触手牛奶");
         addButtonDisabled(4,"护发");
         addButtonDisabled(5,"产卵");
         if(!get_player().isGenderless() && get_player().get_lust() >= 33)
         {
            addButton(0,"做爱",corruptJojoSexMenu);
         }
         if(tentacleJojo() && get_player().get_lust() >= 33)
         {
            addButton(1,"触手交",useTentacleJojo);
         }
         if(get_player().hasKeyItem("Cock Milker - Installed At Whitney\'s Farm"))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,332) > 0)
            {
               outputText("[pg]<b>乔乔上次被榨乳后还没恢复过来——你应该等几个小时再带他回去。</b>");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) != 0)
            {
               _g = this;
               addButton(2,"榨精",function():void
               {
                  _g.repeatMilkJojo();
               });
               if(tentacleJojo())
               {
                  _g1 = this;
                  tentacle = tentacleJojo();
                  addButton(3,"触手榨精",function():void
                  {
                     _g1.repeatMilkJojo(tentacle);
                  });
               }
            }
            else
            {
               addButton(2,"榨精",milkJojoFirst);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.HairdresserMeeting))
         {
            addButton(4,"护发",jojoPaysForPerms);
         }
         if(get_player().canOvipositBee())
         {
            addButton(5,"产卵",beeEggsInCorruptJojo);
         }
         _g2 = get_camp();
         addButton(14,"返回",function():void
         {
            _g2.campSlavesMenu();
         });
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 0)
         {
            addButton(6,"农活",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 1)
         {
            addButton(6,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1098) == 0)
         {
            addButton(7,"收集原液",harvestJojoDraft);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1098) == 1)
         {
            addButton(7,"停止收集",stopHarvestJojoDraft);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 1)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
      }
      
      public function confrontChastity() : void
      {
         jojoSprite();
         clearOutput();
         outputText("他不可能永远信守誓言。毕竟，他错过了快乐！他可能永远不知道，如果有一根完美的鸡巴完美地插入他的屁眼，或者他的鸡巴完美地插入阴道或肛门，他会有什么感觉。只要他对你保持忠诚，他应该没问题的。");
         outputText("[pg][say: 那快乐呢？" + (get_player().hasVagina() ? "像我这样潜在的伴侣呢？" : "") + "你错过了！]你说道。乔乔深深地凝视着你的眼睛，看了好一会儿。");
         outputText("[pg][say: 嗯……年轻人，你是对的。你确实花时间和我在一起。我们一起冥想，我教了你一些重要的课程，现在我们在这里，]乔乔犹豫地说，但他开始微笑，[say: 我们做爱吧；我想体验一下。]");
         outputText("[pg]你对乔乔回以微笑，知道你可以和他做爱了。");
         outputText("[pg]<b>你解锁了乔乔的性爱菜单！</b>");
         if(get_silly())
         {
            outputText("<b> 乔乔只能学习四个招式。要遗忘一个招式来学习新招式吗？是的。1... 2... 3... 噗！乔乔遗忘了“贞洁”，学会了“性爱”！</b>");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2136,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2311,-3);
         doNext(pureJojoSexMenu);
      }
      
      override public function campCorruptJojo() : Boolean
      {
         if(isJojoCorrupted() && !get_player().hasStatusEffect(StatusEffects.NoJojo) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 0;
         }
         return false;
      }
      
      public function beeEggsInCorruptJojo() : void
      {
         clearOutput();
         outputText("你把乔乔拉近，指尖轻轻地在他脸颊" + (get_noFur() ? "" : "柔软的皮毛") + "上挑逗，在他那碟子形的耳朵里发出令人安心的嗡嗡声。这个贪婪的小荡妇高兴地竖起耳朵，在你身上蹭来蹭去。他那柔软纤细的手伸进你的[armor]里，抚摸着你的腹股沟。他的另一只手则向下游走，来到他自己勃起的阴茎上，收集着他那丰富的先头汁液，在他坚硬的肉棒上涂抹上一层新鲜的润滑液。你暂时由着他，让他把你的欲望推向更高。这场表演让你的产卵管从裂口中伸出，并充满了新鲜的血液，使这个管状器官硬化，变得像一根巨大的阴茎。");
         outputText("[pg]至于乔乔，他似乎并没有注意到你肿胀的突出物或你恶意的笑容。一旦完全硬起来，你就在他耳边低语，命令他四肢着地，让你操他。");
         if(!get_player().hasCock())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,590) == 0)
            {
               outputText("乔乔对此感到困惑；他知道你没有鸡巴！");
            }
            else
            {
               outputText("乔乔起初看起来有些困惑，随后恍然大悟地点了点头，想起了你上次在他体内产卵的情景。");
            }
         }
         outputText("他弯下腰，像个听话的荡妇一样，抬起他的");
         if(tentacleJojo())
         {
            outputText("触手-");
         }
         outputText("尾巴，向你做出诱惑的动作。他的屁股看起来丰满柔软，呈现出心形，仿佛在召唤你用坚硬的产卵器刺穿它。你用力拍了一下这只老鼠的屁股，看着他惊讶的吱吱叫声和收缩的肛门，露出了微笑。");
         outputText("[pg]向前移动，你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("滑行着缠绕住他");
         }
         else if(get_player().isGoo())
         {
            outputText("渗流着覆盖住他");
         }
         else if(get_player().isTaur())
         {
            outputText("跨坐在他身上");
         }
         else
         {
            outputText("爬到他身上");
         }
         outputText("。乔乔信任地转过头看着你，为了支撑你的体重而微微摇晃。他开始伸手去摸他那因腐化而勃起的肉棒，但当然，他不得不放下手臂来保持直立。这只啮齿动物哀怨地呜咽着，乞求你占有他，抚摸他……随便怎样都行！你温柔地让他安静下来，将你的毒刺刺入他的后庭，用一阵剧痛和注入的新鲜、不自然的欲望来奖励他的顺从。他的手臂开始颤抖，屁股开始扭动，口水流了一地，喘息的样子让你觉得他更像是一只狗而不是老鼠。");
         outputText("[pg]你从这只荡妇老鼠的臀部拔出昆虫般的长刺，换上另一根更粗的管子。你那沾满花蜜的产卵管直接滑入乔乔那欢迎的肛门，他的直肠被撑开，以容纳产卵管那粗壮的宽度。一缕润滑的、像蜂蜜一样的液体从尖端滴落，帮助插入，不一会儿，这只老鼠的屁股就变成了一条湿滑的肉洞，随着你腹部的每一次抽插发出甜美的黏腻声。他那粗壮的、一英尺长的老鼠鸡巴实际上稍微变软了，随着每一次抽插而甩动，在你将他体内的液体挤压出来时，流下了一缕缕拉丝的淫液。");
         outputText("[pg]当你特别用力地推进，将沉重的产卵管插到底时，乔乔发出了愉悦的喵呜声，你的毒刺几乎刮到了他的蛋蛋。一大团半透明的精液从他的龟头滴落，他开始像个心甘情愿的性奴一样向后迎合你。你抓住他的耳朵，开始更快地操他；湿润的黏腻声传遍了你的营地，让附近的任何人都清楚地知道正在发生什么。如果你不是沉浸在这一刻，你可能会担心，你拉扯着他的背，淫荡地亲吻他，同时你的蜜液变得浓稠，卵也移动到了合适的位置。");
         outputText("[pg][say:要来了，小宠物，]你轻柔地说，[say:让我们看看你能装下多少颗卵，嗯？]");
         outputText("[pg]乔乔呜咽着点了点头，听到你的话，他的鸡巴滴液的速度变快了。真是个荡妇！你在愉悦中喘息着，感觉到第一颗卵开始滑过你的肉管，肌肉的收缩将它哄骗得越来越深，进入你的宠物。你的器官本来就是为了伸展而生的，轻松地应对了通道，但乔乔的屁眼就没那么好受了。他被撑得厉害，可怜的前列腺被压得太紧，以至于一股浓稠的液体从他的鸡巴里喷射出来，不是因为高潮或快感，而是因为他的身体里已经没有空间容纳它了。");
         outputText("[pg]这只白老鼠淫荡地呻吟着，试图向后顶撞你，即使你已经停止了抽插，他实际上是在寻求对前列腺施加更多的压力。对他来说幸运的是，你能感觉到你的下一颗卵挤进了你的产卵管，就在第一颗卵弹出进入这只啮齿动物的肠道时。乔乔因为压力的变化而喘息，然后恢复了他气喘吁吁的呻吟。甚至在第二颗卵穿过你一半的长度之前，第三颗卵就显现出来了，依偎在底部，开始了它缓慢的、充满快感的旅程，从你的管子出来，进入你宠物的后庭。");
         outputText("[pg]产卵的感觉真他妈的好！");
         if(get_player().get_gender() > 0)
         {
            outputText("你的");
            if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("以及[eachCock]");
            }
            if(get_player().get_gender() == 1)
            {
               outputText("[cocks]");
            }
            if(get_player().get_gender() == 3 || get_player().cockTotal() > 1)
            {
               outputText("正在");
            }
            else
            {
               outputText("正在");
            }
            outputText("喷涌在乔乔的背上，但你并不觉得有必要去处理你普通的生殖器。");
         }
         outputText("你完全专注于那些光滑的球体从你体内滚出，被植入宿主体内的丝滑感觉，不管他愿不愿意。值得庆幸的是，乔乔是愿意的，他把精液射在地上，随着你强行塞进他曾经紧致的肛门里的每一个新卵，他都会喷出一串串精液。一个接一个的卵滑入他的体内，从你那看起来像外星人的产卵管中引出一阵阵狂喜的颤抖。伴随着爆发性的紧缩，你高潮了，并把剩下的卵强行塞进这只老鼠婊子的屁眼小穴里。");
         if(get_player().eggs() > 30)
         {
            outputText("当你结束时，他的肚子微微隆起，透过他的" + (get_noFur() ? "皮肤" : "皮毛") + "可以看到小小的、蛋形的凸起。");
         }
         outputText("[pg]你带着自我满足的微笑拔出，产卵管迅速缩回你的体内。一股金色的蜂蜜从老鼠被虐待的肛门流出，与他汇聚成洼的精液混合在一起。你感到的解脱是显而易见的——当你从他身上爬下来时，你觉得[feet]很轻盈，乔乔叹了口气，[say:谢谢你给我的高潮！]");
         outputText("[pg]当你打发他走时，他蹒跚地走向树林，他坚硬的肉棒一路上还在滴着老鼠的精液。你不得不怀疑，他每走一步，那些卵是不是都在他的前列腺上滑动？哦，好吧，这不关你的事。");
         if(get_player().fertilizedEggs() > 0 && !buttPregnancy.get_isPregnant())
         {
            buttPregnancy.knockUpForce(26,80);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,590,FlagDict_Impl_.arrayReadInt(_loc1_,590) + 1);
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你告诉他回营地去；有些事情你必须对他做，而在这里做不了。而且要反复做。乔乔浑身发抖，勉强鞠了一躬，然后慢慢地朝营地走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1080,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function assholeOrDP() : String
      {
         if(get_player().hasVagina())
         {
            return get_player().vaginaDescript(0) + "和" + get_player().assholeDescript();
         }
         return get_player().assholeDescript();
      }
      
      public function apparentlyJojoDOESlift() : void
      {
         var _loc2_:* = null as Array;
         clearOutput();
         jojoSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1046) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1046,1);
            outputText("你问乔乔他能不能教你像武僧一样战斗。[pg]");
            outputText("乔乔打量了你一会儿，然后说道：[say:是的，我可以教你我的教团传授给我的招式、技巧和功法。而且……]乔乔凝视着远方，他的注意力飘忽了一会儿，然后继续说道，[say:既然我是唯一剩下的，我就有责任将这些知识传授给一个值得的灵魂。][pg]");
            if(!get_player().isPureEnough(25))
            {
               outputText("乔乔皱了皱眉，[say:我愿意教你，[name]，只要我有时间。但我不是大师，所以我没有资格收徒。但作为你的朋友，我会把我所知道的教给你，这样你就能保护自己。我认为我们把时间花在冥想上会更好。在找到你的内心平静之前，这些技巧你很难发挥出什么作用。][pg]");
               menu();
               doNext(jojoCamp);
               return;
            }
            outputText("乔乔笑了笑，[say:我不是大师，所以我没有资格收你为徒……但作为朋友，我可以把我所知道的都教给你。只要你准备好了，随时开口。][pg]");
            menu();
            doNext(jojoCamp);
            return;
         }
         if(get_player().get_fatigue() >= get_player().maxFatigue() - 60)
         {
            outputText("你请求武僧继续你的训练；但他摇了摇头。[pg]");
            outputText("[say:还不行，[name]。在我们的训练开始之前，你的身体必须保持健康并得到充分的休息。先去休息，晚点再来找我。][pg]");
            menu();
            doNext(jojoCamp);
            return;
         }
         if(!get_player().isPureEnough(25))
         {
            outputText("你请求武僧继续你的训练；但他摇了摇头。[pg]");
            outputText("[say:恐怕在我们继续训练之前，你最好把时间花在冥想上。你现在想这么做吗？][pg]");
            menu();
            doYesNo(jojoFollowerMeditate,jojoCamp);
            return;
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1045,FlagDict_Impl_.arrayReadInt(_loc1_,1045) + 1);
         if(!get_player().hasPerk(PerkLib.ControlledBreath) && !get_player().hasPerk(PerkLib.CleansingPalm) && !get_player().hasPerk(PerkLib.Enlightened))
         {
            outputText("乔乔给了你一个灿烂开朗的微笑，[say:好吧，[name]……我们开始吧。][pg]");
            outputText("乔乔的教学风格在讲课和实战之间周期性地切换。当他解释一个概念或一种打击方式时，他会先引导你完成，然后再让你在他身上尝试。他很有耐心，但也很坚定。当你犯错时，他不会惩罚你，而是纠正你并让你再试一次。他不允许你放弃，他的教学风格让你不会感到沮丧。[pg]");
            outputText("整个训练过程非常紧张，每次简短的讲课或演示都可以作为短暂的休息，防止你的身体吃不消，并帮助你建立耐力。[pg]");
            outputText("在训练结束时，你浑身是汗，大口喘着粗气。[pg]");
            outputText("当你向乔乔鞠躬时，他也向你鞠躬，并说道：[say:去休息一下吧[name]，这是你应得的。][pg]");
            get_player().changeFatigue(60);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1045) == 5)
            {
               outputText("[say:呼吸是关键。][pg]");
               outputText("乔乔不断重复的话语在你心中回荡，你意识到你已经学会了控制呼吸。你休息所需的时间比平时更短，你感觉自己因此充满了活力。你的[fullChest]");
               if(get_player().biggestTitSize() == 0)
               {
                  outputText("起伏");
               }
               else
               {
                  outputText("起伏");
               }
               outputText("即使在激烈的战斗中也很平稳。从现在起，你知道你会恢复得更快。[pg]");
               outputText("<b>(获得特质：波纹呼吸法 -</b> 疲劳恢复速度提高10%<b>)</b>");
               get_player().createPerk(PerkLib.ControlledBreath,0,0,0,0);
            }
         }
         else if(get_player().hasPerk(PerkLib.ControlledBreath) && !get_player().hasPerk(PerkLib.CleansingPalm) && !get_player().hasPerk(PerkLib.Enlightened))
         {
            outputText("乔乔对你露出了灿烂的笑容，[say:好吧[name]……我们开始吧。][pg]");
            outputText("乔乔改变了他指导你的方式。很大程度上是因为你的耐力增强了，你们俩花更多的时间一起练习招式、打击和机动。当到了简短讲课的时间时，他拿出了他教团里为数不多的卷轴之一，并告诉你他所知道的关于卷轴内容的一切。[pg]");
            outputText("没过多久，你们俩又站了起来，练习招式和模拟打击，甚至时不时地进行短暂的实战。在紧张的训练结束时，你浑身是汗……但乔乔也是，而且你们俩都没有气喘吁吁。当你向乔乔鞠躬时，他也向你鞠躬，并说道：[say:去休息一下吧[name]，这是你应得的。][pg]");
            get_player().changeFatigue(60);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1045) == 10)
            {
               outputText("重复的动作开始慢慢深入人心，你的肌肉也逐渐适应了乔乔的训练。[pg]");
               outputText("在与这只老鼠的训练结束时，你认为你可能学到了一些有助于对抗这个世界居民的东西。[pg]");
               outputText("<b>(获得能力：净化之掌 -</b> 乔乔教团的一种远程格斗技巧，允许你用纯净的精神能量波轰击敌人，削弱他们并伤害腐化者。<b>)</b>");
               get_player().createPerk(PerkLib.CleansingPalm,0,0,0,0);
            }
         }
         else if(get_player().hasPerk(PerkLib.ControlledBreath) && get_player().hasPerk(PerkLib.CleansingPalm) && !get_player().hasPerk(PerkLib.Enlightened))
         {
            outputText("乔乔对你露出了充满自豪的灿烂笑容，[say:好吧[Name]……我们开始吧。][pg]");
            outputText("很大程度上是因为你的耐力增强和技术提高，你们俩花更多的时间在实战和练习乔乔所知道的招式上。当到了简短讲课的时间时，乔乔气喘吁吁地和你坐在一起，花了一分钟时间恢复呼吸。乔乔的讲课不再涉及如何打击和防御，而是涉及灵魂的本质。你学到了很多关于个性、意志力和决心的知识，讲课结束后，你们俩在沉默中冥想了几分钟，思考你们所学到的东西。[pg]");
            outputText("然后你们俩又站了起来，优雅地练习招式，并用猛烈的打击攻击看不见的敌人。在紧张的训练结束时，你和乔乔都很累，因为你们俩都训练到了极限。[pg]");
            outputText("当你们俩互相鞠躬时，身体明显有些颤抖，乔乔说道：[say:干得好[name]，你……哇……我需要休息一下。这是我应得的。] 你们俩相视一笑，结束了训练。[pg]");
            get_player().changeFatigue(60);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1045) >= 16 && get_player().get_inte() >= 70)
            {
               outputText("训练结束后，你决定独自冥想；回到你的[bed]上，你闭上眼睛，开始呼吸。然后，你周围的世界开始歌唱。[pg]");
               outputText("营地里充满了风中传来的声音，以及那个将你带到这里的传送门——那道横跨世界的巨大伤痕——发出的不祥的嘶嘶声。你感觉自己向宇宙敞开了心扉，仿佛它就是一位穿着裙子坐在你身边的女士，你轻易就能伸手触碰到她。尽管你一动不动，但你感到自由和解脱。你准备好迎接一切，却又无所期待。你既没有思考也没有做梦，你只是存在着。[pg]");
               outputText("<b>(获得特质：开悟 -</b> 白魔法阈值增加。冥想可恢复生命值。获得独自冥想的能力。<b>)</b>");
               get_player().createPerk(PerkLib.Enlightened,0,0,0,0);
            }
         }
         else
         {
            outputText("乔乔微笑着，[say: 老实说，[name]，我应该请你来教我才对，但我会尽力的。][pg]");
            outputText("没有说教。你和乔乔都不是大师，但就目前而言，你们俩已经耗尽了从天莲宗获得的少量知识。你和乔乔转而练习到筋疲力尽，大口喘着粗气，同时还能抽出时间享受彼此的陪伴。[pg]");
            get_player().changeFatigue(60);
            _loc2_ = [];
            _loc2_.push("你可以听到乔乔的脚步声穿过营地，他正走向他的石头，在你们的训练结束后寻求休息。");
            if(get_marbleScene().marbleAtCamp())
            {
               _loc2_.push("你可以听到玛布尔在哼着一首你听不出来的歌。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) > 0)
            {
               _loc2_.push("你可以听到艾米莉在给她的巢穴换垫料。");
            }
            if(get_game().emberScene.followerEmber())
            {
               _loc2_.push("你可以听到烬在清理" + get_emberScene().emberMF("他的","她的") + "鳞片。");
            }
            if(get_rathazul().followerRathazul())
            {
               _loc2_.push("你可以听到拉萨祖尔正用惊人灵活的手指进行实验。");
            }
            if(sophieFollower())
            {
               _loc2_.push("你可以听到索菲睡觉时的呼吸声。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) > 0)
            {
               _loc2_.push("你可以听到伊兹玛翻书的声音。");
            }
            if(get_game().helScene.followerHel())
            {
               _loc2_.push("你可以听到赫莉娅对着空气挥拳的声音。");
            }
            outputText(_loc2_[Utils.rand(int(_loc2_.length))] + "[pg]");
         }
         if(get_player().get_str100() < 50)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_str100() < 80)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_inte100() < 50)
         {
            dynStats(DynStat.Inte(0.5));
         }
         if(get_player().get_inte100() < 80)
         {
            dynStats(DynStat.Inte(0.5));
         }
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function anallyFuckTheMouseButtSlut() : void
      {
         var _loc1_:int = 40;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 10)
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) * 3;
         }
         else
         {
            _loc1_ += 30;
         }
         var _loc2_:int = get_player().cockThatFits(40);
         jojoSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) == 0)
         {
            outputText("你终于下定了决心；你想把肉棒塞进他紧致的屁股里。" + get_player().clothedOrNaked("你脱下[armor]，") + "乔乔犹豫着脱下长袍，露出了赤裸的身体。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) == 1)
         {
            outputText("你决定再次把肉棒塞进他紧致的屁股里。" + get_player().clothedOrNaked("你脱下[armor]，") + "乔乔犹豫着脱下长袍，露出了赤裸的身体。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) >= 2)
         {
            outputText("你决定再次把肉棒塞进他紧致的屁股里。" + get_player().clothedOrNaked("你脱下[armor]，") + "乔乔毫不犹豫地脱下长袍，露出了赤裸的身体。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 1)
            {
               outputText("[pg][say: 温柔一点，] 乔乔一边呜咽着，一边四肢着地趴下。");
            }
            else
            {
               outputText("[pg][say: 尽管我们以前做过，但还是请温柔一点，] 乔乔紧张地说着，四肢着地趴下。");
            }
            outputText("[pg]你轻轻抚摸着乔乔紧致、颤抖的臀瓣，仔细端详着他的肛门。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 1)
            {
               outputText("他太紧了，你无法直接将你的" + get_player().cockDescript(_loc2_) + "插进去；他需要扩张。你警告乔乔你要先用手指，他带着恐惧颤抖着点了点头。你用唾液润滑了手，然后开始行动。");
            }
            else
            {
               outputText("你警告乔乔你要先用手试探一下。[say: 如果你必须这样的话，]他闭上眼睛说道。你用唾液润滑了手指，然后轻轻地探入乔乔的雏菊。");
            }
            outputText("[pg]你的手指刚突破他的入口，乔乔的阴茎就开始渗出前列腺液，他颤抖着。你不确定他是感到痛苦还是兴奋，但他自己可能也不知道：他真的很敏感。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 1)
            {
               outputText("你慢慢来，因为他已经够担心了，但最终你觉得你应该能把你的阴茎插进去了。");
            }
            else
            {
               outputText("他放松得比上次快多了。你应该没问题了。");
            }
            outputText("[pg]你往手上吐了口唾沫，均匀地涂抹在你的" + get_player().cockDescript(_loc2_) + "上，让它充分润滑。你告诉乔乔你要进去了，然后你慢慢地将你的" + get_player().cockDescript(_loc2_) + "滑入乔乔的后庭，他的括约肌紧紧地包裹着你。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) > 0 ? "以玛莱的名义，他还是那么紧！" : "以玛莱的名义，他好紧！") + "");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 1)
            {
               outputText("<b>乔乔失去了他的后庭童贞！</b>");
               outputText("[pg]你问他是否还好。[say: 是的。感觉很奇怪，有点痛……但还不赖！继续，]乔乔说。");
            }
            else
            {
               outputText("[pg]乔乔开始兴奋地喘息。你问他是否还好，他向你竖起大拇指。[say: 我……很好。继续。]");
            }
            outputText("他的阴茎完全勃起，随时准备射精。你对他笑了笑，开始加快速度，同时保持在一个舒适的程度。当你感觉到他放松下来时，你决定加快速度，加大力度。乔乔开始在狂喜和痛苦中呻吟，每一次抽插都发出一声尖锐的吱吱声。");
            outputText("[pg]最终，你再也忍不住了，将你的精液释放到了他的肠道里。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2185) < 1)
            {
               outputText("乔乔也高潮了，射得草地上到处都是。");
               outputText("[pg]现在精疲力尽，你躺在乔乔旁边。乔乔的屁股里流出了一小股精液。[say: 这是一次全新的体验。我愿意再试一次，]乔乔笑着说，你也回以微笑。你知道你会经常这样做的。");
            }
            else
            {
               outputText("乔乔迎合着你的抽插，承受着一切，然后射得草地上到处都是。");
               outputText("[pg]现在精疲力尽，你躺在乔乔旁边。乔乔的屁股里流出了一小股精液。你告诉乔乔他似乎真的很喜欢走后门。乔乔脸红了。你笑着告诉你的小屁股荡妇，还有更多好戏在后头。");
            }
         }
         else
         {
            outputText("[pg]乔乔急忙四肢着地，把紧致的屁股翘在半空中让你看，同时掰开他的臀瓣。这个小荡妇对你太渴望了。");
            outputText("[pg]你也很渴望：你的[cocks]已经硬了。你轻轻抚摸着乔乔紧致、颤抖的臀瓣，仔细端详着他的肛门。你决定再试一次。你警告乔乔你会先插入你的手。乔乔说，[say: 快点。]你对他的回答笑了笑。你用唾液润滑了手指，然后轻轻地开始探入乔乔的雏菊，测试松紧度。");
            outputText("[pg]你的手指刚侵入乔乔的肠道，他的阴茎就开始渗出前列腺液。乔乔的脸在痛苦和兴奋之间不断闪烁。乔乔一定真的很敏感。");
            outputText("嗯……他的屁股似乎比第二次更松了；你应该可以毫无顾虑地插进去了。");
            outputText("[pg]你往手上吐了口唾沫，将口水均匀地涂抹在你的" + get_player().cockDescript(_loc2_) + "上，让它充分润滑。觉得润滑得差不多了，你告诉乔乔你要开始了，然后慢慢地将你的" + get_player().cockDescript(_loc2_) + "滑入乔乔的后庭。他的括约肌紧紧地包裹着你。以玛莱的名义，他还是那么紧！");
            outputText("[pg]乔乔开始因为兴奋而喘息。你问他有没有事。乔乔对你竖起了大拇指。[say:我……没事。继续。]他的肉棒完全勃起，随时准备射精。你对他笑了笑，开始加快速度，同时保持在一个舒适的程度。当你感觉到他放松下来时，你决定加快速度，加大力度。乔乔开始在狂喜和痛苦中呻吟，每一次抽插都发出一声尖锐的吱吱声。");
            outputText("[pg]最终，你再也忍不住了，将你的精液释放到了他的肠道里。");
            outputText("乔乔开始摆动臀部，为了把所有的精液吸进他的肠道，他用长长的尾巴缠住你，把你拉得更近。很快，他也高潮了，精液射得满草地都是。");
            outputText("[pg]现在精疲力尽的你躺在乔乔身边。乔乔的屁股里漏出了一小股精液。你笑着告诉你的小屁股荡妇，还有更多好戏在后头呢。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2184) >= 4)
         {
            outputText("他在你的嘴唇上印下了一个吻。");
         }
         outputText("[pg]休息了好一会儿后，" + get_player().clothedOrNaked("你们俩重新穿好衣服，","乔乔重新穿好衣服，你们俩") + "回到了营地。");
         dynStats(DynStat.Cor(-1));
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2185,FlagDict_Impl_.arrayReadInt(_loc3_,2185) + 1);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2184,FlagDict_Impl_.arrayReadInt(_loc3_,2184) + 1);
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyTeachingJojoBJ() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,434) == 0)
         {
            outputText("当你正在计划下一步行动时，你的宠物老鼠出现了，艾米莉几乎是拖着乔乔走在她身后，无视他沿途滴在地上的浓稠精液。他喘着气抱怨道，[say: ——不想吸鸡巴！操逼绝对更好。]");
            outputText("[pg]艾米莉转过身，给了他那叛逆的小" + (get_noFur() ? "脸蛋" : "口鼻") + "一巴掌。[say: 你需要好好学学怎么取悦我们的[master]。你真以为[he]光是操你的屁股或者骑你那根又粗又……流着口水的……肉棒就会满足吗……] 艾米莉的话音渐渐弱了下去，因为她伸手摸向了乔乔那根总是硬挺着、沾满淫液的肉棒。");
         }
         else
         {
            outputText("看来艾米莉和乔乔又聚在一起了，这次是在营地中央。艾米莉一手握着乔乔肿胀的睾丸，一边生动地向他解释一个合格的奴隶应该如何吞下每一滴精液来取悦他的[master]。乔乔喘着粗气，舌头从嘴里伸出来，心不在焉地附和着艾米莉那令人愉悦的示范，他的注意力全在她的手指上，根本没听进去她的话。");
            outputText("[pg]这个堕落女孩那恶魔般的尾巴愤怒地甩动着，她捏了捏他跳动的阴囊，责骂道：[say: 你到底有没有在听，你这个精虫上脑的家伙？！] 一股浓稠的预精液从乔乔的马眼喷射而出，溅在她的下巴上，让她顺着脊椎一直到她那性欲旺盛的下体都产生了一阵深入骨髓的战栗。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,434,FlagDict_Impl_.arrayReadInt(_loc1_,434) + 1);
         outputText("她似乎明显被这只老鼠的勃起分散了注意力，很可能很快就会去操他了。");
         if(get_player().hasCock())
         {
            outputText("你要不要让艾米莉在你身上示范，给他们俩一个惊喜？");
         }
         else
         {
            outputText("你想看他们做爱吗？");
         }
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"示范",BJRidesGETYOUONE);
         }
         addButton(1,"观看",amilyAndJojoFuck);
         addButton(14,"离开",playerMenu);
      }
      
      public function amilyAndJojoFuck() : void
      {
         jojoSprite();
         clearOutput();
         outputText("当两只老鼠开始变得更加淫荡时，你找到附近的一块石头坐下。艾米莉用她的尾巴让乔乔坐在她面前，用手挤压他紧绷的睾丸，当他喷出一股浓稠的先锋汁时，她喘着粗气。你利用这阵骚动作为掩护，从你的[armor]里挤出来，让自己舒服一点。谢天谢地，他们俩都没有听到你的声音，或者即使听到了，他们也不在乎。艾米莉窃笑着，[say: 哇，难怪[master]把你留在身边，你简直就是个精液喷泉！]她轻轻地用指尖沿着乔乔肿胀的肉棒底部滑动，当他因为过度刺激而立刻开始在她的手指上滴下液体时，她咯咯地笑了起来。");
         outputText("[pg]乔乔呻吟着，[say: 呃……停下……求你了，艾米莉，求你了，我能射吗？]艾米莉猛地一抽，失望地摇了摇头。她用嘴型说道，[say: 还不行，]然后站了起来，转过身，用她那恶魔般的尾巴把乔乔的" + (get_noFur() ? "脸" : "口鼻") + "拉进了她那湿滑的小穴里。这位前僧侣的抗议被艾米莉湿透的阴部捂住了，他很快就开始急切地吸吮她那流着口水的小穴。随着每一次热情的舔舐，她伸手到膝盖之间抚摸乔乔那因腐化而肿胀的肉棒，怂恿他更彻底地取悦她。");
         outputText("[pg][say: 就-就在那里，]艾米莉呻吟着，[say: 舔我的阴蒂！吸它！吸它，婊子！]乔乔伸手抱住她，找到了她的乳房，他开始用手揉捏它们，同时吃着她，让自己的动作与他优雅的舌头的节奏以及他那无意识的欲望在她湿透的阴蒂上脉动的吸力相匹配。她颤抖着，在欣快的主宰中大喊。[say: 是的！操，是的！好婊子！好婊子！]乔乔的" + (get_noFur() ? "脸变暗了" : "口鼻和脸变暗了") + "，因为突然受到水分的冲击，你意识到艾米莉刚刚高潮得太厉害了，她喷涌而出的高潮用她闪闪发光的蜂蜜浸透了他的脸。她跌倒在手和膝盖上，呻吟着，颤抖着，因为痉挛的高潮折磨着她的身体和心灵。");
         outputText("[pg]乔乔看到了他的机会，以惊人的速度，他站了起来，骑在艾米莉的身上，像一头发情的野兽一样从后面骑上了她。即使你离得那么远，你也能听到他那巨大的肉棒刺穿艾米莉湿透的褶皱时发出的湿润的吧唧声，甚至比艾米莉淫荡的快乐欢呼声还要大。对于一个骨架如此之小的人来说，乔乔的动作有着令人惊讶的自信和力量。他的" + (get_noFur() ? "" : "长着白毛的") + "臀部开始以用力、快速的动作刺入艾米莉。没有了主导伴侣的束缚，他变得像一只野生动物，不顾她的快乐地操她——只有令人窒息的、吞噬一切的繁殖需求。老鼠的阴道汁液溅在地上的轻柔的滴答声提醒你艾米莉同样的紧迫感——她正在享受像野兽一样被无意识地骑乘，像她心甘情愿成为的毫无价值的精液垃圾堆一样被粗暴地贬低和肉体上的蹂躏。");
         outputText("[pg]这只像魅魔一样的鼠" + (get_noFur() ? "娘" : "") + "不安分的恶魔尾巴在乔乔的腿间来回抽动，然后像蛇一样，向他肿胀的精囊袭去。它缠绕在他的阴囊顶部，紧紧地拉扯着，完美地勾勒出他那巨大的性腺在" + (get_noFur() ? "" : "长着浅毛的") + "皮肤下的形状。对这新的事态发展感到苦恼，但又没有放慢他那野兽般猛击的快速步伐，他仰起头，发出了一声尖锐的、女性化的、无能为力的不满的吱吱声。");
         outputText("[pg][say: 别……嗯……像个……嗯……婴儿，]这个恶魔般的女人在每次对她的小穴的震动冲击之间责骂道，[say: 我不……呃……想……哦……你射……啊……太早了。]");
         outputText("[pg]当然，听到她的声音随着他疯狂的猛击而起伏，驱使着乔乔继续前进，助长了他变态欲望的疯狂火焰。老鼠的臀部抽动得更快了，艾米莉的整个身体开始因为他打击的力量而颤抖。他被绑住的蛋蛋危险地摇晃着，随着他肿胀的粗壮的每一次重击，嘈杂地拍打着艾米莉湿透的阴阜。女孩除了呻吟和颤抖之外，什么也不做了，她的声音最终被闷成了咕噜声和无声的享受的吱吱声，因为这只无情的鼠男孩驯服了这只过于大胆的雌性，打破了她对她那吧唧作响的婊子驯兽师的主导狂热。");
         outputText("[pg]乔乔抓住她的头发，一边操她一边拉扯，在她的耳边咆哮。你可以看到他的蛋蛋在束缚中上下摆动和抽搐。他们如此努力地想要射精，然而，艾米莉那像老虎钳一样紧的尾巴却把所有的精液都憋在了里面。乔乔的阴囊甚至似乎在它们液体的重量压力下肿胀起来。在他疯狂的绝望中，这只雄性老鼠开始咬艾米莉的耳朵，用野性的统治姿态让她屈服。这似乎得到了回报，因为这只堕落的鼠娘开始颤抖和摇晃，在她的高潮中失去了一点肌肉控制。她的尾巴松开了，虽然没有完全松开，但也足以让乔乔那明显脉动的阴囊释放出一直憋在里面的精液海啸，并强行打开它。你看到他的眼睛紧闭，然后艾米莉的肚子开始微微隆起。他的臀部颤抖着，隆起变大了。这似乎持续了很长时间——乔乔发出轻微的移动和快乐的叹息，艾米莉的肚子变得越来越充满精液。直到你意识到她的肚子已经碰到了地面，你才真正意识到她变得有多大。在这位前僧侣最终受够了并退出，用他最后几根浓稠的种子冲洗她之前，它随着液体的粗壮而颤抖和摇晃。");
         outputText("[pg]乔乔退后一步，微笑着，观察着他的杰作。他的肉棒甚至从未软下来过。如果有什么不同的话，你看到他的蛋蛋肿胀回了它们正常的大小——嗯，自从你改变他以来的正常大小。他又开始漏出先锋汁了，当他跑向树林时，你不得不怀疑他是不是去腐化林地看那朵花了。艾米莉侧躺着，抱着她那塞满精液的肚子，在试图恢复时发出轻柔的快乐的咩咩声。");
         outputText("[pg]你偷偷地从石头上滑下来，穿好衣服。");
         if(get_player().hasVagina())
         {
            outputText("直到你注意到你的胯部有多湿，你才意识到你也已经自慰了几次高潮。");
         }
         else
         {
            outputText("直到你注意到你的头脑有多清醒，你才意识到你在看着这对情侣时自慰了。");
         }
         outputText("也许你还能再次抓住他们正在做的事？");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function agreeToMeditate() : void
      {
         jojoSprite();
         clearOutput();
         outputText("你觉得这有助于你理清思绪，于是接受了他的提议。他示意你坐在他身边。");
         doNext(jojoFollowerMeditate);
      }
      
      public function acceptOfferOfHelp() : void
      {
         clearOutput();
         jojoSprite();
         outputText("[say: 感谢玛莱。你比我强大得多，我的朋友……承受了这么多的腐化，却依然能保持理智。但我们还是不要试探命运了，] 他在你们开始之前说道。[pg]");
         doClear = false;
         jojoFollowerMeditate();
      }
      
      public function acceptJojosApology() : void
      {
         clearOutput();
         jojoSprite();
         outputText("你原谅了他打你的事，并为自己吓到他而道歉，这让他松了一口气。[pg]");
         outputText("[say: 谢谢，能遇到一张友善的面孔真是让人松了一口气，]他说道，嘴角泛起一丝微笑。[say: 噢，我真是太失礼了！][pg]");
         lowCorruptionIntro();
      }
      
      public function acceptJojoIntoYourCamp() : void
      {
         jojoSprite();
         if(get_player().hasStatusEffect(StatusEffects.EverRapedJojo) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,550) == 1)
         {
            outputText("你邀请乔乔留在你的营地，但还没等你把话说完，他就摇了摇头表示“不”，然后大步走进了树林，似乎想起了什么。");
         }
         else
         {
            clearOutput();
            outputText("你邀请乔乔留在你的营地。他歪着头思考着，抚摸着他那老鼠般的胡须。");
            outputText("[pg][say: 是的，这是明智之举。我们在一起会更安全，如果你愿意，我可以在晚上守夜，赶走一些怪物。我去收拾一下东西，马上就来！]");
            outputText("[pg]乔乔窜进灌木丛，一眨眼就不见了。以他的性子，肯定会比你先到营地！");
            get_player().createStatusEffect(StatusEffects.PureCampJojo,0,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function BJRidesGETYOUONE() : void
      {
         get_amilyScene().amilySprite();
         clearOutput();
         outputText("你走进视野，心知肚明地问到底在吵什么。艾米莉温顺地拜倒在你面前，道歉说：[say: 对不起，[master]，我只是想帮你的小男娼学会更好地满足你的需求。]你等了一会儿，刚好够让她感到紧张。空气中弥漫着令人窒息的停顿，你的两个鼠娘妓女看起来越来越担心，她们那像雷达一样的大耳朵不安地抽动着，等待着你的回应。你笑着解开你的[armor]，问艾米莉如果没有合适的“教学工具”，她打算怎么教。");
         outputText("[pg]这只被魅魔污染的老鼠抬起头看着你，她那双慵懒的大眼睛里满是欲望。[say: 遵命，[master]，] 她站起身来，急切地低语着，她那铲状的尾巴卷在乔乔的脖子后面，把他拉得离你更近。你掏出[oneCock]，它在他们面前诱人地晃荡着，前后摇摆的节奏对你那可怜的、堕落的荡妇们来说似乎有一种催眠的魔力。他们死死盯着你的[cock biggest]，仿佛那是世界上唯一的东西。面对你那摇晃的男子气概的不可抗拒的诱惑，就连乔乔那不情愿的态度也烟消云散了。他像他的老师一样急切地坐在你的[feet]，他的表情是一副令人着迷的生殖器崇拜的狂喜画像。");
         outputText("[pg]艾米莉握住你的[cock biggest]，在开始她的讲座之前，带着崇拜的敬意开始抚摸它。[say: 在真正开始之前，确保你已经引起了[master]的注意是很重要的，特别是如果[he]还没有完全硬起来的话。正如你所看到的，[name]已经对我对[his]肉棒的奉献感到满意了。当然，直接的方法通常也同样有——] 艾米莉打断了自己的话，把");
         if(get_player().biggestCockArea() > 50)
         {
            outputText("尽可能多的[cock biggest]");
         }
         else
         {
            outputText("你整根[cock biggest]");
         }
         outputText("塞进她的嘴里和喉咙里。你宠物那肿胀的、因堕落而充血的吸精小嘴紧紧包裹着你的阳具，带来阵阵酥麻的快感，当她吞咽时，她小心翼翼地用舌头引导着敏感的下侧，[eachCock]很快就硬成了一根完全勃起、跳动着的肉棒。你忍不住为这熟练的口交而呻吟，当艾米莉过了一会儿松开嘴时，她看起来对自己非常满意。");
         outputText("[pg][say: 我们的[master]非常享受熟练的嘴巴带来的湿润吸吮，而满足[him]本身就是一种堕落的乐趣。光是把[him]含在嘴里就让我湿透了！] 艾米莉一边继续抚摸你一边叫道。乔乔的目光从手淫上移开了一会儿，看到了艾米莉下体挂着的淫液拉丝，他色情地呻吟着。艾米莉几乎没有注意到，她太专注于取悦你的[cock biggest]，根本不在乎乔乔的不专心。她用整齐均匀的动作套弄着你那沾满口水的工具，从[sheath]一直到[cockHead biggest]。你叹了口气，把[hips]向前挺了挺，让她能更好地接触到你兴奋的下体，并得到更多的鼓励。");
         outputText("[pg]感觉到你的需求，艾米莉开始加快套弄的速度，同时继续她的指导：[say: 做这个的时候，你必须注意你的[master]的身体。看到那些小抽动了吗，[his][hips]和肉棒是怎么为[his]小荡妇跳动的？这意味着我是一个好精盆。我让[his]肉棒很开心。] 乔乔点点头，舔了舔嘴唇，全神贯注地看着艾米莉热情地伺候你那跳动的工具。[say: 你不能在这里慢下来，] 艾米莉继续说道，然后往她的另一只手上吐了口唾沫，举起手来抚摸你长长的阴茎。你那闪闪发光的肉棒轻松地滑过艾米莉粉红色的手掌，空气中弥漫着湿润的吧唧声，让你那两只老鼠的嘴唇都流出了口水。");
         outputText("[pg]当艾米莉在工作时，乔乔越来越靠近他的女性同伴，他们依偎得如此之近，以至于很快就脸贴脸，耳朵贴着耳朵。这位女性精液瘾君子大方地把你的[cock biggest]指向这位前僧侣，他紧张地舔着你的[cockHead biggest]，每一次舔舐都比上一次更快、更急切。很快，他就把整个龟头吸进嘴里，让艾米莉把预精液挤在他扭动的舌头上。乔乔斗鸡眼似地看着鼻子底下那充满激情的套弄，而你另一个精盆则用淫荡的、鼓励的话语怂恿他。[say: 你天生就是个吸精的料，乔乔。恶魔们对我们的看法是对的……我们注定要服侍强者。] 她叹了口气，低语道：[say: ……我们的[master]。]");
         outputText("[pg]你因为[cock biggest]受到的双重刺激而呻吟。四只眼睛抬起头来，在服侍你时快乐地闪烁着，他们急切的奉献几乎让你当场高潮，把喷射的精液射进他们那淫荡的小");
         if(!get_amilyScene().amilyFurry())
         {
            outputText("嘴里");
         }
         else
         {
            outputText("口鼻");
         }
         outputText("几乎无法抗拒。艾米莉似乎感觉到了这一点，顺从地献上身体供你发泄。[say:[Master]，你想填满你这精液母狗的小穴还是嘴巴？或者你想让你这小母狗尝尝味道？]");
         outputText("[pg]你要射在哪里？");
         menu();
         addButton(0,"艾米莉的嘴巴",fillAmilysMouth);
         if(get_player().get_tallness() > 55)
         {
            addButton(1,"艾米莉的小穴",stuffAmilysMouthWithPostBJCUM);
         }
         else
         {
            addButtonDisabled(1,"艾米莉的小穴","这个场景需要你足够高。");
         }
         addButton(2,"乔乔的嘴",fillJojosMouthWithHotStickyCum);
      }
   }
}

