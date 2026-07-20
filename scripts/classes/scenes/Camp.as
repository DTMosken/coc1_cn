package classes.scenes
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.MainViewManager;
   import classes.MasteryLib;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.SettingsGlobalDisplay;
   import classes.SettingsGlobalGameplay;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes._Camp.SaveContent;
   import classes.scenes.areas.desert.AntsScene;
   import classes.scenes.camp.CabinProgress;
   import classes.scenes.camp.ImpGangBang;
   import classes.scenes.camp.TrainingDummyScene;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons.WizardTower;
   import classes.scenes.explore.Gargoyle;
   import classes.scenes.npcs.AmilyScene;
   import classes.scenes.npcs.AnemoneScene;
   import classes.scenes.npcs.ArianScene;
   import classes.scenes.npcs.CeraphFollowerScene;
   import classes.scenes.npcs.EmberScene;
   import classes.scenes.npcs.HelFollower;
   import classes.scenes.npcs.HelSpawnScene;
   import classes.scenes.npcs.HolliScene;
   import classes.scenes.npcs.IsabellaFollowerScene;
   import classes.scenes.npcs.IsabellaScene;
   import classes.scenes.npcs.IzmaScene;
   import classes.scenes.npcs.JojoScene;
   import classes.scenes.npcs.KihaFollowerScene;
   import classes.scenes.npcs.KihaScene;
   import classes.scenes.npcs.LatexGirl;
   import classes.scenes.npcs.MarblePurification;
   import classes.scenes.npcs.MarbleScene;
   import classes.scenes.npcs.MilkWaifu;
   import classes.scenes.npcs.NPCAwareContent;
   import classes.scenes.npcs.NephilaCovenFollowerScene;
   import classes.scenes.npcs.Rathazul;
   import classes.scenes.npcs.ShouldraFollower;
   import classes.scenes.npcs.SophieBimbo;
   import classes.scenes.npcs.SophieFollowerScene;
   import classes.scenes.npcs.SophieScene;
   import classes.scenes.npcs.UrtaPregs;
   import classes.scenes.npcs.Valeria;
   import classes.scenes.npcs.Vapula;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.places.Cabin;
   import classes.scenes.seasonal.Nieve;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.ds.StringMap;
   import haxe.iterators.MapKeyValueIterator;
   
   public class Camp extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var trainingDummyScene:TrainingDummyScene;
      
      public var timesExplored:int;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var maxExplorations:int;
      
      public var justReturnedToCamp:Boolean;
      
      public var impGangBang:ImpGangBang;
      
      public var globalSave:Boolean;
      
      public var codex:Codex;
      
      public var cabinProgress:CabinProgress;
      
      public function Camp()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         justReturnedToCamp = false;
         maxExplorations = 2;
         timesExplored = 0;
         trainingDummyScene = new TrainingDummyScene();
         impGangBang = new ImpGangBang();
         codex = new Codex();
         cabinProgress = new CabinProgress();
         globalSave = false;
         saveVersion = 1;
         saveName = "camp";
         saveContent = new SaveContent(null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function watchSunset() : void
      {
         clearOutput();
         get_images().showImage("camp-watch-sunset");
         outputText("你挑了一个能清楚看到太阳的地方坐下。太阳刚好在地平线上方，准备落下。这景色真美。[pg]");
         var _loc1_:Number = Utils.rand(3);
         if(_loc1_ == 0)
         {
            if(get_player().cor < 33)
            {
               outputText("当你回忆起童年最美好的时光时，一阵怀旧之情涌上心头。");
               dynStats(DynStat.Cor(-1),DynStat.Lib(-1),DynStat.Lust(-30),DynStat.NoScale);
            }
            if(get_player().cor >= 33 && get_player().cor < 66)
            {
               outputText("当你回忆起童年最美好的时光时，一阵怀旧之情涌上心头。突然，你的记忆因为一些变态的时刻而变得有些扭曲。你摇了摇头，只是放松下来。");
               dynStats(DynStat.Cor(-0.5),DynStat.Lib(-1),DynStat.Lust(-20),DynStat.NoScale);
            }
            if(get_player().cor >= 66)
            {
               outputText("当你回忆起童年最美好的时光时，一阵怀旧之情涌上心头。突然，你的记忆扭曲成了一些黑暗和变态的时刻。你对那一刻轻笑出声，但还是摇了摇头，专注于放松。");
               dynStats(DynStat.Cor(0),DynStat.Lib(-1),DynStat.Lust(-10),DynStat.NoScale);
            }
         }
         if(_loc1_ == 1)
         {
            if(get_player().cor < 33)
            {
               outputText("你回想自己最伟大的冒险，以及好奇心是如何战胜你的。你记得自己发现的一些最棒的地方。");
               dynStats(DynStat.Lust(-30),DynStat.NoScale);
            }
            if(get_player().cor >= 33 && get_player().cor < 66)
            {
               outputText("你回想自己最伟大的冒险。当然，其中一些涉及与玛瑞斯的居民做爱和被操。你突然从回忆中睁开眼睛，只是放松下来，纳闷自己一开始为什么会想到那个。");
               dynStats(DynStat.Lust(-20),DynStat.NoScale);
            }
            if(get_player().cor >= 66)
            {
               outputText("你回想自己最伟大的冒险。你对那些你处于支配地位和屈服地位的时刻轻笑出声。你突然从回忆中睁开眼睛，只是放松下来。");
               dynStats(DynStat.Lust(-10),DynStat.NoScale);
            }
         }
         if(_loc1_ >= 2)
         {
            outputText("你想着你本来想");
            if(Utils.rand(2) == 0)
            {
               outputText("做");
            }
            else
            {
               outputText("完成");
            }
            outputText("的事，在穿过传送门之前。你感到有些难过，因为你没能实现你以前的目标。");
            dynStats(DynStat.Lust(-30),DynStat.NoScale);
         }
         outputText("[pg]想完之后，你花了很长一段时间放松并观看日落。现在，太阳已经落到地平线以下。日落后天空闪耀着橙色的光芒。看来你还可以再探索一会儿。");
         doNext(returnToCampUseOneHour);
      }
      
      public function watchStars() : void
      {
         clearOutput();
         get_images().showImage("camp-watch-stars");
         outputText("你在离你的" + homeDesc() + "不远的地方挑了个位置躺在地上，仰望星空。");
         outputText("[pg]自从莉希丝倒台后，星星就清晰可见了。");
         outputText("[pg]你放松下来，看着各种星座。");
         var _loc1_:int = Utils.rand(4);
         switch(_loc1_)
         {
            case 0:
               outputText("[pg]其中一个甚至看起来像阴茎。你对这种排列感到脸红。");
               break;
            case 1:
               outputText("[pg]其中一个甚至看起来像乳房的排列。你对这种排列感到脸红。");
               break;
            case 2:
               outputText("[pg]其中一个星座的星星排列成了半人马的形状。真有趣。");
               break;
            case 3:
               outputText("[pg]啊，熟悉的北斗七星。等一下……你记得在英格纳姆见过那个星座。你发誓星星的排列几乎一模一样。");
               break;
            default:
               outputText("[pg]不知怎么的，其中一个拼出了\"ERROR\"。也许你应该让Kitteh6660知道？");
         }
         outputText("[pg]你让思绪漫游，放松下来。");
         dynStats(DynStat.Lust(-15),DynStat.NoScale);
         doNext(returnToCampUseOneHour);
      }
      
      public function wakeupTime() : int
      {
         var _loc1_:Boolean = Boolean(["","Ember","Amily","Izma","Helia","salamanders"].contains(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701)));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2113) > 0 && _loc1_)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2114);
         }
         return 6;
      }
      
      public function wakeFromBadEnd() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         clearOutput();
         get_images().showImage("camp-nightmare");
         outputText("不，这不可能。这只是一个梦！你必须醒来！");
         outputText("[pg]你尖叫着醒来。你拿出一面镜子看了看自己。是的，你看起来又恢复正常了。那是你做过的最疯狂的梦。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2104) >= 2)
         {
            outputText("[pg]你喃喃自语[say: 又是一个该死的坏结局。]");
         }
         if(marbleFollower())
         {
            outputText("[pg][say: 你还好吗，亲爱的？]玛布尔问道。你向她保证你没事；你只是做了一个噩梦。");
         }
         if(get_survival())
         {
            get_player().hunger = 40;
         }
         if(get_realistic() && get_player().ballSize > 18 + get_player().get_str() / 2 + get_player().get_tallness() / 4)
         {
            outputText("[pg]你意识到了拥有过大睾丸的后果，你需要立刻缩小它。缩形膏应该有用。");
            _loc1_ = 14 + get_player().get_str() / 2;
            _loc2_ = get_player().get_tallness() / 4;
            get_player().ballSize = _loc1_ + _loc2_;
         }
         if(get_easyMode() || get_debug())
         {
            outputText("[pg]你站起身，仍然对噩梦感到困惑。");
         }
         else
         {
            outputText("[pg]你站起身，仍然对噩梦感到创伤。");
         }
         get_player().gameOver = false;
         var _temp_1:* = get_time();
         _temp_1.days = _temp_1.days + 1;
         get_time().hours = wakeupTime();
         set_inDungeon(false);
         set_inRoomedDungeon(false);
         set_inRoomedDungeonResume(null);
         get_combat().clearStatuses();
         get_game().set_inCombat(false);
         get_player().set_HP(get_player().maxHP());
         get_player().set_fatigue(0);
         statScreenRefresh();
         var _loc3_:int = 1;
         _loc3_ += int(get_difficulty() * 0.5);
         if(get_easyMode() || get_debug())
         {
            _loc3_ = 0;
         }
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - int(get_player().get_gems() / 10 * _loc3_));
         var _temp_2:* = get_player();
         _temp_2.XP = _temp_2.XP - int(get_player().level * 10 * _loc3_);
         if(get_player().get_gems() < 0)
         {
            get_player().set_gems(0);
         }
         if(get_player().XP < 0)
         {
            get_player().XP = 0;
         }
         if(get_player().get_str100() > 20)
         {
            dynStats(DynStat.Str(Math.ceil(-get_player().get_str() * 0.02) * _loc3_));
         }
         if(get_player().get_tou100() > 20)
         {
            dynStats(DynStat.Tou(Math.ceil(-get_player().get_tou() * 0.02) * _loc3_));
         }
         if(get_player().get_spe100() > 20)
         {
            dynStats(DynStat.Spe(Math.ceil(-get_player().get_spe() * 0.02) * _loc3_));
         }
         if(get_player().get_inte100() > 20)
         {
            dynStats(DynStat.Inte(Math.ceil(-get_player().get_inte() * 0.02) * _loc3_));
         }
         menu();
         addButton(0,"继续",playerMenu);
      }
      
      public function updateAchievements() : void
      {
         awardAchievement("初来乍到",0);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) > 0)
         {
            awardAchievement("玛莱的救主",1);
         }
         if(get_player().hasKeyItem("Zetaz\'s Map"))
         {
            awardAchievement("终得复仇",2);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            awardAchievement("恶魔杀手",3);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) > 0 && get_player().hasStatusEffect(StatusEffects.ExploredDeepwoods) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) > 0)
         {
            awardAchievement("探险家",10);
         }
         if(placesCount() >= 10)
         {
            awardAchievement("观光客",11);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2297) >= 1)
         {
            awardAchievement("我这是在哪儿？",12);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) >= 100)
         {
            awardAchievement("脱水",15);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) >= 100)
         {
            awardAchievement("护林员",13);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) >= 100)
         {
            awardAchievement("度假者",14);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) >= 100)
         {
            awardAchievement("登山者",16);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) >= 100)
         {
            awardAchievement("连绵丘陵",18);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) >= 100)
         {
            awardAchievement("浑身湿透",19);
         }
         if(get_player().statusEffectv1(StatusEffects.ExploredDeepwoods) >= 100)
         {
            awardAchievement("仍需深入",17);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) >= 100)
         {
            awardAchievement("头晕目眩",20);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016) >= 100)
         {
            awardAchievement("一片泥泞",21);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) >= 100)
         {
            awardAchievement("冰封",22);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) >= 100)
         {
            awardAchievement("炙烤",26);
         }
         if(get_player().statusEffectv1(StatusEffects.BoatDiscovery) >= 15)
         {
            awardAchievement("习惯水性",25);
         }
         if(get_player().statusEffectv1(StatusEffects.MetWhitney) >= 30)
         {
            awardAchievement("农夫",24);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2076) >= 15)
         {
            awardAchievement("考古学家",23);
         }
         if(get_player().level >= 2)
         {
            awardAchievement("初次升级！",30);
         }
         if(get_player().level >= 5)
         {
            awardAchievement("新手",31);
         }
         if(get_player().level >= 10)
         {
            awardAchievement("学徒",32);
         }
         if(get_player().level >= 15)
         {
            awardAchievement("熟练工",33);
         }
         if(get_player().level >= 20)
         {
            awardAchievement("专家",34);
         }
         if(get_player().level >= 30)
         {
            awardAchievement("大师",35);
         }
         if(get_player().level >= 45)
         {
            awardAchievement("宗师",36);
         }
         if(get_player().level >= 60)
         {
            awardAchievement("显赫",37);
         }
         if(get_player().level >= 90)
         {
            awardAchievement("霸主",38);
         }
         if(get_player().level >= 120)
         {
            awardAchievement("你是神吗？",39);
         }
         if(getCampPopulation() >= 2)
         {
            awardAchievement("我的第一个同伴",40);
         }
         if(getCampPopulation() >= 5)
         {
            awardAchievement("小村庄",41);
         }
         if(getCampPopulation() >= 10)
         {
            awardAchievement("村庄",42);
         }
         if(getCampPopulation() >= 25)
         {
            awardAchievement("小镇",43);
         }
         if(getCampPopulation() >= 100)
         {
            awardAchievement("城市",44);
         }
         if(getCampPopulation() >= 250)
         {
            awardAchievement("大都会",45);
         }
         if(getCampPopulation() >= 500)
         {
            awardAchievement("特大城市",46);
         }
         if(getCampPopulation() >= 1000)
         {
            awardAchievement("城邦",47);
         }
         if(getCampPopulation() >= 2500)
         {
            awardAchievement("王国",48);
         }
         if(getCampPopulation() >= 5000)
         {
            awardAchievement("帝国",49);
         }
         if(get_time().days >= 30)
         {
            awardAchievement("完整的一月",50);
         }
         if(get_time().days >= 180)
         {
            awardAchievement("半年",51);
         }
         if(get_time().days >= 365)
         {
            awardAchievement("一年",52);
         }
         if(get_time().days >= 730)
         {
            awardAchievement("两年",53);
         }
         if(get_time().days >= 1095)
         {
            awardAchievement("三年",54);
         }
         if(get_time().days >= 1825)
         {
            awardAchievement("坚持甚久",55);
         }
         if(get_time().days >= 3650)
         {
            awardAchievement("十年",56);
         }
         if(get_time().days >= 36500)
         {
            awardAchievement("世纪",57);
         }
         var _loc1_:int = 0;
         if(get_game().dungeons.checkFactoryClear())
         {
            awardAchievement("全面停工",62);
            _loc1_++;
         }
         if(get_game().dungeons.checkDeepCaveClear())
         {
            awardAchievement("深陷其中",63);
            _loc1_++;
         }
         if(get_game().dungeons.checkSandCaveClear())
         {
            awardAchievement("沙漠女巫之友",64);
            _loc1_++;
         }
         if(get_game().dungeons.checkLethiceStrongholdClear())
         {
            awardAchievement("统治终结",69);
            _loc1_++;
         }
         if(get_game().dungeons.checkPhoenixTowerClear())
         {
            awardAchievement("凤凰陨落",65);
            _loc1_++;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == get_game().modSaveVersion)
            {
               awardAchievement("极度禁欲的探索者",67);
            }
         }
         if(get_game().dungeons.checkManorClear())
         {
            _loc1_++;
         }
         if(get_game().dungeons.checkTowerDeceptionClear())
         {
            _loc1_++;
         }
         if(_loc1_ >= 1)
         {
            awardAchievement("探索者",60);
         }
         if(_loc1_ >= 3)
         {
            awardAchievement("探索学徒",68);
         }
         if(_loc1_ >= 7)
         {
            awardAchievement("探索大师",61);
         }
         if(get_player().get_armor() == get_armors().W_ROBES && get_player().get_weapon() == get_weapons().W_STAFF)
         {
            awardAchievement("想当巫师",70);
         }
         if(int(get_player().previouslyWornClothes.length) >= 10)
         {
            awardAchievement("角色扮演",71);
         }
         if((get_player().get_armor() == get_armors().RBBRCLT || get_player().get_armor() == get_armors().BONSTRP || get_player().get_armor() == get_armors().NURSECL) && (get_player().get_weapon() == get_weapons().RIDINGC || get_player().get_weapon() == get_weapons().WHIP || get_player().get_weapon() == get_weapons().SUCWHIP || get_player().get_weapon() == get_weapons().L_WHIP))
         {
            awardAchievement("施虐女王",72);
         }
         if(get_player().get_armor() != ArmorLib.NOTHING && get_player().get_lowerGarment() == UndergarmentLib.NOTHING && get_player().get_upperGarment() == UndergarmentLib.NOTHING)
         {
            awardAchievement("真空上阵",73);
         }
         if(get_player().get_jewelry().get_value() >= 1000)
         {
            awardAchievement("珠光宝气",74);
         }
         if(get_player().get_gems() >= 1000)
         {
            awardAchievement("我已富有",75);
         }
         if(get_player().get_gems() >= 10000)
         {
            awardAchievement("囤积狂",76);
         }
         if(get_player().get_gems() >= 100000)
         {
            awardAchievement("行走的宝石库",77);
         }
         if(get_player().get_gems() >= 1000000)
         {
            awardAchievement("百万富翁",78);
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsCharge) && get_player().hasStatusEffect(StatusEffects.KnowsBlind) && get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) && get_player().hasStatusEffect(StatusEffects.KnowsArouse) && get_player().hasStatusEffect(StatusEffects.KnowsHeal) && get_player().hasStatusEffect(StatusEffects.KnowsMight))
         {
            awardAchievement("巫师",80);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2081) >= 168 && get_survival())
         {
            awardAchievement("斋戒",104);
         }
         if(nieveFollower())
         {
            awardAchievement("可爱的雪人",98);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2271) >= 10)
         {
            awardAchievement("彩蛋猎人",90);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2075) >= 25 && get_time().days >= 10)
         {
            awardAchievement("传送门守卫",110);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1277) == 2)
         {
            awardAchievement("砍下她的头！",172);
         }
         if(getUniqueKills() >= 3)
         {
            awardAchievement("坏结局制造者",111);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2077) >= 1)
         {
            awardAchievement("我这是怎么了？",114);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2077) >= 10)
         {
            awardAchievement("变形者",115);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2077) >= 25)
         {
            awardAchievement("千变万化",116);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2074) >= 1)
         {
            awardAchievement("撸啊撸",117);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2074) >= 10)
         {
            awardAchievement("淫不可挡",118);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2074) >= 100)
         {
            awardAchievement("自慰大师",119);
         }
         if(get_player().get_armorName() == "goo armor")
         {
            awardAchievement("粘液盔甲",121);
         }
         if(helspawnFollower())
         {
            awardAchievement("赫莉娅的子嗣",120);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) > 0)
         {
            awardAchievement("弑神者",124);
         }
         if(followersCount() >= 7)
         {
            awardAchievement("众望所归",126);
         }
         if(loversCount() >= 8)
         {
            awardAchievement("应收尽收",125);
         }
         if(slavesCount() >= 4)
         {
            awardAchievement("到汝之" + get_player().mf("主人","女主人") + "身边来",127);
         }
         if(followersCount() + loversCount() + slavesCount() >= 19)
         {
            awardAchievement("所有人都属于我",129);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) >= 3)
         {
            awardAchievement("白吃白喝",133);
         }
         if(int(get_player().get_perks().length) >= 20)
         {
            awardAchievement("天赋异禀",134);
         }
         if(int(get_player().get_perks().length) >= 35)
         {
            awardAchievement("天赋超群",135);
         }
         if(int(get_player().get_perks().length) >= 50)
         {
            awardAchievement("天赋绝伦",167);
         }
         if(get_player().get_str() >= 50 && get_player().get_tou() >= 50 && get_player().get_spe() >= 50 && get_player().get_inte() >= 50)
         {
            awardAchievement("多面手",136);
         }
         if(get_player().get_str() >= 100 && get_player().get_tou() >= 100 && get_player().get_spe() >= 100 && get_player().get_inte() >= 100)
         {
            awardAchievement("超凡属性",137);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2083) >= 4)
         {
            awardAchievement("双重人格",138);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2084) >= 2)
         {
            awardAchievement("洗心革面",139);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2101) >= 100)
         {
            awardAchievement("我才不是伐木工",154);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2100) >= 100)
         {
            awardAchievement("森林破坏者",155);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2102) >= 300)
         {
            awardAchievement("锤子时间",156);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2103) >= 200)
         {
            awardAchievement("钉子拾荒者",157);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2268) >= 100)
         {
            awardAchievement("呀吧嗒吧嘟",170);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2269) >= 200)
         {
            awardAchievement("蚂蚁工坊",171);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2007) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2008) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2009) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2010) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2011) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2012) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2013) >= 1)
         {
            awardAchievement("甜蜜的家",145);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2179) > 0)
         {
            awardAchievement("让玛瑞斯再次伟大",176);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) >= 100)
         {
            awardAchievement("小恶魔兵马俑",177);
         }
         if(get_player().get_tallness() >= 132)
         {
            awardAchievement("高达十一",168);
         }
         if(jojoFollower())
         {
            awardAchievement("乔乔的奇妙冒险",182);
         }
         var _loc2_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) > 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) > 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,606) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,985) <= 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 2)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,935) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,938) <= 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,399) <= 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,628) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0)
         {
            _loc2_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) == 4)
         {
            _loc2_++;
         }
         if(_loc2_ >= 3)
         {
            awardAchievement("丁丁猎人",166);
         }
         if(_loc2_ >= 7)
         {
            awardAchievement("你个混蛋",169);
         }
      }
      
      public function totalChildrenForAscension() : int
      {
         var _loc1_:int = 0;
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1190);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69);
         _loc1_ += get_emberScene().emberChildren();
         _loc1_ += get_isabellaScene().totalIsabellaChildren();
         _loc1_ += get_izmaScene().totalIzmaChildren();
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,908);
         _loc1_ += get_kihaFollowerScene().totalKihaChildren();
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,686);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1024);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2091);
         _loc1_ += int(Math.pow(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,894),0.4));
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,859);
         _loc1_ += get_sophieBimbo().sophieChildren();
         _loc1_ += int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 4);
         _loc1_ += get_urtaPregs().urtaKids();
         _loc1_ += helspawnFollower() ? 1 : 0;
         return int(_loc1_ + (get_game().mothCave.doloresScene.saveContent.doloresProgress > 0 ? 1 : 0));
      }
      
      public function switchMagic(param1:int) : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2721,param1);
         switch(param1)
         {
            case 0:
               outputText("[pg]你冥想你的奥术知识，探索情绪平衡与头脑清晰的哲学。");
               outputText("[pg]<b>你的法术已更改为黑白魔法。</b>");
               break;
            case 1:
               outputText("[pg]你俯身趴在地上，静静地集中身体和精神的力量。一股压力散发到周围的泥土中，你的眼睛闪烁着翠绿色的光芒。");
               outputText("[pg]<b>你的法术已更改为地炎。</b>");
               break;
            default:
               outputText("[pg]错误：无效的魔法类型");
         }
         doNext(returnToCampUseOneHour);
      }
      
      public function swimInStreamFinish() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2 && get_player().cor < 50)
         {
            outputText("在被污染的水中游过之后，你感觉更脏了。[pg]");
            dynStats(DynStat.Cor(0.5));
            dynStats(DynStat.Lust(15));
         }
         outputText("最后，你游回溪岸并擦干身体，");
         if(get_player().get_armorName() != "slutty swimwear")
         {
            outputText("然后重新穿上你的[armor]");
         }
         outputText("。");
         doNext(returnToCampUseOneHour);
      }
      
      public function swimInStream() : void
      {
         clearOutput();
         get_akky().locationDesc("溪流");
         outputText("你看着附近流淌的溪流。决定去泡个澡，");
         if(get_player().get_armorName() == "slutty swimwear")
         {
            outputText("你打算只穿着泳装游泳。");
         }
         else
         {
            outputText("你脱下你的[armor]，直到你一丝不挂。");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            get_images().showImage("camp-stream-herm");
         }
         else if(get_player().hasVagina())
         {
            get_images().showImage("camp-stream-female");
         }
         else
         {
            get_images().showImage("camp-stream-male");
         }
         outputText("你步入流淌的溪水中。起初你打了个寒颤，但你继续向深处走去。令人难以置信的是，对于一条溪流来说，它相当深。");
         if(get_player().get_tallness() < 60)
         {
            outputText("你的脚甚至碰不到河床。");
         }
         if(get_player().get_tallness() >= 60 && get_player().get_tallness() < 72)
         {
            outputText("你的脚碰到了河床，你的头勉强露出水面。");
         }
         if(get_player().get_tallness() >= 72)
         {
            outputText("你的脚碰到了河床，你的头露出了水面。你稍微弯下腰，这样你就在合适的高度了。");
         }
         outputText("[pg]你开始游来游去，放松身心。");
         get_player().hasGottenWashed();
         if(Utils.rand(2) == 0 && izmaFollower())
         {
            outputText("[pg]当你看到一个鳍露出水面，以致命的速度向你靠近时，你瞬间感到恐惧！然而，就在它进入攻击距离时，伊兹玛熟悉的身影伴随着水花破水而出。[say: 我正准备享受我每天的游泳呢，我的阿尔法，]她说着，给了你一个锐利的微笑。");
         }
         if(Utils.rand(2) == 0 && followerHel() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,703) > 0)
         {
            outputText("[pg]你的火蜥蜴恋人赫莉娅慢悠悠地走过来，加入你在溪流中的沐浴，她一到就大声喊道：[say: 嘿，我的爱人！]声音稍微有点太大了。当她将那结实、布满鳞片的身体浸入水中时，水温似乎升高了，直到像桑拿房一样开始冒出蒸汽。");
         }
         if(Utils.rand(2) == 0 && marbleFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) != 4)
         {
            outputText("[pg]你的牛娘同伴玛布尔脱得一丝不挂，显然在营地中央这样做也毫不害羞，她加入你一起游泳。[say: 亲爱的，你喜欢游泳，对吧？]她问道。");
         }
         if(Utils.rand(2) == 0 && get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) > 0)
         {
            outputText("[pg]艾米莉站在溪边，穿着暴露的比基尼显得有些尴尬。不过她不应该这样" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0 ? "，尤其是当她的阴茎[if (silly) {尺寸这么好|暴露在外}]时" : "考虑到这套比基尼有多么衬托她的身形") + "。她最终鼓起勇气，走过来和你一起泡在溪水里。");
         }
         if(Utils.rand(4) == 0 && followerEmber())
         {
            outputText("[pg]你偶然瞥见烬在不远处洗澡。她那" + (get_emberScene().littleEmber() ? "光滑、年轻" : "诱人") + "的身体在你眼前展露无遗，片刻后她发现你在偷看，红着脸飞奔而去。");
         }
         if(Utils.rand(10) == 0 && get_rathazul().followerRathazul())
         {
            outputText("[pg]你看到拉萨祖尔走进了溪流的浅水区，很可能是在洗澡，以洗掉[if (silly) {一直跟着他的挥之不去的奶酪味|他最近炼金实验的味道}]。");
         }
         doNext(swimInStreamFinish);
      }
      
      public function sleepWrapper() : void
      {
         get_player().sleeping = true;
         set_trueTimeQ(calculateHoursUntilHour(wakeupTime()));
         clearOutput();
         if(get_trueTimeQ() != 1)
         {
            outputText("你躺下继续睡完剩下的" + Utils.num2Text(get_trueTimeQ()) + "个小时。[pg]");
         }
         else
         {
            outputText("你躺下继续睡完剩下的一个小时。[pg]");
         }
         sleepRecovery(true);
         goNext(get_trueTimeQ(),true);
      }
      
      public function sleepRecoveryApply(param1:Number, param2:Number = 0, param3:Boolean = false, param4:int = 0, param5:int = 0) : void
      {
         var _loc6_:Number = 20;
         var _loc7_:Number = 20;
         if(param2 == 0)
         {
            param2 = 1;
            if(get_survival() && get_player().hunger < 25)
            {
               param2 *= 0.5;
            }
            if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
            {
               param2 *= 0.5;
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3)
            {
               param2 *= 0.75;
            }
            if(get_player().get_armor() == get_armors().TBARMOR)
            {
               if(get_player().cor < 33)
               {
                  param2 *= 0.75;
               }
               else if(get_player().cor < 66)
               {
                  param2 *= 0.9;
               }
            }
         }
         get_player().HPChange(param1 * _loc7_ * param2 + param4,param3);
         get_player().changeFatigue(-(param1 * _loc6_ * param2 + param5));
      }
      
      public function sleepRecovery(param1:Boolean = false) : void
      {
         var _loc2_:Number = 1;
         var _loc3_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0 && (FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "" || FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble"))
         {
            _loc2_ += 0.5;
            if(get_cabin().get_bedBears() == 10)
            {
               _loc3_ = true;
            }
         }
         if(get_survival())
         {
            if(get_player().hunger < 25)
            {
               outputText("你难以入睡，因为你的肚子咕咕叫得很大声。[pg]");
               _loc2_ *= 0.5;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            if(param1)
            {
               outputText("你的睡眠非常不安稳，你无法平静下来。你起床时感到疲惫和不满足，脑海里总是想着玛布尔的奶水。[pg]");
            }
            _loc2_ *= 0.5;
            dynStats(DynStat.Tou(-0.1),DynStat.Inte(-0.1));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3)
         {
            if(param1)
            {
               outputText("你大半夜都在辗转反侧，渴望尝一尝牛头人的精液。[pg]");
            }
            _loc2_ *= 0.75;
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            outputText("找到那个给你这根被诅咒的[cock]的蜂女，让她在上面涂满蜂蜜的渴望随着时间的推移而增长。[pg]");
         }
         if(get_player().get_armor() == get_armors().GOOARMR && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) <= 0)
         {
            outputText("你感觉到那渴望液体的黏液在你的腹股沟上摩擦，就好像瓦莱丽娅想要你喂她一样。[pg]");
         }
         if(get_player().get_armor() == get_armors().TBARMOR)
         {
            outputText("你盔甲上活生生的、腐化的触手在夜里挑逗和戳刺你身体的每一个性感带，导致");
            if(get_player().cor < 33)
            {
               outputText("不安稳的睡眠和令人不安的梦境。");
               _loc2_ *= 0.75;
            }
            if(get_player().cor >= 33 && get_player().cor < 66)
            {
               outputText("不安的睡眠。");
               _loc2_ *= 0.9;
            }
            if(get_player().cor >= 66)
            {
               outputText("被几只触手怪无休止地蹂躏的美妙梦境。");
            }
            outputText("[pg]");
         }
         if(_loc3_)
         {
            _loc2_ += 0.1;
            dynStats(DynStat.Lib(-get_trueTimeQ() / 16),DynStat.Cor(-get_trueTimeQ() / 16));
         }
         sleepRecoveryApply(get_trueTimeQ(),_loc2_,param1);
      }
      
      public function slavesList() : Array
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as Function;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Function;
         var _loc1_:IMap = new StringMap();
         _loc2_ = get_latexGirl().gooName();
         _loc3_ = get_latexGirl().latexGooAtCamp;
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc3_ = get_vapula().vapulaAtCamp;
         if("Vapula" in StringMap.reserved)
         {
            _loc1_.setReserved("Vapula",_loc3_);
         }
         else
         {
            _loc1_.h["Vapula"] = _loc3_;
         }
         _loc3_ = campCorruptJojo;
         if("Jojo" in StringMap.reserved)
         {
            _loc1_.setReserved("Jojo",_loc3_);
         }
         else
         {
            _loc1_.h["Jojo"] = _loc3_;
         }
         _loc3_ = get_amilyScene().amilyFollowerCorrupt;
         if("Amily" in StringMap.reserved)
         {
            _loc1_.setReserved("Amily",_loc3_);
         }
         else
         {
            _loc1_.h["Amily"] = _loc3_;
         }
         _loc3_ = get_sophieBimbo().bimboSophieAtCamp;
         if("Sophie" in StringMap.reserved)
         {
            _loc1_.setReserved("Sophie",_loc3_);
         }
         else
         {
            _loc1_.h["Sophie"] = _loc3_;
         }
         _loc3_ = ceraphIsFollower;
         if("Ceraph" in StringMap.reserved)
         {
            _loc1_.setReserved("Ceraph",_loc3_);
         }
         else
         {
            _loc1_.h["Ceraph"] = _loc3_;
         }
         _loc2_ = get_milkWaifu().get_milkName();
         _loc3_ = get_milkWaifu().milkSlaveAtCamp;
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         var _loc4_:IMap = _loc1_;
         var _loc5_:Array = [];
         var _loc6_:IMap = _loc4_;
         var _loc7_:IMap = _loc6_;
         var _loc8_:* = _loc6_.keys();
         while(Boolean(_loc8_.hasNext()))
         {
            _loc2_ = _loc8_.next();
            _loc3_ = _loc7_.get(_loc2_);
            _loc9_ = _loc2_;
            _loc10_ = _loc9_;
            _loc11_ = _loc3_;
            if(Boolean(_loc11_()))
            {
               _loc5_.push(_loc10_);
            }
         }
         return _loc5_;
      }
      
      public function slavesCount() : int
      {
         return int(slavesList().length);
      }
      
      public function skyRape() : void
      {
         clearOutput();
         outputText("你脱掉所有遮蔽物，兴奋地准备索取胜利的战利品。当你靠近时，天空惊恐地看着你，你的");
         if(get_player().hasCock())
         {
            outputText("[cock]已经因为枪声而变得坚挺");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]闪烁着准备就绪的光芒");
         }
         else
         {
            outputText("肛门伴随着星条旗永不落的节奏不祥地收缩着");
         }
         outputText("。你把它的脸拉到你的下体，要求它服务。");
         outputText("[pg]尽管有些忐忑不安，玛瑞斯的天空还是顺从了，舔舐着你的" + (get_player().hasCock() ? "阴茎" : (get_player().hasVagina() ? "小穴" : "屁眼")) + "。当它的舌头接触到的那一刻，你浑身一颤。一种欣快感传遍全身，你很高兴能在这里得到你应得的待遇。" + (getCampPopulation() > 0 ? "你觉得某些人可以从中学到一两招，你指责地环顾你的营地。" : "") + "你向前挺动臀部，将自己压向天空以求更多。它犹豫了一下，对这种交流始终不确定，但还是屈服于你的要求。");
         outputText("[pg]" + (get_player().hasCock() ? "天空向你敞开，将你的[cock]完全吞没" : "天空将它那宁静如天空般的舌头深深滑入你的" + (get_player().hasVagina() ? "肉褶" : "深处")) + "。你现在精力充沛地挺动臀部，沉浸在这一行为中。刺激的漩涡在你所能感知到的每一个接触点上起作用。你在极乐中呻吟，举起你的[weapon]开始向空中疯狂射击，用尽肺活量大声呼喊。");
         outputText("[pg]愿神保佑这片土地。");
         dynStats(DynStat.Str(1),DynStat.Tou(7),DynStat.Spe(7),DynStat.Inte(6));
         doNext(returnToCampUseOneHour);
      }
      
      public function shootTheSky() : void
      {
         clearOutput();
         var _loc1_:int = int(get_game().combat.calcWeaponDamage(false));
         _temp_1.skyDamage += _loc1_;
         if(saveContent.skyDamage < 1776)
         {
            outputText("行使你作为自由[man]不可剥夺的权利，你直接向天空开火。");
            outputText("<b>(<font color=\"" + get_mainViewManager().colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
            outputText("[pg]耶哈！愿神明保佑阿玛瑞莎！");
            doNext(returnToCampUseOneHour);
         }
         else
         {
            outputText("再次行使你神圣的权利，你向天空开火。");
            outputText("<b>(<font color=\"" + get_mainViewManager().colorHpMinus() + "\">" + _loc1_ + "</font>)</b>");
            outputText("[pg]屈服于你的力量，<b>(monster.MarethSky)</b>倒在地上，无法战斗。");
            outputText("[pg]你要强暴它吗？");
            saveContent.skyDamage = 0;
            doYesNo(skyRape,returnToCampUseOneHour);
         }
      }
      
      public function set_trueTimeQ(param1:Number) : Number
      {
         return get_game().timeQ = param1;
      }
      
      public function set_campQ(param1:Boolean) : Boolean
      {
         return get_game().campQ = param1;
      }
      
      public function setLevelButton() : Boolean
      {
         var _loc1_:* = null as String;
         if(get_player().canLevelUp())
         {
            if(get_gameplaySettings().autoLevel)
            {
               get_game().playerInfo.levelUpGo();
               return true;
            }
            get_mainView().setMenuButton("level","升级");
            get_mainView().levelButton.toolTipText = "升级以增加你的最大生命值并获得属性和特质点数。[pg]如果你有足够的经验升多级，你可以按住Shift点击一次性使用所有的升级。";
            get_mainView().showMenuButton("level");
            get_mainView().statsView.showLevelUp();
         }
         else if(get_player().canBuyStats())
         {
            get_mainView().setMenuButton("level","属性提升");
            _loc1_ = "分配你的属性点。[pg]你当前拥有 " + get_player().statPoints;
            get_mainView().levelButton.toolTipText = _loc1_ + " 点。";
            get_mainView().showMenuButton("level");
            get_mainView().statsView.showLevelUp();
         }
         else if(get_player().canBuyPerks())
         {
            get_mainView().setMenuButton("level","特质提升");
            _loc1_ = "使用你的特质点。[pg]你当前拥有 " + get_player().perkPoints;
            get_mainView().levelButton.toolTipText = _loc1_ + " 点。";
            get_mainView().showMenuButton("level");
            get_mainView().statsView.hideLevelUp();
         }
         else
         {
            get_mainView().hideMenuButton("level");
            get_mainView().statsView.hideLevelUp();
         }
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function returnToCampUseTwoHours() : void
      {
         returnToCamp(2);
      }
      
      public function returnToCampUseOneHour() : void
      {
         returnToCamp(1);
      }
      
      public function returnToCampUseFourHours() : void
      {
         returnToCamp(4);
      }
      
      public function returnToCampUseEightHours() : void
      {
         returnToCamp(8);
      }
      
      public function returnToCamp(param1:int) : void
      {
         if(!get_game().get_inCombat())
         {
            spriteSelect(null);
            imageSelect(null);
         }
         if(timesExplored < maxExplorations && param1 < 2 && get_game().exploration.currArea != null && get_player().isLongHaul() && !get_inDungeon())
         {
            clearOutput();
            outputText("你开始返回你的营地……[pg]");
            if(get_game().exploration.currArea != null)
            {
               doNext(get_game().exploration.currArea);
               timesExplored += 1;
               return;
            }
         }
         else
         {
            longHaulReset();
         }
         clearOutput();
         justReturnedToCamp = true;
         get_game().exploration.doneMermaidWalk = false;
         get_player().removeStatusEffect(StatusEffects.MermaidWatered);
         get_player().removeStatusEffect(StatusEffects.MermaidDehydrated);
         if(param1 == 1)
         {
            outputText("一个小时过去了……[pg]");
         }
         else
         {
            outputText(Utils.Num2Text(param1) + "个小时过去了……[pg]");
         }
         hideMenus();
         set_trueTimeQ(param1);
         goNext(param1,false);
      }
      
      public function rest() : void
      {
         var _loc4_:int = 0;
         set_campQ(true);
         clearOutput();
         var _loc1_:Number = 1;
         var _loc2_:Number = 4;
         var _loc3_:Number = 10;
         if(get_player().hasPerk(PerkLib.Medicine))
         {
            _loc3_ *= 1.5;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
         {
            _loc1_ += 0.5;
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            _loc1_ /= 2;
         }
         if(get_survival() && get_player().hunger < 25)
         {
            _loc1_ /= 2;
         }
         if(get_trueTimeQ() == 0)
         {
            _loc4_ = int(get_player().get_HP());
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) > 0)
            {
               while(get_player().get_HP() < get_player().maxHP() || get_player().get_fatigue() > 0)
               {
                  set_trueTimeQ(get_trueTimeQ() + 1);
                  get_player().HPChange(_loc3_ * _loc1_,false);
                  get_player().changeFatigue(-_loc2_ * _loc1_);
                  if(get_trueTimeQ() + get_time().hours == 24 || get_survival() && get_player().hunger < 5)
                  {
                     break;
                  }
               }
               if(get_trueTimeQ() == 0)
               {
                  set_trueTimeQ(1);
               }
               if(get_trueTimeQ() > 21 - get_time().hours)
               {
                  set_trueTimeQ(21 - get_time().hours);
               }
            }
            else
            {
               set_trueTimeQ(Math.min(4,21 - get_time().hours));
               get_player().HPChange(get_trueTimeQ() * _loc3_ * _loc1_,false);
               get_player().changeFatigue(get_trueTimeQ() * -_loc2_ * _loc1_);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
            {
               outputText("你走进你的小屋休息，躺在床上休息了" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。[pg]");
            }
            else
            {
               outputText("你躺下休息了" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。[pg]");
            }
            if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
            {
               outputText("你的休息非常不安稳，你无法平静下来。你起床时感到疲惫和不满足，脑海里总是想着玛布尔的奶水。[pg]");
               dynStats(DynStat.Tou(-0.1),DynStat.Inte(-0.1));
            }
            if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
            {
               outputText("找到那个给你这根被诅咒的[cock]的蜂女，让她在上面涂满蜂蜜的渴望随着时间的推移而增长。[pg]");
            }
            if(get_player().get_armor() == get_armors().GOOARMR && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) <= 0 && get_valeria().valeriaFluidsEnabled())
            {
               outputText("你感觉到那渴望液体的黏液在你的腹股沟上摩擦，就好像瓦莱丽娅想要你喂她一样。[pg]");
            }
            if(get_survival() && get_player().hunger < 25)
            {
               outputText("你难以休息，因为你的肚子咕咕叫，让你辗转反侧。[pg]");
            }
            get_player().HPChangeNotify(get_player().get_HP() - _loc4_);
         }
         else
         {
            clearOutput();
            get_images().showImage("camp-resting");
            if(get_trueTimeQ() != 1)
            {
               outputText("你继续休息了" + Utils.num2Text(get_trueTimeQ()) + "个小时。[pg]");
            }
            else
            {
               outputText("你继续休息了另一个小时。[pg]");
            }
            hideMenus();
         }
         goNext(get_trueTimeQ(),true);
      }
      
      public function reset() : void
      {
         saveContent.skyDamage = 0;
         saveContent.dummyBuilt = false;
         saveContent.dummyGender = 0;
         saveContent.dummyName = "";
         saveContent.storageMoveAll = false;
         saveContent.hasBeenImpSleepRaped = false;
         saveContent.didSoakInABarrel = false;
      }
      
      public function promptSaveUpdate() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         get_images().showImage("event-floppy");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) < 2)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,2);
            outputText("<b><u>警告</u></b>");
            outputText("\n看来你正在从原版 CoC 导入存档。");
            outputText("[pg]如果你打算覆盖原来的存档，请三思。如果你覆盖了原版游戏的存档，它将不再向下兼容原版 CoC。");
            outputText("[pg]我建议你创建单独的存档。我建议你使用 10-14 号存档位来保存你在这个模组中的进度。");
            outputText("[pg]废话不多说，尽情享受 CoC Revamp 模组带来的一切吧！");
            doNext(doCamp);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 2)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,3);
            outputText("从本模组的 0.8 版本开始，现在会奖励成就了。为了确保你不需要在新存档中再次经历那些场景，成就将根据标志（flags）来奖励。");
            outputText("[pg]然而，有些成就需要你重新完成。");
            updateAchievements();
            outputText("[pg]成就保存在一个特殊的存档文件中，所以无论你在哪个存档，任何获得的成就都会被添加到那个特殊的存档文件中。");
            doNext(doCamp);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 3)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2065,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2067,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2070,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2073,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,4);
            doCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 4)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,5);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) > 0 && get_player().statusEffectv1(StatusEffects.Kelt) <= 0)
            {
               clearOutput();
               outputText("由于一个在你击杀凯尔特后会导致弓箭技能重置的 bug，你的弓箭技能被重置了。幸运的是，现在这个问题已经修复了。作为补偿，你的弓箭技能现在直接升至满级！");
               if(get_player().statusEffectv1(StatusEffects.Kelt) <= 0)
               {
                  get_player().addMastery(MasteryLib.Bow,5,0);
               }
               doNext(doCamp);
               return;
            }
            doCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 5)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,6);
            if(get_player().get_armorName() == "revealing fur loincloths" || get_player().get_armorName() == "comfortable underclothes" || get_player().get_weaponName() == "dragon-shell shield")
            {
               clearOutput();
               outputText("由于装备结构进行了一些调整，任何被重新分类的装备（蛋壳盾和毛皮缠腰布）如果之前装备着，现在都会被卸下。");
               doNext(doCamp);
               if(get_player().get_armorName() == "comfortable underclothes")
               {
                  get_player().setArmor(ArmorLib.NOTHING);
               }
               if(get_player().get_armorName() == "revealing fur loincloths")
               {
                  get_inventory().takeItem(get_player().setArmor(ArmorLib.NOTHING),promptSaveUpdate);
               }
               if(get_player().get_weaponName() == "dragon-shell shield")
               {
                  get_inventory().takeItem(get_player().setUnarmed(),promptSaveUpdate);
               }
               return;
            }
            doCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 6)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,7);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1250,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2078,0);
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2200,100);
            }
            doCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 7)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,8);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2177,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2190));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2190,0);
            doCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 8)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,9);
            if(!get_player().hasFur())
            {
               doCamp();
               return;
            }
            clearOutput();
            outputText("从模组的 1.3 版本开始，毛皮颜色现在与头发颜色分开了。所以作为一次性福利，你现在可以选择毛皮颜色了！");
            furColorSelection1();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 9)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,10);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2019) > 0 && get_player().hasKeyItem("Marae\'s Lethicite"))
            {
               get_player().removeKeyItem("Marae\'s Lethicite");
               get_player().createKeyItem("Marae\'s Lethicite",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2019),0,0,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2019,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 10)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,11);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2108) > 0)
            {
               outputText("随着莉希丝的正式发布，你现在可以再次与她战斗了！准备好先面对蛛魔梦魇和牛头人国王吧！");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2108,0);
               doNext(doCamp);
               return;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 11)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,12);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2999,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 12)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,13);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) > 5)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,2004,FlagDict_Impl_.arrayReadInt(_loc1_,2004) - 2);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 13)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,14);
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            §§push(2310);
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            §§push(2295);
            if(!(2295 is Number))
            {
               throw "Class cast error";
            }
            var _temp_1:* = int(§§pop().arrayReadInt(§§pop(),int(§§pop())));
            §§push(_temp_1);
            if(!(_temp_1 is Number))
            {
               throw "Class cast error";
            }
            §§pop().arrayWriteInt(§§pop(),§§pop(),int(§§pop()));
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            §§push(2311);
            §§push(FlagDict_Impl_);
            §§push(KFLAGS.flags);
            §§push(2296);
            if(!(2296 is Number))
            {
               throw "Class cast error";
            }
            var _temp_2:* = int(§§pop().arrayReadInt(§§pop(),int(§§pop())));
            §§push(_temp_2);
            if(!(_temp_2 is Number))
            {
               throw "Class cast error";
            }
            §§pop().arrayWriteInt(§§pop(),§§pop(),int(§§pop()));
            KFLAGS.flags.remove(2295);
            KFLAGS.flags.remove(2296);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) == 14)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,15);
            KFLAGS.flags.remove(2194);
            KFLAGS.flags.remove(254);
            KFLAGS.flags.remove(255);
         }
         doCamp();
      }
      
      public function promptHangImpSkull() : void
      {
         clearOutput();
         get_images().showImage("item-impSkull");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) >= 100)
         {
            outputText("没有空间了；你已经挂了总共100个小恶魔头骨！没有小恶魔敢在晚上靠近你！");
            doNext(doCamp);
            return;
         }
         outputText("你想把小恶魔的头骨挂在墙上吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) > 0)
         {
            outputText("目前墙上挂着" + Utils.numberOfThings(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180),"个小恶魔头骨") + "，用来威慑任何试图强暴你的小恶魔。");
         }
         doYesNo(hangImpSkull,doCamp);
      }
      
      public function promptAscend() : void
      {
         clearOutput();
         get_images().showImage("event-question");
         outputText("你确定要飞升吗？这将重新开始游戏并让你进入");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            outputText("<b>新游戏+</b>");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 1)
         {
            outputText("<b>新游戏++</b>");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 2)
         {
            outputText("<b>新游戏+++</b>");
         }
         else
         {
            outputText("<b>新游戏+" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) + 1) + "</b>");
         }
         if(get_oldAscension())
         {
            outputText("。你的物品、等级和除腐化以外的属性将结转到新的周目中，你可以选择重置你的特质。");
         }
         else
         {
            outputText("。你的物品、等级、属性和特质将被重置。你将保留你找到的任何营地存储扩展，但不保留其中的内容。");
         }
         outputText("你将变回人类，但你将保留耳朵、角和尾巴的变形（如果有的话）。你可以改变你的名字和身体，并花费飞升点数购买特殊的飞升特质，或使某些特质和精通等级永久化。");
         outputText("[pg]<b>继续吗？</b>");
         doYesNo(ascendForReal,campActions);
      }
      
      public function placesCount() : int
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,211) > 0)
         {
            _loc1_++;
         }
         if(get_player().hasStatusEffect(StatusEffects.BoatDiscovery))
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1165) > 0)
         {
            _loc1_++;
         }
         if(dungeonFound())
         {
            _loc1_++;
         }
         if(farmFound())
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,506) > 0)
         {
            _loc1_++;
         }
         if(get_player().hasStatusEffect(StatusEffects.HairdresserMeeting))
         {
            _loc1_++;
         }
         if(get_player().statusEffectv1(StatusEffects.TelAdre) >= 1)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,44) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,821) >= 4)
         {
            _loc1_++;
         }
         if(get_game().sylviaScene.get_sylviaProg() >= 4)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function places() : Boolean
      {
         var _g1:NephilaCovenFollowerScene;
         var _g:Gargoyle;
         hideMenus();
         clearOutput();
         get_images().showImage("camp-pathfinder");
         outputText("你想去哪个地方？");
         menu();
         var _loc1_:ButtonDataList = new ButtonDataList();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,211) > 0)
         {
            _loc1_.add("集市",get_game().bazaar.enterTheBazaar,"参观奇特集市，恶魔和腐化生物经常在那里出没。");
         }
         if(get_player().hasStatusEffect(StatusEffects.BoatDiscovery))
         {
            _loc1_.add("船",get_game().boat.boatExplore,"上船探索湖泊。[pg]推荐等级：4");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1165) > 0)
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,825) == "")
            {
               _loc1_.add("大教堂",get_game().gargoyle.gargoylesTheShowNowOnWBNetwork,"参观你最近发现的废弃大教堂。");
            }
            else
            {
               _g = get_game().gargoyle;
               _loc1_.add("大教堂",function():void
               {
                  _g.returnToCathedral();
               },"参观[garg]居住的废弃大教堂。");
            }
         }
         if(dungeonFound() || get_debug())
         {
            _loc1_.add("地牢",dungeons,"深入地牢。");
         }
         if(farmFound())
         {
            _loc1_.add("农场",get_game().farm.farmExploreEncounter,"参观湖边惠特尼的农场。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) > 3)
         {
            _loc1_.add("巨树",get_game().forest.aikoScene.encounterAiko,"参观爱子居住的深林巨树。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,53) > 0)
         {
            _loc1_.add("露米的实验室",get_game().lumi.lumiEncounter,"去实验室拜访地精炼金术士露米。");
         }
         if(get_game().sylviaScene.get_sylviaProg() >= 4)
         {
            if(get_game().mothCave.doloresScene.get_doloresProg() == 7 && get_game().mothCave.doloresScene.get_doloresTime() < 6)
            {
               _loc1_.add("蛾女洞穴",get_game().mothCave.encounterCave,"你可能应该给她们一些时间。","蛾女洞穴",true);
            }
            else
            {
               _loc1_.add("蛾女洞穴",get_game().mothCave.encounterCave,"参观西尔维娅的家。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,506) == 1)
         {
            _loc1_.add("奥夫卡",get_game().owca.gangbangVillageStuff,"参观绵羊村奥夫卡，那里的村民" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,548) > 0 ? "曾经" : "现在") + "经常被迫向恶魔献祭。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,821) >= 4)
         {
            _loc1_.add("绿洲塔",get_game().highMountains.minervaScene.encounterMinerva,"参观米内瓦居住的高山废弃塔楼。");
         }
         if(get_player().hasStatusEffect(StatusEffects.HairdresserMeeting))
         {
            _loc1_.add("沙龙",get_game().mountain.salon.salonGreeting,"去地精开的理发店享受一下服务。");
         }
         if(get_player().statusEffectv1(StatusEffects.TelAdre) >= 1)
         {
            if(get_time().days < get_game().telAdre.kittens.saveContent.disabledDate)
            {
               _loc1_.add("特尔阿德雷",get_game().telAdre.telAdreMenu,"你是特尔阿德雷市的通缉犯。现在去那里会被逮捕，所以你必须等一段时间，希望守卫队忘记你的罪行。也许一个月吧。","Tel\'Adre",true);
            }
            else
            {
               _loc1_.add("特尔阿德雷",get_game().telAdre.telAdreMenu,"参观沙漠中的特尔阿德雷，那座巨大的塔楼很容易辨认。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,44) > 0)
         {
            _loc1_.add("城镇废墟",get_game().townRuins.exploreVillageRuin,"参观城镇废墟。");
         }
         if(nephilaCovenIsFollower())
         {
            _g1 = get_nephilaCovenFollowerScene();
            _loc1_.add("络新妇集会",function():void
            {
               _g1.nephilaCovenFollowerEncounter();
            },"让你的一位女儿打开通往络新妇集会宫殿的传送门，以便你可以去拜访。");
         }
         _loc1_.submenu(playerMenu);
         return true;
      }
      
      public function petsCount() : int
      {
         var _loc1_:int = 0;
         if(get_akky().isOwned())
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         var _loc2_:Boolean = saveContent.storageMoveAll;
         reset();
         saveContent.storageMoveAll = _loc2_;
      }
      
      public function nameDummy(param1:Boolean = false) : void
      {
         var _g1:Camp;
         var _loc3_:Boolean = false;
         clearOutput();
         saveContent.dummyName = getInput();
         var _loc2_:String = saveContent.dummyName;
         var _loc4_:String = _loc2_;
         if(_loc4_ == "")
         {
            outputText("[b:你必须给你的假人起个名字。]");
            menu();
            genericNamePrompt();
            _g1 = this;
            doNext(function():void
            {
               _g1.nameDummy();
            });
            return;
         }
         while(true)
         {
            if(_loc4_ != "Anzu")
            {
               if(_loc4_ != "Behemoth")
               {
                  if(_loc4_ != "Urta")
                  {
                     if(_loc4_ != "Fagnoxo")
                     {
                        if(_loc4_ != "Fen")
                        {
                           if(_loc4_ != "Fenoxo")
                           {
                              if(_loc4_ != "Jewnoxo")
                              {
                                 if(_loc4_ == "Lethice")
                                 {
                                    _loc3_ = _loc2_ == get_player().get_short();
                                    if(_loc3_ == true)
                                    {
                                       outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                    }
                                    else
                                    {
                                       outputText("你总是盯着你的目标。[pg]");
                                    }
                                    break;
                                 }
                                 if(_loc4_ != "Dummy")
                                 {
                                    if(_loc4_ != "Log")
                                    {
                                       if(_loc4_ != "Mannequin")
                                       {
                                          if(_loc4_ != "Punchbag")
                                          {
                                             if(_loc4_ != "Punching Bag")
                                             {
                                                if(_loc4_ != "Training")
                                                {
                                                   if(_loc4_ != "Training Dummy")
                                                   {
                                                      if(_loc4_ != "Wood")
                                                      {
                                                         if(_loc4_ == "Rathazul")
                                                         {
                                                            _loc3_ = _loc2_ == get_player().get_short();
                                                            if(_loc3_ == true)
                                                            {
                                                               outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                                            }
                                                            else
                                                            {
                                                               outputText("他到底对你做了什么？[pg]");
                                                            }
                                                            break;
                                                         }
                                                         if(_loc4_ == "Satan")
                                                         {
                                                            _loc3_ = _loc2_ == get_player().get_short();
                                                            if(_loc3_ == true)
                                                            {
                                                               outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                                            }
                                                            else
                                                            {
                                                               outputText("烧毁伪神的偶像！[pg]");
                                                            }
                                                            break;
                                                         }
                                                         if(_loc4_ != "Savcuck")
                                                         {
                                                            if(_loc4_ != "Savin")
                                                            {
                                                               _loc3_ = _loc2_ == get_player().get_short();
                                                               if(_loc3_ == true)
                                                               {
                                                                  outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                                               }
                                                               break;
                                                            }
                                                         }
                                                         _loc3_ = _loc2_ == get_player().get_short();
                                                         if(_loc3_ == true)
                                                         {
                                                            outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                                         }
                                                         else
                                                         {
                                                            outputText("被一块没有生命的木头戴绿帽子可能吗？你得自己去发现了。[pg]");
                                                         }
                                                         break;
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                                 _loc3_ = _loc2_ == get_player().get_short();
                                 if(_loc3_ == true)
                                 {
                                    outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                                 }
                                 else
                                 {
                                    outputText("你真有想象力。[pg]");
                                 }
                                 break;
                              }
                           }
                        }
                     }
                     _loc3_ = _loc2_ == get_player().get_short();
                     if(_loc3_ == true)
                     {
                        outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
                     }
                     else
                     {
                        outputText("可以理解，虽然他可能真的会喜欢这样。[pg]");
                     }
                     break;
                  }
               }
            }
            _loc3_ = _loc2_ == get_player().get_short();
            if(_loc3_ == true)
            {
               outputText("自残和抑郁是严重的心理问题，请寻求专业帮助。[pg]");
            }
            else
            {
               outputText("--不要偷这个假人--[pg]");
            }
            break;
         }
         if(param1)
         {
            outputText("那就叫[dummyname]吧。你想用它做什么？");
            trainingDummyScene.dummyMenu();
         }
         else
         {
            outputText("命名完毕，你现在有了一个全新的训练假人——[dummyname]！如果你想测试什么，现在就可以在营地的安全范围内进行。");
            outputText("[pg][b:([Dummyname]已添加到营地行动菜单中。)]");
            doNext(returnToCampUseTwoHours);
         }
      }
      
      public function malePartnersAtCampList() : Array
      {
         var _loc2_:* = null as Function;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null as Function;
         var _loc1_:IMap = new StringMap();
         _loc2_ = get_arianScene().arianMale;
         if("Arian" in StringMap.reserved)
         {
            _loc1_.setReserved("Arian",_loc2_);
         }
         else
         {
            _loc1_.h["Arian"] = _loc2_;
         }
         _loc2_ = get_nieve().isMale;
         if("Nieve" in StringMap.reserved)
         {
            _loc1_.setReserved("Nieve",_loc2_);
         }
         else
         {
            _loc1_.h["Nieve"] = _loc2_;
         }
         _loc2_ = get_emberScene().emberIsMasculine;
         if("Ember" in StringMap.reserved)
         {
            _loc1_.setReserved("Ember",_loc2_);
         }
         else
         {
            _loc1_.h["Ember"] = _loc2_;
         }
         _loc2_ = campCorruptJojo;
         if("Jojo" in StringMap.reserved)
         {
            _loc1_.setReserved("Jojo",_loc2_);
         }
         else
         {
            _loc1_.h["Jojo"] = _loc2_;
         }
         var _loc3_:IMap = _loc1_;
         var _loc4_:Array = companionsList();
         var _loc5_:Array = [];
         var _loc6_:IMap = _loc3_;
         var _loc7_:IMap = _loc6_;
         var _loc8_:* = _loc6_.keys();
         while(Boolean(_loc8_.hasNext()))
         {
            _loc9_ = _loc8_.next();
            _loc2_ = _loc7_.get(_loc9_);
            _loc10_ = _loc9_;
            _loc11_ = _loc10_;
            _loc12_ = _loc2_;
            if(Boolean(_loc12_()) && Boolean(_loc4_.contains(_loc11_)))
            {
               _loc5_.push(_loc11_);
            }
         }
         return _loc5_;
      }
      
      public function malePartnersAtCamp() : int
      {
         return int(malePartnersAtCampList().length);
      }
      
      public function magicsKnown() : int
      {
         var _loc1_:int = 1;
         if(get_player().hasPerk(PerkLib.TerrestrialFire))
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function magicChangeMenu() : void
      {
         var type1:int;
         var _g1:Camp;
         var type:int;
         var _g:Camp;
         clearOutput();
         outputText("有了一个安顿下来的地方，你可以检查你所研究的魔法领域。改变你接触巫术的方式可能会让你施展新的法术。");
         menu();
         _g = this;
         type = 0;
         addButton(0,"黑白魔法",function():void
         {
            _g.switchMagic(type);
         }).hint("这个世界上最常见的魔法流派。").disableIf(get_player().usingMagicBW(),"你当前正在使用这种魔法。");
         if(get_player().hasPerk(PerkLib.TerrestrialFire))
         {
            _g1 = this;
            type1 = 1;
            addButton(1,"地炎",function():void
            {
               _g1.switchMagic(type1);
            }).hint("由恶魔阿克巴尔创造的土与火之魔法。").disableIf(get_player().usingMagicTF(),"你目前正在使用这种魔法。");
         }
         else
         {
            addButtonDisabled(1,"???","你觉得还有某种魔法你尚未学会。");
         }
         addButton(14,"返回",campActions);
      }
      
      public function loversList() : Array
      {
         var _loc2_:* = null as Function;
         var _loc3_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Function;
         var _loc1_:IMap = new StringMap();
         _loc2_ = arianFollower;
         if("Arian" in StringMap.reserved)
         {
            _loc1_.setReserved("Arian",_loc2_);
         }
         else
         {
            _loc1_.h["Arian"] = _loc2_;
         }
         _loc2_ = followerHel;
         if("Helia" in StringMap.reserved)
         {
            _loc1_.setReserved("Helia",_loc2_);
         }
         else
         {
            _loc1_.h["Helia"] = _loc2_;
         }
         _loc2_ = get_izmaScene().izmaAtCamp;
         if("Izma" in StringMap.reserved)
         {
            _loc1_.setReserved("Izma",_loc2_);
         }
         else
         {
            _loc1_.h["Izma"] = _loc2_;
         }
         _loc2_ = get_isabellaFollowerScene().isabellaAtCamp;
         if("Isabella" in StringMap.reserved)
         {
            _loc1_.setReserved("Isabella",_loc2_);
         }
         else
         {
            _loc1_.h["Isabella"] = _loc2_;
         }
         _loc2_ = get_marbleScene().marbleAtCamp;
         if("Marble" in StringMap.reserved)
         {
            _loc1_.setReserved("Marble",_loc2_);
         }
         else
         {
            _loc1_.h["Marble"] = _loc2_;
         }
         _loc2_ = get_amilyScene().amilyFollowerPure;
         if("Amily" in StringMap.reserved)
         {
            _loc1_.setReserved("Amily",_loc2_);
         }
         else
         {
            _loc1_.h["Amily"] = _loc2_;
         }
         _loc2_ = followerKiha;
         if("Kiha" in StringMap.reserved)
         {
            _loc1_.setReserved("Kiha",_loc2_);
         }
         else
         {
            _loc1_.h["Kiha"] = _loc2_;
         }
         _loc2_ = nieveFollower;
         if("Nieve" in StringMap.reserved)
         {
            _loc1_.setReserved("Nieve",_loc2_);
         }
         else
         {
            _loc1_.h["Nieve"] = _loc2_;
         }
         _loc2_ = get_game().desert.antsScene.phyllaWaifu;
         if("Phylla" in StringMap.reserved)
         {
            _loc1_.setReserved("Phylla",_loc2_);
         }
         else
         {
            _loc1_.h["Phylla"] = _loc2_;
         }
         _loc3_ = get_helSpawnScene().get_helspawnName();
         _loc2_ = get_helSpawnScene().helspawnLover;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         var _loc4_:IMap = _loc1_;
         var _loc5_:Array = [];
         var _loc6_:IMap = _loc4_;
         var _loc7_:IMap = _loc6_;
         var _loc8_:* = _loc6_.keys();
         while(Boolean(_loc8_.hasNext()))
         {
            _loc3_ = _loc8_.next();
            _loc2_ = _loc7_.get(_loc3_);
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
            _loc11_ = _loc2_;
            if(Boolean(_loc11_()))
            {
               _loc5_.push(_loc10_);
            }
         }
         return _loc5_;
      }
      
      public function loversCount() : int
      {
         return int(loversList().length);
      }
      
      public function longHaulReset() : void
      {
         get_game().exploration.currArea = null;
         timesExplored = 0;
         maxExplorations = 1 + Utils.rand(2);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function isGuard(param1:String) : Boolean
      {
         return Boolean(campGuardList().contains(param1));
      }
      
      public function isForceSleepTime() : Boolean
      {
         if(get_time().hours < 24)
         {
            return get_time().hours < 4;
         }
         return true;
      }
      
      public function isCanSleepTime() : Boolean
      {
         if(get_time().hours < 21)
         {
            return get_time().hours < wakeupTime();
         }
         return true;
      }
      
      public function inspectSkulls() : void
      {
         clearOutput();
         outputText("你带着些许感伤的情绪走到营地围墙边。你在玛瑞斯[if (days < 60) {只待了很短的时间，但你仍然|已经待了很长时间了，所以你}]想花点时间回顾一下你的所作所为。确切地说，是你杀戮的战果。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) == 1)
         {
            outputText("[pg]你[walk]到挂在墙上的那个孤零零的小恶魔头骨前，盯着它的眼睛。这个小恶魔是谁？它是普通乌合之众的一员，还是有着更大的野心？如果它没有遇到你，会面临怎样的命运？[if (cor < 50) {它可能犯下过什么恶行|这个丑陋的污点还会在世上存在多久}]？无所谓了。它现在已经死了，只不过是这个地方残酷真相的一个孤零零的提醒罢了。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) < 15)
         {
            outputText("[pg]你挂在墙上的小恶魔头骨仍然有些稀疏，但你仍然能从中获得某种满足感。它们是一种声明，一种对你承诺的声明。任何人看到你的营地，都会知道你是一个什么样的[manboy]，以及你将继续成为什么样的[manboy]。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) < 100)
         {
            outputText("[pg]它们点缀在你的栅栏顶端，苍白且被太阳晒得褪色，像沉默的守望者。在这一点上，你收集了太多的小恶魔头骨，以至于实际上很难数清，但你为此感到自豪。甚至有某种程度的享受。虽然可能很可怕，但这堵墙是一件精心制作的纪念品，提醒着你在这里取得的成就。");
         }
         else
         {
            outputText("[pg]一堵名副其实的骨墙包围着木墙。老实说，你在上面挂了这么多头骨简直有些离谱，但看着它们，你只感到骄傲。这代表了你绝对的奉献精神和你坚定不移的意志。[if (isreligious) {你被送到这里是有原因的，而且你认真对待了你的任务|你想知道在玛瑞斯是否还有其他人[if (cor < 30) {像你一样为了清除恶魔大军做了这么多|收集了如此可观的藏品}]}]。你独自一人就杀死了一支小恶魔军团，而且你近期内完全没有停手的打算。");
         }
         outputText("[pg]过了一会儿，你找了个座位，只是花点时间看着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) == 1 ? "它" : "它们") + "。这可能不是最令人愉快或最吸引人的景象，但当你在这里放松时，你开始感到一种奇怪的平静。你的头脑变得清晰，当微风吹过，轻轻地吹得一块下颌骨嘎嘎作响时，你什么都不想。");
         outputText("[pg]过了一段时间你才决定起身，发现你的[legs]有点僵硬。是时候回去处理你的事务了，也许是时候收集更多了。");
         doNext(returnToCampUseOneHour);
      }
      
      public function homeDesc() : String
      {
         var _loc1_:* = null as String;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
         {
            _loc1_ = "小屋";
         }
         else
         {
            _loc1_ = "帐篷";
         }
         return _loc1_;
      }
      
      public function hasItemInStorage(param1:ItemType) : Boolean
      {
         return get_game().inventory.hasItemInStorage(param1);
      }
      
      public function hasCompanions() : Boolean
      {
         return companionsCount() > 0;
      }
      
      public function hasChest() : Boolean
      {
         if(!(get_player().hasKeyItem("Camp - Chest") || get_player().hasKeyItem("Camp - Murky Chest")))
         {
            return get_player().hasKeyItem("Camp - Ornate Chest");
         }
         return true;
      }
      
      public function hangImpSkull() : void
      {
         clearOutput();
         get_images().showImage("camp-wall-skull");
         outputText("你把小恶魔的头骨挂在墙上。");
         get_player().consumeItem(get_useables().IMPSKLL,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2180,FlagDict_Impl_.arrayReadInt(_loc1_,2180) + 1);
         outputText("目前墙上挂着" + Utils.numberOfThings(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180),"个小恶魔头骨") + "，用来威慑任何试图强暴你的小恶魔。");
         doNext(doCamp);
      }
      
      public function get_trueTimeQ() : Number
      {
         return get_game().timeQ;
      }
      
      public function get_debugName() : String
      {
         return "营地";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function get_campQ() : Boolean
      {
         return get_game().campQ;
      }
      
      public function get_builtWall() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 100;
      }
      
      public function get_builtGate() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2179) > 0;
      }
      
      public function get_builtCabin() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) >= 1;
      }
      
      public function get_builtBarrel() : Boolean
      {
         return true;
      }
      
      public function getUniqueKills() : int
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1250) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,128) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) == 2)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2275) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2660) == 3)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2657) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,548) == 2)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2658) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) == 1)
         {
            _loc1_++;
         }
         if(get_game().owca.saveContent.rebeccKilled)
         {
            _loc1_++;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_QUEST_DONE) > 0 && !get_akky().isOwned())
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 3)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1251) == 1)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1246) == 1)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1262) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1267) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1277) > 0)
         {
            _loc1_++;
         }
         if(get_game().bog.frogGirlScene.saveContent.taughtLesson > 2)
         {
            _loc1_++;
         }
         if(get_game().forest.lumberjackScene.saveContent.executed)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function getTotalKills() : int
      {
         var _loc1_:int = 0;
         _loc1_ += getUniqueKills();
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2203);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2204);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2374);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2202);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2205);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2375);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2725);
         _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2724);
         _loc1_ += get_game().swamp.alrauneScene.saveContent.alrauneKilled;
         _loc1_ += get_game().swamp.femaleSpiderMorphScene.saveContent.spidersKilled;
         _loc1_ += get_game().plagueRatScene.saveContent.ratsKilled;
         return int(_loc1_ + get_game().ivorySuccubusScene.saveContent.deadHookers);
      }
      
      public function getCampPopulation() : int
      {
         var _loc1_:int = 1;
         _loc1_ += companionsCount();
         _loc1_ += int(getCampKidBreakdown().total);
         _loc1_ += getCampMiscCount();
         if(get_anemoneScene().anemoneFollower())
         {
            _loc1_--;
         }
         if(ceraphIsFollower())
         {
            _loc1_--;
         }
         if(nephilaCovenIsFollower())
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function getCampMiscCount() : int
      {
         var _loc1_:int = 0;
         if(sophieFollower())
         {
            _loc1_ += FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740);
         }
         if(isabellaFollower())
         {
            _loc1_ += get_isabellaScene().totalIsabellaChildren();
         }
         if(get_player().get_armorName() == "goo armor")
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1053) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function getCampKidBreakdown() : Object
      {
         var _loc1_:* = {
            "dragon":0,
            "shark":0,
            "harpy":0,
            "cow":0,
            "ant":0,
            "drider":0,
            "anemone":0,
            "salamander":0,
            "total":0
         };
         if(followerEmber())
         {
            _loc1_.dragon = int(_loc1_.dragon) + get_emberScene().emberChildren();
         }
         if(followerKiha())
         {
            _loc1_.dragon = int(_loc1_.dragon) + get_kihaFollowerScene().totalKihaChildren();
         }
         if(izmaFollower())
         {
            _loc1_.shark = int(_loc1_.shark) + get_izmaScene().totalIzmaChildren();
         }
         if(sophieFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            _loc1_.harpy = int(_loc1_.harpy) + 1;
         }
         if(marbleFollower())
         {
            _loc1_.cow = int(_loc1_.cow) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8);
         }
         if(get_anemoneScene().anemoneFollower())
         {
            _loc1_.anemone = int(_loc1_.anemone) + 1;
         }
         if(get_helSpawnScene().get_helspawnName() != "" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) < 3)
         {
            _loc1_.salamander = int(_loc1_.salamander) + 1;
         }
         if(get_game().desert.antsScene.phyllaWaifu())
         {
            _loc1_.ant = int(_loc1_.ant) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874);
            _loc1_.drider = int(_loc1_.drider) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,894);
         }
         _loc1_.total = int(_loc1_.dragon) + int(_loc1_.shark) + int(_loc1_.harpy) + int(_loc1_.cow) + int(_loc1_.ant) + int(_loc1_.drider) + int(_loc1_.anemone) + int(_loc1_.salamander);
         return _loc1_;
      }
      
      public function furColorSelection2() : void
      {
         var color10:String;
         var _g10:Camp;
         var color9:String;
         var _g9:Camp;
         var color8:String;
         var _g8:Camp;
         var color7:String;
         var _g7:Camp;
         var color6:String;
         var _g6:Camp;
         var color5:String;
         var _g5:Camp;
         var color4:String;
         var _g4:Camp;
         var color3:String;
         var _g3:Camp;
         var color2:String;
         var _g2:Camp;
         var color1:String;
         var _g1:Camp;
         var color:String;
         var _g:Camp;
         menu();
         _g = this;
         color = "midnight black";
         addButton(0,"午夜黑",function():void
         {
            _g.chooseFurColorSaveUpdate(color);
         });
         _g1 = this;
         color1 = "black";
         addButton(1,"黑色",function():void
         {
            _g1.chooseFurColorSaveUpdate(color1);
         });
         _g2 = this;
         color2 = "dark gray";
         addButton(2,"深灰色",function():void
         {
            _g2.chooseFurColorSaveUpdate(color2);
         });
         _g3 = this;
         color3 = "gray";
         addButton(3,"灰色",function():void
         {
            _g3.chooseFurColorSaveUpdate(color3);
         });
         _g4 = this;
         color4 = "light gray";
         addButton(5,"浅灰色",function():void
         {
            _g4.chooseFurColorSaveUpdate(color4);
         });
         _g5 = this;
         color5 = "silver";
         addButton(6,"银色",function():void
         {
            _g5.chooseFurColorSaveUpdate(color5);
         });
         _g6 = this;
         color6 = "white";
         addButton(7,"白色",function():void
         {
            _g6.chooseFurColorSaveUpdate(color6);
         });
         addButton(9,"上一页",furColorSelection1);
         _g7 = this;
         color7 = "orange and white";
         addButton(10,"橙白相间",function():void
         {
            _g7.chooseFurColorSaveUpdate(color7);
         });
         _g8 = this;
         color8 = "brown and white";
         addButton(11,"棕白相间",function():void
         {
            _g8.chooseFurColorSaveUpdate(color8);
         });
         _g9 = this;
         color9 = "black and white";
         addButton(12,"黑白相间",function():void
         {
            _g9.chooseFurColorSaveUpdate(color9);
         });
         _g10 = this;
         color10 = "gray and white";
         addButton(13,"灰白相间",function():void
         {
            _g10.chooseFurColorSaveUpdate(color10);
         });
      }
      
      public function furColorSelection1() : void
      {
         var color7:String;
         var _g7:Camp;
         var color6:String;
         var _g6:Camp;
         var color5:String;
         var _g5:Camp;
         var color4:String;
         var _g4:Camp;
         var color3:String;
         var _g3:Camp;
         var color2:String;
         var _g2:Camp;
         var color1:String;
         var _g1:Camp;
         var color:String;
         var _g:Camp;
         menu();
         _g = this;
         color = "brown";
         addButton(0,"棕色",function():void
         {
            _g.chooseFurColorSaveUpdate(color);
         });
         _g1 = this;
         color1 = "chocolate";
         addButton(1,"巧克力色",function():void
         {
            _g1.chooseFurColorSaveUpdate(color1);
         });
         _g2 = this;
         color2 = "auburn";
         addButton(2,"赤褐色",function():void
         {
            _g2.chooseFurColorSaveUpdate(color2);
         });
         _g3 = this;
         color3 = "orange";
         addButton(3,"橙色",function():void
         {
            _g3.chooseFurColorSaveUpdate(color3);
         });
         addButton(4,"下一页",furColorSelection2);
         _g4 = this;
         color4 = "caramel";
         addButton(5,"焦糖色",function():void
         {
            _g4.chooseFurColorSaveUpdate(color4);
         });
         _g5 = this;
         color5 = "peach";
         addButton(6,"桃红色",function():void
         {
            _g5.chooseFurColorSaveUpdate(color5);
         });
         _g6 = this;
         color6 = "sandy brown";
         addButton(7,"沙棕色",function():void
         {
            _g6.chooseFurColorSaveUpdate(color6);
         });
         _g7 = this;
         color7 = "golden";
         addButton(8,"金色",function():void
         {
            _g7.chooseFurColorSaveUpdate(color7);
         });
      }
      
      public function followerslist() : Array
      {
         var _loc2_:* = null as Function;
         var _loc3_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Function;
         var _loc1_:IMap = new StringMap();
         _loc2_ = followerEmber;
         if("Ember" in StringMap.reserved)
         {
            _loc1_.setReserved("Ember",_loc2_);
         }
         else
         {
            _loc1_.h["Ember"] = _loc2_;
         }
         _loc2_ = get_valeria().valeriaFollower;
         if("Valeria" in StringMap.reserved)
         {
            _loc1_.setReserved("Valeria",_loc2_);
         }
         else
         {
            _loc1_.h["Valeria"] = _loc2_;
         }
         _loc2_ = get_jojoScene().jojoFollower;
         if("Jojo" in StringMap.reserved)
         {
            _loc1_.setReserved("Jojo",_loc2_);
         }
         else
         {
            _loc1_.h["Jojo"] = _loc2_;
         }
         _loc2_ = followerRathazul;
         if("Rathazul" in StringMap.reserved)
         {
            _loc1_.setReserved("Rathazul",_loc2_);
         }
         else
         {
            _loc1_.h["Rathazul"] = _loc2_;
         }
         _loc2_ = followerShouldra;
         if("Shouldra" in StringMap.reserved)
         {
            _loc1_.setReserved("Shouldra",_loc2_);
         }
         else
         {
            _loc1_.h["Shouldra"] = _loc2_;
         }
         _loc2_ = get_sophieFollowerScene().sophieFollowerAtCamp;
         if("Sophie" in StringMap.reserved)
         {
            _loc1_.setReserved("Sophie",_loc2_);
         }
         else
         {
            _loc1_.h["Sophie"] = _loc2_;
         }
         _loc3_ = get_helSpawnScene().get_helspawnName();
         _loc2_ = get_helSpawnScene().helspawnJustDaughter;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = get_holliScene().holliFollower;
         if("Holli" in StringMap.reserved)
         {
            _loc1_.setReserved("Holli",_loc2_);
         }
         else
         {
            _loc1_.h["Holli"] = _loc2_;
         }
         _loc2_ = anemoneFollower;
         if("Kid A" in StringMap.reserved)
         {
            _loc1_.setReserved("Kid A",_loc2_);
         }
         else
         {
            _loc1_.h["Kid A"] = _loc2_;
         }
         var _loc4_:IMap = _loc1_;
         var _loc5_:Array = [];
         var _loc6_:IMap = _loc4_;
         var _loc7_:IMap = _loc6_;
         var _loc8_:* = _loc6_.keys();
         while(Boolean(_loc8_.hasNext()))
         {
            _loc3_ = _loc8_.next();
            _loc2_ = _loc7_.get(_loc3_);
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
            _loc11_ = _loc2_;
            if(Boolean(_loc11_()))
            {
               _loc5_.push(_loc10_);
            }
         }
         return _loc5_;
      }
      
      public function followersCount() : int
      {
         return int(followerslist().length);
      }
      
      public function fixSave() : void
      {
         var _loc3_:int = 0;
         clearOutput();
         var _loc2_:int = 2337;
         while(_loc2_ < 2378)
         {
            _loc3_ = _loc2_++;
            outputText("标志" + _loc3_ + "的值" + Std.string(FlagDict_Impl_.arrayReadString(KFLAGS.flags,_loc3_)) + "正在被变移。\n");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,_loc3_ + 300,FlagDict_Impl_.arrayReadString(KFLAGS.flags,_loc3_));
         }
         outputText("牛头人相互作用数值正在修复[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2337,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2667));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2667,0);
         outputText("荡妇迷你裙开关正在修复[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2670,0);
         outputText("阿玛洛克损失正在修复[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2339,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2677));
         outputText("存档标记为已修复[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2677,1);
         outputText("每发现一个bug，OtherCoCAnon就会失去一分钟的生命。他大概还剩5年寿命。");
         KFLAGS.flags.remove(2340);
         KFLAGS.flags.remove(2341);
         KFLAGS.flags.remove(2342);
         KFLAGS.flags.remove(2343);
         KFLAGS.flags.remove(2344);
         KFLAGS.flags.remove(2345);
         KFLAGS.flags.remove(2346);
         KFLAGS.flags.remove(2347);
         KFLAGS.flags.remove(2348);
         KFLAGS.flags.remove(2349);
         KFLAGS.flags.remove(2350);
         KFLAGS.flags.remove(2351);
         KFLAGS.flags.remove(2352);
         KFLAGS.flags.remove(2353);
         KFLAGS.flags.remove(2354);
         KFLAGS.flags.remove(2355);
         KFLAGS.flags.remove(2356);
         KFLAGS.flags.remove(2357);
         KFLAGS.flags.remove(2358);
         KFLAGS.flags.remove(2359);
         KFLAGS.flags.remove(2360);
         KFLAGS.flags.remove(2361);
         KFLAGS.flags.remove(2362);
         KFLAGS.flags.remove(2363);
         KFLAGS.flags.remove(2364);
         KFLAGS.flags.remove(2365);
         KFLAGS.flags.remove(2366);
         KFLAGS.flags.remove(2367);
         KFLAGS.flags.remove(2368);
         KFLAGS.flags.remove(2369);
         KFLAGS.flags.remove(2370);
         KFLAGS.flags.remove(2371);
         KFLAGS.flags.remove(2372);
         KFLAGS.flags.remove(2373);
         KFLAGS.flags.remove(2374);
         KFLAGS.flags.remove(2375);
         KFLAGS.flags.remove(2376);
         KFLAGS.flags.remove(2377);
         doNext(playerMenu);
      }
      
      public function fixFlags() : void
      {
         if(get_game().dungeons.checkPhoenixTowerClear())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2086,1);
         }
      }
      
      public function femalePartnersAtCampList() : Array
      {
         var _loc2_:* = null as Function;
         var _loc9_:* = null as String;
         var _loc14_:* = null as String;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Function;
         var _loc1_:IMap = new StringMap();
         _loc2_ = get_emberScene().emberIsFeminine;
         if("Ember" in StringMap.reserved)
         {
            _loc1_.setReserved("Ember",_loc2_);
         }
         else
         {
            _loc1_.h["Ember"] = _loc2_;
         }
         _loc2_ = function():Boolean
         {
            return true;
         };
         if("Sophie" in StringMap.reserved)
         {
            _loc1_.setReserved("Sophie",_loc2_);
         }
         else
         {
            _loc1_.h["Sophie"] = _loc2_;
         }
         var _loc3_:IMap = _loc1_;
         var _loc4_:Array = malePartnersAtCampList();
         var _loc5_:Array = followerslist();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:Array = loversList().concat(slavesList());
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            if(!Boolean(_loc4_.contains(_loc9_)))
            {
               _loc6_.push(_loc9_);
            }
         }
         _loc8_ = _loc6_;
         var _loc10_:Array = [];
         var _loc11_:IMap = _loc3_;
         var _loc12_:IMap = _loc11_;
         var _loc13_:* = _loc11_.keys();
         while(Boolean(_loc13_.hasNext()))
         {
            _loc9_ = _loc13_.next();
            _loc2_ = _loc12_.get(_loc9_);
            _loc14_ = _loc9_;
            _loc15_ = _loc14_;
            _loc16_ = _loc2_;
            if(Boolean(_loc16_()) && Boolean(_loc5_.contains(_loc15_)))
            {
               _loc10_.push(_loc15_);
            }
         }
         return _loc8_.concat(_loc10_);
      }
      
      public function femalePartnersAtCamp() : int
      {
         return int(femalePartnersAtCampList().length);
      }
      
      public function farmFound() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.MetWhitney) && get_player().statusEffectv1(StatusEffects.MetWhitney) > 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,464) == 0)
            {
               return true;
            }
            if(get_player().isCorruptEnough(70) && softLevelMin(12) && get_game().farm.farmCorruption.corruptFollowers() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1075) == 0)
            {
               return true;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function exgartuanCampUpdate() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && (get_player().cockArea(0) < 100 || int(get_player().cocks.length) == 0))
            {
               clearOutput();
               get_images().showImage("camp-exgartuan-urine");
               outputText("<b>你突然感到一阵尿意，于是停在一些灌木丛旁。这花了比平时长得多的时间，一旦你完成了，你意识到你很长一段时间以来第一次独自一人。");
               if(get_player().hasCock())
               {
                  outputText("也许你变得太小了，埃克斯加图安无法承受？</b>[pg]");
               }
               else
               {
                  outputText("看来没有了你的男子气概，这个恶魔不想留下来。</b>[pg]");
               }
               get_player().removeStatusEffect(StatusEffects.Exgartuan);
               awardAchievement("尿急惹祸",113,true);
            }
            else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().biggestTitSize() < 12)
            {
               clearOutput();
               get_images().showImage("camp-exgartuan-milk");
               outputText("<b>黑色的乳汁从你的[nipple]滴落。它立刻消散在空气中，让你感到孤独。看来你变得太小了，埃克斯加图安待不下去了！");
               outputText("[pg]</b>");
               get_player().removeStatusEffect(StatusEffects.Exgartuan);
            }
         }
         doNext(playerMenu);
      }
      
      public function examinePortal() : void
      {
         clearOutput();
         get_images().showImage("camp-portal");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2058) <= 0)
         {
            outputText("你走到传送门前，回想起自己是如何以及为何来到这里的。你想知道自己是否还能回到英格纳姆。你先捡起一块小石头，把它扔进传送门。它穿过了传送门。当你绕到传送门后面时，你看到那块石头就在另一边。看来你现在回不去了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2058,1);
            doNext(returnToCampUseOneHour);
            return;
         }
         outputText("你走到传送门前，回想起自己是如何以及为何来到这里的。你叹了口气，知道自己无法回到英格纳姆了。");
         doNext(playerMenu);
      }
      
      public function enterVoid() : void
      {
         clearOutput();
         outputText("你凝视着天空，那覆盖了整个玛瑞斯的深渊。");
         outputText("[pg]你再次穿越了时空。");
         doNext(get_game().dungeons.manor.enterVoid);
      }
      
      public function enjoyANiceBarrel() : void
      {
         var _loc2_:int = 0;
         saveContent.didSoakInABarrel = true;
         clearOutput();
         registerTag("kida",TagFun_Impl_.fromBool(get_anemoneScene().anemoneFollower()));
         registerTag("latexy",TagFun_Impl_.fromBool(latexGooFollower()));
         registerTag("simpleskin",TagFun_Impl_.fromBool(get_player().skin.skinFurScales() == get_player().underBody.skinFurScales()));
         outputText("当你在营地里拖着步子走动时，[if (isday) {太阳的炙烤和}]空气中缺乏任何水分的感觉让[if (!isday) {}]你想要寻找任何机会去稍微躲避一下恶劣的天气。当然，你的[cabin]也好不到哪里去，尽管仅仅是想象一下那条小溪就让你感觉清爽了一些，但它离得太远了，你不会");
         var _loc1_:int = companionsCount();
         if(_loc1_ == 0)
         {
            outputText("照看这里的情况。");
         }
         else
         {
            _loc2_ = _loc1_;
            outputText("如果" + (_loc2_ == 1 ? companionsList()[0] : "任何人") + "需要你，你可以在附近。");
         }
         outputText("[pg]这时你想起了藏在营地角落里的那个木桶，里面装满了美味的水，光是想想就让你几乎要打个寒颤。");
         if(get_anemoneScene().anemoneFollower())
         {
            outputText("当然，现在里面有点挤，但是[if (height < 60) {你觉得你们俩很容易就能挤进去。|和[his]女儿亲密地依偎在一起，难道不是父母的特权吗？}]此外，这个小海葵可能比任何人都清楚，当有人像你一样强壮时，潜入水中感觉有多好。");
            if(izmaFollower())
            {
               outputText("[pg]好吧，也许伊兹玛也差不多。[if (latexy) {或者[latexyname]。}]但小A肯定名列前茅，而且你确信她会理解的。");
            }
         }
         else
         {
            outputText("毕竟现在也没有其他人在用它，而且看起来[if (height > 84) {可能会有点挤，但你能应付|大小刚刚好[if (height < 60) {可以作为你个人的游泳池|适合你}]。}]");
         }
         outputText("[pg]那就这么定了。[if (!isnaked) {因为不想弄湿你的[armor]，你脱下衣服，直到身上只剩下[if (hasscales) {引人注目的鳞片|[if (simpleskin) {[skinfurscales]|[skinfurscales]和[underbody.skinfurscales]}]}]。}]最后的难题就是怎么进去，而你的[merfolk]尾巴在离开大海后的局限性更是让这个问题雪上加霜。");
         if(get_player().canFly())
         {
            outputText("或者至少本来会是个难题，如果你不是像适应水一样适应空气的话。相反，这就像展开你的[wings]并像古老的龙一样升上天空一样简单，从上方潜入桶中，只留下一片水花[if (kida) {和小A惊讶的尖叫声}]。");
         }
         else
         {
            outputText("也许你可以设法把自己举过去，带着这个想法，你把手掌压在木桶的边缘，用尽全力向上推");
            if(get_player().get_str() > 50)
            {
               outputText("。凭借你相当大的力量，把自己拉起来并翻过去几乎毫不费力，当你伴随着水花滑入时，你的尾巴向外甩得很大。");
            }
            else
            {
               outputText("，摆动你的尾巴以获得任何可能帮助你把自己甩得足够高以滑入其中的动力。");
               if(get_player().get_str() > 20)
               {
                  outputText("令人惊讶的是，这居然奏效了。尽管粗糙的木头摩擦着你的指尖，你咬紧牙关承受着重负，你的身体倾尽全力，直到[if (kida) {好奇的小A从桶里探出头来看你，[if (kidaxp < 40) {愣了一下才认出你，然后|毫不犹豫地}]伸手把你拉了进去|你的尾巴擦过桶沿，你顺势让身体的其余部分也跟了进去}]。");
               }
               else
               {
                  outputText("很快你的呼吸加快，你的肌肉燃烧和疼痛，无论你的意志多么坚强，木桶似乎都是一个不可逾越的敌人。伴随着颤抖的叹息，你被迫松开抓地力，以一种不优雅的姿势瘫倒在地上。");
                  if(get_anemoneScene().anemoneFollower())
                  {
                     outputText("[pg][say:嗯……救命？]");
                     outputText("[pg]随着你的呼吸渐渐平缓，眼前的世界重新聚焦，你眨了眨眼，[if (isday) {迎着光亮|驱散了黑暗}]，映入眼帘的是你的海葵孩子充满关切的脸庞，她正从她家边缘[if (kidaxp < 40) {羞怯地|茫然地}]探出头来。[if (kidaxp < 40) {你只需点点头，|甚至都不需要你点头，}]她就以一种令你羡慕的轻松姿态从桶里爬了出来。虽然在女儿把你从地上扶起来时，被她那冰凉的双臂拥抱感觉有点傻，但你还是很感激她的帮助。");
                     outputText("[pg]就在这时，她毫不客气地把你连同水花一起倒过边缘，然后自己又爬了进去。");
                  }
                  else
                  {
                     outputText("不过，你可不会这么轻易就被吓倒。在短暂的休息恢复后，你开始用附近能找到的任何零碎物品为自己搭建一个最简陋的坡道：松动的石头、营地的箱子、[if (builtchair) {你小屋里的那把椅子|你仓库里的一些圆木}]。完工时它看起来并不起眼，而且搭建它消耗的体力可能比泡在水里恢复的还要多，但这更多是为了证明自己。退一万步说，当你拖着身子爬上那些参差不齐的石头和粗糙的木头，最终成功爬进桶里时，至少能让你沉浸在胜利的快感之中。");
                  }
               }
            }
         }
         outputText("[pg]里面水的第一次抚摸像潮水一样稳定地洗去了你的疲劳，让你的肺部充满了新的目标，当");
         if(get_anemoneScene().anemoneFollower())
         {
            outputText("小A在你身边安顿下来，显然不确定你这次为什么爬进来，但你用手臂搂住女儿似乎就足以作为回答了。当她依偎在你的怀抱中时，感觉相当[if (height > 84) {拥挤，但依然}]温馨。你们以自己独特的两栖方式增进感情，[if (isday) {日常生活的喧嚣渐渐褪去，只剩下温柔的水波声|夜晚宁静祥和}]，你的尾巴慵懒地缠绕在她的腿上，你把她拉近，[if (height < 60) {把头靠在她的肩膀上|[if (height < 72) {互相依偎|让她把头靠在你的肩膀上}]}]。你可以毫不费力地一直陪在她身边，像吸收周围凉爽的水一样贪婪地享受着她的依恋，让[if (height < 60) {她像宠爱[if (ischild) {她的|一个}]孩子一样宠爱你|[if (height < 72) {世界在沉默中流逝|你的手指缠绕在她黏糊糊的头发里}]}]，你们俩心满意足地看着[sun]光随着你尾巴的每一次摆动在你的[underbody.skinfurscales]上闪烁。");
         }
         else
         {
            outputText("你潜入水桶边缘之下，尽情享受着周围[if (isday) {令人舒适的|令人心旷神怡的}]清凉。就好像你注定要在这里一样，这是一片只属于你自己的私人海洋，外面的世界不过是水面之外的一抹扭曲的幻影。你可以泡上几个小时，让压力从四肢中消散，当你毫不费力地[if (height < 60) {游动|漂浮}]时，时间如涟漪般悄然流逝。");
         }
         outputText("[pg]尽管如此，无论你多么想留下来，你也不能永远待在这里。无论你是否准备好，地表上的生活都在继续，恶魔们不会停止他们的脚步，而且[if (!kida && str <= 20) {你惹出的烂摊子总得有人来收拾|总有更多的事情要做}]。你失望地叹了口气，吸了一口干涩的空气[if (kida) {，向你的女儿道别，}]然后翻过木桶的边缘[if (!kida && str <= 20) {，感谢你的坡道让你能一路颠簸滑下去|[if (str > 50) { 并将自己降到地面|[if (kida) { 在你女儿的帮助下|，笨拙地摔在地上，像个肉团}]}]}]。这几乎让你想再爬回去，但不，你必须为陆地上的生活做好准备，并且[if (!kida && str <= 20) {开始把你的储物箱推回你的[cabin]|继续你[day]的剩余部分}]。");
         if(get_anemoneScene().anemoneFollower())
         {
            outputText("[pg]当你最后一次看一眼木桶时，小A向你挥手。");
         }
         get_player().hasGottenWashed();
         doNext(returnToCampUseTwoHours);
      }
      
      public function engenderDummy(param1:int = 0) : void
      {
         var option2:int;
         var _g3:Camp;
         var option1:int;
         var _g2:Camp;
         var option:int;
         var _g1:Camp;
         var _g:Camp;
         var _loc2_:* = null as IMap;
         switch(param1)
         {
            case 1:
               clearOutput();
               outputText("你锯下来的一块主杆似乎很合适，这个就行了。");
               outputText("[pg]你设法用它雕刻出一个合适的模拟阴茎，并将其打磨得足够光滑以去除任何潜在的碎片。钉了几根钉子后，它牢固而骄傲地坐在假人的胯部。还有别的吗？");
               _temp_1.dummyGender += 1;
               get_player().changeFatigue(5);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) - 1);
               get_player().addKeyValue("Carpenter\'s Toolbox",1,-4);
               break;
            case 2:
               clearOutput();
               outputText("你只有一些木板可以用来做这个。好吧，那就做成圆锥形的乳房吧。");
               outputText("[pg]几分钟后，你的假人现在有了一个相当惊人的胸部，虽然可能有些不切实际且棱角分明。还有别的吗？");
               _temp_2.dummyGender += 2;
               get_player().changeFatigue(5);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2005,FlagDict_Impl_.arrayReadInt(_loc2_,2005) - 2);
               get_player().addKeyValue("Carpenter\'s Toolbox",1,-8);
               break;
            case 3:
               clearOutput();
               outputText("这就是你所需要的全部。你迅速在它的头上雕刻出一张粗糙的脸，然后将木桩埋入地下足够深以使其不会摇晃，用几块石头固定它，然后退后一步欣赏你的作品。这没什么特别值得吹嘘的，但总的来说，这是一件坚固的、希望能用很久的训练设备。很实用。");
               outputText("[pg]那么，你应该给它起个名字。每样东西都需要一个名字。它会叫什么？");
               menu();
               genericNamePrompt();
               _g = this;
               doNext(function():void
               {
                  _g.nameDummy();
               });
               return;
         }
         menu();
         _g1 = this;
         option = 3;
         addNextButton("确定",function():void
         {
            _g1.engenderDummy(option);
         }).hint("就这样完事。");
         _g2 = this;
         option1 = 2;
         addNextButton("乳房",function():void
         {
            _g2.engenderDummy(option1);
         }).hint("来点老式的木制乳房会很不错。").disableIf(saveContent.dummyGender >= 2,"你已经添加过那个了。");
         _g3 = this;
         option2 = 1;
         addNextButton("鸡巴",function():void
         {
            _g3.engenderDummy(option2);
         }).hint("你需要在那上面装一根又粗又好的假阳具。").disableIf(int(saveContent.dummyGender % 2) == 1,"你已经添加过那个了。");
      }
      
      public function dungeons() : void
      {
         var fromEnterDungeon:Boolean;
         var _g:WizardTower;
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) > 0 || get_debug())
         {
            addButton(0,"工厂",get_game().dungeons.factory.enterDungeon).hint("参观山里的恶魔工厂。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0 ? "[pg]你已经成功关闭了工厂。" : "工厂仍在运行。玛莱希望你关闭工厂！") + (get_game().dungeons.checkFactoryClear() ? "[pg]已通关！" : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) > 0 || get_debug())
         {
            addButton(1,"深邃洞穴",get_game().dungeons.deepcave.enterDungeon).hint("参观你在深林中发现的洞穴。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) > 0 ? "[pg]你已经击败了你的老对手泽塔兹。" : "") + (get_game().dungeons.checkDeepCaveClear() ? "[pg]已通关！" : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) > 0 || get_debug())
         {
            addButton(2,"据点",get_game().lethicesKeep.enterD3).hint("参观高山中属于恶魔女王莉希丝的据点。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 ? "[pg]你已经击败了莉希丝并终结了恶魔的威胁。恭喜，你已经通关了主线故事！" : "") + (get_game().dungeons.checkLethiceStrongholdClear() ? "[pg]已通关！" : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,856) > 0 || get_debug())
         {
            addButton(5,"沙漠洞穴",get_game().dungeons.desertcave.enterDungeon).hint("参观你在沙漠中发现的洞穴。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0 ? "[pg]据你所知，这里是沙漠女巫的发源地。" : "") + (get_game().dungeons.checkSandCaveClear() ? "[pg]已通关！" : ""));
         }
         if(get_game().dungeons.checkPhoenixTowerClear() || get_debug())
         {
            addButton(6,"不死鸟高塔",get_game().dungeons.heltower.returnToHeliaDungeon).hint("重新参观你作为赫莉娅任务一部分去过的塔楼。" + (get_game().dungeons.checkPhoenixTowerClear() ? "[pg]你已经在任务中帮助了赫莉娅并解决了问题。[pg]已通关！" : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2672) > 0 || get_debug())
         {
            addButton(7,"旧庄园",get_game().dungeons.manor.enterDungeon).hint("参观俯瞰森林山谷的被诅咒的庄园。" + ((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0 ? "[pg]你已经杀死了死灵法师并终结了他对自然不可名状的侵犯。[pg]已通关！" : ""));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2682) > 0 || get_debug())
         {
            _g = get_game().dungeons.wizardTower;
            fromEnterDungeon = false;
            addButton(8,"欺骗之塔",function():void
            {
               _g.enterDungeonpt2(fromEnterDungeon);
            }).hint("参观火山岩中的黑曜石塔。" + ((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) != 0 ? "[pg]你已经让维尔库斯安息，并了解了审判官们的命运。[pg]已通关！" : ""),"欺骗之塔");
         }
         addButton(14,"返回",places);
      }
      
      public function dungeonFound() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,856) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) > 0)
         {
            return true;
         }
         if(get_game().dungeons.checkPhoenixTowerClear())
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2672) > 0)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2682) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function doWait() : void
      {
         set_campQ(true);
         clearOutput();
         get_images().showImage("camp-waiting");
         var _loc1_:Number = 2;
         if(get_player().hasPerk(PerkLib.SpeedyRecovery))
         {
            _loc1_ *= 1.5;
         }
         if(get_player().hasPerk(PerkLib.ControlledBreath))
         {
            _loc1_ *= 1.1;
         }
         if(get_player().hasPerk(PerkLib.SpiderBedding))
         {
            _loc1_ += 12;
         }
         if(get_trueTimeQ() == 0)
         {
            set_trueTimeQ(4);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) > 0)
            {
               set_trueTimeQ(21 - get_time().hours);
            }
            outputText("你等待了" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "……[pg]");
            if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
            {
               outputText("你等待的时间非常不安稳，你无法平静下来。你起床时感到疲惫和不满足，脑海里总是想着玛布尔的奶水。[pg]");
               _loc1_ /= 2;
               get_player().changeFatigue(-_loc1_ * get_trueTimeQ());
            }
            if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
            {
               outputText("找到那个给你这根被诅咒的[cock]的蜂女，让她在上面涂满蜂蜜的渴望随着时间的推移而增长。[pg]");
            }
            if(get_player().get_armor() == get_armors().GOOARMR && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) <= 0)
            {
               outputText("你感觉到那渴望液体的黏液在你的腹股沟上摩擦，就好像瓦莱丽娅想要你喂她一样。[pg]");
            }
            else
            {
               get_player().changeFatigue(-_loc1_ * get_trueTimeQ());
            }
         }
         else if(get_trueTimeQ() != 1)
         {
            outputText("你继续等待了" + Utils.num2Text(get_trueTimeQ()) + "个小时。[pg]");
         }
         else
         {
            outputText("你继续等待了另一个小时。[pg]");
         }
         goNext(get_trueTimeQ(),true);
      }
      
      public function doSleep(param1:Boolean = true) : void
      {
         var _loc2_:* = null as Array;
         if(get_game().urta.pregnancy.get_incubation() == 0 && get_game().urta.pregnancy.get_type() == 25 && (get_time().hours >= 20 || get_time().hours < 2))
         {
            get_urtaPregs().preggoUrtaGivingBirth();
            return;
         }
         get_player().sleeping = true;
         set_campQ(true);
         if(get_trueTimeQ() == 0)
         {
            get_time().minutes = 0;
            set_trueTimeQ(calculateHoursUntilHour(wakeupTime()));
            if(get_player().autoSave && !get_player().gameOver && !get_hardcore() && get_player().slotName != "VOID")
            {
               get_game().saves.saveGame(get_player().slotName);
            }
            if(param1)
            {
               clearOutput();
            }
            get_player().autoSleepPerks();
            if(get_helFollower().helAffection() >= 70 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,483) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 0)
            {
               get_game().dungeons.heltower.heliaDiscovery();
               sleepRecovery(false);
               return;
            }
            if(get_player().hasCock() && followerShouldra() && get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
            {
               if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,520) == 0)
               {
                  get_shouldraFollower().shouldraAndExgartumonFightGottaCatchEmAll();
                  sleepRecovery(false);
                  return;
               }
               if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,520) == 3)
               {
                  get_shouldraFollower().exgartuMonAndShouldraShowdown();
                  sleepRecovery(false);
                  return;
               }
            }
            if(get_player().hasCock() && followerShouldra() && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,520) == -0.5)
            {
               get_shouldraFollower().keepShouldraPartIIExgartumonsUndeatH();
               sleepRecovery(false);
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0 && (FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "" || FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble"))
            {
               outputText("你走进你的小屋，准备就寝。");
            }
            if(get_marbleScene().marbleAtCamp() && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble")
            {
               get_images().showImage("camp-sleep-marble");
               if(get_marbleScene().marbleNightSleepFlavor())
               {
                  sleepRecovery(false);
                  return;
               }
            }
            else
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Arian" && get_arianScene().arianFollower())
               {
                  get_images().showImage("camp-sleep-arian");
                  get_arianScene().sleepWithArian();
                  return;
               }
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Ember" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,523) >= 75 && followerEmber())
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2206) <= 3)
                  {
                     get_emberScene().sleepWithEmber();
                     return;
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 2)
                  {
                     get_images().showImage("camp-sleep-ember-female");
                  }
                  else
                  {
                     get_images().showImage("camp-sleep-ember-male");
                  }
                  outputText("你蜷缩在烬的身边，打算睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。烬将" + get_emberScene().emberMF("his","her") + "的一只翅膀披在你身上，为你保暖。[pg]");
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie" && (get_sophieBimbo().bimboSophieAtCamp() || get_sophieFollowerScene().sophieFollowerAtCamp()))
               {
                  get_images().showImage("camp-sleep-sophie");
                  if(Utils.rand(4) == 0)
                  {
                     outputText("你蜷缩在索菲身边，打算睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"hour") + "。她用长满羽毛的手臂环抱着你，将下巴依偎在你的肩膀上。她沉重的乳房平贴在你的背上，给你一个相当纯洁的脸颊吻，然后飘向了梦乡...");
                  }
                  else if(Utils.rand(3) == 0)
                  {
                     outputText("当你准备上床睡觉时，你看到索菲已经比你先到了那里。她仰面躺着，双臂伸展，向着她乳沟的深谷做出微小的召唤动作。你依偎着她，她柔软如枕的乳房支撑着你的头，她那熟悉的心跳声伴你入睡，持续了" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。");
                  }
                  else if(Utils.rand(2) == 0)
                  {
                     outputText("当你躺下准备睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"hour") + "时，你发现鹰身女妖索菲正和你一起依偎在毯子下。她滑入你的臂弯，引导你的手摸向她巨大的乳房，她的臀部已经紧贴着你的腰部。她低语道，[say:明早有得你想的了……做个好梦。]然后她安顿下来准备过夜。");
                  }
                  else
                  {
                     outputText("当你去睡觉时，索菲和你一起钻进了被窝，打算休息" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"hour") + "。她睡在你旁边，几乎没有碰到你。在你们俩睡着之前，你深情地抚摸着她的肩膀。");
                  }
                  outputText("[pg]");
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helia" && get_game().helScene.followerHel())
               {
                  get_images().showImage("camp-sleep-helia");
                  get_helFollower().heliaSleep();
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn")
               {
                  get_helSpawnScene().helspawnSleep();
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "salamanders")
               {
                  get_helFollower().salamandersSleep();
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Amily")
               {
                  outputText("打算睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "，艾米莉和你紧紧地依偎在一起。当她满足地将头靠在你的[chest]上时，你感觉到她老鼠般的尾巴缠绕着[if (isbiped) {your leg|you}]。[pg]");
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Izma")
               {
                  _loc2_ = ["当你走向你的[cabin]时，你发现伊兹玛迅速立正。[say:准备好睡觉了吗，我的阿尔法？]你点点头，拉着她和你一起上床，很快就深情地依偎在一起。","伊兹玛在你的[cabin]外准备好了，微笑着看着你走近。你带她一起上床，把她拉到舒适的床单里，立刻得到了紧紧的拥抱。[say:睡个好觉，我的阿尔法，]她一边说一边在你的脖子上蹭着。","睡眠的诱惑将你拉向床铺，你再次带上了你的鲨鱼情人。伊兹玛高兴地跟着你钻进被窝，和你依偎在一起。你觉得，她继续做一个令人愉悦的顺从的贝塔，紧紧地抱着你。[say:晚安，我的阿尔法，]她在闭上眼睛并在你们相互的拥抱中放松之前说道"];
                  outputText(_loc2_[Utils.rand(int(_loc2_.length))] + "[pg]");
               }
               else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Kiha" && !get_kihaFollowerScene().saveContent.wakeUp)
               {
                  outputText("当你准备睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"hour") + "时，奇哈急切地在你的[cabin]里加入了你。她把头靠在你的胸前，你用一只手臂紧紧地环抱着她。当你把她紧紧抱在怀里时，笑容在她的脸上蔓延开来。她低语道，[say:我爱你，笨蛋。]");
               }
               else if(get_cabin().get_bedBears() == 10)
               {
                  outputText("你小心翼翼地躺下，以免压坏盖在床上的那堆熊。当你进入梦乡，睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"hour") + "时，它们的存在让你充满了一种温暖和纯真的感觉。[pg]");
               }
               else
               {
                  outputText("你蜷缩起来，打算睡上" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。[pg]");
               }
            }
            sleepRecovery(true);
         }
         else
         {
            clearOutput();
            outputText("你躺下继续睡完剩下的" + Utils.numberOfThings(int(Math.round(get_trueTimeQ())),"个小时") + "。[pg]");
         }
         goNext(get_trueTimeQ(),true);
      }
      
      public function doCamp() : void
      {
         var _g4:Camp;
         var _g3:Camp;
         var _g2:Camp;
         var _g1:Camp;
         var _g:Camp;
         if(get_hardcore() && !get_player().gameOver)
         {
            get_game().saves.saveGame(get_hardcoreSlot());
         }
         get_game().set_inCombat(false);
         get_game().dungeons.usingAlternative = false;
         get_player().location = "camp";
         get_game().resetParsers(true);
         longHaulReset();
         get_mainView().endCombatView();
         get_mainView().clearBottomButtons();
         get_mainView().showMenuButton("newGame");
         if(get_player().hasStatusEffect(StatusEffects.PostAkbalSubmission))
         {
            get_player().removeStatusEffect(StatusEffects.PostAkbalSubmission);
            get_game().forest.akbalScene.akbalSubmissionFollowup();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.PostAnemoneBeatdown))
         {
            get_player().HPChange(Math.round(get_player().maxHP() / 2),false);
            get_player().removeStatusEffect(StatusEffects.PostAnemoneBeatdown);
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,"");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2677) == 0)
         {
            hideMenus();
            clearOutput();
            outputText("这个存档似乎没有经过标志变移修复。如果这是来自Revamp的存档，只需点击\"Revamp\"。如果这是OtherCoCAnon的存档，那么请点击\"修复我\"来完成所有必要的标志操作以保持稳定。");
            menu();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2677,1);
            addButton(0,"修复我",fixSave).hint("如果你的存档是旧版的OtherCoCAnon（1.1.7.11版本之前），请点击这个。");
            addButton(1,"Revamp",doCamp).hint("如果这是一个Revamp存档，并且你以前没有玩过这个模组，请点击这里。");
            return;
         }
         get_inventory().fixStorage();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,418) == 0 && !get_player().hasHistoryPerk())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,418,2);
            hideMenus();
            get_game().charCreation.chooseHistory();
            return;
         }
         fixFlags();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2223) == 0 && get_player().hasKeyItem("Golden Antlers"))
         {
            clearOutput();
            get_images().showImage("item-gAntlers");
            outputText("突然，一根手杖出现在你的" + bedDesc() + "上。它看起来曾经属于魔王。也许手杖已经被引入游戏中，而你已经向魔王复仇了？无论如何，你捡起了它。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2223,1);
            get_inventory().takeItem(get_weapons().HNTCANE,doCamp);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2066) < get_game().modSaveVersion)
         {
            promptSaveUpdate();
            return;
         }
         if(justReturnedToCamp)
         {
            if(get_undergarments().SEA_SHIRT.campEventsMajor())
            {
               hideMenus();
               justReturnedToCamp = false;
               doNext(playerMenu);
               return;
            }
         }
         if(!get_marbleScene().marbleFollower())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1063) == 1 && get_player().isPureEnough(40))
            {
               hideMenus();
               get_marblePurification().pureMarbleDecidesToBeLessOfABitch();
               return;
            }
         }
         else
         {
            if(get_player().isPureEnough(50) && !campCorruptJojo() && !get_amilyScene().amilyCorrupt() && !vapulaSlave() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1064) >= 200 && !get_player().hasPerk(PerkLib.MarblesMilk))
            {
               hideMenus();
               get_marblePurification().BLUHBLUH();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1062) == 0 && !get_player().isPureEnough(50))
               {
                  hideMenus();
                  get_marblePurification().marbleWarnsPCAboutCorruption();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1062) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1063) == 0 && !get_player().isPureEnough(60))
               {
                  hideMenus();
                  get_marblePurification().marbleLeavesThePCOverCorruption();
                  return;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1058) == 1 && get_time().hours == wakeupTime())
            {
               hideMenus();
               get_marblePurification().rathazulsMurbelReport();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1061) == 1 && get_time().hours == wakeupTime())
            {
               hideMenus();
               get_marblePurification().claraShowsUpInCampBECAUSESHESACUNT();
               return;
            }
         }
         if(arianFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,951) == 1)
         {
            hideMenus();
            get_arianScene().wakeUpAfterArianSleep();
            return;
         }
         if(arianFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,953) >= 30)
         {
            hideMenus();
            get_arianScene().arianEggingEvent();
            return;
         }
         if(arianFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,955) >= 24 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,940) > 0)
         {
            hideMenus();
            get_arianScene().arianLaysEggs();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2207) > 0 && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_emberScene().postEmberSleep();
            return;
         }
         if(get_amilyScene().saveContent.amilyMorning && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_amilyScene().amilyWakeUp();
            return;
         }
         if(get_helSpawnScene().saveContent.wakeUp && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_helSpawnScene().helspawnWakeUp();
            return;
         }
         if(get_sophieBimbo().saveContent.cuddlingDaughter && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_sophieBimbo().daughterAwaken();
            return;
         }
         if(get_kihaFollowerScene().saveContent.wakeUp && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_kihaFollowerScene().morning();
            return;
         }
         if(get_izmaScene().nightmareFollowupTime() && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_izmaScene().daughterWakeup();
            return;
         }
         if(get_izmaScene().saveContent.izmaMorning && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_izmaScene().wakeTogether();
            return;
         }
         if(get_marbleScene().highLibidoTryst && get_time().hours == wakeupTime())
         {
            hideMenus();
            get_marbleScene().marbleNightLustEnd();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,646) > 0)
         {
            hideMenus();
            get_game().xmas.jackFrost.processJackFrostEvent();
            return;
         }
         if(!get_player().hasKeyItem("Super Reducto") && milkSlave() && get_rathazul().followerRathazul() && get_rathazul().get_mixologyXP() >= 16)
         {
            hideMenus();
            get_milkWaifu().ratducto();
            return;
         }
         if(get_nieve().nieveAvailable() && get_time().hours == wakeupTime())
         {
            if(get_player().hasKeyItem("Nieve\'s Tear") && !nieveFollower())
            {
               get_nieve().returnOfNieve();
               hideMenus();
               return;
            }
            if(get_nieve().get_stage() == 0)
            {
               hideMenus();
               get_nieve().snowLadyActive();
               return;
            }
            if(get_nieve().get_stage() == 4)
            {
               hideMenus();
               get_nieve().nieveComesToLife();
               return;
            }
         }
         if(isHalloween() && get_time().hours >= 21 && int(get_date().getFullYear()) > get_game().aliceScene.saveContent.trystOrTreatedYear)
         {
            hideMenus();
            get_game().aliceScene.trystOrTreatIntro();
            return;
         }
         if(get_game().helScene.followerHel())
         {
            if(get_helFollower().isHeliaBirthday() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,928) == 0 && get_time().hours >= 18)
            {
               hideMenus();
               get_helFollower().heliasBirthday();
               return;
            }
            if(get_game().helScene.pregnancy.get_isPregnant())
            {
               switch(get_game().helScene.pregnancy.eventTriggered())
               {
                  case 2:
                     hideMenus();
                     get_helSpawnScene().bulgyCampNotice();
                     return;
                  case 3:
                     hideMenus();
                     get_helSpawnScene().heliaSwollenNotice();
                     return;
                  case 4:
                     hideMenus();
                     get_helSpawnScene().heliaGravidity();
                     return;
                  default:
                     if(get_game().helScene.pregnancy.get_incubation() == 0 && get_time().hours == wakeupTime())
                     {
                        hideMenus();
                        get_helSpawnScene().heliaBirthtime();
                        return;
                     }
               }
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) >= 7)
         {
            hideMenus();
            get_helSpawnScene().helSpawnGraduation();
            return;
         }
         if(get_time().hours >= 10 && get_time().hours <= 18 && (int(get_time().days % 20) == 0 || get_time().hours == 12) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2 && get_helSpawnScene().helspawnFollower())
         {
            hideMenus();
            get_helSpawnScene().maiVisitsHerKids();
            return;
         }
         if(get_time().hours == wakeupTime() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1 && int(get_time().days % 30) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,974) == 0 && get_helSpawnScene().helspawnFollower())
         {
            hideMenus();
            get_helSpawnScene().spiderBrosGift();
            return;
         }
         if(get_time().hours >= 10 && get_time().hours <= 18 && (int(get_time().days % 15) == 0 || get_time().hours == 12) && get_helSpawnScene().helspawnFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,975) == 0)
         {
            hideMenus();
            get_helSpawnScene().hakonAndKiriComeVisit();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,972) == 0 && (Utils.rand(10) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) == 6))
         {
            hideMenus();
            get_helSpawnScene().helspawnDiscoversBooze();
            return;
         }
         if(!(959 in KFLAGS.flags.h) && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) > 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) >= 3 && get_time().hours >= 10 && get_time().hours <= 18))
         {
            hideMenus();
            get_helSpawnScene().helSpawnChoosesAFightingStyle();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 2 && get_time().hours == wakeupTime() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,961) >= 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,973) == 1 && 959 in KFLAGS.flags.h)
         {
            get_helSpawnScene().helspawnAllGrownUp();
            return;
         }
         if((sophieFollower() || bimboSophie()) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,741,0);
            get_sophieBimbo().sophieKidMaturation();
            hideMenus();
            return;
         }
         if(bimboSophie() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,739) == 0 && get_sophieScene().pregnancy.get_event() >= 2)
         {
            hideMenus();
            get_sophieBimbo().sophieMoveInAttempt();
            return;
         }
         if(!get_nieve().nieveAvailable() && get_time().hours == wakeupTime() && get_nieve().get_stage() > 0)
         {
            get_nieve().nieveIsOver();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,163) == 1)
         {
            get_game().amilyScene.postBirthingEndChoices();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,163,2);
            return;
         }
         if(get_trueTimeQ() > 0)
         {
            if(!get_campQ())
            {
               clearOutput();
               outputText("更多的时间过去了……[pg]");
               goNext(get_trueTimeQ(),false);
               return;
            }
            if(get_time().hours < 6 || get_time().hours > 20)
            {
               doSleep();
            }
            else
            {
               rest();
            }
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,100) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) >= 8)
            {
               get_holliScene().getASprout();
               hideMenus();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) >= 7)
            {
               get_holliScene().fuckPlantGrowsToLevel2();
               hideMenus();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) >= 25)
            {
               get_holliScene().flowerGrowsToP3();
               hideMenus();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,597) >= 40)
            {
               get_holliScene().treePhaseFourGo();
               hideMenus();
               return;
            }
         }
         if(get_holliScene().holliFollower() && jojoFollower())
         {
            get_holliScene().JojoTransformAndRollOut();
            hideMenus();
            return;
         }
         if(get_amilyScene().amilyFollowerPure() && get_holliScene().holliFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2653) < 1)
         {
            get_holliScene().amilyHatesTreeFucking();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,599) == 1 && !get_amilyScene().amilyFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 0)
         {
            get_holliScene().amilyComesBack();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,599,2);
            hideMenus();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.CampAnemoneTrigger))
         {
            get_player().removeStatusEffect(StatusEffects.CampAnemoneTrigger);
            get_anemoneScene().anemoneKidBirthPtII();
            hideMenus();
            return;
         }
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && (get_player().cockArea(0) < 100 || int(get_player().cocks.length) == 0))
         {
            exgartuanCampUpdate();
            return;
         }
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().biggestTitSize() < 12)
         {
            exgartuanCampUpdate();
            return;
         }
         if(isabellaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) >= 10 && get_player().hasKeyItem("Breast Milker - Installed At Whitney\'s Farm"))
         {
            get_isabellaFollowerScene().milktasticLacticLactation();
            hideMenus();
            return;
         }
         if(isabellaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2220) == 0)
         {
            get_valeria().isabellaAndValeriaSpar();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,381) == 1 && isabellaFollower() && get_marbleScene().marbleAtCamp())
         {
            get_isabellaFollowerScene().angryMurble();
            hideMenus();
            return;
         }
         if(get_player().get_pregnancyIncubation() <= 280 && get_player().get_pregnancyType() == 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,681) == 0 && (get_time().hours == 6 || get_time().hours == 7))
         {
            get_game().telAdre.cotton.goTellCottonShesAMomDad();
            hideMenus();
            return;
         }
         if(bimboSophie() && hasItemInStorage(get_consumables().OVIELIX) && Utils.rand(5) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,284) == 0 && get_player().get_gender() > 0)
         {
            get_sophieBimbo().sophieEggApocalypse();
            hideMenus();
            return;
         }
         if(!get_game().urtaQuest.urtaBusy() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 0 && Utils.rand(10) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,146) >= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,147) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,347) == 1 && get_amilyScene().amilyFollowerPure() && !get_amilyScene().pregnancy.get_isPregnant())
         {
            get_finter().amilyUrtaReaction();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,79) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
         {
            get_finter().findJojosNote();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,83) == 0 && Utils.rand(5) == 0 && get_rathazul().followerRathazul() && campCorruptJojo())
         {
            get_finter().rathazulFreaksOverJojo();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,237) == 1)
         {
            get_izmaScene().newMarbleMeetsIzma();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,236) == 1)
         {
            get_izmaScene().newAmilyMeetsIzma();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,86) == 0 && get_amilyScene().amilyFollowerPure() && get_marbleScene().marbleAtCamp())
         {
            get_finter().marbleVsAmilyFreakout();
            hideMenus();
            return;
         }
         if(vapulaSlave() && (jojoFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2068) <= 0 || get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2069) <= 0))
         {
            if(jojoFollower() && !get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2068) == 0)
            {
               get_vapula().mouseWaifuFreakout(false,true);
            }
            else if(get_amilyScene().amilyFollowerPure() && !jojoFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2069) == 0)
            {
               get_vapula().mouseWaifuFreakout(true,false);
            }
            else
            {
               get_vapula().mouseWaifuFreakout(true,true);
            }
            hideMenus();
            return;
         }
         if(followerKiha() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) == 144)
         {
            get_kihaFollowerScene().kihaTellsChildrenStory();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 2 && get_game().helScene.followerHel() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,697) == 0)
         {
            get_helFollower().helFollowersIntro();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,697) > 9000 && get_game().helScene.followerHel() && isabellaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0)
         {
            get_helFollower().angryHelAndIzzyCampHelHereFirst();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756) == 100 && get_allowChild() && get_izmaScene().saveContent.daysSinceAneFight > 72 && Utils.rand(30) == 0)
         {
            get_izmaScene().anemoneWrasslin();
            hideMenus();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 && !get_izmaScene().saveContent.kidDick && Utils.rand(40) == 0)
         {
            get_izmaScene().kidDickBullying();
            hideMenus();
            return;
         }
         if((get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDRA) != 0 && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.RATCLUE) == 0 && get_game().swamp.alrauneScene.saveContent.vineTimer >= 5)
         {
            get_game().swamp.alrauneScene.ratClue();
            hideMenus();
            return;
         }
         if(helspawnFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756) >= 50 && !get_helSpawnScene().saveContent.sippedAnemone && Utils.rand(10) == 0)
         {
            get_helSpawnScene().helspawnDrinkKidAJuice();
            hideMenus();
            return;
         }
         if(get_kihaFollowerScene().totalKihaChildren() > 0 && !get_game().kihaFollowerScene.saveContent.kidFirebreathing && Utils.rand(30) == 0)
         {
            get_kihaFollowerScene().kihaChildFirebreathing();
            hideMenus();
            return;
         }
         if(amilyFollower() && get_amilyScene().saveContent.metKids == 0 && Utils.rand(50) == 0)
         {
            get_amilyScene().amilyKidMeeting();
            hideMenus();
            return;
         }
         if(followerEmber() && get_time().days - get_emberScene().saveContent.birthTime < 14 && get_player().isLactating() && Utils.rand(50) == 0)
         {
            get_emberScene().emberPlayerFeeds();
            hideMenus();
            return;
         }
         if(nieveFollower() && !get_nieve().saveContent.kidsPlayed && Utils.rand(25) == 0 && int(getCampKidBreakdown().total) > 0)
         {
            get_nieve().nieveCampKids();
            hideMenus();
            return;
         }
         if(helspawnFollower() && !get_helSpawnScene().saveContent.surprised && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,969) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2638) != 0) && get_time().hours == wakeupTime() && Utils.randomChance(2))
         {
            get_helSpawnScene().helspawnSurprise();
            hideMenus();
            return;
         }
         if(justReturnedToCamp && !saveContent.didSoakInABarrel && get_player().isFullMermaid() && hasChest() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2272) < 3 && Utils.randomChance(0.15 * get_player().get_fatigue100() + 1))
         {
            justReturnedToCamp = false;
            enjoyANiceBarrel();
            hideMenus();
            return;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,788,0);
         set_campQ(false);
         if(get_player().hasStatusEffect(StatusEffects.SlimeCravingOutput))
         {
            get_player().removeStatusEffect(StatusEffects.SlimeCravingOutput);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,95,0);
         get_mainView().showMenuButton("appearance");
         get_mainView().showMenuButton("perks");
         get_mainView().showMenuButton("stats");
         get_mainView().showMenuButton("data");
         showStats();
         get_mainView().setMenuButton("newGame","主菜单",get_game().mainMenu.mainMenu);
         get_mainView().newGameButton.hint("返回主菜单。","主菜单");
         hideUpDown();
         if(setLevelButton())
         {
            return;
         }
         clearOutput();
         updateAchievements();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
         {
            get_images().showImage("camp-cabin");
         }
         else
         {
            get_images().showImage("camp-tent");
         }
         if(justReturnedToCamp)
         {
            get_undergarments().SEA_SHIRT.campEventsMinor();
         }
         if(isabellaFollower())
         {
            outputText("自从伊莎贝拉搬进来后，你的营地变得舒适多了。地毯覆盖了大部分贫瘠的地面，绑在岩石上的简单遮阳篷提供了阴凉，手工制作的木制家具提供了舒适的坐卧之处。");
         }
         else
         {
            if(get_time().days < 10)
            {
               outputText("你的营地目前还相当简陋。帐篷和铺盖卷放在通往传送门的岩石前,你还有一个小火坑。");
            }
            if(get_time().days >= 10 && get_time().days < 20)
            {
               outputText("你的营地开始看起来很有‘生活气息’了。火坑周围用你布置的一些岩石明确界定，你的铺盖卷和帐篷已经搭在了最受岩石庇护的区域。");
            }
            if(get_time().days >= 20)
            {
               if(!isabellaFollower())
               {
                  outputText("就一个营地而言，你的新家已经足够舒适了。");
               }
               outputText("火坑");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
               {
                  outputText("");
               }
               else
               {
                  outputText("和帐篷都");
               }
               outputText("搭建得很完美，维护得当。");
            }
         }
         if(get_time().days >= 20)
         {
            outputText("你甚至设法在营地周围的岩石上雕刻了一些艺术品。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) == 7)
         {
            outputText("有一个未完工的木制结构。目前，它只是个勉强钉在一起的框架。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) == 8)
         {
            outputText("有一个未完工的小屋。它目前缺少窗户和门。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) == 9)
         {
            outputText("有一个快完工的小屋。从外面看它很完整，但里面没有地板。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) >= 10)
         {
            outputText("你的小屋位于营地边缘附近。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1053) > 0)
         {
            get_marblePurification().claraCampAddition();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) == 100 && marbleFollower())
         {
            outputText("玛布尔在岩石间建了一个相当安全的育儿室，用来安置你");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 0)
            {
               outputText("未来的孩子们");
            }
            else
            {
               outputText("的" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) + "个孩子");
            }
            outputText("。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1)
            {
               outputText("在你的营地边缘附近，有一个你的女儿用高高堆起的岩石建成的较小的鹰身女妖巢穴。它有点可怜，但她似乎对自己的成就感到自豪。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) <= 3)
            {
               outputText("在你的营地边缘，有一堆不断增高的石头。现在它已经大到可以被认为是一座小山了，上面点缀着几个勉强够两个人住的小鹰身女妖巢穴。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) <= 4)
            {
               outputText("营地边缘的鹰身女妖群落已经变得相当大了。它比传送门周围的大多数立石都要高，而且现在巢穴比鹰身女妖还要多。你时不时会看到她们四个合力搬运一块不知从哪里拖来的巨石加在上面。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) <= 10)
            {
               outputText("群落已经变得相当大了。现在它有近两层楼高，上面点缀着巢穴，中心有镂空的地方。它被聚集的鹰身女妖留下的许多羽毛所包围。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) <= 20)
            {
               outputText("一座高耸的鹰身女妖群落在你的营地边缘拔地而起，里面住满了你所有的鹰身女妖后代。现在它至少有三层楼高，已经开始像一个安全的建筑了。这些鹰身女妖总是在重建和扩建它。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) <= 50)
            {
               outputText("一座巨大的鹰身女妖群落耸立在你的营地边缘。它几乎完全由无缝拼接在一起的石头建成，有许多壁架和悬垂物用于筑巢。那里日夜都有持续不断的活动嗡嗡声。");
            }
            else
            {
               outputText("一座巨大的鹰身女妖群落占据了你营地的边缘，高耸于其他部分之上。无数的鹰身女妖在它周围飞来飞去，总是在上面工作，下面还有少数不幸不会飞的姐妹协助。");
            }
            outputText("[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.DefenseCanopy))
         {
            outputText("一棵多刺的树在营地中心附近发芽，在传送门和你的营地周围长出了一层由带刺藤蔓组成的保护性树冠。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) < 100)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) / 20 == 0)
            {
               outputText("一堵厚厚的木墙已经竖起，足以提供少量的防御。");
            }
            else
            {
               outputText("一堵厚厚的木墙已经竖起，足以提供少量的防御。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 100)
         {
            outputText("一堵厚厚的木墙已经竖起；它们包围了你营地一半的周长，并提供了良好的防御，留下另一半开放以便通往溪流。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2179) > 0)
            {
               outputText("在墙的中间建了一扇门；它在晚上关闭以防止任何入侵者。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) == 1)
               {
                  outputText("大门附近安装了一个小恶魔头骨");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) < 5)
               {
                  outputText("大门附近安装了几个小恶魔头骨");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) < 15)
               {
                  outputText("大门附近安装了好几个小恶魔头骨");
               }
               else
               {
                  outputText("许多小恶魔头骨装饰着大门和墙壁，有些甚至被刺穿在木钉上");
               }
               outputText("以起到威慑作用。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) == 1)
               {
                  outputText("目前有一个头骨。");
               }
               else
               {
                  outputText("目前有" + Utils.numberOfThings(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180),"头骨") + "。");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) == 1)
               {
                  get_output().text("你环顾营地四周，发现了一个大理石小恶魔雕像。");
               }
               else
               {
                  get_output().text("点缀在环绕你营地的墙上，你注意到" + Utils.numberOfThings(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304),"大理石小恶魔雕像") + ". ");
               }
            }
            outputText("[pg]");
         }
         else
         {
            outputText("你的临时住所周围有一些陷阱，但它们相当简单，可能无法对恶魔起到什么威慑作用。");
         }
         outputText("传送门像往常一样在背景中闪烁，看起来很险恶，提醒着你为什么来到这里。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 1000)
         {
            outputText("离它很近的地方有一个小入口，通向由你的蚂蚁孩子们建造的地下迷宫。而且由于菲拉的愿望，时不时会有一个你的孩子从这个入口出来，检查传送门附近的情况。现在你知道，任何人都很难在不被注意的情况下靠近传送门，或者从传送门出来，这让你感到安全了一点。");
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,542) == 1)
         {
            outputText("自从烬开始" + emberMF("他","她") + "对抗牛头人种群的“十字军东征”以来，头骨开始在" + get_emberScene().emberMF("他","她") + "的巢穴入口两侧堆积起来。数量相当多。[pg]");
         }
         if(get_holliScene().holliFollower())
         {
            outputText("在外围，半掩在一块岩石后面，有一棵非常健康的巨树。它长得相当快，但现在似乎已经完全发育了。玛莱腐化的子嗣霍莉住在里面。[pg]");
         }
         campFollowers(true);
         if(get_amilyScene().amilyFollowerPure())
         {
            if(get_holliScene().holliFollower())
            {
               outputText("艾米莉已经把她的草垫搬到了营地与那棵奇怪的树相对的另一边；她时不时地用怀疑的目光看着它，似乎在决定是否要搬得更远。[pg]");
            }
            else
            {
               outputText("一个出奇整洁的巢穴，由柔软的草和散发着甜味的香草建成，靠近你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 ? "小屋" : "铺盖卷") + "。一条补丁摞补丁的毯子整齐地盖在上面，进一步证明了艾米莉睡在这里。她每隔几天就会更换一次垫草，以确保它尽可能保持舒适。[pg]");
            }
         }
         campLoversMenu(true);
         campSlavesMenu(true);
         get_akky().locationDesc("营地");
         justReturnedToCamp = false;
         if(get_nieve().saveContent.kidsPlayed && isSaturnalia())
         {
            outputText("营地里矗立着一个有些粗糙的雪人，是尼芙和你的孩子" + (get_nieve().saveContent.kidsPlayedSingular ? "" : "们") + "在玩耍时堆的。[pg]");
         }
         if(get_survival() && get_player().hunger < 25)
         {
            outputText("<b>你必须吃点东西了；你的肚子正在" + (get_player().hunger < 1 ? "痛苦地" : "大声地") + "咕咕叫。</b>");
            if(get_player().hunger < 10)
            {
               outputText("<b>你正在变瘦，而且正在流失肌肉。</b>");
            }
            if(get_player().hunger <= 0)
            {
               outputText("<b>由于饥饿，你变得越来越虚弱。</b>");
            }
            outputText("[pg]");
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            if(get_player().hasStatusEffect(StatusEffects.Dysfunction))
            {
               outputText("<b>你被性欲折磨得虚弱不堪，但你的性器官麻木了，唯一能发泄的方法就是找个紧致的东西操或者被操……</b>[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,60) > 0 && get_player().isTaur())
            {
               outputText("<b>你被性欲折磨得虚弱不堪，但你的性器官太难够到了，以至于自慰并不是你脑海中最先想到的。</b>[pg]");
            }
            else
            {
               outputText("<b>你被性欲折磨得虚弱不堪，除了自慰什么也想不了。</b>[pg]");
            }
         }
         if(get_time().hours < 6 || get_time().hours > 20)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1279) == 0)
            {
               outputText("外面很黑，天空中没有星星让情况变得更糟。一轮血红的月亮挂在天空中，似乎在注视着你，但几乎没有提供什么光亮。" + (get_time().hours < 6 ? "天太黑了，无法离开营地。" : "") + "[pg]");
            }
            else
            {
               switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2272))
               {
                  case 0:
                  case 1:
                     outputText("外面很黑。繁星点缀着夜空。一轮血红的月亮挂在天空中，似乎在注视着你，但几乎没有提供什么光亮。" + (get_time().hours < 6 ? "天太黑了，无法离开营地。" : "") + "[pg]");
                     break;
                  case 2:
                     outputText("外面很黑。天空被云层覆盖，你可以隐约辨认出云层中的红点，那大概就是月亮。" + (get_time().hours < 6 ? "天太黑了，无法离开营地。" : "") + "[pg]");
                     break;
                  case 3:
                     outputText("外面很黑。天空被云层覆盖，雨水倾泻在地面上。" + (get_time().hours < 6 ? "天太黑了，无法离开营地。" : "") + "[pg]");
                     break;
                  case 4:
                     outputText("外面很黑。天空被云层覆盖，雨水倾泻在地面上，偶尔天空会闪过闪电。" + (get_time().hours < 6 ? "天太黑了，无法离开营地。" : "") + "[pg]");
                     break;
                  default:
                     outputText("外面很黑。[b:天气似乎奇怪地无效。][pg]");
               }
            }
            if(companionsCount() > 0 && get_time().hours < 6)
            {
               outputText("你的营地很安静，因为你的同伴们现在正在睡觉。[pg]");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1279) > 0)
            {
               switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2272))
               {
                  case 0:
                     outputText("阳光明媚，照亮了现在蔚蓝的天空。");
                     break;
                  case 1:
                     outputText("阳光明媚，照亮了现在蔚蓝的天空。天空中偶尔点缀着云朵，似乎形成了不同的形状。");
                     break;
                  case 2:
                     outputText("天空是浅灰色的，因为它被云层覆盖。");
                     break;
                  case 3:
                     outputText("天空相当暗，因为它被向大地倾泻雨水的云层覆盖。");
                     break;
                  case 4:
                     outputText("天空很暗，因为它布满了下雨的深灰色云层，偶尔天空会闪过闪电。");
                     break;
                  default:
                     outputText("[b:天空是黑色的，闪烁着绿色的0和1，看来天气系统坏了！]");
               }
            }
            if(get_time().hours == 19)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2272) < 2)
               {
                  outputText("太阳靠近地平线，准备落山。");
               }
               else
               {
                  outputText("虽然你看不见太阳，但地平线附近的天空开始发出橙色的光芒。");
               }
            }
            if(get_time().hours == 20)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2272) < 2)
               {
                  outputText("太阳已经落入地平线以下。天空闪耀着橙色的光芒。");
               }
               else
               {
                  outputText("即使有云层遮挡，地平线附近的天空也闪耀着明亮的橙色。此时太阳可能已经下山了。");
               }
            }
            outputText("外面天亮了，正是探索和寻找物资来加固营地的好时机。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) <= 0 && get_time().days >= 14)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2004,1);
            clearOutput();
            get_images().showImage("camp-dream");
            outputText("你意识到你已经连续两周每晚都睡在帐篷里了。你想知道是否有什么方法能让你睡得更舒服惬意。也许建一间小木屋就足够了？");
            doNext(playerMenu);
            return;
         }
         if(!get_hermUnlocked())
         {
            if(get_player().get_gender() == 3)
            {
               set_hermUnlocked(true);
               outputText("[pg]<b>恭喜！你已在角色创建中解锁了双性人选项，可在新游戏+中访问！</b>");
               get_game().saves.savePermObject();
            }
         }
         dynStats();
         menu();
         addButton(0,"探索",get_game().exploration.doExplore).hint("探索这片土地，或前往之前发现的区域。");
         addButton(1,"地点",places).hint("前往你目前发现的所有地点。").disableIf(placesCount() <= 0 && !get_debug(),"你还没有发现任何地点……");
         addButton(2,"物品栏",get_inventory().inventoryMenu).hint("物品栏可以让你查看或使用你的物品。");
         addButton(3,"储藏",get_inventory().stash).hint("藏匿处可以让你安全地存放物品，直到日后需要它们。");
         addButton(4,"营地行动",campActions).hint("与营地周围环境互动。");
         if(followersCount() > 0)
         {
            _g = this;
            addButton(5,"追随者",function():void
            {
               _g.campFollowers();
            }).hint("查看加入你营地的追随者和同伴。");
         }
         if(loversCount() > 0)
         {
            _g1 = this;
            addButton(6,"情人",function():void
            {
               _g1.campLoversMenu();
            }).hint("查看你目前邀请到营地的情人并与他们互动。");
         }
         if(slavesCount() > 0)
         {
            _g2 = this;
            addButton(7,"奴隶",function():void
            {
               _g2.campSlavesMenu();
            }).hint("查看你奴役的人并与他们互动。");
         }
         var _loc1_:Boolean = !get_player().hasStatusEffect(StatusEffects.Dysfunction) && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,60) == 0 && !get_player().isTaur());
         get_game().masturbation.setMasturbateButton();
         addButton(9,"等待",doWait).hint("等待4个小时。[pg]按住Shift点击可等待至夜幕降临。");
         if(get_player().get_fatigue() > 30 || get_player().get_HP() / get_player().maxHP() <= 0.9)
         {
            addButton(9,"休息",rest).hint("休息四个小时。[pg]按住Shift点击可休息至完全恢复或天黑。");
         }
         if(get_time().hours >= 21 || get_time().hours < 6)
         {
            _g3 = this;
            addButton(9,"睡觉",function():void
            {
               _g3.doSleep();
            }).hint("上床睡觉。");
         }
         if(petsCount() > 0)
         {
            _g4 = this;
            addButton(10,"宠物",function():void
            {
               _g4.campPetsMenu();
            }).hint("查看你拥有的宠物并与它们互动。");
         }
         if(isAprilFools())
         {
            addButton(12,"现金商店",get_game().aprilFools.pay2WinSelection).hint("需要更多宝石？想买特殊物品来获得优势？用真钱购买吧！");
         }
         if(get_time().hours < 6)
         {
            addButtonDisabled(0,get_game().output.getButtonText(0),"外面太黑了。当危险潜伏在黑暗的每个角落时，探索不是个好主意。");
            addButtonDisabled(1,get_game().output.getButtonText(1),"外面太黑了。当危险潜伏在黑暗的每个角落时，探索不是个好主意。");
         }
         if(isForceSleepTime())
         {
            addButtonDisabled(4,get_game().output.getButtonText(4),"你太累了，无法执行任何营地行动。你现在能做的就是睡到天亮。");
            if(followersCount() > 0)
            {
               addButtonDisabled(5,get_game().output.getButtonText(5),"你的追随者现在正在睡觉。");
            }
            if(loversCount() > 0)
            {
               addButtonDisabled(6,get_game().output.getButtonText(6),"你的情人现在正在睡觉。");
            }
            if(slavesCount() > 0)
            {
               addButtonDisabled(7,get_game().output.getButtonText(7),"你的奴隶现在正在睡觉。即使是奴隶也需要睡眠时间来恢复体力。");
            }
         }
         if(get_player().get_lust() >= get_player().maxLust() && _loc1_)
         {
            addButtonDisabled(0,"探索","你太过兴奋，无法考虑离开营地。内心积压着如此多的躁动情绪，四处探索可不是个好主意！");
            addButtonDisabled(1,"地点","你太过兴奋，无法考虑离开营地。内心积压着如此多的躁动情绪，四处探索可不是个好主意！");
         }
         if(get_realistic() && get_player().ballSize > 18 + get_player().get_str() / 2 + get_player().get_tallness() / 4)
         {
            badEndGIANTBALLZ();
            return;
         }
         if(get_survival() && get_player().hunger <= 0)
         {
            if(get_player().get_HP() <= 0 && get_player().get_str() + get_player().get_tou() < 30)
            {
               badEndHunger();
               return;
            }
         }
         if(get_player().minLust() >= get_player().maxLust() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,517) > -168 && get_player().eggs() < 20 && !get_player().hasStatusEffect(StatusEffects.BimboChampagne) && !get_player().hasStatusEffect(StatusEffects.Luststick) && get_player().get_jewelryEffectId() != 1)
         {
            badEndMinLust();
            return;
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null));
      }
      
      public function companionsList() : Array
      {
         return followerslist().concat(slavesList()).concat(loversList());
      }
      
      public function companionsCount() : int
      {
         return followersCount() + slavesCount() + loversCount();
      }
      
      public function chooseFurColorSaveUpdate(param1:String) : void
      {
         clearOutput();
         outputText("你现在拥有了" + Utils.cnName(param1) + "的毛皮。你现在将被送回营地，可以继续你平常的游戏了。");
         get_player().skin.furColor = param1;
         doNext(doCamp);
      }
      
      public function campSlavesMenu(param1:Boolean = false) : void
      {
         var _g2:SophieBimbo;
         var _g1:Vapula;
         var _g:CeraphFollowerScene;
         var _loc3_:* = null as Array;
         if(!param1)
         {
            hideMenus();
            spriteSelect(null);
            imageSelect(null);
            clearOutput();
            get_game().set_inCombat(false);
            menu();
         }
         var _loc2_:ButtonDataList = new ButtonDataList();
         if(isAprilFools() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2210) == 0 && !param1)
         {
            get_images().showImage("event-dlc");
            get_game().aprilFools.DLCPrompt("奴隶 DLC","获取奴隶 DLC 以便与他们互动。向他们展示你的统治力！","$4.99",doCamp);
            return;
         }
         if(get_latexGirl().latexGooAtCamp())
         {
            if(isForceSleepTime())
            {
               _loc3_ = ["黑色的乳胶史莱姆一动不动地躺在一处隐蔽的岩石区睡觉。","[latexyname]正在一些岩石后面睡觉。"];
               outputText(_loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
            }
            else
            {
               outputText("[latexyname]潜伏在一处隐蔽的岩石区，只有在被呼唤或需要从溪流中取水时才会出来。[pg]");
            }
            _loc2_.add(get_latexGirl().gooName(),get_latexGirl().approachLatexy).hint("靠近[latexyname]，你的乳胶史莱姆娘，喂她和/或找点乐子。");
         }
         if(get_milkWaifu().milkSlaveAtCamp())
         {
            if(isForceSleepTime())
            {
               outputText("[bathgirlname]已经睡着了，用她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) < 2 ? "巨大的" : "") + "乳沟当枕头。[pg]");
            }
            else
            {
               outputText("你那丰满的黑皮肤奶牛女孩在这里。每当她认为你注意到她时，她就会向你投去充满希望的目光。[pg]");
            }
            _loc2_.add(get_milkWaifu().get_milkName(),get_milkWaifu().milkyMenu).hint("去拜访[bathgirlname]，你从沙漠女巫那里得到的奶牛女孩。你能和她享受的乐趣取决于她目前的胸围大小。",get_milkWaifu().get_milkName());
         }
         if(ceraphIsFollower())
         {
            outputText("虽然当然到处都看不到她，但你可以召唤塞拉芙。[pg]");
            _g = get_ceraphFollowerScene();
            _loc2_.add("塞拉芙",function():void
            {
               _g.ceraphFollowerEncounter();
            }).hint("召唤你收入后宫的" + get_ceraphFollowerScene().ceraphBus() + "。不过如果她很忙的话，她可能会派她后宫里的某个人代替她来。","塞拉芙");
         }
         if(vapulaSlave() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1084) == 0)
         {
            get_vapula().vapulaSlaveFlavorText();
            outputText("[pg]");
            _g1 = get_vapula();
            _loc2_.add("瓦普拉",function():void
            {
               _g1.callSlaveVapula();
            }).hint("去喂你的魅魔奴隶或和她找点乐子。","瓦普拉");
         }
         if(get_amilyScene().amilyFollowerCorrupt() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
         {
            outputText("有时你会听到不远处传来微弱的呻吟声。毫无疑问，那是你那淫荡的玩具老鼠在自慰。[pg]");
            _loc2_.add("艾米莉",get_amilyScene().amilyFollowerEncounter).hint("呼唤你那堕落的老鼠荡妇");
         }
         if(campCorruptJojo() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1080) == 0)
         {
            outputText("时不时地，你能听到营地周围传来的动静，而且你经常会发现一滩滩浓稠的老鼠精液。你确信，如果你需要满足自己，乔乔就在这里。[pg]");
            _loc2_.add("乔乔",get_jojoScene().corruptCampJojo).hint("把你的堕落宠物叫进营地，用各种性爱姿势来缓解你的欲望？在你们上次交媾之后，他可是非常愿意的。");
         }
         if(get_sophieBimbo().bimboSophieAtCamp())
         {
            get_sophieBimbo().sophieCampLines();
            _g2 = get_sophieBimbo();
            _loc2_.add("索菲",function():void
            {
               _g2.approachBimboSophieInCamp();
            }).hint("去看看无脑鹰身女妖索菲。","索菲");
         }
         _loc2_.submenu(playerMenu,true);
      }
      
      public function campPetsMenu(param1:Boolean = false) : void
      {
         var _g:Camp;
         var _loc2_:* = null as Function;
         if(!param1)
         {
            hideMenus();
            spriteSelect(null);
            imageSelect(null);
            clearOutput();
            get_game().set_inCombat(false);
            menu();
         }
         if(get_akky().isOwned())
         {
            if(get_akky().isVisible())
            {
               outputText("你可以看到[akky]就在附近。");
            }
            else
            {
               outputText("[Akky]不在附近，但经过快速搜寻，你发现他在" + get_akky().locationShort() + "。");
            }
            _g = this;
            _loc2_ = function():void
            {
               _g.campPetsMenu();
            };
            get_akky().menuButton(_loc2_,0,"营地");
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function campLoversMenu(param1:Boolean = false) : void
      {
         var _g2:AntsScene;
         var fromCamp:Boolean;
         var _g1:Nieve;
         var _g:HelFollower;
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as ButtonDataList;
         var _loc5_:int = 0;
         if(!param1)
         {
            hideMenus();
            spriteSelect(null);
            imageSelect(null);
            clearOutput();
            get_game().set_inCombat(false);
            menu();
         }
         if(isAprilFools() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2210) == 0 && !param1)
         {
            get_images().showImage("event-dlc");
            get_game().aprilFools.DLCPrompt("恋人DLC","获取恋人DLC，以便能够与他们互动并做爱！组建家庭！可能性是无限的！","$4.99",doCamp);
            return;
         }
         if(get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0 && !param1)
         {
            if(isForceSleepTime())
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Amily")
               {
                  outputText("艾米莉悄悄地收起她的装备，看到你时给了你一个温柔的微笑，并问道，[say:准备好睡觉了吗，[name]？]");
               }
               else
               {
                  _loc3_ = ["你那像老鼠一样的女朋友正舒服地睡在她的草垫上。","艾米莉正安静地睡在她的草药床上。"];
                  outputText(_loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
               }
            }
            else
            {
               outputText("艾米莉目前正在你的营地里散步");
               _loc2_ = Utils.rand(6);
               if(_loc2_ == 0)
               {
                  outputText("刚在溪流里洗完澡，浑身湿透，一丝不挂");
                  if(get_rathazul().followerRathazul())
                  {
                     outputText("。拉萨祖尔瞥了一眼，立刻流鼻血了");
                  }
               }
               else if(_loc2_ == 1)
               {
                  outputText("在一些特别突出的岩石阴影下懒散地坐着，削着树枝为她的吹箭筒制作飞镖");
               }
               else if(_loc2_ == 2)
               {
                  outputText("将刚做好的飞镖浸入一罐看起来有毒的东西里");
               }
               else if(_loc2_ == 3)
               {
                  outputText("吃着你的一些补给");
               }
               else if(_loc2_ == 4)
               {
                  outputText("然后她扑通一声倒在她的巢里休息");
               }
               else
               {
                  outputText("剥下小恶魔头骨上最后几条肉，把它放在一块特别平坦、阳光充足的岩石上漂白作为战利品");
               }
               outputText("。[pg]");
            }
            get_akky().locationDesc("艾米莉");
            get_buttons().add("艾米莉",get_amilyScene().amilyFollowerEncounter,"去看看你最喜欢的鼠娘，聊聊天或者亲热一下。也许还能创造更多的后代？","Amily");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 2)
         {
            outputText("艾米莉的草药床空空如也，这位鼠女去见你的另一个情人了，至今未归。[pg]");
         }
         if(get_arianScene().arianFollower())
         {
            if(isForceSleepTime())
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Arian")
               {
                  outputText("苍白的蜥蜴人从附近向你挥手，给了你一个询问的眼神，并向你的[cabin]点了点头。");
               }
               else
               {
                  outputText("阿瑞安的帐篷在通常的位置关着，里面住着神秘的蜥蜴人。[pg]");
               }
            }
            else
            {
               outputText("阿瑞安的帐篷在这里，如果你想进去的话。[pg]");
            }
            get_buttons().add("阿瑞安",get_arianScene().visitAriansHouse).hint("去拜访阿瑞安那豪华的帐篷，看看" + get_arianScene().arianMF("他","她") + "。","Arian");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2693) == 1)
         {
            get_buttons().add("赫莉娅",get_helSpawnScene().helspawnsMainMenu,"赫莉娅目前正在处理事务。","Helia",false);
         }
         else if(get_game().helScene.followerHel())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 2)
            {
               if(isForceSleepTime())
               {
                  if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helia")
                  {
                     outputText("你的火蜥蜴情人正靠在一块石头上，显然快要睡着了。看来她不想再等太久才加入你的[bed]了。");
                  }
                  else
                  {
                     _loc3_ = ["火蜥蜴狂战士在睡梦中流着口水，手里还拿着空酒瓶。","在她的战斗装备和酒瓶中间，是正在安静打盹的赫莉娅。"];
                     outputText(_loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
                  }
               }
               else if(get_time().hours <= 7)
               {
                  outputText("赫尔目前正坐在营地边缘，周围散落着她的盔甲碎片、剑和几个半空的伏特加酒瓶。从她咕哝和咆哮的样子来看，她似乎准备发飙，以狂战士的状态跑向平原。[pg]");
               }
               else if(get_time().hours <= 17)
               {
                  outputText("赫尔目前不在营地，正在平原上冒险。不过你确信，如果你需要她，她会立刻赶到。[pg]");
               }
               else if(get_time().hours <= 19)
               {
                  outputText("赫尔现在正在特尔阿德雷探望她的家人，不过你确信如果你需要她，她只需片刻就能赶到。[pg]");
               }
               else
               {
                  outputText("赫尔正在她的吊床周围忙碌，检查她的装备并磨砺她收集的刀片。不过，每次你瞥向她时，火蜥蜴都会在她的臀部增加一点额外的摇摆，她的尾巴也会高兴地摇晃。[pg]");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 1)
               {
                  outputText("赫尔已经回到营地，不过现在她看起来有点无聊。也许她正在等待什么。[pg]");
               }
               else
               {
                  outputText("<b>你看到火蜥蜴赫莉娅在营地周围踱步，焦急地等待你出发去鹰身女妖的栖息地。看到你看着她，她振作起来，显然准备好出发了。</b>[pg]");
               }
            }
            _loc4_ = get_buttons();
            _g = get_helFollower();
            _loc4_.add("赫莉娅",function():void
            {
               _g.heliaFollowerMenu();
            },FlagDict_Impl_.arrayReadInt(KFLAGS.flags,479) == 2 ? "去看看你的火蜥蜴情人，聊聊天，做些运动，或者“运动”一下。" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 1 ? "" : "接近赫莉娅。她似乎非常渴望去鹰身女妖的栖息地。"),"Helia");
         }
         if(get_helSpawnScene().helspawnLover())
         {
            get_helSpawnScene().helspawnsCampLines();
            get_buttons().add(get_helSpawnScene().get_helspawnName(),get_helSpawnScene().helspawnsMainMenu,"去看看" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0 ? "你的" : "赫尔的") + "女儿。",get_helSpawnScene().get_helspawnName());
         }
         if(get_isabellaFollowerScene().isabellaAtCamp())
         {
            if(isForceSleepTime())
            {
               outputText("伊莎贝拉在她的铺位上睡得很熟，并安静地打着呼噜。");
            }
            else if(get_time().hours == 6)
            {
               outputText("伊莎贝拉正忙着吃某种谷物零食作为早餐。这位卷发的牛娘看到你看着她时，给了你一个微笑。");
            }
            else if(get_time().hours == 7)
            {
               outputText("伊莎贝拉，这位红发牛娘，正忙着用针线修补她的一些衣服。");
            }
            else if(get_time().hours == 8)
            {
               outputText("伊莎贝拉正忙着清理营地，但当她注意到你看着她时，她伸了个懒腰，拱起背，将八个子弹般坚硬的乳头压在她喜欢穿的透明丝绸上衣上。");
            }
            else if(get_time().hours == 9)
            {
               outputText("伊莎贝拉在你的营地边缘附近。她一只手拿着巨大的盾牌，似乎在密切注视着入侵者或恶魔。当她看到你看着她时，她向你挥了挥手。");
            }
            else if(get_time().hours == 10)
            {
               outputText("牛娘女战士伊莎贝拉正坐在椅子上，从一个奇怪的袋子里数着宝石。她最近一定打败了什么人或什么东西。");
            }
            else if(get_time().hours == 11)
            {
               outputText("伊莎贝拉在一个阴凉的角落里喝着一瓶标有“催乳剂”的瓶子。当她看到你看着她时，她脸红了，尽管她的上衣和裙子中间出现了黑斑。");
            }
            else if(get_time().hours == 12)
            {
               outputText("伊莎贝拉正在火上烤一块肉。从飘过来的气味来看，你觉得那是牛肉。你漫不经心地想，她是否意识到自己变得多么像她选择的食用动物。");
            }
            else if(get_time().hours == 13)
            {
               outputText("伊莎贝拉");
               _loc3_ = [];
               if(get_rathazul().followerRathazul())
               {
                  _loc3_[int(_loc3_.length)] = 0;
               }
               if(jojoFollower())
               {
                  _loc3_[int(_loc3_.length)] = 1;
               }
               if(get_amilyScene().amilyFollowerPure() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
               {
                  _loc3_[int(_loc3_.length)] = 2;
               }
               if(get_amilyScene().amilyFollowerCorrupt() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
               {
                  _loc3_[int(_loc3_.length)] = 3;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
               {
                  _loc3_[int(_loc3_.length)] = 4;
               }
               _loc3_[int(_loc3_.length)] = 5;
               _loc5_ = Utils.rand(int(_loc3_.length));
               if(int(_loc3_[_loc5_]) == 0)
               {
                  outputText("正和拉萨祖尔坐在一起，亲切地聊着天气。");
               }
               else if(int(_loc3_[_loc5_]) == 1)
               {
                  outputText("正和乔乔坐在一起，当这只老鼠努力将目光停留在她的脸上时，她会意地微笑着。");
               }
               else if(int(_loc3_[_loc5_]) == 2)
               {
                  outputText("正在和艾米莉交谈，分享她参与过的战斗和面对过的敌人的故事。艾米莉似乎很感兴趣，但并没有留下深刻印象。");
               }
               else if(int(_loc3_[_loc5_]) == 3)
               {
                  outputText("正和艾米莉坐在一起聊天，但堕落的小鼠娘只是盯着伊莎贝拉的胸部自慰。牛娘假装没有注意到。");
               }
               else if(int(_loc3_[_loc5_]) == 4)
               {
                  outputText("正和伊兹玛坐在一起，有些紧张地讲述着一些故事。伊兹玛不断露出牙齿，露出掠夺性的微笑。");
               }
               else
               {
                  outputText("正坐着翻阅一本书。");
               }
            }
            else if(get_time().hours == 14)
            {
               outputText("伊莎贝拉正在操作磨刀石，磨砺她的工具。她甚至将盾牌的底边磨成锋利的切削刃。牛娘大汗淋漓，但这只会让她那透明的丝绸上衣更诱人地紧贴着她沉重的胸部。");
            }
            else if(get_time().hours == 15)
            {
               outputText("女战士伊莎贝拉正忙着用木头和稻草制作假人，然后用盾牌的猛烈打击摧毁它们。大多数时候，她用武器锋利的底边将它们斩首来结束。当她看到你时，她向你闪过一个微笑。");
            }
            else if(get_time().hours == 16)
            {
               outputText("伊莎贝拉正拿着一把刀坐着，刀刃在阳光下闪烁，木屑落到地上。当她将几块不成形的旧木头雕刻成工具或艺术品时，她的手以机械的、熟练的节奏移动着。");
            }
            else if(get_time().hours == 17)
            {
               outputText("伊莎贝拉正靠在营地边缘的一块大石头上，凝视着荒地，同时漫不经心地嚼着你认为是羊腿的东西。她似乎陷入了沉思，但这并没有阻止她向你眨眼并露出一个塞满食物的傻笑。");
            }
            else if(get_time().hours == 18)
            {
               outputText("深色皮肤的牛娘伊莎贝拉正摊开在地毯上伸展身体。对于一个有蹄子和关节奇特的小腿的人来说，她似乎出奇地灵活。");
            }
            else if(get_time().hours == 19)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) == -1)
               {
                  outputText("伊莎贝拉刚从深夜拜访惠特尼的农场回来，带着几个装满的瓶子和一小袋宝石。");
               }
               else
               {
                  outputText("当你开始寻找伊莎贝拉时，她正躲在一块岩石后面。但当你一在黑暗中发现她，她就吓了一跳，脸上闪过一丝内疚的神色。她转过身整理了一下上衣，然后才回头看你，她那暗褐色的皮肤因为脸红而显得更深了。这位牛娘对你笑了笑，走回了她在营地里的位置。她刚才站的地方有一块白色的痕迹——那是奶吗？不管那是什么，它几乎在你看到它的瞬间就消失了，被干旱的荒原大地吞噬了。");
               }
            }
            else if(get_time().hours >= 20 && get_time().hours <= 23)
            {
               outputText("你最喜欢的巧克力色牛娘，伊莎贝拉，正在四处走动，把她散落的物品收集起来，放回她的私人箱子里。她不止一次地打哈欠，表明她已经准备好睡觉了，但她偶尔瞥向你的眼神让你知道，她并不介意在睡前有人陪伴。");
            }
            else
            {
               outputText("伊莎贝拉现在看起来无聊透顶。");
            }
            if(get_isabellaScene().totalIsabellaChildren() > 0)
            {
               _loc3_ = [];
               if(get_isabellaScene().getIsabellaChildType(1) > 0)
               {
                  _loc3_.push((get_isabellaScene().getIsabellaChildType(1) == 1 ? "一个" : Utils.num2Text(get_isabellaScene().getIsabellaChildType(1))) + "人类儿子" + (get_isabellaScene().getIsabellaChildType(1) == 1 ? "" : ""));
               }
               if(get_isabellaScene().getIsabellaChildType(2) > 0)
               {
                  _loc3_.push((get_isabellaScene().getIsabellaChildType(2) == 1 ? "一个" : Utils.num2Text(get_isabellaScene().getIsabellaChildType(2))) + "人类女儿" + (get_isabellaScene().getIsabellaChildType(2) == 1 ? "" : ""));
               }
               if(get_isabellaScene().getIsabellaChildType(3) > 0)
               {
                  _loc3_.push((get_isabellaScene().getIsabellaChildType(3) == 1 ? "一个" : Utils.num2Text(get_isabellaScene().getIsabellaChildType(3))) + "人类扶她" + (get_isabellaScene().getIsabellaChildType(3) == 1 ? "" : ""));
               }
               if(get_isabellaScene().getIsabellaChildType(4) > 0)
               {
                  _loc3_.push((get_isabellaScene().getIsabellaChildType(4) == 1 ? "一个" : Utils.num2Text(get_isabellaScene().getIsabellaChildType(4))) + "奶牛女孩" + (get_isabellaScene().getIsabellaChildType(4) == 1 ? "" : ""));
               }
               if(get_isabellaScene().getIsabellaChildType(5) > 0)
               {
                  _loc3_.push((get_isabellaScene().getIsabellaChildType(5) == 1 ? "一个" : Utils.num2Text(get_isabellaScene().getIsabellaChildType(5))) + "扶他奶牛" + (get_isabellaScene().getIsabellaChildType(5) == 1 ? "" : ""));
               }
               outputText("伊莎贝拉在营地里把她“角落”的一小部分布置成了育儿室。她把" + (Math.ceil(get_isabellaScene().totalIsabellaChildren() / 2) == 1 ? "一个木桶" : "几个木桶") + "锯成两半，并在里面垫上了毯子和枕头，当作摇篮。");
               outputText("你和她有" + Utils.formatStringArray(_loc3_) + "，" + (get_isabellaScene().totalIsabellaChildren() > 1 ? "全都" : "") + "住在这里；与玛瑞斯本地人不同，他们需要很多年的照顾才能独自去外面的世界闯荡。");
            }
            outputText("[pg]");
            get_buttons().add("伊莎贝拉",get_isabellaFollowerScene().callForFollowerIsabella).hint("接近你坚韧的牛娘，聊聊天，做点爱做的事，或者切磋一下。","伊莎贝拉");
         }
         if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
         {
            if(isForceSleepTime())
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Izma")
               {
                  outputText("伊兹玛在你的[cabin]外满怀期待地等着。");
               }
               else
               {
                  outputText("在你的[if (builtcabin){小屋|铺盖卷}]附近躺着伊兹玛，她正安静地面朝箱子睡着。");
               }
            }
            else
            {
               outputText("整齐地铺在");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
               {
                  outputText("你的小屋旁边");
               }
               else
               {
                  outputText("你自己的铺盖附近");
               }
               outputText("的是一个破旧的铺盖，属于你的虎鲨人恋人伊兹玛。它刚好能容纳她健美的身体，尽管布料上有一些明显的割痕和撕裂。靠近她床铺的是她的旧箱子，就好像她想把它放在触手可及的地方，以防有人在睡梦中试图抢劫她。[pg]");
               switch(Utils.rand(3))
               {
                  case 0:
                     outputText("伊兹玛慵懒地坐在铺盖旁的箱子上，读着里面众多书籍中的一本。当你的目光在她身上停留时，她开心地笑了，你很清楚她对书只有一半的兴趣。");
                     break;
                  case 1:
                     outputText("你注意到伊兹玛现在不在附近。她可能去附近的小溪打水了。没关系，她从一块岩石后面绕了过来，身上还在滴水。");
                     break;
                  case 2:
                     outputText("伊兹玛仰面躺在她的铺盖附近。你一开始还在想她为什么不用她的床，但当你仔细看时，你注意到她身下积聚的水和顺着她手臂流下的几滴水珠，这证明她刚从小溪回来。");
               }
            }
            outputText("[pg]");
            get_buttons().add("伊兹玛",get_izmaScene().izmaFollowerMenu).hint("花点时间和你的虎鲨人贝塔在一起。你可以只是聊聊天，读几本书，或者展示你的统治力。","伊兹玛");
         }
         if(followerKiha())
         {
            if(isGuard("Kiha"))
            {
               outputText("奇哈庄严地守卫着你营地的边缘，她紧紧握着斧头，火红的眼睛死死盯着地平线。[pg]");
            }
            else if(isForceSleepTime())
            {
               outputText("奇哈把战斧放在触手可及的地方，设法睡了一会儿。[pg]");
            }
            else if(get_time().hours < 7)
            {
               outputText("奇哈坐在火堆旁，把斧头横放在膝盖上擦拭着。[pg]");
            }
            else if(get_time().hours < 19)
            {
               if(get_kihaFollowerScene().totalKihaChildren() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) > 160 && (int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) % 3) == 0 || get_time().hours == 17))
               {
                  outputText("奇哈现在正在给她的孩子喂奶。[pg]");
               }
               else if(get_kihaFollowerScene().totalKihaChildren() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) > 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) <= 160 && (int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) % 7) == 0 || get_time().hours == 17))
               {
                  outputText("奇哈现在正在给她的龙族孩子" + (get_kihaFollowerScene().totalKihaChildren() == 1 ? "" : "们") + "讲故事。[pg]");
               }
               else
               {
                  outputText("奇哈现在出去了，可能在巡逻消灭恶魔。你确信大喊一声就能引起她的注意。[pg]");
               }
            }
            else if(get_kihaFollowerScene().totalKihaChildren() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) > 160 && (int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) % 3) == 0 || get_time().hours == 20))
            {
               outputText("奇哈现在正在给她的孩子喂奶。[pg]");
            }
            else if(get_kihaFollowerScene().totalKihaChildren() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) > 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) <= 160 && (int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) % 7) == 0 || get_time().hours == 20))
            {
               outputText("奇哈现在正在给她的龙族孩子" + (get_kihaFollowerScene().totalKihaChildren() == 1 ? "" : "们") + "讲故事。[pg]");
            }
            else if(get_kihaFollowerScene().totalKihaChildren() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) <= 80 && (int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) % 3) == 0 || get_time().hours == 20))
            {
               outputText("奇哈正在训练她的" + (get_kihaFollowerScene().totalKihaChildren() == 1 ? "孩子成为一名强大的战士" : "孩子们成为强大的战士") + "。");
               if(Utils.rand(2) == 0)
               {
                  outputText("现在，她正在教授各种技巧。[pg]");
               }
               else
               {
                  outputText("现在，她正在教她的孩子" + (get_kihaFollowerScene().totalKihaChildren() == 1 ? "" : "们") + "如何使用斧头。[pg]");
               }
            }
            else
            {
               outputText("奇哈正在彻底摧毁她在营地边缘设置的一组练习假人。所有的假人都画着粗糙的角。");
               if(get_kihaFollowerScene().totalKihaChildren() > 0 && (get_kihaFollowerScene().totalKihaChildren() >= 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) <= 60))
               {
                  outputText("其中一些是留给她的孩子" + (get_kihaFollowerScene().totalKihaChildren() == 1 ? "" : "们") + "训练用的。");
               }
               outputText("它们大部分都着火了。[pg]");
            }
            get_buttons().add("奇哈",get_kihaScene().encounterKiha).hint("接近你脾气暴躁的龙族恋人。这可能会很愉快，也可能会很痛苦，或者两者兼而有之。但这就是奇哈。","奇哈");
         }
         if(get_marbleScene().marbleAtCamp())
         {
            if(isForceSleepTime())
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble")
               {
                  outputText("你看到玛布尔正准备和你一起睡觉，她一边准备一边强忍着哈欠。");
               }
               else
               {
                  outputText("玛布尔睡着了。");
               }
            }
            else
            {
               _loc2_ = Utils.rand(5);
               outputText("第二个铺盖放在你的旁边；一把巨大的双手锤有时会靠在上面，这取决于它的主人当时是否需要它。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 4)
               {
                  outputText("玛布尔现在不在这里；她还在去看望她的家人。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) >= 1 && (get_time().hours == 19 || get_time().hours == 20))
               {
                  outputText("玛布尔自己目前在育儿室里，哄你的");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
                  {
                     outputText("孩子");
                  }
                  else
                  {
                     outputText("孩子们");
                  }
                  outputText("睡觉。");
               }
               else if(get_time().hours == 6 || get_time().hours == 7)
               {
                  outputText("玛布尔现在在营地旁边的一片空地上。她正在练习她的大锤，进行着日常训练。");
               }
               else if(get_time().hours >= 21 && !get_player().hasStatusEffect(StatusEffects.Infested))
               {
                  outputText("玛布尔在她的铺盖附近转悠，等你来睡觉。不过，有时她会躺下休息一会儿，有时她会在旁边踱步。");
                  if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) > 30)
                  {
                     outputText("她似乎感到有些焦躁不安。");
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0 && get_time().hours < 19 && get_time().hours > 7)
               {
                  if(Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 5)
                  {
                     outputText("玛布尔目前正在照顾你的孩子们，但她现在看起来有点压力。看起来 " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) + "个孩子对她一个人来说可能太多了...");
                  }
                  else if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 3)
                  {
                     outputText("玛布尔现在正在营地里，给围在她身边的孩子们讲她周游世界的故事。孩子们完全被她的话语迷住了。你忍不住露出了微笑。");
                  }
                  else if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) > 1)
                  {
                     outputText("玛布尔现在正在给你两个儿子当摔跤比赛的裁判。这似乎是一场比赛，看看他们中谁能在<i>双峰夹击</i>的游戏中，在她的乳沟里骑乘，而输家则必须坐在她的肩膀上。");
                  }
                  else if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) > 1)
                  {
                     outputText("玛布尔现在正和你的两个孩子拿着小树枝玩打仗游戏。似乎<i>怪物妈妈</i>正在恐吓营地，需要被<i>强大的哞哞和她的助手牛女郎</i>阻止。");
                  }
                  else if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
                  {
                     outputText("玛布尔现在出去了；她带着孩子们去拜访惠特尼了。不过你确定她会在一小时内回来，所以如果你需要她的话，可以等一下。");
                  }
                  else if(Utils.rand(2) == 0)
                  {
                     outputText("玛布尔正在给");
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
                     {
                        outputText("你的一个牛娘孩子");
                     }
                     else
                     {
                        outputText("你的牛娘孩子");
                     }
                     outputText("喂奶，脸上带着满足的神情。");
                  }
                  else
                  {
                     outputText("玛布尔正在看着你的孩子");
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
                     {
                        outputText("");
                     }
                     outputText("现在在营地周围玩耍。");
                  }
               }
               else if(_loc2_ == 0)
               {
                  outputText("玛布尔现在去惠特尼的农场挤奶了。");
               }
               else if(_loc2_ == 1)
               {
                  outputText("玛布尔现在去惠特尼的农场干杂活了。");
               }
               else if(_loc2_ == 2)
               {
                  outputText("玛布尔现在不在营地；她可能去弄补给了，不过她很快就会回来的。");
               }
               else if(_loc2_ == 3)
               {
                  outputText("玛布尔现在正躺在她的铺盖卷上。");
               }
               else if(_loc2_ == 4)
               {
                  outputText("玛布尔现在正在营地周围闲逛。");
               }
               if(_loc2_ < 3)
               {
                  outputText("你确定如果你需要她，她马上就会回来。");
               }
            }
            outputText("[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) != 4)
            {
               get_buttons().add("玛布尔",get_marbleScene().interactWithMarbleAtCamp).hint("去找牛娘玛布尔聊天作伴。");
            }
         }
         if(nieveFollower())
         {
            get_nieve().nieveCampDescs();
            _loc4_ = get_buttons();
            _g1 = get_nieve();
            fromCamp = true;
            _loc4_.add("尼芙",function():void
            {
               _g1.approachNieve(fromCamp);
            },"与你的冰精灵情人共度美好时光。","尼芙");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,875) > 0)
         {
            outputText("你在远处看到了菲拉的蚁丘。时不时地你会看到");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) <= 250)
            {
               outputText("你的一个孩子从蚁丘里出来卸下一些泥土，然后继续回到蚁群中。知道你的后代如此多产，让你感觉很好。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 250 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) <= 1000)
            {
               outputText("你众多孩子中的几个从蚁丘里出来卸下一些泥土，然后消失在里面。知道你的后代如此多产，让你感觉很好。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 1000)
            {
               outputText("你的几个孩子使用主入口或其中一个附加入口从蚁丘里出来卸下一些泥土。他们中的一些人没有卸下泥土，而是出来完成他们母亲交给他们的其他任务。看到这个曾经的小蚁群成长到如此宏伟的规模，你感到有些怀旧。");
            }
            else
            {
               outputText("菲拉从蚁丘里出来卸下一些泥土。她看向你的营地，兴奋地向你挥手，然后回到蚁群中。知道她离你这么近，让你感觉很好。");
            }
            outputText("[pg]");
            _loc4_ = get_buttons();
            _g2 = get_game().desert.antsScene;
            _loc4_.add("菲拉",function():void
            {
               _g2.introductionToPhyllaFollower();
            },"去蚁丘拜访你的蚂蚁情人。","菲拉");
         }
         get_buttons().submenu(playerMenu,true);
      }
      
      public function campGuarded() : Boolean
      {
         return int(campGuardList().length) > 0;
      }
      
      public function campGuardRandom() : String
      {
         var _loc1_:Array = campGuardList();
         if(int(_loc1_.length) == 0)
         {
            throw new Error("campGuardRandom() called when no guards");
         }
         var _loc2_:Array = _loc1_;
         return _loc2_[Utils.rand(int(_loc2_.length))];
      }
      
      public function campGuardList() : Array
      {
         var _gthis:Camp;
         var _loc2_:* = null as String;
         var _loc3_:* = null as Function;
         var _loc7_:* = null;
         _gthis = this;
         var _loc1_:IMap = new StringMap();
         _loc2_ = "Jojo";
         _loc3_ = function():Boolean
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.JojoNightWatch))
            {
               return _gthis.jojoFollower();
            }
            return false;
         };
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc2_ = "Helia";
         _loc3_ = function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,704) > 0)
            {
               return _gthis.get_helFollower().followerHel();
            }
            return false;
         };
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc2_ = "小A";
         _loc3_ = function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,456) > 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0;
            }
            return false;
         };
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc2_ = "Holli";
         _loc3_ = function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,602) > 0)
            {
               return _gthis.get_holliScene().holliFollower();
            }
            return false;
         };
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc2_ = "Kiha";
         _loc3_ = function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,982) > 0)
            {
               return _gthis.get_kihaFollowerScene().followerKiha();
            }
            return false;
         };
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         _loc3_ = get_nieve().iceGuardian;
         _loc2_ = "Nieve";
         if(_loc2_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc2_,_loc3_);
         }
         else
         {
            _loc1_.h[_loc2_] = _loc3_;
         }
         var _loc4_:IMap = _loc1_;
         var _loc5_:Array = [];
         var _loc6_:* = new MapKeyValueIterator(_loc4_);
         while(Boolean(_loc6_.hasNext()))
         {
            _loc7_ = _loc6_.next();
            _loc2_ = _loc7_.key;
            _loc3_ = _loc7_.value;
            if(Boolean(_loc3_()))
            {
               _loc5_.push(_loc2_);
            }
         }
         return _loc5_;
      }
      
      public function campFollowers(param1:Boolean = false) : void
      {
         var _g1:HolliScene;
         var _g:EmberScene;
         var _loc3_:* = null as Array;
         if(!param1)
         {
            hideMenus();
            spriteSelect(null);
            imageSelect(null);
            clearOutput();
            get_game().set_inCombat(false);
            menu();
         }
         var _loc2_:ButtonDataList = new ButtonDataList();
         if(get_anemoneScene().anemoneFollower())
         {
            get_game().anemoneScene.anemoneBarrelDescription();
            _loc2_.add("海葵",get_game().anemoneScene.approachAnemoneBarrel).hint("你想知道箍桶匠是怎么把这么多水装进一个桶里的。");
         }
         if(get_emberScene().followerEmber())
         {
            get_emberScene().emberCampDesc();
            _g = get_emberScene();
            _loc2_.add("烬",function():void
            {
               _g.emberCampMenu();
            },"去看看烬，那只龙" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "兽人" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,525) == 1 ? "男孩" : "女孩")) + "。");
         }
         if(get_holliScene().holliFollower())
         {
            outputText("[pg]霍莉在你营地边缘的树上。如果你想的话，可以去拜访她。[pg]");
            _g1 = get_holliScene();
            _loc2_.add("霍莉",function():void
            {
               _g1.treeMenu();
            });
         }
         if(jojoFollower())
         {
            if(isGuard("Jojo"))
            {
               outputText("乔乔站在你营地的最边缘，像雕像一样一动不动。他一动不动，以至于你有一瞬间几乎感到担心，但过了一会儿，他点了点头以示认出你。[pg]");
            }
            else if(isForceSleepTime())
            {
               _loc3_ = ["乔乔躺在一个小铺盖卷上，双手合十放在肚子上，睡觉时看起来很像个和尚。","老鼠和尚在他的小铺盖卷上睡觉，手臂放在被子外面。"];
               outputText(_loc3_[Utils.rand(int(_loc3_.length))] + "[pg]");
            }
            else
            {
               outputText("在你的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
               {
                  outputText("小屋");
               }
               else
               {
                  outputText("自己的");
               }
               if(!(get_time().hours > 4 && get_time().hours < 23))
               {
                  if(isGuard("Jojo"))
                  {
                     outputText("附近，有一个给乔乔准备的小铺盖卷，但他现在没在用，因为他在值夜班。[pg]");
                  }
                  else
                  {
                     outputText("附近，有一个给乔乔准备的小铺盖卷，这只老鼠现在正睡在上面。[pg]");
                  }
               }
               else
               {
                  outputText("附近，有一个给乔乔准备的小铺盖卷，不过这只老鼠现在可能在营地周围巡逻。[pg]");
               }
            }
            _loc2_.add("乔乔",get_jojoScene().jojoCamp,"在营地边缘找到乔乔，和他一起冥想，或者聊聊守夜的事。");
         }
         if(get_helSpawnScene().helspawnJustDaughter())
         {
            get_helSpawnScene().helspawnsCampLines();
            _loc2_.add(get_helSpawnScene().get_helspawnName(),get_helSpawnScene().helspawnsMainMenu,"去看看" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0 ? "你的" : "赫尔的") + "女儿。",get_helSpawnScene().get_helspawnName());
         }
         if(get_rathazul().followerRathazul())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) <= 1)
            {
               outputText("在岩石阴凉的角落里，藏着一堆炼金设备和仪器。");
               if(isForceSleepTime())
               {
                  _loc3_ = ["炼金术士不在他平时工作的地方。他现在肯定在睡觉。","拉萨祖尔躺在他的炼金材料和工作台后面的某个地方，你希望他睡得很香。","你常去拜访的那位年迈的炼金术士正在离他平时工作台不远的地方安稳地休息着。"];
                  outputText(_loc3_[Utils.rand(int(_loc3_.length))]);
               }
               else
               {
                  outputText("炼金术士拉萨祖尔看起来正在努力地捣鼓他的化学试剂，天知道他在忙些什么。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) == 1)
               {
                  outputText("附近的架子上挂着某种用蜘蛛丝制成的装备。<b>他已经完成了你交给他的任务！</b>");
               }
               outputText("[pg]");
            }
            else
            {
               outputText("在岩石阴凉的角落里，藏着一堆炼金设备和仪器。炼金术士拉萨祖尔看起来正在努力制作你委托他制作的丝绸装备。[pg]");
            }
            _loc2_.add("拉萨祖尔",get_game().rathazul.returnToRathazulMenu,"拜访拉萨祖尔，看看他现在有哪些炼金材料和服务。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,274) == 1)
         {
            outputText("在你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
            {
               outputText("小屋里的床上有一张便条。");
            }
            else
            {
               outputText("铺盖卷上有一张便条");
            }
            outputText("。上面写着：[saystart]来湖边找我。我已经完成了你的蜘蛛丝");
            switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,275))
            {
               case 1:
                  outputText("护甲");
                  break;
               case 2:
                  outputText("长袍");
                  break;
               case 3:
                  outputText("胸罩");
                  break;
               case 4:
                  outputText("内裤");
                  break;
               case 5:
                  outputText("缠腰布");
                  break;
               default:
                  outputText("长袍");
            }
            outputText("。 ——拉萨祖尔[sayend][pg]");
         }
         if(followerShouldra())
         {
            _loc2_.add("舒尔德拉",get_shouldraFollower().shouldraFollowerScreen,"和舒尔德拉谈谈。她目前寄宿在你的体内。");
         }
         if(get_sophieScene().sophieAtCamp())
         {
            if(isForceSleepTime())
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie")
               {
                  outputText("你的鹰身女妖主母似乎非常迫不及待地想和你上床，她眼中的神情流露出纯粹的欲望。");
               }
               else
               {
                  outputText("索菲躺在她的巢里，" + (get_sophieBimbo().sophieChildren() == 1 ? "你的女儿幸福地躺在她的胸前" : (get_sophieBimbo().sophieChildren() > 1 ? "被你的女儿们包围着" : "双乳垂在身体两侧，四肢摊开")) + "。[pg]");
               }
            }
            else if(Utils.rand(5) == 0)
            {
               outputText("索菲独自坐着，在她丰满的嘴唇上又涂了一层闪亮的唇彩。[pg]");
            }
            else if(Utils.rand(4) == 0)
            {
               outputText("索菲坐在她的巢里，漫不经心地梳理着羽毛。她偶尔会从工作中抬起头，给你一个性感的眨眼和充满诱惑的眼神。[pg]");
            }
            else if(Utils.rand(3) == 0)
            {
               outputText("索菲在她的巢里忙活，整理着稻草和草叶，试图让它更舒服。几分钟后，她扑通一声倒在中间躺下，显然对目前的状态很满意。[pg]");
            }
            else if(Utils.rand(2) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  outputText("你的白金发鹰身女妖索菲目前正在看书——这与她以前那种胸大无脑的行为相比，是一个显著的变化。不过，她偶尔也会从书页上抬起头，给你一个充满欲望的眼神。有些事情是永远不会变的……[pg]");
               }
               else
               {
                  outputText("你的粉色鹰身女妖索菲目前正在看书。她似乎完全沉浸其中，尽管你很疑惑她是怎么弄到这本书的。不过，她偶尔也会从书页上抬起头，向你投来充满欲望的眼神。[pg]");
               }
            }
            else
            {
               outputText("索菲坐在她的巢里");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) < 5)
               {
                  outputText("坐在你女儿对面");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 1)
                  {
                     outputText("");
                  }
               }
               else
               {
                  outputText("被你的女儿们包围着");
               }
               outputText("，显然是在试图教");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1)
               {
                  outputText("她");
               }
               else
               {
                  outputText("她们");
               }
               outputText("关于狩猎和采集的技巧。考虑到她们不同寻常的成长经历，这对她们来说肯定不容易……[pg]");
            }
            _loc2_.add("索菲",get_sophieFollowerScene().followerSophieMainScreen,"去看看鹰身女妖索菲。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,480) == 1)
         {
            get_valeria().valeriaCampLines();
            _loc2_.add("瓦莱丽娅",get_valeria().valeriaFollowerMenu,get_player().get_armorName() == "goo armor" ? "和你的史莱姆娘保护者谈谈。" : "拜访史莱姆娘瓦莱丽娅。如果你愿意，你甚至可以带上她，把她当做黏液护甲穿在身上。");
         }
         _loc2_.submenu(playerMenu,true);
      }
      
      public function campActions() : void
      {
         var output1:Boolean;
         var _g1:TrainingDummyScene;
         var _g:HolliScene;
         var _loc1_:* = null as String;
         var _loc2_:* = null as Function;
         hideMenus();
         menu();
         clearOutput();
         get_images().showImage("camp-campfire");
         outputText("你想做什么？");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0400) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0800) == 0)
         {
            outputText("[pg]营地的一部分闪烁着微光，光线在它周围弯曲。欺骗之塔的巫师在召唤你。");
         }
         addButton(0,"在小溪里游泳",swimInStream).hint("在小溪里游个泳，放松一下打发时间。","在小溪里游泳");
         addButton(1,"检查传送门",examinePortal).hint("检查传送门。","检查传送门");
         if(get_time().hours == 19)
         {
            addButton(2,"欣赏日落",watchSunset).hint("欣赏日落并放松一下。");
         }
         else if(get_time().hours >= 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            addButton(2,"仰望星空",watchStars).hint("仰望星空，这里当然不是指某道名菜。");
         }
         else
         {
            addButtonDisabled(2,"观赏天空","你可以在" + (get_displaySettings().time12Hour ? "晚上7点" : "19:00") + "观赏日落。");
         }
         addButton(3,"建造",buildMenu).hint("改善你的营地。");
         if(get_builtCabin())
         {
            addButton(4,"进入小屋",get_cabin().enterCabin).hint("进入你的小屋。");
         }
         else
         {
            addButton(4,"阅读百科",codex.accessCodexMenu).hint("阅读你已解锁的任何百科条目。");
         }
         if(get_player().hasKeyItem("Dragon Egg"))
         {
            get_game().emberScene.emberCampDesc();
            addRowButton(1,"蛋",get_game().emberScene.emberEggInteraction);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,598) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) < 4)
         {
            _loc1_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,596) >= 3 ? "树" : "植物";
            _g = get_game().holliScene;
            addRowButton(1,_loc1_,function():void
            {
               _g.treeMenu();
            });
         }
         if(get_nieve().nieveAvailable() && get_nieve().get_stage() > 0 && get_nieve().get_stage() < 5)
         {
            if(get_nieve().get_stage() == 1)
            {
               outputText("[pg]这里有一些奇怪的雪，你可以用它做点什么...");
            }
            else
            {
               outputText("[pg]你这里有一个[snowman]，似乎可以给它加点什么...");
            }
            addRowButton(1,"雪",get_nieve().nieveBuilding);
         }
         if(magicsKnown() > 1)
         {
            addButton(10,"切换魔法",magicChangeMenu).hint("你已经学会了与寻常黑白魔法不兼容的魔法。选择你要使用的魔法流派。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            addButton(11,"飞升",promptAscend).hint("进行飞升？这会保留你的等级、物品和宝石并重新开始冒险。游戏难度也会随之增加。");
         }
         if(get_time().hours >= 20 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0400) != 0)
         {
            addButton(12,"虚空",enterVoid).hint("观察宇宙的无限广袤，接受你曾经忽视的现实。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0400) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0800) == 0)
         {
            addButton(13,"挑战",acceptChallenge).hint("传送回塔顶并挑战巫师。");
         }
         if(get_silly() && get_player().get_weapon().isFirearm())
         {
            addNextButton("射吧",shootTheSky);
         }
         if(saveContent.dummyBuilt)
         {
            _g1 = trainingDummyScene;
            output1 = true;
            _loc2_ = function():void
            {
               _g1.dummyMenu(output1);
            };
            addNextButton(saveContent.dummyName,_loc2_).hint("[Dummyname]，你忠实的训练假人，坚定地站着等待你。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) > 0)
         {
            addNextButton("欣赏头骨",inspectSkulls).hint("花点时间欣赏一下你在这里的杰作。");
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function callRathazulAndEscapeBadEnd() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         clearOutput();
         get_images().showImage("rathazul-himself");
         outputText("你拼尽全力大喊拉萨祖尔的名字。你的呼唤得到了回应，这位炼金术士向你走来。[pg]");
         outputText("[say: 哎呀，哎呀……看看你自己！别担心，我能帮忙，]他说。他冲向他的炼金设备，混合起材料。他带着一份缩形膏回到了你身边。[pg]");
         outputText("他把药膏涂满了你巨大的蛋蛋。效果出奇的好。[pg]");
         var _temp_1:* = get_player();
         _temp_1.ballSize = _temp_1.ballSize - (4 + Utils.rand(6));
         if(get_player().ballSize < 1)
         {
            get_player().ballSize = 1;
         }
         if(get_player().ballSize > 18 + get_player().get_str() / 2 + get_player().get_tallness() / 4)
         {
            _loc1_ = 16 + get_player().get_str() / 2;
            _loc2_ = get_player().get_tallness() / 4;
            get_player().ballSize = _loc1_ + _loc2_;
         }
         outputText("你感觉到你的阴囊在收缩，连同你的[balls]一起缩小。");
         outputText("几秒钟内，药膏被完全吸收，收缩停止了。");
         outputText("[say: 尽量别让你的蛋蛋变得更大了。如果发生了，确保你带了缩形膏，]他说。他回到了他的炼金设备旁，继续捣鼓着谁也不知道的东西。[pg]");
         doNext(returnToCampUseOneHour);
      }
      
      public function calculateHoursUntilHour(param1:int) : int
      {
         var _loc2_:int = int(get_time().hours);
         var _loc3_:int = 0;
         while(_loc2_ != param1)
         {
            _loc2_++;
            _loc3_++;
            if(_loc2_ >= 24)
            {
               _loc2_ = 0;
            }
         }
         return _loc3_;
      }
      
      public function buildMenu() : void
      {
         clearOutput();
         outputText("你想做什么？");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) < 10)
         {
            addNextButton("建造小屋",cabinProgress.initiateCabin).hint("动手建造你的小屋。");
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(!get_builtWall() && getCampPopulation() >= 4)
            {
               addNextButton("建造围墙",buildCampWallPrompt).hint("在你的营地周围建起围墙。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 20 ? "[pg]进度：" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) / 20 + "/5 完成" : ""));
            }
            if(get_builtWall() && !get_builtGate())
            {
               addNextButton("建造大门",buildCampGatePrompt).hint("建造一扇大门，完善营地的防御。");
            }
            if(!saveContent.dummyBuilt)
            {
               addNextButton("建造训练假人",buildDummyPrompt).hint("建造一个训练假人。");
            }
         }
         if(get_builtWall() && get_player().hasItem(get_useables().IMPSKLL))
         {
            addNextButton("挂上小恶魔头骨",promptHangImpSkull).hint("挂上一个恶魔头骨来装饰围墙，顺便震慑那些小恶魔。","挂上小恶魔头骨");
         }
         addButton(14,"返回",campActions);
      }
      
      public function buildFatigue(param1:int = 100) : int
      {
         var _loc2_:int = 0;
         if(marbleFollower())
         {
            _loc2_++;
         }
         if(followerHel())
         {
            _loc2_++;
         }
         if(followerKiha())
         {
            _loc2_++;
         }
         var _loc3_:int = param1;
         _loc3_ -= int(get_player().get_str() / 5);
         _loc3_ -= int(get_player().get_tou() / 10);
         _loc3_ -= int(get_player().get_spe() / 10);
         if(get_player().hasPerk(PerkLib.IronMan))
         {
            _loc3_ -= 20;
         }
         _loc3_ /= _loc2_ + 1;
         if(_loc3_ < 15)
         {
            _loc3_ = 15;
         }
         return _loc3_;
      }
      
      public function buildDummyPrompt() : void
      {
         clearOutput();
         outputText("你没有准备任何图纸，但建造一个简单的训练假人应该不会太难。一些木头，大概几十根钉子，也许还有一把石头，当然还有必要的工具，这就是你所需要的全部。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 10 && get_player().keyItemv1("Carpenter\'s Toolbox") >= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 5)
         {
            outputText("你想现在就做吗？");
            doYesNo(buildDummy,doCamp);
         }
         else
         {
            outputText("虽然你现在身上没有这些东西。");
            outputText("[pg]<b>不幸的是，你的资源不足。</b>");
            doNext(doCamp);
         }
      }
      
      public function buildDummy() : void
      {
         clearOutput();
         outputText("你手里拿着锯子，迅速将木头修剪成你需要的形状：一根粗木杆作为底座和主体，较短的作为手臂，一块漂亮的木块作为头部，然后是一些木板作为躯干和杂项的模拟盔甲。");
         outputText("[pg]在远离其他东西的地方，你找到了一个合适的位置，可以在不打扰任何人的情况下放开手脚，你在那里挖了一个狭窄的洞，以便稍后将柱子夯入。之后，你开始在假人的手臂、头部钉钉子，最后再钉几根钉子以增加坚固度。在短暂的如厕休息期间，你在灌木丛中找到了一对生锈的煎锅，并迅速用它们代替手。一些厚实的木制胸甲，一对大护肩，最后是一个头盔，你就完成了。");
         outputText("[pg]它看起来更像是一个稻草人，但从历史上看，反正也没有太大区别。你还剩下一些木头和几根钉子。它还需要别的什么吗？");
         get_player().changeFatigue(20);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 7);
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-38);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2267,FlagDict_Impl_.arrayReadInt(_loc1_,2267) - 5);
         saveContent.dummyBuilt = true;
         engenderDummy();
      }
      
      public function buildCampWallPrompt() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) <= 20)
         {
            get_images().showImage("camp-wall-partI");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) <= 40)
         {
            get_images().showImage("camp-wall-partII");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) <= 60)
         {
            get_images().showImage("camp-wall-partIII");
         }
         else
         {
            get_images().showImage("camp-wall-partIV");
         }
         if(!get_player().hasFatigue(buildFatigue()))
         {
            outputText("你太累了，无法建造营地围墙！");
            doNext(doCamp);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) == 0)
         {
            outputText("随着你营地人口的增长，一种不安的感觉在你心中滋生。也许是时候建一堵墙来保护周边了？[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2178,1);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) <= 20)
            {
               outputText("你可以继续建造围绕你营地的围墙。[pg]");
            }
            outputText("已完成部分: " + Math.floor(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) / 20) + "/5[pg]");
         }
         cabinProgress.checkMaterials();
         outputText("[pg]建造一段围墙需要50个钉子、50块石头和100块木头。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 100 && get_player().keyItemv1("Carpenter\'s Toolbox") >= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 50)
         {
            doYesNo(buildCampWall,doCamp);
         }
         else
         {
            outputText("[pg]<b>不幸的是，你的资源不足。</b>");
            doNext(doCamp);
         }
      }
      
      public function buildCampWall() : void
      {
         var _loc3_:* = null as IMap;
         var _loc1_:int = 0;
         var _loc2_:Array = [];
         if(marbleFollower())
         {
            _loc2_.push("玛布尔");
            _loc1_++;
         }
         if(followerHel())
         {
            _loc2_.push("赫莉娅");
            _loc1_++;
         }
         if(followerKiha())
         {
            _loc2_.push("奇哈");
            _loc1_++;
         }
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2267,FlagDict_Impl_.arrayReadInt(_loc3_,2267) - 50);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2005,FlagDict_Impl_.arrayReadInt(_loc3_,2005) - 100);
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-50);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) == 1)
         {
            get_images().showImage("item-carpentersBook");
            outputText("你拿出一本名为《木匠指南》的书，翻阅书页，直到你看到关于建造围墙的说明。你花了几分钟看说明并记住了步骤。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2178,20);
         }
         else
         {
            outputText("你记起了建造围墙的步骤。");
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2178,FlagDict_Impl_.arrayReadInt(_loc3_,2178) + 20);
         }
         outputText("[pg]你挖了四个洞，每个洞[if (metric) {深十五厘米，宽三十厘米|深六英寸，宽一英尺}]，然后竖起木柱，每根木柱[if (metric) {高三点五米，厚三分之一米|高十二英尺，厚一英尺}]。你从物资中拿出一些木头，锯成木板，然后把它们钉在木柱上。");
         if(_loc1_ > 0)
         {
            outputText("[pg]" + Utils.formatStringArray(_loc2_));
            outputText("" + (_loc1_ == 1 ? "协助" : "协助") + "你建造围墙，帮助加快了进度，并使施工不那么令人疲劳。");
         }
         get_player().changeFatigue(buildFatigue());
         if(_loc1_ >= 2)
         {
            outputText("[pg]多亏了你的助手们，施工只花了一个小时！");
            doNext(returnToCampUseOneHour);
         }
         else if(_loc1_ == 1)
         {
            outputText("[pg]多亏了你的助手，施工只花了两个小时。");
            doNext(returnToCampUseTwoHours);
         }
         else
         {
            outputText("[pg]这是" + (buildFatigue() >= 75 ? "一项艰巨的" : "一项轻松的") + "任务，但你最终还是成功地为你的营地建造了一段围墙！");
            doNext(returnToCampUseFourHours);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 100)
         {
            outputText("[pg]<b>干得好！你已经完成了围墙！你可以建造一扇大门，并用小恶魔的头骨装饰围墙，以进一步威慑那些可能试图来强暴你的人。</b>");
            get_output().flush();
         }
      }
      
      public function buildCampGatePrompt() : void
      {
         clearOutput();
         if(!get_player().hasFatigue(buildFatigue()))
         {
            outputText("你太累了，无法建造营地围墙！");
            doNext(doCamp);
            return;
         }
         get_images().showImage("camp-wall-gate");
         outputText("你可以建造一扇大门，在夜间关闭它，以进一步保护你的营地。[pg]");
         cabinProgress.checkMaterials();
         outputText("[pg]建造一扇大门需要100个钉子、100块石头和100块木头。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) >= 100 && get_player().keyItemv1("Carpenter\'s Toolbox") >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267) >= 100)
         {
            doYesNo(buildCampGate,doCamp);
         }
         else
         {
            outputText("[pg]<b>不幸的是，你的资源不足。</b>");
            doNext(doCamp);
         }
      }
      
      public function buildCampGate() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = [];
         if(marbleFollower())
         {
            _loc2_.push("玛布尔");
            _loc1_++;
         }
         if(followerHel())
         {
            _loc2_.push("赫莉娅");
            _loc1_++;
         }
         if(followerKiha())
         {
            _loc2_.push("奇哈");
            _loc1_++;
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2267,FlagDict_Impl_.arrayReadInt(_loc3_,2267) - 100);
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,2005,FlagDict_Impl_.arrayReadInt(_loc3_,2005) - 100);
         get_player().addKeyValue("Carpenter\'s Toolbox",1,-100);
         clearOutput();
         get_images().showImage("item-carpentersBook");
         outputText("你拿出一本名为《木匠指南》的书，翻阅着书页，直到找到关于如何建造一扇可以开关的大门的说明。你花了几分钟时间查看说明，并记住了步骤。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2179,1);
         outputText("[pg]你从物资中拿出木头，锯开并切成木板，然后将它们钉在一起。");
         if(_loc1_ > 0)
         {
            outputText("[pg]" + Utils.formatStringArray(_loc2_));
            outputText("" + (_loc1_ == 1 ? "协助" : "协助") + "你建造大门，帮助加快进度，让建造过程不那么令人疲惫。");
         }
         outputText("[pg]你最终完成了大门的建造。");
         get_player().changeFatigue(buildFatigue());
         doNext(returnToCampUseOneHour);
      }
      
      public function bedDesc() : String
      {
         var _loc1_:* = null as String;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
         {
            _loc1_ = "床";
         }
         else
         {
            _loc1_ = "铺盖卷";
         }
         return _loc1_;
      }
      
      public function badEndMinLust() : void
      {
         clearOutput();
         get_images().showImage("badend-masti");
         outputText("释放的念头淹没了你。你疯狂地脱下你的[armor]，开始疯狂地自慰。第一次高潮袭来，但欲望依然存在。你继续自慰，但不幸的是，无论你多么用力，或者高潮了多少次，你的欲望都不会消失。你感到沮丧，继续疯狂地自慰，却无法停下来。你的最低欲望太高了。无论你多么努力，你甚至无法满足自己的欲望。");
         outputText("[pg]你在余生中都在自慰，无法停止。");
         get_player().orgasm("Generic");
         get_game().gameOver();
         removeButton(1);
      }
      
      public function badEndHunger() : void
      {
         clearOutput();
         get_images().showImage("badend-starve");
         get_player().hunger = 0.1;
         outputText("你虚弱得无法站立，瘫倒在地上。你的视线变得模糊，周围的世界最终褪成了黑色。");
         if(companionsCount() > 0)
         {
            outputText("[pg]");
            if(companionsCount() > 1)
            {
               outputText("你的同伴们聚集在一起，为你哀悼。");
            }
            else
            {
               outputText("你的同伴为你哀悼。");
            }
         }
         get_player().set_HP(0);
         get_game().gameOver();
         removeButton(1);
      }
      
      public function badEndGIANTBALLZ() : void
      {
         var rescue:Boolean;
         var _g:ShouldraFollower;
         clearOutput();
         get_images().showImage("badend-hBalls");
         outputText("你突然因为极度巨大的[balls]而摔倒。你挣扎着想站起来，但这个尺寸让你根本无法做到。恐慌在你的脑海中蔓延，你的心跳加速。[pg]");
         outputText("你知道自己无法移动，也意识到自己最终会饿死。");
         menu();
         if(get_player().hasItem(get_consumables().REDUCTO,1))
         {
            outputText("[pg]幸运的是，你有一些缩形膏。你可以缩小你的蛋蛋，继续你的冒险！");
            addButton(1,"缩形膏",applyReductoAndEscapeBadEnd);
         }
         if(get_rathazul().followerRathazul())
         {
            outputText("[pg]你可以呼叫拉萨祖尔来帮你。");
            addButton(2,"拉萨祖尔",callRathazulAndEscapeBadEnd);
         }
         if(get_shouldraFollower().followerShouldra())
         {
            outputText("[pg]你可以呼叫舒尔德拉来缩小你那巨大的蛋蛋。");
            _g = get_shouldraFollower();
            rescue = true;
            addButton(3,"舒尔德拉",function():void
            {
               _g.shouldraReductosYourBallsUpInsideYa(rescue);
            });
         }
         else
         {
            get_game().gameOver();
         }
      }
      
      public function ascendForReal() : void
      {
         var _loc1_:int = 0;
         _loc1_ += companionsCount();
         if(get_game().dungeons.checkFactoryClear())
         {
            _loc1_++;
         }
         if(get_game().dungeons.checkDeepCaveClear())
         {
            _loc1_++;
         }
         if(get_game().dungeons.checkLethiceStrongholdClear())
         {
            _loc1_++;
         }
         if(get_game().dungeons.checkSandCaveClear())
         {
            _loc1_++;
         }
         if(get_game().dungeons.checkPhoenixTowerClear())
         {
            _loc1_ += 2;
         }
         if(get_game().dungeons.checkManorClear())
         {
            _loc1_ += 2;
         }
         if(get_game().dungeons.checkTowerDeceptionClear())
         {
            _loc1_ += 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2649) == 1)
         {
            _loc1_ += 2;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0800) != 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1051) > 0)
         {
            _loc1_ += 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2087) >= 10)
         {
            _loc1_ += 2;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) > 0)
         {
            _loc1_ += 2;
         }
         if(get_player().hasPerk(PerkLib.Enlightened))
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2176) >= 2)
         {
            _loc1_++;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & 0x40) != 0)
         {
            _loc1_ += 2;
         }
         _loc1_ += int(Math.sqrt(totalChildrenForAscension()));
         var _temp_1:* = get_player();
         _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints + _loc1_;
         get_player().knockUpForce();
         clearOutput();
         if(marbleFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) >= 7)
         {
            get_images().showImage("camp-ascending-marble");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) >= 7)
         {
            get_images().showImage("camp-ascending-sophie");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 12)
         {
            get_images().showImage("camp-ascending-amily");
         }
         else if(get_urtaPregs().urtaKids() >= 7)
         {
            get_images().showImage("camp-ascending-urta");
         }
         else if(get_player().cor >= 75)
         {
            get_images().showImage("camp-ascending-corrupt");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,777) >= 12 && get_player().hasCock())
         {
            get_images().showImage("camp-ascending-callu");
         }
         else
         {
            get_images().showImage("camp-watch-stars");
         }
         outputText("是你飞升的时候了。你走到营地中央，宣布你要飞升到一个更高的存在位面，然后躺下。");
         if(companionsCount() == 1)
         {
            outputText("[pg]你的同伴前来见证。");
         }
         else if(companionsCount() > 1)
         {
            outputText("[pg]你的同伴们前来见证。");
         }
         outputText("[pg]你开始发光；你已经能感觉到自己正在离开身体，你宣布了你的离去。");
         if(marbleFollower() && get_silly())
         {
            outputText("[pg][say:亲爱的，我会想你的。下个周目见，]玛布尔说道，眼泪从她的眼眶里流了出来。");
         }
         outputText("[pg]你周围的世界慢慢变黑，星星点缀着无尽的虚空。<b>你已经飞升了。</b>");
         doNext(get_game().charCreation.ascensionMenu);
      }
      
      public function applyReductoAndEscapeBadEnd() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         clearOutput();
         get_images().showImage("item-reducto");
         outputText("你将散发着恶臭的药膏涂抹在你的[sack]上。起初感觉很凉爽，但很快就升温到了令人不适的程度。[pg]");
         var _temp_1:* = get_player();
         _temp_1.ballSize = _temp_1.ballSize - (4 + Utils.rand(6));
         if(get_player().ballSize < 1)
         {
            get_player().ballSize = 1;
         }
         if(get_player().ballSize > 18 + get_player().get_str() / 2 + get_player().get_tallness() / 4)
         {
            _loc1_ = 17 + get_player().get_str() / 2;
            _loc2_ = get_player().get_tallness() / 4;
            get_player().ballSize = _loc1_ + _loc2_;
         }
         outputText("你感觉到你的阴囊在收缩，连同你的[balls]一起缩小。");
         outputText("几秒钟内，药膏被完全吸收，收缩停止了。");
         dynStats(DynStat.Lib(-2),DynStat.Lust(-10));
         get_player().consumeItem(get_consumables().REDUCTO,1);
         doNext(returnToCampUseOneHour);
      }
      
      public function allNaturalSelfStimulationBeltContinuation() : void
      {
         clearOutput();
         get_images().showImage("masti-stimBelt-allNatural");
         outputText("你震惊地尖叫起来，因为你意识到那个结节瞬间长成了一根巨大的、有机的假阳具。它轻易地插到底，抵在你的子宫颈上，而你正从最初被插入的震惊中恢复过来。随着阵痛消退，这个地狱般的附属物开始自己动了起来。它开始以长而缓慢的节奏起伏。它非常小心地调整自己，以贴合你子宫的每一道曲线。你不知所措，你的身体开始违背你的意识做出反应，慢慢地配合着那个东西的节奏挺动骨盆。[pg]");
         outputText("就像它突然插入你一样，它切换到了另一种运作模式。它尽可能深地埋入你的体内，开始短促而快速的抽插。这个玩具敲击你内壁的速度，是任何男人都无法企及的。你立刻高潮了，并产生了连续的性高潮。你的身体失去了原有的运动控制能力，随着这个装置无休止地抽插你的小穴，你狂野地扭动着身体。你声嘶力竭地尖叫。每一声叫喊都宣告着你深不见底的快感和欲望。[pg]");
         outputText("这条恶魔般的腰带再次发生了变化。它尽可能深地埋入你的体内，你感觉到女性深处传来的压力。你感觉到一股热流喷洒在你的体内。你条件反射般地大喊：\"<b>它射了！它射在我里面了！</b>\" 确实，这根戳刺的肉棒每一次推进，都让你的小穴充满了汁液。它射了……又射了……又射了……还在射……[pg]");
         outputText("仿佛过了一个世纪，你的小穴感到酸痛。它被撑开了，完全被这个东西射出的精液填满了。它从你的洞里缩了回去，你感到了最后一次压力的阵痛，因为你的身体现在有机会排出所有它无法承受的精液。黏液从腰带的两侧喷射出来，让你变得又臭又黏。你感觉到腰带的张力随着它的松开而减弱。这台机器已经完成了它的使命。你立刻昏了过去。");
         get_player().slimeFeed();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-0.5));
         doNext(returnToCampUseOneHour);
      }
      
      public function allNaturalSelfStimulationBeltBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         get_images().showImage("badend-stimBelt");
         outputText("无论这条腰带是什么，无论它能做什么，对你来说都不重要了。你现在唯一想要的，就是感受这条腰带和它的生物日日夜夜地狠狠操你。你迅速再次穿上这个生物，它开始在你那贪得无厌的小穴上施展它惯用的淫荡魔法。无尽的高潮浪潮席卷了你。你现在所知道的，只有永恒高潮带来的无尽极乐。[pg]");
         outputText("你的意识被腰带和快感彻底摧毁，你没有注意到一张熟悉的面孔正靠近你起伏的身躯。正是那个卖给你这个地狱玩具的人。商人，贾科莫。[pg]");
         outputText("[say: 哎呀，哎呀，]贾科莫说。[say: 浪子们说得对。这种生物的体液会让人上瘾。这个可怜的[manboy]已经完全沦为这只野兽的奴隶了！][pg]");
         outputText("贾科莫看着你在他面前因极度快感而扭动的样子，陷入了沉思。他那锐利的五官亮了起来，一个主意击中了他。[pg]");
         outputText("[say: 啊哈！]这位像老鹰一样的商人叫道。[say: 我有新产品可以卖了！我要叫它“独角女秀”！][pg]");
         outputText("贾科莫为自己的主意得意地咯咯笑了起来。[say: 谁知道会有人愿意花多少钱买一个停不下来高潮的活生生的[manboy]呢！][pg]");
         outputText("贾科莫把你装上他的马车，出发去进行他的下一笔交易。你不在乎。你没有意识到发生了什么。你只知道那个生物一直在射精，感觉……太他妈爽了！");
         get_game().gameOver();
      }
      
      public function acceptChallenge() : void
      {
         clearOutput();
         outputText("你穿过传送门，感觉自己正以令人难以置信的速度在太空中穿梭。");
         outputText("[pg]你周围的光线弯曲扭曲，声音在你被非物质化时扭曲变形。");
         outputText("[pg]眨眼间，你消失了。");
         set_inDungeon(true);
         doNext(get_game().dungeons.wizardTower.meetLaurentius3);
      }
   }
}

