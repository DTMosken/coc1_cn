package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas._Forest.SaveContent;
   import classes.scenes.areas.forest.AikoScene;
   import classes.scenes.areas.forest.AkbalScene;
   import classes.scenes.areas.forest.BeeGirlScene;
   import classes.scenes.areas.forest.CorruptedGlade;
   import classes.scenes.areas.forest.DullahanScene;
   import classes.scenes.areas.forest.ErlKingScene;
   import classes.scenes.areas.forest.Essrayle;
   import classes.scenes.areas.forest.Faerie;
   import classes.scenes.areas.forest.KitsuneScene;
   import classes.scenes.areas.forest.LumberjackScene;
   import classes.scenes.areas.forest.TamaniScene;
   import classes.scenes.areas.forest.TentacleBeastScene;
   import classes.scenes.monsters.Imp;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Forest extends BaseContent implements SelfDebug, SelfSaving, IExplorable
   {
      
      public var tentacleBeastScene:TentacleBeastScene;
      
      public var tamaniScene:TamaniScene;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var lumberjackScene:LumberjackScene;
      
      public var kitsuneScene:KitsuneScene;
      
      public var globalSave:Boolean;
      
      public var faerie:Faerie;
      
      public var essrayle:Essrayle;
      
      public var erlkingScene:ErlKingScene;
      
      public var dullahanScene:DullahanScene;
      
      public var corruptedGlade:CorruptedGlade;
      
      public var beeGirlScene:BeeGirlScene;
      
      public var akbalScene:AkbalScene;
      
      public var aikoScene:AikoScene;
      
      public var _forestEncounter:Encounter;
      
      public function Forest(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "forest";
         saveContent = new SaveContent(null,null);
         _forestEncounter = null;
         lumberjackScene = new LumberjackScene();
         aikoScene = new AikoScene();
         dullahanScene = new DullahanScene();
         erlkingScene = new ErlKingScene();
         tamaniScene = new TamaniScene();
         kitsuneScene = new KitsuneScene();
         faerie = new Faerie();
         essrayle = new Essrayle();
         corruptedGlade = new CorruptedGlade();
         akbalScene = new AkbalScene();
         super();
         beeGirlScene = new BeeGirlScene(param1);
         tentacleBeastScene = new TentacleBeastScene(param1);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function tripOnARoot() : void
      {
         get_images().showImage("area-forest");
         outputText("你被一根裸露的树根绊倒了，擦伤了一点，但除此之外，这一个小时平安无事。");
         get_player().takeDamage(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tentacleBeastEncounterFn() : void
      {
         clearOutput();
         if(get_player().hasKeyItem("Dangerous Plants") && get_player().get_inte() / 2 > Utils.rand(50))
         {
            get_images().showImage("item-dPlants");
            outputText("利用《危险植物》书中的知识，你断定附近有一个触手怪的巢穴，你要继续吗？如果不继续，你可以返回营地。[pg]");
            menu();
            addButton(0,"继续",tentacleBeastScene.encounter);
            addButton(1,"后退",get_camp().returnToCampUseOneHour);
         }
         else
         {
            tentacleBeastScene.encounter();
         }
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.foundFruit = false;
         saveContent.faerieXImp = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function marbleVsImp() : void
      {
         clearOutput();
         get_images().showImage("monster-marble");
         outputText("当你在树林中穿行时，突然听到前方传来叫喊声，紧接着是一声巨响和惨叫，一个小恶魔高速穿过树叶飞了过来，撞在了附近的一棵树上。这个小恶魔慢慢地从树上滑下来，落在了树根处，一动不动。片刻之后，一个看起来很眼熟的牛娘穿过灌木丛，挥舞着一把巨大的双手锤，脸上带着愤怒的表情。");
         outputText("[pg]她走到小恶魔面前，踢了它一脚。确认这生物不再动弹后，她转过身面对你，给了你一个微笑。[say: 抱歉，但我更喜欢快速解决这些小麻烦。如果它们有机会叫来朋友，它们实际上会变成一个麻烦。] 她短暂地消失在树叶中，然后再次出现，腋下夹着两大堆原木，背上绑着一把消防斧和她的锤子。[say: 如你所见，我正在为农场收集木柴；是什么风把你吹到森林里来了，亲爱的？] 你告诉她你只是在探索。");
         outputText("[pg]她发出一声惆怅的叹息。[say: 自从来到农场后，我还没怎么探索过。在惠特尼给我的工作、保持锤子的练习、挤奶以确保我不会太胀、做饭和睡美容觉之间，我没有太多空闲时间做其他事情。] 她又叹了口气。[say: 好了，我得把这个带回去了，回头见！]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) > 0;
      }
      
      public function get_forestEncounter() : Encounter
      {
         var _g:CommonEncounters;
         var _gthis:Forest;
         var _loc2_:* = null as Encounter;
         var _loc3_:* = null as Either;
         var _loc4_:* = null as Encounter;
         var _loc5_:* = null as Encounter;
         var _loc6_:* = null as Either;
         var _loc7_:* = null as Encounter;
         var _loc8_:* = null as CorruptedGlade;
         var _loc9_:* = null as Either;
         var _loc10_:* = null as Encounter;
         var _loc11_:* = null as Either;
         var _loc12_:* = null as Object;
         var _loc13_:* = null as Encounter;
         var _loc14_:* = null as Either;
         var _loc15_:* = null as Encounter;
         var _loc16_:* = null as Either;
         var _loc17_:* = null as Encounter;
         var _loc18_:* = null as Either;
         var _loc19_:* = null as Object;
         var _loc20_:* = null as Encounter;
         var _loc21_:* = null as Either;
         var _loc22_:* = null as Object;
         var _loc23_:* = null as Encounter;
         var _loc24_:* = null as Encounter;
         var _loc25_:* = null as Either;
         var _loc26_:* = null as Encounter;
         var _loc27_:* = null as Either;
         var _loc28_:* = null as Encounter;
         var _loc29_:* = null as Either;
         var _loc30_:* = null as Encounter;
         var _loc31_:* = null as Either;
         var _loc32_:* = null as Encounter;
         var _loc33_:* = null as Encounter;
         var _loc34_:* = null as Encounter;
         var _loc35_:* = null as Encounter;
         var _loc36_:* = null as LumberjackScene;
         var _loc37_:* = null as Either;
         var _loc38_:* = null as Object;
         _gthis = this;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_forestEncounter == null)
         {
            _loc2_ = get_game().commonEncounters.get_withImpGob();
            _loc3_ = OneOf_Impl_.fromB(tamaniScene);
            _loc4_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,EncounterChance_Impl_.fromFloatConst(0.15),null,_loc3_,null));
            _loc5_ = get_game().jojoScene.get_jojoForest();
            _loc6_ = OneOf_Impl_.fromB(essrayle.forestEncounter);
            _loc7_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,EncounterChance_Impl_.fromFloatConst(0.1),null,_loc6_,null));
            _loc8_ = corruptedGlade;
            _loc9_ = OneOf_Impl_.fromB(get_camp().cabinProgress.get_forestEncounter());
            _loc10_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,EncounterChance_Impl_.fromFloatConst(0.5),null,_loc9_,null));
            _loc11_ = OneOf_Impl_.fromA(get_game().deepWoods.discover);
            _loc12_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) >= 20)
               {
                  return !_gthis.get_player().hasStatusEffect(StatusEffects.ExploredDeepwoods);
               }
               return false;
            });
            _loc13_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("deepwoods",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc12_,_loc11_,null));
            _loc14_ = OneOf_Impl_.fromA(beeGirlScene.beeEncounter);
            _loc15_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("beegirl",EncounterChance_Impl_.fromFloatConst(0.5),null,_loc14_,null));
            _loc16_ = OneOf_Impl_.fromA(tentacleBeastEncounterFn);
            _loc17_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("tentabeast",null,_loc1_.ifLevelMin(2),_loc16_,null));
            _loc18_ = OneOf_Impl_.fromA(marbleVsImp);
            _loc19_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) > 0 && !_gthis.get_player().hasStatusEffect(StatusEffects.MarbleRapeAttempted) && !_gthis.get_player().hasStatusEffect(StatusEffects.NoMoreMarble) && _gthis.get_player().hasStatusEffect(StatusEffects.Marble))
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,463) == 0;
               }
               return false;
            });
            _loc20_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("marble",EncounterChance_Impl_.fromFloatConst(0.1),_loc19_,_loc18_,null));
            _loc21_ = OneOf_Impl_.fromA(get_game().goblinSharpshooterScene.meetGoblinSharpshooter);
            _loc22_ = EncounterChance_Impl_.fromBoolFun(get_game().goblinSharpshooterScene.encounterWhen);
            _loc23_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("goblinSharpshooter",get_game().goblinSharpshooterScene.encounterChance,_loc22_,_loc21_,null));
            _loc24_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("trip",null,null,OneOf_Impl_.fromA(tripOnARoot),null));
            _loc25_ = OneOf_Impl_.fromA(findChitin);
            _loc26_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("chitin",EncounterChance_Impl_.fromFloatConst(0.05),null,_loc25_,null));
            _loc27_ = OneOf_Impl_.fromA(findHPill);
            _loc28_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("healpill",EncounterChance_Impl_.fromFloatConst(0.1),null,_loc27_,null));
            _loc29_ = OneOf_Impl_.fromA(findTruffle);
            _loc30_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("truffle",EncounterChance_Impl_.fromFloatConst(0.35),null,_loc29_,null));
            _g = get_game().commonEncounters;
            _loc31_ = OneOf_Impl_.fromA(function():void
            {
               _g.bigJunkForestScene();
            });
            _loc32_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("bigjunk",get_game().commonEncounters.bigJunkChance,null,_loc31_,null));
            _loc33_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",null,null,OneOf_Impl_.fromA(forestWalkFn),null));
            _loc34_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("fruit",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.saveContent.foundFruit;
            }),OneOf_Impl_.fromA(fruitOneoff),null));
            _loc35_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("faerieximp",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.saveContent.faerieXImp;
            }),OneOf_Impl_.fromA(faerieXImpOneoff),null));
            _loc36_ = lumberjackScene;
            _loc37_ = OneOf_Impl_.fromA(faerie.gladesScene);
            _loc38_ = EncounterChance_Impl_.fromBoolFun(faerie.gladesEnabled);
            _forestEncounter = Encounters.group("forest",_loc2_,_loc4_,_loc5_,_loc7_,_loc8_,_loc10_,_loc13_,_loc15_,_loc17_,_loc20_,_loc23_,_loc24_,_loc26_,_loc28_,_loc30_,_loc32_,_loc33_,_loc34_,_loc35_,_loc36_,EncounterOrDef_Impl_.fromDef(new EncounterDef("corrupted glade faerie",EncounterChance_Impl_.fromFloatConst(0.05),_loc38_,_loc37_,null)));
         }
         return _forestEncounter;
      }
      
      public function get_debugName() : String
      {
         return "Forest";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fruitPass() : void
      {
         clearOutput();
         outputText("你在玛瑞斯的时光[if (days < 30) {已经}]很好地教会了你，未知是危险的。你没有理由去吃随便在地上捡到的水果，不管它们看起来多么多汁。");
         outputText("[pg]你迅速绕过水果，继续穿过森林。接下来的探索枯燥乏味，没有发生任何值得注意的事情，直到你四肢酸痛、精神萎靡地想起营地，它很快就出现在你面前。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fruitOneoff() : void
      {
         saveContent.foundFruit = true;
         clearOutput();
         outputText("在过去的十分钟里，你已经被树根绊倒了三次，你开始真的讨厌这片森林了。这里荒凉、未开化，而且到处都是只想强奸你的生物，所有这些烦恼似乎都交织在一起，在你的脑海中盘旋。");
         outputText("[pg]你完全沉浸在自己的思绪中，直到差点撞上眼前那抹令人吃惊的黄色才回过神来。森林里出现这么不寻常的颜色，让你瞬间感到一丝担忧，但当你发现那只是一个水果时，你很快就平静了下来。");
         outputText("[pg]而且是个奇怪的水果；凑近一看，那让你惊讶的颜色依然显得很奇特。明亮、充满活力的黄橙色，上面带有醒目的红色条纹——对于这个地方来说，它似乎过于鲜艳了，就像是从别的地方来的一样。不管怎样，它似乎在这里不受打扰地生长着，而且看起来肯定已经熟了。快速环顾四周，确认没有其他东西来和你争夺这个水果。");
         outputText("[pg]也许你可以尝尝，如果你够勇敢的话……");
         menu();
         addNextButton("吃掉",fruitEat).hint("享受一下生活吧。");
         addNextButton("谨慎",fruitPass).hint("你不知道它会产生什么影响。");
      }
      
      public function fruitEat() : void
      {
         clearOutput();
         outputText("虽然你不知道这到底是什么水果，但它看起来太诱人了，不容错过。你迅速把它从茎上摘下来，对它的重量感到惊讶。它一定特别多汁。质地光滑有光泽，果肉似乎相当结实。在手里转了一圈，你没有发现任何瑕疵或迹象表明它可能不安全，所以事不宜迟，你把它举到嘴边。");
         outputText("[pg]你的牙齿压在紧绷的果皮上，只遇到了一瞬间的阻力就咬破了它。味道立刻冲击着你——很甜，但又不会甜得发腻，只有一丝酸味来平衡。一股汁液涌入你的嘴里，你无法阻止它流下下巴滴在地上，但这无关紧要。咀嚼了一会儿果肉，你发现它嫩得恰到好处，又不会软烂，口感极佳。");
         outputText("[pg]没过多久，你就把整个水果狼吞虎咽地吃光了，只剩下中间的一个小核是你无法吞下的。这绝对令人满足，你已经感到精神焕发，准备好面对前方可能出现的任何麻烦。事实上，之前逃跑造成的酸痛已经消退了；你的双腿感觉就像刚从营地出来时一样充满活力。");
         outputText("[pg]短暂地环顾四周，你再也找不到这种奇妙的水果了。真遗憾，但这丝毫没有影响这顿点心带给你的好心情。");
         get_player().changeFatigue(-15);
         get_player().HPChange(int(Math.round(get_player().maxHP() * 0.25)),false);
         get_player().refillHunger(25);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function forestWalkFn() : void
      {
         get_images().showImage("area-forest");
         if(get_player().cor < 80)
         {
            outputText("你在树林里享受了一次宁静的散步，这给了你思考的时间。");
            dynStats(DynStat.Tou(0.5),DynStat.Inte(1));
         }
         else
         {
            outputText("当你在森林里漫步时，你一直");
            if(get_player().get_gender() == 1)
            {
               outputText("抚摸着半勃起的[cocks]，幻想着操各种各样的女人，从哭泣紧致的处女到淫荡的魅魔，她们都张着流着淫液的肉洞。");
            }
            if(get_player().get_gender() == 2)
            {
               outputText("漫不经心地玩弄着你的" + get_player().vaginaDescript(0) + "，幻想着被各种各样的怪物肉棒操，从牛头人粗大难闻的巨根到恶魔高耸凹凸不平的快感肉棒。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("交替抚摸着你的[cocks]和" + get_player().vaginaDescript(0) + "，幻想着操各种各样的女人，从哭泣紧致的处女到淫荡的魅魔，她们都张着流着淫液的肉洞，同时或者在此之前，被各种各样的怪物肉棒操，从牛头人粗大难闻的巨根到恶魔高耸凹凸不平的快感肉棒。");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("幻想着拥有巨大性征的性爱恶魔，以及你该如何取悦她们。");
            }
            outputText("");
            dynStats(DynStat.Tou(0.5),DynStat.Lib(0.25),DynStat.Lust(get_player().lib / 5));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findTruffle() : void
      {
         get_images().showImage("item-pigTruffle");
         outputText("你发现了一些不寻常的东西。走近一看，这绝对是某种松露。");
         get_inventory().takeItem(get_consumables().PIGTRUF,get_camp().returnToCampUseOneHour);
      }
      
      public function findHPill() : void
      {
         get_images().showImage("item-hPill");
         outputText("你在地上发现了一颗印有字母“H”的药丸。");
         get_inventory().takeItem(get_consumables().H_PILL,get_camp().returnToCampUseOneHour);
      }
      
      public function findChitin() : void
      {
         get_images().showImage("item-bChitin");
         outputText("你在左侧的蕨类植物中发现了一大块被遮挡的昆虫甲壳。它大部分是黑色的，外边缘有一圈亮黄色的细边。这块几丁质碎片上还附着着相当一部分黄色的绒毛。");
         if(get_game().rathazul.get_mixologyXP() == 0)
         {
            outputText("它摸起来坚固而有弹性——也许有人能用它做点什么。");
         }
         get_inventory().takeItem(get_useables().B_CHITN,get_camp().returnToCampUseOneHour);
      }
      
      public function faerieXImpWatchOneoff() : void
      {
         clearOutput();
         outputText("决定最好还是观察自然的发展，你在一个不错的有利位置安顿下来。");
         outputText("[pg]小恶魔在洞里狂乱地挥舞了几下，然后休息了一下。他擦了擦额头上的汗，然后往树干里看了看。[say:我告诉你，乖乖出来，我们就妥协。让我高潮，你就可以离开。我完事后会拔出来，你甚至不需要让自己被弄得湿透。只要出来就行！]");
         outputText("[pg]虽然你听不到回答，但最终你看到一个小妖精怯生生地爬了出来。她有着鲜艳的玫瑰红头发和透明的猩红翅膀，外表相当引人注目。除非她一直待在颜色相近的花朵周围，否则你敢打赌，在森林的绿叶和棕色树干中，大多数小恶魔都会注意到她。");
         outputText("[pg]小恶魔向妖精挥去，将她紧紧抓在手里。[say:现在我抓到你了！天哪，你真蠢。]");
         menu();
         addNextButton("攻击",faerieImpCombat).hint("够了！你必须阻止这一切！");
         addNextButton("继续",faerieXImpWatchNextOneoff).hint("你不知道事情的来龙去脉，但你很好奇。");
      }
      
      public function faerieXImpWatchNextOneoff() : void
      {
         clearOutput();
         outputText("小恶魔从他的缠腰布里掏出了他的肉棒。那巨大粗壮的红色肉体是妖精的好几倍大，有一瞬间你怀疑他是否打算尝试插入。对妖精来说幸运的是，他只是把她赤裸的身体拍在肉棒上，开始在上面摩擦她。不可否认，这仍然可能是一次不愉快的经历。");
         outputText("[pg]妖精试图尖叫和反抗，发出了许多微弱的吱吱声。随着小恶魔收紧抓握，威胁她合作，这种声音被平息了。从你的位置看不清太多，但她确实平静下来了。小恶魔松了一口气，开始更快地自慰，并发出享受的叹息。他的速度快得惊人，你怀疑这种摩擦是否会危及妖精的生命。");
         outputText("[pg]小恶魔大声呻吟着，加快速度开始射精。在达到高潮的顶点时，他把妖精拉到他那抽搐的肉棒顶端，将大部分精液直接射在她的身上。等他完事时，她已经完全被他的精液浸透了。");
         outputText("[pg]小恶魔长舒了一口气，低头看着手里那个被弄得脏兮兮的生物。[say:现在你还想逃跑吗？]他脸上带着得意的神情问道。妖精发出含糊不清的嘟囔声，不知道凑近点能不能听懂。[say:很好，]小恶魔说着，把他的受害者塞进一个小袋子里。他心情大好地走进了树林。");
         dynStats(DynStat.Cor(0.5),DynStat.Lust(20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieXImpOneoff() : void
      {
         saveContent.faerieXImp = true;
         clearOutput();
         outputText("当你沿着你能找到的最不拥挤的小路漫步时，一阵愤怒的咆哮引起了你的注意。出于条件反射，你降低身姿，摆出防御姿势，寻找声音的来源。沙沙的抓挠声伴随着沙哑的低吼，所有的动静终于吸引了你的目光。");
         outputText("[pg]在一些树叶的后面，一个小恶魔正紧紧地抓住一棵树，拼命地想从树干上的一个洞里挖出什么东西。他看起来异常沮丧。");
         outputText("[pg][say:[b:总是]差这么一点点就能抓住你们这些小婊子！] 愤怒的小恶魔大喊道。虽然很难听清，但你听到了从洞里传出的尖锐尖叫声，很可能是这里的潜在受害者。你应该干预吗？");
         menu();
         addNextButton("攻击",faerieImpCombat).hint("不过是个小恶魔！作为勇者，你肯定能对付这种基础敌人。");
         addNextButton("观察",faerieXImpWatchOneoff).hint("你不知道事情的来龙去脉，但你很好奇。");
         setExitButton("离开",faerieXImpLeaveOneoff).hint("死道友不死贫道。");
      }
      
      public function faerieXImpLeaveOneoff() : void
      {
         clearOutput();
         outputText("如此残酷的地方，但这次不关你的事。当你转身离开时，较小生物绝望的尖叫声提醒你这个世界有多么充满敌意。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function faerieImpWon(param1:Boolean) : void
      {
         clearOutput();
         outputText("小恶魔倒下了，你赶紧去抢他身上可能带着的微薄宝石。");
         outputText("[pg]他正在攻击的受害者毫无预兆地猛扑到你的脸上，在你面前几英寸处盘旋。虽然她一丝不挂，但她似乎并不害羞，脸上反而挂着非常灿烂的笑容。");
         outputText("[pg][say:谢谢你！谢谢你谢谢你谢谢你！]她高兴地尖叫着，上下挥动着手臂，以消耗多余的兴奋。她猛地向前一冲，在你的[face]上印下了一个小小的吻，然后飞走了。她向你挥手，说道：[say:我很高兴你救了我！玛莱保佑你！]");
         outputText("[pg]救下妖精可能没有实质性的奖励，但这确实让你因为做了好事而产生了一些成就感。");
         dynStats(DynStat.Cor(-1));
         get_game().combat.cleanupAfterCombat();
      }
      
      public function faerieImpLoss(param1:Boolean, param2:Boolean) : void
      {
         clearOutput();
         outputText("小恶魔因为战斗的肾上腺素而气喘吁吁，他花了一点时间来平复自己。他突然僵住了；回头一看，他意识到他的猎物肯定在某个时候逃跑了。");
         outputText("[pg][say:你……你……我追那个婊子追了[b:那么久！]我发誓，我要[b:宰了你！]]他尖叫着。当他向前跺脚时，一个妖精在周围飞舞，引起了他的注意。当他看到他的目标还没有走得太远时，他的脸上亮起了愤怒和重新燃起的兴奋的混合表情。");
         outputText("[pg]妖精把注意力转向了你。[say:谢谢你试图救我！我也不会让坏事发生在好人身上！]她大喊着，挑战着她那微弱肺活量的极限，试图让你听到。");
         outputText("[pg]当小恶魔跳起来试图抓住她时，她从他身边飞过。恶魔紧追不舍，但妖精似乎能够保持刚好足够的距离，让他有成功的希望，但又让他抓不到。两人在树林里飞舞着，越跑越远。她是否能完全逃脱，或者再次被逼入绝境，目前还不得而知，但至少你可以相对毫发无损地回家了。");
         get_game().combat.cleanupAfterCombat(get_camp().returnToCampUseOneHour,false);
      }
      
      public function faerieImpCombat() : void
      {
         var _loc1_:Imp = new Imp();
         _loc1_.onDefeated = faerieImpWon;
         _loc1_.onWon = faerieImpLoss;
         startCombatImmediate(_loc1_);
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "森林";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2298,FlagDict_Impl_.arrayReadInt(_loc1_,2298) + 1);
         get_forestEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         clearOutput();
         get_images().showImage("area-forest");
         outputText("你走了很长一段时间，漫步在恶魔界坚硬且略带粉色的土地上。铁锈红色的岩石点缀着这片荒原，和你去过的其他地方一样荒凉死寂。一阵凉风突然拂过你的脸颊，仿佛在向你致意。你转过身，迎面而来的是一片看起来非常古老的森林，枝叶繁茂。你微笑着，因为这些植物看起来相当熟悉，没有威胁感。你不由自主地想起了测试这个地方特性的决定，一边往前走，一边想着你的营地。现实似乎开始扭曲模糊，让你感到头晕目眩，但几分钟后你就回来了，并且确信你能以同样的速度返回森林。");
         outputText("[pg]<b>你发现了森林！</b>");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2297,FlagDict_Impl_.arrayReadInt(_loc1_,2297) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2298,FlagDict_Impl_.arrayReadInt(_loc1_,2298) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
   }
}

