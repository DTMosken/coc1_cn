package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
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
   import classes.scenes.areas.highMountains.BasiliskScene;
   import classes.scenes.areas.highMountains.CockatriceScene;
   import classes.scenes.areas.highMountains.Harpy;
   import classes.scenes.areas.highMountains.HarpyScene;
   import classes.scenes.areas.highMountains.IzumiScene;
   import classes.scenes.areas.highMountains.MinervaScene;
   import classes.scenes.areas.highMountains.MinotaurMobScene;
   import classes.scenes.areas.highMountains.PhoenixScene;
   import classes.scenes.areas.highMountains.WingedSpearScene;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class HighMountains extends BaseContent implements IExplorable
   {
      
      public var wingedSpearScene:WingedSpearScene;
      
      public var phoenixScene:PhoenixScene;
      
      public var minotaurMobScene:MinotaurMobScene;
      
      public var minervaScene:MinervaScene;
      
      public var izumiScenes:IzumiScene;
      
      public var harpyScene:HarpyScene;
      
      public var cockatriceScene:CockatriceScene;
      
      public var basiliskScene:BasiliskScene;
      
      public var _explorationEncounter:Encounter;
      
      public function HighMountains(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         wingedSpearScene = new WingedSpearScene();
         phoenixScene = new PhoenixScene();
         izumiScenes = new IzumiScene();
         minotaurMobScene = new MinotaurMobScene();
         harpyScene = new HarpyScene();
         super();
         basiliskScene = new BasiliskScene(param1);
         cockatriceScene = new CockatriceScene(param1);
         minervaScene = new MinervaScene(param1);
      }
      
      public function minoRouter() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3)
         {
            get_game().mountain.minotaurScene.minoAddictionFuck();
         }
         else
         {
            get_game().mountain.minotaurScene.getRapedByMinotaur(true);
            spriteSelect(SpriteDb.get_s_minotaur());
         }
      }
      
      public function leaveChickenx() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_chickenHarpy());
         get_images().showImage("area-highmountains");
         outputText("在你礼貌地拒绝了她的提议后，鸡身女妖给了你一个温暖的微笑，然后重新拉起她的推车，继续沿着山路前进。");
         outputText("[pg]你决定走自己的路，趁现在还能回去，赶紧回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) > 0;
      }
      
      public function hike() : void
      {
         clearOutput();
         get_images().showImage("area-highmountains");
         if(get_player().cor < 90)
         {
            outputText("你在高山上的徒步旅行虽然一无所获，但却让你看到了宜人的景色，并为你提供了良好的锻炼和放松。");
            dynStats(DynStat.Tou(0.25),DynStat.Spe(0.5),DynStat.Lust(get_player().lib / 10 - 15));
         }
         else
         {
            outputText("在向高山徒步的过程中，你堕落的脑海中不断回放着你最淫秽扭曲的性经历，总是幻想着能带来快感的新的变态方式。");
            outputText("[pg]没有掠食者闻到你身上散发出的强烈性气味，这简直是个奇迹。");
            dynStats(DynStat.Tou(0.25),DynStat.Spe(0.5),DynStat.Lib(0.25),DynStat.Lust(get_player().lib / 10));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function harpyEncounter() : void
      {
         clearOutput();
         get_images().showImage("encounter-harpy");
         outputText("一只鹰身女妖从天而降，向你发起了攻击！");
         unlockCodexEntry(2042);
         startCombat(new Harpy());
         spriteSelect(SpriteDb.get_s_harpy());
      }
      
      public function giveTwoOviElix() : void
      {
         var itype5:ItemType;
         var _g5:HighMountains;
         var itype4:ItemType;
         var _g4:HighMountains;
         var itype3:ItemType;
         var _g3:HighMountains;
         var itype2:ItemType;
         var _g2:HighMountains;
         var itype1:ItemType;
         var _g1:HighMountains;
         var itype:ItemType;
         var _g:HighMountains;
         clearOutput();
         spriteSelect(SpriteDb.get_s_chickenHarpy());
         get_player().consumeItem(get_consumables().OVIELIX);
         get_player().consumeItem(get_consumables().OVIELIX);
         get_images().showImage("item-oElixir");
         outputText("你递过去两瓶灵药，鹰身女妖非常高兴地接了过去。作为回报，她解开了车顶帆布的一角，让你看看她收集的蛋。");
         menu();
         _g = this;
         itype = get_consumables().BLACKEG;
         addButton(0,"黑色",function():void
         {
            _g.getHarpyEgg(itype);
         });
         _g1 = this;
         itype1 = get_consumables().BLUEEGG;
         addButton(1,"蓝色",function():void
         {
            _g1.getHarpyEgg(itype1);
         });
         _g2 = this;
         itype2 = get_consumables().BROWNEG;
         addButton(2,"棕色",function():void
         {
            _g2.getHarpyEgg(itype2);
         });
         _g3 = this;
         itype3 = get_consumables().PINKEGG;
         addButton(3,"粉色",function():void
         {
            _g3.getHarpyEgg(itype3);
         });
         _g4 = this;
         itype4 = get_consumables().PURPLEG;
         addButton(4,"紫色",function():void
         {
            _g4.getHarpyEgg(itype4);
         });
         _g5 = this;
         itype5 = get_consumables().WHITEEG;
         addButton(5,"白色",function():void
         {
            _g5.getHarpyEgg(itype5);
         });
      }
      
      public function giveThreeOviElix() : void
      {
         var itype5:ItemType;
         var _g5:HighMountains;
         var itype4:ItemType;
         var _g4:HighMountains;
         var itype3:ItemType;
         var _g3:HighMountains;
         var itype2:ItemType;
         var _g2:HighMountains;
         var itype1:ItemType;
         var _g1:HighMountains;
         var itype:ItemType;
         var _g:HighMountains;
         clearOutput();
         spriteSelect(SpriteDb.get_s_chickenHarpy());
         get_player().consumeItem(get_consumables().OVIELIX,3);
         get_images().showImage("item-oElixir");
         outputText("你递过去三瓶灵药，鹰身女妖对你愿意割爱感到欣喜若狂。作为回报，她解开了推车顶部的布单的一侧，让你看看她收集的一大堆蛋。");
         menu();
         _g = this;
         itype = get_consumables().L_BLKEG;
         addButton(0,"黑色",function():void
         {
            _g.getHarpyEgg(itype);
         });
         _g1 = this;
         itype1 = get_consumables().L_BLUEG;
         addButton(1,"蓝色",function():void
         {
            _g1.getHarpyEgg(itype1);
         });
         _g2 = this;
         itype2 = get_consumables().L_BRNEG;
         addButton(2,"棕色",function():void
         {
            _g2.getHarpyEgg(itype2);
         });
         _g3 = this;
         itype3 = get_consumables().L_PNKEG;
         addButton(3,"粉色",function():void
         {
            _g3.getHarpyEgg(itype3);
         });
         _g4 = this;
         itype4 = get_consumables().L_PRPEG;
         addButton(4,"紫色",function():void
         {
            _g4.getHarpyEgg(itype4);
         });
         _g5 = this;
         itype5 = get_consumables().L_WHTEG;
         addButton(5,"白色",function():void
         {
            _g5.getHarpyEgg(itype5);
         });
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:HighMountains;
         var _loc2_:* = null as CommonEncounters;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Encounter;
         var _loc5_:* = null as Encounter;
         var _loc6_:* = null as Encounter;
         var _loc7_:* = null as Encounter;
         var _loc8_:* = null as Encounter;
         var _loc9_:* = null as Encounter;
         var _loc10_:* = null as Encounter;
         var _loc11_:* = null as Encounter;
         var _loc12_:* = null as Encounter;
         var _loc13_:* = null as Either;
         _gthis = this;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_explorationEncounter == null)
         {
            _loc2_ = get_game().commonEncounters;
            _loc3_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) == 0)
               {
                  return _gthis.get_player().hasKeyItem("Zetaz\'s Map");
               }
               return false;
            });
            _loc4_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("d3",EncounterChance_Impl_.fromFloatConst(0.2),_loc3_,OneOf_Impl_.fromA(get_game().lethicesKeep.discoverD3),null));
            _loc5_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("snowangel",function():Number
            {
               if(_gthis.isSaturnalia())
               {
                  return 1;
               }
               return 0.1;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,639) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,638) == 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,640) >= 2)
                  {
                     return _gthis.get_player().hasKeyItem("North Star Key");
                  }
                  return true;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().xmas.snowAngel.gatsSpectacularRouter),null));
            _loc6_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("minerva",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,821) < 4;
            }),OneOf_Impl_.fromA(minervaScene.encounterMinerva),null));
            _loc7_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("minomob",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,326) >= 3)
               {
                  return _gthis.get_player().hasVagina();
               }
               return false;
            }),OneOf_Impl_.fromA(minotaurMobScene.meetMinotaurSons),[get_game().commonEncounters.furriteMod]));
            _loc8_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("harpychicken",function():Number
            {
               return _gthis.get_player().itemCount(_gthis.get_consumables().OVIELIX);
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(!_gthis.get_player().hasItem(_gthis.get_consumables().OVIELIX))
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,652) <= 0;
               }
               return true;
            }),OneOf_Impl_.fromA(chickenHarpy),null));
            _loc9_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("phoenix",null,EncounterChance_Impl_.fromBoolFun(get_game().dungeons.checkPhoenixTowerClear),OneOf_Impl_.fromA(phoenixScene.encounterPhoenix),null));
            _loc10_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("minotaur",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) > 0;
            }),OneOf_Impl_.fromA(minoRouter),[get_game().commonEncounters.furriteMod]));
            _loc11_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("harpy",null,null,OneOf_Impl_.fromA(harpyEncounter),null));
            _loc12_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("basilisk",null,null,OneOf_Impl_.fromA(basiliskScene.basiliskGreeting),null));
            _loc13_ = OneOf_Impl_.fromA(cockatriceScene.greeting);
            _explorationEncounter = Encounters.group("highmountains",_loc2_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,EncounterOrDef_Impl_.fromDef(new EncounterDef("cockatrice",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1310) > 0;
            }),_loc13_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("sophie",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) <= 0)
               {
                  return !_gthis.get_game().sophieFollowerScene.sophieFollower();
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().sophieScene.sophieRouter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("nephilacoven",function():Number
            {
               return _gthis.get_parasiteRating() / 2;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_parasiteRating() != 0 && _gthis.get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 5)
               {
                  return !_gthis.get_game().nephilaCovenFollowerScene.nephilaCovenIsFollower();
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().nephilaCovenScene.encounterNephilaCoven),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("izumi",null,null,OneOf_Impl_.fromA(izumiScenes.encounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("ebonbloom",_loc1_.lineByLevel(1,20,0.01,0.4),null,OneOf_Impl_.fromA(findEbonbloom),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("coal",EncounterChance_Impl_.fromFloatConst(0.1),null,OneOf_Impl_.fromA(get_game().mountain.findCoal),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("hike",EncounterChance_Impl_.fromFloatConst(0.2),null,OneOf_Impl_.fromA(hike),null)),wingedSpearScene);
         }
         return _explorationEncounter;
      }
      
      public function getHarpyEgg(param1:ItemType) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_chickenHarpy());
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,653,FlagDict_Impl_.arrayReadInt(_loc2_,653) + 1);
         get_images().showImage("item-egg-harpy");
         outputText("你拿了" + Utils.cnName(param1.get_longName()) + "，鹰身女妖对你的决定点了点头。她把推车重新准备好上路，在沿着山路回去之前，她向你挥手作最后的告别。[pg]");
         get_inventory().takeItem(param1,get_camp().returnToCampUseOneHour);
      }
      
      public function findOre() : void
      {
         var _loc1_:int = Utils.rand(3);
      }
      
      public function findEbonbloom() : void
      {
         clearOutput();
         outputText("在攀登陡峭的山崖时，一道特别深的裂缝吸引了你的注意。它看起来很普通，你也不知道是什么吸引了你，但你就是被吸引了，于是你走了过去，向里面张望。在幽暗之中，你发现了一丝微弱的金属光泽，像遥远的星星一样闪烁着。");
         outputText("[pg]你的[hand]伸进去，触碰到了一个纤细而精致的东西。再试探性地摸了几下，也没有发现更多关于这个物体的信息，所以你决定小心翼翼地把它从原处拉出来。当你把它拉出来时，你清楚地看到这个物品是一朵花，但它有些奇怪。");
         outputText("[pg]当你把它拉到光线中时，它发出的刺眼反光让你瞬间失明。你护住[face]，迅速将这朵花塞进[pouch]里，以免它造成任何持久的伤害。幸好它被留在了这么暗的地方，但一开始是谁把它留在那里的呢？不管怎样，也许你能在其他地方找到这个奇怪发现的用途……[pg]");
         get_inventory().takeItem(get_useables().EBNFLWR,get_camp().returnToCampUseOneHour);
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "高山";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,88,FlagDict_Impl_.arrayReadInt(_loc1_,88) + 1);
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         clearOutput();
         get_images().showImage("area-highmountains");
         outputText("在探索这座山的时候，你发现了一条相对安全的通往更高处的路。你判断通过这条路线，你能够到达这座山大约三分之二的高度。带着这个新发现，你回到了营地。");
         outputText("[pg](<b>高山探索地点已解锁！</b>)");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,88,FlagDict_Impl_.arrayReadInt(_loc1_,88) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function chickenHarpy() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_chickenHarpy());
         get_images().showImage("encounter-chicken-harpy");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,652) == 0)
         {
            outputText("在山间漫步时，你偶然遇到了一只长相奇特的鹰身女妖，她正拉着一辆大木车四处游荡。她比你见过的任何普通鹰身女妖都要矮小得多，胸部也更丰满，身高勉强达到4英尺，但依然保留了她们那丰满性感的臀部。除了覆盖身体的蓬松白羽外，这位鸟人女子的额头上还有三根鲜红的羽毛，像羽冠一样向后梳理着。");
            outputText("[pg]你用审视的目光盯着眼前的人，让她感到很不自在。在对着她进行了一番深思熟虑后，你得出了一个结论——她一定是一只鸡身女妖！");
            outputText("[pg]你往车里看去，立刻发现一大堆蛋笨拙地堆在一起。这些奇特的蛋颜色各异，大小不一，被一块结实的帆布保护着，以免散落。");
            outputText("[pg]鸡身女妖决定打破僵局，向你介绍这辆引起你兴趣的推车。");
            outputText("[pg][say: 嘿，旅行者，我注意到你对我的蛋很感兴趣——它们不卖，但也许我们可以达成某种协议？]");
            outputText("[pg]你摸了摸下巴，点了点头。你确实在旅行，这没错。鸡身女妖把这个动作当成了继续说下去的信号。");
            outputText("[pg][say: 嗯，你看，这些蛋可不是从树上长出来的——事实上，我至少得灌下两三瓶产卵灵药，才能让我的身体产出这么好的一批，你懂吗？因为像我这样的小个子很难找到灵药，所以我喜欢用一个蛋和那些愿意割爱的人换几瓶灵药。]");
            outputText("[pg]听起来很合理，你心想。两三瓶灵药换一个蛋？完全可行。");
            outputText("[pg][say: 那么你觉得怎么样，你有灵药可以给我吗？]");
         }
         else
         {
            outputText("在山间漫步时，你遇到了一个眼熟的矮个子，她正拖着一辆大木车到处闲逛。");
            outputText("[pg]你向她跑去，她挥手向你打招呼，停下车让你赶上。她像往常一样滔滔不绝地介绍着她的蛋，咯咯笑着伸出一只手。");
            outputText("[pg][say: 嘿，小太阳，你今天有灵药可以给我吗？]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,652,FlagDict_Impl_.arrayReadInt(_loc1_,652) + 1);
         menu();
         if(get_player().hasItem(get_consumables().OVIELIX,2))
         {
            addButton(0,"给两瓶",giveTwoOviElix);
         }
         if(get_player().hasItem(get_consumables().OVIELIX,3))
         {
            addButton(1,"给三瓶",giveThreeOviElix);
         }
         addButton(14,"离开",leaveChickenx);
      }
   }
}

