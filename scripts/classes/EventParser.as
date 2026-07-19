package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.items.weapons.IceWeapon;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.net.SharedObject;
   import haxe.IMap;
   
   public class EventParser
   {
      
      public static var _timeAwareClassList:Array = [];
      
      public static var timeAwareLargeLastEntry:int = -1;
      
      public function EventParser()
      {
      }
      
      public static function outputText(param1:String) : void
      {
         KGAMECLASS.kGAMECLASS.outputText(param1);
      }
      
      public static function get_mainView() : MainView
      {
         return KGAMECLASS.kGAMECLASS.mainView;
      }
      
      public static function get_output() : Output
      {
         return KGAMECLASS.kGAMECLASS.output;
      }
      
      public static function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
      
      public static function get_inventory() : Inventory
      {
         return KGAMECLASS.kGAMECLASS.inventory;
      }
      
      public static function get_consumables() : ConsumableLib
      {
         return KGAMECLASS.kGAMECLASS.consumables;
      }
      
      public static function get_weapons() : WeaponLib
      {
         return KGAMECLASS.kGAMECLASS.weapons;
      }
      
      public static function get__gameState() : int
      {
         return KGAMECLASS.kGAMECLASS.gameStateDirectGet();
      }
      
      public static function set__gameState(param1:int) : int
      {
         KGAMECLASS.kGAMECLASS.gameStateDirectSet(param1);
         return param1;
      }
      
      public static function timeAwareClassAdd(param1:TimeAwareInterface) : void
      {
         EventParser._timeAwareClassList.push(param1);
      }
      
      public static function timeAwareClassRemove(param1:TimeAwareInterface) : Number
      {
         var _loc2_:int = 0;
         while(_loc2_ < int(EventParser._timeAwareClassList.length))
         {
            if(EventParser._timeAwareClassList[_loc2_] == param1)
            {
               EventParser._timeAwareClassList.splice(_loc2_,1);
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public static function playerMenu() : void
      {
         if(EventParser.get_player().gameOver)
         {
            EventParser.gameOver(true);
            return;
         }
         KGAMECLASS.kGAMECLASS.resetParsers();
         if(!KGAMECLASS.kGAMECLASS.get_inCombat())
         {
            KGAMECLASS.kGAMECLASS.spriteSelect(null);
         }
         EventParser.get_output().showStats();
         if(EventParser.get__gameState() == 1 || EventParser.get__gameState() == 2)
         {
            KGAMECLASS.kGAMECLASS.combat.combatMenu();
            return;
         }
         KGAMECLASS.kGAMECLASS.combat.plotFight = false;
         FlagDict_Impl_.arrayWriteString(EventParser.get_flags(),234,"");
         if(KGAMECLASS.kGAMECLASS.inDungeon)
         {
            KGAMECLASS.kGAMECLASS.dungeons.checkRoom();
            return;
         }
         if(KGAMECLASS.kGAMECLASS.inRoomedDungeon)
         {
            if(KGAMECLASS.kGAMECLASS.inRoomedDungeonResume != null)
            {
               KGAMECLASS.kGAMECLASS.inRoomedDungeonResume();
               return;
            }
         }
         FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),10,0);
         KGAMECLASS.kGAMECLASS.camp.doCamp();
      }
      
      public static function gameOver(param1:Boolean = false) : void
      {
         var _loc4_:* = null as SharedObject;
         if(param1)
         {
            KGAMECLASS.kGAMECLASS.clearOutput();
         }
         var _loc2_:Array = ["<b>游戏结束</b>","<b>游戏结束了，老兄！游戏结束了！</b>","<b>你刚刚触发了坏结局！</b>","<b>你的冒险已经走到了尽头……</b>","<b>哦，天哪，你触发了坏结局！</b>"];
         var _loc3_:String = _loc2_[Utils.rand(int(_loc2_.length))];
         EventParser.outputText("[pg]<font color=\"" + KGAMECLASS.kGAMECLASS.mainViewManager.colorHpMinus() + "\">" + _loc3_ + "</font>");
         if(KGAMECLASS.kGAMECLASS.get_hardcore())
         {
            EventParser.outputText("[pg]<b>由于你处于硬核模式，你的存档已被删除！</b>");
            _loc4_ = SharedObject.getLocal(KGAMECLASS.kGAMECLASS.get_hardcoreSlot(),"/");
            if(_loc4_.data.exists)
            {
               _loc4_.clear();
            }
            EventParser.get_player().gameOver = true;
         }
         var _loc5_:IMap = EventParser.get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc5_,2104,FlagDict_Impl_.arrayReadInt(_loc5_,2104) + 1);
         KGAMECLASS.kGAMECLASS.awardAchievement("游戏结束！",112,true,true);
         EventParser.get_output().menu();
         EventParser.get_output().addButton(0,"游戏结束",EventParser.gameOverMenuOverride).hint("你的游戏已结束。请读取存档或开始新游戏。");
         if(!KGAMECLASS.kGAMECLASS.get_hardcore())
         {
            EventParser.get_output().addButton(1,"梦魇",KGAMECLASS.kGAMECLASS.camp.wakeFromBadEnd).hint("这只是一场梦。醒醒吧。");
         }
         EventParser.gameOverMenuOverride();
         KGAMECLASS.kGAMECLASS.set_inCombat(false);
         KGAMECLASS.kGAMECLASS.monsterArray.resize(0);
         KGAMECLASS.kGAMECLASS.dungeonLoc = 0;
      }
      
      public static function gameOverMenuOverride() : void
      {
         EventParser.get_mainView().showMenuButton("newGame");
         EventParser.get_mainView().showMenuButton("data");
         EventParser.get_mainView().hideMenuButton("appearance");
         EventParser.get_mainView().hideMenuButton("level");
         EventParser.get_mainView().hideMenuButton("perks");
      }
      
      public static function getCurrentStackTrace() : String
      {
         var _loc1_:Error = new Error();
         return _loc1_.getStackTrace();
      }
      
      public static function errorPrint(param1:* = undefined) : void
      {
         KGAMECLASS.kGAMECLASS.clearOutput();
         KGAMECLASS.kGAMECLASS.rawOutputText("<b>恭喜，你发现了一个bug！</b>");
         KGAMECLASS.kGAMECLASS.rawOutputText("\n错误：未知事件！");
         KGAMECLASS.kGAMECLASS.rawOutputText("[pg]请报告你遇到了代码为：\"" + (param1 == null ? "null" : Std.string(param1)) + "\" 的问题 ");
         KGAMECLASS.kGAMECLASS.rawOutputText("\n游戏版本：\"" + "hgg 1.7.0" + "\" (<b>这很重要！请务必包含此信息！</b>) ");
         var _loc2_:String = EventParser.getCurrentStackTrace();
         if(_loc2_ != null && _loc2_ != "")
         {
            KGAMECLASS.kGAMECLASS.rawOutputText("以及堆栈跟踪：\n <pre>" + _loc2_ + "</pre>\n");
         }
         KGAMECLASS.kGAMECLASS.rawOutputText("\n请尽量包含你在遇到此 bug 时正在做什么的详细信息 ");
         if(_loc2_ != null && _loc2_ != "")
         {
            KGAMECLASS.kGAMECLASS.rawOutputText(" (包括将上述堆栈跟踪复制并粘贴到详细信息中)，");
         }
         KGAMECLASS.kGAMECLASS.rawOutputText("以便更容易追踪问题。谢谢！");
         EventParser.get_output().doNext(KGAMECLASS.kGAMECLASS.camp.returnToCampUseOneHour);
      }
      
      public static function goNext(param1:Number, param2:Boolean) : Boolean
      {
         var _loc3_:Boolean = EventParser.goNextWrapped(param1,param2);
         EventParser.get_player().sleeping = false;
         return _loc3_;
      }
      
      public static function goNextWrapped(param1:Number, param2:Boolean) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as String;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as StatusEffect;
         var _loc10_:* = null as Consumable;
         if(EventParser.timeAwareLargeLastEntry >= 0)
         {
            while(EventParser.timeAwareLargeLastEntry < int(EventParser._timeAwareClassList.length))
            {
               if(EventParser._timeAwareClassList[EventParser.timeAwareLargeLastEntry].timeChangeLarge())
               {
                  return true;
               }
               _temp_1.timeAwareLargeLastEntry += 1;
            }
            EventParser.timeAwareLargeLastEntry = -1;
         }
         var _loc3_:int = int(Math.round((KGAMECLASS.kGAMECLASS.timeQ - Math.floor(KGAMECLASS.kGAMECLASS.timeQ)) * 60));
         _temp_2.minutes += _loc3_;
         if(KGAMECLASS.kGAMECLASS.time.minutes > 59)
         {
            _temp_3.minutes -= 60;
            _temp_4.timeQ += 1;
         }
         KGAMECLASS.kGAMECLASS.timeQ = Math.floor(KGAMECLASS.kGAMECLASS.timeQ);
         while(KGAMECLASS.kGAMECLASS.timeQ > 0)
         {
            --KGAMECLASS.kGAMECLASS.timeQ;
            _temp_6.hours += 1;
            KGAMECLASS.kGAMECLASS.player.regeneration(false);
            _loc4_ = 0;
            while(_loc4_ < int(EventParser._timeAwareClassList.length))
            {
               if(EventParser._timeAwareClassList[_loc4_].timeChange())
               {
                  param2 = true;
               }
               _loc4_++;
            }
            if(KGAMECLASS.kGAMECLASS.time.hours > 23)
            {
               KGAMECLASS.kGAMECLASS.time.hours = 0;
               _temp_7.days += 1;
            }
            else if(KGAMECLASS.kGAMECLASS.time.hours == 21)
            {
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),1272) <= 0)
               {
                  EventParser.outputText("[pg]天空变暗，无星的黑夜降临。血红色的月亮慢慢从地平线上升起。[pg]");
               }
               else
               {
                  EventParser.outputText("[pg]天空变暗，繁星点点的黑夜降临。血红色的月亮慢慢从地平线上升起。[pg]");
               }
               param2 = true;
            }
            else if(KGAMECLASS.kGAMECLASS.time.hours == 6)
            {
               EventParser.outputText("[pg]天空开始变亮，月亮在远处的群山后落下，投下最后几道不祥的阴影，随后在光芒中消散。[pg]");
               param2 = true;
            }
            if(IceWeapon.playerHasIceWeapon() != "")
            {
               if(!IceWeapon.melt())
               {
                  param2 = true;
               }
            }
            EventParser.timeAwareLargeLastEntry = 0;
            while(EventParser.timeAwareLargeLastEntry < int(EventParser._timeAwareClassList.length))
            {
               if(EventParser._timeAwareClassList[EventParser.timeAwareLargeLastEntry].timeChangeLarge())
               {
                  return true;
               }
               _temp_8.timeAwareLargeLastEntry += 1;
            }
            EventParser.timeAwareLargeLastEntry = -1;
            if(KGAMECLASS.kGAMECLASS.time.hours == 2)
            {
               if(int(KGAMECLASS.kGAMECLASS.time.days % 30) == 0 && KGAMECLASS.kGAMECLASS.camp.isGuard("小A") && EventParser.get_player().hasCock() && FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),1204) >= 40)
               {
                  KGAMECLASS.kGAMECLASS.anemoneScene.goblinNightAnemone();
                  param2 = true;
               }
               else if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),787) > 0 && Utils.rand(100) < 5 && !EventParser.get_player().hasStatusEffect(StatusEffects.Infested))
               {
                  if(KGAMECLASS.kGAMECLASS.mountain.wormsScene.eligibleForWormInfestation())
                  {
                     KGAMECLASS.kGAMECLASS.mountain.wormsScene.nightTimeInfestation();
                     return true;
                  }
                  if(KGAMECLASS.kGAMECLASS.camp.campGuarded())
                  {
                     _loc5_ = KGAMECLASS.kGAMECLASS.camp.campGuardRandom();
                     if(_loc5_ == "Helia")
                     {
                        EventParser.outputText("[b:赫莉娅一边喝着啤酒，一边告诉你她把一大群恶心的虫子踩成了肉酱。回想起那一幕，她不禁打了个寒颤。][pg]");
                     }
                     else if(_loc5_ == "Holli")
                     {
                        EventParser.outputText("[b:霍莉告诉你，她昨晚把一大群虫子赶出了营地。][pg]");
                     }
                     else if(_loc5_ == "Jojo")
                     {
                        EventParser.outputText("[b:乔乔告诉你，他在夜里消灭了一大群试图潜入营地的白色小蠕虫。][pg]");
                     }
                     else if(_loc5_ == "Kiha")
                     {
                        EventParser.outputText("[b:你醒来后发现营地周围到处都是被烧焦的虫子痕迹。看来奇哈击退了一大群小畜生。][pg]");
                     }
                     else if(_loc5_ == "Nieve")
                     {
                        EventParser.outputText("[b:尼芙在告诉你[nieve ey]昨晚击退了一大群黏糊糊的虫子时，[nieve eir]脸上露出了厌恶的表情。][pg]");
                     }
                     else if(_loc5_ == "小A")
                     {
                        EventParser.outputText("[b:小A早上看起来吃得很饱，你注意到有一条黏液痕迹一直延伸到湖的方向。][pg]");
                     }
                     param2 = true;
                  }
                  else if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),2006) > 0 && FlagDict_Impl_.arrayReadString(EventParser.get_flags(),701) == "")
                  {
                     EventParser.outputText("[b:你听到一群沮丧的虫子撞击门的声音。幸好你睡觉前锁了门！][pg]");
                     param2 = true;
                  }
               }
            }
            if(!EventParser.get_player().hasPerk(PerkLib.Diapause))
            {
               if(EventParser.get_player().pregnancyAdvance())
               {
                  param2 = true;
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(EventParser.get_player().hasPerk(PerkLib.MagicalFertility))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.FerasBoonBreedingBitch))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(EventParser.get_player().hasPerk(PerkLib.FerasBoonWideOpen) || EventParser.get_player().hasPerk(PerkLib.FerasBoonMilkingTwat))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.BroodMother))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),228) > 0 && (EventParser.get_player().get_pregnancyIncubation() > 0 || EventParser.get_player().get_buttPregnancyIncubation() > 0))
            {
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),229) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),229,0);
                  EventParser.outputText("[pg]你的身体对营养的涌入做出了反应，加速了你的怀孕进程。你的肚子微微凸起。");
                  param2 = true;
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               _loc6_ = 228;
               _loc7_ = FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),_loc6_);
               FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),_loc6_,_loc7_ - 1);
               if(EventParser.get_player().pregnancyAdvance())
               {
                  param2 = true;
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().pregnancyAdvance())
               {
                  param2 = true;
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().pregnancyAdvance())
               {
                  param2 = true;
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.MaraesGiftFertility))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(EventParser.get_player().hasPerk(PerkLib.MagicalFertility))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.FerasBoonBreedingBitch))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(EventParser.get_player().hasPerk(PerkLib.FerasBoonWideOpen) || EventParser.get_player().hasPerk(PerkLib.FerasBoonMilkingTwat))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
               if(EventParser.get_player().hasPerk(PerkLib.BroodMother))
               {
                  if(EventParser.get_player().pregnancyAdvance())
                  {
                     param2 = true;
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),800) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),800,0);
                  return true;
               }
            }
            if(EventParser.get_player().hasStatusEffect(StatusEffects.LootEgg))
            {
               if(!EventParser.get_player().hasStatusEffect(StatusEffects.Eggs))
               {
                  EventParser.outputText("哎呀，看来怀孕后收集卵的代码出了点问题。希望这不会再发生了。如果你再次遇到这种情况，请告诉 Kitteh6660，以便他修复它。");
                  EventParser.get_player().removeStatusEffect(StatusEffects.LootEgg);
                  EventParser.get_output().doNext(EventParser.playerMenu);
                  return true;
               }
               _loc8_ = [[EventParser.get_consumables().BROWNEG,EventParser.get_consumables().PURPLEG,EventParser.get_consumables().BLUEEGG,EventParser.get_consumables().PINKEGG,EventParser.get_consumables().WHITEEG,EventParser.get_consumables().BLACKEG],[EventParser.get_consumables().L_BRNEG,EventParser.get_consumables().L_PRPEG,EventParser.get_consumables().L_BLUEG,EventParser.get_consumables().L_PNKEG,EventParser.get_consumables().L_WHTEG,EventParser.get_consumables().L_BLKEG]];
               _loc9_ = EventParser.get_player().statusEffectByType(StatusEffects.Eggs);
               _loc6_ = _loc9_ != null ? int(_loc9_.value2) : 0;
               _loc7_ = _loc9_ != null ? int(_loc9_.value1) : 0;
               _loc10_ = _loc8_[_loc6_][_loc7_];
               if(_loc10_ == null)
               {
                  _loc10_ = EventParser.get_consumables().BROWNEG;
               }
               EventParser.get_player().removeStatusEffect(StatusEffects.LootEgg);
               EventParser.get_player().removeStatusEffect(StatusEffects.Eggs);
               EventParser.get_inventory().takeItem(_loc10_,EventParser.playerMenu);
               return true;
            }
            if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),1186) > 0)
            {
               _loc6_ = 1187;
               _loc7_ = FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),_loc6_);
               FlagDict_Impl_.arrayWriteInt(EventParser.get_flags(),_loc6_,_loc7_ - 1);
            }
         }
         KGAMECLASS.kGAMECLASS.telAdre.umasShop.updateBonusDuration(param1);
         if(EventParser.get_player().get_tallness() < 78 && EventParser.get_player().get_str() < 90 && EventParser.get_player().get_weapon() == EventParser.get_weapons().L__AXE)
         {
            EventParser.outputText("<b>这把斧头对你这种身材的人来说太大了，不过你可以把它放在物品栏里，直到你长得足够大。</b>[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setUnarmed(),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().get_tallness() < 60 && EventParser.get_player().get_str() < 70 && EventParser.get_player().get_weapon() == EventParser.get_weapons().L_HAMMR)
         {
            EventParser.outputText("<b>你变得太矮了，无法再使用这把锤子。你仍然可以把它放在物品栏里，但你需要长得更高才能有效地挥舞它。</b>[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setUnarmed(),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().get_weapon() == EventParser.get_weapons().CLAYMOR && EventParser.get_player().get_str() < 40)
         {
            EventParser.outputText("<b>你已经没有足够的力气来承受武器的重量了，被迫停止使用它。</b>[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setUnarmed(),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().get_weapon() == EventParser.get_weapons().WARHAMR && EventParser.get_player().get_str() < 80)
         {
            EventParser.outputText("<b>你已经没有足够的力气来承受武器的重量了！</b>[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setUnarmed(),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().get_weapon().isHolySword() && !EventParser.get_player().isPureEnough(35))
         {
            KGAMECLASS.kGAMECLASS.beautifulSwordScene.rebellingBeautifulSword();
            return true;
         }
         if(EventParser.get_player().get_weapon().isUnholy() && !EventParser.get_player().isCorruptEnough(70))
         {
            EventParser.outputText("<b>[weapon]在你的手中变得滚烫，直到你被迫将它扔下。无论这把剑中蕴含着什么力量，似乎都对你的纯洁感到厌恶。你小心翼翼地碰了碰它，发现它已经不烫了，但只要你一去抓剑柄，它就几乎要烧伤你。");
            EventParser.outputText("[pg]你意识到你现在无法使用它，但你也许可以把它留在物品栏里。</b>[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setUnarmed(),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().get_weapon() == EventParser.get_weapons().SCARBLD && !EventParser.get_player().isCorruptEnough(70))
         {
            KGAMECLASS.kGAMECLASS.sheilaScene.rebellingScarredBlade();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(EventParser.get_flags(),2175) == 1 && EventParser.get_player().isCorruptEnough(70))
         {
            KGAMECLASS.kGAMECLASS.sheilaScene.findScarredBlade();
            return true;
         }
         if(EventParser.get_player().get_armorName() == "lusty maiden\'s armor")
         {
            if(EventParser.get_player().hasCock() && !EventParser.get_player().hasSheath() || EventParser.get_player().balls > 0)
            {
               EventParser.outputText("你穿着那件淫荡比基尼的丁字裤，不安地扭动着身体——那里根本没有足够的空间容纳你的");
               if(EventParser.get_player().hasCock())
               {
                  EventParser.outputText("男性特征");
               }
               else
               {
                  EventParser.outputText("鼓胀的蛋蛋");
               }
               EventParser.outputText("被禁锢在皮革里，穿上它甚至会感到疼痛。<b>你必须找点别的防具了！</b>[pg]");
               EventParser.get_inventory().takeItem(EventParser.get_player().setArmor(ArmorLib.NOTHING),EventParser.playerMenu);
               return true;
            }
            if(!EventParser.get_player().hasVagina())
            {
               EventParser.outputText("你不安地扭动着身体，那件淫荡比基尼裤裆的折痕深深陷入了你敏感而平坦的下体。你根本无法舒适地继续穿着这套衣服——它是专门为挤压女性阴阜而设计的，没有阴道的话，<b>你根本穿不了这件异国情调的护甲。</b>[pg]");
               EventParser.get_inventory().takeItem(EventParser.get_player().setArmor(ArmorLib.NOTHING),EventParser.playerMenu);
               return true;
            }
            if(EventParser.get_player().biggestTitSize() < 4)
            {
               EventParser.outputText("构成你那件淫荡比基尼上衣的细链条正松松垮垮地挂在你平坦的胸前。你的每一个动作和步伐都会让它发出嘈杂的叮当声，拍打着你的[nipples]，在与你的[skinfurscales]脱离接触这么久之后，它变得冰冷得让人不舒服。<b>毫无疑问——你需要找点别的衣服穿了。</b>[pg]");
               EventParser.get_inventory().takeItem(EventParser.get_player().setArmor(ArmorLib.NOTHING),EventParser.playerMenu);
               return true;
            }
         }
         if(EventParser.get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
         {
            if(EventParser.get_player().isTaur() || EventParser.get_player().isDrider() || EventParser.get_player().hasTailInsteadOfLegs() && EventParser.get_player().get_lowerGarmentPerk() != "TailLegWearable")
            {
               EventParser.outputText("你感觉有什么东西像变魔术一样滑落了。低头看向地面，你发现那是你的" + EventParser.get_player().get_lowerGarmentName() + "。看着自己的下半身，你叹了口气，捡起了你的[lowergarment]。[pg]");
               EventParser.get_inventory().takeItem(EventParser.get_player().setUndergarment(UndergarmentLib.NOTHING,1),EventParser.playerMenu);
               return true;
            }
         }
         if(EventParser.get_player().get_weapon().isTwoHanded() && EventParser.get_player().get_shield() != ShieldLib.NOTHING && !(EventParser.get_player().hasPerk(PerkLib.TitanGrip) && EventParser.get_player().get_str() >= 90))
         {
            EventParser.outputText("你当前的武器需要双手使用。因此，你的盾牌已被自动卸下。[pg]");
            EventParser.get_inventory().takeItem(EventParser.get_player().setShield(ShieldLib.NOTHING),EventParser.playerMenu);
            return true;
         }
         if(EventParser.get_player().totalCocks() != 0)
         {
            _loc4_ = EventParser.get_player().totalCocks() - 1;
            while(_loc4_ >= 0)
            {
               if(EventParser.get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.DOG || EventParser.get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.FOX)
               {
                  if(EventParser.get_player().dogScore() >= EventParser.get_player().foxScore())
                  {
                     EventParser.get_player().cocks[_loc4_].set_cockType(CockTypesEnum.DOG);
                  }
                  else
                  {
                     EventParser.get_player().cocks[_loc4_].set_cockType(CockTypesEnum.FOX);
                  }
               }
               _loc4_--;
            }
         }
         EventParser.get_output().statScreenRefresh();
         if(param2)
         {
            EventParser.get_output().doNext(EventParser.playerMenu);
            return true;
         }
         EventParser.playerMenu();
         return false;
      }
      
      public static function cheatTime(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:int = int(Math.round((param1 - Math.floor(param1)) * 60));
         _temp_1.minutes += _loc3_;
         if(KGAMECLASS.kGAMECLASS.time.minutes > 59)
         {
            _temp_2.minutes -= 60;
            param1++;
         }
         param1 = Math.floor(param1);
         while(param1 > 0)
         {
            param1--;
            _temp_3.hours += 1;
            if(KGAMECLASS.kGAMECLASS.time.hours > 23)
            {
               _temp_4.days += 1;
               KGAMECLASS.kGAMECLASS.time.hours = 0;
            }
         }
         EventParser.get_output().statScreenRefresh();
      }
   }
}

