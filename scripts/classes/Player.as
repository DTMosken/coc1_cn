package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes._StatusEffect.DataStore;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Equippable;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.lists.ColorLists;
   import classes.scenes.Inventory;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.combat.CombatAbility;
   import classes.scenes.dungeons.manor.NamelessHorror;
   import classes.statusEffects.MermaidWateredBuff;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.Either;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   
   public class Player extends PlayerHelper
   {
      
      public static var NUMBER_OF_ITEMSLOTS:int = 10;
      
      public static var LOCATION_FOREST:String = "森林";
      
      public static var LOCATION_DEEPWOODS:String = "密林";
      
      public static var LOCATION_LAKE:String = "湖泊";
      
      public static var LOCATION_DESERT:String = "沙漠";
      
      public static var LOCATION_BOG:String = "沼泽";
      
      public static var LOCATION_VOLCANICCRAG:String = "火山岩山";
      
      public static var LOCATION_GLACIALRIFT:String = "冰川裂谷";
      
      public static var LOCATION_MOUNTAINS:String = "山脉";
      
      public static var LOCATION_HIGHMOUNTAINS:String = "高山";
      
      public static var LOCATION_SWAMP:String = "沼泽";
      
      public static var LOCATION_PLAINS:String = "平原";
      
      public static var LOCATION_EXPLORING:String = "荒野";
      
      public static var LOCATION_BOAT:String = "船只";
      
      public static var LOCATION_SWIM:String = "swim";
      
      public static var LOCATION_CAMP:String = "camp";
      
      public var statPoints:Number;
      
      public var startingRace:String;
      
      public var slotName:String;
      
      public var sleeping:Boolean;
      
      public var sexOrientation:Number;
      
      public var previouslyWornClothes:Array;
      
      public var perkPoints:Number;
      
      public var lustVuln:Number;
      
      public var lostVirginity:Boolean;
      
      public var location:String;
      
      public var loaded:Boolean;
      
      public var itemSlots:Array;
      
      public var hunger:Number;
      
      public var gameOver:Boolean;
      
      public var charCreation:Boolean;
      
      public var autoSave:Boolean;
      
      public var ascensionPerkPoints:Number;
      
      public var _weapon:Weapon;
      
      public var _upperGarment:Undergarment;
      
      public var _shield:Shield;
      
      public var _modArmorName:String;
      
      public var _lowerGarment:Undergarment;
      
      public var _jewelry:Jewelry;
      
      public var _armor:Armor;
      
      public function Player()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _modArmorName = "";
         _lowerGarment = UndergarmentLib.NOTHING;
         _upperGarment = UndergarmentLib.NOTHING;
         _shield = ShieldLib.NOTHING;
         _jewelry = JewelryLib.NOTHING;
         _armor = ArmorLib.NOTHING;
         _weapon = WeaponLib.FISTS;
         previouslyWornClothes = [];
         itemSlots = [];
         sexOrientation = 50;
         ascensionPerkPoints = 0;
         statPoints = 0;
         perkPoints = 0;
         hunger = 0;
         sleeping = false;
         lustVuln = 1;
         autoSave = false;
         slotName = "VOID";
         lostVirginity = false;
         startingRace = "human";
         gameOver = false;
         charCreation = false;
         loaded = false;
         super();
         initializeItemSlots();
      }
      
      public function xpToLevel(param1:int) : int
      {
         var _loc2_:int = 0;
         while(param1 > level)
         {
            _loc2_ += requiredXP(param1 - 1);
            param1--;
         }
         return int(_loc2_ - int(XP));
      }
      
      public function wolfScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 24)
         {
            _loc1_++;
         }
         if(wolfCocks() > 0)
         {
            _loc1_++;
         }
         if(ears.type == 18)
         {
            _loc1_++;
         }
         if(tail.type == 26)
         {
            _loc1_++;
         }
         if(lowerBody.type == 26)
         {
            _loc1_++;
         }
         if(eyes.type == 6)
         {
            _loc1_ += 2;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2)
         {
            if(int(breastRows.length) > 1)
            {
               _loc1_++;
            }
            if(int(breastRows.length) == 4)
            {
               _loc1_++;
            }
            if(int(breastRows.length) > 4)
            {
               _loc1_--;
            }
         }
         return _loc1_;
      }
      
      public function weightRating() : Number
      {
         var _loc1_:Number = 100;
         _loc1_ *= 1 + (get_tallness() - 77) / 43;
         _loc1_ *= 1 + thickness / 200;
         _loc1_ *= 1 + tone / 400;
         if(isTaur() || isDrider())
         {
            _loc1_ *= 1.3;
         }
         if(hasTailInsteadOfLegs())
         {
            _loc1_ *= 1.1;
         }
         return _loc1_;
      }
      
      override public function weaponCanParry() : Boolean
      {
         if(isUnarmed())
         {
            if(get_weapon().isFist() && get_weapon().masteryLevel() >= 4)
            {
               return true;
            }
            if(get_weapon().isClaw() && get_weapon().masteryLevel() >= 3)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function usingMagicTF() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(get_flags(),2721) == 1;
      }
      
      public function usingMagicBW() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(get_flags(),2721) == 0;
      }
      
      public function upgradeDeusVult() : void
      {
         if(hasPerk(PerkLib.HistoryDEUSVULT) && isPureEnough(25))
         {
            set_lust(0);
            if(perkv1(PerkLib.HistoryDEUSVULT) < 50)
            {
               addPerkValue(PerkLib.HistoryDEUSVULT,1,1);
            }
         }
      }
      
      public function upgradeBeautifulSword(param1:int = 1) : void
      {
         var _loc2_:* = null as IMap;
         if(get_weapon().isHolySword())
         {
            _loc2_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc2_,2662,FlagDict_Impl_.arrayReadInt(_loc2_,2662) + param1);
         }
         upgradeDeusVult();
      }
      
      override public function updateUnarmed() : void
      {
         if(isUnarmed())
         {
            setUnarmed();
         }
      }
      
      public function updateInfestations(param1:int) : Boolean
      {
         if(hasStatusEffect(StatusEffects.ParasiteEel))
         {
            if(statusEffectv2(StatusEffects.ParasiteEelNeedCum) == param1 || PregnancyUtils.isMouseCum(param1) && PregnancyUtils.isMouseCum(int(statusEffectv2(StatusEffects.ParasiteEelNeedCum))))
            {
               if(param1 == 2)
               {
                  addStatusValue(StatusEffects.ParasiteEelNeedCum,3,-1);
               }
               addStatusValue(StatusEffects.ParasiteEelNeedCum,3,-1);
               if(statusEffectv3(StatusEffects.ParasiteEelNeedCum) <= 0)
               {
                  removeStatusEffect(StatusEffects.ParasiteEelNeedCum);
                  addStatusValue(StatusEffects.ParasiteEel,2,1);
               }
            }
            return true;
         }
         if(hasStatusEffect(StatusEffects.ParasiteNephila))
         {
            if(statusEffectv2(StatusEffects.ParasiteNephilaNeedCum) == param1 || PregnancyUtils.isMouseCum(param1) && PregnancyUtils.isMouseCum(int(statusEffectv2(StatusEffects.ParasiteNephilaNeedCum))))
            {
               if(param1 == 2)
               {
                  addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,-1);
               }
               addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,-1);
               if(statusEffectv3(StatusEffects.ParasiteNephilaNeedCum) <= 0)
               {
                  removeStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
                  addStatusValue(StatusEffects.ParasiteNephila,2,1);
               }
            }
            return true;
         }
         return false;
      }
      
      override public function updateBleed() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < int(statusEffects.length))
         {
            if(statusEffects[_loc2_].get_stype().get_id() == "Izma Bleed")
            {
               _temp_1.value1 -= 1;
               _loc1_ += statusEffects[_loc2_].value1;
               if(statusEffects[_loc2_].value1 <= 0)
               {
                  statusEffects.splice(_loc2_,1);
               }
            }
            _loc2_++;
         }
         if(_loc1_ <= 0)
         {
            outputText("<b>你松了一口气；你的流血速度已经大大减缓了。</b>[pg]");
         }
         else
         {
            _loc3_ = bleedDamage();
            _loc3_ = takeDamage(_loc3_);
            outputText("你痛得倒吸一口凉气，皱起眉头，感觉到新鲜的血液从伤口涌出。(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc3_ + "</font>)[pg]");
         }
      }
      
      public function textByWetnessVagina(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : String
      {
         var _loc7_:Number = vaginas[0].vaginalWetness;
         if(_loc7_ == 0)
         {
            return param1;
         }
         if(_loc7_ == 1)
         {
            return param2;
         }
         if(_loc7_ == 2)
         {
            return param3;
         }
         if(_loc7_ == 3)
         {
            return param4;
         }
         if(_loc7_ == 4)
         {
            return param5;
         }
         if(_loc7_ == 5)
         {
            return param6;
         }
         return "阴道湿润度低于0或高于5？这比你想象的还要常见（这是一个bug）。";
      }
      
      public function teaseSkillToMastery(param1:int, param2:int) : void
      {
         var _loc3_:int = int(param2 * (int(100 * Math.pow(MasteryLib.Tease.get_xpCurve(),param1))) / (10 + (param1 + 1) * (param1 + 1) * 5));
         addMastery(MasteryLib.Tease,param1,_loc3_,false);
      }
      
      override public function takeLustDamage(param1:Number, param2:Boolean = true, param3:Boolean = true) : Number
      {
         var _loc4_:Number = Number(super.takeLustDamage(param1,param2,param3));
         if(param2)
         {
            outputText(get_game().combat.getLustText(_loc4_));
         }
         return _loc4_;
      }
      
      override public function takeDamage(param1:Number, param2:Boolean = false) : Number
      {
         var _loc4_:* = null as CoC;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as IMap;
         if(hasStatusEffect(StatusEffects.TFShell))
         {
            return 0;
         }
         if(hasStatusEffect(StatusEffects.TempleBlessing))
         {
            param1 *= 0.95;
         }
         param1 = Math.round(param1);
         var _loc3_:int = int(param1 > 0 && param1 < 1 ? 1 : int(param1));
         if(param1 > 0)
         {
            if(get_game().get_inCombat())
            {
               var _temp_1:* = get_game().combat;
               _temp_1.damageTaken = _temp_1.damageTaken + param1;
            }
            HPChange(-param1,false);
            if(param2)
            {
               get_game().output.text(get_game().combat.getDamageText(param1));
            }
            get_game().mainView.statsView.showStatDown("hp");
            if(int([DynStat.Lust(0)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(0)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0]);
            }
            else if(int([DynStat.Lust(0)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1]);
            }
            else if(int([DynStat.Lust(0)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2]);
            }
            else if(int([DynStat.Lust(0)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3]);
            }
            else if(int([DynStat.Lust(0)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4]);
            }
            else if(int([DynStat.Lust(0)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5]);
            }
            else if(int([DynStat.Lust(0)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6]);
            }
            else if(int([DynStat.Lust(0)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7]);
            }
            else if(int([DynStat.Lust(0)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8]);
            }
            else if(int([DynStat.Lust(0)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9]);
            }
            else if(int([DynStat.Lust(0)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10]);
            }
            else if(int([DynStat.Lust(0)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11]);
            }
            else if(int([DynStat.Lust(0)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12]);
            }
            else if(int([DynStat.Lust(0)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13]);
            }
            else if(int([DynStat.Lust(0)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14]);
            }
            else if(int([DynStat.Lust(0)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14],[DynStat.Lust(0)][15]);
            }
            else if(int([DynStat.Lust(0)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14],[DynStat.Lust(0)][15],[DynStat.Lust(0)][16]);
            }
            else if(int([DynStat.Lust(0)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14],[DynStat.Lust(0)][15],[DynStat.Lust(0)][16],[DynStat.Lust(0)][17]);
            }
            else if(int([DynStat.Lust(0)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14],[DynStat.Lust(0)][15],[DynStat.Lust(0)][16],[DynStat.Lust(0)][17],[DynStat.Lust(0)][18]);
            }
            else
            {
               if(int([DynStat.Lust(0)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(0)][0],[DynStat.Lust(0)][1],[DynStat.Lust(0)][2],[DynStat.Lust(0)][3],[DynStat.Lust(0)][4],[DynStat.Lust(0)][5],[DynStat.Lust(0)][6],[DynStat.Lust(0)][7],[DynStat.Lust(0)][8],[DynStat.Lust(0)][9],[DynStat.Lust(0)][10],[DynStat.Lust(0)][11],[DynStat.Lust(0)][12],[DynStat.Lust(0)][13],[DynStat.Lust(0)][14],[DynStat.Lust(0)][15],[DynStat.Lust(0)][16],[DynStat.Lust(0)][17],[DynStat.Lust(0)][18],[DynStat.Lust(0)][19]);
            }
            if(FlagDict_Impl_.arrayReadInt(get_flags(),21) > 0)
            {
               _loc4_ = get_game();
               _loc5_ = [DynStat.Lust(int(param1 / 2))];
               if(int(_loc5_.length) == 0)
               {
                  _loc4_.player.dynStats();
               }
               else if(int(_loc5_.length) == 1)
               {
                  _loc4_.player.dynStats(_loc5_[0]);
               }
               else if(int(_loc5_.length) == 2)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1]);
               }
               else if(int(_loc5_.length) == 3)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2]);
               }
               else if(int(_loc5_.length) == 4)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3]);
               }
               else if(int(_loc5_.length) == 5)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4]);
               }
               else if(int(_loc5_.length) == 6)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5]);
               }
               else if(int(_loc5_.length) == 7)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6]);
               }
               else if(int(_loc5_.length) == 8)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7]);
               }
               else if(int(_loc5_.length) == 9)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8]);
               }
               else if(int(_loc5_.length) == 10)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9]);
               }
               else if(int(_loc5_.length) == 11)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10]);
               }
               else if(int(_loc5_.length) == 12)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11]);
               }
               else if(int(_loc5_.length) == 13)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12]);
               }
               else if(int(_loc5_.length) == 14)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13]);
               }
               else if(int(_loc5_.length) == 15)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14]);
               }
               else if(int(_loc5_.length) == 16)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14],_loc5_[15]);
               }
               else if(int(_loc5_.length) == 17)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14],_loc5_[15],_loc5_[16]);
               }
               else if(int(_loc5_.length) == 18)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14],_loc5_[15],_loc5_[16],_loc5_[17]);
               }
               else if(int(_loc5_.length) == 19)
               {
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14],_loc5_[15],_loc5_[16],_loc5_[17],_loc5_[18]);
               }
               else
               {
                  if(int(_loc5_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc4_.player.dynStats(_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13],_loc5_[14],_loc5_[15],_loc5_[16],_loc5_[17],_loc5_[18],_loc5_[19]);
               }
            }
            if(get_game().combat.monsterDamageType == "Fire" && (get_armor().get_id() == get_game().armors.VINARMR.get_id() || dryadScore() >= 4))
            {
               changeFatigue(int(param1 / maxHP() * 100));
            }
            if(get_HP() <= 0)
            {
               set_HP(0);
            }
         }
         if(param1 > 0 && param2)
         {
            _loc6_ = get_flags();
            FlagDict_Impl_.arrayWriteFloat(_loc6_,2376,FlagDict_Impl_.arrayReadFloat(_loc6_,2376) + param1);
            if(FlagDict_Impl_.arrayReadFloat(get_flags(),2376) >= 10000)
            {
               get_game().awardAchievement("伤害海绵",87,true,true,true);
            }
         }
         return _loc3_;
      }
      
      public function statsMaxed() : Boolean
      {
         if(get_str() >= getMaxStats("str") && get_tou() >= getMaxStats("tou") && get_inte() >= getMaxStats("int"))
         {
            return get_spe() >= getMaxStats("spe");
         }
         return false;
      }
      
      public function spiderScore() : Number
      {
         var _loc1_:Number = 0;
         if(eyes.type == 7 && eyes.count == 4)
         {
            _loc1_ += 2;
         }
         else if(eyes.type == 7)
         {
            _loc1_++;
         }
         if(face.type == 10)
         {
            _loc1_++;
         }
         if(arms.type == 2)
         {
            _loc1_++;
         }
         if([15,16].indexOf(lowerBody.type) != -1)
         {
            _loc1_ += 2;
         }
         else if(_loc1_ > 0)
         {
            _loc1_--;
         }
         if(tail.type == 5)
         {
            _loc1_ += 2;
         }
         if(!hasPlainSkin() && _loc1_ > 0)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function spellsCastToMastery(param1:int) : void
      {
         var _loc2_:int = 0;
         if(param1 < 5)
         {
            _loc2_ = param1 * 20;
            addMastery(MasteryLib.Casting,0,_loc2_,false);
         }
         else if(param1 < 15)
         {
            _loc2_ = (param1 - 5) * 15;
            addMastery(MasteryLib.Casting,1,_loc2_,false);
         }
         else if(param1 < 45)
         {
            _loc2_ = (param1 - 15) * 7;
            addMastery(MasteryLib.Casting,2,_loc2_,false);
         }
         else
         {
            _loc2_ = param1 - 45;
            addMastery(MasteryLib.Casting,3,0,false);
            masteryXP(MasteryLib.Casting,_loc2_,false);
         }
      }
      
      public function spellbladeBonus() : Number
      {
         var _loc1_:Number = 1;
         if(hasPerk(PerkLib.ArcaneSmithing))
         {
            _loc1_ *= perkv1(PerkLib.ArcaneSmithing);
         }
         if(hasPerk(PerkLib.IvoryMagic))
         {
            _loc1_ *= perkv1(PerkLib.IvoryMagic);
         }
         return _loc1_;
      }
      
      public function spellCount(param1:String = undefined) : Number
      {
         var _loc3_:* = null as Function;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as StatusEffectType;
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc2_:String = param1;
         if(_loc2_ == "black")
         {
            _loc3_ = hasStatusEffect;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = StatusEffects.spellsBlack;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               if(Boolean(_loc3_(_loc7_)))
               {
                  _loc4_.push(_loc7_);
               }
            }
            return int(_loc4_.length);
         }
         if(_loc2_ == "gray")
         {
            _loc3_ = hasStatusEffect;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = StatusEffects.spellsGray;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               if(Boolean(_loc3_(_loc7_)))
               {
                  _loc4_.push(_loc7_);
               }
            }
            return int(_loc4_.length);
         }
         if(_loc2_ == "other")
         {
            _loc3_ = hasStatusEffect;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = StatusEffects.spellsOther;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               if(Boolean(_loc3_(_loc7_)))
               {
                  _loc4_.push(_loc7_);
               }
            }
            return int(_loc4_.length);
         }
         if(_loc2_ != "terrestrial fire")
         {
            if(_loc2_ != "tf")
            {
               if(_loc2_ == "white")
               {
                  _loc3_ = hasStatusEffect;
                  _loc4_ = [];
                  _loc5_ = 0;
                  _loc6_ = StatusEffects.spellsWhite;
                  while(_loc5_ < int(_loc6_.length))
                  {
                     _loc7_ = _loc6_[_loc5_];
                     _loc5_++;
                     if(Boolean(_loc3_(_loc7_)))
                     {
                        _loc4_.push(_loc7_);
                     }
                  }
                  return int(_loc4_.length);
               }
               _loc3_ = hasStatusEffect;
               _loc4_ = [];
               _loc5_ = 0;
               _loc6_ = StatusEffects.spells;
               while(_loc5_ < int(_loc6_.length))
               {
                  _loc7_ = _loc6_[_loc5_];
                  _loc5_++;
                  if(Boolean(_loc3_(_loc7_)))
                  {
                     _loc4_.push(_loc7_);
                  }
               }
               return int(_loc4_.length) + (hasPerk(PerkLib.TerrestrialFire) ? Math.min(10,2 + masteryLevel(MasteryLib.TerrestrialFire) * 2) : 0);
            }
         }
         if(hasPerk(PerkLib.TerrestrialFire))
         {
            return Math.min(10,2 + masteryLevel(MasteryLib.TerrestrialFire) * 2);
         }
         return 0;
      }
      
      public function smallMedBigBreasts(param1:String, param2:String, param3:String, param4:String = undefined, param5:String = undefined) : String
      {
         if(param4 == null)
         {
            param4 = "A";
         }
         if(param5 == null)
         {
            param5 = "DD";
         }
         if(averageBreastSize() <= Appearance.breastCupInverse(param4))
         {
            return param1;
         }
         if(averageBreastSize() > Appearance.breastCupInverse(param4) && averageBreastSize() > Appearance.breastCupInverse(param5))
         {
            return param2;
         }
         return param3;
      }
      
      public function slimeFeed() : void
      {
         var _loc1_:* = null as IMap;
         if(hasStatusEffect(StatusEffects.SlimeCraving))
         {
            changeStatusValue(StatusEffects.SlimeCraving,1,0);
            if(!hasStatusEffect(StatusEffects.SlimeCravingFeed))
            {
               createStatusEffect(StatusEffects.SlimeCravingFeed,0,0,0,0);
            }
         }
         if(hasPerk(PerkLib.Diapause))
         {
            _loc1_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc1_,228,FlagDict_Impl_.arrayReadInt(_loc1_,228) + (3 + Utils.rand(3)));
            FlagDict_Impl_.arrayWriteInt(get_flags(),229,1);
         }
      }
      
      public function sirenScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 4 && tail.type == 7 && wings.type == 9 && arms.type == 1)
         {
            _loc1_ += 4;
         }
         if(_loc1_ > 0 && hasVagina())
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function shrinkTits(param1:Boolean = false) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = null as BreastRow;
         var _loc4_:* = null as BreastRow;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(get_game().get_hyper() && !param1)
         {
            return;
         }
         if(int(breastRows.length) == 1)
         {
            if(breastRows[0].breastRating >= 1)
            {
               _loc2_ = 1;
               _loc3_ = breastRows[0];
               --_loc3_.breastRating;
               if(breastRows[0].breastRating >= 1 && Utils.rand(2) == 0 && !hasPerk(PerkLib.BigTits))
               {
                  _loc2_++;
                  _loc4_ = breastRows[0];
                  --_loc4_.breastRating;
               }
               if(breastRows[0].breastRating < 0)
               {
                  breastRows[0].breastRating = 0;
               }
               if(_loc2_ == 1)
               {
                  outputText("[pg]你感觉身上的重担减轻了，并意识到你的乳房变小了！经过简单的测量，你确定它们现在是" + breastCup(0) + (breastRows[0].breastRating >= 1 ? "" : "") + "。");
               }
               if(_loc2_ == 2)
               {
                  outputText("[pg]你感觉轻盈了许多。低头一看，你发现你的乳房变小了很多！经过简单的测量，你确定它们现在是" + breastCup(0) + (breastRows[0].breastRating >= 1 ? "" : "") + "。");
               }
            }
         }
         else if(int(breastRows.length) > 1)
         {
            outputText("\n");
            _loc5_ = 0;
            _loc6_ = int(breastRows.length) - 1;
            while(_loc6_ >= 0)
            {
               _loc3_ = breastRows[_loc6_];
               if(_loc3_.breastRating >= 1)
               {
                  _loc3_.breastRating -= 1;
                  _loc5_++;
                  if(_loc6_ < int(breastRows.length) - 1)
                  {
                     outputText("……而且你");
                  }
                  else
                  {
                     outputText("你");
                  }
                  outputText("的" + breastDescript(_loc6_) + "缩小了，降到了" + breastCup(_loc6_) + (_loc3_.breastRating >= 1 ? "s" : "") + "。");
               }
               _loc3_.breastRating = Math.max(_loc3_.breastRating,0);
               _loc6_--;
            }
            switch(_loc5_)
            {
               case 0:
               case 1:
                  break;
               case 2:
                  outputText("\n变化之后，你感觉轻盈了许多。");
                  break;
               case 3:
                  outputText("\n没有了额外的重量，你感觉格外灵活。");
                  break;
               default:
                  outputText("\n感觉就像卸下了肩上的重担，或者在这个情况下，是胸前的重担。");
            }
         }
      }
      
      public function sheepScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 19)
         {
            _loc1_++;
         }
         if(horns.type == 9)
         {
            _loc1_++;
         }
         if(horns.type == 10)
         {
            _loc1_++;
         }
         if(tail.type == 27)
         {
            _loc1_++;
         }
         if(lowerBody.type == 21 && lowerBody.legCount == 2)
         {
            _loc1_++;
         }
         if(hair.type == 8)
         {
            _loc1_++;
         }
         if(hasWool())
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function sharkScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 4)
         {
            _loc1_++;
         }
         if(gills.type == 2)
         {
            _loc1_++;
         }
         if(rearBody.type == 3)
         {
            _loc1_++;
         }
         if(tail.type == 7)
         {
            _loc1_++;
         }
         if(hasPlainSkin() && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function set_weaponVerb(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 weaponVerb。");
         return param1;
      }
      
      override public function set_weaponValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 weaponValue。");
         return param1;
      }
      
      override public function set_weaponPerk(param1:Array) : Array
      {
         CoC_Settings.error("错误：试图直接设置 weaponPerk。");
         return param1;
      }
      
      override public function set_weaponName(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 weaponName。");
         return param1;
      }
      
      override public function set_weaponAttack(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 weaponAttack。");
         return param1;
      }
      
      override public function set_upperGarmentValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：尝试直接设置 upperGarmentValue。");
         return param1;
      }
      
      override public function set_upperGarmentPerk(param1:String) : String
      {
         CoC_Settings.error("错误：尝试直接设置 upperGarmentPerk。");
         return param1;
      }
      
      override public function set_upperGarmentName(param1:String) : String
      {
         CoC_Settings.error("错误：尝试直接设置 upperGarmentName。");
         return param1;
      }
      
      override public function set_tou(param1:Number) : Number
      {
         _tou = param1 - get_bonusTou();
         return param1;
      }
      
      override public function set_str(param1:Number) : Number
      {
         _str = param1 - get_bonusStr();
         return param1;
      }
      
      override public function set_spe(param1:Number) : Number
      {
         _spe = param1 - get_bonusSpe();
         return param1;
      }
      
      override public function set_shieldValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：尝试直接设置 shieldValue。");
         return param1;
      }
      
      override public function set_shieldPerk(param1:String) : String
      {
         CoC_Settings.error("错误：尝试直接设置 shieldPerk。");
         return param1;
      }
      
      override public function set_shieldName(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 shieldName。");
         return param1;
      }
      
      override public function set_shieldBlock(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 shieldBlock。");
         return param1;
      }
      
      public function set_modArmorName(param1:String) : String
      {
         if(param1 == null)
         {
            param1 = "";
         }
         return _modArmorName = param1;
      }
      
      override public function set_lowerGarmentValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：尝试直接设置 lowerGarmentValue。");
         return param1;
      }
      
      override public function set_lowerGarmentPerk(param1:String) : String
      {
         CoC_Settings.error("错误：尝试直接设置 lowerGarmentPerk。");
         return param1;
      }
      
      override public function set_lowerGarmentName(param1:String) : String
      {
         CoC_Settings.error("错误：尝试直接设置 lowerGarmentName。");
         return param1;
      }
      
      override public function set_jewelryValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 jewelryValue。");
         return param1;
      }
      
      override public function set_jewelryPerk(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 jewelryPerk。");
         return param1;
      }
      
      override public function set_jewelryName(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 jewelryName。");
         return param1;
      }
      
      override public function set_jewelryEffectMagnitude(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 jewelryEffectMagnitude。");
         return param1;
      }
      
      override public function set_jewelryEffectId(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 jewelryEffectId。");
         return param1;
      }
      
      override public function set_inte(param1:Number) : Number
      {
         _inte = param1 - get_bonusInte();
         return param1;
      }
      
      override public function set_armorValue(param1:Number) : Number
      {
         CoC_Settings.error("错误：尝试直接设置 armorValue。");
         return param1;
      }
      
      override public function set_armorPerk(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 armorPerk。");
         return param1;
      }
      
      override public function set_armorName(param1:String) : String
      {
         CoC_Settings.error("错误：试图直接设置 armorName。");
         return param1;
      }
      
      override public function set_armorDef(param1:Number) : Number
      {
         CoC_Settings.error("错误：试图直接设置 armorDef。");
         return param1;
      }
      
      public function setWeaponHiddenField(param1:Weapon) : void
      {
         _weapon = param1;
      }
      
      public function setWeapon(param1:Weapon) : Weapon
      {
         var _loc2_:Weapon = _weapon.playerRemove();
         if(_loc2_ != null)
         {
            removeBonusStats(_loc2_.bonusStats);
         }
         if(param1 != null)
         {
            addBonusStats(param1.bonusStats);
         }
         if(param1 == null)
         {
            CoC_Settings.error(get_short() + ".weapon被设为了null");
            param1 = getUnarmedWeapon();
         }
         _weapon = param1.playerEquip();
         return _loc2_;
      }
      
      public function setUpperUndergarmentHiddenField(param1:Undergarment) : void
      {
         setUndergarmentHiddenField(param1,0);
      }
      
      public function setUndergarmentHiddenField(param1:Undergarment, param2:int) : void
      {
         if(param2 == 0)
         {
            _upperGarment = param1;
         }
         else
         {
            _lowerGarment = param1;
         }
      }
      
      public function setUndergarment(param1:Undergarment, param2:int = -1) : Undergarment
      {
         if(param1 != null)
         {
            addBonusStats(param1.bonusStats);
         }
         var _loc3_:Undergarment = UndergarmentLib.NOTHING;
         if(param1.get_type() == 0 || param2 == 0)
         {
            _loc3_ = _upperGarment.playerRemove();
            if(_loc3_ != null)
            {
               removeBonusStats(_loc3_.bonusStats);
            }
            if(param1 == null)
            {
               CoC_Settings.error(get_short() + ".upperGarment is set to null");
               param1 = UndergarmentLib.NOTHING;
            }
            _upperGarment = param1.playerEquip();
         }
         else if(param1.get_type() == 1 || param2 == 1)
         {
            _loc3_ = _lowerGarment.playerRemove();
            if(_loc3_ != null)
            {
               removeBonusStats(_loc3_.bonusStats);
            }
            if(param1 == null)
            {
               CoC_Settings.error(get_short() + ".lowerGarment is set to null");
               param1 = UndergarmentLib.NOTHING;
            }
            _lowerGarment = param1.playerEquip();
         }
         return _loc3_;
      }
      
      public function setUnarmed() : Weapon
      {
         return setWeapon(getUnarmedWeapon());
      }
      
      public function setShieldHiddenField(param1:Shield) : void
      {
         _shield = param1;
      }
      
      public function setShield(param1:Shield) : Shield
      {
         var _loc2_:Shield = _shield.playerRemove();
         if(_loc2_ != null)
         {
            removeBonusStats(_loc2_.bonusStats);
         }
         if(param1 != null)
         {
            addBonusStats(param1.bonusStats);
         }
         if(param1 == null)
         {
            CoC_Settings.error(get_short() + ".shield被设为了null");
            param1 = ShieldLib.NOTHING;
         }
         _shield = param1.playerEquip();
         return _loc2_;
      }
      
      public function setLowerUndergarmentHiddenField(param1:Undergarment) : void
      {
         setUndergarmentHiddenField(param1,1);
      }
      
      public function setJewelryHiddenField(param1:Jewelry) : void
      {
         _jewelry = param1;
      }
      
      public function setJewelry(param1:Jewelry) : Jewelry
      {
         var _loc2_:Jewelry = _jewelry.playerRemove();
         if(_loc2_ != null)
         {
            removeBonusStats(_loc2_.bonusStats);
         }
         if(param1 != null)
         {
            addBonusStats(param1.bonusStats);
         }
         if(param1 == null)
         {
            CoC_Settings.error(get_short() + ".jewelry被设为了null");
            param1 = JewelryLib.NOTHING;
         }
         _jewelry = param1.playerEquip();
         return _loc2_;
      }
      
      public function setFurColor(param1:Either, param2:Object = undefined) : void
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc3_:String = null;
         switch(param1.index)
         {
            case 0:
               _loc5_ = param1.params[0];
               _loc6_ = _loc5_;
               _loc4_ = _loc6_[Utils.rand(int(_loc6_.length))];
               break;
            case 1:
               _loc5_ = param1.params[0];
               _loc6_ = _loc5_;
               _loc7_ = _loc6_[Utils.rand(int(_loc6_.length))];
               _loc3_ = _loc7_.under;
               _loc4_ = _loc7_.upper;
         }
         underBody.restore();
         skin.furColor = _loc4_;
         if(param2 != null)
         {
            copySkinToUnderBody();
         }
         if(_loc3_ != null)
         {
            underBody.skin.furColor = _loc3_;
         }
         if(param2 != null)
         {
            underBody.type = param2;
         }
      }
      
      public function setArmorHiddenField(param1:Armor) : void
      {
         _armor = param1;
      }
      
      public function setArmor(param1:Armor) : Armor
      {
         var _loc2_:Armor = _armor.playerRemove();
         if(_loc2_ != null)
         {
            removeBonusStats(_loc2_.bonusStats);
         }
         if(param1 != null)
         {
            addBonusStats(param1.bonusStats);
         }
         if(param1 == null)
         {
            CoC_Settings.error(get_short() + ".armor被设为了null");
            param1 = ArmorLib.NOTHING;
         }
         _armor = param1.playerEquip();
         return _loc2_;
      }
      
      public function seenTimeMagic() : Boolean
      {
         if(get_game().bog.bogTemple.saveContent.shieldTaken)
         {
            return get_game().bog.bogTemple.saveContent.shieldTaken;
         }
         return hasKeyItem("Old Eldritch Tome");
      }
      
      public function satyrScore() : Number
      {
         var _loc1_:Number = 0;
         if(lowerBody.type == 21)
         {
            _loc1_++;
         }
         if(tail.type == 21)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2)
         {
            if(ears.type == 4)
            {
               _loc1_++;
            }
            if(face.type == 0)
            {
               _loc1_++;
            }
            if(countCocksOfType(CockTypesEnum.HUMAN) > 0)
            {
               _loc1_++;
            }
            if(balls > 0 && ballSize >= 3)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function sandTrapScore() : int
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.BlackNipples))
         {
            _loc1_++;
         }
         if(hasStatusEffect(StatusEffects.Uniball))
         {
            _loc1_++;
         }
         if(hasVagina() && vaginaType() == 5)
         {
            _loc1_++;
         }
         if(eyes.type == 2)
         {
            _loc1_++;
         }
         if(wings.type == 12)
         {
            _loc1_++;
         }
         if(hasStatusEffect(StatusEffects.Uniball))
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function salamanderScore() : Number
      {
         var _loc1_:Number = 0;
         if(arms.type == 5)
         {
            _loc1_++;
         }
         if(lowerBody.type == 25)
         {
            _loc1_++;
         }
         if(tail.type == 25)
         {
            _loc1_++;
         }
         if(hasPerk(PerkLib.Lustserker))
         {
            _loc1_++;
         }
         if(_loc1_ >= 2)
         {
            if(countCocksOfType(CockTypesEnum.LIZARD) > 0)
            {
               _loc1_++;
            }
            if(face.type == 0)
            {
               _loc1_++;
            }
            if(ears.type == 0)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function roomInExistingStack(param1:ItemType) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < int(itemSlots.length))
         {
            if(itemSlot(_loc2_).itype == param1 && itemSlot(_loc2_).quantity != 0 && itemSlot(_loc2_).quantity < param1.getMaxStackSize())
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function rhinoScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 15)
         {
            _loc1_++;
         }
         if(tail.type == 22)
         {
            _loc1_++;
         }
         if(face.type == 21)
         {
            _loc1_++;
         }
         if(horns.type == 8)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && skin.tone == "gray")
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && hasCock() && countCocksOfType(CockTypesEnum.RHINO) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function requiredXP(param1:int = -1) : int
      {
         if(param1 < 0)
         {
            param1 = int(level);
         }
         var _loc2_:int = param1 * 100;
         if(_loc2_ > 9999)
         {
            _loc2_ = 9999;
         }
         return _loc2_;
      }
      
      override public function regeneration(param1:Boolean = true, param2:Boolean = true) : Object
      {
         var _loc4_:Number = NaN;
         var _loc3_:* = super.regeneration(param1,false);
         if(get_armor() == get_game().armors.GOOARMR)
         {
            _loc4_ = (get_game().valeria.valeriaFluidsEnabled() ? (FlagDict_Impl_.arrayReadInt(get_flags(),2200) < 50 ? FlagDict_Impl_.arrayReadInt(get_flags(),2200) / 25 : 2) : 2) * (param1 ? 1 : 2);
            _loc3_.percent = Utils.boundFloat(0 - Number(_loc3_.max),Number(_loc3_.percent) + _loc4_,Number(_loc3_.max));
         }
         if(hunger < 25 && get_game().get_survival())
         {
            _loc3_.percent = Math.min(0,Number(_loc3_.percent));
            _loc3_.bonus = Math.min(0,Number(_loc3_.bonus));
         }
         if(param2)
         {
            HPChange(Math.round(maxHP() * Number(_loc3_.percent) / 100) + Number(_loc3_.bonus),false);
         }
         return _loc3_;
      }
      
      public function refillHunger(param1:Number = 0, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         if(hasPerk(PerkLib.DemonBiology) && param3)
         {
            param1 = 0;
         }
         if(get_game().get_survival())
         {
            _loc4_ = hunger;
            _loc5_ = 0;
            if((hunger = hunger + param1) > maxHunger())
            {
               while(hunger > 110)
               {
                  _loc5_++;
                  hunger -= 10;
               }
               modThickness(100,_loc5_);
               hunger = maxHunger();
            }
            if(hunger > _loc4_)
            {
               get_game().mainView.statsView.showStatUp("hunger");
            }
            if(param2)
            {
               outputText("\n");
            }
            if(hunger < 10)
            {
               outputText("<b>你还需要吃更多东西。</b>");
            }
            else if(hunger >= 10 && hunger < 25)
            {
               outputText("<b>你不再挨饿了，但你还需要吃更多东西。</b>");
            }
            else if(hunger >= 25 && get_hunger100() < 50)
            {
               outputText("<b>你肚子里的咕噜声似乎安静了下来。</b>");
            }
            else if(get_hunger100() >= 50 && get_hunger100() < 75)
            {
               outputText("<b>你的肚子不再咕咕叫了。</b>");
            }
            else if(get_hunger100() >= 75 && get_hunger100() < 90)
            {
               outputText("<b>你感到非常满足。</b>");
            }
            else if(get_hunger100() >= 90)
            {
               outputText("<b>你的肚子感觉好撑。</b>");
            }
            if(_loc5_ > 0)
            {
               outputText("<b>你感觉自己好像长胖了一些。</b>");
            }
            get_game().awardAchievement("尝起来像鸡肉",100);
            if(_loc4_ < 1 && hunger >= 100)
            {
               get_game().awardAchievement("勇者急需食物",101);
            }
            if(_loc4_ >= 90)
            {
               get_game().awardAchievement("贪食者",103);
            }
            if(hunger > _loc4_)
            {
               get_game().mainView.statsView.showStatUp("hunger");
            }
            if(int([DynStat.Lust(0),DynStat.NoScale].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17]);
            }
            else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.Lust(0),DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18],[DynStat.Lust(0),DynStat.NoScale][19]);
            }
            get_game().output.statScreenRefresh();
         }
      }
      
      public function redundantRaceGender() : Boolean
      {
         return new EReg("\\b(?:girl|boy|man|woman|mer(?:maid|man|folk))\\b","").match(get_race());
      }
      
      public function redundantRaceAge() : Boolean
      {
         return new EReg("(?:kitten|puppy)","").match(get_race());
      }
      
      override public function reduceDamage(param1:Number, param2:Creature, param3:Number = 0, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false) : int
      {
         return int(int(super.reduceDamage(param1,param2,param3,param4,param5,param6,param7,param8)) * getDifficultyDamageModifier());
      }
      
      public function redPandaScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 22)
         {
            _loc1_++;
         }
         if(tail.type == 30)
         {
            _loc1_++;
         }
         if(arms.type == 8)
         {
            _loc1_++;
         }
         if(face.type == 27)
         {
            _loc1_ += 2;
         }
         if(lowerBody.type == 29)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2)
         {
            if(hasFur())
            {
               _loc1_++;
            }
            if(hasFurryUnderBody())
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function rearm() : Boolean
      {
         var _loc1_:* = null as DataStore;
         if(isDisarmed() && isUnarmed())
         {
            _loc1_ = statusEffectByType(StatusEffects.Disarmed).dataStore;
            setWeapon(ItemType.lookupItem(_loc1_.weaponID));
            if(isUnarmed())
            {
               return false;
            }
            removeStatusEffect(StatusEffects.Disarmed);
            return true;
         }
         return false;
      }
      
      public function rapierTrainingBoost() : int
      {
         var _loc1_:Array = [0,2,4,5,6];
         return int(_loc1_[get_rapierTraining()]);
      }
      
      public function raccoonScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 13)
         {
            _loc1_++;
         }
         if(face.type == 14)
         {
            _loc1_ += 2;
         }
         if(ears.type == 11)
         {
            _loc1_++;
         }
         if(tail.type == 15)
         {
            _loc1_++;
         }
         if(lowerBody.type == 19)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && balls > 0)
         {
            _loc1_++;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function pregnancyUpdate() : Boolean
      {
         return PregnancyProgression.updatePregnancy(this);
      }
      
      public function potentialLevel() : int
      {
         var _loc1_:int = int(level);
         var _loc2_:int = int(XP);
         while(_loc2_ >= requiredXP(_loc1_))
         {
            _loc2_ -= requiredXP(_loc1_);
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function playerResistSex(param1:int, param2:int = 0) : Boolean
      {
         var _loc6_:* = null as CoCButton;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:Array = get_game().mainView.bottomButtons.slice(0,14);
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            if(_loc6_.enabled && _loc6_.visible)
            {
               _loc3_.push(_loc6_);
            }
         }
         var _loc7_:Boolean = int(_loc3_.length) > 0;
         if(!_loc7_)
         {
            Log.trace("Menu has no buttons.",{
               "fileName":"src/classes/Player.hx",
               "lineNumber":4548,
               "className":"classes.Player",
               "methodName":"playerResistSex"
            });
         }
         else
         {
            Log.trace("menu has buttons.",{
               "fileName":"src/classes/Player.hx",
               "lineNumber":4550,
               "className":"classes.Player",
               "methodName":"playerResistSex"
            });
         }
         if(!get_game().get_modeSettings().temptation || get_lust() < 33 || !_loc7_)
         {
            return true;
         }
         var _loc8_:Number = 10;
         var _loc9_:Number = sexOrientation / 100;
         var _loc10_:Number = (100 - sexOrientation) / 100;
         _loc8_ += (lib + cor) * 0.25 * get_lust() / maxLust();
         _loc8_ += param2;
         if(hasPerk(PerkLib.ImprovedSelfControl))
         {
            _loc8_ *= 0.9;
         }
         if(hasPerk(PerkLib.CorruptedLibido))
         {
            _loc8_ *= 0.9;
         }
         if(param1 == 2)
         {
            _loc8_ *= _loc10_;
         }
         if(param1 == 1)
         {
            _loc8_ *= _loc9_;
         }
         return !Utils.randomChance(Math.round(_loc8_));
      }
      
      public function pigScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 14)
         {
            _loc1_++;
         }
         if(tail.type == 19)
         {
            _loc1_++;
         }
         if([19,20].indexOf(face.type) != -1)
         {
            _loc1_++;
         }
         if(lowerBody.type == 21)
         {
            _loc1_ += 2;
         }
         if(countCocksOfType(CockTypesEnum.PIG) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function outputText(param1:String) : void
      {
         get_game().outputText(param1);
      }
      
      public function nagaScore() : Number
      {
         var _loc1_:Number = 0;
         if(lowerBody.type == 3)
         {
            _loc1_ += 2;
         }
         if(face.type == 5)
         {
            _loc1_++;
         }
         if(tongue.type == 1)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && antennae.type == 0)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && wings.type == 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function mutantScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type != 0)
         {
            _loc1_++;
         }
         if(tail.type != 0)
         {
            _loc1_++;
         }
         if(int(cocks.length) > 1)
         {
            _loc1_++;
         }
         if(hasCock() && hasVagina())
         {
            _loc1_++;
         }
         if(hasFuckableNipples())
         {
            _loc1_++;
         }
         if(int(breastRows.length) > 1)
         {
            _loc1_++;
         }
         if(_loc1_ > 1 && hasPlainSkin())
         {
            _loc1_++;
         }
         if(face.type == 1)
         {
            if(hasFur())
            {
               _loc1_--;
            }
            if(tail.type == 1)
            {
               _loc1_--;
            }
         }
         if(face.type == 2)
         {
            if(hasFur())
            {
               _loc1_--;
            }
            if(tail.type == 2)
            {
               _loc1_--;
            }
         }
         return _loc1_;
      }
      
      public function mouseScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 12)
         {
            _loc1_++;
         }
         if(tail.type == 16)
         {
            _loc1_++;
         }
         if(face.type == 15)
         {
            _loc1_++;
         }
         if(face.type == 16)
         {
            _loc1_ += 2;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(get_tallness() < 55 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(get_tallness() < 45 && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function modStats(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean, param10:Boolean) : void
      {
         var _gthis:Player = this;
         var applyMulti:Function = function(param1:Number, param2:String, param3:String, param4:Boolean = false):Number
         {
            if(param1 > 0)
            {
               param1 *= _gthis.getBonusStatMultiplicative(param2);
               if(param4)
               {
                  param1 *= _gthis.getBonusStatMultiplicative("属性增益");
               }
            }
            if(param1 < 0)
            {
               param1 *= _gthis.getBonusStatMultiplicative(param3);
               if(param4)
               {
                  param1 *= _gthis.getBonusStatMultiplicative("属性减少");
               }
            }
            return param1;
         };
         var _loc11_:StatStore = get_game().oldStats;
         if(_loc11_.str == 0)
         {
            _loc11_.str = get_str();
            _loc11_.tou = get_tou();
            _loc11_.spe = get_spe();
            _loc11_.inte = get_inte();
            _loc11_.lib = lib;
            _loc11_.sens = sens;
            _loc11_.cor = cor;
            _loc11_.hp = get_HP();
            _loc11_.lust = get_lust();
            _loc11_.fatigue = get_fatigue();
            _loc11_.hunger = hunger;
         }
         if(param9)
         {
            if(get_game().get_easyMode() && param7 > 0 && param9)
            {
               param7 /= 2;
            }
            if(param9)
            {
               param7 *= 1 + newGamePlusMod() * 0.2;
            }
            if(param7 > 0 && param9)
            {
               param7 *= lustPercent() / 100;
            }
            if(sens > 50 && param6 > 0)
            {
               param6 /= 2;
            }
            if(sens > 75 && param6 > 0)
            {
               param6 /= 2;
            }
            if(sens > 90 && param6 > 0)
            {
               param6 /= 2;
            }
            if(sens > 50 && param6 < 0)
            {
               param6 *= 2;
            }
            if(sens > 75 && param6 < 0)
            {
               param6 *= 2;
            }
            if(sens > 90 && param6 < 0)
            {
               param6 *= 2;
            }
            param1 = Number(applyMulti(param1,"力量增益","力量减少",true));
            param2 = Number(applyMulti(param2,"体质增益","体质损失",true));
            param3 = Number(applyMulti(param3,"速度增益","速度损失",true));
            param4 = Number(applyMulti(param4,"智力增益","智力损失",true));
            param5 = Number(applyMulti(param5,"性欲增加","性欲损失"));
            param6 = Number(applyMulti(param6,"敏感度增加","敏感度损失"));
            param8 = Number(applyMulti(param8,"腐化增加","腐化降低"));
         }
         super.modStats(param1,param2,param3,param4,param5,param6,param7,param8,false,param10);
         get_game().output.showUpDown();
         get_game().output.statScreenRefresh();
      }
      
      public function modCumMultiplier(param1:Number) : Number
      {
         if(param1 == 0)
         {
            return param1;
         }
         if(param1 > 0)
         {
            if(hasPerk(PerkLib.MessyOrgasms))
            {
               param1 *= 1.5;
            }
         }
         else if(param1 < 0)
         {
            if(hasPerk(PerkLib.MessyOrgasms))
            {
               param1 *= 0.5;
            }
         }
         cumMultiplier += param1;
         return param1;
      }
      
      public function minotaurNeed() : Boolean
      {
         if(get_game().get_addictionEnabled() && !hasPerk(PerkLib.MinotaurCumResistance))
         {
            return FlagDict_Impl_.arrayReadInt(get_flags(),20) > 1;
         }
         return false;
      }
      
      public function minotaurAddicted() : Boolean
      {
         if(get_game().get_addictionEnabled() && !hasPerk(PerkLib.MinotaurCumResistance))
         {
            if(!hasPerk(PerkLib.MinotaurCumAddict))
            {
               return FlagDict_Impl_.arrayReadInt(get_flags(),20) >= 1;
            }
            return true;
         }
         return false;
      }
      
      public function minoScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 3)
         {
            _loc1_++;
         }
         if(ears.type == 3)
         {
            _loc1_++;
         }
         if(tail.type == 4)
         {
            _loc1_++;
         }
         if(horns.type == 2)
         {
            _loc1_++;
         }
         if(lowerBody.type == 1 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(get_tallness() > 80 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(cocks.length) > 0 && _loc1_ > 0)
         {
            if(countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               _loc1_++;
            }
         }
         if(int(vaginas.length) > 0)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function minoCumAddiction(param1:Number = 10) : void
      {
         var _loc2_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc2_,340,FlagDict_Impl_.arrayReadInt(_loc2_,340) + 1);
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) < 0)
         {
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,0);
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),20) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(get_flags(),20,0);
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) > 120)
         {
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,120);
         }
         FlagDict_Impl_.arrayWriteInt(get_flags(),19,0);
         if(!get_game().get_addictionEnabled())
         {
            FlagDict_Impl_.arrayWriteInt(get_flags(),20,0);
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,0);
            return;
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) >= 60 && param1 > 0)
         {
            param1 /= 2;
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) >= 80 && param1 > 0)
         {
            param1 /= 2;
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) >= 90 && param1 > 0)
         {
            param1 /= 2;
         }
         if(hasPerk(PerkLib.MinotaurCumResistance))
         {
            param1 *= 0;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),20) == 3 && param1 > 0)
         {
            param1 += 10;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),20) == 2 && param1 > 0)
         {
            param1 += 5;
         }
         param1 = Math.round(param1 * 100) / 100;
         if(param1 > 50)
         {
            param1 = 50;
         }
         if(param1 < -50)
         {
            param1 = -50;
         }
         _loc2_ = get_flags();
         FlagDict_Impl_.arrayWriteFloat(_loc2_,18,FlagDict_Impl_.arrayReadFloat(_loc2_,18) + param1);
         if(hasPerk(PerkLib.MinotaurCumResistance))
         {
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,0);
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) > 120)
         {
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,120);
         }
         if(FlagDict_Impl_.arrayReadFloat(get_flags(),18) < 0)
         {
            FlagDict_Impl_.arrayWriteFloat(get_flags(),18,0);
         }
      }
      
      public function minLustSoftCap(param1:Number) : Number
      {
         var _loc2_:Number = 0;
         while(param1 > 20)
         {
            param1 -= 20;
            _loc2_ += 20;
            param1 *= 0.9;
         }
         return _loc2_ + param1;
      }
      
      override public function minLust() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = maxLust();
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         _loc1_ += getBonusStat("最低欲望");
         _loc4_ += countBonusStat("最低欲望");
         if(eggs() >= 20)
         {
            _loc1_ += 10;
            _loc4_++;
         }
         if(eggs() >= 40)
         {
            _loc1_ += 10;
            _loc4_++;
         }
         if(hasStatusEffect(StatusEffects.AnemoneArousal))
         {
            _loc1_ += 30;
            _loc4_++;
         }
         if(hasStatusEffect(StatusEffects.ParasiteSlug))
         {
            _loc1_ += 10;
            _loc4_++;
         }
         if(hasStatusEffect(StatusEffects.ParasiteEelNeedCum))
         {
            _loc1_ += 5 * statusEffectv3(StatusEffects.ParasiteEelNeedCum);
            _loc4_++;
         }
         if(hasStatusEffect(StatusEffects.ParasiteNephilaNeedCum))
         {
            _loc1_ += 5 * statusEffectv3(StatusEffects.ParasiteNephilaNeedCum);
            _loc4_++;
         }
         if(hasStatusEffect(StatusEffects.BimboChampagne) || hasPerk(PerkLib.BimboBody) || hasPerk(PerkLib.BroBody) || hasPerk(PerkLib.FutaForm))
         {
            _loc1_ += 40;
            _loc4_++;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),517) <= -168 && FlagDict_Impl_.arrayReadFloat(get_flags(),711) != 0.75)
         {
            _loc1_ += 20;
            _loc4_++;
            if(FlagDict_Impl_.arrayReadInt(get_flags(),517) <= -216)
            {
               _loc1_ += 30;
               _loc4_++;
            }
         }
         if(get_armorName() == "lusty maiden\'s armor")
         {
            _loc3_ = Math.max(_loc3_,30);
         }
         if(get_armorName() == "tentacled bark armor")
         {
            _loc3_ = Math.max(_loc3_,20);
         }
         if(hasStatusEffect(StatusEffects.Luststick))
         {
            _loc3_ = Math.max(_loc3_,50);
         }
         if(hasStatusEffect(StatusEffects.Infested))
         {
            _loc3_ = Math.max(_loc3_,50);
         }
         if(hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            _loc3_ = Math.max(_loc3_,80);
         }
         if(hasPerk(PerkLib.ParasiteMusk))
         {
            _loc3_ = Math.max(_loc3_,50);
         }
         if(_loc4_ > 1)
         {
            _loc1_ = minLustSoftCap(_loc1_);
         }
         if(hasPerk(PerkLib.ColdBlooded))
         {
            if(_loc1_ > 20)
            {
               _loc1_ -= Math.min(20,_loc1_ - 20);
            }
            _loc2_ -= 20;
         }
         return Utils.boundInt(int(_loc3_),int(Math.round(_loc1_)),int(_loc2_));
      }
      
      override public function minLib() : int
      {
         var _loc1_:Number = 15;
         if(get_gender() == 0)
         {
            _loc1_ -= 5;
         }
         if(get_armorName() == "lusty maiden\'s armor")
         {
            if(_loc1_ < 50)
            {
               _loc1_ = 50;
            }
         }
         if(_loc1_ < minLust() * 2 / 3)
         {
            _loc1_ = minLust() * 2 / 3;
         }
         _loc1_ += getBonusStat("最低性欲");
         _loc1_ *= getBonusStatMultiplicative("最低性欲");
         return int(Math.max(0,_loc1_));
      }
      
      override public function mf(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2723) == 1)
         {
            return param1;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2723) == 2)
         {
            return param2;
         }
         return super.mf(param1,param2);
      }
      
      public function mermaidScore() : Number
      {
         var _loc1_:Number = 0;
         if(lowerBody.type == 32)
         {
            _loc1_ += 2;
         }
         if(gills.type == 3)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && antennae.type == 0)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && wings.type == 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function lowMedHighCum(param1:String, param2:String, param3:String, param4:Number = 100, param5:Number = 500) : String
      {
         if(cumQ() <= param4)
         {
            return param1;
         }
         if(cumQ() > param4 && cumQ() <= param5)
         {
            return param2;
         }
         if(cumQ() > param5)
         {
            return param3;
         }
         return "这不可能。这是一个bug！";
      }
      
      public function lowMedHighCor(param1:String, param2:String, param3:String) : String
      {
         if(cor <= 30)
         {
            return param1;
         }
         if(cor > 30 && cor <= 60)
         {
            return param2;
         }
         if(cor > 60)
         {
            return param3;
         }
         return param1;
      }
      
      public function lizardScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 7)
         {
            _loc1_++;
         }
         if(ears.type == 6)
         {
            _loc1_++;
         }
         if(tail.type == 9)
         {
            _loc1_++;
         }
         if(lowerBody.type == 10)
         {
            _loc1_++;
         }
         if(hasDragonHorns())
         {
            _loc1_++;
         }
         if(hasDragonHorns(true))
         {
            _loc1_++;
         }
         if(arms.type == 14)
         {
            _loc1_++;
         }
         if(_loc1_ > 2)
         {
            if([5,1].indexOf(tongue.type) != -1)
            {
               _loc1_++;
            }
            if(lizardCocks() > 0)
            {
               _loc1_++;
            }
            if([3,5].indexOf(eyes.type) != -1)
            {
               _loc1_++;
            }
            if(hasReptileScales())
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function lengthChange(param1:Number, param2:Number) : void
      {
         if(param1 < 0 && get_game().get_hyper())
         {
            return;
         }
         if(param1 <= 1 && param1 > 0)
         {
            if(int(cocks.length) == 1)
            {
               outputText("你的" + cockDescript(0) + "稍微变长了一点。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == 1)
               {
                  outputText("你的一根" + multiCockDescriptLight() + "稍微变长了一点。");
               }
               if(param2 > 1 && param2 < int(cocks.length))
               {
                  outputText("你的一些" + multiCockDescriptLight() + "稍微变长了一点。");
               }
               if(param2 == int(cocks.length))
               {
                  outputText("你的" + multiCockDescriptLight() + "似乎充血膨胀了……变得稍微大了一点。");
               }
            }
         }
         if(param1 > 1 && param1 < 3)
         {
            if(int(cocks.length) == 1)
            {
               outputText("一种非常愉悦的感觉从你的腹股沟蔓延开来，你的" + cockDescript(0) + "永久性地变长了——至少有一英寸——并且因为这种变化的快感而漏出了些许清液。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == int(cocks.length))
               {
                  outputText("一股非常愉悦的感觉从你的腹股沟蔓延开来，你的" + multiCockDescriptLight() + "永久性地变长了——至少一英寸——并因为这种变化的快感而渗出了大量的先兆精液。");
               }
               if(param2 == 1)
               {
                  outputText("一股非常愉悦的感觉从你的腹股沟蔓延开来，你的" + multiCockDescriptLight() + "中的一根永久性地变长了，至少一英寸，并因为这种变化的快感而渗出了大量的先兆精液。");
               }
               if(param2 > 1 && param2 < int(cocks.length))
               {
                  outputText("一股非常愉悦的感觉从你的腹股沟蔓延开来，你的" + multiCockDescriptLight() + "中的" + Utils.num2Text(param2) + "根永久性地变长了，至少一英寸，并因为这种变化的快感而渗出了大量的先兆精液。");
               }
            }
         }
         if(param1 >= 3)
         {
            if(int(cocks.length) == 1)
            {
               outputText("你的" + cockDescript(0) + "感觉紧绷得难以置信，似乎有几英寸的长度从你的胯部涌出。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == 1)
               {
                  outputText("你的" + multiCockDescriptLight() + "感觉紧绷得难以置信，因为其中一根开始一英寸一英寸地变长。");
               }
               if(param2 > 1 && param2 < int(cocks.length))
               {
                  outputText("当其中的" + Utils.num2Text(param2) + "根开始一寸寸地变长时，你的" + multiCockDescriptLight() + "感到异常紧绷。");
               }
               if(param2 == int(cocks.length))
               {
                  outputText("当一寸又一寸的长度从你的腹股沟中挤出时，你的" + multiCockDescriptLight() + "感到异常紧绷。");
               }
            }
         }
         if(param1 > 0)
         {
            if(cocks[0].cockLength >= 8 && cocks[0].cockLength - param1 < 8)
            {
               if(int(cocks.length) == 1)
               {
                  outputText("<b>大多数男人都会为你这么长的家伙感到无比自豪。</b>");
               }
               if(int(cocks.length) > 1)
               {
                  outputText("<b>大多数男人只要有一根像你这么长的肉棒就会感到无比自豪了，更别说" + multiCockDescript() + "了。</b>");
               }
            }
            if(cocks[0].cockLength >= 12 && cocks[0].cockLength - param1 < 12)
            {
               if(int(cocks.length) == 1)
               {
                  outputText("<b>你的" + cockDescript(0) + "太长了，完全伸展时几乎能垂到你的膝盖。</b>");
               }
               if(int(cocks.length) > 1)
               {
                  outputText("<b>你的" + multiCockDescriptLight() + "太长了，完全勃起时几乎能垂到你的膝盖。</b>");
               }
            }
            if(cocks[0].cockLength >= 16 && cocks[0].cockLength - param1 < 16)
            {
               if(int(cocks.length) == 1)
               {
                  outputText("<b>你的" + cockDescript(0) + "长在一匹大马上都比长在你身上合适。</b>");
               }
               if(int(cocks.length) > 1)
               {
                  outputText("<b>你的" + multiCockDescriptLight() + "长在一匹大马上都比长在你身上合适。</b>");
               }
               if(biggestTitSize() >= 3)
               {
                  if(int(cocks.length) == 1)
                  {
                     outputText("你可以轻松地把你的" + cockDescript(0) + "塞进双乳之间，给自己来一次终生难忘的乳交。");
                  }
                  if(int(cocks.length) > 1)
                  {
                     outputText("它们长得都能碰到你的胸部了，你可以轻松地把几根肉棒塞进双乳之间，给自己来一次终生难忘的乳交。");
                  }
               }
               else
               {
                  if(int(cocks.length) == 1)
                  {
                     outputText("你的" + cockDescript(0) + "长得可以轻松够到你的胸口。现在给自己口交已经是板上钉钉的事了。");
                  }
                  if(int(cocks.length) > 1)
                  {
                     outputText("你的" + multiCockDescriptLight() + "长得可以轻松够到你的胸口。给自己口交简直就像低头一样简单。");
                  }
               }
            }
            if(cocks[0].cockLength >= 20 && cocks[0].cockLength - param1 < 20)
            {
               if(int(cocks.length) == 1)
               {
                  outputText("<b>仿佛你的" + cockDescript(0) + "那跳动的热度还不够似的，每次你勃起时，你的" + cockDescript(0) + "的顶端都会一直戳进你的视线中。</b>");
               }
               if(int(cocks.length) > 1)
               {
                  outputText("<b>仿佛你的" + multiCockDescriptLight() + "那跳动的热度还不够糟糕似的，每次你勃起时，你的" + multiCockDescriptLight() + "的顶端都会在你面前晃动，遮挡住你下半部分的视线。</b>");
               }
               if(cor > 40 && cor <= 60)
               {
                  if(int(cocks.length) > 1)
                  {
                     outputText("你想知道外面是否有什么恶魔或野兽能够吞下你其中一根" + multiCockDescriptLight() + "的全部长度？");
                  }
                  if(int(cocks.length) == 1)
                  {
                     outputText("你寻思着外面是否有什么恶魔或野兽能承受你这完整的长度。");
                  }
               }
               if(cor > 60 && cor <= 80)
               {
                  if(int(cocks.length) > 1)
                  {
                     outputText("你幻想着被一只巨大的触手怪袭击，它的触手将你的" + multiCockDescriptLight() + "吞没至根部，把你榨干。[pg]你对这个愉快的想法露出了微笑。");
                  }
                  if(int(cocks.length) == 1)
                  {
                     outputText("你幻想着被一只巨大的触手怪袭击，它的触手将你的" + cockDescript(0) + "吞没至根部，榨干你所有的精液。[pg]你对这个愉快的想法露出了微笑。");
                  }
               }
               if(cor > 80)
               {
                  if(int(cocks.length) > 1)
                  {
                     outputText("你发现自己幻想着在一年后，用你的" + multiCockDescriptLight() + "刺穿那些年轻性感的勇者们。");
                  }
               }
            }
         }
         if(param1 < 0 && param1 >= -1)
         {
            if(int(cocks.length) == 1)
            {
               outputText("你的" + multiCockDescriptLight() + "缩短了一点点。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == int(cocks.length))
               {
                  outputText("你的" + multiCockDescriptLight() + "缩短了一点。");
               }
               if(param2 > 1 && param2 < int(cocks.length))
               {
                  outputText("你感觉你的" + multiCockDescriptLight() + "中有" + Utils.num2Text(param2) + "根缩短了一点。");
               }
               if(param2 == 1)
               {
                  outputText("你感觉你的" + multiCockDescriptLight() + "中有" + Utils.num2Text(param2) + "根缩短了一点。");
               }
            }
         }
         if(param1 < -1 && param1 > -3)
         {
            if(int(cocks.length) == 1)
            {
               outputText("你的" + multiCockDescriptLight() + "变小了，部分血肉缩回了腹股沟。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == int(cocks.length))
               {
                  outputText("你的" + multiCockDescriptLight() + "变小了，部分血肉缩回了腹股沟。");
               }
               if(param2 == 1)
               {
                  outputText("你感觉到你的" + multiCockDescriptLight() + "中有" + Utils.num2Text(param2) + "根正在缩小，肉体缩回了你的腹股沟。");
               }
               if(param2 > 1 && param2 < int(cocks.length))
               {
                  outputText("你感觉到你的" + multiCockDescriptLight() + "中有" + Utils.num2Text(param2) + "根正在缩小，肉体缩回了你的腹股沟。");
               }
            }
         }
         if(param1 <= -3)
         {
            if(int(cocks.length) == 1)
            {
               outputText("你的" + multiCockDescriptLight() + "有很大一部分长度缩短并消失了。");
            }
            if(int(cocks.length) > 1)
            {
               if(param2 == int(cocks.length))
               {
                  outputText("你的" + multiCockDescriptLight() + "有很大一部分向腹股沟缩回，长度迅速变短。");
               }
               if(param2 == 1)
               {
                  outputText("你的" + multiCockDescriptLight() + "中有一根缩回了腹股沟，长度迅速变短。");
               }
               if(param2 > 1 && int(cocks.length) > param2)
               {
                  outputText("你的" + multiCockDescriptLight() + "感到一阵刺痛，" + Utils.num2Text(param2) + "根阴茎缩回了你的腹股沟，长度迅速变短。");
               }
            }
         }
      }
      
      public function lactationQ() : Number
      {
         if(biggestLactation() < 1)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         if(!hasStatusEffect(StatusEffects.LactationEndurance))
         {
            createStatusEffect(StatusEffects.LactationEndurance,1,0,0,0);
         }
         var _loc2_:int = int(breastRows.length);
         while(_loc2_ > 0)
         {
            _loc2_--;
            _loc1_ += 10 * Utils.boundFloat(1,breastRows[_loc2_].breastRating,1.79e+308) * breastRows[_loc2_].lactationMultiplier * breastRows[_loc2_].breasts * statusEffectv1(StatusEffects.LactationEndurance);
         }
         if(hasPerk(PerkLib.MilkMaid))
         {
            _loc1_ += 200 + perkv1(PerkLib.MilkMaid) * 100;
         }
         if(statusEffectv1(StatusEffects.LactationReduction) >= 48)
         {
            _loc1_ *= 1.5;
         }
         if(_loc1_ > 2147483647)
         {
            _loc1_ = 2147483647;
         }
         return _loc1_;
      }
      
      override public function knockUp(param1:int = 0, param2:int = 0, param3:int = 100, param4:int = 0, param5:Boolean = false) : void
      {
         if(updateInfestations(param1))
         {
            return;
         }
         super.knockUp(param1,param2,param3,param4,param5);
      }
      
      public function kitsuneScore() : Number
      {
         var _loc1_:int = 0;
         if(ears.type == 9)
         {
            _loc1_++;
         }
         if(tail.type == 13)
         {
            _loc1_++;
         }
         if(tail.type == 13 && tail.venom >= 2)
         {
            _loc1_ += 2;
         }
         if(vaginalCapacity() >= 8000)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && (face.type == 0 || face.type == 11))
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && (ColorLists.BASIC_KITSUNE_HAIR.contains(get_hairOrFurColors()) || Boolean(ColorLists.ELDER_KITSUNE.contains(get_hairOrFurColors()))))
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && get_femininity() >= 40)
         {
            _loc1_++;
         }
         if(hasFur() && !Boolean(ColorLists.BASIC_KITSUNE_OUTER_FUR.contains(get_hairOrFurColors())) && !Boolean(ColorLists.ELDER_KITSUNE.contains(get_hairOrFurColors())))
         {
            _loc1_--;
         }
         if(hasScales())
         {
            _loc1_ -= 2;
         }
         if(hasGooSkin())
         {
            _loc1_ -= 3;
         }
         if(lowerBody.type != 0 && lowerBody.type != 17)
         {
            _loc1_--;
         }
         if(face.type != 0 && face.type != 11)
         {
            _loc1_--;
         }
         if(ears.type != 9)
         {
            _loc1_--;
         }
         if(tail.type != 13)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public function killCocks(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 0)
         {
            param1 = int(cocks.length);
         }
         while(param1 > 0)
         {
            _loc3_ = int(cocks.length);
            while(_loc3_ > 0)
            {
               _loc3_--;
               if(_loc4_ > int(cocks.length) - 1)
               {
                  _loc4_ = 0;
               }
               if(cocks[_loc3_].cockLength <= cocks[_loc4_].cockLength)
               {
                  _loc4_ = _loc3_;
               }
            }
            removeCock(_loc4_,1);
            _loc2_++;
            param1--;
            if(int(cocks.length) == 0)
            {
               param1 = 0;
            }
         }
         if(_loc2_ == 1)
         {
            if(int(cocks.length) == 0)
            {
               outputText("<b>你的男子气概缩回了体内，完全消失了。</b>");
               if(hasStatusEffect(StatusEffects.Infested))
               {
                  outputText("就像逃离沉船的老鼠一样，一股虫子从你萎缩的肉棒中喷射而出，滑行着逃走了。");
               }
            }
            if(int(cocks.length) == 1)
            {
               outputText("<b>你最小的阴茎消失了，缩回了你的体内，只留下一根" + cockDescript(0) + "。</b>");
            }
            if(int(cocks.length) > 1)
            {
               outputText("<b>你最小的阴茎永远消失了，只留下你的" + multiCockDescriptLight() + "。</b>");
            }
         }
         if(_loc2_ > 1)
         {
            if(int(cocks.length) == 0)
            {
               outputText("<b>你所有的男性器官越来越小，一个接一个地消失了。</b>");
               if(hasStatusEffect(StatusEffects.Infested))
               {
                  outputText("就像逃离沉船的老鼠一样，一股虫子从你萎缩的肉棒中喷射而出，滑行着逃走了。");
               }
            }
            if(int(cocks.length) == 1)
            {
               outputText("<b>你感觉到" + Utils.num2Text(_loc2_) + "根肉棒缩回了腹股沟中消失不见，只剩下你的" + cockDescript(0) + "。</b>");
            }
            if(int(cocks.length) > 1)
            {
               outputText("<b>你感觉到" + Utils.num2Text(_loc2_) + "根肉棒缩回了腹股沟中消失不见，只剩下" + multiCockDescriptLight() + "。</b>");
            }
         }
         if(int(cocks.length) == 0)
         {
            removeStatusEffect(StatusEffects.Infested);
         }
         if(int(cocks.length) == 0 && balls > 0)
         {
            outputText("<b>你的" + sackDescript() + "和" + ballsDescriptLight() + "萎缩并消失，缩回了你的腹股沟中。</b>");
            balls = 0;
            ballSize = 1;
         }
      }
      
      public function kangaScore() : Number
      {
         var _loc1_:Number = 0;
         if(countCocksOfType(CockTypesEnum.KANGAROO) > 0)
         {
            _loc1_++;
         }
         if(ears.type == 8)
         {
            _loc1_++;
         }
         if(tail.type == 12)
         {
            _loc1_++;
         }
         if(lowerBody.type == 14)
         {
            _loc1_++;
         }
         if(face.type == 9)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && hasFur())
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function itemSlot(param1:int) : ItemSlot
      {
         return itemSlots[param1];
      }
      
      public function itemCount(param1:ItemType) : int
      {
         var _loc5_:* = null as ItemSlot;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = itemSlots;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.itype == param1)
            {
               _loc2_ += _loc5_.quantity;
            }
         }
         return _loc2_;
      }
      
      override public function isUnarmed() : Boolean
      {
         return get_weapon().isUnarmed();
      }
      
      public function isTFResistant() : Boolean
      {
         if(!(hasPerk(PerkLib.TransformationResistance) && perkv2(PerkLib.TransformationResistance) == 0))
         {
            return hasPerk(PerkLib.LoliliciousBody);
         }
         return true;
      }
      
      public function isRetarded() : Boolean
      {
         if(!(hasPerk(PerkLib.BroBrains) || hasPerk(PerkLib.BimboBrains)))
         {
            return hasPerk(PerkLib.FutaFaculties);
         }
         return true;
      }
      
      public function isResetAscension() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(get_flags(),2644) == 1;
      }
      
      public function isReligious() : Boolean
      {
         if(!hasPerk(PerkLib.HistoryReligious))
         {
            return hasPerk(PerkLib.HistoryDEUSVULT);
         }
         return true;
      }
      
      public function isNakedUpper() : Boolean
      {
         if(get_armor() == ArmorLib.NOTHING || get_armor() == get_game().armors.VINARMR)
         {
            return get_upperGarment() == UndergarmentLib.NOTHING;
         }
         return false;
      }
      
      public function isNakedLower() : Boolean
      {
         if(!(Boolean([ArmorLib.NOTHING,get_game().armors.VINARMR,get_game().armors.IVCRSET,get_game().armors.CHROTFT].contains(get_armor())) && UndergarmentLib.NOTHING == get_lowerGarment() || isTaur() || hasTailInsteadOfLegs()))
         {
            return isDrider();
         }
         return true;
      }
      
      public function isNaked() : Boolean
      {
         if((get_armor() == ArmorLib.NOTHING || get_armor().get_id() == get_game().armors.VINARMR.get_id()) && get_upperGarment() == UndergarmentLib.NOTHING)
         {
            return get_lowerGarment() == UndergarmentLib.NOTHING;
         }
         return false;
      }
      
      public function isLongHaul() : Boolean
      {
         return get_game().get_modeSettings().longHaul;
      }
      
      public function isLactating() : Boolean
      {
         return lactationQ() > 0;
      }
      
      public function isInVolcanicCrag() : Boolean
      {
         return location == "火山岩山";
      }
      
      public function isInSwamp() : Boolean
      {
         return location == "沼泽";
      }
      
      public function isInPlains() : Boolean
      {
         return location == "平原";
      }
      
      public function isInMountains() : Boolean
      {
         return location == "山脉";
      }
      
      public function isInLake() : Boolean
      {
         return location == "湖泊";
      }
      
      public function isInHighMountains() : Boolean
      {
         return location == "高山";
      }
      
      public function isInGlacialRift() : Boolean
      {
         return location == "冰川裂谷";
      }
      
      public function isInForest() : Boolean
      {
         return location == "森林";
      }
      
      public function isInDesert() : Boolean
      {
         return location == "沙漠";
      }
      
      public function isInDeepwoods() : Boolean
      {
         return location == "密林";
      }
      
      public function isInDeepWoods() : Boolean
      {
         return location == "密林";
      }
      
      public function isInBog() : Boolean
      {
         return location == "沼泽";
      }
      
      public function isFeminine() : Boolean
      {
         return mf("m","f") == "f";
      }
      
      public function isEquipped(param1:ItemType) : Boolean
      {
         var _loc2_:Array = [get_weapon(),get_shield(),get_armor(),get_upperGarment(),get_lowerGarment(),get_jewelry()];
         return Boolean(_loc2_.contains(param1));
      }
      
      public function isDoubleAttacking() : Boolean
      {
         var _loc1_:Number = NaN;
         if(get_game().combat.isWieldingRangedWeapon())
         {
            if(get_weapon().isChanneling())
            {
               _loc1_ = get_inte() + get_spe() * 0.1;
            }
            else
            {
               _loc1_ = get_spe() + get_inte() * 0.2;
            }
         }
         else
         {
            _loc1_ = get_weapon().isLarge() ? get_str() * 1.3 : get_str();
         }
         var _loc2_:int = 60 + (isResetAscension() ? 0 : newGamePlusMod() * 15);
         if(statusEffectv1(StatusEffects.CounterAB) == 1)
         {
            return false;
         }
         if(!(hasPerk(PerkLib.DoubleAttack) && get_spe() >= 50))
         {
            if(get_game().urtaQuest.isUrta() && isUnarmed())
            {
               return true;
            }
            return false;
         }
         switch(FlagDict_Impl_.arrayReadInt(get_flags(),867))
         {
            case 0:
               return true;
            case 1:
               return _loc1_ <= _loc2_;
            case 2:
               return false;
            default:
               return false;
         }
      }
      
      public function isDisarmed() : Boolean
      {
         return hasStatusEffect(StatusEffects.Disarmed);
      }
      
      public function isColdBlooded() : Boolean
      {
         if(lizardScore() < 9)
         {
            return isNaga();
         }
         return true;
      }
      
      public function insectScore() : Number
      {
         var _loc1_:int = 0;
         if(antennae.type == 2)
         {
            _loc1_++;
         }
         if([2,3].indexOf(arms.type) != -1)
         {
            _loc1_++;
         }
         if([7,15,16].indexOf(lowerBody.type) != -1)
         {
            _loc1_++;
         }
         if([6,5,20].indexOf(tail.type) != -1)
         {
            _loc1_++;
         }
         if([12,1,2,15,14].indexOf(wings.type) != -1)
         {
            _loc1_++;
         }
         if(face.type == 10)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function initializeItemSlots() : void
      {
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlots.push(new ItemSlot());
         itemSlot(0).set_unlocked(true);
         itemSlot(1).set_unlocked(true);
         itemSlot(2).set_unlocked(true);
      }
      
      public function increaseEachCock(param1:Number) : Number
      {
         var _loc5_:int = 0;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(cocks.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            _loc2_ += increaseCock(_loc5_,param1);
         }
         return _loc2_;
      }
      
      public function increaseCock(param1:int, param2:Number) : Number
      {
         var _loc3_:Boolean = false;
         if(hasPerk(PerkLib.BigCock))
         {
            _loc3_ = true;
         }
         return cocks[param1].growCock(param2,_loc3_);
      }
      
      public function inBondageClothes() : Boolean
      {
         return Boolean([get_game().armors.BONSTRP,get_game().armors.VINARMR].contains(get_armor()));
      }
      
      public function impScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 20)
         {
            _loc1_++;
         }
         if(tail.type == 28)
         {
            _loc1_++;
         }
         if(wings.type == 5)
         {
            _loc1_++;
         }
         if(wings.type == 13)
         {
            _loc1_ += 2;
         }
         if(lowerBody.type == 27)
         {
            _loc1_++;
         }
         if(hasPlainSkin() && ["red","orange"].indexOf(skin.tone) != -1)
         {
            _loc1_++;
         }
         if(horns.type == 11)
         {
            _loc1_++;
         }
         if(arms.type == 4 && arms.claws.type == 8)
         {
            _loc1_++;
         }
         if(get_tallness() <= 42)
         {
            _loc1_++;
         }
         if(get_tallness() > 42)
         {
            _loc1_--;
         }
         if(biggestTitSize() >= 1)
         {
            _loc1_--;
         }
         if(bRows() == 2)
         {
            _loc1_--;
         }
         if(bRows() == 3)
         {
            _loc1_ -= 2;
         }
         if(bRows() == 4)
         {
            _loc1_ -= 3;
         }
         return _loc1_;
      }
      
      public function humanScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 0)
         {
            _loc1_++;
         }
         if(skin.type == 0)
         {
            _loc1_++;
         }
         if(horns.type == 0)
         {
            _loc1_++;
         }
         if(tail.type == 0)
         {
            _loc1_++;
         }
         if(wings.type == 0)
         {
            _loc1_++;
         }
         if(lowerBody.type == 0)
         {
            _loc1_++;
         }
         if(countCocksOfType(CockTypesEnum.HUMAN) == 1 && int(cocks.length) == 1)
         {
            _loc1_++;
         }
         if(int(breastRows.length) == 1 && skin.type == 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function horseScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 1)
         {
            _loc1_++;
         }
         if(ears.type == 1)
         {
            _loc1_++;
         }
         if(tail.type == 1)
         {
            _loc1_++;
         }
         if(countCocksOfType(CockTypesEnum.HORSE) > 0)
         {
            _loc1_++;
         }
         if(lowerBody.type == 1)
         {
            _loc1_++;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function highestRaceScore() : String
      {
         var _loc4_:Number = NaN;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:Number = NaN;
         var _loc1_:Number = humanScore();
         var _loc2_:String = "human";
         var _loc3_:IMap = new StringMap();
         _loc4_ = demonScore();
         if("demon" in StringMap.reserved)
         {
            _loc3_.setReserved("demon",_loc4_);
         }
         else
         {
            _loc3_.h["demon"] = _loc4_;
         }
         _loc4_ = goblinScore();
         if("goblin" in StringMap.reserved)
         {
            _loc3_.setReserved("goblin",_loc4_);
         }
         else
         {
            _loc3_.h["goblin"] = _loc4_;
         }
         _loc4_ = gooScore();
         if("goo" in StringMap.reserved)
         {
            _loc3_.setReserved("goo",_loc4_);
         }
         else
         {
            _loc3_.h["goo"] = _loc4_;
         }
         _loc4_ = cowScore();
         if("cow" in StringMap.reserved)
         {
            _loc3_.setReserved("cow",_loc4_);
         }
         else
         {
            _loc3_.h["cow"] = _loc4_;
         }
         _loc4_ = minoScore();
         if("minotaur" in StringMap.reserved)
         {
            _loc3_.setReserved("minotaur",_loc4_);
         }
         else
         {
            _loc3_.h["minotaur"] = _loc4_;
         }
         _loc4_ = catScore();
         if("cat" in StringMap.reserved)
         {
            _loc3_.setReserved("cat",_loc4_);
         }
         else
         {
            _loc3_.h["cat"] = _loc4_;
         }
         _loc4_ = lizardScore();
         if("lizard" in StringMap.reserved)
         {
            _loc3_.setReserved("lizard",_loc4_);
         }
         else
         {
            _loc3_.h["lizard"] = _loc4_;
         }
         _loc4_ = salamanderScore();
         if("salamander" in StringMap.reserved)
         {
            _loc3_.setReserved("salamander",_loc4_);
         }
         else
         {
            _loc3_.h["salamander"] = _loc4_;
         }
         _loc4_ = dragonScore();
         if("dragon" in StringMap.reserved)
         {
            _loc3_.setReserved("dragon",_loc4_);
         }
         else
         {
            _loc3_.h["dragon"] = _loc4_;
         }
         _loc4_ = nagaScore();
         if("naga" in StringMap.reserved)
         {
            _loc3_.setReserved("naga",_loc4_);
         }
         else
         {
            _loc3_.h["naga"] = _loc4_;
         }
         _loc4_ = sandTrapScore();
         if("sandtrap" in StringMap.reserved)
         {
            _loc3_.setReserved("sandtrap",_loc4_);
         }
         else
         {
            _loc3_.h["sandtrap"] = _loc4_;
         }
         _loc4_ = harpyScore();
         if("harpy" in StringMap.reserved)
         {
            _loc3_.setReserved("harpy",_loc4_);
         }
         else
         {
            _loc3_.h["harpy"] = _loc4_;
         }
         _loc4_ = sharkScore();
         if("shark" in StringMap.reserved)
         {
            _loc3_.setReserved("shark",_loc4_);
         }
         else
         {
            _loc3_.h["shark"] = _loc4_;
         }
         _loc4_ = sirenScore();
         if("siren" in StringMap.reserved)
         {
            _loc3_.setReserved("siren",_loc4_);
         }
         else
         {
            _loc3_.h["siren"] = _loc4_;
         }
         _loc4_ = dogScore();
         if("dog" in StringMap.reserved)
         {
            _loc3_.setReserved("dog",_loc4_);
         }
         else
         {
            _loc3_.h["dog"] = _loc4_;
         }
         _loc4_ = wolfScore();
         if("wolf" in StringMap.reserved)
         {
            _loc3_.setReserved("wolf",_loc4_);
         }
         else
         {
            _loc3_.h["wolf"] = _loc4_;
         }
         _loc4_ = foxScore();
         if("fox" in StringMap.reserved)
         {
            _loc3_.setReserved("fox",_loc4_);
         }
         else
         {
            _loc3_.h["fox"] = _loc4_;
         }
         _loc4_ = kitsuneScore();
         if("kitsune" in StringMap.reserved)
         {
            _loc3_.setReserved("kitsune",_loc4_);
         }
         else
         {
            _loc3_.h["kitsune"] = _loc4_;
         }
         _loc4_ = echidnaScore();
         if("echidna" in StringMap.reserved)
         {
            _loc3_.setReserved("echidna",_loc4_);
         }
         else
         {
            _loc3_.h["echidna"] = _loc4_;
         }
         _loc4_ = mouseScore();
         if("mouse" in StringMap.reserved)
         {
            _loc3_.setReserved("mouse",_loc4_);
         }
         else
         {
            _loc3_.h["mouse"] = _loc4_;
         }
         _loc4_ = ferretScore();
         if("ferret" in StringMap.reserved)
         {
            _loc3_.setReserved("ferret",_loc4_);
         }
         else
         {
            _loc3_.h["ferret"] = _loc4_;
         }
         _loc4_ = raccoonScore();
         if("raccoon" in StringMap.reserved)
         {
            _loc3_.setReserved("raccoon",_loc4_);
         }
         else
         {
            _loc3_.h["raccoon"] = _loc4_;
         }
         _loc4_ = bunnyScore();
         if("bunny" in StringMap.reserved)
         {
            _loc3_.setReserved("bunny",_loc4_);
         }
         else
         {
            _loc3_.h["bunny"] = _loc4_;
         }
         _loc4_ = kangaScore();
         if("kangaroo" in StringMap.reserved)
         {
            _loc3_.setReserved("kangaroo",_loc4_);
         }
         else
         {
            _loc3_.h["kangaroo"] = _loc4_;
         }
         _loc4_ = horseScore();
         if("horse" in StringMap.reserved)
         {
            _loc3_.setReserved("horse",_loc4_);
         }
         else
         {
            _loc3_.h["horse"] = _loc4_;
         }
         _loc4_ = deerScore();
         if("deer" in StringMap.reserved)
         {
            _loc3_.setReserved("deer",_loc4_);
         }
         else
         {
            _loc3_.h["deer"] = _loc4_;
         }
         _loc4_ = satyrScore();
         if("satyr" in StringMap.reserved)
         {
            _loc3_.setReserved("satyr",_loc4_);
         }
         else
         {
            _loc3_.h["satyr"] = _loc4_;
         }
         _loc4_ = rhinoScore();
         if("rhino" in StringMap.reserved)
         {
            _loc3_.setReserved("rhino",_loc4_);
         }
         else
         {
            _loc3_.h["rhino"] = _loc4_;
         }
         _loc4_ = spiderScore();
         if("spider" in StringMap.reserved)
         {
            _loc3_.setReserved("spider",_loc4_);
         }
         else
         {
            _loc3_.h["spider"] = _loc4_;
         }
         _loc4_ = pigScore();
         if("pig" in StringMap.reserved)
         {
            _loc3_.setReserved("pig",_loc4_);
         }
         else
         {
            _loc3_.h["pig"] = _loc4_;
         }
         _loc4_ = beeScore();
         if("bee" in StringMap.reserved)
         {
            _loc3_.setReserved("bee",_loc4_);
         }
         else
         {
            _loc3_.h["bee"] = _loc4_;
         }
         _loc4_ = cockatriceScore();
         if("cockatrice" in StringMap.reserved)
         {
            _loc3_.setReserved("cockatrice",_loc4_);
         }
         else
         {
            _loc3_.h["cockatrice"] = _loc4_;
         }
         _loc4_ = redPandaScore();
         if("panda" in StringMap.reserved)
         {
            _loc3_.setReserved("panda",_loc4_);
         }
         else
         {
            _loc3_.h["panda"] = _loc4_;
         }
         _loc4_ = dryadScore();
         if("dryad" in StringMap.reserved)
         {
            _loc3_.setReserved("dryad",_loc4_);
         }
         else
         {
            _loc3_.h["dryad"] = _loc4_;
         }
         _loc4_ = insectScore();
         if("insect" in StringMap.reserved)
         {
            _loc3_.setReserved("insect",_loc4_);
         }
         else
         {
            _loc3_.h["insect"] = _loc4_;
         }
         _loc4_ = sheepScore();
         if("sheep" in StringMap.reserved)
         {
            _loc3_.setReserved("sheep",_loc4_);
         }
         else
         {
            _loc3_.h["sheep"] = _loc4_;
         }
         _loc4_ = impScore();
         if("imp" in StringMap.reserved)
         {
            _loc3_.setReserved("imp",_loc4_);
         }
         else
         {
            _loc3_.h["imp"] = _loc4_;
         }
         _loc4_ = gnollScore();
         if("gnoll" in StringMap.reserved)
         {
            _loc3_.setReserved("gnoll",_loc4_);
         }
         else
         {
            _loc3_.h["gnoll"] = _loc4_;
         }
         _loc4_ = mermaidScore();
         if("mermaid" in StringMap.reserved)
         {
            _loc3_.setReserved("mermaid",_loc4_);
         }
         else
         {
            _loc3_.h["mermaid"] = _loc4_;
         }
         _loc4_ = batScore();
         if("bat" in StringMap.reserved)
         {
            _loc3_.setReserved("bat",_loc4_);
         }
         else
         {
            _loc3_.h["bat"] = _loc4_;
         }
         var _loc5_:IMap = _loc3_;
         var _loc6_:IMap = _loc5_;
         var _loc7_:IMap = _loc6_;
         var _loc8_:* = _loc6_.keys();
         while(Boolean(_loc8_.hasNext()))
         {
            _loc9_ = _loc8_.next();
            _loc4_ = Number(_loc7_.get(_loc9_));
            _loc10_ = _loc9_;
            _loc11_ = _loc10_;
            _loc12_ = _loc4_;
            if(_loc12_ > _loc1_)
            {
               _loc1_ = _loc12_;
               _loc2_ = _loc11_;
            }
         }
         return get_race();
      }
      
      public function hasWaited() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(get_flags(),22) == 1;
      }
      
      public function hasUnpermedPerk(param1:PerkType) : Boolean
      {
         if(hasPerk(param1))
         {
            return perkv4(param1) == 0;
         }
         return false;
      }
      
      public function hasUndergarments() : Boolean
      {
         if(get_upperGarment() == UndergarmentLib.NOTHING)
         {
            return get_lowerGarment() != UndergarmentLib.NOTHING;
         }
         return true;
      }
      
      public function hasSpells() : Boolean
      {
         return spellCount() > 0;
      }
      
      public function hasMaraeBless() : Boolean
      {
         if(!(hasPerk(PerkLib.PurityBlessing) || hasPerk(PerkLib.MaraesGiftButtslut) || hasPerk(PerkLib.MaraesGiftFertility) || hasPerk(PerkLib.MaraesGiftProfractory)))
         {
            return hasPerk(PerkLib.MaraesGiftStud);
         }
         return true;
      }
      
      public function hasItemIncludeEquipped(param1:ItemType, param2:int = 1) : Boolean
      {
         if(!hasItem(param1))
         {
            return isEquipped(param1);
         }
         return true;
      }
      
      public function hasItemArrayAny(param1:Array) : Boolean
      {
         var _loc4_:* = null as ItemSlot;
         var _loc5_:int = 0;
         var _loc6_:* = null as ItemType;
         var _loc2_:int = 0;
         var _loc3_:Array = itemSlots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = 0;
            while(_loc5_ < int(param1.length))
            {
               _loc6_ = param1[_loc5_];
               _loc5_++;
               if(_loc6_ == _loc4_.itype)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function hasItemArray(param1:Array, param2:Array = undefined) : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2 == null)
         {
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc4_++;
               _loc3_.push(1);
            }
            param2 = _loc3_;
         }
         _loc4_ = 0;
         _loc5_ = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(itemCount(param1[_loc6_]) < int(param2[_loc6_]))
            {
               return false;
            }
         }
         return true;
      }
      
      public function hasItemAnywhere(param1:ItemType) : Boolean
      {
         if(!hasItemIncludeEquipped(param1))
         {
            return get_inventory().hasItemInStorage(param1);
         }
         return true;
      }
      
      public function hasItem(param1:ItemType, param2:int = 1) : Boolean
      {
         return itemCount(param1) >= param2;
      }
      
      public function hasGottenWashed() : void
      {
         removeStatusEffect(StatusEffects.TellyVised);
         if(gills.type == 3)
         {
            changeFatigue(-20);
         }
      }
      
      public function hasFeraBoon() : Boolean
      {
         if(!(hasPerk(PerkLib.FerasBoonAlpha) || hasPerk(PerkLib.FerasBoonBreedingBitch) || hasPerk(PerkLib.FerasBoonMilkingTwat) || hasPerk(PerkLib.FerasBoonSeeder)))
         {
            return hasPerk(PerkLib.FerasBoonWideOpen);
         }
         return true;
      }
      
      public function hasDress() : Boolean
      {
         return [get_game().armors.MSDRESS,get_game().armors.BALLETD,get_game().armors.S_DRESS,get_game().armors.B_DRESS,get_game().armors.M_DRESS,get_game().armors.CHNGSAM,get_game().armors.NQGOWN].indexOf(get_armor()) > -1;
      }
      
      public function hasChildren() : Boolean
      {
         if(!(statusEffectv1(StatusEffects.Birthed) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),40) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),162) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),572) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),675) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),69) > 0 || get_game().emberScene.emberChildren() > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),557) > 0 || get_game().isabellaScene.totalIsabellaChildren() > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),251) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),252) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),2186) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),1213) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),908) > 0 || get_game().kihaFollowerScene.totalKihaChildren() > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),8) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),2091) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),2099) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),874) > 0 || FlagDict_Impl_
         .arrayReadInt(get_flags(),894) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),763) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),859) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),740) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),741) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),94) > 0 || FlagDict_Impl_.arrayReadInt(get_flags(),1204) > 0 || get_game().urtaPregs.urtaKids() > 0))
         {
            return get_game().mothCave.doloresScene.get_doloresProg() > 0;
         }
         return true;
      }
      
      public function harpyScore() : Number
      {
         var _loc1_:Number = 0;
         if(arms.type == 1)
         {
            _loc1_++;
         }
         if(hair.type == 1)
         {
            _loc1_++;
         }
         if(wings.type == 9)
         {
            _loc1_++;
         }
         if(tail.type == 11)
         {
            _loc1_++;
         }
         if(lowerBody.type == 13)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && face.type == 0)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && [0,4].indexOf(ears.type) != -1)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function growTits(param1:Number, param2:Number, param3:Boolean, param4:Number) : void
      {
         if(int(breastRows.length) == 0)
         {
            return;
         }
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(hasPerk(PerkLib.BigTits) && Utils.rand(3) == 0 && param1 < 1)
         {
            param1 = 1;
         }
         var _loc7_:Number = int(breastRows.length);
         if(param4 == 1)
         {
            while(param2 > 0)
            {
               _loc7_ = int(breastRows.length);
               _loc5_ = 0;
               while(_loc7_ > 0)
               {
                  _loc7_--;
                  if(breastRows[int(_loc7_)].breastRating < breastRows[int(_loc5_)].breastRating)
                  {
                     _loc5_ = _loc7_;
                  }
               }
               _loc6_ += param1;
               _loc7_ = param1;
               if(!get_game().get_hyper())
               {
                  if(breastRows[int(_loc5_)].breastRating > 3)
                  {
                     if(!hasPerk(PerkLib.BigTits))
                     {
                        _loc7_ /= 1.5;
                     }
                     else
                     {
                        _loc7_ /= 1.3;
                     }
                  }
                  if(breastRows[int(_loc5_)].breastRating > 7)
                  {
                     if(!hasPerk(PerkLib.BigTits))
                     {
                        _loc7_ /= 2;
                     }
                     else
                     {
                        _loc7_ /= 1.5;
                     }
                  }
                  if(breastRows[int(_loc5_)].breastRating > 9)
                  {
                     if(!hasPerk(PerkLib.BigTits))
                     {
                        _loc7_ /= 2;
                     }
                     else
                     {
                        _loc7_ /= 1.5;
                     }
                  }
                  if(breastRows[int(_loc5_)].breastRating > 12)
                  {
                     if(!hasPerk(PerkLib.BigTits))
                     {
                        _loc7_ /= 2;
                     }
                     else
                     {
                        _loc7_ /= 1.5;
                     }
                  }
               }
               _temp_1.breastRating += _loc7_;
               param2--;
            }
         }
         if(!get_game().get_hyper())
         {
            if(breastRows[0].breastRating > 3)
            {
               if(!hasPerk(PerkLib.BigTits))
               {
                  param1 /= 1.5;
               }
               else
               {
                  param1 /= 1.3;
               }
            }
            if(breastRows[0].breastRating > 7)
            {
               if(!hasPerk(PerkLib.BigTits))
               {
                  param1 /= 2;
               }
               else
               {
                  param1 /= 1.5;
               }
            }
            if(breastRows[0].breastRating > 12)
            {
               if(!hasPerk(PerkLib.BigTits))
               {
                  param1 /= 2;
               }
               else
               {
                  param1 /= 1.5;
               }
            }
         }
         if(param4 == 2)
         {
            _loc7_ = 0;
            while(param2 > 0)
            {
               if(_loc7_ + 1 > int(breastRows.length))
               {
                  _loc7_ = 0;
               }
               _temp_2.breastRating += param1;
               _loc7_++;
               _loc6_ += param1;
               param2--;
            }
         }
         if(param4 == 3)
         {
            while(param2 > 0)
            {
               param2--;
               _temp_3.breastRating += param1;
               _loc6_ += param1;
            }
         }
         if(param3)
         {
            if(param4 < 3)
            {
               if(param1 <= 2)
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("你的那一排排" + breastDescript(0) + "随着增加的重量晃动着，变得更大了些。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("你的" + breastDescript(0) + "随着膨胀增加的重量晃动着，变得更大了些。");
                  }
               }
               else if(param1 <= 4)
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("随着胸部变得沉重，你踉跄了一下。低下头，你好奇地看着你的那一排排" + breastDescript(0) + "显著地膨胀起来。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("胸部突然变得沉重许多，让你踉跄了一下。你低下头，好奇地看着自己的" + breastDescript(0) + "显著地膨胀起来。");
                  }
               }
               else
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("身体重心的巨大变化让你跪倒在地。你的" + breastDescript(0) + "传来强烈的刺痛感，变得大得惊人。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("由于重心的巨大变化，你双膝跪地。你" + breastDescript(0) + "的刺痛感加剧，它们正以夸张的速度继续生长。");
                  }
               }
            }
            else
            {
               if(param1 <= 2)
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("你最上面一排的" + breastDescript(0) + "随着重量的增加而晃动，它们不断膨胀，变得更大了些。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("你那一排" + breastDescript(0) + "随着重量的增加而晃动，它们不断膨胀，变得更大了些。");
                  }
               }
               if(param1 > 2 && param1 <= 4)
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("胸部突然变得沉重许多，让你踉跄了一下。你低下头，好奇地看着自己最上面一排的" + breastDescript(0) + "显著地膨胀起来。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("胸部突然变得沉重许多，让你踉跄了一下。你低下头，好奇地看着自己的" + breastDescript(0) + "显著地膨胀起来。");
                  }
               }
               if(param1 > 4)
               {
                  if(int(breastRows.length) > 1)
                  {
                     outputText("由于身体重心的巨大变化，你双膝跪地。你最上面一排的" + breastDescript(0) + "产生强烈的刺痛感，变得大得惊人。");
                  }
                  if(int(breastRows.length) == 1)
                  {
                     outputText("由于重心的巨大变化，你双膝跪地。你" + breastDescript(0) + "的刺痛感加剧，它们正以夸张的速度继续生长。");
                  }
               }
            }
         }
         if(biggestTitSize() >= 8.5 && nippleLength < 2)
         {
            if(param3)
            {
               outputText("随着乳房的膨胀，你的[nipples]也开始生长以适应这丰满的肉体，并传来一阵柔和的酸痛感。");
            }
            nippleLength = 2;
         }
         if(biggestTitSize() >= 7 && nippleLength < 1)
         {
            if(param3)
            {
               outputText("随着乳房的膨胀，你的[nipples]也开始生长以适应这丰满的肉体，并传来一阵柔和的酸痛感。");
            }
            nippleLength = 1;
         }
         if(biggestTitSize() >= 5 && nippleLength < 0.75)
         {
            if(param3)
            {
               outputText("随着乳房的膨胀，你的[nipples]也开始生长以适应这丰满的肉体，并传来一阵柔和的酸痛感。");
            }
            nippleLength = 0.75;
         }
         if(biggestTitSize() >= 3 && nippleLength < 0.5)
         {
            if(param3)
            {
               outputText("随着乳房的膨胀，你的[nipples]也开始生长以适应这丰满的肉体，并传来一阵柔和的酸痛感。");
            }
            nippleLength = 0.5;
         }
      }
      
      public function gooScore() : Number
      {
         var _loc1_:Number = 0;
         if(hair.type == 3)
         {
            _loc1_++;
         }
         if(skin.adj == "slimy")
         {
            _loc1_++;
         }
         if(lowerBody.type == 8)
         {
            _loc1_++;
         }
         if(vaginalCapacity() > 9000)
         {
            _loc1_++;
         }
         if(hasStatusEffect(StatusEffects.SlimeCraving))
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function goblinScore() : Number
      {
         var _loc1_:Number = 0;
         if(ColorLists.GOBLIN_SKIN.indexOf(skin.tone) != -1)
         {
            _loc1_ += 2;
         }
         if(_loc1_ > 0)
         {
            if(face.type == 0)
            {
               _loc1_ += 0.5;
            }
            if(lowerBody.type == 0)
            {
               _loc1_ += 0.5;
            }
            if(ears.type == 4)
            {
               _loc1_++;
            }
            if(get_tallness() < 48)
            {
               _loc1_++;
            }
            if(hasVagina())
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function goIntoRut(param1:Boolean, param2:int = 1) : Boolean
      {
         if(!hasCock())
         {
            return false;
         }
         if(get_inRut())
         {
            if(param1)
            {
               outputText("[pg]你的" + cockDescript(0) + "跳动着，滴下液体，你交配的欲望也随之增强。你知道<b>你已经陷入了更深的发情期</b>，但现在唯一重要的是把精液射进一个渴望精液的屄里。");
            }
            addStatusValue(StatusEffects.Rut,1,100 * param2);
            addStatusValue(StatusEffects.Rut,2,5 * param2);
            addStatusValue(StatusEffects.Rut,3,48 * param2);
            if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18],[DynStat.Lib(5 * param2),DynStat.NoScale][19]);
            }
         }
         else
         {
            if(param1)
            {
               outputText("[pg]你站直了身子，环顾四周，嗅着空气，寻找着配偶。等等，什么！？你很难把这个念头从脑海中甩掉——你真的需要一个肥沃的洞来播种。你拍了拍额头，意识到<b>你发情了</b>！");
            }
            createStatusEffect(StatusEffects.Rut,150 * param2,5 * param2,100 * param2,0);
            if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18],[DynStat.Lib(5 * param2),DynStat.NoScale][19]);
            }
         }
         return true;
      }
      
      public function goIntoHeat(param1:Boolean, param2:int = 1) : Boolean
      {
         var _loc3_:* = null as StatusEffect;
         if(!hasVagina() || get_pregnancyIncubation() != 0)
         {
            return false;
         }
         if(get_inHeat())
         {
            if(param1)
            {
               outputText("[pg]你的大脑变得一片空白，你的" + vaginaDescript(0) + "变得湿润。尽管你已经在发情了，但交配的欲望还在不断膨胀。");
            }
            _loc3_ = statusEffectByType(StatusEffects.Heat);
            _loc3_.value1 += 5 * param2;
            _loc3_.value2 += 5 * param2;
            _loc3_.value3 += 48 * param2;
            if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17]);
            }
            else if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.Lib(5 * param2),DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lib(5 * param2),DynStat.NoScale][0],[DynStat.Lib(5 * param2),DynStat.NoScale][1],[DynStat.Lib(5 * param2),DynStat.NoScale][2],[DynStat.Lib(5 * param2),DynStat.NoScale][3],[DynStat.Lib(5 * param2),DynStat.NoScale][4],[DynStat.Lib(5 * param2),DynStat.NoScale][5],[DynStat.Lib(5 * param2),DynStat.NoScale][6],[DynStat.Lib(5 * param2),DynStat.NoScale][7],[DynStat.Lib(5 * param2),DynStat.NoScale][8],[DynStat.Lib(5 * param2),DynStat.NoScale][9],[DynStat.Lib(5 * param2),DynStat.NoScale][10],[DynStat.Lib(5 * param2),DynStat.NoScale][11],[DynStat.Lib(5 * param2),DynStat.NoScale][12],[DynStat.Lib(5 * param2),DynStat.NoScale][13],[DynStat.Lib(5 * param2),DynStat.NoScale][14],[DynStat.Lib(5 * param2),DynStat.NoScale][15],[DynStat.Lib(5 * param2),DynStat.NoScale][16],[DynStat.Lib(5 * param2),DynStat.NoScale][17],[DynStat.Lib(5 * param2),DynStat.NoScale][18],[DynStat.Lib(5 * param2),DynStat.NoScale][19]);
            }
         }
         else
         {
            if(param1)
            {
               outputText("[pg]你的大脑变得一片空白，你的" + vaginaDescript(0) + "变得湿润。你的双手开始从上到下抚摸自己的身体，敏感的肌肤因欲望而燃烧。你脑海中充满了弯下腰，将你饥渴的小穴献给雄性的幻想，<b>你意识到自己发情了！</b>");
            }
            createStatusEffect(StatusEffects.Heat,10 * param2,15 * param2,48 * param2,0);
            if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14],[DynStat.Lib(15 * param2),DynStat.NoScale][15]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14],[DynStat.Lib(15 * param2),DynStat.NoScale][15],[DynStat.Lib(15 * param2),DynStat.NoScale][16]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14],[DynStat.Lib(15 * param2),DynStat.NoScale][15],[DynStat.Lib(15 * param2),DynStat.NoScale][16],[DynStat.Lib(15 * param2),DynStat.NoScale][17]);
            }
            else if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14],[DynStat.Lib(15 * param2),DynStat.NoScale][15],[DynStat.Lib(15 * param2),DynStat.NoScale][16],[DynStat.Lib(15 * param2),DynStat.NoScale][17],[DynStat.Lib(15 * param2),DynStat.NoScale][18]);
            }
            else
            {
               if(int([DynStat.Lib(15 * param2),DynStat.NoScale].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lib(15 * param2),DynStat.NoScale][0],[DynStat.Lib(15 * param2),DynStat.NoScale][1],[DynStat.Lib(15 * param2),DynStat.NoScale][2],[DynStat.Lib(15 * param2),DynStat.NoScale][3],[DynStat.Lib(15 * param2),DynStat.NoScale][4],[DynStat.Lib(15 * param2),DynStat.NoScale][5],[DynStat.Lib(15 * param2),DynStat.NoScale][6],[DynStat.Lib(15 * param2),DynStat.NoScale][7],[DynStat.Lib(15 * param2),DynStat.NoScale][8],[DynStat.Lib(15 * param2),DynStat.NoScale][9],[DynStat.Lib(15 * param2),DynStat.NoScale][10],[DynStat.Lib(15 * param2),DynStat.NoScale][11],[DynStat.Lib(15 * param2),DynStat.NoScale][12],[DynStat.Lib(15 * param2),DynStat.NoScale][13],[DynStat.Lib(15 * param2),DynStat.NoScale][14],[DynStat.Lib(15 * param2),DynStat.NoScale][15],[DynStat.Lib(15 * param2),DynStat.NoScale][16],[DynStat.Lib(15 * param2),DynStat.NoScale][17],[DynStat.Lib(15 * param2),DynStat.NoScale][18],[DynStat.Lib(15 * param2),DynStat.NoScale][19]);
            }
         }
         return true;
      }
      
      public function gnollScore() : Number
      {
         var _loc1_:int = 0;
         if(face.type == 29)
         {
            _loc1_++;
         }
         if(ears.type == 23)
         {
            _loc1_++;
         }
         if(lowerBody.type == 31)
         {
            _loc1_++;
         }
         if(arms.type == 15)
         {
            _loc1_++;
         }
         if(tail.type == 31)
         {
            _loc1_++;
         }
         if(countCocksOfType(CockTypesEnum.GNOLL) > 0)
         {
            _loc1_++;
         }
         if(hasFur() && _loc1_ > 3)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function get_weaponVerb() : String
      {
         return _weapon.get_attackVerb();
      }
      
      override public function get_weaponValue() : Number
      {
         return _weapon.get_value();
      }
      
      override public function get_weaponPerk() : Array
      {
         if(_weapon.perk != null)
         {
            return _weapon.perk;
         }
         return [];
      }
      
      override public function get_weaponName() : String
      {
         return _weapon.get_name();
      }
      
      public function get_weaponBaseAttack() : Number
      {
         return _weapon.get_attack();
      }
      
      override public function get_weaponAttack() : Number
      {
         var _loc1_:Number = get_weapon().modifiedAttack();
         _loc1_ += 2 * get_weapon().masteryLevel();
         _loc1_ += getBonusStat("武器伤害");
         _loc1_ *= getBonusStatMultiplicative("武器伤害");
         return Math.round(_loc1_);
      }
      
      override public function get_weaponAcc() : Number
      {
         return _weapon.get_accBonus();
      }
      
      public function get_weapon() : Weapon
      {
         return _weapon;
      }
      
      override public function get_upperGarmentValue() : Number
      {
         return _upperGarment.get_value();
      }
      
      override public function get_upperGarmentPerk() : String
      {
         return _upperGarment.get_perk();
      }
      
      override public function get_upperGarmentName() : String
      {
         return _upperGarment.get_name();
      }
      
      public function get_upperGarment() : Undergarment
      {
         return _upperGarment;
      }
      
      override public function get_tou() : Number
      {
         return _tou + get_bonusTou();
      }
      
      override public function get_str() : Number
      {
         return _str + get_bonusStr();
      }
      
      override public function get_spe() : Number
      {
         return _spe + get_bonusSpe();
      }
      
      override public function get_shieldValue() : Number
      {
         return _shield.get_value();
      }
      
      override public function get_shieldPerk() : String
      {
         return _shield.get_perk();
      }
      
      override public function get_shieldName() : String
      {
         return _shield.get_name();
      }
      
      override public function get_shieldBlock() : Number
      {
         return _shield.get_block();
      }
      
      public function get_shield() : Shield
      {
         return _shield;
      }
      
      public function get_rapierTraining() : int
      {
         return get_game().raphael.get_rapierTraining();
      }
      
      override public function get_race() : String
      {
         var _loc1_:String = "human";
         if(catScore() >= 4)
         {
            if(isTaur() && lowerBody.type == 9)
            {
               _loc1_ = isLoliShota("kitten-taur","cat-taur");
               if(face.type == 0 || face.type == 6)
               {
                  _loc1_ = "sphinx-morph";
               }
            }
            else
            {
               _loc1_ = isLoliShota("kitten-morph","cat-morph");
               if(face.type == 0 || face.type == 6)
               {
                  _loc1_ = isLoliShota("kitten-","cat-") + mf("boy","girl");
               }
            }
         }
         if(lizardScore() >= 4)
         {
            if(hasDragonWingsAndFire())
            {
               _loc1_ = isBasilisk() ? "dracolisk" : "dragonewt";
            }
            else
            {
               _loc1_ = isBasilisk() ? "basilisk" : "lizan";
            }
            if(isTaur())
            {
               _loc1_ += "-taur";
            }
            if(lizardScore() >= 9)
            {
               return _loc1_;
            }
         }
         if(dragonScore() >= 6)
         {
            _loc1_ = "dragon-morph";
            if(face.type == 0)
            {
               _loc1_ = "dragon-" + mf("man","girl");
            }
            if(isTaur())
            {
               _loc1_ = "dragon-taur";
            }
         }
         if(cockatriceScore() >= 4)
         {
            _loc1_ = "cockatrice-morph";
            if(cockatriceScore() >= 8)
            {
               _loc1_ = "cockatrice";
            }
            if(face.type == 0)
            {
               _loc1_ = "cockatrice-" + mf("boy","girl");
            }
            if(isTaur())
            {
               _loc1_ = "cockatrice-taur";
            }
         }
         if(redPandaScore() >= 4)
         {
            _loc1_ = "red-panda-morph";
            if(face.type == 0)
            {
               _loc1_ = "red-panda-" + mf("boy","girl");
            }
            if(isTaur())
            {
               _loc1_ = "red-panda-taur";
            }
         }
         if(raccoonScore() >= 4)
         {
            _loc1_ = "raccoon-morph";
            if(balls > 0 && ballSize > 5)
            {
               _loc1_ = "tanuki-morph";
            }
            if(isTaur())
            {
               _loc1_ = "raccoon-taur";
            }
         }
         if(sheepScore() >= 4)
         {
            if(lowerBody.legCount == 4 && lowerBody.type == 21)
            {
               _loc1_ = "sheep-taur";
            }
            else if(get_gender() == 0 || get_gender() == 3)
            {
               _loc1_ = "sheep-morph";
            }
            else if(get_gender() == 1 && horns.type == 10)
            {
               _loc1_ = "ram-morph";
            }
            else
            {
               _loc1_ = "sheep-" + mf("boy","girl");
            }
         }
         if(wolfScore() >= 4)
         {
            if(hasFur() || get_gender() == 0 || get_gender() == 3)
            {
               _loc1_ = "wolf-morph";
            }
            else
            {
               _loc1_ = "wolf-" + mf("boy","girl");
            }
         }
         if(dogScore() >= 4)
         {
            if(isTaur() && lowerBody.type == 2)
            {
               _loc1_ = isLoliShota("puppy","dog");
            }
            else
            {
               _loc1_ = isLoliShota("puppy-morph","dog-morph");
               if(face.type == 0)
               {
                  _loc1_ = isLoliShota("puppy-" + mf("boy","girl"),"dog-" + mf("man","girl"));
               }
            }
         }
         if(foxScore() >= 4)
         {
            if(isTaur() && lowerBody.type == 17)
            {
               _loc1_ = "fox-taur";
            }
            else if(hasFur())
            {
               _loc1_ = "fox-morph";
            }
            else
            {
               _loc1_ = "fox-" + mf("morph","girl");
            }
         }
         if(ferretScore() >= 4)
         {
            if(hasFur())
            {
               _loc1_ = "ferret-morph";
            }
            else
            {
               _loc1_ = "ferret-" + mf("morph","girl");
            }
         }
         if(kitsuneScore() >= 4)
         {
            _loc1_ = "kitsune";
         }
         if(horseScore() >= 3)
         {
            if(isTaur())
            {
               _loc1_ = "centaur-morph";
            }
            else if(horns.type == 7)
            {
               if(wings.type == 9)
               {
                  _loc1_ = "alicorn";
               }
               else
               {
                  _loc1_ = "unicorn-morph";
               }
            }
            else if(wings.type == 9)
            {
               _loc1_ = "pegasus";
            }
            else
            {
               _loc1_ = "equine-morph";
            }
         }
         if(mutantScore() >= 5 && _loc1_ == "human")
         {
            _loc1_ = "corrupted mutant";
         }
         if(minoScore() >= 4)
         {
            _loc1_ = "minotaur-morph";
         }
         if(cowScore() > 5)
         {
            _loc1_ = "cow-";
            _loc1_ += mf("morph","girl");
         }
         if(beeScore() >= 5)
         {
            _loc1_ = "bee-morph";
         }
         if(goblinScore() >= 5)
         {
            _loc1_ = "goblin";
         }
         if(humanScore() >= 5 && _loc1_ == "corrupted mutant")
         {
            _loc1_ = "somewhat human mutant";
         }
         if(demonScore() > 4)
         {
            _loc1_ = "demon-morph";
         }
         if(sharkScore() >= 3)
         {
            _loc1_ = "shark-morph";
         }
         if(bunnyScore() >= 4)
         {
            _loc1_ = "bunny-" + mf("boy","girl");
            if(horns.type == 5 && horns.value > 0)
            {
               _loc1_ = "jackalope-" + mf("boy","girl");
            }
         }
         if(harpyScore() >= 4)
         {
            if(get_gender() >= 2)
            {
               _loc1_ = "harpy";
            }
            else
            {
               _loc1_ = "avian";
            }
         }
         if(spiderScore() >= 4)
         {
            if(get_gender() == 0 || get_gender() == 3)
            {
               _loc1_ = "spider-morph";
            }
            else
            {
               _loc1_ = "spider-" + mf("boy","girl");
            }
            if(isDrider())
            {
               _loc1_ = "drider";
            }
         }
         if(kangaScore() >= 4)
         {
            _loc1_ = "kangaroo-morph";
         }
         if(mouseScore() >= 3)
         {
            if(face.type != 16)
            {
               _loc1_ = "mouse-" + mf("boy","girl");
            }
            else
            {
               _loc1_ = "mouse-morph";
            }
         }
         if(salamanderScore() >= 4)
         {
            if(isTaur())
            {
               _loc1_ = "salamander-taur";
            }
            else
            {
               _loc1_ = "salamander-" + mf("boy","girl");
            }
         }
         if(pigScore() >= 4)
         {
            _loc1_ = "pig-morph";
            if(face.type == 0)
            {
               _loc1_ = "pig-" + mf("boy","girl");
            }
            if(face.type == 20)
            {
               _loc1_ = "boar-morph";
            }
         }
         if(satyrScore() >= 4)
         {
            _loc1_ = "satyr";
         }
         if(dryadScore() >= 3)
         {
            _loc1_ = "dryad";
         }
         if(rhinoScore() >= 4)
         {
            _loc1_ = "rhino-morph";
            if(face.type == 0)
            {
               _loc1_ = "rhino-" + mf("boy","girl");
            }
         }
         if(echidnaScore() >= 4)
         {
            _loc1_ = "echidna-morph";
            if(face.type == 0)
            {
               _loc1_ = "echidna-" + mf("boy","girl");
            }
         }
         if(deerScore() >= 4)
         {
            if(isTaur())
            {
               _loc1_ = "deer-taur";
            }
            else
            {
               _loc1_ = "deer-morph";
               if(face.type == 0)
               {
                  _loc1_ = "deer-" + mf("boy","girl");
               }
            }
         }
         if(batScore() >= 4)
         {
            _loc1_ = "bat-" + mf("boy","girl");
            if(get_game().get_silly())
            {
               _loc1_ = "bat-" + mf("man","woman");
            }
         }
         if(sirenScore() >= 4)
         {
            _loc1_ = "siren";
         }
         if(lowerBody.type == 3)
         {
            _loc1_ = "naga";
         }
         if(lowerBody.type == 32)
         {
            _loc1_ = "mer" + (isGenderless() ? "folk" : mf("man","maid"));
         }
         if(lowerBody.type == 1 && isTaur())
         {
            if(wings.type == 9)
            {
               if(horns.type == 7)
               {
                  _loc1_ = "alicorn-taur";
               }
               else
               {
                  _loc1_ = "pegataur";
               }
            }
            else if(horns.type == 7)
            {
               _loc1_ = "unicorn-taur";
            }
            else if(horseScore() >= 5)
            {
               _loc1_ = "equitaur";
            }
            else if(minoScore() >= 4)
            {
               _loc1_ = "mino-centaur";
            }
            else
            {
               _loc1_ = "centaur";
            }
         }
         if(lowerBody.type == 11)
         {
            _loc1_ = "pony-kin";
         }
         if(gooScore() >= 3)
         {
            _loc1_ = "goo-";
            _loc1_ += mf("boy","girl");
         }
         if(humanScore() >= 4 && get_tallness() <= 48 && (wings.type == 1 || wings.type == 2))
         {
            _loc1_ = "faerie";
         }
         if(impScore() >= 4)
         {
            _loc1_ = "imp";
         }
         if(gnollScore() >= 5)
         {
            _loc1_ = "gnoll-morph";
         }
         return _loc1_;
      }
      
      public function get_modArmorName() : String
      {
         if(_modArmorName == null)
         {
            _modArmorName = "";
         }
         return _modArmorName;
      }
      
      public function get_minotaurScore() : Number
      {
         return minoScore();
      }
      
      override public function get_lowerGarmentValue() : Number
      {
         return _lowerGarment.get_value();
      }
      
      override public function get_lowerGarmentPerk() : String
      {
         return _lowerGarment.get_perk();
      }
      
      override public function get_lowerGarmentName() : String
      {
         return _lowerGarment.get_name();
      }
      
      public function get_lowerGarment() : Undergarment
      {
         return _lowerGarment;
      }
      
      override public function get_jewelryValue() : Number
      {
         return _jewelry.get_value();
      }
      
      override public function get_jewelryPerk() : String
      {
         return _jewelry.get_perk();
      }
      
      override public function get_jewelryName() : String
      {
         return _jewelry.get_name();
      }
      
      override public function get_jewelryEffectMagnitude() : Number
      {
         return _jewelry.get_effectMagnitude();
      }
      
      override public function get_jewelryEffectId() : Number
      {
         return _jewelry.get_effectId();
      }
      
      public function get_jewelry() : Jewelry
      {
         return _jewelry;
      }
      
      public function get_inventoryName() : String
      {
         var _loc1_:* = null as Array;
         if(hasKeyItem("Backpack"))
         {
            _loc1_ = ["包","背包"];
            return _loc1_[Utils.rand(int(_loc1_.length))];
         }
         _loc1_ = ["小袋","物品袋","包","物品包"];
         return _loc1_[Utils.rand(int(_loc1_.length))];
      }
      
      public function get_inventory() : Inventory
      {
         return get_game().inventory;
      }
      
      override public function get_inte() : Number
      {
         return _inte + get_bonusInte();
      }
      
      public function get_hunger100() : Number
      {
         return 100 * hunger / maxHunger();
      }
      
      override public function get_fireRes() : Number
      {
         if(skin.type == 3)
         {
            return 1.5 * _fireRes;
         }
         return _fireRes;
      }
      
      public function get_bonusTou() : Number
      {
         var _loc1_:Number = 0;
         if(hasPerk(PerkLib.PotentPregnancy) && isPregnant())
         {
            _loc1_ += 10;
         }
         if(hasStatusEffect(StatusEffects.Might))
         {
            _loc1_ += statusEffectv1(StatusEffects.Might);
         }
         if(hasStatusEffect(StatusEffects.MosquitoNumb))
         {
            _loc1_ -= statusEffectv1(StatusEffects.MosquitoNumb);
         }
         if(hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            _loc1_ += statusEffectv1(StatusEffects.ParasiteQueen);
         }
         if(hasStatusEffect(StatusEffects.NagaSentVenom))
         {
            _loc1_ -= statusEffectv1(StatusEffects.NagaSentVenom);
         }
         if(_loc1_ > 500)
         {
            _loc1_ = 500;
         }
         return _loc1_;
      }
      
      public function get_bonusStr() : Number
      {
         var _loc1_:Number = 0;
         if(hasPerk(PerkLib.PotentPregnancy) && isPregnant())
         {
            _loc1_ += 10;
         }
         if(hasStatusEffect(StatusEffects.Might))
         {
            _loc1_ += statusEffectv1(StatusEffects.Might);
         }
         if(hasStatusEffect(StatusEffects.MosquitoNumb))
         {
            _loc1_ -= statusEffectv1(StatusEffects.MosquitoNumb);
         }
         if(hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            _loc1_ += statusEffectv1(StatusEffects.ParasiteQueen);
         }
         if(_loc1_ > 500)
         {
            _loc1_ = 500;
         }
         return _loc1_;
      }
      
      public function get_bonusSpe() : Number
      {
         var _loc1_:Number = 0;
         if(hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            _loc1_ += statusEffectv1(StatusEffects.ParasiteQueen);
         }
         if(hasStatusEffect(StatusEffects.MosquitoNumb))
         {
            _loc1_ -= statusEffectv1(StatusEffects.MosquitoNumb);
         }
         if(_loc1_ > 500)
         {
            _loc1_ = 500;
         }
         return _loc1_;
      }
      
      public function get_bonusInte() : Number
      {
         var _loc1_:Number = 0;
         if(hasStatusEffect(StatusEffects.Revelation))
         {
            _loc1_ += statusEffectv2(StatusEffects.Revelation);
         }
         if(statusEffectv1(StatusEffects.Resolve) == 4)
         {
            _loc1_ -= statusEffectv3(StatusEffects.Resolve);
         }
         if(get_game().monster != null)
         {
            if(get_game().monster.hasStatusEffect(StatusEffects.TwuWuv))
            {
               _loc1_ -= get_game().monster.statusEffectv1(StatusEffects.TwuWuv);
            }
         }
         if(hasStatusEffect(StatusEffects.NagaSentVenom))
         {
            _loc1_ -= statusEffectv1(StatusEffects.NagaSentVenom);
         }
         if(hasStatusEffect(StatusEffects.NephilaQueen))
         {
            _loc1_ += statusEffectv1(StatusEffects.NephilaQueen);
         }
         if(_loc1_ > 500)
         {
            _loc1_ = 500;
         }
         return _loc1_;
      }
      
      override public function get_armorValue() : Number
      {
         return _armor.get_value();
      }
      
      override public function get_armorPerk() : String
      {
         return _armor.get_perk();
      }
      
      override public function get_armorName() : String
      {
         if(_modArmorName.length > 0)
         {
            return get_modArmorName();
         }
         if(_armor.get_name() == "nothing" && get_lowerGarmentName() != "nothing")
         {
            return get_lowerGarmentName();
         }
         if((_armor.get_name() == "nothing" || _armor.get_name() == "obsidian vines") && get_lowerGarmentName() == "nothing")
         {
            return "gear";
         }
         return _armor.get_name();
      }
      
      override public function get_armorDef() : Number
      {
         var _loc1_:Number = _armor.get_def();
         _loc1_ += getBonusStat("护甲");
         _loc1_ += get_upperGarment().get_armorDef();
         _loc1_ += get_lowerGarment().get_armorDef();
         _loc1_ += armorMiscBonuses();
         if(get_game().monster.hasStatusEffect(StatusEffects.TailWhip))
         {
            _loc1_ -= get_game().monster.statusEffectv1(StatusEffects.TailWhip);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
         }
         _loc1_ *= getBonusStatMultiplicative("护甲");
         return Math.round(_loc1_);
      }
      
      public function get_armorBaseDef() : Number
      {
         return _armor.get_def();
      }
      
      public function get_armor() : Armor
      {
         return _armor;
      }
      
      public function getUnarmedWeapon() : Weapon
      {
         if(hasClaws())
         {
            return WeaponLib.CLAWS;
         }
         return WeaponLib.FISTS;
      }
      
      public function getLowestSlot(param1:ItemType) : ItemSlot
      {
         var _loc5_:* = null as ItemSlot;
         var _loc2_:ItemSlot = null;
         var _loc3_:int = 0;
         var _loc4_:Array = itemSlots;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.itype == param1)
            {
               if(_loc2_ == null || _loc5_.quantity < _loc2_.quantity)
               {
                  _loc2_ = _loc5_;
               }
            }
         }
         return _loc2_;
      }
      
      public function getLevelIgnoreAscension() : int
      {
         if(isResetAscension())
         {
            return int(level);
         }
         return int(level - 30 * newGamePlusMod());
      }
      
      public function getDisarmed() : ItemType
      {
         var _loc1_:* = null as DataStore;
         var _loc2_:* = null as ItemType;
         if(!isDisarmed())
         {
            return null;
         }
         _loc1_ = statusEffectByType(StatusEffects.Disarmed).dataStore;
         _loc2_ = ItemType.lookupItem(_loc1_.weaponID);
         removeStatusEffect(StatusEffects.Disarmed);
         return _loc2_;
      }
      
      public function getDifficultyDamageModifier() : Number
      {
         var _loc1_:int = get_game().get_difficulty();
         if(_loc1_ == -2)
         {
            return 0.5;
         }
         if(_loc1_ == 1)
         {
            return 1.15;
         }
         if(_loc1_ == 2)
         {
            return 1.3;
         }
         if(_loc1_ == 3)
         {
            return 1.5;
         }
         return 1;
      }
      
      override public function getArmorPen() : Number
      {
         var _loc1_:Number = get_weapon().get_armorMod();
         _loc1_ -= getBonusStat("护甲穿透");
         return _loc1_ / getBonusStatMultiplicative("护甲穿透");
      }
      
      override public function getAllMaxStats() : Object
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc1_:Number = 100;
         var _loc2_:Number = 100;
         var _loc3_:Number = 100;
         var _loc4_:Number = 100;
         if(get_game().get_realistic())
         {
            _loc5_ = 0;
            _loc6_ = isTaur() ? 9 : 4;
            if(ballSize > _loc6_ && balls > 0)
            {
               _loc5_ += Math.round((ballSize - _loc6_) / 2);
            }
            _loc6_ = isTaur() ? 24 : 15;
            if(hasBreasts() && biggestTitSize() > _loc6_)
            {
               _loc5_ += (biggestTitSize() - _loc6_) / 2;
            }
            _loc6_ = isTaur() ? 72 : 24;
            if(biggestCockArea() > _loc6_)
            {
               _loc5_ += (biggestCockArea() - _loc6_) / 6;
            }
            _loc7_ = 1;
            _loc7_ -= get_str() * 0.1;
            _loc7_ -= (get_tallness() - 72) / 168;
            if(_loc7_ < 0.4)
            {
               _loc7_ = 0.4;
            }
            _loc5_ *= _loc7_;
            _loc3_ -= _loc5_;
            if(_loc3_ < 50)
            {
               _loc3_ = 50;
            }
         }
         if(hasPerk(PerkLib.ChiReflowSpeed))
         {
            if(_loc1_ > 60)
            {
               _loc1_ = 60;
            }
         }
         if(hasPerk(PerkLib.ChiReflowDefense))
         {
            if(_loc3_ > 60)
            {
               _loc3_ = 60;
            }
         }
         if(isRetarded())
         {
            _loc4_ -= 40;
         }
         _loc1_ += ascensionFactor();
         _loc2_ += ascensionFactor();
         _loc3_ += ascensionFactor();
         _loc4_ += ascensionFactor();
         if(impScore() >= 4)
         {
            _loc3_ += 10;
            _loc4_ -= 5;
         }
         if(sheepScore() >= 4)
         {
            _loc3_ += 10;
            _loc4_ -= 10;
            _loc2_ += 10;
         }
         if(wolfScore() >= 4)
         {
            _loc3_ -= 10;
            _loc4_ += 5;
            _loc2_ += 10;
            _loc1_ += 5;
         }
         if(minoScore() >= 4)
         {
            _loc1_ += 20;
            _loc2_ += 10;
            _loc4_ -= 10;
         }
         if(lizardScore() >= 4)
         {
            _loc4_ += 10;
            if(isBasilisk())
            {
               _loc2_ += 5;
               _loc4_ += 5;
            }
         }
         if(dragonScore() >= 4)
         {
            _loc1_ += 5;
            _loc2_ += 10;
            _loc4_ += 10;
         }
         if(dogScore() >= 4)
         {
            _loc3_ += 10;
            _loc4_ -= 10;
         }
         if(foxScore() >= 4)
         {
            _loc1_ -= 10;
            _loc3_ += 5;
            _loc4_ += 5;
         }
         if(catScore() >= 4)
         {
            _loc3_ += 5;
         }
         if(bunnyScore() >= 4)
         {
            _loc3_ += 10;
         }
         if(raccoonScore() >= 4)
         {
            _loc3_ += 15;
         }
         if(horseScore() >= 4 && !isTaur() && !hasTailInsteadOfLegs())
         {
            _loc3_ += 15;
            _loc2_ += 10;
            _loc4_ -= 10;
         }
         if(gooScore() >= 3)
         {
            _loc2_ += 10;
            _loc3_ -= 10;
         }
         if(kitsuneScore() >= 4)
         {
            if(tail.type == 13)
            {
               if(tail.venom == 1)
               {
                  _loc1_ -= 2;
                  _loc3_ += 2;
                  _loc4_++;
               }
               else if(tail.venom >= 2 && tail.venom < 9)
               {
                  _loc1_ -= tail.venom + 1;
                  _loc3_ += tail.venom + 1;
                  _loc4_ += tail.venom / 2 + 0.5;
               }
               else if(tail.venom >= 9)
               {
                  _loc1_ -= 10;
                  _loc3_ += 10;
                  _loc4_ += 5;
               }
            }
         }
         if(beeScore() >= 4)
         {
            _loc3_ += 5;
            _loc2_ += 5;
         }
         if(spiderScore() >= 4)
         {
            _loc4_ += 15;
            _loc2_ += 5;
            _loc1_ -= 10;
         }
         if(sharkScore() >= 4)
         {
            _loc1_ += 10;
            _loc3_ += 5;
            _loc4_ -= 5;
         }
         if(harpyScore() >= 4)
         {
            _loc3_ += 15;
            _loc2_ -= 10;
         }
         if(sirenScore() >= 4)
         {
            _loc1_ += 5;
            _loc3_ += 20;
            _loc2_ -= 5;
         }
         if(demonScore() >= 4)
         {
            _loc3_ += 5;
            _loc4_ += 5;
         }
         if(rhinoScore() >= 4)
         {
            _loc1_ += 15;
            _loc2_ += 15;
            _loc3_ -= 10;
            _loc4_ -= 10;
         }
         if(satyrScore() >= 4)
         {
            _loc1_ += 5;
            _loc3_ += 5;
         }
         if(salamanderScore() >= 4)
         {
            _loc1_ += 5;
            _loc2_ += 5;
         }
         if(gnollScore() >= 4)
         {
            _loc1_ += 5;
            _loc4_ -= 5;
            _loc2_ -= 5;
            _loc3_ += 5;
         }
         if(isMermaid())
         {
            _loc3_ -= 20;
         }
         if(hasPerk(PerkLib.PotentPregnancy) && isPregnant())
         {
            _loc1_ += 10;
            _loc2_ += 10;
         }
         if(isNaga())
         {
            _loc3_ += 10;
         }
         if(isTaur() || isDrider())
         {
            _loc3_ += 20;
         }
         if(dryadScore() >= 4)
         {
            _loc2_ += 15;
         }
         if(batScore() >= 4)
         {
            _loc2_ -= 10;
            _loc3_ += 10;
            _loc1_ += 10;
         }
         if(isChild())
         {
            _loc1_ -= 20;
            _loc2_ -= 10;
            _loc3_ += 15;
         }
         if(isElder())
         {
            _loc1_ -= 5;
            _loc2_ -= 5;
            _loc4_ += 10;
            _loc3_ -= 5;
         }
         if(hasStatusEffect(StatusEffects.MermaidWatered))
         {
            _loc3_ += statusEffectByType(StatusEffects.MermaidWatered).buffValue("spe");
         }
         if(hasStatusEffect(StatusEffects.Might))
         {
            _loc1_ += statusEffectv1(StatusEffects.Might);
            _loc2_ += statusEffectv1(StatusEffects.Might);
         }
         if(hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            _loc1_ += statusEffectv1(StatusEffects.ParasiteQueen);
            _loc2_ += statusEffectv1(StatusEffects.ParasiteQueen);
            _loc3_ += statusEffectv1(StatusEffects.ParasiteQueen);
         }
         if(hasStatusEffect(StatusEffects.NephilaQueen))
         {
            _loc4_ += statusEffectv1(StatusEffects.NephilaQueen);
         }
         if(hasStatusEffect(StatusEffects.Refashioned))
         {
            _loc1_ += 300;
            _loc4_ += 300;
            _loc3_ += 300;
            _loc2_ += 300;
         }
         if(hasStatusEffect(StatusEffects.Revelation))
         {
            _loc4_ += 50;
         }
         if(hasPerk(PerkLib.BasiliskResistance) && !canUseStare())
         {
            _loc3_ -= Utils.boundInt(0,int(_loc3_ - 100),5);
         }
         var _loc8_:* = super.getAllMaxStats();
         _loc8_.str = int(_loc1_);
         _loc8_.tou = int(_loc2_);
         _loc8_.spe = int(_loc3_);
         _loc8_.inte = int(_loc4_);
         return _loc8_;
      }
      
      public function getAgiSpeedBonus() : Number
      {
         var _loc1_:Number = 0;
         if(hasPerk(PerkLib.Agility))
         {
            if(get_armorPerk() == "Light" || get_armorPerk() == "Adornment" || _armor.get_name() == "nothing")
            {
               _loc1_ += Math.round(get_spe() / 8);
            }
            else if(get_armorPerk() == "Medium")
            {
               _loc1_ += Math.round(get_spe() / 13);
            }
            if(_loc1_ > 15)
            {
               _loc1_ = 15;
            }
         }
         return _loc1_;
      }
      
      override public function foxScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 11)
         {
            _loc1_++;
         }
         if(ears.type == 9)
         {
            _loc1_++;
         }
         if(tail.type == 13)
         {
            _loc1_++;
         }
         if(lowerBody.type == 17)
         {
            _loc1_++;
         }
         if(arms.type == 12)
         {
            _loc1_++;
         }
         if(dogCocks() > 0 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) > 1 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) == 3 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) == 4 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function ferretScore() : Number
      {
         var _loc1_:int = 0;
         if(face.type == 17)
         {
            _loc1_++;
         }
         if(face.type == 18)
         {
            _loc1_ += 2;
         }
         if(ears.type == 13)
         {
            _loc1_++;
         }
         if(tail.type == 17)
         {
            _loc1_++;
         }
         if(lowerBody.type == 20)
         {
            _loc1_++;
         }
         if(arms.type == 9)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && hasFur())
         {
            _loc1_ += 2;
         }
         return _loc1_;
      }
      
      public function escapeMod() : int
      {
         var _loc1_:int = int(20 + get_game().monster.level * 3);
         if(get_game().debug)
         {
            _loc1_ -= 300;
         }
         if(tail.type == 15 && ears.type == 11 && hasPerk(PerkLib.Runner))
         {
            _loc1_ -= 25;
         }
         if(hasPerk(PerkLib.HistoryThief))
         {
            _loc1_ -= 20;
         }
         if(!canFly())
         {
            if(biggestTitSize() >= 35)
            {
               _loc1_ += 5;
            }
            if(biggestTitSize() >= 66)
            {
               _loc1_ += 10;
            }
            if(hips.rating >= 20)
            {
               _loc1_ += 5;
            }
            if(butt.rating >= 20)
            {
               _loc1_ += 5;
            }
            if(ballSize >= 24 && balls > 0)
            {
               _loc1_ += 5;
            }
            if(ballSize >= 48 && balls > 0)
            {
               _loc1_ += 10;
            }
            if(ballSize >= 120 && balls > 0)
            {
               _loc1_ += 10;
            }
         }
         return _loc1_;
      }
      
      public function emptySlot() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(itemSlots.length))
         {
            if(itemSlot(_loc1_).quantity <= 0 && itemSlot(_loc1_).unlocked)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function echidnaScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 16)
         {
            _loc1_++;
         }
         if(tail.type == 23)
         {
            _loc1_++;
         }
         if(face.type == 22)
         {
            _loc1_++;
         }
         if(tongue.type == 4)
         {
            _loc1_++;
         }
         if(lowerBody.type == 23)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && hasFur())
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && countCocksOfType(CockTypesEnum.ECHIDNA) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function dryadScore() : Number
      {
         var _loc1_:Number = 0;
         if(hair.type == 10)
         {
            _loc1_++;
            if(hair.adj == "leafy" || hair.hasFlowers())
            {
               _loc1_++;
            }
         }
         if(skin.type == 10)
         {
            _loc1_++;
         }
         if(skin.type == 11)
         {
            _loc1_ += 2;
         }
         if(rearBody.type == 4)
         {
            _loc1_++;
         }
         if(horns.type == 12)
         {
            _loc1_++;
         }
         if(wings.type == 16)
         {
            _loc1_++;
         }
         if(lowerBody.type == 30)
         {
            _loc1_++;
         }
         if(_loc1_ >= 1 && ears.type == 4)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function dragonScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 12)
         {
            _loc1_++;
         }
         if(ears.type == 10)
         {
            _loc1_++;
         }
         if(tail.type == 14)
         {
            _loc1_++;
         }
         if(tongue.type == 3)
         {
            _loc1_++;
         }
         if(dragonCocks() > 0)
         {
            _loc1_++;
         }
         if(hasDragonWings())
         {
            _loc1_++;
         }
         if(lowerBody.type == 18)
         {
            _loc1_++;
         }
         if(hasDragonScales() && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(hasDragonHorns())
         {
            _loc1_++;
         }
         if(horns.type == 4)
         {
            _loc1_++;
         }
         if(hasDragonfire())
         {
            _loc1_++;
         }
         if(arms.type == 13)
         {
            _loc1_++;
         }
         if(eyes.type == 4)
         {
            _loc1_++;
         }
         if(hasDragonNeck())
         {
            _loc1_++;
         }
         if(hasDragonRearBody())
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function dogScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 2)
         {
            _loc1_++;
         }
         if(ears.type == 2)
         {
            _loc1_++;
         }
         if(tail.type == 2)
         {
            _loc1_++;
         }
         if(lowerBody.type == 2)
         {
            _loc1_++;
         }
         if(arms.type == 11)
         {
            _loc1_++;
         }
         if(dogCocks() > 0)
         {
            _loc1_++;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2)
         {
            if(int(breastRows.length) > 1)
            {
               _loc1_++;
            }
            if(int(breastRows.length) == 3)
            {
               _loc1_++;
            }
            if(int(breastRows.length) > 3)
            {
               _loc1_--;
            }
         }
         return _loc1_;
      }
      
      public function disarm() : void
      {
         var _loc1_:* = null as StatusEffect;
         if(canDisarm())
         {
            _loc1_ = createStatusEffect(StatusEffects.Disarmed);
            _loc1_.dataStore = new DataStore(null,null,null,null,get_weapon().get_id());
            setUnarmed();
         }
      }
      
      public function destroyItems(param1:ItemType, param2:Number = 1) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < int(itemSlots.length))
         {
            if(itemSlot(_loc3_).itype == param1)
            {
               while(itemSlot(_loc3_).quantity > 0 && param2 > 0)
               {
                  itemSlot(_loc3_).removeOneItem();
                  param2--;
               }
            }
            _loc3_++;
         }
         return param2 <= 0;
      }
      
      public function depositEel() : void
      {
         if(!canDepositEel())
         {
            return;
         }
         dynStats(DynStat.Spe(1),DynStat.Tou(1),DynStat.Str(1));
         var _loc1_:Number = statusEffectv1(StatusEffects.ParasiteEel);
         addStatusValue(StatusEffects.ParasiteEel,1,-1);
         var _loc2_:Number = statusEffectv3(StatusEffects.ParasiteEelNeedCum) / _loc1_;
         addStatusValue(StatusEffects.ParasiteEelNeedCum,3,-_loc2_);
      }
      
      public function demonScore() : Number
      {
         var _loc1_:Number = 0;
         if(horns.type == 1 && horns.value > 0)
         {
            _loc1_++;
         }
         if(horns.type == 1 && horns.value > 4)
         {
            _loc1_++;
         }
         if(tail.type == 3)
         {
            _loc1_++;
         }
         if(hasBatLikeWings())
         {
            _loc1_++;
         }
         if(hasPlainSkin() && cor > 50)
         {
            _loc1_++;
         }
         if(face.type == 0 && cor > 50)
         {
            _loc1_++;
         }
         if(lowerBody.type == 5 || lowerBody.type == 6)
         {
            _loc1_++;
         }
         if(countCocksOfType(CockTypesEnum.DEMON) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function deerScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 17)
         {
            _loc1_++;
         }
         if(tail.type == 24)
         {
            _loc1_++;
         }
         if(face.type == 23)
         {
            _loc1_++;
         }
         if(lowerBody.type == 21)
         {
            _loc1_++;
         }
         if(horns.type == 5 && horns.value >= 4)
         {
            _loc1_++;
         }
         if(_loc1_ >= 2 && hasFur())
         {
            _loc1_++;
         }
         if(_loc1_ >= 3 && countCocksOfType(CockTypesEnum.HORSE) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function damageHunger(param1:Number = 0) : void
      {
         var _loc2_:Number = hunger;
         hunger -= param1;
         if(hunger < 0)
         {
            hunger = 0;
         }
         if(hunger < _loc2_)
         {
            get_game().mainView.statsView.showStatDown("hunger");
         }
         if(int([DynStat.Lust(0),DynStat.NoScale].length) == 0)
         {
            get_game().player.dynStats();
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 1)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 2)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 3)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 4)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 5)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 6)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 7)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 8)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 9)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 10)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 11)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 12)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 13)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 14)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 15)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 16)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 17)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 18)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 19)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18]);
         }
         else
         {
            if(int([DynStat.Lust(0),DynStat.NoScale].length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18],[DynStat.Lust(0),DynStat.NoScale][19]);
         }
      }
      
      public function cuntChange(param1:Number, param2:Boolean, param3:Boolean = false, param4:Boolean = true) : Boolean
      {
         if(int(vaginas.length) == 0)
         {
            return false;
         }
         var _loc5_:Boolean = vaginas[0].virgin;
         var _loc6_:Boolean = cuntChangeNoDisplay(param1);
         var _loc7_:Boolean = _loc5_ && !vaginas[0].virgin;
         if(_loc7_)
         {
            lostVirginity = true;
            if(param3)
            {
               outputText("");
            }
            outputText("<b>你的处女膜破裂了，夺走了你的童贞。</b>");
            if(param4)
            {
               outputText("");
            }
         }
         if(param2 && _loc6_)
         {
            if(_loc7_)
            {
               if(!param4)
               {
                  outputText("");
               }
            }
            else if(param3)
            {
               outputText("");
            }
            if(vaginas[0].vaginalLooseness == 5)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "被痛苦地撑得极宽，足以容纳大多数野兽和恶魔。</b>");
            }
            if(vaginas[0].vaginalLooseness == 4)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "被撑得太宽了，以至于一直处于合不拢的状态。</b>");
            }
            if(vaginas[0].vaginalLooseness == 3)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "痛苦地扩张着，阴唇现在宽到微微敞开。</b>");
            }
            if(vaginas[0].vaginalLooseness == 2)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "现在非常松弛。</b>");
            }
            if(vaginas[0].vaginalLooseness == 1)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "现在有点松弛了。</b>");
            }
            if(vaginas[0].vaginalLooseness == 0)
            {
               outputText("<b>你的" + Appearance.vaginaDescript(this,0) + "被撑大到了更正常的尺寸。</b>");
            }
            if(param4)
            {
               outputText("");
            }
         }
         return _loc6_;
      }
      
      public function cowScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 3)
         {
            _loc1_++;
         }
         if(tail.type == 4)
         {
            _loc1_++;
         }
         if(horns.type == 2)
         {
            _loc1_++;
         }
         if(face.type == 0 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(face.type == 3)
         {
            _loc1_--;
         }
         if(lowerBody.type == 1 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(get_tallness() >= 73 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(vaginas.length) > 0 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(biggestTitSize() > 4 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(biggestLactation() > 2 && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      override public function corruptionTolerance() : Number
      {
         var _loc1_:int = int(perkv1(PerkLib.AscensionTolerance) * 5 * (1 - perkv2(PerkLib.AscensionTolerance)));
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2995) > 0)
         {
            _loc1_ += 100;
         }
         return _loc1_;
      }
      
      public function consumeItem(param1:ItemType, param2:int = 1) : Boolean
      {
         var _loc3_:* = null as ItemSlot;
         if(!hasItem(param1,param2))
         {
            CoC_Settings.error("错误：consumeItem 尝试移除 " + param2 + " 个物品，但玩家只有 " + itemCount(param1) + " 个。");
            return false;
         }
         while(param2 > 0)
         {
            _loc3_ = getLowestSlot(param1);
            if(_loc3_.quantity > param2)
            {
               _loc3_.set_quantity(_loc3_.quantity - param2);
               param2 = 0;
            }
            else
            {
               param2 -= _loc3_.quantity;
               _loc3_.emptySlot();
            }
         }
         return true;
      }
      
      public function cockatriceScore() : Number
      {
         var _loc1_:Number = 0;
         if(ears.type == 21)
         {
            _loc1_++;
         }
         if(tail.type == 29)
         {
            _loc1_++;
         }
         if(lowerBody.type == 28)
         {
            _loc1_++;
         }
         if(face.type == 25)
         {
            _loc1_++;
         }
         if(eyes.type == 8)
         {
            _loc1_++;
         }
         if(arms.type == 7)
         {
            _loc1_++;
         }
         if(antennae.type == 3)
         {
            _loc1_++;
         }
         if(neck.type == 2)
         {
            _loc1_++;
         }
         if(_loc1_ > 2)
         {
            if(tongue.type == 5)
            {
               _loc1_++;
            }
            if(wings.type == 9)
            {
               _loc1_++;
            }
            if(skin.type == 2)
            {
               _loc1_++;
            }
            if(underBody.type == 6)
            {
               _loc1_++;
            }
            if(lizardCocks() > 0)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function clothedOrNakedLower(param1:String, param2:String = undefined) : String
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(get_armorName() != "gear" && (get_armorName() != "lethicite armor" && get_lowerGarmentName() == "nothing") && get_armor().get_id() != get_game().armors.VINARMR.get_id() && !isTaur())
         {
            return param1;
         }
         return param2;
      }
      
      public function clothedOrNaked(param1:String, param2:String = undefined) : String
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(armorDescript() != "gear")
         {
            return param1;
         }
         return param2;
      }
      
      public function clearStatuses() : void
      {
         var _loc3_:* = null as Monster;
         if(hasStatusEffect(StatusEffects.CorrWitchBind))
         {
            removeStatusEffect(StatusEffects.CorrWitchBind);
         }
         if(hasStatusEffect(StatusEffects.ParasiteSlugMusk))
         {
            removeStatusEffect(StatusEffects.ParasiteSlugMusk);
         }
         if(hasStatusEffect(StatusEffects.ParasiteQueen))
         {
            removeStatusEffect(StatusEffects.ParasiteQueen);
         }
         if(hasStatusEffect(StatusEffects.NephilaQueen))
         {
            removeStatusEffect(StatusEffects.NephilaQueen);
         }
         if(hasStatusEffect(StatusEffects.CounterAB))
         {
            removeStatusEffect(StatusEffects.CounterAB);
         }
         if(hasStatusEffect(StatusEffects.Marked))
         {
            removeStatusEffect(StatusEffects.Marked);
         }
         if(hasStatusEffect(StatusEffects.Nothingness))
         {
            removeStatusEffect(StatusEffects.Nothingness);
         }
         if(hasStatusEffect(StatusEffects.ArmorRent))
         {
            removeStatusEffect(StatusEffects.ArmorRent);
         }
         var _loc1_:int = 0;
         var _loc2_:Array = get_game().monsterArray;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_ is NamelessHorror)
            {
               if(hasStatusEffect(StatusEffects.Refashioned))
               {
                  _str = Number(_loc3_.playerStats[0]);
                  _tou = Number(_loc3_.playerStats[1]);
                  _inte = Number(_loc3_.playerStats[2]);
                  _spe = Number(_loc3_.playerStats[3]);
                  removeStatusEffect(StatusEffects.Refashioned);
               }
               if(hasStatusEffect(StatusEffects.Revelation))
               {
                  removeStatusEffect(StatusEffects.Revelation);
                  set_short(_loc3_.originalName);
               }
            }
         }
         if(hasStatusEffect(StatusEffects.Resolve))
         {
            removeStatusEffect(StatusEffects.Resolve);
         }
         if(hasStatusEffect(StatusEffects.Leeching))
         {
            removeStatusEffect(StatusEffects.Leeching);
         }
         if(hasStatusEffect(StatusEffects.SentinelNoTease))
         {
            removeStatusEffect(StatusEffects.SentinelNoTease);
         }
         if(hasStatusEffect(StatusEffects.SentinelOmniSilence))
         {
            removeStatusEffect(StatusEffects.SentinelOmniSilence);
         }
         if(hasStatusEffect(StatusEffects.SentinelPhysicalDisabled))
         {
            removeStatusEffect(StatusEffects.SentinelPhysicalDisabled);
         }
         if(hasStatusEffect(StatusEffects.Soulburst))
         {
            removeStatusEffect(StatusEffects.Soulburst);
         }
         if(hasStatusEffect(StatusEffects.Apotheosis))
         {
            removeStatusEffect(StatusEffects.Apotheosis);
         }
         if(hasStatusEffect(StatusEffects.WaitReadiness))
         {
            removeStatusEffect(StatusEffects.WaitReadiness);
         }
         if(hasStatusEffect(StatusEffects.Might))
         {
            removeStatusEffect(StatusEffects.Might);
         }
         rearm();
         _loc2_ = statusEffects.slice(0);
         _loc1_ = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            if(statusEffects.indexOf(_loc2_[_loc4_]) >= 0)
            {
               _loc2_[_loc4_].onCombatEnd();
            }
            purgeBleed();
            if(hasStatusEffect(StatusEffects.MinotaurEntangled))
            {
               removeStatusEffect(StatusEffects.MinotaurEntangled);
            }
            _loc4_++;
         }
      }
      
      override public function changeFatigue(param1:Number, param2:Number = 0) : Number
      {
         var _loc3_:Number = get_fatigue();
         param1 = Number(super.changeFatigue(param1,param2));
         if(param1 > 0)
         {
            get_game().mainView.statsView.showStatUp("fatigue");
         }
         if(param1 < 0 && get_fatigue() != _loc3_)
         {
            get_game().mainView.statsView.showStatDown("fatigue");
         }
         if(int([DynStat.Lust(0),DynStat.NoScale].length) == 0)
         {
            get_game().player.dynStats();
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 1)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 2)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 3)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 4)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 5)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 6)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 7)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 8)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 9)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 10)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 11)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 12)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 13)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 14)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 15)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 16)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 17)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 18)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17]);
         }
         else if(int([DynStat.Lust(0),DynStat.NoScale].length) == 19)
         {
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18]);
         }
         else
         {
            if(int([DynStat.Lust(0),DynStat.NoScale].length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_game().player.dynStats([DynStat.Lust(0),DynStat.NoScale][0],[DynStat.Lust(0),DynStat.NoScale][1],[DynStat.Lust(0),DynStat.NoScale][2],[DynStat.Lust(0),DynStat.NoScale][3],[DynStat.Lust(0),DynStat.NoScale][4],[DynStat.Lust(0),DynStat.NoScale][5],[DynStat.Lust(0),DynStat.NoScale][6],[DynStat.Lust(0),DynStat.NoScale][7],[DynStat.Lust(0),DynStat.NoScale][8],[DynStat.Lust(0),DynStat.NoScale][9],[DynStat.Lust(0),DynStat.NoScale][10],[DynStat.Lust(0),DynStat.NoScale][11],[DynStat.Lust(0),DynStat.NoScale][12],[DynStat.Lust(0),DynStat.NoScale][13],[DynStat.Lust(0),DynStat.NoScale][14],[DynStat.Lust(0),DynStat.NoScale][15],[DynStat.Lust(0),DynStat.NoScale][16],[DynStat.Lust(0),DynStat.NoScale][17],[DynStat.Lust(0),DynStat.NoScale][18],[DynStat.Lust(0),DynStat.NoScale][19]);
         }
         get_game().output.statScreenRefresh();
         return param1;
      }
      
      public function catScore() : Number
      {
         var _loc1_:Number = 0;
         if(hasCatFace())
         {
            _loc1_++;
         }
         if(tongue.type == 6)
         {
            _loc1_++;
         }
         if(ears.type == 5)
         {
            _loc1_++;
         }
         if(tail.type == 8)
         {
            _loc1_++;
         }
         if(lowerBody.type == 9)
         {
            _loc1_++;
         }
         if(arms.type == 10)
         {
            _loc1_++;
         }
         if(countCocksOfType(CockTypesEnum.CAT) > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) > 1 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) == 3 && _loc1_ > 0)
         {
            _loc1_++;
         }
         if(int(breastRows.length) > 3)
         {
            _loc1_ -= 2;
         }
         if(hasFur() && _loc1_ > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function canLevelUp() : Boolean
      {
         if(XP >= requiredXP() && level < get_game().levelCap)
         {
            return !get_game().get_inCombat();
         }
         return false;
      }
      
      public function canDisarm() : Boolean
      {
         if(!isDisarmed() && !isUnarmed())
         {
            return !get_weapon().isAttached();
         }
         return false;
      }
      
      public function canDepositEel() : Boolean
      {
         if(hasStatusEffect(StatusEffects.ParasiteEel))
         {
            return statusEffectv1(StatusEffects.ParasiteEel) > 1;
         }
         return false;
      }
      
      public function canBuyStats() : Boolean
      {
         if(statPoints > 0 && !statsMaxed())
         {
            return !get_game().get_inCombat();
         }
         return false;
      }
      
      public function canBuyPerks() : Boolean
      {
         if(perkPoints > 0 && int(PerkTree.availablePerks(this).length) > 0)
         {
            return !get_game().get_inCombat();
         }
         return false;
      }
      
      public function buttChangeDisplay() : void
      {
         if(ass.analLooseness == 5)
         {
            outputText("<b>你的" + Appearance.assholeDescript(this) + "被撑得更宽了，现在甚至能容纳下最巨大的恶魔和野兽。</b>");
         }
         if(ass.analLooseness == 4)
         {
            outputText("<b>你的" + Appearance.assholeDescript(this) + "变得如此松弛，以至于一直处于合不拢的状态。</b>");
         }
         if(ass.analLooseness == 3)
         {
            outputText("<b>你的" + Appearance.assholeDescript(this) + "现在非常松弛。</b>");
         }
         if(ass.analLooseness == 2)
         {
            outputText("<b>你的" + Appearance.assholeDescript(this) + "现在有点松弛了。</b>");
         }
         if(ass.analLooseness == 1)
         {
            outputText("<b>你失去了你的后庭童贞。</b>");
         }
      }
      
      public function buttChange(param1:Number, param2:Boolean, param3:Boolean = true, param4:Boolean = true) : Boolean
      {
         var _loc5_:Boolean = buttChangeNoDisplay(param1);
         if(_loc5_ && param2)
         {
            if(param3)
            {
               outputText("");
            }
            buttChangeDisplay();
            if(param4)
            {
               outputText("");
            }
         }
         return _loc5_;
      }
      
      public function bunnyScore() : Number
      {
         var _loc1_:Number = 0;
         if(face.type == 8)
         {
            _loc1_++;
         }
         if(tail.type == 10)
         {
            _loc1_++;
         }
         if(ears.type == 7)
         {
            _loc1_++;
         }
         if(lowerBody.type == 12)
         {
            _loc1_++;
         }
         if(balls > 2 && _loc1_ > 0)
         {
            _loc1_--;
         }
         if(hasPlainSkin() && _loc1_ > 1)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && antennae.type == 0)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && wings.type == 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function bowSkillToMastery(param1:int) : void
      {
         var _loc2_:int = 0;
         if(param1 < 25)
         {
            _loc2_ = param1 * 4;
            addMastery(MasteryLib.Bow,0,_loc2_,false);
         }
         else if(param1 < 50)
         {
            _loc2_ = (param1 - 25) * 6;
            addMastery(MasteryLib.Bow,1,_loc2_,false);
         }
         else if(param1 < 75)
         {
            _loc2_ = (param1 - 50) * 9;
            addMastery(MasteryLib.Bow,2,_loc2_,false);
         }
         else if(param1 < 100)
         {
            _loc2_ = (param1 - 75) * 13;
            addMastery(MasteryLib.Bow,3,_loc2_,false);
         }
         else if(param1 < 150)
         {
            _loc2_ = (param1 - 100) * 10;
            addMastery(MasteryLib.Bow,4,_loc2_,false);
         }
         else
         {
            addMastery(MasteryLib.Bow,5,0,false);
         }
      }
      
      public function bodyType() : String
      {
         var _loc1_:String = "";
         if(thickness < 10)
         {
            if(tone > 90)
            {
               _loc1_ += "一具布满明显肌肉的柔韧身躯";
            }
            else if(tone > 75)
            {
               _loc1_ += "一副极其纤瘦却肌肉发达的身躯";
            }
            else if(tone > 50)
            {
               _loc1_ += "一具非常纤瘦但有相当不错肌肉线条的身躯";
            }
            else if(tone > 25)
            {
               _loc1_ += "一具柔韧的身躯，只有少许肌肉线条";
            }
            else if(tone > 10)
            {
               _loc1_ += "极度纤瘦的身体，以及柔软有弹性的肉体";
            }
            else
            {
               _loc1_ += "极其纤瘦、看起来弱不禁风的身体";
            }
         }
         else if(thickness < 25)
         {
            if(tone > 90)
            {
               _loc1_ += "纤瘦的身体和惊人的肌肉线条";
            }
            else if(tone > 75)
            {
               _loc1_ += "能展现出你肌肉的纤细身形";
            }
            else if(tone > 50)
            {
               _loc1_ += "略显轻盈的身体和相当明显的肌肉线条";
            }
            else if(tone > 25)
            {
               _loc1_ += "纤细柔软的身体，但仍能看出些许肌肉线条";
            }
            else
            {
               _loc1_ += "纤细柔软的身体";
            }
         }
         else if(thickness < 40)
         {
            if(tone > 90)
            {
               _loc1_ += "健壮而略显纤细的身体，全身肌肉线条分明";
            }
            else if(tone > 75)
            {
               _loc1_ += "比常人更纤细的骨架，以及极佳的肌肉线条";
            }
            else if(tone > 50)
            {
               _loc1_ += "略显纤细的身体，以及相当明显的肌肉";
            }
            else if(tone > 25)
            {
               _loc1_ += "略显纤细的身体，柔和的曲线，以及只有一点点肌肉";
            }
            else
            {
               _loc1_ += "相当纤细的体型和柔软好抱的肉体";
            }
         }
         else if(thickness < 60)
         {
            if(tone > 90)
            {
               _loc1_ += "匀称的体型和轮廓分明的肌肉群";
            }
            else if(tone > 75)
            {
               _loc1_ += "中等体型和发达的肌肉";
            }
            else if(tone > 50)
            {
               _loc1_ += "普通的腰围和相当明显的肌肉";
            }
            else if(tone > 25)
            {
               _loc1_ += "身材普通，肌肤柔软，并不起眼";
            }
            else
            {
               _loc1_ += "普通的身材，肌肤柔软，没有肌肉线条，走起路来肉会晃动";
            }
         }
         else if(thickness < 75)
         {
            if(tone > 90)
            {
               _loc1_ += "略显粗壮的身材，覆盖着块状的肌肉";
            }
            else if(tone > 75)
            {
               _loc1_ += "略显宽阔的身材，肌肉线条非常明显";
            }
            else if(tone > 50)
            {
               _loc1_ += "结实的身材，展现出相当数量的肌肉";
            }
            else if(tone > 25)
            {
               _loc1_ += "略显宽大的骨架，展现出你的曲线，皮下隐约透出肌肉";
            }
            else
            {
               _loc1_ += "柔软丰满的身体，走动时肉感十足";
            }
         }
         else if(thickness < 90)
         {
            if(tone > 90)
            {
               _loc1_ += "粗壮的骨架，让你看起来就像一堵肌肉墙";
            }
            else if(tone > 75)
            {
               _loc1_ += "魁梧的身形和清晰的肌肉线条";
            }
            else if(tone > 50)
            {
               _loc1_ += "结实粗壮的骨架和相当发达的肌肉";
            }
            else if(tone > 25)
            {
               _loc1_ += "宽阔的身体，一些柔软有弹性的肉，以及下面隐藏的一丝肌肉";
            }
            else
            {
               _loc1_ += "宽阔、柔软如垫的身体";
               if(get_gender() >= 2 || biggestTitSize() > 3 || hips.rating > 7 || butt.rating > 7)
               {
                  _loc1_ += "，你的曲线上满是晃动的软肉";
               }
            }
         }
         else if(tone > 90)
         {
            _loc1_ += "极其粗壮的骨架和极其发达的肌肉，别人会发现你比一块巨石还难以撼动";
         }
         else if(tone > 75)
         {
            _loc1_ += "非常宽阔的身体和足以让你看起来像一辆坦克的肌肉";
         }
         else if(tone > 50)
         {
            _loc1_ += "极其结实的骨架，包裹着相当多的肌肉";
         }
         else if(tone > 25)
         {
            _loc1_ += "非常宽阔的身体";
            if(get_gender() >= 2 || biggestTitSize() > 4 || hips.rating > 10 || butt.rating > 10)
            {
               _loc1_ += "，许多曲线优美的肉感，";
            }
            _loc1_ += " 以及隐藏在底下的肌肉线条";
         }
         else
         {
            _loc1_ += "一个厚实的";
            if(get_gender() >= 2 || biggestTitSize() > 4 || hips.rating > 10 || butt.rating > 10)
            {
               _loc1_ += "、性感的";
            }
            _loc1_ += "身体和柔软、";
            if(get_gender() >= 2 || biggestTitSize() > 4 || hips.rating > 10 || butt.rating > 10)
            {
               _loc1_ += "摇晃的曲线";
            }
            else
            {
               _loc1_ += "柔软的肉体";
            }
         }
         return _loc1_;
      }
      
      override public function bleedDamage(param1:Boolean = false, param2:Boolean = false) : int
      {
         var _loc3_:Number = Utils.randBetween(2,5);
         if(param1)
         {
            _loc3_ = 5;
         }
         if(param2)
         {
            _loc3_ = 2;
         }
         _loc3_ *= bleedIntensity();
         return int(maxHP() * _loc3_ / 100);
      }
      
      public function beeScore() : Number
      {
         var _loc1_:Number = 0;
         if(hair.color == "shiny black")
         {
            _loc1_++;
         }
         if(hair.color == "black and yellow")
         {
            _loc1_ += 2;
         }
         if(antennae.type == 2)
         {
            _loc1_++;
            if(face.type == 0)
            {
               _loc1_++;
            }
         }
         if(arms.type == 3)
         {
            _loc1_++;
         }
         if(lowerBody.type == 7)
         {
            _loc1_++;
            if(int(vaginas.length) == 1)
            {
               _loc1_++;
            }
         }
         if(tail.type == 6)
         {
            _loc1_++;
         }
         if(wings.type == 1)
         {
            _loc1_++;
         }
         if(wings.type == 2)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function batScore() : Number
      {
         var _loc1_:Number = 0;
         if(lowerBody.type == 33)
         {
            _loc1_ += 2;
         }
         if(face.type == 30)
         {
            _loc1_++;
         }
         if(wings.type == 7)
         {
            _loc1_ += 2;
         }
         if(ears.type == 24)
         {
            _loc1_ += 2;
         }
         return _loc1_;
      }
      
      public function autoSleepPerks() : Boolean
      {
         var _loc6_:* = null as PerkType;
         var _loc7_:* = null;
         var _loc8_:* = null as PerkType;
         var _loc9_:* = null as PerkType;
         var _loc10_:* = null;
         var _loc1_:IMap = new ObjectMap();
         _loc1_[PerkLib.KillerInstinct] = {
            "unlock":masteryLevel(MasteryLib.Bow) >= 2,
            "text":"你不仅学会了如何击中目标，还学会了如何击中他们最痛的地方。你的箭矢现在可以造成暴击了！\n(<b>获得特质：杀手本能！</b>)"
         };
         _loc1_[PerkLib.ShieldSlam] = {
            "unlock":masteryLevel(MasteryLib.Shield) >= 4,
            "text":"随着你对盾牌的精通，你已经学会了如何更有效地将其作为武器使用。\n(<b>获得特质：盾牌猛击！</b>)"
         };
         var _loc2_:IMap = _loc1_;
         var _loc3_:IMap = _loc2_;
         var _loc4_:IMap = _loc3_;
         var _loc5_:* = _loc3_.keys();
         while(Boolean(_loc5_.hasNext()))
         {
            _loc6_ = _loc5_.next();
            _loc7_ = _loc4_.get(_loc6_);
            _loc8_ = _loc6_;
            _loc9_ = _loc8_;
            _loc10_ = _loc7_;
            if(Boolean(_loc10_.unlock) && !hasPerk(_loc9_))
            {
               createPerk(_loc9_);
               outputText(_loc10_.text + "[pg]");
               return true;
            }
         }
         return false;
      }
      
      override public function attackOfOpportunity() : void
      {
         outputText("\n你对[themonster]的动作反应迅速，在[monster.he]与你拉开距离时攻击了[monster.him]！\n");
         get_game().combat.performRegularAttack(0);
      }
      
      public function armorMiscBonuses() : Number
      {
         var _loc1_:Number = 0;
         if(hasStatusEffect(StatusEffects.TFPlate))
         {
            _loc1_ += statusEffectv1(StatusEffects.TFPlate);
         }
         if(hasPerk(PerkLib.ThickSkin))
         {
            _loc1_ += 2;
         }
         if(hasFur())
         {
            _loc1_++;
         }
         if(hasReptileScales())
         {
            _loc1_ += 3;
         }
         if(hasDragonScales())
         {
            _loc1_ += 3;
         }
         if(rearBody.type == 4)
         {
            _loc1_ += 3;
         }
         if(skin.type == 11)
         {
            _loc1_ += 2;
         }
         if(skin.adj == "smooth")
         {
            _loc1_++;
         }
         if(arms.type == 2)
         {
            _loc1_ += 2;
         }
         if(lowerBody.type == 15 || lowerBody.type == 7)
         {
            _loc1_ += 2;
         }
         if(get_armor() == get_game().armors.SAMUARM && get_weapon().isKatana())
         {
            _loc1_ += 2;
         }
         var _loc2_:int = 0;
         _loc2_ += int(getAgiSpeedBonus());
         if(hasPerk(PerkLib.Juggernaut) && get_tou() >= 75 && get_armorPerk() == "Heavy")
         {
            _loc2_ += 10;
         }
         return _loc1_ + _loc2_;
      }
      
      public function armorDescript(param1:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "gear";
         }
         var _loc2_:Array = [];
         var _loc3_:String = "";
         if(get_armor() != ArmorLib.NOTHING)
         {
            _loc2_.push(Utils.cnName(get_armor().get_name()));
         }
         if(get_upperGarment() != UndergarmentLib.NOTHING)
         {
            _loc2_.push(Utils.cnName(get_upperGarmentName()));
         }
         if(get_lowerGarment() != UndergarmentLib.NOTHING)
         {
            _loc2_.push(Utils.cnName(get_lowerGarmentName()));
         }
         if(int(_loc2_.length) > 0)
         {
            _loc3_ = Utils.formatStringArray(_loc2_);
         }
         if(get_upperGarment() == UndergarmentLib.NOTHING && get_lowerGarment() == UndergarmentLib.NOTHING && (get_armor() == ArmorLib.NOTHING || get_armor().get_id() == get_game().armors.VINARMR.get_id()))
         {
            _loc3_ = param1;
         }
         return _loc3_;
      }
      
      public function addToWornClothesArray(param1:Armor) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < int(previouslyWornClothes.length))
         {
            if(previouslyWornClothes[_loc2_] == param1.get_shortName())
            {
               return;
            }
            _loc2_++;
         }
         previouslyWornClothes.push(param1.get_shortName());
      }
      
      public function abilityAvailable(param1:Either, param2:Object = undefined) : Boolean
      {
         var _loc3_:* = null as IMap;
         var _loc4_:* = null as String;
         var _loc5_:* = null as IMap;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as CombatAbility;
         if(param2 == null)
         {
            param2 = {};
         }
         if(param2.inCombat == null)
         {
            param2.inCombat = false;
         }
         if(param2.ignoreLust == null)
         {
            param2.ignoreLust = false;
         }
         if(param2.ignoreFatigue == null)
         {
            param2.ignoreFatigue = false;
         }
         if(!param2.inCombat)
         {
            get_game().combat.combatAbilities.setSpells();
         }
         switch(param1.index)
         {
            case 0:
               _loc4_ = param1.params[0];
               _loc5_ = new StringMap();
               if(_loc4_ in StringMap.reserved)
               {
                  _loc5_.setReserved(_loc4_,true);
               }
               else
               {
                  _loc5_.h[_loc4_] = true;
               }
               _loc3_ = _loc5_;
               break;
            case 1:
               _loc6_ = param1.params[0];
               _loc5_ = new StringMap();
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc4_ = _loc6_[_loc7_];
                  _loc7_++;
                  if(_loc4_ in StringMap.reserved)
                  {
                     _loc5_.setReserved(_loc4_,true);
                  }
                  else
                  {
                     _loc5_.h[_loc4_] = true;
                  }
               }
               _loc3_ = _loc5_;
         }
         _loc7_ = 0;
         _loc6_ = get_game().combat.combatAbilities.allAbilities;
         while(_loc7_ < int(_loc6_.length))
         {
            _loc8_ = _loc6_[_loc7_];
            _loc7_++;
            _loc4_ = _loc8_.ID;
            if((_loc4_ in StringMap.reserved ? Boolean(_loc3_.existsReserved(_loc4_)) : _loc4_ in _loc3_.h) && _loc8_.canUse(param2.inCombat,param2.ignoreFatigue,param2.ignoreLust))
            {
               return true;
            }
         }
         return false;
      }
      
      override public function HPChangeNotify(param1:Number) : void
      {
         if(param1 == 0)
         {
            if(get_HP() >= maxHP())
            {
               outputText("你现在非常健康。[pg]");
            }
         }
         else if(param1 > 0)
         {
            if(get_HP() >= maxHP())
            {
               outputText("你的生命值已达到上限 " + maxHP() + "。[pg]");
            }
            else
            {
               outputText("你恢复了 <b><font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + int(param1) + "</font></b> 点生命值。[pg]");
            }
         }
         else if(get_HP() <= 0)
         {
            outputText("你受到了 <b><font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + int(param1 * -1) + "</font></b> 点伤害，生命值降至0。[pg]");
         }
         else
         {
            outputText("你受到了 <b><font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + int(param1 * -1) + "</font></b> 点伤害。[pg]");
         }
      }
   }
}

