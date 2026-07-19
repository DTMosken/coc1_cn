package classes.scenes
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.ImageManager;
   import classes.ItemTools;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes._Exploration.SaveContent;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.explore.ExploreDebug;
   import classes.statusEffects.MermaidWateredDebuff;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.Either;
   
   public class Exploration extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var exploreDebug:ExploreDebug;
      
      public var doneMermaidWalk:Boolean;
      
      public var currArea:Function;
      
      public var _normalExploreEncounter:Encounter;
      
      public function Exploration()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "explore";
         saveContent = new SaveContent(null,null,null,null,null);
         _normalExploreEncounter = null;
         doneMermaidWalk = false;
         exploreDebug = new ExploreDebug();
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function wagonOneoff() : void
      {
         saveContent.foundWagon = true;
         clearOutput();
         outputText("在探索这片荒凉的土地时，你在这条似乎曾经是土路的中央发现了一辆翻倒的马车。这些年来，大自然已经侵蚀了这条小路，但在早已废弃的痕迹中，深深的车辙印依然依稀可见。马车本身也饱经风霜：除了翻倒之外，它还受到了时间和天气的无情摧残。");
         outputText("[pg]尽管木头已经腐烂，金属也生了锈，你还是决定在这堆旧残骸中翻找一下，以防还有什么有用的东西留下。从后面堆放的兽皮来看，这辆马车的主人似乎是个制革匠。起初，你不确定这里是否还有什么可以回收的东西，但奇迹般地，你居然找到了一套皮甲，它似乎保存得还算完好。你把找到的东西折叠起来塞进背包，然后继续搜索。在更靠后的地方，你在一个毛绒兔子旁边找到了一本破旧的小日记本。这个玩具已经破烂不堪——里面的填充物从几处裂口溢出，其中一只纽扣眼睛也被扯掉了。");
         outputText("[pg]你希望这本日记能保存得稍微好一点，于是你打开了它，但失望地发现大部分书页都已经腐烂了。不过，你还是在快结尾的地方找到了一段部分完好的文字，内容如下：");
         outputText("[pg][say: ——爸说我们只离开一小会儿，但我觉得他在撒谎。我晚上能听到他和妈妈在哭。我觉得他们也想念奶奶和叔叔。我不知道我们为什么要离开，我想和莎莉、贝卡还有格蕾丝夫人待在一起。这里一点也不好玩，但当叔叔说我们应该留下来时，爸爸对他发了很大的火。妈妈说一切都会好起来的，这只是一次小小的冒险，但什么样的冒险会让每个人都皱眉头呢？[pg]我听到一个声音。爸爸让我待在马车里，他出去看看。我很害怕，但斯塔芬顿爵士和我在一起，所以会没事的]");
         outputText("[pg]没有更多内容了。你合上书，把它放回马车里，然后转身离开。");
         get_inventory().takeItem(get_armors().TATTERL,get_camp().returnToCampUseOneHour);
      }
      
      public function tryDiscover() : void
      {
         clearOutput();
         get_player().location = "荒野";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2297,FlagDict_Impl_.arrayReadInt(_loc1_,2297) + 1);
         get_normalExploreEncounter().execEncounter();
      }
      
      public function skeletonSkull() : void
      {
         clearOutput();
         outputText("徒手把它撬下来有点困难，但最终你还是做到了，把头骨从它前主人的身上拔了下来。你注视着这副死气沉沉的面容，端详着它苍白、被太阳晒得发白的光泽。空洞的眼睛盯着你，你惊讶于它在你手中是如此之轻。你本以为在生命中如此重要的东西现在会更有分量，但事实并非如此。");
         outputText("[pg]你把这些想法抛在脑后，把头骨和其他物品收起来，继续前进，脑海中闪过一个模糊的念头：你不想成为某个旅行者的纪念品。");
         get_inventory().takeItem(get_useables().SKULL,get_camp().returnToCampUseOneHour);
      }
      
      public function skeletonLeave() : void
      {
         clearOutput();
         outputText("最后看了一眼那具旧骨架，你转过身继续前进。最好不要去想那些事情，最好还是低下头，专注于生存。这样你才能避免落得和他一样的下场。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function skeletonGrave() : void
      {
         clearOutput();
         outputText("你找到了一个不错的地方，用手挖了一个足够合适的坑。这是一项艰苦的工作，但天气已经对这些遗骸造成了很大的破坏，所以你不需要挖太大的坑。没过多久，你觉得工作完成了，就把骨头收集起来，放进它们最后的安息之地。");
         outputText("[pg]把它们放进去后，你把坑填满，然后退后一步欣赏你的杰作。这可能没什么大不了的，但你愿意想象，不管那曾经是谁，都会在某种程度上心存感激。在你转身准备再次面对这个世界之前，你的脸上露出了一丝微笑。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function runEncounter(param1:Function) : void
      {
         currArea = param1;
         param1();
      }
      
      public function reset() : void
      {
         saveContent.foundWagon = false;
         saveContent.foundSkeleton = false;
         saveContent.foundUrtaHalberd = false;
         saveContent.desertWaterNeeded = false;
         saveContent.cragWaterNeeded = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function mermaidWalk() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null as String;
         clearOutput();
         var _loc1_:Consumable = mermaidPickFluid();
         _loc3_ = get_player().location;
         if(_loc3_ == "沙漠")
         {
            _loc2_ = !saveContent.desertWaterNeeded;
            saveContent.desertWaterNeeded = true;
         }
         else if(_loc3_ == "火山岩山")
         {
            _loc2_ = !saveContent.cragWaterNeeded;
            saveContent.cragWaterNeeded = true;
         }
         else
         {
            _loc2_ = true;
         }
         if(_loc2_)
         {
            _loc3_ = get_player().location;
            if(_loc3_ == "沙漠")
            {
               outputText("一进入沙漠，被太阳烤得滚烫的沙子立刻刺激了你的[underbody.skinfurscales]，吸干了你鱼尾上的水分。这让你感到痛苦，但你还是继续往前走了一段，忍受着干燥沙漠空气的严酷，直到你开始剧烈咳嗽。你伸手去拿水，或者任何水分，渴望得到某种缓解。");
            }
            else if(_loc3_ == "火山岩山")
            {
               outputText("当你登上岩石地形时，温度急剧上升。干燥、开裂的岩石、灰烬和土壤是你唯一能站立的地方，摸起来都滚烫。还能看到熔岩流。仅仅是想象穿越这样的土地就让人感到痛苦。你鱼尾上的肌肉紧绷起来。你的喉咙紧缩，让你咳得嗓子都哑了。你[i:need]一些水分。");
            }
            else
            {
               outputText("mermaidWalk的位置无效");
            }
         }
         if(_loc1_ == null)
         {
            currArea = null;
            if(_loc2_)
            {
               outputText("[pg]你的[inventory]里没有合适的东西，这让你的焦虑感上升。在目前的状态下，你无法面对这种地形，所以你强迫自己转身撤退回营地。下次带点喝的来……");
               get_player().changeFatigue(30);
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("[pg]你现在的状态无法应对，你需要带额外的液体。");
               doNext(doExplore);
            }
            return;
         }
         if(!_loc2_)
         {
            outputText("[pg]你滑行进入越来越热、越来越干燥、越来越无情的地形。这令人望而生畏，但你喝下了" + Utils.cnName(_loc1_.get_longName()) + "并继续前进。[pg]");
            _loc1_.useItem();
         }
         else if(_loc1_ == get_consumables().S_WATER)
         {
            outputText("[pg]你的[hand]抓紧了从米内瓦住处拿来的水瓶。你急忙把它举到唇边一饮而尽。纯净清澈的水给你带来了无与伦比的慰藉。下次你应该多带点，你不确定只靠这点水能走多远。");
         }
         else if(_loc1_ == get_consumables().IZYMILK || _loc1_ == get_consumables().M__MILK)
         {
            outputText("[pg]分别前，一位可爱的牛娘给了你她的奶，瓶子还在你的[inventory]里。你感到一丝安慰，取出这份补给急忙喝了下去。" + (get_player().location == "沙漠" ? "干旱沙丘" : "焦枯大地") + "带来的痛苦稍微减轻了一些，但你并不会享受这个过程。至少，下次你应该找些干净的[i:water]来代替。");
         }
         else
         {
            outputText("[pg]你的[hand]抓紧了随身携带的" + Utils.cnName(_loc1_.get_longName()) + "。极度渴望水分的你，只能做你必须做的事。[pg]");
            _loc1_.useItem();
            outputText("[pg]这不是个理想的解决办法，但它让你免于倒下。至少，下次你应该找些干净的[i:water]来代替。");
         }
         get_player().consumeItem(_loc1_);
         var _loc4_:MermaidWateredDebuff = get_player().createOrFindStatusEffect(StatusEffects.MermaidDehydrated);
         if(get_player().location == "火山岩山")
         {
            _loc4_.increase();
         }
         doneMermaidWalk = true;
         doNext(currArea);
      }
      
      public function mermaidPickFluid() : Consumable
      {
         var _loc3_:* = null as Consumable;
         var _loc6_:* = null as Array;
         var _loc1_:Array = [get_consumables().S_WATER,get_consumables().IZYMILK,get_consumables().M__MILK];
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            if(get_player().hasItem(_loc3_))
            {
               return _loc3_;
            }
         }
         var _loc4_:Array = ItemTools.withoutTags(ItemTools.withTags(ItemTools.consumables(get_player().itemSlots),"Fluid"),"Special");
         if(int(_loc4_.length) <= 0)
         {
            return null;
         }
         var _loc5_:Array = ItemTools.withoutTags(_loc4_,"Transformative");
         if(int(_loc5_.length) > 0)
         {
            _loc6_ = _loc5_;
            return _loc6_[Utils.rand(int(_loc6_.length))];
         }
         _loc6_ = _loc4_;
         return _loc6_[Utils.rand(int(_loc6_.length))];
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_normalExploreEncounter() : Encounter
      {
         var _gthis:Exploration;
         var _loc2_:* = null as Encounter;
         var _loc3_:* = null as Either;
         var _loc4_:* = null as Object;
         var _loc5_:* = null as Encounter;
         var _loc6_:* = null as Either;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as Encounter;
         var _loc9_:* = null as Either;
         var _loc10_:* = null as Object;
         var _loc11_:* = null as Encounter;
         var _loc12_:* = null as Either;
         var _loc13_:* = null as Object;
         var _loc14_:* = null as Encounter;
         var _loc15_:* = null as Either;
         var _loc16_:* = null as Object;
         var _loc17_:* = null as Encounter;
         var _loc18_:* = null as Either;
         var _loc19_:* = null as Object;
         var _loc20_:* = null as Encounter;
         var _loc21_:* = null as Either;
         var _loc22_:* = null as Object;
         var _loc23_:* = null as Encounter;
         var _loc24_:* = null as Either;
         var _loc25_:* = null as Object;
         var _loc26_:* = null as Encounter;
         var _loc27_:* = null as Either;
         var _loc28_:* = null as Object;
         var _loc29_:* = null as Encounter;
         var _loc30_:* = null as Either;
         _gthis = this;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_normalExploreEncounter == null)
         {
            _loc2_ = get_game().commonEncounters.get_withImpGob();
            _loc3_ = OneOf_Impl_.fromA(get_game().lake.discover);
            _loc4_ = _loc1_.not(get_game().lake.isDiscovered);
            _loc5_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("lake",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc4_,_loc3_,null));
            _loc6_ = OneOf_Impl_.fromA(get_game().desert.discover);
            _loc7_ = _loc1_.all([_loc1_.not(get_game().desert.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().lake.isDiscovered)]);
            _loc8_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("desert",EncounterChance_Impl_.fromFloatConst(0.33),_loc7_,_loc6_,null));
            _loc9_ = OneOf_Impl_.fromA(get_game().mountain.discover);
            _loc10_ = _loc1_.all([_loc1_.not(get_game().mountain.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().desert.isDiscovered)]);
            _loc11_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("mountain",EncounterChance_Impl_.fromFloatConst(0.33),_loc10_,_loc9_,null));
            _loc12_ = OneOf_Impl_.fromA(get_game().plains.discover);
            _loc13_ = _loc1_.all([_loc1_.not(get_game().plains.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().mountain.isDiscovered)]);
            _loc14_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("plains",EncounterChance_Impl_.fromFloatConst(0.33),_loc13_,_loc12_,null));
            _loc15_ = OneOf_Impl_.fromA(get_game().swamp.discover);
            _loc16_ = _loc1_.all([_loc1_.not(get_game().swamp.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().plains.isDiscovered)]);
            _loc17_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("swamp",EncounterChance_Impl_.fromFloatConst(0.33),_loc16_,_loc15_,null));
            _loc18_ = OneOf_Impl_.fromA(get_game().glacialRift.discover);
            _loc19_ = _loc1_.all([_loc1_.not(get_game().glacialRift.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().swamp.isDiscovered),_loc1_.ifLevelMin(10)]);
            _loc20_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("glacial_rift",EncounterChance_Impl_.fromFloatConst(0.25),_loc19_,_loc18_,null));
            _loc21_ = OneOf_Impl_.fromA(get_game().volcanicCrag.discover);
            _loc22_ = _loc1_.all([_loc1_.not(get_game().volcanicCrag.isDiscovered),EncounterChance_Impl_.fromBoolFun(get_game().swamp.isDiscovered),_loc1_.ifLevelMin(15)]);
            _loc23_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("volcanic_crag",EncounterChance_Impl_.fromFloatConst(0.25),_loc22_,_loc21_,null));
            _loc24_ = OneOf_Impl_.fromA(gargoyle);
            _loc25_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1165) == 0;
            });
            _loc26_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("cathedral",EncounterChance_Impl_.fromFloatConst(0.1),_loc25_,_loc24_,null));
            _loc27_ = OneOf_Impl_.fromA(get_game().lumi.lumiEncounter);
            _loc28_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,53) == 0;
            });
            _loc29_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("lumi",EncounterChance_Impl_.fromFloatConst(0.1),_loc28_,_loc27_,null));
            _loc30_ = OneOf_Impl_.fromA(get_game().giacomoShop.giacomoEncounter);
            _normalExploreEncounter = Encounters.group("explore",_loc2_,_loc5_,_loc8_,_loc11_,_loc14_,_loc17_,_loc20_,_loc23_,_loc26_,_loc29_,EncounterOrDef_Impl_.fromDef(new EncounterDef("giacomo",EncounterChance_Impl_.fromFloatConst(0.2),null,_loc30_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("telly",EncounterChance_Impl_.fromFloatConst(0.02),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.get_time().days > 7;
            }),OneOf_Impl_.fromA(get_game().bazaar.telly.hospiTellyty),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("loleasteregg",EncounterChance_Impl_.fromFloatConst(0.01),null,OneOf_Impl_.fromA(function():void
            {
               _gthis.outputText("你四处游荡，徒劳地寻找新的地方。");
               _gthis.doNext(_gthis.get_camp().returnToCampUseOneHour);
            }),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("wagon",EncounterChance_Impl_.fromFloatConst(0.005),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.saveContent.foundWagon;
            }),OneOf_Impl_.fromA(wagonOneoff),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("skeleton",EncounterChance_Impl_.fromFloatConst(0.005),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.saveContent.foundSkeleton;
            }),OneOf_Impl_.fromA(SkeletonOneoff),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("urtahalberd",EncounterChance_Impl_.fromFloatConst(0.05),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(!_gthis.saveContent.foundUrtaHalberd)
               {
                  return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == -1;
               }
               return false;
            }),OneOf_Impl_.fromA(getUrtaHalberd),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("aliceball",EncounterChance_Impl_.fromFloatConst(0.05),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_game().get_silly())
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().aliceScene.aliceBallEncounter),null)));
         }
         return _normalExploreEncounter;
      }
      
      public function get_debugName() : String
      {
         return "探索";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getUrtaHalberd() : void
      {
         saveContent.foundUrtaHalberd = true;
         clearOutput();
         outputText("有那么一瞬间，当你漫无目的地[walk]时，你发誓你看到了一个尖塔，但你似乎再也找不到它了。从前面的树木来看，无论你在哪里，都一定是森林的边缘。抱着希望能找到你停下来之前瞥见的痕迹的希望，你在附近区域漫步，欣赏着风景。");
         outputText("[pg]一道金属的反光引起了你的注意。你走过去，看到草丛中躺着一把长柄武器，几乎难以察觉。你以前见过这种武器——在特尔阿德雷。如果你没认错的话，乌尔塔就用过这种武器。你把它捡起来仔细端详，眉头因一丝担忧而皱起。你将戟尖朝上立着，然后坐了下来。万一她就在附近呢……你会在这里逗留。至少待一会儿。");
         get_inventory().takeItem(get_weapons().URTAHLB,get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyle() : void
      {
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,825) == "")
         {
            get_game().gargoyle.gargoylesTheShowNowOnWBNetwork();
         }
         else
         {
            get_game().gargoyle.returnToCathedral();
         }
      }
      
      public function doExplore() : void
      {
         var encounter10:Function;
         var _g10:Exploration;
         var encounter9:Function;
         var _g9:Exploration;
         var encounter8:Function;
         var _g8:Exploration;
         var encounter7:Function;
         var _g7:Exploration;
         var encounter6:Function;
         var _g6:Exploration;
         var encounter5:Function;
         var _g5:Exploration;
         var encounter4:Function;
         var _g4:Exploration;
         var encounter3:Function;
         var _g3:Exploration;
         var encounter2:Function;
         var _g2:Exploration;
         var encounter1:Function;
         var _g1:Exploration;
         var encounter:Function;
         var _g:Exploration;
         var _loc1_:* = null as IMap;
         Log.trace(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2297) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) + " " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016),{
            "fileName":"src/classes/scenes/Exploration.hx",
            "lineNumber":49,
            "className":"classes.scenes.Exploration",
            "methodName":"doExplore"
         });
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2297))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2297,0);
         }
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2298,0);
         }
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2301,0);
         }
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2299,0);
         }
         if(Boolean(Math.isNaN(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300))))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2300,0);
         }
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2297) <= 0)
         {
            clearOutput();
            get_images().showImage("event-first-steps");
            outputText("你试探性地从营地边迈开脚步，保持着警觉，仔细扫视着地面与天空，提防危险。你走了将近一个小时，沿途在路过的岩石上刻下标记，好为返回营地的归途引路。让你不安的是，那道传送门在这一侧竟有一个敞开的入口，而且完全无人看守……");
            outputText("[pg]……等一下，为什么你的营地又出现在了眼前？高耸岩石的内部，传送门的光芒清晰可见。你定睛一看，一行脚印从营地另一端绕出，随即消失不见。你回头向来路望去，眼睁睁看着自己的标记在眼前凭空消散。种种迹象让你头皮发麻，忍不住反复思量——在这里，距离、方向、地理似乎都毫无意义，可你的营地却完好无损，纹丝未动。你突然茅塞顿开：自己方才脑海中正想着传送门的样子，便真的找了回来！也许，在这个空间里，记忆才是决定旅途的关键，正如现实世界中时间、距离与速度的作用一般！");
            outputText("[pg]这对发现新地点毫无帮助，但至少能让你快速返回营地。你下定决心，下次探索时定要全神贯注，学会如何在这片神弃之地中穿行。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2297,FlagDict_Impl_.arrayReadInt(_loc1_,2297) + 1);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) <= 0)
         {
            clearOutput();
            get_images().showImage("area-forest");
            outputText("你在魔域坚实而泛着淡粉色的土地上漫步了许久。锈红色的岩石点缀着这片荒原，与你到过的每一处同样寸草不生、毫无生机。一阵凉风忽然拂过你的面庞，仿佛在轻抚你以示存在感。你转身迎向它，一片植被茂密、极为古老的森林映入眼帘。你不禁微笑——这些植物看上去颇为眼熟，毫无威胁。你不由自主地想起自己当初要试探此地特性的决定，一边向前走去，一边在心中默念着你的营地。现实似乎在扭曲、变得模糊不清，令你一阵晕眩，但几分钟后，你便回到了原地，并确信自己能够以同样快的速度重返那片森林。");
            outputText("[pg]<b>你发现了森林！</b>");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2297,FlagDict_Impl_.arrayReadInt(_loc1_,2297) + 1);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2298,FlagDict_Impl_.arrayReadInt(_loc1_,2298) + 1);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("你可以继续寻找新的地点，或者探索你之前发现的地点。[pg]");
         hideMenus();
         menu();
         addButton(0,"探索",tryDiscover).hint("探索以发现新区域和新事物。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) > 0)
         {
            _g = this;
            encounter = get_game().forest.explore;
            addButton(1,"森林",function():void
            {
               _g.runEncounter(encounter);
            }).hint("探索茂密的森林。[pg]推荐等级：1" + (get_player().level < 6 ? "[pg]小心触手怪！" : "") + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) > 0)
         {
            _g1 = this;
            encounter1 = get_game().lake.explore;
            addButton(2,"湖泊",function():void
            {
               _g1.runEncounter(encounter1);
            }).hint("前往湖泊并探索海滩。[pg]推荐等级：1" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) > 0)
         {
            _g2 = this;
            encounter2 = get_game().desert.explore;
            addButton(3,"沙漠",function():void
            {
               _g2.runEncounter(encounter2);
            }).hint("探索干燥的沙漠。[pg]推荐等级：2" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) > 0)
         {
            _g3 = this;
            encounter3 = get_game().mountain.explore;
            addButton(5,"山脉",function():void
            {
               _g3.runEncounter(encounter3);
            }).hint("探索山脉。[pg]推荐等级：5" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) > 0)
         {
            _g4 = this;
            encounter4 = get_game().swamp.explore;
            addButton(6,"沼泽",function():void
            {
               _g4.runEncounter(encounter4);
            }).hint("探索潮湿的沼泽地。[pg]推荐等级：12" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) > 0)
         {
            _g5 = this;
            encounter5 = get_game().plains.explore;
            addButton(7,"平原",function():void
            {
               _g5.runEncounter(encounter5);
            }).hint("探索平原。[pg]推荐等级：10" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) : ""));
         }
         if(get_player().hasStatusEffect(StatusEffects.ExploredDeepwoods))
         {
            _g6 = this;
            encounter6 = get_game().deepWoods.explore;
            addButton(8,"幽深森林",function():void
            {
               _g6.runEncounter(encounter6);
            }).hint("探索黑暗、发着生物光的森林深处。[pg]推荐等级：5" + (get_debug() ? "[pg]探索次数：" + get_player().statusEffectv1(StatusEffects.ExploredDeepwoods) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) > 0)
         {
            _g7 = this;
            encounter7 = get_game().highMountains.explore;
            addButton(10,"高山",function():void
            {
               _g7.runEncounter(encounter7);
            }).hint("探索高山。[pg]推荐等级：10" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016) > 0)
         {
            _g8 = this;
            encounter8 = get_game().bog.explore;
            addButton(11,"泥沼",function():void
            {
               _g8.runEncounter(encounter8);
            }).hint("探索黑暗的泥沼。[pg]推荐等级：14" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) > 0)
         {
            _g9 = this;
            encounter9 = get_game().glacialRift.explore;
            addButton(12,"冰川裂谷",function():void
            {
               _g9.runEncounter(encounter9);
            }).hint("探索寒冷的冰川裂谷。[pg]推荐等级：16" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) > 0)
         {
            _g10 = this;
            encounter10 = get_game().volcanicCrag.explore;
            addButton(13,"火山岩",function():void
            {
               _g10.runEncounter(encounter10);
            }).hint("探索地狱般的火山岩。[pg]推荐等级：20" + (get_debug() ? "[pg]探索次数：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) : ""));
         }
         if(get_debug())
         {
            addButton(9,"调试",exploreDebug.doExploreDebug);
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null));
      }
      
      public function SkeletonOneoff() : void
      {
         saveContent.foundSkeleton = true;
         clearOutput();
         outputText("在营地附近的荒原探索时，你瞥见几步之外有个奇怪的白色物体。这周围几乎所有的东西都是灰尘的颜色，所以它足够显眼。你朝那个东西走去，小心翼翼地保持警惕。你附近没有任何动静，但小心点总没坏处。");
         outputText("[pg]然而，当你走近时，你意识到你已经错过了危险很多年。半埋在泥土里，盯着你看的是一个漂白的白色头骨，连着一具骨架。这是成人大小的人形骨架，周围没有任何识别标记。甚至连一块布片都没有。不管这是谁，他们早就被世界遗忘了。");
         outputText("[pg]你觉得你可以做点什么。");
         menu();
         addNextButton("坟墓",skeletonGrave).hint("这是你至少能做的。");
         addNextButton("头骨",skeletonSkull).hint("为什么不拿个纪念品呢？");
         addNextButton("离开",skeletonLeave).hint("现在为这个可怜的灵魂做什么都太迟了。");
      }
   }
}

