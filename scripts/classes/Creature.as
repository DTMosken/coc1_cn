package classes
{
   import classes._BonusDerivedStats.BonusStat_Impl_;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Antennae;
   import classes.bodyParts.Arms;
   import classes.bodyParts.Beard;
   import classes.bodyParts.Butt;
   import classes.bodyParts.Ears;
   import classes.bodyParts.Eyes;
   import classes.bodyParts.Face;
   import classes.bodyParts.Gills;
   import classes.bodyParts.Hair;
   import classes.bodyParts.Hips;
   import classes.bodyParts.Horns;
   import classes.bodyParts.LowerBody;
   import classes.bodyParts.Neck;
   import classes.bodyParts.RearBody;
   import classes.bodyParts.Skin;
   import classes.bodyParts.Tail;
   import classes.bodyParts.Tongue;
   import classes.bodyParts.Udder;
   import classes.bodyParts.UnderBody;
   import classes.bodyParts.Wings;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.lists.BodyPartLists;
   import classes.lists.PerkLists;
   import classes.scenes.camp.TrainingDummy;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.CombatBonusStatBuff;
   import classes.statusEffects.combat.CombatInteBuff;
   import classes.statusEffects.combat.CombatSpeBuff;
   import classes.statusEffects.combat.CombatStrBuff;
   import classes.statusEffects.combat.CombatTouBuff;
   import flash.Boot;
   import flash.errors.IllegalOperationError;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.iterators.MapKeyValueIterator;
   
   public class Creature
   {
      
      public var wings:Wings;
      
      public var vaginas:Array;
      
      public var underBody:UnderBody;
      
      public var udder:Udder;
      
      public var tonguePierced:Number;
      
      public var tonguePShort:String;
      
      public var tonguePLong:String;
      
      public var tongue:Tongue;
      
      public var tail:Tail;
      
      public var statusEffects:Array;
      
      public var startingAge:int;
      
      public var skin:Skin;
      
      public var sens:Number;
      
      public var rearBody:RearBody;
      
      public var nosePierced:Number;
      
      public var nosePShort:String;
      
      public var nosePLong:String;
      
      public var nipplesPierced:Number;
      
      public var nipplesPShort:String;
      
      public var nipplesPLong:String;
      
      public var nippleLength:Number;
      
      public var neck:Neck;
      
      public var lowerBody:LowerBody;
      
      public var lipPierced:Number;
      
      public var lipPShort:String;
      
      public var lipPLong:String;
      
      public var lib:Number;
      
      public var level:Number;
      
      public var isUnfocused:Boolean;
      
      public var isSilenced:Boolean;
      
      public var isPrude:Boolean;
      
      public var isImmobilized:Boolean;
      
      public var isFlying:Boolean;
      
      public var isCrippled:Boolean;
      
      public var isCornered:Boolean;
      
      public var isClumsy:Boolean;
      
      public var isAtrophied:Boolean;
      
      public var horns:Horns;
      
      public var hips:Hips;
      
      public var hair:Hair;
      
      public var gills:Gills;
      
      public var fertility:Number;
      
      public var face:Face;
      
      public var eyes:Eyes;
      
      public var eyebrowPierced:Number;
      
      public var eyebrowPShort:String;
      
      public var eyebrowPLong:String;
      
      public var extraDistance:int;
      
      public var evasionRoll:Number;
      
      public var earsPierced:Number;
      
      public var earsPShort:String;
      
      public var earsPLong:String;
      
      public var ears:Ears;
      
      public var distance:CombatDistance;
      
      public var cumMultiplier:Number;
      
      public var cor:Number;
      
      public var cocks:Array;
      
      public var butt:Butt;
      
      public var breastRows:Array;
      
      public var bonusStats:IMap;
      
      public var beard:Beard;
      
      public var balls:Number;
      
      public var ballSize:Number;
      
      public var ass:Ass;
      
      public var arms:Arms;
      
      public var antennae:Antennae;
      
      public var ageStats:BonusDerivedStats;
      
      public var age:int;
      
      public var additionalXP:Number;
      
      public var _weaponVerb:String;
      
      public var _weaponValue:Number;
      
      public var _weaponPerk:Array;
      
      public var _weaponName:String;
      
      public var _weaponAttack:Number;
      
      public var _weaponAcc:Number;
      
      public var _upperGarmentValue:Number;
      
      public var _upperGarmentPerk:String;
      
      public var _upperGarmentName:String;
      
      public var _tou:Number;
      
      public var _tallness:Number;
      
      public var _str:Number;
      
      public var _spe:Number;
      
      public var _short:String;
      
      public var _shieldValue:Number;
      
      public var _shieldPerk:String;
      
      public var _shieldName:String;
      
      public var _shieldBlock:Number;
      
      public var _race:String;
      
      public var _perks:Array;
      
      public var _masteries:Array;
      
      public var _lust:Number;
      
      public var _lowerGarmentValue:Number;
      
      public var _lowerGarmentPerk:String;
      
      public var _lowerGarmentName:String;
      
      public var _jewelry__classes_Creature:Jewelry;
      
      public var _jewelryValue:Number;
      
      public var _jewelryPerk:String;
      
      public var _jewelryName:String;
      
      public var _jewelryEffectMagnitude:Number;
      
      public var _jewelryEffectId:Number;
      
      public var _inte:Number;
      
      public var _hoursSinceCum:Number;
      
      public var _gems:int;
      
      public var _fireRes:Number;
      
      public var _femininity:Number;
      
      public var _fatigue:Number;
      
      public var _armorValue:Number;
      
      public var _armorPerk:String;
      
      public var _armorName:String;
      
      public var _armorDef:Number;
      
      public var _a:String;
      
      public var _HP:Number;
      
      public var XP:Number;
      
      public var TEEN_MODIFIERS:BonusDerivedStats;
      
      public var FATIGUE_PHYSICAL:int;
      
      public var FATIGUE_NONE:int;
      
      public var FATIGUE_MAGICAL_HEAL:int;
      
      public var FATIGUE_MAGICAL:int;
      
      public var EVASION_UNHINDERED:String;
      
      public var EVASION_SPEED:String;
      
      public var EVASION_MISDIRECTION:String;
      
      public var EVASION_FLEXIBILITY:String;
      
      public var EVASION_EVADE:String;
      
      public var EVASION_BLIND:String;
      
      public var ELDER_MODIFIERS:BonusDerivedStats;
      
      public var CHILD_MODIFIERS:BonusDerivedStats;
      
      public var ADULT_MODIFIERS:BonusDerivedStats;
      
      public function Creature()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         extraDistance = 0;
         isImmobilized = false;
         isCornered = false;
         isPrude = false;
         isAtrophied = false;
         isClumsy = false;
         isUnfocused = false;
         isCrippled = false;
         isSilenced = false;
         evasionRoll = 0;
         EVASION_BLIND = "Blind";
         EVASION_UNHINDERED = "Unhindered";
         EVASION_MISDIRECTION = "Misdirection";
         EVASION_FLEXIBILITY = "Flexibility";
         EVASION_EVADE = "Evade";
         EVASION_SPEED = "Speed";
         isFlying = false;
         FATIGUE_MAGICAL_HEAL = 3;
         FATIGUE_PHYSICAL = 2;
         FATIGUE_MAGICAL = 1;
         FATIGUE_NONE = 0;
         _masteries = [];
         bonusStats = new StringMap();
         _femininity = 50;
         ass = new Ass();
         breastRows = [];
         nippleLength = 0.25;
         fertility = 10;
         vaginas = [];
         _hoursSinceCum = 0;
         ballSize = 0;
         cumMultiplier = 1;
         balls = 0;
         cocks = [];
         nosePLong = "";
         nosePShort = "";
         nosePierced = 0;
         earsPLong = "";
         earsPShort = "";
         earsPierced = 0;
         eyebrowPLong = "";
         eyebrowPShort = "";
         eyebrowPierced = 0;
         tonguePLong = "";
         tonguePShort = "";
         tonguePierced = 0;
         lipPLong = "";
         lipPShort = "";
         lipPierced = 0;
         nipplesPLong = "";
         nipplesPShort = "";
         nipplesPierced = 0;
         udder = new Udder();
         wings = new Wings();
         underBody = new UnderBody();
         tongue = new Tongue();
         tail = new Tail();
         skin = new Skin();
         rearBody = new RearBody();
         neck = new Neck();
         lowerBody = new LowerBody();
         horns = new Horns();
         hips = new Hips();
         hair = new Hair();
         gills = new Gills();
         eyes = new Eyes();
         ears = new Ears();
         butt = new Butt();
         beard = new Beard();
         antennae = new Antennae();
         _tallness = 0;
         additionalXP = 0;
         _gems = 0;
         level = 0;
         XP = 0;
         _fatigue = 0;
         _lust = 0;
         _HP = 0;
         distance = CombatDistance.Melee;
         ELDER_MODIFIERS = new BonusDerivedStats("长者").boost("受到伤害",NumberFunc_Impl_.fromFloat(1.1),true).boost("最大生命值",NumberFunc_Impl_.fromFloat(0.8),true).boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.1),true).boost("经验获取",NumberFunc_Impl_.fromFloat(0.7),true).boost("属性增益",NumberFunc_Impl_.fromFloat(0.7),true).boost("属性减少",NumberFunc_Impl_.fromFloat(0.7),true).boost("最低性欲",NumberFunc_Impl_.fromInt(-5));
         ADULT_MODIFIERS = new BonusDerivedStats("成年人");
         TEEN_MODIFIERS = new BonusDerivedStats("青少年").boost("经验获取",NumberFunc_Impl_.fromFloat(1.1),true).boost("属性增益",NumberFunc_Impl_.fromFloat(1.1),true).boost("属性减少",NumberFunc_Impl_.fromFloat(1.1),true).boost("腐化增加",NumberFunc_Impl_.fromFloat(1.15),true).boost("腐化降低",NumberFunc_Impl_.fromFloat(1.15),true).boost("最低性欲",NumberFunc_Impl_.fromInt(5));
         CHILD_MODIFIERS = new BonusDerivedStats("儿童").boost("受到伤害",NumberFunc_Impl_.fromFloat(1.1),true).boost("物理伤害",NumberFunc_Impl_.fromFloat(0.85),true).boost("最大生命值",NumberFunc_Impl_.fromInt(-15)).boost("最大生命值",NumberFunc_Impl_.fromFloat(0.8),true).boost("最大疲劳度",NumberFunc_Impl_.fromInt(-10)).boost("欲望抗性",NumberFunc_Impl_.fromInt(10)).boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.4),true).boost("经验获取",NumberFunc_Impl_.fromFloat(1.2),true).boost("属性增益",NumberFunc_Impl_.fromFloat(1.15),true).boost("属性减少",NumberFunc_Impl_.fromFloat(1.15),true).boost("腐化增加",NumberFunc_Impl_.fromFloat(1.15),true).boost("腐化降低",NumberFunc_Impl_.fromFloat(1.15),true).boost("最低性欲",NumberFunc_Impl_.fromInt(-14)).boost("最低敏感度",NumberFunc_Impl_.fromInt(-5));
         ageStats = new BonusDerivedStats();
         age = 0;
         startingAge = 0;
         _fireRes = 1;
         cor = 0;
         sens = 0;
         lib = 0;
         _inte = 0;
         _spe = 0;
         _tou = 0;
         _str = 0;
         _lowerGarmentValue = 0;
         _lowerGarmentPerk = "";
         _lowerGarmentName = "";
         _upperGarmentValue = 0;
         _upperGarmentPerk = "";
         _upperGarmentName = "";
         _shieldValue = 0;
         _shieldPerk = "";
         _shieldBlock = 0;
         _shieldName = "";
         _jewelryValue = 0;
         _jewelryPerk = "";
         _jewelryEffectMagnitude = 0;
         _jewelryEffectId = 0;
         _jewelryName = "";
         _armorValue = 0;
         _armorPerk = "";
         _armorDef = 0;
         _armorName = "";
         _weaponAcc = 0;
         _weaponValue = 0;
         _weaponPerk = [];
         _weaponAttack = 0;
         _weaponVerb = "";
         _weaponName = "";
         _jewelry__classes_Creature = JewelryLib.NOTHING;
         _race = "";
         _a = "";
         _short = "你";
         _perks = [];
         statusEffects = [];
         arms = new Arms(this);
         face = new Face(this);
         TEEN_MODIFIERS.boost("欲望抗性",NumberFunc_Impl_.fromIntFun(teenLustMod));
         ELDER_MODIFIERS.boost("物理伤害",NumberFunc_Impl_.fromFloatFun(elderPhysMod),true);
      }
      
      public function wolfCocks() : int
      {
         return countCocksOfType(CockTypesEnum.WOLF);
      }
      
      public function willCuntBeStretched(param1:Number) : Boolean
      {
         if(int(vaginas.length) == 0)
         {
            return false;
         }
         return vaginas[0].willStretch(param1,hasPerk(PerkLib.FerasBoonMilkingTwat),vaginalCapacityBonus());
      }
      
      public function wetnessDescript(param1:int) : String
      {
         return Appearance.wetnessDescript(this,param1);
      }
      
      public function wetness() : Number
      {
         if(int(vaginas.length) == 0)
         {
            return 0;
         }
         return vaginas[0].vaginalWetness;
      }
      
      public function weaponCanParry() : Boolean
      {
         return true;
      }
      
      public function wasTeen() : Boolean
      {
         return startingAge == 2;
      }
      
      public function wasElder() : Boolean
      {
         return startingAge == 3;
      }
      
      public function wasChild() : Boolean
      {
         return startingAge == 1;
      }
      
      public function wasAdult() : Boolean
      {
         return startingAge == 0;
      }
      
      public function virilityQ() : int
      {
         var _loc4_:* = null;
         if(!hasCock())
         {
            return 0;
         }
         var _loc1_:int = 0;
         _loc1_ += int(Math.floor(cumQ() / 100));
         var _loc2_:Array = [{
            "perk":PerkLib.BroBody,
            "value":5
         },{
            "perk":PerkLib.MaraesGiftStud,
            "value":15
         },{
            "perk":PerkLib.FerasBoonAlpha,
            "value":10
         },{
            "perk":PerkLib.FertilityPlus,
            "value":3
         },{
            "perk":PerkLib.PiercedFertite,
            "value":3
         },{
            "perk":PerkLib.OneTrackMind,
            "value":3
         },{
            "perk":PerkLib.MothBedding,
            "value":10
         },{
            "perk":PerkLib.MessyOrgasms,
            "value":3
         },{
            "perk":PerkLib.SatyrSexuality,
            "value":10
         }];
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc3_];
            _loc3_++;
            if(hasPerk(_loc4_.perk))
            {
               _loc1_ += int(_loc4_.value);
            }
         }
         if(perkv1(PerkLib.ElvenBounty) > 0)
         {
            _loc1_ += 5;
         }
         if(hasPerk(PerkLib.FertilityMinus) && get_lib100() < 25)
         {
            _loc1_ -= 3;
         }
         if(hasPerk(PerkLib.MagicalVirility))
         {
            _loc1_ += int(5 + perkv1(PerkLib.MagicalVirility));
         }
         if(get_jewelryEffectId() == 2)
         {
            _loc1_ += int(get_jewelryEffectMagnitude());
         }
         if(hasPerk(PerkLib.AscensionVirility))
         {
            _loc1_ += int(perkv1(PerkLib.AscensionVirility) * 5);
         }
         if(get_inRut())
         {
            _loc1_ += 10;
         }
         return Utils.boundInt(0,_loc1_,100);
      }
      
      public function validate() : String
      {
         var _loc4_:* = null as Cock;
         var _loc5_:* = null as Vagina;
         var _loc6_:* = null as BreastRow;
         var _loc1_:String = "";
         _loc1_ += Utils.validateNonNegativeNumberFields(this,"Monster.validate",["balls","ballSize","cumMultiplier","hoursSinceCum","tallness","hips.rating","butt.rating","lowerBody.type","arms.type","skin.type","hair.length","hair.type","face.type","ears.type","tongue.type","eyes.type","str","tou","spe","inte","lib","sens","cor","weaponValue","armorValue","lust","fatigue","level","gems","tail.venom","tail.recharge","horns.value","HP","XP"]);
         _loc1_ += Utils.validateNonEmptyStringFields(this,"Monster.validate",["short","skin.desc","weaponName","weaponVerb","armorName"]);
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.validate();
         }
         _loc2_ = 0;
         _loc3_ = vaginas;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc5_.validate();
         }
         _loc2_ = 0;
         _loc3_ = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc6_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc6_.validate();
         }
         _loc1_ += ass.validate();
         if(balls > 0 && ballSize <= 0)
         {
            _loc1_ += "有睾丸，但ballSize = " + ballSize + "。";
         }
         if(ballSize > 0 && balls <= 0)
         {
            _loc1_ += "没有睾丸，但ballSize = " + ballSize + "。";
         }
         if(hair.length <= 0)
         {
            if(hair.type != 0)
            {
               _loc1_ += "没有头发，但hairType = " + hair.type + "。";
            }
         }
         if(tail.type == 0)
         {
            if(tail.venom != 0)
            {
               _loc1_ += "没有尾巴，但tailVenom = " + tail.venom + "。";
            }
         }
         if(horns.type == 0)
         {
            if(horns.value > 0)
            {
               _loc1_ += "horns.value > 0，但 horns.type = Horns.NONE。";
            }
         }
         else if(horns.value == 0)
         {
            _loc1_ += "有角，但其数量\'horns\' = 0。";
         }
         return _loc1_;
      }
      
      public function vaginalCapacityBonus() : Number
      {
         var _loc1_:Number = 0;
         if(!hasVagina())
         {
            return 0;
         }
         if(isTaur())
         {
            _loc1_ += 50;
         }
         else if(lowerBody.type == 3 || lowerBody.type == 32)
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.WetPussy))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.HistorySlut))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.OneTrackMind))
         {
            _loc1_ += 10;
         }
         if(hasPerk(PerkLib.Cornucopia))
         {
            _loc1_ += 30;
         }
         if(hasPerk(PerkLib.FerasBoonWideOpen))
         {
            _loc1_ += 25;
         }
         if(hasPerk(PerkLib.FerasBoonMilkingTwat))
         {
            _loc1_ += 40;
         }
         if(hasStatusEffect(StatusEffects.ParasiteEel))
         {
            _loc1_ = 10 * statusEffectv1(StatusEffects.ParasiteEel);
         }
         return _loc1_ + statusEffectv1(StatusEffects.BonusVCapacity);
      }
      
      public function vaginalCapacity() : Number
      {
         if(!hasVagina())
         {
            return 0;
         }
         var _loc1_:Number = vaginalCapacityBonus();
         return vaginas[0].capacity(_loc1_);
      }
      
      public function vaginaType(param1:int = -1) : int
      {
         if(!hasVagina())
         {
            return -1;
         }
         if(param1 != -1)
         {
            vaginas[0].type = param1;
         }
         return vaginas[0].type;
      }
      
      public function vaginaDescript(param1:int = 0) : String
      {
         return Appearance.vaginaDescript(this,param1);
      }
      
      public function updateUnarmed() : void
      {
      }
      
      public function updateBleed() : void
      {
      }
      
      public function unfocus() : void
      {
         isUnfocused = true;
      }
      
      public function totalNipples() : Number
      {
         var _loc4_:* = null as BreastRow;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.breasts * _loc4_.nipplesPerBreast;
         }
         return _loc1_;
      }
      
      public function totalFertility() : Number
      {
         return bonusFertility() + fertility;
      }
      
      public function totalCocks() : int
      {
         return int(cocks.length);
      }
      
      public function totalCockThickness() : Number
      {
         var _loc4_:* = null as Cock;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.cockThickness;
         }
         return _loc1_;
      }
      
      public function totalBreasts() : Number
      {
         var _loc4_:* = null as BreastRow;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.breasts;
         }
         return _loc1_;
      }
      
      public function thinnestCockIndex() : int
      {
         return _cockIndex(function(param1:Cock, param2:Cock):Boolean
         {
            return param1.cockThickness < param2.cockThickness;
         });
      }
      
      public function thickestCockThickness() : Number
      {
         if(int(cocks.length) <= 0)
         {
            return 0;
         }
         var _loc1_:Cock = cocks[thickestCock()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.cockThickness : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function thickestCock() : int
      {
         return _cockIndex(function(param1:Cock, param2:Cock):Boolean
         {
            return param1.cockThickness > param2.cockThickness;
         });
      }
      
      public function teenLustMod() : int
      {
         return int(-10 - (100 - getLustPercentBase()) * 0.25);
      }
      
      public function takeLustDamage(param1:Number, param2:Boolean = true, param3:Boolean = true) : Number
      {
         var _loc4_:Number = get_lust();
         if(param3)
         {
            dynStats(DynStat.Lust(param1));
         }
         else
         {
            dynStats(DynStat.Lust(param1),DynStat.NoScale);
         }
         return Math.round(get_lust() - _loc4_);
      }
      
      public function takeDamage(param1:Number, param2:Boolean = false) : Number
      {
         if(hasStatusEffect(StatusEffects.TFShell))
         {
            return 0;
         }
         set_HP(Utils.boundFloat(0,get_HP() - Math.round(param1),get_HP()));
         if(param1 > 0 && param1 < 1)
         {
            return 1;
         }
         return param1;
      }
      
      public function stun(param1:int = 1, param2:int = 33, param3:int = 100, param4:Boolean = true) : Boolean
      {
         if((!hasPerk(PerkLib.StunImmune) || !param4) && Utils.rand(param3) < param2 && !hasStatusEffect(StatusEffects.Stunned))
         {
            if(hasPerk(PerkLib.SoftSkull))
            {
               param1++;
            }
            createStatusEffect(StatusEffects.Stunned,param1,param4 ? 1 : 0,0,0);
            return true;
         }
         return false;
      }
      
      public function statusEffectv4(param1:StatusEffectType, param2:Number = 0) : Number
      {
         var _loc3_:StatusEffect = statusEffectByType(param1);
         var _loc4_:Object = _loc3_ != null ? _loc3_.value4 : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return param2;
      }
      
      public function statusEffectv3(param1:StatusEffectType, param2:Number = 0) : Number
      {
         var _loc3_:StatusEffect = statusEffectByType(param1);
         var _loc4_:Object = _loc3_ != null ? _loc3_.value3 : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return param2;
      }
      
      public function statusEffectv2(param1:StatusEffectType, param2:Number = 0) : Number
      {
         var _loc3_:StatusEffect = statusEffectByType(param1);
         var _loc4_:Object = _loc3_ != null ? _loc3_.value2 : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return param2;
      }
      
      public function statusEffectv1(param1:StatusEffectType, param2:Number = 0) : Number
      {
         var _loc3_:StatusEffect = statusEffectByType(param1);
         var _loc4_:Object = _loc3_ != null ? _loc3_.value1 : null;
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return param2;
      }
      
      public function statusEffectByType(param1:StatusEffectType) : StatusEffect
      {
         var _loc2_:int = indexOfStatusEffect(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return statusEffects[_loc2_];
      }
      
      public function statusEffect(param1:int) : StatusEffect
      {
         return statusEffects[param1];
      }
      
      public function standardDodgeFunc(param1:Creature, param2:Number = 0) : Number
      {
         return Math.max(Math.min(param1.chanceToHit() + param2 - getEvasionChance(),100),0);
      }
      
      public function spellMod(param1:Boolean = false) : Number
      {
         var _loc2_:Number = 1;
         _loc2_ += getBonusStat("法术修正") / 100;
         if(hasPerk(PerkLib.MysticLearnings) && get_inte() > 100)
         {
            _loc2_ += 0.25;
         }
         if(statusEffectv1(StatusEffects.Resolve) == 5)
         {
            _loc2_ *= statusEffectv3(StatusEffects.Resolve);
         }
         if(statusEffectv1(StatusEffects.Resolve) == 6)
         {
            _loc2_ *= statusEffectv3(StatusEffects.Resolve);
         }
         if(hasStatusEffect(StatusEffects.Apotheosis))
         {
            _loc2_ *= Math.pow(2,statusEffectv1(StatusEffects.Apotheosis));
         }
         _loc2_ *= getBonusStatMultiplicative("法术修正");
         if(hasStatusEffect(StatusEffects.Soulburst) && !param1)
         {
            _loc2_ *= 1 + statusEffectv1(StatusEffects.Soulburst) * 0.5;
         }
         return _loc2_;
      }
      
      public function spellCost(param1:Number) : Number
      {
         var _loc2_:Number = 100;
         _loc2_ += getBonusStat("法术消耗");
         if(hasPerk(PerkLib.BloodMage) && _loc2_ < 50)
         {
            _loc2_ = 50;
         }
         else if(_loc2_ < 25)
         {
            _loc2_ = 25;
         }
         param1 *= _loc2_ / 100;
         if(hasPerk(PerkLib.BloodMage) && param1 < 5)
         {
            param1 = 5;
         }
         else if(param1 < 2)
         {
            param1 = 2;
         }
         param1 *= getBonusStatMultiplicative("法术消耗");
         return Math.round(param1 * 100) / 100;
      }
      
      public function smallestTitSize() : Number
      {
         if(int(breastRows.length) <= 0)
         {
            return -1;
         }
         var _loc1_:BreastRow = breastRows[smallestTitRow()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.breastRating : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return -1;
      }
      
      public function smallestTitRow() : int
      {
         var _loc4_:int = 0;
         if(int(breastRows.length) == 0)
         {
            return -1;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         var _loc3_:int = int(breastRows.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(breastRows[_loc4_].breastRating < breastRows[_loc1_].breastRating)
            {
               _loc1_ = _loc4_;
            }
         }
         return _loc1_;
      }
      
      public function smallestCockLength() : Number
      {
         if(int(cocks.length) <= 0)
         {
            return 0;
         }
         var _loc1_:Cock = cocks[smallestCockIndex()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.cockLength : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function smallestCockIndex2() : int
      {
         if(int(cocks.length) <= 1)
         {
            return 0;
         }
         var _loc1_:Array = cocksBySize();
         return int(_loc1_[int(_loc1_.length) - 2].index);
      }
      
      public function smallestCockIndex() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         var _loc3_:int = int(cocks.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(cockArea(_loc4_) < cockArea(_loc1_))
            {
               _loc1_ = _loc4_;
            }
         }
         return _loc1_;
      }
      
      public function smallestCockArea() : Number
      {
         if(cockTotal() == 0)
         {
            return -1;
         }
         return cockArea(smallestCockIndex());
      }
      
      public function smallestCock() : Number
      {
         return cockArea(smallestCockIndex());
      }
      
      public function skinFurScales() : String
      {
         return skin.skinFurScales();
      }
      
      public function skinDescript(param1:Boolean = false, param2:Boolean = false) : String
      {
         return skin.description(param1,param2);
      }
      
      public function simpleBallsDescript(param1:Boolean = false) : String
      {
         return Appearance.ballsDescription(false,true,this,param1);
      }
      
      public function silence() : void
      {
         isSilenced = true;
      }
      
      public function shortestCockLength() : Number
      {
         if(int(cocks.length) <= 0)
         {
            return 0;
         }
         var _loc1_:Cock = cocks[shortestCockIndex()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.cockLength : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function shortestCockIndex() : int
      {
         return _cockIndex(function(param1:Cock, param2:Cock):Boolean
         {
            return param1.cockLength < param2.cockLength;
         });
      }
      
      public function sheathDescript() : String
      {
         if(hasSheath())
         {
            return "包皮";
         }
         return "根部";
      }
      
      public function sexSwitch(param1:String, param2:String, param3:String = undefined, param4:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param3 == "")
         {
            param3 = param1;
         }
         if(param4 == "")
         {
            param4 = param3;
         }
         switch(get_gender())
         {
            case 0:
               return param4;
            case 1:
               return param1;
            case 2:
               return param2;
            case 3:
               return param3;
            default:
               return "<b>性别错误！</b>";
         }
      }
      
      public function set_weaponVerb(param1:String) : String
      {
         return _weaponVerb = param1;
      }
      
      public function set_weaponValue(param1:Number) : Number
      {
         return _weaponValue = param1;
      }
      
      public function set_weaponPerk(param1:Array) : Array
      {
         return _weaponPerk = param1;
      }
      
      public function set_weaponName(param1:String) : String
      {
         return _weaponName = param1;
      }
      
      public function set_weaponAttack(param1:Number) : Number
      {
         return _weaponAttack = param1;
      }
      
      public function set_weaponAcc(param1:Number) : Number
      {
         return _weaponAcc = param1;
      }
      
      public function set_upperGarmentValue(param1:Number) : Number
      {
         return _upperGarmentValue = param1;
      }
      
      public function set_upperGarmentPerk(param1:String) : String
      {
         return _upperGarmentPerk = param1;
      }
      
      public function set_upperGarmentName(param1:String) : String
      {
         return _upperGarmentName = param1;
      }
      
      public function set_tou(param1:Number) : Number
      {
         return _tou = param1;
      }
      
      public function set_tallness(param1:Number) : Number
      {
         return _tallness = param1;
      }
      
      public function set_str(param1:Number) : Number
      {
         return _str = param1;
      }
      
      public function set_spe(param1:Number) : Number
      {
         return _spe = param1;
      }
      
      public function set_short(param1:String) : String
      {
         return _short = param1;
      }
      
      public function set_shieldValue(param1:Number) : Number
      {
         return _shieldValue = param1;
      }
      
      public function set_shieldPerk(param1:String) : String
      {
         return _shieldPerk = param1;
      }
      
      public function set_shieldName(param1:String) : String
      {
         return _shieldName = param1;
      }
      
      public function set_shieldBlock(param1:Number) : Number
      {
         return _shieldBlock = param1;
      }
      
      public function set_race(param1:String) : String
      {
         return _race = param1;
      }
      
      public function set_lust(param1:Number) : Number
      {
         return _lust = param1;
      }
      
      public function set_lowerGarmentValue(param1:Number) : Number
      {
         return _lowerGarmentValue = param1;
      }
      
      public function set_lowerGarmentPerk(param1:String) : String
      {
         return _lowerGarmentPerk = param1;
      }
      
      public function set_lowerGarmentName(param1:String) : String
      {
         return _lowerGarmentName = param1;
      }
      
      public function set_jewelryValue(param1:Number) : Number
      {
         return _jewelryValue = param1;
      }
      
      public function set_jewelryPerk(param1:String) : String
      {
         return _jewelryPerk = param1;
      }
      
      public function set_jewelryName(param1:String) : String
      {
         return _jewelryName = param1;
      }
      
      public function set_jewelryEffectMagnitude(param1:Number) : Number
      {
         return _jewelryEffectId = param1;
      }
      
      public function set_jewelryEffectId(param1:Number) : Number
      {
         return _jewelryEffectId = param1;
      }
      
      public function set_inte(param1:Number) : Number
      {
         return _inte = param1;
      }
      
      public function set_hoursSinceCum(param1:Number) : Number
      {
         return _hoursSinceCum = param1;
      }
      
      public function set_gems(param1:int) : int
      {
         _gems = Utils.boundInt(0,param1,2147483647);
         return param1;
      }
      
      public function set_fireRes(param1:Number) : Number
      {
         return _fireRes = param1;
      }
      
      public function set_femininity(param1:Number) : Number
      {
         if(param1 > 100)
         {
            param1 = 100;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         return _femininity = param1;
      }
      
      public function set_fatigue(param1:Number) : Number
      {
         return _fatigue = param1;
      }
      
      public function set_armorValue(param1:Number) : Number
      {
         return _armorValue = param1;
      }
      
      public function set_armorPerk(param1:String) : String
      {
         return _armorPerk = param1;
      }
      
      public function set_armorName(param1:String) : String
      {
         return _armorName = param1;
      }
      
      public function set_armorDef(param1:Number) : Number
      {
         return _armorDef = param1;
      }
      
      public function set_age(param1:int) : int
      {
         removeBonusStats(ageStats);
         age = param1;
         ageStats = getAgeModifiers();
         addBonusStats(ageStats);
         return param1;
      }
      
      public function set_a(param1:String) : String
      {
         return _a = param1;
      }
      
      public function set_HP(param1:Number) : Number
      {
         return _HP = param1;
      }
      
      public function setPerkValue(param1:PerkType, param2:int = 1, param3:Number = 0) : void
      {
         var _loc4_:Perk = getPerk(param1);
         if(_loc4_ == null)
         {
            CoC_Settings.error("错误？正在寻找特质 \'" + Std.string(param1) + "\' 以更改数值 " + param2 + "，但玩家没有该特质。");
            return;
         }
         switch(param2)
         {
            case 1:
               _loc4_.value1 = param3;
               break;
            case 2:
               _loc4_.value2 = param3;
               break;
            case 3:
               _loc4_.value3 = param3;
               break;
            case 4:
               _loc4_.value4 = param3;
               break;
            default:
               CoC_Settings.error("setPerkValue(" + param1.get_id() + ", " + param2 + ", " + param3 + ").");
         }
      }
      
      public function setGems(param1:int) : int
      {
         set_gems(Utils.boundInt(0,param1,2147483647));
         get_game().output.statScreenRefresh();
         return get_gems();
      }
      
      public function setFirstCockNotOfType(param1:CockTypesEnum, param2:CockTypesEnum = undefined) : Boolean
      {
         var _loc3_:int = findFirstCockNotOfType(param1);
         if(_loc3_ == -1)
         {
            return false;
         }
         if(param2 == null)
         {
            param2 = param1;
         }
         cocks[_loc3_].set_cockType(param2);
         return true;
      }
      
      public function setEggs(param1:int = 0) : int
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return -1;
         }
         if(hasPerk(PerkLib.SpiderOvipositor))
         {
            setPerkValue(PerkLib.SpiderOvipositor,1,param1);
            if(eggs() > 50)
            {
               setPerkValue(PerkLib.SpiderOvipositor,1,50);
            }
            return int(perkv1(PerkLib.SpiderOvipositor));
         }
         setPerkValue(PerkLib.BeeOvipositor,1,param1);
         if(eggs() > 50)
         {
            setPerkValue(PerkLib.BeeOvipositor,1,50);
         }
         return int(perkv1(PerkLib.BeeOvipositor));
      }
      
      public function setClitLength(param1:Number, param2:int = 0) : Number
      {
         checkVaginaPresent();
         vaginas[param2].clitLength = param1;
         return getClitLength(param2);
      }
      
      public function sackDescript() : String
      {
         return Appearance.sackDescript(this);
      }
      
      public function sMultiCockDesc() : String
      {
         return (int(cocks.length) > 1 ? "你的其中一根" : "你的") + cockMultiLDescriptionShort();
      }
      
      public function restoreHP(param1:Number = 1.79e+308) : void
      {
         if(param1 < 0)
         {
            throw new RangeError("值不能为负数");
         }
         set_HP(get_HP() + param1);
         if(get_HP() > maxHP())
         {
            set_HP(maxHP());
         }
      }
      
      public function resetSeals() : void
      {
         isSilenced = false;
         isCrippled = false;
         isUnfocused = false;
         isClumsy = false;
         isAtrophied = false;
         isPrude = false;
         isCornered = false;
      }
      
      public function removeVagina(param1:int = 0, param2:int = 1) : void
      {
         if(param1 < -1 || param2 <= 0)
         {
            return;
         }
         if(int(vaginas.length) != 0)
         {
            if(param1 <= int(vaginas.length) - 1)
            {
               vaginas.splice(param1,param2);
            }
         }
      }
      
      public function removeStatuses(param1:Boolean) : void
      {
         var _loc2_:Array = statusEffects.splice(0,int(statusEffects.length));
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            removeBonusStats(_loc2_[_loc4_].bonusStats);
            _loc2_[_loc4_].removedFromHostList(param1);
            _loc4_++;
         }
      }
      
      public function removeStatusEffectInstance(param1:StatusEffect) : void
      {
         var _loc2_:int = statusEffects.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         statusEffects.splice(_loc2_,1);
         removeBonusStats(param1.bonusStats);
         param1.removedFromHostList(true);
      }
      
      public function removeStatusEffect(param1:StatusEffectType) : StatusEffect
      {
         var _loc2_:int = indexOfStatusEffect(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         var _loc3_:StatusEffect = statusEffects[_loc2_];
         statusEffects.splice(_loc2_,1);
         removeBonusStats(_loc3_.bonusStats);
         _loc3_.removedFromHostList(true);
         return _loc3_;
      }
      
      public function removePerks() : void
      {
         var _loc3_:* = null as Perk;
         var _loc1_:int = 0;
         var _loc2_:Array = _perks;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            removeBonusStats(_loc3_.get_ptype().bonusStats);
         }
         _perks = [];
      }
      
      public function removePerk(param1:PerkType) : Boolean
      {
         var _loc4_:* = null as Perk;
         var _loc2_:int = int(get_perks().length);
         var _loc3_:Boolean = false;
         while(_loc2_ > 0)
         {
            _loc2_--;
            _loc4_ = _perks[_loc2_];
            if(_loc4_.get_ptype() == param1 && _loc4_.value4 <= 0)
            {
               removeBonusStats(param1.bonusStats);
               _perks.splice(_loc2_,1);
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public function removeMastery(param1:MasteryType) : Boolean
      {
         if(get_numMasteries() <= 0)
         {
            return false;
         }
         var _loc2_:int = 0;
         while(_loc2_ < get_numMasteries())
         {
            if(_masteries[_loc2_].get_mtype() == param1)
            {
               removeBonusStats(_masteries[_loc2_].get_mtype().bonusStats);
               _masteries.splice(_loc2_,1);
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function removeMasteries(param1:Boolean = true) : void
      {
         var _loc5_:* = null as Mastery;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = _masteries;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.get_isPermed() && !param1)
            {
               _loc2_.push(new Mastery(_loc5_.get_mtype(),_loc5_.get_level(),_loc5_.get_xp(),true));
            }
            else
            {
               removeBonusStats(_loc5_.get_mtype().bonusStats);
            }
         }
         _masteries = _loc2_;
      }
      
      public function removeCock(param1:int, param2:int) : void
      {
         var _loc4_:* = null as Cock;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Error;
         if(param1 < 0 || param2 <= 0)
         {
            return;
         }
         if(int(cocks.length) != 0)
         {
            if(param1 <= int(cocks.length) - 1)
            {
               try
               {
                  _loc4_ = cocks[param1];
                  if(_loc4_.sock == "viridian")
                  {
                     removePerk(PerkLib.LustyRegeneration);
                  }
                  else if(_loc4_.sock == "cockring")
                  {
                     _loc5_ = 0;
                     _loc6_ = 0;
                     while(_loc6_ < int(cocks.length))
                     {
                        if(cocks[_loc6_].sock == "cockring")
                        {
                           _loc5_++;
                        }
                        _loc6_++;
                     }
                     if(_loc5_ == 0)
                     {
                        removePerk(PerkLib.PentUp);
                     }
                     else
                     {
                        setPerkValue(PerkLib.PentUp,1,5 + _loc5_ * 5);
                     }
                  }
                  cocks.splice(param1,param2);
               }
               catch(_loc_e_:Error)
               {
                  _loc7_ = _loc_e_;
                  CoC_Settings.error("Creature[" + _short + "] 中出现参数错误: " + _loc7_.message);
               }
            }
         }
      }
      
      public function removeBreastRow(param1:int, param2:int) : void
      {
         if(param1 < -1 || param2 <= 0)
         {
            return;
         }
         if(int(breastRows.length) != 0)
         {
            if(!(int(breastRows.length) == 1 || int(breastRows.length) - param2 < 1))
            {
               if(param1 <= int(breastRows.length) - 1)
               {
                  breastRows.splice(param1,param2);
               }
            }
         }
      }
      
      public function removeBonusStats(param1:BonusDerivedStats) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Bonus;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null as String;
         var _loc8_:* = null as Array;
         var _loc9_:int = 0;
         var _loc2_:* = new MapKeyValueIterator(param1.statArray);
         while(Boolean(_loc2_.hasNext()))
         {
            _loc3_ = _loc2_.next();
            _loc4_ = _loc3_.key;
            _loc5_ = _loc3_.value;
            _loc6_ = bonusStats;
            _loc7_ = _loc4_;
            _loc8_ = _loc7_ in StringMap.reserved ? _loc6_.getReserved(_loc7_) : _loc6_.h[_loc7_];
            if(_loc8_ != null)
            {
               _loc9_ = int(_loc8_.length);
               while(_loc9_-- > 0)
               {
                  if(_loc8_[_loc9_] == _loc5_)
                  {
                     _loc8_.splice(_loc9_,1);
                  }
               }
            }
         }
      }
      
      public function regeneration(param1:Boolean = true, param2:Boolean = true) : Object
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = param1 ? 5 : 10;
         _loc3_ += getBonusStat("生命恢复 (%)");
         _loc4_ += getBonusStat("生命恢复 (固定值)");
         _loc3_ = Utils.boundFloat(-_loc5_,_loc3_,_loc5_);
         if(statusEffectv1(StatusEffects.Resolve) == 1)
         {
            _loc3_ += statusEffectv3(StatusEffects.Resolve);
         }
         if(param2)
         {
            HPChange(Math.round(maxHP() * _loc3_ / 100) + _loc4_,false);
         }
         return {
            "percent":_loc3_,
            "bonus":_loc4_,
            "max":_loc5_
         };
      }
      
      public function reduceDamage(param1:Number, param2:Creature, param3:Number = 0, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false) : int
      {
         var _loc10_:Number = NaN;
         var _loc9_:Number = 1;
         if((get_game().combat.combatCritical(param2,this,param8) || param4) && param5)
         {
            _loc10_ = 1.75;
            _loc10_ *= param2.getBonusStatMultiplicative("暴击伤害");
            param1 *= _loc10_;
            if(!(param2 is Player))
            {
               FlagDict_Impl_.arrayWriteInt(get_flags(),2138,1);
            }
         }
         if(statusEffectv1(StatusEffects.Resolve) == 2)
         {
            _loc9_ *= statusEffectv2(StatusEffects.Resolve);
         }
         if(hasStatusEffect(StatusEffects.Marked))
         {
            _loc9_ *= 1.75;
         }
         if(hasStatusEffect(StatusEffects.ArmorRent))
         {
            _loc9_ *= 1 + statusEffectv1(StatusEffects.ArmorRent) / 100;
         }
         _loc10_ = (100 - damagePercent(param6,param7,param8)) * (1 - param3 * 0.01) * 0.01;
         _loc9_ *= 1 - _loc10_;
         _loc9_ *= getBonusStatMultiplicative("受到伤害");
         if(_loc9_ < 0.195)
         {
            _loc9_ = 0;
         }
         if(hasStatusEffect(StatusEffects.Shielding))
         {
            param1 -= 30;
         }
         if(hasStatusEffect(StatusEffects.Ironflesh))
         {
            param1 -= statusEffectv1(StatusEffects.Ironflesh);
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         return int(param1 * _loc9_);
      }
      
      public function randomCockTooBig(param1:Number = 0, param2:String = undefined) : int
      {
         if(param2 == null)
         {
            param2 = "area";
         }
         var _loc3_:Array = [];
         if(int(cocks.length) <= 0)
         {
            return -1;
         }
         var _loc4_:int = int(cocks.length);
         while(_loc4_ > 0)
         {
            _loc4_--;
            if(param2 == "area")
            {
               if(cockArea(_loc4_) > param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
            else if(param2 == "length")
            {
               if(cocks[_loc4_].cockLength > param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
            else if(param2 == "width")
            {
               if(cocks[_loc4_].cockThickness > param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         if(int(_loc3_.length) > 0)
         {
            return int(_loc3_[Utils.rand(int(_loc3_.length))]);
         }
         return -1;
      }
      
      public function randomCockThatFits(param1:Number = 0, param2:String = undefined) : int
      {
         if(param2 == null)
         {
            param2 = "area";
         }
         var _loc3_:Array = [];
         if(int(cocks.length) <= 0)
         {
            return -1;
         }
         var _loc4_:int = int(cocks.length);
         while(_loc4_ > 0)
         {
            _loc4_--;
            if(param2 == "area")
            {
               if(cockArea(_loc4_) <= param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
            else if(param2 == "length")
            {
               if(cocks[_loc4_].cockLength <= param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
            else if(param2 == "width")
            {
               if(cocks[_loc4_].cockThickness <= param1)
               {
                  _loc3_.push(_loc4_);
               }
            }
         }
         if(int(_loc3_.length) > 0)
         {
            return int(_loc3_[Utils.rand(int(_loc3_.length))]);
         }
         return -1;
      }
      
      public function purgeBleed() : void
      {
         var _loc4_:* = null as StatusEffect;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = statusEffects;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.get_stype() != StatusEffects.IzmaBleed)
            {
               _loc1_.push(_loc4_);
            }
         }
         statusEffects = _loc1_;
      }
      
      public function prude() : void
      {
         isPrude = true;
      }
      
      public function physicalCost(param1:Number) : Number
      {
         var _loc2_:Number = 100;
         if(hasPerk(PerkLib.IronMan))
         {
            _loc2_ -= 50;
         }
         if(isChild())
         {
            _loc2_ *= 1.3;
         }
         if(isElder())
         {
            _loc2_ *= 1.2;
         }
         return param1 * (_loc2_ / 100);
      }
      
      public function physMod() : Number
      {
         var _loc1_:Number = 1;
         _loc1_ *= getBonusStatMultiplicative("物理伤害");
         if(countCockSocks("red") > 0)
         {
            _loc1_ *= 1 + countCockSocks("red") * 0.02;
         }
         return _loc1_;
      }
      
      public function permMastery(param1:MasteryType) : Boolean
      {
         var _loc2_:int = findMastery(param1);
         if(_loc2_ == -1)
         {
            return false;
         }
         if(_masteries[_loc2_].get_isPermed())
         {
            return false;
         }
         return _masteries[_loc2_].perm();
      }
      
      public function perkv4(param1:PerkType) : Number
      {
         var _loc2_:Perk = getPerk(param1);
         var _loc3_:Object = _loc2_ != null ? _loc2_.value4 : null;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return 0;
      }
      
      public function perkv3(param1:PerkType) : Number
      {
         var _loc2_:Perk = getPerk(param1);
         var _loc3_:Object = _loc2_ != null ? _loc2_.value3 : null;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return 0;
      }
      
      public function perkv2(param1:PerkType) : Number
      {
         var _loc2_:Perk = getPerk(param1);
         var _loc3_:Object = _loc2_ != null ? _loc2_.value2 : null;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return 0;
      }
      
      public function perkv1(param1:PerkType) : Number
      {
         var _loc2_:Perk = getPerk(param1);
         var _loc3_:Object = _loc2_ != null ? _loc2_.value1 : null;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return 0;
      }
      
      public function perk(param1:int) : Perk
      {
         return _perks[param1];
      }
      
      public function parryChance() : Number
      {
         var _loc1_:Number = (get_spe() - 50) / 5;
         _loc1_ += getBonusStat("招架几率");
         return _loc1_ * getBonusStatMultiplicative("招架几率");
      }
      
      public function orgasmReal(param1:int = 1, param2:Number = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         dynStats(DynStat.Lust(1 - param2,DynStatOp.Mul),DynStat.NoScale);
         set_hoursSinceCum(0);
         var _loc3_:IMap = get_flags();
         FlagDict_Impl_.arrayWriteInt(_loc3_,2001,FlagDict_Impl_.arrayReadInt(_loc3_,2001) + param1);
         if(get_game().get_inCombat() && get_game().monster != null)
         {
            if(get_game().player.hasPerk(PerkLib.DemonBiology))
            {
               get_game().player.changeFatigue(-get_game().monster.get_lust() / 2);
               get_game().player.refillHunger(get_game().monster.get_lust(),true,false);
            }
            if(get_game().monster.get_gender() == 1)
            {
               var _temp_1:* = get_game().player;
               _temp_1.sexOrientation = _temp_1.sexOrientation + 1;
            }
            if(get_game().monster.get_gender() == 2)
            {
               var _temp_2:* = get_game().player;
               _temp_2.sexOrientation = _temp_2.sexOrientation - 1;
            }
            if(get_game().player.sexOrientation > 100)
            {
               get_game().player.sexOrientation = 100;
            }
            if(get_game().player.sexOrientation < 0)
            {
               get_game().player.sexOrientation = 0;
            }
         }
         if(countCockSocks("gilded") > 0)
         {
            _loc4_ = Utils.rand(int(cocks.length));
            _loc5_ = Utils.rand(cocks[_loc4_].cockThickness) + countCockSocks("gilded");
            get_game().outputText("[pg]你的" + cockDescript(_loc4_) + "感到有些轻微的不适，你把它从[armor]里掏出来检查。<b>经过一番试探性的揉搓和按摩，你成功地从马眼中挤出了 " + _loc5_ + " 颗宝石。</b>[pg]");
            set_gems(get_gems() + _loc5_);
         }
      }
      
      public function orgasm(param1:String = undefined, param2:Boolean = true, param3:int = 1) : void
      {
         if(param1 == null)
         {
            param1 = "Default";
         }
         var _loc4_:Number = 1;
         if(hasStatusEffect(StatusEffects.ParasiteSlugReproduction) && param1 != "Anal")
         {
            _loc4_ = 0;
         }
         var _loc5_:String = param1;
         if(_loc5_ == "All")
         {
            if(hasCock())
            {
               orgasm("Dick");
            }
            if(hasVagina())
            {
               orgasm("Vaginal");
            }
            orgasm("Anal");
            return;
         }
         if(_loc5_ == "Anal")
         {
            if(hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
            }
         }
         else
         {
            if(_loc5_ == "DickAnal")
            {
               orgasm(Utils.rand(2) == 0 ? "Dick" : "Anal",param2);
               return;
            }
            if(_loc5_ == "DickAndAnal")
            {
               orgasm("Anal");
               if(hasCock())
               {
                  orgasm("Dick");
               }
               return;
            }
            if(_loc5_ == "DickVaginal")
            {
               orgasm(hasCock() ? "Dick" : "Vaginal");
               return;
            }
            if(_loc5_ != "Dick")
            {
               if(_loc5_ != "Lips")
               {
                  if(_loc5_ != "Nipples")
                  {
                     if(_loc5_ != "Ovi")
                     {
                        if(_loc5_ != "Tits")
                        {
                           if(_loc5_ != "Vaginal")
                           {
                              if(_loc5_ == "VaginalAnal")
                              {
                                 orgasm(hasVagina() ? "Vaginal" : "Anal",param2);
                                 return;
                              }
                              if(_loc5_ == "VaginalAndAnal")
                              {
                                 orgasm("Anal");
                                 if(hasVagina())
                                 {
                                    orgasm("Vaginal");
                                 }
                                 return;
                              }
                              if(_loc5_ == "VaginalAndDick")
                              {
                                 if(hasCock())
                                 {
                                    orgasm("Dick");
                                 }
                                 if(hasVagina())
                                 {
                                    orgasm("Vaginal");
                                 }
                                 return;
                              }
                              if(!hasVagina() && !hasCock())
                              {
                                 orgasm("Anal");
                                 return;
                              }
                              if(hasVagina() && hasCock())
                              {
                                 orgasm(Utils.rand(2) == 0 ? "Vaginal" : "Dick",param2);
                                 return;
                              }
                              orgasm(hasVagina() ? "Vaginal" : "Dick",param2);
                              return;
                           }
                        }
                     }
                  }
               }
            }
         }
         if(param2)
         {
            orgasmReal(param3,_loc4_);
         }
      }
      
      public function oMultiCockDesc() : String
      {
         return (int(cocks.length) > 1 ? "你的每根" : "你的") + cockMultiLDescriptionShort();
      }
      
      public function nippleDescript(param1:int) : String
      {
         if(param1 == -1)
         {
            param1 = int(breastRows.length) - 1;
         }
         return Appearance.nippleDescription(this,param1);
      }
      
      public function ngPlus(param1:Number, param2:Number = 25) : Number
      {
         return param1 + ascensionFactor(param2);
      }
      
      public function newGamePlusMod() : int
      {
         return int(Math.max(0,Math.min(4,FlagDict_Impl_.arrayReadInt(get_flags(),2979))));
      }
      
      public function multiCockDescriptLight(param1:int = -1) : String
      {
         return Appearance.multiCockDescriptLight(this,param1);
      }
      
      public function multiCockDescript() : String
      {
         return Appearance.multiCockDescript(this);
      }
      
      public function movementChance(param1:Creature) : Number
      {
         var _loc2_:Number = get_spe() / (param1.get_spe() * 2) * 100;
         if(hasPerk(PerkLib.Bloodhound) && param1.isBleeding())
         {
            _loc2_ += 20;
         }
         _loc2_ += getBonusStat("移动几率");
         return Math.round(_loc2_);
      }
      
      public function mostBreastsPerRow() : Number
      {
         var _loc4_:* = null as BreastRow;
         if(int(breastRows.length) == 0)
         {
            return 2;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = Math.max(_loc1_,_loc4_.breasts);
         }
         return _loc1_;
      }
      
      public function modStats(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean, param10:Boolean) : void
      {
         var applyMulti:Function;
         var _gthis:Creature;
         var _loc12_:* = null;
         _gthis = this;
         applyMulti = function(param1:Number, param2:String, param3:String, param4:Boolean = false):Number
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
         var _loc11_:Number = get_hp100();
         if(param10)
         {
            _loc12_ = getAllMaxStats();
         }
         else
         {
            _loc12_ = {
               "str":2147483647,
               "tou":2147483647,
               "spe":2147483647,
               "inte":2147483647,
               "lib":2147483647,
               "sens":2147483647,
               "lust":2147483647,
               "cor":100
            };
         }
         if(param9)
         {
            param1 = Number(applyMulti(param1,"力量增益","力量减少",true));
            param2 = Number(applyMulti(param2,"体质增益","体质损失",true));
            param3 = Number(applyMulti(param3,"速度增益","速度损失",true));
            param4 = Number(applyMulti(param4,"智力增益","智力损失",true));
            param5 = Number(applyMulti(param5,"性欲增加","性欲损失"));
            param6 = Number(applyMulti(param6,"敏感度增加","敏感度损失"));
            param8 = Number(applyMulti(param8,"腐化增加","腐化降低"));
         }
         set_str(Utils.boundFloat(1,get_str() + param1,int(_loc12_.str)));
         set_tou(Utils.boundFloat(1,get_tou() + param2,int(_loc12_.tou)));
         set_spe(Utils.boundFloat(1,get_spe() + param3,int(_loc12_.spe)));
         set_inte(Utils.boundFloat(1,get_inte() + param4,int(_loc12_.inte)));
         lib = Utils.boundFloat(minLib(),lib + param5,int(_loc12_.lib));
         sens = Utils.boundFloat(minSens(),sens + param6,int(_loc12_.sens));
         set_lust(Utils.boundFloat(minLust(),get_lust() + param7,Number(_loc12_.lust)));
         cor = Utils.boundFloat(0,cor + param8,int(_loc12_.cor));
         var _loc13_:Number = maxHP();
         set_HP(Utils.boundFloat(Number(Math.NEGATIVE_INFINITY),_loc11_ * _loc13_ / 100,_loc13_));
      }
      
      public function minSens() : int
      {
         var _loc1_:int = 10;
         _loc1_ += int(getBonusStat("最低敏感度"));
         _loc1_ *= getBonusStatMultiplicative("最低敏感度");
         if(_loc1_ < 1)
         {
            _loc1_ = 1;
         }
         return _loc1_;
      }
      
      public function minLust() : Number
      {
         return 0;
      }
      
      public function minLib() : int
      {
         var _loc1_:int = 1;
         _loc1_ += int(getBonusStat("最低性欲"));
         _loc1_ *= getBonusStatMultiplicative("最低性欲");
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function milked() : void
      {
         if(hasStatusEffect(StatusEffects.LactationReduction))
         {
            changeStatusValue(StatusEffects.LactationReduction,1,0);
         }
         if(hasStatusEffect(StatusEffects.LactationReduc0))
         {
            removeStatusEffect(StatusEffects.LactationReduc0);
         }
         if(hasStatusEffect(StatusEffects.LactationReduc1))
         {
            removeStatusEffect(StatusEffects.LactationReduc1);
         }
         if(hasStatusEffect(StatusEffects.LactationReduc2))
         {
            removeStatusEffect(StatusEffects.LactationReduc2);
         }
         if(hasStatusEffect(StatusEffects.LactationReduc3))
         {
            removeStatusEffect(StatusEffects.LactationReduc3);
         }
         if(hasPerk(PerkLib.Feeder))
         {
            addStatusValue(StatusEffects.Feeder,1,1);
            changeStatusValue(StatusEffects.Feeder,2,0);
         }
      }
      
      public function mfn(param1:String, param2:String, param3:String) : String
      {
         if(get_gender() == 0)
         {
            return param3;
         }
         return mf(param1,param2);
      }
      
      public function mf(param1:String, param2:String) : String
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(hasCock())
         {
            _loc3_++;
         }
         if(hasBalls())
         {
            _loc3_ += 0.5;
         }
         if(hasVagina())
         {
            _loc4_ += 1.5;
         }
         if(get_femininity() < (isFemale() ? 45 : 50))
         {
            _loc3_++;
         }
         if(get_femininity() < (isFemale() ? 25 : 35))
         {
            _loc3_++;
         }
         if(get_femininity() < (isFemale() ? 5 : 10))
         {
            _loc3_++;
         }
         if(get_femininity() > (isMale() ? 55 : 50))
         {
            _loc4_++;
         }
         if(get_femininity() > (isMale() ? 75 : 65))
         {
            _loc4_++;
         }
         if(get_femininity() > (isMale() ? 95 : 90))
         {
            _loc4_++;
         }
         if(biggestTitSize() >= 1)
         {
            _loc4_++;
         }
         if(isHerm())
         {
            _loc4_ += 0.1;
         }
         if(isGenderless())
         {
            _loc3_ += 0.1;
         }
         if(_loc4_ > _loc3_)
         {
            return param2;
         }
         return param1;
      }
      
      public function maxLust() : Number
      {
         var _loc1_:Number = 100;
         if(this == get_game().player && get_game().player.demonScore() >= 4)
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.ImprovedSelfControl))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.ImprovedSelfControl2))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.BroBody) || hasPerk(PerkLib.BimboBody) || hasPerk(PerkLib.FutaForm))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.OmnibusGift))
         {
            _loc1_ += 15;
         }
         if(hasPerk(PerkLib.AscensionDesires))
         {
            _loc1_ += perkv1(PerkLib.AscensionDesires) * 5;
         }
         if(hasPerk(PerkLib.NephilaArchQueen))
         {
            _loc1_ += 40;
         }
         if(_loc1_ > 999)
         {
            _loc1_ = 999;
         }
         return _loc1_;
      }
      
      public function maxHPUnmodified() : Number
      {
         var _loc1_:Number = 0;
         _loc1_ += int(get_tou() * 2 + 50);
         if(hasPerk(PerkLib.Tank))
         {
            _loc1_ += 50;
         }
         if(hasPerk(PerkLib.Tank2))
         {
            _loc1_ += Math.round(get_tou());
         }
         if(hasPerk(PerkLib.Tank3))
         {
            _loc1_ += level * 5;
         }
         _loc1_ += level * 15;
         _loc1_ += getBonusStat("最大生命值");
         if(hasPerk(PerkLib.ChiReflowDefense))
         {
            _loc1_ += 50;
         }
         if(get_jewelryEffectId() == 5)
         {
            _loc1_ += get_jewelryEffectMagnitude();
         }
         _loc1_ *= 1 + countCockSocks("green") * 0.02;
         _loc1_ *= getBonusStatMultiplicative("最大生命值");
         if(hasStatusEffect(StatusEffects.Soulburst))
         {
            _loc1_ /= Math.pow(2,statusEffectv1(StatusEffects.Soulburst));
         }
         return _loc1_;
      }
      
      public function maxHP() : Number
      {
         var _loc1_:Number = maxHPUnmodified();
         if(hasStatusEffect(StatusEffects.Overhealing))
         {
            _loc1_ += statusEffectv1(StatusEffects.Overhealing);
         }
         _loc1_ = Math.round(_loc1_);
         if(_loc1_ > 9999)
         {
            _loc1_ = 9999;
         }
         return _loc1_;
      }
      
      public function maxFatigue() : Number
      {
         var _loc1_:Number = 100;
         _loc1_ += getBonusStat("最大疲劳度");
         if(_loc1_ > 999)
         {
            _loc1_ = 999;
         }
         return _loc1_;
      }
      
      public function masteryXP(param1:MasteryType, param2:int = 0, param3:Boolean = true) : int
      {
         var _loc4_:int = findMastery(param1);
         if(_loc4_ == -1)
         {
            if(param2 <= 0)
            {
               return -1;
            }
            addMastery(param1,0,0,param3);
            _loc4_ = int(_masteries.length) - 1;
         }
         if(get_game().monster is TrainingDummy)
         {
            param2 = int(_masteries[_loc4_].get_level() > 2 ? 0 : int(param2 * 0.2));
         }
         if(param2 != 0)
         {
            _masteries[_loc4_].xpGain(param2,param3);
         }
         return _masteries[_loc4_].get_xp();
      }
      
      public function masteryMaxXP(param1:MasteryType) : int
      {
         if(hasMastery(param1))
         {
            return _masteries[findMastery(param1)].get_maxXP();
         }
         return -1;
      }
      
      public function masteryLevel(param1:MasteryType, param2:int = 0, param3:Boolean = false, param4:Boolean = true) : int
      {
         var _loc5_:int = findMastery(param1);
         if(_loc5_ == -1)
         {
            if(param2 <= 0)
            {
               return -1;
            }
            addMastery(param1,0,0,param4);
            _loc5_ = int(_masteries.length) - 1;
         }
         if(param2 != 0)
         {
            _masteries[_loc5_].levelGain(param2,param3,param4);
         }
         return _masteries[_loc5_].get_level();
      }
      
      public function manWoman(param1:Boolean = false) : String
      {
         if(totalCocks() > 0)
         {
            if(hasVagina())
            {
               if(param1)
               {
                  return "扶她";
               }
               return "扶她";
            }
            if(param1)
            {
               return "男人";
            }
            return "男人";
         }
         if(hasVagina())
         {
            if(param1)
            {
               return "女人";
            }
            return "女人";
         }
         if(param1)
         {
            return "阉人";
         }
         return "太监";
      }
      
      public function maleFemaleHerm(param1:Boolean = false) : String
      {
         var _loc2_:* = null as String;
         switch(get_gender())
         {
            case 0:
               _loc2_ = mf("无性别","女性化无性别");
               break;
            case 1:
               _loc2_ = mf("男性",biggestTitSize() > 1 ? "人妖" : "伪娘");
               break;
            case 2:
               _loc2_ = mf("扶他","女性");
               break;
            case 3:
               _loc2_ = mf("扶他","双性人");
               break;
            default:
               return "<b>性别错误！</b>";
         }
         if(param1)
         {
            return Utils.capitalizeFirstLetter(_loc2_);
         }
         return _loc2_;
      }
      
      public function lustPercentBetween(param1:Number, param2:Number = 100) : Boolean
      {
         if(int(get_lust100()) >= param1)
         {
            return int(get_lust100()) <= param2;
         }
         return false;
      }
      
      public function lustPercent() : Number
      {
         var _loc1_:Number = getLustPercentBase();
         var _loc2_:Number = 25;
         _loc2_ -= 5 * Utils.boundFloat(0,FlagDict_Impl_.arrayReadInt(get_flags(),2979),3);
         _loc1_ -= getBonusStat("欲望抗性");
         if(_loc1_ < _loc2_)
         {
            _loc1_ = _loc2_;
         }
         if(statusEffectv1(StatusEffects.BlackCatBeer) > 0)
         {
            if(_loc1_ >= 80)
            {
               _loc1_ = 100;
            }
            else
            {
               _loc1_ += 20;
            }
         }
         _loc1_ /= getBonusStatMultiplicative("欲望抗性");
         if(hasStatusEffect(StatusEffects.BimboChampagne) && _loc1_ > 0)
         {
            _loc1_ *= 0.75;
         }
         var _loc3_:StatusEffect = statusEffectByType(StatusEffects.UmasMassage);
         if(_loc3_ != null)
         {
            if(_loc3_.value1 == 0 || _loc3_.value1 == 1)
            {
               _loc1_ *= _loc3_.value2;
            }
         }
         if(statusEffectv1(StatusEffects.Resolve) == 7)
         {
            _loc1_ *= statusEffectv2(StatusEffects.Resolve);
         }
         return Math.round(_loc1_);
      }
      
      public function loseGems(param1:int) : int
      {
         return setGems(get_gems() - param1);
      }
      
      public function looseness(param1:Boolean = true) : Number
      {
         if(param1)
         {
            if(int(vaginas.length) == 0)
            {
               return 0;
            }
            return vaginas[0].vaginalLooseness;
         }
         return ass.analLooseness;
      }
      
      public function longestHorseCockLength() : Number
      {
         var _loc4_:* = null as Cock;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.get_cockType() == CockTypesEnum.HORSE)
            {
               _loc1_ = Math.max(_loc1_,_loc4_.cockLength);
            }
         }
         return _loc1_;
      }
      
      public function longestCockLength() : Number
      {
         if(int(cocks.length) <= 0)
         {
            return 0;
         }
         var _loc1_:Cock = cocks[longestCock()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.cockLength : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function longestCock() : int
      {
         return _cockIndex(function(param1:Cock, param2:Cock):Boolean
         {
            return param1.cockLength > param2.cockLength;
         });
      }
      
      public function legs() : String
      {
         var _loc1_:* = null as Array;
         if(isDrider())
         {
            return Utils.num2Text(lowerBody.legCount) + "条蜘蛛腿";
         }
         if(isTaur())
         {
            return Utils.num2Text(lowerBody.legCount) + "条腿";
         }
         switch(lowerBody.type)
         {
            case 0:
               return "双腿";
            case 1:
               return "腿";
            case 2:
               return "腿";
            case 3:
               return "蛇形盘躯";
            case 8:
               return "粘液团";
            case 11:
               return "可爱的小马腿";
            case 12:
               _loc1_ = ["毛茸茸的兔子腿","长满毛的腿","毛茸茸的腿","双腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 13:
               _loc1_ = ["鸟一样的腿","长满羽毛的腿","双腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 17:
               _loc1_ = ["狐狸一样的腿","双腿","双腿","狐狸腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 19:
               _loc1_ = ["浣熊一样的腿","双腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 21:
               _loc1_ = ["猪一样的腿","双腿","双腿","猪腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 32:
               return "鱼类般的盘绕身躯";
            default:
               return "双腿";
         }
      }
      
      public function leg() : String
      {
         var _loc1_:* = null as Array;
         switch(lowerBody.type)
         {
            case 0:
               return "腿";
            case 1:
               if(isTaur())
               {
                  return "马腿";
               }
               return "腿";
               break;
            case 2:
               return "腿";
            case 3:
               return "蛇尾";
            case 8:
               return "粘液团";
            case 11:
               return "卡通小马腿";
            case 12:
               _loc1_ = ["毛茸茸的兔腿","长满毛的腿","毛茸茸的腿","腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 13:
               _loc1_ = ["鸟腿","长满羽毛的腿","腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 17:
               _loc1_ = ["狐狸腿","腿","腿","狐腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 19:
               _loc1_ = ["浣熊腿","腿"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 32:
               return "人鱼尾巴";
            default:
               return "腿";
         }
      }
      
      public function lactationSpeed() : Number
      {
         return biggestLactation() * biggestTitSize() * 10;
      }
      
      public function knotWord(param1:int = 0) : String
      {
         return Appearance.knotWord(this,param1);
      }
      
      public function isUnarmed() : Boolean
      {
         return get_weaponName() == "fists";
      }
      
      public function isTeen() : Boolean
      {
         return age == 2;
      }
      
      public function isTaur() : Boolean
      {
         if(lowerBody.legCount > 2)
         {
            return !isDrider();
         }
         return false;
      }
      
      public function isShota() : Boolean
      {
         if(isChild())
         {
            return hasCock();
         }
         return false;
      }
      
      public function isPureEnough(param1:Number, param2:Boolean = false) : Boolean
      {
         if(param2 && cor >= 99.5)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2995) > 0)
         {
            return true;
         }
         return corAdjustedDown() < param1;
      }
      
      public function isNineTails() : Boolean
      {
         if(tail.type == 13)
         {
            return tail.venom == 9;
         }
         return false;
      }
      
      public function isNaga() : Boolean
      {
         return lowerBody.type == 3;
      }
      
      public function isMermaid() : Boolean
      {
         return lowerBody.type == 32;
      }
      
      public function isMaleOrHerm() : Boolean
      {
         return (get_gender() & 1) != 0;
      }
      
      public function isMale() : Boolean
      {
         return get_gender() == 1;
      }
      
      public function isLoliShota(param1:String, param2:String) : String
      {
         if(isChild())
         {
            return param1;
         }
         return param2;
      }
      
      public function isLoli() : Boolean
      {
         if(isChild())
         {
            return hasVagina();
         }
         return false;
      }
      
      public function isHoppy() : Boolean
      {
         if(lowerBody.type != 14)
         {
            if(lowerBody.legCount > 2)
            {
               return lowerBody.type == 12;
            }
            return false;
         }
         return true;
      }
      
      public function isHoofed() : Boolean
      {
         return [1,21,11].indexOf(lowerBody.type) != -1;
      }
      
      public function isHerm() : Boolean
      {
         return get_gender() == 3;
      }
      
      public function isGoo() : Boolean
      {
         return lowerBody.type == 8;
      }
      
      public function isGenderless() : Boolean
      {
         return get_gender() == 0;
      }
      
      public function isFurryOrScaley() : Boolean
      {
         if(!isFurry())
         {
            return hasScales();
         }
         return true;
      }
      
      public function isFurry() : Boolean
      {
         return skin.isFurry();
      }
      
      public function isFullMermaid() : Boolean
      {
         if(lowerBody.type == 32)
         {
            return gills.type == 3;
         }
         return false;
      }
      
      public function isFluffy() : Boolean
      {
         return skin.isFluffy();
      }
      
      public function isFemaleOrHerm() : Boolean
      {
         return (get_gender() & 2) != 0;
      }
      
      public function isFemale() : Boolean
      {
         return get_gender() == 2;
      }
      
      public function isElder() : Boolean
      {
         return age == 3;
      }
      
      public function isDrider() : Boolean
      {
         return lowerBody.type == 16;
      }
      
      public function isCorruptEnough(param1:Number, param2:Boolean = false) : Boolean
      {
         if(param2 && cor < 0.5)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2995) > 0)
         {
            return true;
         }
         return corAdjustedUp() >= param1;
      }
      
      public function isChild() : Boolean
      {
         return age == 1;
      }
      
      public function isCentaur() : Boolean
      {
         if(isTaur())
         {
            return isHoofed();
         }
         return false;
      }
      
      public function isBleeding() : Boolean
      {
         return hasStatusEffect(StatusEffects.IzmaBleed);
      }
      
      public function isBiped() : Boolean
      {
         return lowerBody.legCount == 2;
      }
      
      public function isBimbo() : Boolean
      {
         var _loc3_:* = null as PerkType;
         var _loc1_:int = 0;
         var _loc2_:Array = PerkLists.BIMBO;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(hasPerk(_loc3_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function isAdult() : Boolean
      {
         return age == 0;
      }
      
      public function indexOfStatusEffect(param1:StatusEffectType) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(statusEffects.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(statusEffects[_loc4_].get_stype() == param1)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function immobilize() : void
      {
         isImmobilized = true;
      }
      
      public function hasWool() : Boolean
      {
         return skin.hasWool();
      }
      
      public function hasWings() : Boolean
      {
         return [0].indexOf(wings.type) == -1;
      }
      
      public function hasVirginVagina() : Boolean
      {
         if(int(vaginas.length) > 0)
         {
            return vaginas[0].virgin;
         }
         return false;
      }
      
      public function hasVagina() : Boolean
      {
         return int(vaginas.length) > 0;
      }
      
      public function hasTailInsteadOfLegs() : Boolean
      {
         if(lowerBody.type != 3)
         {
            return lowerBody.type == 32;
         }
         return true;
      }
      
      public function hasTail() : Boolean
      {
         return tail.type != 0;
      }
      
      public function hasStatusEffect(param1:StatusEffectType) : Boolean
      {
         return indexOfStatusEffect(param1) >= 0;
      }
      
      public function hasSpiderEyes() : Boolean
      {
         if(eyes.type == 7)
         {
            return eyes.count == 4;
         }
         return false;
      }
      
      public function hasSockRoom() : Boolean
      {
         var _loc3_:* = null as Cock;
         var _loc1_:int = 0;
         var _loc2_:Array = cocks;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.sock == "")
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasSock(param1:String = undefined) : Boolean
      {
         var _loc4_:* = null as Cock;
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.sock != "" && (param1 == "" || param1 == _loc4_.sock))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasSheath() : Boolean
      {
         var _loc3_:* = null as Cock;
         var _loc4_:* = null as CockTypesEnum;
         var _loc1_:int = 0;
         var _loc2_:Array = cocks;
         do
         {
            if(_loc1_ >= int(_loc2_.length))
            {
               return false;
            }
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc3_.get_cockType();
            if(_loc4_ == CockTypesEnum.AVIAN)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.CAT)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.DISPLACER)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.DOG)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.ECHIDNA)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.FERRET)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.FOX)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.HORSE)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.KANGAROO)
            {
               break;
            }
            if(_loc4_ == CockTypesEnum.RED_PANDA)
            {
               break;
            }
         }
         while(_loc4_ != CockTypesEnum.WOLF);
         return true;
      }
      
      public function hasScales() : Boolean
      {
         return [2,5,6].indexOf(skin.type) != -1;
      }
      
      public function hasReptileScales() : Boolean
      {
         return [2,5].indexOf(skin.type) != -1;
      }
      
      public function hasPlainSkin() : Boolean
      {
         return skin.type == 0;
      }
      
      public function hasPerk(param1:PerkType) : Boolean
      {
         return findPerk(param1) >= 0;
      }
      
      public function hasOvipositor() : Boolean
      {
         if(!hasPerk(PerkLib.SpiderOvipositor))
         {
            return hasPerk(PerkLib.BeeOvipositor);
         }
         return true;
      }
      
      public function hasNonLizardScales() : Boolean
      {
         if(hasScales())
         {
            return !hasLizardScales();
         }
         return false;
      }
      
      public function hasNipples() : Boolean
      {
         var _loc3_:* = null as BreastRow;
         var _loc1_:int = 0;
         var _loc2_:Array = breastRows;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.nipplesPerBreast > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasMastery(param1:MasteryType) : Boolean
      {
         return findMastery(param1) != -1;
      }
      
      public function hasLongTongue() : Boolean
      {
         return BodyPartLists.LONG_TONGUES.indexOf(tongue.type) != -1;
      }
      
      public function hasLizardScales() : Boolean
      {
         return skin.type == 2;
      }
      
      public function hasHorns() : Boolean
      {
         return horns.type != 0;
      }
      
      public function hasHistoryPerk() : Boolean
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:Array = PerkLists.HISTORY;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(hasPerk(_loc3_.perk))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasGooSkin() : Boolean
      {
         return skin.type == 3;
      }
      
      public function hasGills() : Boolean
      {
         return gills.type != 0;
      }
      
      public function hasGenitals() : Boolean
      {
         if(!hasCock())
         {
            return hasVagina();
         }
         return true;
      }
      
      public function hasFur() : Boolean
      {
         return skin.hasFur();
      }
      
      public function hasFuckableNipples() : Boolean
      {
         var _loc3_:* = null as BreastRow;
         var _loc1_:int = 0;
         var _loc2_:Array = breastRows;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.fuckable)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasFeathers() : Boolean
      {
         return skin.hasFeathers();
      }
      
      public function hasFatigue(param1:Number, param2:Number = -1) : Boolean
      {
         if(param2 == FATIGUE_NONE)
         {
            return true;
         }
         if(param2 == FATIGUE_MAGICAL)
         {
            param1 = spellCost(param1);
         }
         if(param2 == FATIGUE_PHYSICAL)
         {
            param1 = physicalCost(param1);
         }
         if(param2 == FATIGUE_MAGICAL_HEAL)
         {
            param1 = spellCost(param1);
         }
         return get_fatigue() + param1 < maxFatigue();
      }
      
      public function hasDragonScales() : Boolean
      {
         return skin.type == 5;
      }
      
      public function hasCockType(param1:CockTypesEnum) : Boolean
      {
         return findFirstCockType(param1) >= 0;
      }
      
      public function hasCockThatFits(param1:Number = 0) : Boolean
      {
         return cockThatFits(param1,"area") >= 0;
      }
      
      public function hasCockNotOfType(param1:CockTypesEnum) : Boolean
      {
         var _loc4_:* = null as Cock;
         if(!hasCock())
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.get_cockType() != param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasCock() : Boolean
      {
         return int(cocks.length) >= 1;
      }
      
      public function hasClaws() : Boolean
      {
         return arms.claws.type != 0;
      }
      
      public function hasCatFace() : Boolean
      {
         return [28,6].indexOf(face.type) != -1;
      }
      
      public function hasCatEyes() : Boolean
      {
         return eyes.type == 9;
      }
      
      public function hasBreasts() : Boolean
      {
         if(int(breastRows.length) > 0)
         {
            return biggestTitSize() >= 1;
         }
         return false;
      }
      
      public function hasBeak() : Boolean
      {
         return [26,25].indexOf(face.type) != -1;
      }
      
      public function hasBarkSkin() : Boolean
      {
         return [11,10].indexOf(skin.type) != -1;
      }
      
      public function hasBalls() : Boolean
      {
         return balls > 0;
      }
      
      public function handsDescriptShort(param1:Boolean = true) : String
      {
         return Appearance.handsDescriptShort(this,param1);
      }
      
      public function handsDescript(param1:Boolean = true) : String
      {
         return Appearance.handsDescript(this,param1);
      }
      
      public function get_weaponVerb() : String
      {
         return _weaponVerb;
      }
      
      public function get_weaponValue() : Number
      {
         return _weaponValue;
      }
      
      public function get_weaponPerk() : Array
      {
         return _weaponPerk;
      }
      
      public function get_weaponName() : String
      {
         return _weaponName;
      }
      
      public function get_weaponAttack() : Number
      {
         var _loc1_:Number = 0;
         _loc1_ += getBonusStat("武器伤害");
         _loc1_ *= getBonusStatMultiplicative("武器伤害");
         return _weaponAttack + _loc1_;
      }
      
      public function get_weaponAcc() : Number
      {
         return _weaponAcc;
      }
      
      public function get_upperGarmentValue() : Number
      {
         return _upperGarmentValue;
      }
      
      public function get_upperGarmentPerk() : String
      {
         return _upperGarmentPerk;
      }
      
      public function get_upperGarmentName() : String
      {
         return _upperGarmentName;
      }
      
      public function get_tou100() : Number
      {
         return 100 * get_tou() / getMaxStats("tou");
      }
      
      public function get_tou() : Number
      {
         return _tou;
      }
      
      public function get_tallness() : Number
      {
         return _tallness;
      }
      
      public function get_str100() : Number
      {
         return 100 * get_str() / getMaxStats("str");
      }
      
      public function get_str() : Number
      {
         return _str;
      }
      
      public function get_spe100() : Number
      {
         return 100 * get_spe() / getMaxStats("spe");
      }
      
      public function get_spe() : Number
      {
         return _spe;
      }
      
      public function get_short() : String
      {
         return _short;
      }
      
      public function get_shieldValue() : Number
      {
         return _shieldValue;
      }
      
      public function get_shieldPerk() : String
      {
         return _shieldPerk;
      }
      
      public function get_shieldName() : String
      {
         return _shieldName;
      }
      
      public function get_shieldBlock() : Number
      {
         return _shieldBlock;
      }
      
      public function get_sens100() : Number
      {
         return 100 * sens / getMaxStats("sens");
      }
      
      public function get_race() : String
      {
         return _race;
      }
      
      public function get_perks() : Array
      {
         return _perks;
      }
      
      public function get_numPerks() : int
      {
         return int(_perks.length);
      }
      
      public function get_numMasteries() : int
      {
         return int(_masteries.length);
      }
      
      public function get_npcSettings() : SettingsNPC
      {
         return get_game().gameSettings.get_npc();
      }
      
      public function get_masteries() : Array
      {
         return _masteries;
      }
      
      public function get_lust100() : Number
      {
         return 100 * get_lust() / maxLust();
      }
      
      public function get_lust() : Number
      {
         return _lust;
      }
      
      public function get_lowerGarmentValue() : Number
      {
         return _lowerGarmentValue;
      }
      
      public function get_lowerGarmentPerk() : String
      {
         return _lowerGarmentPerk;
      }
      
      public function get_lowerGarmentName() : String
      {
         return _lowerGarmentName;
      }
      
      public function get_lib100() : Number
      {
         return 100 * lib / getMaxStats("lib");
      }
      
      public function get_jewelryValue() : Number
      {
         return _jewelryValue;
      }
      
      public function get_jewelryPerk() : String
      {
         return _jewelryPerk;
      }
      
      public function get_jewelryName() : String
      {
         return _jewelryName;
      }
      
      public function get_jewelryEffectMagnitude() : Number
      {
         return _jewelryEffectMagnitude;
      }
      
      public function get_jewelryEffectId() : Number
      {
         return _jewelryEffectId;
      }
      
      public function get_inte100() : Number
      {
         return 100 * get_inte() / getMaxStats("inte");
      }
      
      public function get_inte() : Number
      {
         return _inte;
      }
      
      public function get_inRut() : Boolean
      {
         return hasStatusEffect(StatusEffects.Rut);
      }
      
      public function get_inHeat() : Boolean
      {
         return hasStatusEffect(StatusEffects.Heat);
      }
      
      public function get_hp100() : Number
      {
         return 100 * get_HP() / maxHP();
      }
      
      public function get_hoursSinceCum() : Number
      {
         return _hoursSinceCum;
      }
      
      public function get_hairOrFurColors() : String
      {
         if(!isFluffy())
         {
            return hair.color;
         }
         if(!underBody.skin.isFluffy() || ["no",skin.furColor].indexOf(underBody.skin.furColor) != -1)
         {
            return skin.furColor;
         }
         return Utils.formatStringArray([skin.furColor,underBody.skin.furColor]);
      }
      
      public function get_gender() : int
      {
         if(hasCock() && hasVagina())
         {
            return 3;
         }
         if(hasCock())
         {
            return 1;
         }
         if(hasVagina())
         {
            return 2;
         }
         return 0;
      }
      
      public function get_gems() : int
      {
         if(Math.isNaN(_gems) || _gems < 0)
         {
            _gems = 0;
         }
         return _gems;
      }
      
      public function get_game() : CoC
      {
         return KGAMECLASS.kGAMECLASS;
      }
      
      public function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
      
      public function get_fireRes() : Number
      {
         return _fireRes;
      }
      
      public function get_femininity() : Number
      {
         var _loc1_:Number = _femininity;
         var _loc2_:StatusEffect = statusEffectByType(StatusEffects.UmasMassage);
         if(_loc2_ != null && _loc2_.value1 == 10)
         {
            _loc1_ += _loc2_.value2;
         }
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         return _loc1_;
      }
      
      public function get_fatigue100() : Number
      {
         return 100 * get_fatigue() / maxFatigue();
      }
      
      public function get_fatigue() : Number
      {
         return _fatigue;
      }
      
      public function get_capitalA() : String
      {
         if(_a.length == 0)
         {
            return "";
         }
         return _a.charAt(0).toUpperCase() + _a.substr(1);
      }
      
      public function get_armorValue() : Number
      {
         return _armorValue;
      }
      
      public function get_armorPerk() : String
      {
         return _armorPerk;
      }
      
      public function get_armorName() : String
      {
         return _armorName;
      }
      
      public function get_armorDef() : Number
      {
         var _loc1_:Number = _armorDef;
         _loc1_ += getBonusStat("护甲");
         _loc1_ *= getBonusStatMultiplicative("护甲");
         return Math.round(_loc1_);
      }
      
      public function get_a() : String
      {
         return _a;
      }
      
      public function get_HP() : Number
      {
         return _HP;
      }
      
      public function getTotalStat(param1:String, param2:Number) : Number
      {
         return (param2 + getBonusStat(param1)) * getBonusStatMultiplicative(param1);
      }
      
      public function getStatByString(param1:String) : int
      {
         var _loc2_:String = param1;
         if(_loc2_ != "int")
         {
            if(_loc2_ != "inte")
            {
               if(_loc2_ != "intelligence")
               {
                  if(_loc2_ != "spd")
                  {
                     if(_loc2_ != "spe")
                     {
                        if(_loc2_ != "speed")
                        {
                           if(_loc2_ != "str")
                           {
                              if(_loc2_ != "stre")
                              {
                                 if(_loc2_ != "strength")
                                 {
                                    if(_loc2_ != "tou")
                                    {
                                       if(_loc2_ != "tough")
                                       {
                                          if(_loc2_ != "toughness")
                                          {
                                             return 0;
                                          }
                                       }
                                    }
                                    return int(get_tou());
                                 }
                              }
                           }
                           return int(get_str());
                        }
                     }
                  }
                  return int(get_spe());
               }
            }
         }
         return int(get_inte());
      }
      
      public function getRegularAttackRange() : CombatRange
      {
         if(hasPerk(PerkLib.Flying))
         {
            return CombatRange.FlyingMelee;
         }
         if(hasPerk(PerkLib.ChargingSwings))
         {
            return CombatRange.ChargingMelee;
         }
         return CombatRange.Melee;
      }
      
      public function getPerk(param1:PerkType) : Perk
      {
         var _loc2_:int = findPerk(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return _perks[_loc2_];
      }
      
      public function getMeleeCritBonus() : Number
      {
         return getBonusStat("武器暴击率");
      }
      
      public function getMaxStats(param1:String) : int
      {
         var _loc2_:* = getAllMaxStats();
         var _loc3_:String = param1;
         if(_loc3_ != "int")
         {
            if(_loc3_ != "inte")
            {
               if(_loc3_ != "intelligence")
               {
                  if(_loc3_ != "spd")
                  {
                     if(_loc3_ != "spe")
                     {
                        if(_loc3_ != "speed")
                        {
                           if(_loc3_ != "str")
                           {
                              if(_loc3_ != "stre")
                              {
                                 if(_loc3_ != "strength")
                                 {
                                    if(_loc3_ != "tou")
                                    {
                                       if(_loc3_ != "tough")
                                       {
                                          if(_loc3_ != "toughness")
                                          {
                                             return 100;
                                          }
                                       }
                                    }
                                    return int(_loc2_.tou);
                                 }
                              }
                           }
                           return int(_loc2_.str);
                        }
                     }
                  }
                  return int(_loc2_.spe);
               }
            }
         }
         return int(_loc2_.inte);
      }
      
      public function getLustPercentBase() : Number
      {
         var _loc1_:Number = level - 1;
         var _loc2_:Number = Utils.boundFloat(0,_loc1_,10) * 3 + Utils.boundFloat(0,_loc1_ - 10,10) * 2 + Utils.boundFloat(0,_loc1_ - 20,10) + Math.max(0,_loc1_ - 30) * 0.2;
         return Math.max(25,100 - _loc2_);
      }
      
      public function getEvasionRoll(param1:Creature, param2:Number = 0) : Boolean
      {
         return getEvasionReason(param1,param2) != null;
      }
      
      public function getEvasionReason(param1:Creature, param2:Number) : String
      {
         var _loc3_:Boolean = param2 <= Utils.rand(100);
         var _loc4_:Array = [];
         if(_loc3_)
         {
            _loc4_.push("速度");
            if(param1.hasStatusEffect(StatusEffects.Blind) && !param1.hasPerk(PerkLib.BlindImmune))
            {
               _loc4_.push("致盲");
            }
            if(hasPerk(PerkLib.Evade))
            {
               _loc4_.push("闪避");
            }
            if(hasPerk(PerkLib.Flexibility))
            {
               _loc4_.push("柔韧");
            }
            if(hasPerk(PerkLib.Misdirection) && get_armorName() == "red, high-society bodysuit")
            {
               _loc4_.push("误导");
            }
            if(hasPerk(PerkLib.Unhindered) && get_armorDef() == 0)
            {
               _loc4_.push("行动自如");
            }
            return _loc4_[Utils.rand(int(_loc4_.length))];
         }
         return null;
      }
      
      public function getEvasionChance() : Number
      {
         var _loc1_:Number = Math.round(get_spe() / 10);
         if(hasStatusEffect(StatusEffects.TFSupercharging))
         {
            return 0;
         }
         if(hasStatusEffect(StatusEffects.Concentration))
         {
            return 1000;
         }
         _loc1_ += getBonusStat("闪避几率");
         if(hasPerk(PerkLib.ExtraDodge))
         {
            _loc1_ += perkv1(PerkLib.ExtraDodge);
         }
         if(hasStatusEffect(StatusEffects.WaitReadiness))
         {
            _loc1_ += 10;
         }
         if(hasStatusEffect(StatusEffects.Backstab))
         {
            _loc1_ += 25;
         }
         if(hasStatusEffect(StatusEffects.AkbalFlameDebuff))
         {
            _loc1_ -= 10 * statusEffectv1(StatusEffects.AkbalFlameDebuff);
         }
         if(statusEffectv1(StatusEffects.Resolve) == 2)
         {
            _loc1_ -= statusEffectv3(StatusEffects.Resolve);
         }
         return _loc1_ * getBonusStatMultiplicative("闪避几率");
      }
      
      public function getClitLength(param1:int = 0) : Number
      {
         if(!hasVagina())
         {
            return -1;
         }
         return vaginas[param1].clitLength;
      }
      
      public function getBonusStatSummaryAll(param1:String = undefined) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Array;
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc2_:String = "";
         var _loc3_:* = new MapKeyValueIterator(bonusStats);
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            _loc5_ = _loc4_.key;
            _loc6_ = _loc4_.value;
            _loc2_ += "[pg-]" + param1 + "[bu:" + BonusStat_Impl_.additive(_loc5_) + ":]";
            _loc2_ += getBonusStatSummary(BonusStat_Impl_.additive(_loc5_),"\t" + param1);
         }
         return _loc2_;
      }
      
      public function getBonusStatSummary(param1:String, param2:String = undefined) : String
      {
         var _loc10_:int = 0;
         var _loc11_:* = null as Bonus;
         var _loc12_:Number = NaN;
         var _loc13_:* = null as String;
         var _loc14_:* = null as String;
         if(param2 == null)
         {
            param2 = "";
         }
         var _loc3_:String = "";
         var _loc4_:StringMap = bonusStats;
         var _loc5_:String = param1;
         var _loc6_:Array = _loc5_ in StringMap.reserved ? _loc4_.getReserved(_loc5_) : _loc4_.h[_loc5_];
         var _loc7_:StringMap = bonusStats;
         var _loc8_:String = BonusStat_Impl_.multiplicative(param1);
         var _loc9_:Array = _loc8_ in StringMap.reserved ? _loc7_.getReserved(_loc8_) : _loc7_.h[_loc8_];
         if(_loc6_ != null)
         {
            _loc10_ = 0;
            while(_loc10_ < int(_loc6_.length))
            {
               _loc11_ = _loc6_[_loc10_];
               _loc10_++;
               _loc12_ = NumberFunc_Impl_.resolve(_loc11_.value);
               _loc13_ = _loc12_ > 0 ? "+" : "";
               _loc14_ = Utils.cnName(Utils.titleCase(_loc11_.key));
               _loc3_ += "[pg-]" + param2 + "[b:" + _loc14_ + ":] " + _loc13_ + _loc12_;
            }
         }
         if(_loc9_ != null)
         {
            _loc10_ = 0;
            while(_loc10_ < int(_loc9_.length))
            {
               _loc11_ = _loc9_[_loc10_];
               _loc10_++;
               _loc12_ = NumberFunc_Impl_.resolve(_loc11_.value);
               _loc13_ = Utils.cnName(Utils.titleCase(_loc11_.key));
               _loc3_ += "[pg-]" + param2 + "[b:" + _loc13_ + ":] x" + _loc12_;
            }
         }
         return _loc3_;
      }
      
      public function getBonusStatMultiplicative(param1:String) : Number
      {
         var _loc7_:* = null as Bonus;
         param1 = BonusStat_Impl_.multiplicative(param1);
         var _loc2_:StringMap = bonusStats;
         var _loc3_:String = param1;
         var _loc4_:Array = _loc3_ in StringMap.reserved ? _loc2_.getReserved(_loc3_) : _loc2_.h[_loc3_];
         if(_loc4_ == null)
         {
            return 1;
         }
         var _loc5_:Number = 1;
         var _loc6_:int = 0;
         while(_loc6_ < int(_loc4_.length))
         {
            _loc7_ = _loc4_[_loc6_];
            _loc6_++;
            _loc5_ *= NumberFunc_Impl_.resolve(_loc7_.value);
         }
         return _loc5_;
      }
      
      public function getBonusStat(param1:String) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:* = null as Bonus;
         var _loc2_:StringMap = bonusStats;
         var _loc3_:String = param1;
         var _loc4_:Array = _loc3_ in StringMap.reserved ? _loc2_.getReserved(_loc3_) : _loc2_.h[_loc3_];
         if(_loc4_ != null)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < int(_loc4_.length))
            {
               _loc7_ = _loc4_[_loc6_];
               _loc6_++;
               _loc5_ += NumberFunc_Impl_.resolve(_loc7_.value);
            }
            return _loc5_;
         }
         return 0;
      }
      
      public function getBaseCritChance() : Number
      {
         var _loc1_:Number = 5;
         switch(eyes.type)
         {
            case 4:
               _loc1_++;
               break;
            case 7:
               _loc1_ += 2;
               break;
            case 9:
               _loc1_ += 3;
         }
         if(eyes.count >= 4)
         {
            _loc1_ += 2;
         }
         _loc1_ += getBonusStat("暴击率");
         if(statusEffectv1(StatusEffects.Resolve) == 3)
         {
            _loc1_ += statusEffectv2(StatusEffects.Resolve);
         }
         return _loc1_;
      }
      
      public function getArmorPen() : Number
      {
         return 1;
      }
      
      public function getAllMaxStats() : Object
      {
         return {
            "str":9999,
            "tou":9999,
            "spe":9999,
            "inte":9999,
            "lib":100,
            "sens":100,
            "cor":100,
            "lust":maxLust()
         };
      }
      
      public function getAgeModifiers() : BonusDerivedStats
      {
         switch(age)
         {
            case 0:
               return ADULT_MODIFIERS;
            case 1:
               return CHILD_MODIFIERS;
            case 2:
               return TEEN_MODIFIERS;
            case 3:
               return ELDER_MODIFIERS;
            default:
               return new BonusDerivedStats();
         }
      }
      
      public function genderText(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "man";
         }
         if(param2 == null)
         {
            param2 = "woman";
         }
         if(param3 == null)
         {
            param3 = "herm";
         }
         if(param4 == null)
         {
            param4 = "eunuch";
         }
         if(int(vaginas.length) > 0)
         {
            if(int(cocks.length) > 0)
            {
               return param3;
            }
            return param2;
         }
         if(int(cocks.length) > 0)
         {
            return param1;
         }
         return param4;
      }
      
      public function gainGems(param1:int) : int
      {
         return setGems(get_gems() + param1);
      }
      
      public function foxScore() : Number
      {
         throw new Error("未实现。错误");
      }
      
      public function foot() : String
      {
         var _loc1_:* = null as Array;
         switch(lowerBody.type)
         {
            case 0:
               return "脚";
            case 1:
               return "蹄子";
            case 2:
               return "爪子";
            case 3:
               return "盘绕的尾巴";
            case 8:
               return "黏滑的底盘";
            case 11:
               return "扁平的小马蹄";
            case 12:
               _loc1_ = ["大兔脚","兔脚","大脚","脚"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 13:
               _loc1_ = ["带爪的脚","脚"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 14:
               return "脚爪";
            case 17:
               _loc1_ = ["爪子","柔软带肉垫的爪子","狐狸般的脚","爪子"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 19:
               _loc1_ = ["像浣熊一样的脚","长趾爪子","脚","爪子"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 32:
               return "脚蹼";
            default:
               return "脚";
         }
      }
      
      public function fly() : void
      {
         isFlying = true;
      }
      
      public function fixFuckingCockTypesEnum() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Cock;
         var _loc4_:Number = NaN;
         if(int(cocks.length) > 0)
         {
            _loc1_ = 0;
            _loc2_ = cocks;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc4_ = _loc3_.knotMultiplier;
               _loc3_.set_cockType(CockTypesEnum.ParseConstantByIndex(_loc3_.get_cockType().get_Index()));
               _loc3_.knotMultiplier = _loc4_;
            }
         }
      }
      
      public function findPerk(param1:PerkType) : int
      {
         var _loc4_:int = 0;
         if(int(get_perks().length) <= 0)
         {
            return -2;
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(get_perks().length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(_perks[_loc4_].get_ptype() == param1)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function findMastery(param1:MasteryType) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = get_numMasteries();
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(_masteries[_loc4_].get_mtype() == param1)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function findFirstCockType(param1:CockTypesEnum) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(cocks.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(cocks[_loc4_].get_cockType() == param1)
            {
               return _loc4_;
            }
         }
         return 0;
      }
      
      public function findFirstCockNotOfType(param1:CockTypesEnum) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(cocks.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(cocks[_loc4_].get_cockType() != param1)
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public function fertilizedEggs() : int
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return -1;
         }
         if(hasPerk(PerkLib.SpiderOvipositor))
         {
            return int(perkv2(PerkLib.SpiderOvipositor));
         }
         return int(perkv2(PerkLib.BeeOvipositor));
      }
      
      public function fertilizeEggs() : int
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return -1;
         }
         if(hasPerk(PerkLib.SpiderOvipositor))
         {
            setPerkValue(PerkLib.SpiderOvipositor,2,eggs());
         }
         else
         {
            setPerkValue(PerkLib.BeeOvipositor,2,eggs());
         }
         return fertilizedEggs();
      }
      
      public function feet() : String
      {
         var _loc1_:* = null as Array;
         switch(lowerBody.type)
         {
            case 0:
               return "脚";
            case 1:
               return "蹄子";
            case 2:
               return "爪子";
            case 3:
               return "蛇身";
            case 5:
               return "恶魔高跟鞋";
            case 6:
               return "恶魔脚爪";
            case 8:
               return "黏液纤毛";
            case 11:
               return "平坦的小马蹄";
            case 12:
               _loc1_ = ["大兔子脚","兔脚","大脚","脚"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 13:
               _loc1_ = ["有爪的脚","脚"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 14:
               return "脚爪";
            case 17:
               _loc1_ = ["爪子","柔软的肉垫爪子","狐狸般的脚","爪子"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 19:
               _loc1_ = ["浣熊般的脚","长趾爪子","脚","爪子"];
               return _loc1_[Utils.rand(int(_loc1_.length))];
            case 32:
               return "脚蹼";
            default:
               return "脚";
         }
      }
      
      public function fatigueLeft() : Number
      {
         return maxFatigue() - get_fatigue();
      }
      
      public function elderPhysMod() : Number
      {
         if(hasPerk(PerkLib.HistoryFighter))
         {
            return 1;
         }
         return 0.9;
      }
      
      public function eggs() : int
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return -1;
         }
         if(hasPerk(PerkLib.SpiderOvipositor))
         {
            return int(perkv1(PerkLib.SpiderOvipositor));
         }
         return int(perkv1(PerkLib.BeeOvipositor));
      }
      
      public function earDescript(param1:Boolean = true) : String
      {
         return Appearance.earDescript(this,param1);
      }
      
      public function dynStats(... rest) : Object
      {
         var _loc24_:* = null as DynStat;
         var _loc25_:Number = NaN;
         var _loc26_:* = null as DynStatOp;
         var _loc3_:Function = function(param1:Number, param2:Number, param3:DynStatOp = undefined):Number
         {
            if(param3 == null)
            {
               param3 = DynStatOp.Add;
            }
            switch(param3.index)
            {
               case 1:
                  return -param2;
               case 2:
                  return param1 * param2 - param1;
               case 3:
                  return param1 / param2 - param1;
               case 4:
                  return param2 - param1;
               default:
                  return param2;
            }
         };
         var _loc4_:Number = get_str();
         var _loc5_:Number = get_tou();
         var _loc6_:Number = get_spe();
         var _loc7_:Number = get_inte();
         var _loc8_:Number = lib;
         var _loc9_:Number = sens;
         var _loc10_:Number = get_lust();
         var _loc11_:Number = cor;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:Number = 0;
         var _loc19_:Number = 0;
         var _loc20_:Boolean = true;
         var _loc21_:Boolean = true;
         var _loc22_:int = 0;
         var _loc23_:Array = rest;
         while(_loc22_ < int(_loc23_.length))
         {
            _loc24_ = _loc23_[_loc22_++];
            switch(_loc24_.index)
            {
               case 0:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc12_ = Number(_loc3_(get_str(),_loc25_,_loc26_));
                  break;
               case 1:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc13_ = Number(_loc3_(get_tou(),_loc25_,_loc26_));
                  break;
               case 2:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc14_ = Number(_loc3_(get_spe(),_loc25_,_loc26_));
                  break;
               case 3:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc15_ = Number(_loc3_(get_inte(),_loc25_,_loc26_));
                  break;
               case 4:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc16_ = Number(_loc3_(lib,_loc25_,_loc26_));
                  break;
               case 5:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc17_ = Number(_loc3_(sens,_loc25_,_loc26_));
                  break;
               case 6:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc18_ = Number(_loc3_(get_lust(),_loc25_,_loc26_));
                  break;
               case 7:
                  _loc25_ = Number(_loc24_.params[0]);
                  _loc26_ = _loc24_.params[1];
                  _loc19_ = Number(_loc3_(cor,_loc25_,_loc26_));
                  break;
               case 8:
                  _loc20_ = false;
                  break;
               case 9:
                  _loc21_ = false;
            }
         }
         modStats(_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_);
         return {
            "str":get_str() - _loc4_,
            "tou":get_tou() - _loc5_,
            "spe":get_spe() - _loc6_,
            "inte":get_inte() - _loc7_,
            "lib":lib - _loc8_,
            "sens":sens - _loc9_,
            "lust":get_lust() - _loc10_,
            "cor":cor - _loc11_
         };
      }
      
      public function dumpEggs() : void
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return;
         }
         setEggs(0);
         fertilizeEggs();
      }
      
      public function dogScore() : Number
      {
         throw new Error("未实现。错误");
      }
      
      public function dogCocks() : int
      {
         return countCocksOfType(CockTypesEnum.DOG) + countCocksOfType(CockTypesEnum.FOX);
      }
      
      public function damageToughnessModifier(param1:Boolean = false, param2:Boolean = false) : Number
      {
         if(param1)
         {
            return 0;
         }
         var _loc3_:Number = 0;
         if(get_tou() < 25)
         {
            _loc3_ = get_tou() * 0.4;
         }
         else if(get_tou() < 50)
         {
            _loc3_ = 10 + (get_tou() - 25) * 0.3;
         }
         else if(get_tou() < 75)
         {
            _loc3_ = 17.5 + (get_tou() - 50) * 0.2;
         }
         else if(get_tou() < 100)
         {
            _loc3_ = 22.5 + (get_tou() - 75) * 0.1;
         }
         else
         {
            _loc3_ = 25;
         }
         if(param2)
         {
            return _loc3_;
         }
         return Utils.rand(_loc3_);
      }
      
      public function damagePercent(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : Number
      {
         if(hasStatusEffect(StatusEffects.Soulburst))
         {
            return 100;
         }
         var _loc5_:Number = 100;
         var _loc6_:Number = get_armorDef();
         _loc5_ -= damageToughnessModifier(param1,param2);
         if(_loc5_ < 75)
         {
            _loc5_ = 75;
         }
         if(param3)
         {
            _loc6_ *= getArmorPen();
            if(get_game().player.hasPerk(PerkLib.LungingAttacks) && !get_game().combat.isWieldingRangedWeapon())
            {
               _loc6_ *= 0.75;
            }
            if(_loc6_ < 0)
            {
               _loc6_ = 0;
            }
         }
         _loc5_ -= _loc6_;
         if(hasPerk(PerkLib.Masochist) && lib >= 60)
         {
            _loc5_ *= 0.8;
            if(!param4)
            {
               takeLustDamage(2);
            }
         }
         if(hasPerk(PerkLib.ImmovableObject) && get_tou() >= 75)
         {
            _loc5_ *= 0.9;
         }
         if(statusEffectv1(StatusEffects.BlackCatBeer) > 0)
         {
            _loc5_ *= 0.75;
         }
         var _loc7_:StatusEffect = statusEffectByType(StatusEffects.UmasMassage);
         if(_loc7_ != null && _loc7_.value1 == 3)
         {
            _loc5_ *= _loc7_.value2;
         }
         if(statusEffectv1(StatusEffects.Resolve) == 1)
         {
            _loc5_ *= statusEffectv2(StatusEffects.Resolve);
         }
         _loc5_ = Math.round(_loc5_);
         if(_loc5_ < 20)
         {
            _loc5_ = 20;
         }
         return _loc5_ * (1 - perkv1(PerkLib.PhysicalResistance));
      }
      
      public function cuntChangeNoDisplay(param1:Number) : Boolean
      {
         if(int(vaginas.length) == 0)
         {
            return false;
         }
         var _loc2_:Boolean = vaginas[0].stretch(param1,hasPerk(PerkLib.FerasBoonMilkingTwat),vaginalCapacityBonus());
         if(param1 >= 0.5 * vaginalCapacity())
         {
            vaginas[0].resetRecoveryProgress();
         }
         return _loc2_;
      }
      
      public function cumQ() : Number
      {
         var _loc3_:Number = NaN;
         if(!hasCock())
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:Number = (get_lust() + 50) / 10;
         if(get_game().get_realistic())
         {
            _loc2_ = (get_lust() + 50) / 5;
            if(hasPerk(PerkLib.PilgrimsBounty))
            {
               _loc2_ = 30;
            }
            _loc3_ = _loc2_ + (get_hoursSinceCum() + 10);
            if(_loc3_ > 100)
            {
               _loc3_ = 100;
            }
            if(_loc1_ > cumCapacity())
            {
               _loc1_ = cumCapacity();
            }
            return _loc3_ / 100 * cumCapacity();
         }
         if(hasPerk(PerkLib.PilgrimsBounty))
         {
            _loc2_ = 15;
         }
         if((balls == 0 || hasStatusEffect(StatusEffects.Uniball)) && hasPerk(PerkLib.PotentProstate))
         {
            _loc1_ = int(8 * cumMultiplier * 2 * _loc2_ * (get_hoursSinceCum() + 10) / 24) / 10;
         }
         else if(balls == 0)
         {
            _loc1_ = int(2.5 * cumMultiplier * 2 * _loc2_ * (get_hoursSinceCum() + 10) / 24) / 10;
         }
         else
         {
            _loc1_ = int(ballSize * balls * cumMultiplier * 2 * _loc2_ * (get_hoursSinceCum() + 10) / 24) / 10;
         }
         if(hasPerk(PerkLib.BroBody))
         {
            _loc1_ *= 1.3;
         }
         if(hasPerk(PerkLib.FertilityPlus))
         {
            _loc1_ *= 1.5;
         }
         if(hasPerk(PerkLib.FertilityMinus) && get_lib100() < 25)
         {
            _loc1_ *= 0.7;
         }
         if(hasPerk(PerkLib.MessyOrgasms))
         {
            _loc1_ *= 1.5;
         }
         if(hasPerk(PerkLib.OneTrackMind))
         {
            _loc1_ *= 1.1;
         }
         if(hasPerk(PerkLib.ParasiteMusk))
         {
            _loc1_ *= 1.2;
         }
         if(hasPerk(PerkLib.MaraesGiftStud))
         {
            _loc1_ += 350;
         }
         if(hasPerk(PerkLib.FerasBoonAlpha))
         {
            _loc1_ += 200;
         }
         if(hasPerk(PerkLib.MagicalVirility))
         {
            _loc1_ += 200 + perkv1(PerkLib.MagicalVirility) * 100;
         }
         if(hasPerk(PerkLib.FerasBoonSeeder))
         {
            _loc1_ += 1000;
         }
         _loc1_ += perkv1(PerkLib.ElvenBounty);
         if(hasPerk(PerkLib.BroBody))
         {
            _loc1_ += 200;
         }
         if(hasPerk(PerkLib.SatyrSexuality))
         {
            _loc1_ += 50;
         }
         _loc1_ += statusEffectv1(StatusEffects.Rut);
         _loc1_ *= 1 + 2 * perkv1(PerkLib.PiercedFertite) / 100;
         if(get_jewelryEffectId() == 2)
         {
            _loc1_ *= 1 + get_jewelryEffectMagnitude() / 100;
         }
         if(_loc1_ < 2)
         {
            _loc1_ = 2;
         }
         if(_loc1_ > 2147483647)
         {
            _loc1_ = 2147483647;
         }
         return _loc1_;
      }
      
      public function cumCapacity() : Number
      {
         if(!hasCock())
         {
            return 0;
         }
         var _loc1_:Number = 0;
         if(balls > 0)
         {
            _loc1_ += Math.pow(1.3333333333333333 * Math.PI * (ballSize / 2),3) * balls;
         }
         else
         {
            _loc1_ += Math.pow(1.3333333333333333 * Math.PI,3) * 2;
         }
         if(hasPerk(PerkLib.BroBody))
         {
            _loc1_ *= 1.3;
         }
         if(hasPerk(PerkLib.ParasiteMusk))
         {
            _loc1_ *= 1.2;
         }
         if(hasPerk(PerkLib.FertilityPlus))
         {
            _loc1_ *= 1.5;
         }
         if(hasPerk(PerkLib.FertilityMinus) && get_lib100() < 25)
         {
            _loc1_ *= 0.7;
         }
         if(hasPerk(PerkLib.MessyOrgasms))
         {
            _loc1_ *= 1.5;
         }
         if(hasPerk(PerkLib.OneTrackMind))
         {
            _loc1_ *= 1.1;
         }
         if(hasPerk(PerkLib.MaraesGiftStud))
         {
            _loc1_ += 350;
         }
         if(hasPerk(PerkLib.FerasBoonAlpha))
         {
            _loc1_ += 200;
         }
         if(hasPerk(PerkLib.MagicalVirility))
         {
            _loc1_ += 200;
         }
         if(hasPerk(PerkLib.FerasBoonSeeder))
         {
            _loc1_ += 1000;
         }
         _loc1_ += perkv1(PerkLib.ElvenBounty);
         if(hasPerk(PerkLib.BroBody))
         {
            _loc1_ += 200;
         }
         _loc1_ += statusEffectv1(StatusEffects.Rut);
         _loc1_ *= 1 + 2 * perkv1(PerkLib.PiercedFertite) / 100;
         if(get_jewelryEffectId() == 2)
         {
            _loc1_ *= 1 + get_jewelryEffectMagnitude() / 100;
         }
         _loc1_ *= cumMultiplier;
         _loc1_ = Math.round(_loc1_);
         if(_loc1_ > 2147483647)
         {
            _loc1_ = 2147483647;
         }
         return _loc1_;
      }
      
      public function cripple() : void
      {
         isCrippled = true;
      }
      
      public function createVagina(param1:Boolean = true, param2:Number = 1, param3:int = 0) : Boolean
      {
         if(int(vaginas.length) >= 2)
         {
            return false;
         }
         var _loc4_:Vagina = new Vagina(param2,param3,param1);
         vaginas.push(_loc4_);
         return true;
      }
      
      public function createStatusEffectAllowDuplicates(param1:StatusEffectType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Boolean = true) : StatusEffect
      {
         var _loc7_:StatusEffect = param1.create(param2,param3,param4,param5);
         statusEffects.push(_loc7_);
         _loc7_.addedToHostList(this,param6);
         addBonusStats(_loc7_.bonusStats);
         return _loc7_;
      }
      
      public function createStatusEffect(param1:StatusEffectType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Boolean = true) : StatusEffect
      {
         var _loc7_:StatusEffect = statusEffectByType(param1);
         if(_loc7_ == null)
         {
            _loc7_ = param1.create(param2,param3,param4,param5);
            statusEffects.push(_loc7_);
            _loc7_.addedToHostList(this,param6);
            addBonusStats(_loc7_.bonusStats);
         }
         return _loc7_;
      }
      
      public function createPerkIfNotHasPerk(param1:PerkType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : Boolean
      {
         if(hasPerk(param1))
         {
            return false;
         }
         createPerk(param1,param2,param3,param4,param5);
         return true;
      }
      
      public function createPerk(param1:PerkType, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         if(hasPerk(param1))
         {
            return;
         }
         var _loc6_:Perk = new Perk(param1,param2,param3,param4,param5);
         get_perks().push(_loc6_);
         get_perks().sort(function(param1:Perk, param2:Perk):int
         {
            return Reflect.compare(param1.get_perkName(),param2.get_perkName());
         });
         addBonusStats(param1.bonusStats);
         param1.host = this;
         param1.onAttach();
      }
      
      public function createOrFindStatusEffect(param1:StatusEffectType) : StatusEffect
      {
         var _loc2_:StatusEffect = statusEffectByType(param1);
         if(_loc2_ == null)
         {
            _loc2_ = createStatusEffect(param1,0,0,0,0);
         }
         return _loc2_;
      }
      
      public function createCock(param1:Number = 5.5, param2:Number = 1, param3:CockTypesEnum = undefined) : Boolean
      {
         if(param3 == null)
         {
            param3 = CockTypesEnum.HUMAN;
         }
         if(int(cocks.length) >= 10)
         {
            return false;
         }
         var _loc4_:Cock = new Cock(param1,param2,param3);
         cocks.push(_loc4_);
         cocks[int(cocks.length) - 1].cockThickness = param2;
         cocks[int(cocks.length) - 1].cockLength = param1;
         return true;
      }
      
      public function createBreastRow(param1:Number = 0, param2:Number = 1) : Boolean
      {
         if(int(breastRows.length) >= 10)
         {
            return false;
         }
         var _loc3_:BreastRow = new BreastRow();
         _loc3_.breastRating = param1;
         _loc3_.nipplesPerBreast = param2;
         breastRows.push(_loc3_);
         return true;
      }
      
      public function countNotKnottedCocks() : int
      {
         return int(cocks.length) - countKnottedCocks();
      }
      
      public function countKnottedCocks() : int
      {
         return Lambda.count(cocks,function(param1:Cock):Boolean
         {
            return param1.hasKnot();
         });
      }
      
      public function countCocksOfType(param1:CockTypesEnum) : int
      {
         var _loc5_:* = null as Cock;
         if(int(cocks.length) == 0)
         {
            return 0;
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = cocks;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.get_cockType() == param1)
            {
               _loc2_.push(_loc5_);
            }
         }
         return int(_loc2_.length);
      }
      
      public function countCockSocks(param1:String) : int
      {
         var _loc5_:* = null as Cock;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = cocks;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.sock == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function countBonusStatMultiplicative(param1:String) : int
      {
         param1 = BonusStat_Impl_.multiplicative(param1);
         var _loc2_:StringMap = bonusStats;
         var _loc3_:String = param1;
         var _loc4_:Array = _loc3_ in StringMap.reserved ? _loc2_.getReserved(_loc3_) : _loc2_.h[_loc3_];
         if(_loc4_ != null)
         {
            return int(_loc4_.length);
         }
         return 0;
      }
      
      public function countBonusStat(param1:String) : int
      {
         var _loc2_:StringMap = bonusStats;
         var _loc3_:String = param1;
         var _loc4_:Array = _loc3_ in StringMap.reserved ? _loc2_.getReserved(_loc3_) : _loc2_.h[_loc3_];
         if(_loc4_ != null)
         {
            return int(_loc4_.length);
         }
         return 0;
      }
      
      public function corruptionTolerance() : Number
      {
         return 0;
      }
      
      public function corner() : void
      {
         isCornered = true;
      }
      
      public function corAdjustedUp() : Number
      {
         return Utils.boundFloat(0,cor + corruptionTolerance(),100);
      }
      
      public function corAdjustedDown() : Number
      {
         return Utils.boundFloat(0,cor - corruptionTolerance(),100);
      }
      
      public function copySkinToUnderBody(param1:Object = undefined) : void
      {
         underBody.skin.setProps(skin);
         if(param1 != null)
         {
            underBody.skin.setProps(param1);
         }
      }
      
      public function combatParry() : Boolean
      {
         if(canParry())
         {
            return Utils.randomChance(parryChance());
         }
         return false;
      }
      
      public function cocksBySize() : Array
      {
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = int(cocks.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc1_.push({
               "index":_loc4_,
               "size":cockArea(_loc4_)
            });
         }
         _loc1_.sort(function(param1:Object, param2:Object):int
         {
            return Reflect.compare(Number(param2.size),Number(param1.size));
         });
         return _loc1_;
      }
      
      public function cockVaginaNeuter(param1:String, param2:String, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(hasCock())
         {
            return param1;
         }
         if(hasVagina())
         {
            return param2;
         }
         return param3;
      }
      
      public function cockTotal() : int
      {
         return int(cocks.length);
      }
      
      public function cockThatFits2(param1:Number = 0) : int
      {
         if(cockTotal() == 1)
         {
            return -1;
         }
         var _loc2_:int = int(cocks.length);
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(cockArea(_loc2_) <= param1)
            {
               if(_loc3_ >= 0)
               {
                  if(cockArea(_loc2_) > cockArea(_loc3_))
                  {
                     if(_loc3_ != -1)
                     {
                        _loc4_ = _loc3_;
                     }
                     _loc3_ = _loc2_;
                  }
                  else if(cockArea(_loc4_) < cockArea(_loc2_) && _loc2_ != _loc3_)
                  {
                     _loc4_ = _loc2_;
                  }
                  if(_loc3_ >= 0 && _loc3_ == _loc4_)
                  {
                     CoC_Settings.error("操，错误，COCKTHATFITS2坏掉了！");
                  }
               }
               else
               {
                  _loc3_ = _loc2_;
               }
            }
         }
         return _loc4_;
      }
      
      public function cockThatFits(param1:Number = 0, param2:String = undefined) : int
      {
         if(param2 == null)
         {
            param2 = "area";
         }
         if(int(cocks.length) <= 0)
         {
            return -1;
         }
         var _loc3_:int = int(cocks.length);
         var _loc4_:int = -1;
         while(_loc3_ > 0)
         {
            _loc3_--;
            if(param2 == "area")
            {
               if(cockArea(_loc3_) <= param1)
               {
                  if(_loc4_ >= 0)
                  {
                     if(cockArea(_loc3_) > cockArea(_loc4_))
                     {
                        _loc4_ = _loc3_;
                     }
                  }
                  else
                  {
                     _loc4_ = _loc3_;
                  }
               }
            }
            else if(param2 == "length")
            {
               if(cocks[_loc3_].cockLength <= param1)
               {
                  if(_loc4_ >= 0)
                  {
                     if(cocks[_loc3_].cockLength > cocks[_loc4_].cockLength)
                     {
                        _loc4_ = _loc3_;
                     }
                  }
                  else
                  {
                     _loc4_ = _loc3_;
                  }
               }
            }
            else if(param2 == "width")
            {
               if(cocks[_loc3_].cockThickness <= param1)
               {
                  if(_loc4_ >= 0)
                  {
                     if(cocks[_loc3_].cockThickness > cocks[_loc4_].cockThickness)
                     {
                        _loc4_ = _loc3_;
                     }
                  }
                  else
                  {
                     _loc4_ = _loc3_;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function cockMultiNoun(param1:int = 0) : String
      {
         return Appearance.cockMultiNoun(cocks[param1].get_cockType(),this);
      }
      
      public function cockMultiLDescriptionShort() : String
      {
         if(int(cocks.length) < 1)
         {
            CoC_Settings.error("<b>错误：cockMultiLightDesc() 未检测到鸡巴</b>");
            return "<b>错误：cockMultiLightDesc() 未检测到鸡巴</b>";
         }
         if(int(cocks.length) == 1)
         {
            return Appearance.cockDescript(this,0);
         }
         var _loc1_:String = "";
         var _loc2_:CockTypesEnum = cocks[0].get_cockType();
         while(true)
         {
            if(_loc2_ != CockTypesEnum.ANEMONE)
            {
               if(_loc2_ != CockTypesEnum.CAT)
               {
                  if(_loc2_ != CockTypesEnum.DEMON)
                  {
                     if(_loc2_ != CockTypesEnum.DISPLACER)
                     {
                        if(_loc2_ != CockTypesEnum.DRAGON)
                        {
                           if(_loc2_ != CockTypesEnum.FERRET)
                           {
                              if(_loc2_ != CockTypesEnum.HORSE)
                              {
                                 if(_loc2_ != CockTypesEnum.KANGAROO)
                                 {
                                    if(_loc2_ != CockTypesEnum.LIZARD)
                                    {
                                       if(_loc2_ != CockTypesEnum.PIG)
                                       {
                                          if(_loc2_ != CockTypesEnum.RED_PANDA)
                                          {
                                             if(_loc2_ != CockTypesEnum.TENTACLE)
                                             {
                                                if(_loc2_ != CockTypesEnum.WOLF)
                                                {
                                                   if(_loc2_ != CockTypesEnum.DOG)
                                                   {
                                                      if(_loc2_ != CockTypesEnum.FOX)
                                                      {
                                                         _loc1_ = Appearance.cockNoun(CockTypesEnum.HUMAN,false);
                                                         break;
                                                      }
                                                   }
                                                   if(dogCocks() == int(cocks.length))
                                                   {
                                                      _loc1_ = Appearance.cockNoun(CockTypesEnum.DOG);
                                                   }
                                                   else
                                                   {
                                                      _loc1_ = Appearance.cockNoun(CockTypesEnum.HUMAN,false);
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
                        }
                     }
                  }
               }
            }
            if(countCocksOfType(cocks[0].get_cockType()) == int(cocks.length))
            {
               _loc1_ = Appearance.cockNoun(cocks[0].get_cockType());
            }
            else
            {
               _loc1_ = Appearance.cockNoun(CockTypesEnum.HUMAN,false);
            }
            break;
         }
         if(_loc1_.indexOf("penis") >= 0)
         {
            _loc1_ += "";
         }
         return _loc1_ + "";
      }
      
      public function cockHead(param1:int = 0) : String
      {
         var _loc2_:* = null as Array;
         if(param1 < 0 || param1 > int(cocks.length) - 1)
         {
            CoC_Settings.error("");
            return "ERROR";
         }
         var _loc3_:CockTypesEnum = cocks[param1].get_cockType();
         if(_loc3_ == CockTypesEnum.CAT)
         {
            _loc2_ = ["尖端","狭窄的尖端"];
         }
         else if(_loc3_ == CockTypesEnum.DEMON)
         {
            _loc2_ = ["腐化冠部","肉突环绕的尖端"];
         }
         else if(_loc3_ == CockTypesEnum.DISPLACER)
         {
            _loc2_ = ["星形尖端","绽放的龟头","敞开的冠部","异形尖端","奇异的头部"];
         }
         else if(_loc3_ == CockTypesEnum.ECHIDNA)
         {
            _loc2_ = ["四个龟头","针鼹的四个龟头"];
         }
         else
         {
            while(true)
            {
               if(_loc3_ != CockTypesEnum.DOG)
               {
                  if(_loc3_ != CockTypesEnum.FOX)
                  {
                     if(_loc3_ != CockTypesEnum.WOLF)
                     {
                        if(_loc3_ == CockTypesEnum.HORSE)
                        {
                           _loc2_ = ["膨大冠部","平坦尖端"];
                           break;
                        }
                        if(_loc3_ == CockTypesEnum.KANGAROO)
                        {
                           _loc2_ = ["尖端","尖头"];
                           break;
                        }
                        if(_loc3_ == CockTypesEnum.LIZARD)
                        {
                           _loc2_ = ["冠部","龟头"];
                           break;
                        }
                        if(_loc3_ == CockTypesEnum.PIG)
                        {
                           _loc2_ = ["螺旋状尖端","螺旋状龟头"];
                           break;
                        }
                        if(_loc3_ == CockTypesEnum.RHINO)
                        {
                           _loc2_ = ["喇叭状龟头","犀牛龟头"];
                           break;
                        }
                        if(_loc3_ == CockTypesEnum.TENTACLE)
                        {
                           _loc2_ = ["蘑菇状尖端","宽大的植物状冠部"];
                           break;
                        }
                        _loc2_ = ["冠部","龟头","头部","肉棒头"];
                        break;
                     }
                  }
               }
               _loc2_ = ["尖头","狭窄的尖端"];
               break;
            }
         }
         return _loc2_[Utils.rand(int(_loc2_.length))];
      }
      
      public function cockDescriptShort(param1:int = 0) : String
      {
         if(int(cocks.length) == 0)
         {
            return "<B>错误。为 cockDescriptShort 指定了无效的生物</B>";
         }
         var _loc2_:String = "";
         if(Utils.rand(3) == 0)
         {
            if(cocks[param1].cockLength >= 30)
            {
               _loc2_ = "高耸的";
            }
            else if(cocks[param1].cockLength >= 18)
            {
               _loc2_ = "巨大的";
            }
            else if(cocks[param1].cockLength >= 13)
            {
               _loc2_ = "粗大的";
            }
            else if(cocks[param1].cockLength >= 10)
            {
               _loc2_ = "巨大的";
            }
            else if(cocks[param1].cockLength >= 7)
            {
               _loc2_ = "长的";
            }
            else if(cocks[param1].cockLength >= 5)
            {
               _loc2_ = "普通的";
            }
            else
            {
               _loc2_ = "短的";
            }
         }
         else if(Utils.rand(2) == 0)
         {
            if(cocks[param1].cockThickness <= 0.75)
            {
               _loc2_ = "窄的";
            }
            if(cocks[param1].cockThickness > 1 && cocks[param1].cockThickness <= 1.4)
            {
               _loc2_ = "丰满的";
            }
            if(cocks[param1].cockThickness > 1.4 && cocks[param1].cockThickness <= 2)
            {
               _loc2_ = "宽大的";
            }
            if(cocks[param1].cockThickness > 2 && cocks[param1].cockThickness <= 3.5)
            {
               _loc2_ = "肥硕的";
            }
            if(cocks[param1].cockThickness > 3.5)
            {
               _loc2_ = "鼓胀的";
            }
         }
         return _loc2_ + Appearance.cockNoun(cocks[param1].get_cockType(),hasCockNotOfType(CockTypesEnum.HUMAN));
      }
      
      public function cockDescript(param1:int = 0) : String
      {
         return Appearance.cockDescript(this,param1);
      }
      
      public function cockClit(param1:int = 0) : String
      {
         if(hasCock() && param1 >= 0 && param1 < cockTotal())
         {
            return cockDescript(param1);
         }
         return clitDescript();
      }
      
      public function cockArea(param1:int) : Number
      {
         if(param1 >= int(cocks.length) || param1 < 0)
         {
            return 0;
         }
         return cocks[param1].cockThickness * cocks[param1].cockLength;
      }
      
      public function cockAnimalityAdj(param1:int = 0) : String
      {
         return Appearance.cockAnimalityAdj(this,param1);
      }
      
      public function cockAdjective(param1:int = -1) : String
      {
         if(param1 < 0)
         {
            param1 = biggestCockIndex();
         }
         var _loc2_:Boolean = int(cocks.length) == 1 && cocks[param1].get_isPierced();
         var _loc3_:Boolean = int(cocks.length) == 1 && cocks[param1].sock != "";
         var _loc4_:Boolean = skin.type == 3;
         return Appearance.cockAdjective(cocks[param1].get_cockType(),cocks[param1].cockLength,cocks[param1].cockThickness,int(get_lust()),cumQ(),_loc2_,_loc3_,_loc4_);
      }
      
      public function clumsy() : void
      {
         isClumsy = true;
      }
      
      public function clitDescript() : String
      {
         return Appearance.clitDescription(this);
      }
      
      public function clearGender() : void
      {
         balls = 0;
         while(hasCock())
         {
            removeCock(0,1);
         }
         while(hasVagina())
         {
            removeVagina(0,1);
         }
         while(int(breastRows.length) > 1)
         {
            removeBreastRow(0,1);
         }
         if(hasBreasts())
         {
            breastRows[0].breastRating = 0;
         }
      }
      
      public function clawsDescript(param1:Boolean = true) : String
      {
         var _loc2_:String = arms.claws.tone == "" ? " " : ", " + arms.claws.tone + " ";
         var _loc3_:String = "指甲";
         switch(arms.claws.type)
         {
            case 0:
               _loc3_ = "指甲";
               break;
            case 1:
            case 3:
            case 5:
            case 6:
            case 10:
            case 11:
            case 12:
               _loc3_ = "短而弯曲的" + _loc2_ + "爪子";
               break;
            case 2:
               _loc3_ = "强壮弯曲的" + _loc2_ + "爪子";
               break;
            case 4:
               _loc3_ = "长而弯曲的" + _loc2_ + "爪子";
               break;
            case 8:
               _loc3_ = "长长的" + _loc2_ + "爪子";
         }
         if(param1)
         {
            _loc3_ += "s";
         }
         return _loc3_;
      }
      
      public function chestDesc() : String
      {
         if(biggestTitSize() < 1)
         {
            return "胸部";
         }
         return Appearance.biggestBreastSizeDescript(this);
      }
      
      public function checkVaginaPresent() : void
      {
         if(!hasVagina())
         {
            throw new IllegalOperationError("生物没有阴道。");
         }
      }
      
      public function changeStatusValue(param1:StatusEffectType, param2:int = 1, param3:Number = 0) : void
      {
         var _loc4_:StatusEffect = statusEffectByType(param1);
         if(_loc4_ == null)
         {
            return;
         }
         switch(param2)
         {
            case 1:
               _loc4_.value1 = param3;
               break;
            case 2:
               _loc4_.value2 = param3;
               break;
            case 3:
               _loc4_.value3 = param3;
               break;
            case 4:
               _loc4_.value4 = param3;
               break;
            default:
               CoC_Settings.error("调用 ChangeStatusValue 时使用了无效的状态数值编号。");
         }
      }
      
      public function changeFatigue(param1:Number, param2:Number = 0) : Number
      {
         var _loc3_:Number = NaN;
         if(param2 == FATIGUE_MAGICAL)
         {
            param1 = spellCost(param1);
            if(hasPerk(PerkLib.BloodMage))
            {
               takeDamage(param1);
               return param1;
            }
         }
         if(param2 == FATIGUE_PHYSICAL)
         {
            param1 = physicalCost(param1);
         }
         if(param2 == FATIGUE_MAGICAL_HEAL)
         {
            param1 = spellCost(param1);
         }
         if(get_fatigue() >= maxFatigue() && param1 > 0)
         {
            return param1;
         }
         if(get_fatigue() <= 0 && param1 < 0)
         {
            return param1;
         }
         if(param1 < 0)
         {
            _loc3_ = 1;
            if(hasPerk(PerkLib.HistorySlacker))
            {
               _loc3_ *= 1.2;
            }
            if(hasPerk(PerkLib.ControlledBreath) && isPureEnough(30))
            {
               _loc3_ *= 1.1;
            }
            if(hasPerk(PerkLib.SpeedyRecovery))
            {
               _loc3_ *= 1.5;
            }
            if(isChild())
            {
               _loc3_ *= 1.3;
            }
            if(isTeen())
            {
               _loc3_ *= 1.25;
            }
            param1 *= _loc3_;
         }
         if(param1 > 0)
         {
            if(hasStatusEffect(StatusEffects.GlobalFatigue))
            {
               param1 *= 1 + statusEffectv1(StatusEffects.GlobalFatigue) / 100;
            }
            if(hasGills() && lowerBody.type == 32)
            {
               param1 *= 1.1;
            }
         }
         set_fatigue(get_fatigue() + param1);
         if(get_fatigue() > maxFatigue())
         {
            set_fatigue(maxFatigue());
         }
         if(get_fatigue() < 0)
         {
            set_fatigue(0);
         }
         get_game().output.statScreenRefresh();
         return param1;
      }
      
      public function changeClitLength(param1:Number, param2:int = 0) : Number
      {
         checkVaginaPresent();
         var _loc3_:Vagina = vaginas[param2];
         var _loc4_:Number = _loc3_.clitLength = _loc3_.clitLength + param1;
         if(_loc4_ < 0)
         {
            return 0;
         }
         return _loc4_;
      }
      
      public function chanceToHit(param1:Creature = undefined) : Number
      {
         if(param1 == null)
         {
            if(this is Monster)
            {
               param1 = get_game().player;
            }
            if(this is Player)
            {
               param1 = get_game().monster;
            }
         }
         var _loc2_:Number = 95;
         if(statusEffectv1(StatusEffects.Resolve) == 3)
         {
            _loc2_ += statusEffectv3(StatusEffects.Resolve);
         }
         if(statusEffectv1(StatusEffects.Resolve) == 4)
         {
            _loc2_ -= statusEffectv2(StatusEffects.Resolve);
         }
         if(hasStatusEffect(StatusEffects.Blind) && !hasPerk(PerkLib.BlindImmune))
         {
            _loc2_ *= 0.33;
         }
         if(hasStatusEffect(StatusEffects.VolcanicFrenzy))
         {
            _loc2_ -= 20;
         }
         _loc2_ += get_weaponAcc();
         _loc2_ += getBonusStat("命中率");
         if(hasPerk(PerkLib.Bloodhound) && param1.isBleeding())
         {
            _loc2_ += 10;
         }
         _loc2_ *= getBonusStatMultiplicative("命中率");
         if(_loc2_ < 10)
         {
            _loc2_ = 10;
         }
         return Math.round(_loc2_);
      }
      
      public function canUseStare() : Boolean
      {
         return [5,8].indexOf(eyes.type) != -1;
      }
      
      public function canTitFuck() : Boolean
      {
         var _loc3_:* = null as BreastRow;
         var _loc1_:int = 0;
         var _loc2_:Array = breastRows;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.breasts >= 2 && _loc3_.breastRating > 3)
            {
               return true;
            }
         }
         return false;
      }
      
      public function canParry() : Boolean
      {
         if(hasStatusEffect(StatusEffects.Retribution))
         {
            return false;
         }
         if(hasStatusEffect(StatusEffects.TFSupercharging))
         {
            return false;
         }
         if(hasPerk(PerkLib.Parry) && weaponCanParry() && get_spe() >= 50)
         {
            return get_str() >= 50;
         }
         return false;
      }
      
      public function canOvipositSpider() : Boolean
      {
         if(eggs() >= 10 && hasPerk(PerkLib.SpiderOvipositor) && isDrider())
         {
            return tail.type == 5;
         }
         return false;
      }
      
      public function canOvipositBee() : Boolean
      {
         if(eggs() >= 10 && hasPerk(PerkLib.BeeOvipositor))
         {
            return tail.type == 6;
         }
         return false;
      }
      
      public function canOviposit() : Boolean
      {
         if(!canOvipositSpider())
         {
            return canOvipositBee();
         }
         return true;
      }
      
      public function canMove() : Boolean
      {
         if(!isImmobilized && !hasPerk(PerkLib.Immovable))
         {
            return !hasStatusEffect(StatusEffects.Stunned);
         }
         return false;
      }
      
      public function canFly() : Boolean
      {
         if(hasStatusEffect(StatusEffects.Web))
         {
            return false;
         }
         return BodyPartLists.CAN_FLY_WINGS.indexOf(wings.type) != -1;
      }
      
      public function canAutoFellate() : Boolean
      {
         if(!hasCock())
         {
            return false;
         }
         return cocks[0].cockLength >= 20;
      }
      
      public function buttVirgin() : Boolean
      {
         return ass.analLooseness == 0;
      }
      
      public function buttChangeNoDisplay(param1:Number) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 >= analCapacity() && Utils.rand(2) == 0)
         {
            _temp_1.analLooseness += 1;
            _loc2_ = true;
            if(hasStatusEffect(StatusEffects.ButtStretched))
            {
               changeStatusValue(StatusEffects.ButtStretched,1,0);
            }
         }
         if(param1 < analCapacity() && param1 >= 0.9 * analCapacity() && Utils.rand(4) == 0)
         {
            _temp_2.analLooseness += 1;
            _loc2_ = true;
         }
         if(param1 < 0.9 * analCapacity() && param1 >= 0.75 * analCapacity() && Utils.rand(10) == 0)
         {
            _temp_3.analLooseness += 1;
            _loc2_ = true;
         }
         if(ass.analLooseness == 0)
         {
            _temp_4.analLooseness += 1;
            _loc2_ = true;
         }
         if(ass.analLooseness > 5)
         {
            ass.analLooseness = 5;
         }
         if(param1 >= 0.5 * analCapacity())
         {
            if(!hasStatusEffect(StatusEffects.ButtStretched))
            {
               createStatusEffect(StatusEffects.ButtStretched,0,0,0,0);
            }
            else
            {
               changeStatusValue(StatusEffects.ButtStretched,1,0);
            }
         }
         return _loc2_;
      }
      
      public function breastSize(param1:Number) : String
      {
         return Appearance.breastSize(param1);
      }
      
      public function breastDescript(param1:int) : String
      {
         if(param1 == -1)
         {
            param1 = int(breastRows.length) - 1;
         }
         if(int(breastRows.length) - 1 < param1)
         {
            CoC_Settings.error("");
            return "<b>错误，breastDescript() 处理了无效的乳排</b>";
         }
         if(int(breastRows.length) == 0)
         {
            CoC_Settings.error("");
            return "<b>错误，在没有乳房的情况下调用了 breastDescript()。</b>";
         }
         return BreastStore.breastDescript(int(breastRows[param1].breastRating),breastRows[param1].lactationMultiplier);
      }
      
      public function breastCup(param1:int) : String
      {
         if(param1 == -1)
         {
            param1 = int(breastRows.length) == 0 ? 0 : int(breastRows.length) - 1;
         }
         return Appearance.breastCup(breastRows[param1].breastRating);
      }
      
      public function boostLactation(param1:Number) : Number
      {
         if(int(breastRows.length) == 0)
         {
            return 0;
         }
         var _loc2_:int = int(breastRows.length);
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(param1 >= 0)
         {
            if(hasStatusEffect(StatusEffects.LactationReduction))
            {
               changeStatusValue(StatusEffects.LactationReduction,1,0);
            }
            if(hasStatusEffect(StatusEffects.LactationReduc0))
            {
               removeStatusEffect(StatusEffects.LactationReduc0);
            }
            if(hasStatusEffect(StatusEffects.LactationReduc1))
            {
               removeStatusEffect(StatusEffects.LactationReduc1);
            }
            if(hasStatusEffect(StatusEffects.LactationReduc2))
            {
               removeStatusEffect(StatusEffects.LactationReduc2);
            }
            if(hasStatusEffect(StatusEffects.LactationReduc3))
            {
               removeStatusEffect(StatusEffects.LactationReduc3);
            }
         }
         if(param1 > 0)
         {
            while(param1 > 0)
            {
               _loc2_ = int(breastRows.length);
               param1 -= 0.1;
               while(_loc2_ > 0)
               {
                  _loc2_--;
                  if(breastRows[_loc3_].lactationMultiplier > breastRows[_loc2_].lactationMultiplier)
                  {
                     _loc3_ = _loc2_;
                  }
               }
               _loc5_ = 0.1;
               if(breastRows[_loc3_].lactationMultiplier > 1.5)
               {
                  _loc5_ /= 2;
               }
               if(breastRows[_loc3_].lactationMultiplier > 2.5)
               {
                  _loc5_ /= 2;
               }
               if(breastRows[_loc3_].lactationMultiplier > 3)
               {
                  _loc5_ /= 2;
               }
               _loc4_ += _loc5_;
               _temp_1.lactationMultiplier += _loc5_;
            }
         }
         else
         {
            while(param1 < 0)
            {
               _loc2_ = int(breastRows.length);
               _loc3_ = 0;
               if(param1 > -0.1)
               {
                  while(_loc2_ > 0)
                  {
                     _loc2_--;
                     if(breastRows[_loc3_].lactationMultiplier < breastRows[_loc2_].lactationMultiplier)
                     {
                        _loc3_ = _loc2_;
                     }
                  }
                  _temp_2.lactationMultiplier += param1;
                  if(breastRows[_loc3_].lactationMultiplier < 0)
                  {
                     breastRows[_loc3_].lactationMultiplier = 0;
                  }
                  param1 = 0;
               }
               else
               {
                  param1 += 0.1;
                  while(_loc2_ > 0)
                  {
                     _loc2_--;
                     if(breastRows[_loc3_].lactationMultiplier < breastRows[_loc2_].lactationMultiplier)
                     {
                        _loc3_ = _loc2_;
                     }
                  }
                  _loc5_ = param1;
                  _loc4_ += _loc5_;
                  _temp_3.lactationMultiplier += _loc5_;
                  if(breastRows[_loc3_].lactationMultiplier < 0)
                  {
                     breastRows[_loc3_].lactationMultiplier = 0;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function bonusFertility() : Number
      {
         var _loc1_:Number = 0;
         if(get_inHeat())
         {
            _loc1_ += statusEffectv1(StatusEffects.Heat);
         }
         if(hasPerk(PerkLib.FertilityPlus))
         {
            _loc1_ += 15;
         }
         if(hasPerk(PerkLib.FertilityMinus) && get_lib100() < 25)
         {
            _loc1_ -= 15;
         }
         if(hasPerk(PerkLib.MaraesGiftFertility))
         {
            _loc1_ += 50;
         }
         if(hasPerk(PerkLib.FerasBoonBreedingBitch))
         {
            _loc1_ += 30;
         }
         if(hasPerk(PerkLib.MagicalFertility))
         {
            _loc1_ += 10 + perkv1(PerkLib.MagicalFertility) * 5;
         }
         if(hasPerk(PerkLib.MothBedding))
         {
            _loc1_ += 20;
         }
         _loc1_ += perkv2(PerkLib.ElvenBounty);
         _loc1_ += perkv1(PerkLib.PiercedFertite);
         if(get_jewelryEffectId() == 2)
         {
            _loc1_ += get_jewelryEffectMagnitude();
         }
         return _loc1_ + perkv1(PerkLib.AscensionFertility) * 5;
      }
      
      public function bleedIntensity() : Number
      {
         var _loc5_:* = null as StatusEffect;
         var _loc6_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = statusEffects;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_.get_stype() == StatusEffects.IzmaBleed)
            {
               _loc6_ = _loc5_.value2;
               _loc2_ = Math.max(_loc2_,_loc6_);
               _loc1_ += _loc6_;
            }
         }
         return _loc2_ + (_loc1_ - _loc2_) / 10;
      }
      
      public function bleedDamage(param1:Boolean = false, param2:Boolean = false) : int
      {
         var _loc3_:Number = Utils.randBetween(3,6);
         if(param1)
         {
            _loc3_ = 6;
         }
         if(param2)
         {
            _loc3_ = 3;
         }
         _loc3_ *= bleedIntensity();
         return int(maxHP() * _loc3_ / 100);
      }
      
      public function bleed(param1:Creature, param2:int = 3, param3:Number = 1, param4:Boolean = false) : Boolean
      {
         if(!(hasPerk(PerkLib.BleedImmune) || skin.type == 3) || param4 || param1.get_jewelryEffectId() == 12)
         {
            if(param1.hasPerk(PerkLib.AntiCoagulant))
            {
               param2++;
            }
            if(param1.get_jewelryEffectId() == 12)
            {
               param2++;
            }
            createStatusEffectAllowDuplicates(StatusEffects.IzmaBleed,param2,param3,0,0);
            return true;
         }
         return false;
      }
      
      public function biggestTitSize() : Number
      {
         var _loc4_:* = null as BreastRow;
         var _loc1_:Number = -1;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = Math.max(_loc1_,_loc4_.breastRating);
         }
         return _loc1_;
      }
      
      public function biggestTitRow() : int
      {
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         var _loc3_:int = int(breastRows.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(breastRows[_loc4_].breastRating > breastRows[_loc1_].breastRating)
            {
               _loc1_ = _loc4_;
            }
         }
         return _loc1_;
      }
      
      public function biggestLactation() : Number
      {
         var _loc4_:* = null as BreastRow;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ = Math.max(_loc1_,_loc4_.lactationMultiplier);
         }
         return _loc1_;
      }
      
      public function biggestCockLength() : Number
      {
         if(int(cocks.length) <= 0)
         {
            return 0;
         }
         var _loc1_:Cock = cocks[biggestCockIndex()];
         var _loc2_:Object = _loc1_ != null ? _loc1_.cockLength : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return 0;
      }
      
      public function biggestCockIndex3() : int
      {
         if(int(cocks.length) <= 2)
         {
            return 0;
         }
         return int(cocksBySize()[2].index);
      }
      
      public function biggestCockIndex2() : int
      {
         if(int(cocks.length) <= 1)
         {
            return 0;
         }
         return int(cocksBySize()[1].index);
      }
      
      public function biggestCockIndex() : int
      {
         if(int(cocks.length) == 0)
         {
            return 0;
         }
         return int(cocksBySize()[0].index);
      }
      
      public function biggestCockArea2() : Number
      {
         if(int(cocks.length) <= 1)
         {
            return 0;
         }
         return cockArea(biggestCockIndex2());
      }
      
      public function biggestCockArea() : Number
      {
         var _loc4_:int = 0;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(cocks.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc1_ = Math.max(_loc1_,cockArea(_loc4_));
         }
         return _loc1_;
      }
      
      public function biggestBreastSizeDescript() : String
      {
         return Appearance.biggestBreastSizeDescript(this);
      }
      
      public function ballsDescriptLight(param1:Boolean = true, param2:Boolean = false) : String
      {
         return Appearance.ballsDescription(param1,true,this,param2);
      }
      
      public function ballsDescript(param1:Boolean = true, param2:Boolean = false) : String
      {
         return ballsDescriptLight(param1,param2);
      }
      
      public function ballDescript(param1:Boolean = true, param2:Boolean = false) : String
      {
         return Appearance.ballsDescription(param1,false,this,param2);
      }
      
      public function bRows() : int
      {
         return int(breastRows.length);
      }
      
      public function averageVaginalWetness() : Number
      {
         var _loc4_:* = null as Vagina;
         if(int(vaginas.length) == 0)
         {
            return 2;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = vaginas;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.vaginalWetness;
         }
         return _loc1_ / int(vaginas.length);
      }
      
      public function averageVaginalLooseness() : Number
      {
         var _loc4_:* = null as Vagina;
         if(int(vaginas.length) == 0)
         {
            return 2;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = vaginas;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.vaginalLooseness;
         }
         return _loc1_ / int(vaginas.length);
      }
      
      public function averageNipplesPerBreast() : Number
      {
         var _loc5_:* = null as BreastRow;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = breastRows;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc1_ += _loc5_.breasts;
            _loc2_ += _loc5_.breasts * _loc5_.nipplesPerBreast;
         }
         if(_loc1_ == 0)
         {
            return 0;
         }
         return Math.floor(_loc2_ / _loc1_);
      }
      
      public function averageNippleLength() : Number
      {
         var _loc4_:* = null as BreastRow;
         if(int(breastRows.length) == 0)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.breastRating / 10 + 0.2;
         }
         return _loc1_ / int(breastRows.length);
      }
      
      public function averageLactation() : Number
      {
         var _loc4_:* = null as BreastRow;
         if(int(breastRows.length) == 0)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.lactationMultiplier;
         }
         return Math.floor(_loc1_ / int(breastRows.length));
      }
      
      public function averageCockThickness() : Number
      {
         var _loc4_:* = null as Cock;
         if(int(cocks.length) == 0)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.cockThickness;
         }
         return _loc1_ / int(cocks.length);
      }
      
      public function averageCockLength() : Number
      {
         var _loc4_:* = null as Cock;
         if(int(cocks.length) == 0)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.cockLength;
         }
         return _loc1_ / int(cocks.length);
      }
      
      public function averageBreastSize() : Number
      {
         var _loc4_:* = null as BreastRow;
         if(int(breastRows.length) == 0)
         {
            return 0;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = breastRows;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_ += _loc4_.breastRating;
         }
         return _loc1_ / int(breastRows.length);
      }
      
      public function attackOfOpportunity() : void
      {
      }
      
      public function attackCountered(param1:Creature) : Boolean
      {
         if(param1.hasStatusEffect(StatusEffects.Retribution))
         {
            return false;
         }
         if(param1.hasStatusEffect(StatusEffects.CounterAB))
         {
            if(Utils.rand(get_spe() + 30) < Utils.rand(param1.get_spe()))
            {
               param1.changeStatusValue(StatusEffects.CounterAB,1,1);
               return true;
            }
         }
         return false;
      }
      
      public function atrophy() : void
      {
         isAtrophied = true;
      }
      
      public function assholeOrPussy() : String
      {
         return Appearance.assholeOrPussy(this);
      }
      
      public function assholeDescript() : String
      {
         return Appearance.assholeDescript(this);
      }
      
      public function ascensionFactor(param1:Number = 25) : Number
      {
         return newGamePlusMod() * param1;
      }
      
      public function analCapacity() : Number
      {
         var _loc1_:Number = 0;
         if(isTaur())
         {
            _loc1_ = 30;
         }
         if(hasPerk(PerkLib.HistorySlut))
         {
            _loc1_ += 20;
         }
         if(hasPerk(PerkLib.Cornucopia))
         {
            _loc1_ += 30;
         }
         if(hasPerk(PerkLib.OneTrackMind))
         {
            _loc1_ += 10;
         }
         if(ass.analWetness > 0)
         {
            _loc1_ += 15;
         }
         return (_loc1_ + statusEffectv1(StatusEffects.BonusACapacity) + 6 * ass.analLooseness * ass.analLooseness) * (1 + ass.analWetness / 10);
      }
      
      public function allVaginaDescript() : String
      {
         if(int(vaginas.length) == 1)
         {
            return vaginaDescript(Utils.rand(int(vaginas.length) - 1));
         }
         return vaginaDescript(Utils.rand(int(vaginas.length) - 1)) + "s";
      }
      
      public function allChestDesc() : String
      {
         if(biggestTitSize() < 1)
         {
            return "胸部";
         }
         return allBreastsDescript();
      }
      
      public function allBreastsDescript() : String
      {
         return Appearance.allBreastsDescript(this);
      }
      
      public function ageDesc(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "儿童";
         }
         if(param2 == null)
         {
            param2 = "青少年";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "长者";
         }
         switch(age)
         {
            case 1:
               return param1;
            case 2:
               return param2;
            case 3:
               return param4;
            default:
               return param3;
         }
      }
      
      public function addStatusValue(param1:StatusEffectType, param2:int = 1, param3:Number = 0) : void
      {
         var _loc4_:StatusEffect = statusEffectByType(param1);
         if(_loc4_ == null)
         {
            return;
         }
         switch(param2)
         {
            case 1:
               _loc4_.value1 += param3;
               break;
            case 2:
               _loc4_.value2 += param3;
               break;
            case 3:
               _loc4_.value3 += param3;
               break;
            case 4:
               _loc4_.value4 += param3;
               break;
            default:
               CoC_Settings.error("调用 ChangeStatusValue 时使用了无效的状态数值编号。");
         }
      }
      
      public function addStatusEffect(param1:StatusEffect) : void
      {
         if(param1.get_host() != this)
         {
            param1.remove();
            param1.attach(this);
         }
         else
         {
            statusEffects.push(param1);
            param1.addedToHostList(this,true);
         }
         addBonusStats(param1.bonusStats);
      }
      
      public function addPerkValue(param1:PerkType, param2:int = 1, param3:Number = 0) : void
      {
         var _loc4_:Perk = getPerk(param1);
         if(_loc4_ == null)
         {
            CoC_Settings.error("错误？正在寻找特质 \'" + Std.string(param1) + "\' 以更改数值 " + param2 + "，但玩家没有该特质。");
            return;
         }
         switch(param2)
         {
            case 1:
               _loc4_.value1 += param3;
               break;
            case 2:
               _loc4_.value2 += param3;
               break;
            case 3:
               _loc4_.value3 += param3;
               break;
            case 4:
               _loc4_.value4 += param3;
               break;
            default:
               CoC_Settings.error("addPerkValue(" + param1.get_id() + ", " + param2 + ", " + param3 + ").");
         }
      }
      
      public function addMastery(param1:MasteryType, param2:int = 0, param3:int = 0, param4:Boolean = true, param5:Boolean = false) : void
      {
         var _loc6_:int = findMastery(param1);
         if(_loc6_ == -1)
         {
            _masteries.push(new Mastery(param1,param2,param3));
            addBonusStats(param1.bonusStats);
            param1.host = this;
            _masteries[int(_masteries.length) - 1].onAttach(param4);
         }
         else if(param5 || param2 > _masteries[_loc6_].get_level())
         {
            _masteries[_loc6_].set_level(param2);
            _masteries[_loc6_].set_xp(param3);
         }
         else if(param2 == _masteries[_loc6_].get_level())
         {
            _masteries[_loc6_].set_xp(int(Math.max(param3,_masteries[_loc6_].get_xp())));
         }
      }
      
      public function addHorseCock() : int
      {
         var _loc1_:int = int(cocks.length);
         while(_loc1_ > 0)
         {
            _loc1_--;
            if(cocks[_loc1_].get_cockType() != CockTypesEnum.HORSE)
            {
               cocks[_loc1_].set_cockType(CockTypesEnum.HORSE);
               return _loc1_;
            }
         }
         return -1;
      }
      
      public function addEggs(param1:int = 0) : int
      {
         if(!hasPerk(PerkLib.SpiderOvipositor) && !hasPerk(PerkLib.BeeOvipositor))
         {
            return -1;
         }
         if(hasPerk(PerkLib.SpiderOvipositor))
         {
            addPerkValue(PerkLib.SpiderOvipositor,1,param1);
            if(eggs() > 50)
            {
               setPerkValue(PerkLib.SpiderOvipositor,1,50);
            }
            return int(perkv1(PerkLib.SpiderOvipositor));
         }
         addPerkValue(PerkLib.BeeOvipositor,1,param1);
         if(eggs() > 50)
         {
            setPerkValue(PerkLib.BeeOvipositor,1,50);
         }
         return int(perkv1(PerkLib.BeeOvipositor));
      }
      
      public function addCombatBuff(param1:String, param2:Number) : Number
      {
         var _loc3_:String = param1;
         if(_loc3_ != "int")
         {
            if(_loc3_ != "inte")
            {
               if(_loc3_ == "spe")
               {
                  return createOrFindStatusEffect(StatusEffects.GenericCombatSpeBuff).applyEffect(param2);
               }
               if(_loc3_ == "str")
               {
                  return createOrFindStatusEffect(StatusEffects.GenericCombatStrBuff).applyEffect(param2);
               }
               if(_loc3_ == "tou")
               {
                  return createOrFindStatusEffect(StatusEffects.GenericCombatTouBuff).applyEffect(param2);
               }
               CoC_Settings.error("/!\\ 错误：addCombatBuff(\'" + param1 + "\', " + param2 + ")");
               return 0;
            }
         }
         return createOrFindStatusEffect(StatusEffects.GenericCombatInteBuff).applyEffect(param2);
      }
      
      public function addCombatBonusStat(param1:String, param2:Function, param3:Boolean = false) : StatusEffect
      {
         var _loc4_:CombatBonusStatBuff = createOrFindStatusEffect(StatusEffects.GenericBonusStatBuff);
         removeBonusStats(_loc4_.bonusStats);
         _loc4_.addBonus(param1,param2,param3);
         addBonusStats(_loc4_.bonusStats);
         return _loc4_;
      }
      
      public function addBonusStats(param1:BonusDerivedStats) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Bonus;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null as String;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as StringMap;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Array;
         var _loc2_:* = new MapKeyValueIterator(param1.statArray);
         while(Boolean(_loc2_.hasNext()))
         {
            _loc3_ = _loc2_.next();
            _loc4_ = _loc3_.key;
            _loc5_ = _loc3_.value;
            _loc6_ = bonusStats;
            _loc7_ = _loc4_;
            _loc8_ = _loc7_ in StringMap.reserved ? _loc6_.getReserved(_loc7_) : _loc6_.h[_loc7_];
            if(_loc8_ != null)
            {
               _loc8_.push(_loc5_);
            }
            else
            {
               _loc9_ = bonusStats;
               _loc10_ = _loc4_;
               _loc11_ = [_loc5_];
               if(_loc10_ in StringMap.reserved)
               {
                  _loc9_.setReserved(_loc10_,_loc11_);
               }
               else
               {
                  _loc9_.h[_loc10_] = _loc11_;
               }
            }
         }
      }
      
      public function _cockIndex(param1:Function) : int
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 1;
         var _loc4_:int = int(cocks.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            if(Boolean(param1(cocks[_loc5_],cocks[_loc2_])))
            {
               _loc2_ = _loc5_;
            }
         }
         return _loc2_;
      }
      
      public function SMultiCockDesc() : String
      {
         return (int(cocks.length) > 1 ? "你的其中一根" : "你的") + cockMultiLDescriptionShort();
      }
      
      public function OMultiCockDesc() : String
      {
         return (int(cocks.length) > 1 ? "你的每根" : "你的") + cockMultiLDescriptionShort();
      }
      
      public function LustRatio() : Number
      {
         return get_lust() / maxLust();
      }
      
      public function HPRatio() : Number
      {
         return get_HP() / maxHP();
      }
      
      public function HPChangeNotify(param1:Number) : void
      {
      }
      
      public function HPChange(param1:Number, param2:Boolean, param3:Boolean = false) : Number
      {
         if(hasStatusEffect(StatusEffects.TFShell))
         {
            param1 = 0;
         }
         if(hasStatusEffect(StatusEffects.Withering) && param1 > 0 && !param3)
         {
            param1 *= -0.6;
         }
         var _loc4_:Number = param1;
         if(param1 == 0)
         {
            return 0;
         }
         if(param1 > 0)
         {
            if(hasPerk(PerkLib.HistoryHealer))
            {
               param1 *= 1.2;
            }
            if(get_armorName() == "skimpy nurse\'s outfit")
            {
               param1 *= 1.1;
            }
            if(get_HP() + int(param1) >= maxHP())
            {
               _loc4_ = maxHP() - get_HP();
               if(hasStatusEffect(StatusEffects.Overhealing))
               {
                  addStatusValue(StatusEffects.Overhealing,1,(param1 - _loc4_) / 2);
                  _loc4_ += (param1 - _loc4_) / 2;
                  if(statusEffectv1(StatusEffects.Overhealing) >= 0.5 * maxHPUnmodified())
                  {
                     changeStatusValue(StatusEffects.Overhealing,1,0.5 * maxHPUnmodified());
                     _loc4_ += 1.5 * maxHPUnmodified();
                  }
               }
            }
            if(this is Player)
            {
               get_game().mainView.statsView.showStatUp("hp");
            }
         }
         else
         {
            if(get_HP() + param1 <= 0)
            {
               _loc4_ -= get_HP();
               set_HP(0);
            }
            if(this is Player)
            {
               get_game().mainView.statsView.showStatDown("hp");
               if(hasStatusEffect(StatusEffects.EmpathicAgony) && get_game().get_inCombat() && get_game().monster != null && get_game().combat.playerTurn)
               {
                  get_game().monster.takeDamage(-param1,true);
               }
            }
         }
         set_HP(get_HP() + _loc4_);
         dynStats(DynStat.Lust(0),DynStat.NoScale);
         get_game().output.statScreenRefresh();
         if(param2)
         {
            HPChangeNotify(param1);
         }
         return param1;
      }
   }
}

