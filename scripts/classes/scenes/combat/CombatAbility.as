package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SettingsModes;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.internals._ValueFunc.ValueFunc_Impl_;
   import classes.scenes.areas.glacialRift.FrostGiant;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Option;
   
   public class CombatAbility extends BaseContent
   {
      
      public static var WHITE_MAGIC:int = 0;
      
      public static var BLACK_MAGIC:int = 1;
      
      public static var PHYSICAL:int = 2;
      
      public static var MAGICAL:int = 3;
      
      public static var GRAY_MAGIC:int = 4;
      
      public static var TERRESTRIAL_FIRE:int = 5;
      
      public static var WHITEBLACKGRAY:int = 6;
      
      public static var PASSIVE:int = 7;
      
      public static var TEASE:int = 8;
      
      public static var MOVEMENT:int = 9;
      
      public static var typeArray:Array = [1,1,2,1,1,1,1,0];
      
      public var used:Boolean;
      
      public var useCount:int;
      
      public var spellName:String;
      
      public var oneUse:Boolean;
      
      public var isWeaponAbility:Boolean;
      
      public var isSelf:Boolean;
      
      public var isHeal:Boolean;
      
      public var isFree:Boolean;
      
      public var isBow:Boolean;
      
      public var fatigueType:int;
      
      public var currCooldown:int;
      
      public var cooldown:int;
      
      public var clearScreen:Boolean;
      
      public var abilityFunc:Function;
      
      public var _tooltip:Function;
      
      public var _spellShort:Function;
      
      public var _range:Function;
      
      public var _disabledWhen:Function;
      
      public var _disabledTooltip:Function;
      
      public var _cost:Function;
      
      public var _availableWhen:Function;
      
      public var _abilityType:Function;
      
      public var ID:String;
      
      public function CombatAbility(param1:AbilityDef = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         useCount = 0;
         _range = ValueFunc_Impl_.fromT(CombatRange.Omni);
         currCooldown = 0;
         fatigueType = 0;
         used = false;
         super();
         abilityFunc = param1.abilityFunc;
         _tooltip = param1.tooltip;
         _availableWhen = param1.availableWhen;
         _disabledWhen = param1.disabledWhen;
         _disabledTooltip = param1.disabledTooltip;
         _cost = param1.cost;
         spellName = param1.spellName;
         _spellShort = param1.spellShort;
         _abilityType = param1.abilityType;
         isHeal = param1.isHeal;
         isFree = param1.isFree;
         isSelf = param1.isSelf;
         isBow = param1.isBow;
         oneUse = param1.oneUse;
         clearScreen = param1.clearScreen;
         fatigueType = isHeal ? 3 : int(CombatAbility.typeArray[get_abilityType()]);
         cooldown = param1.cooldown;
         currCooldown = cooldown;
         _range = param1.range;
         isWeaponAbility = param1.isWeaponAbility;
         ID = param1.ID != null ? param1.ID : spellName;
         var _loc2_:Object = Reflect.field(get_combatAbilities().saveContent.abilityUsage,ID);
         set_useCount(_loc2_ != null ? int(_loc2_) : 0);
      }
      
      public function set_useCount(param1:int) : int
      {
         useCount = param1;
         var _loc2_:* = get_combatAbilities().saveContent.abilityUsage;
         var _loc3_:int = useCount;
         _loc2_[ID] = _loc3_;
         return param1;
      }
      
      public function makeButtonData() : Option
      {
         var _loc3_:* = null as String;
         if(!get_availableWhen())
         {
            return Option.None;
         }
         var _loc1_:Boolean = canUse();
         var _loc2_:String = get_tooltip();
         if(!_loc1_)
         {
            _loc3_ = disabledReason();
            if(_loc3_ == "black lust")
            {
               _loc2_ = "你还不够兴奋，无法使用任何黑魔法。";
            }
            else if(_loc3_ == "cooldown")
            {
               _loc2_ = "技能正在冷却中。还有 " + (cooldown - currCooldown) + " 回合可用。";
            }
            else if(_loc3_ == "disabledWhen")
            {
               _loc2_ = get_disabledTooltip();
            }
            else if(_loc3_ == "fatigue")
            {
               _loc2_ = "你太累了，无法使用这个技能。疲劳消耗：" + get_cost();
            }
            else if(_loc3_ == "range")
            {
               _loc2_ = "这个技能无法触及你的目标！";
            }
            else if(_loc3_ == "single use")
            {
               _loc2_ = "你在这场战斗中已经使用过这个技能了。";
            }
            else if(_loc3_ == "white lust")
            {
               _loc2_ = "你太发情了，无法集中精力施展白魔法。";
            }
            else
            {
               _loc2_ = get_tooltip();
            }
         }
         return Option.Some(new ButtonData(get_spellShort(),execAbility,_loc2_,spellName,_loc1_));
      }
      
      public function magicSwitch() : Boolean
      {
         switch(get_abilityType())
         {
            case 0:
            case 1:
            case 4:
            case 6:
               return get_player().usingMagicBW();
            case 5:
               return get_player().usingMagicTF();
            default:
               return true;
         }
      }
      
      public function isMagic() : Boolean
      {
         return !Boolean([2,7,8,9].contains(get_abilityType()));
      }
      
      public function get_tooltip() : String
      {
         var _loc1_:CombatAbility = get_combat().currAbilityUsed;
         get_combat().currAbilityUsed = this;
         var _loc2_:String = ValueFunc_Impl_.resolve(_tooltip);
         switch(get_range().index)
         {
            case 0:
               _loc2_ += "[pg-][b:近战]";
               break;
            case 1:
               _loc2_ += "[pg-][b:远程]";
               break;
            case 5:
               _loc2_ += "[pg-][b:近战，飞行]";
               break;
            case 6:
               _loc2_ += "[pg-][b:近战，冲锋]";
         }
         if(get_cost() > 0)
         {
            _loc2_ += "[pg]疲劳消耗：" + get_cost();
         }
         if(get_modeSettings().cooldowns && cooldown - 1 > 0)
         {
            _loc2_ += "[pg-]冷却时间：" + (cooldown - 1);
         }
         if(get_debug())
         {
            _loc2_ += "[pg]使用次数：" + useCount + " (" + Reflect.field(get_combatAbilities().saveContent.abilityUsage,ID) + ")";
         }
         get_combat().currAbilityUsed = _loc1_;
         return _loc2_;
      }
      
      public function get_spellShort() : String
      {
         return ValueFunc_Impl_.resolve(_spellShort);
      }
      
      public function get_range() : CombatRange
      {
         return ValueFunc_Impl_.resolve(_range);
      }
      
      public function get_disabledWhen() : Boolean
      {
         return Boolean(ValueFunc_Impl_.resolve(_disabledWhen));
      }
      
      public function get_disabledTooltip() : String
      {
         return ValueFunc_Impl_.resolve(_disabledTooltip);
      }
      
      public function get_cost() : Number
      {
         var _loc1_:Number = NumberFunc_Impl_.resolve(_cost);
         if(isFree)
         {
            return _loc1_;
         }
         switch(get_abilityType())
         {
            case 0:
            case 1:
            case 3:
            case 4:
            case 5:
               return Math.round(get_player().spellCost(_loc1_));
            case 2:
               return Math.round(get_player().physicalCost(_loc1_));
            default:
               return _loc1_;
         }
      }
      
      public function get_combatAbilities() : CombatAbilities
      {
         return get_game().combat.combatAbilities;
      }
      
      public function get_availableWhen() : Boolean
      {
         if(magicSwitch())
         {
            return Boolean(ValueFunc_Impl_.resolve(_availableWhen));
         }
         return false;
      }
      
      public function get_abilityType() : int
      {
         return int(ValueFunc_Impl_.resolve(_abilityType));
      }
      
      public function execAbility() : void
      {
         var _loc1_:* = null as IMap;
         var _loc4_:* = null as StatusEffect;
         currCooldown = 0;
         get_combatAbilities().currDamage = 0;
         if(clearScreen)
         {
            clearOutput();
         }
         used = true;
         get_combat().currAbilityUsed = this;
         get_combat().lastAbilityUsed = this;
         if(get_cost() > 0)
         {
            get_player().changeFatigue(NumberFunc_Impl_.resolve(_cost),fatigueType);
         }
         if(isMagic())
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,868,FlagDict_Impl_.arrayReadInt(_loc1_,868) + 1);
            get_player().masteryXP(MasteryLib.Casting,2 + Utils.rand(7));
         }
         if(!get_combat().beforePlayerTurn())
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().statusEffects;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!_loc4_.onAbilityUse(this))
            {
               return;
            }
         }
         if(get_monster().hasStatusEffect(StatusEffects.Shell) && !isSelf && isMagic())
         {
            outputText("当你的魔法一接触到[themonster]周围五颜六色的外壳，它就发出嘶嘶声并消散于无形。不管那是什么东西，它完全挡住了你的魔法！[pg]");
            get_combat().startMonsterTurn();
            statScreenRefresh();
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.Concentration) && !isSelf && get_abilityType() == 2)
         {
            outputText("多亏了[monster.his]对你动作的完全集中，[Themonster]轻松地滑步躲开了你的攻击。[pg]");
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster() is FrostGiant && get_player().hasStatusEffect(StatusEffects.GiantBoulder) && isMagic())
         {
            get_monster().giantBoulderHit(2);
            get_combat().startMonsterTurn();
            statScreenRefresh();
            return;
         }
         set_useCount(useCount + 1);
         abilityFunc();
         statScreenRefresh();
         if(get_range() == CombatRange.ChargingMelee)
         {
            get_combatRangeData().closeDistance(get_monster());
         }
         get_combat().checkAchievementDamage(get_combatAbilities().currDamage);
      }
      
      public function disabledReason(param1:Boolean = true) : String
      {
         if(!get_availableWhen())
         {
            return "availableWhen";
         }
         if(!get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,get_range()))
         {
            return "range";
         }
         if(get_abilityType() == 0 && get_player().get_lust() >= get_combatAbilities().getWhiteMagicLustCap())
         {
            return "white lust";
         }
         if(get_abilityType() == 1 && get_player().get_lust() < 50)
         {
            return "black lust";
         }
         if(get_player().get_fatigue() + get_cost() > get_player().maxFatigue() && (fatigueType != 1 || !get_player().hasPerk(PerkLib.BloodMage)))
         {
            return "fatigue";
         }
         if(param1 && used && oneUse)
         {
            return "single use";
         }
         if(param1 && currCooldown < cooldown && cooldown != 0 && get_modeSettings().cooldowns)
         {
            return "cooldown";
         }
         if(get_disabledWhen())
         {
            return "disabledWhen";
         }
         return "enabled";
      }
      
      public function createButton(param1:int = -1) : void
      {
         var _loc3_:* = null as String;
         var _loc2_:String = get_tooltip();
         if(get_availableWhen())
         {
            if(canUse())
            {
               if(param1 == -1)
               {
                  addNextButton(Utils.cnName(get_spellShort()),execAbility).hint(get_tooltip(),Utils.cnName(spellName));
               }
               else
               {
                  addButton(param1,Utils.cnName(get_spellShort()),execAbility).hint(get_tooltip(),Utils.cnName(spellName));
               }
            }
            else
            {
               _loc3_ = disabledReason();
               if(_loc3_ == "black lust")
               {
                  _loc2_ = "你还不够兴奋，无法使用任何黑魔法。";
               }
               else if(_loc3_ == "cooldown")
               {
                  _loc2_ = "技能正在冷却中。还要 " + (cooldown - currCooldown) + " 回合才能使用。";
               }
               else if(_loc3_ == "disabledWhen")
               {
                  _loc2_ = get_disabledTooltip();
               }
               else if(_loc3_ == "fatigue")
               {
                  _loc2_ = "你太累了，无法使用这个技能。疲劳消耗：" + get_cost();
               }
               else if(_loc3_ == "range")
               {
                  _loc2_ = "你无法用这个技能攻击到目标！";
               }
               else if(_loc3_ == "single use")
               {
                  _loc2_ = "你在这场战斗中已经使用过这个技能了。";
               }
               else if(_loc3_ == "white lust")
               {
                  _loc2_ = "你太发情了，无法集中精力使用白魔法。";
               }
               if(param1 == -1)
               {
                  addNextButtonDisabled(Utils.cnName(get_spellShort()),_loc2_,Utils.cnName(spellName));
               }
               else
               {
                  addButtonDisabled(param1,Utils.cnName(get_spellShort()),_loc2_,Utils.cnName(spellName));
               }
            }
         }
      }
      
      public function canUse(param1:Boolean = true, param2:Boolean = false, param3:Boolean = false) : Boolean
      {
         if(!get_availableWhen())
         {
            return false;
         }
         if(param1 && !get_combatRangeData().canReach(get_player(),get_monster(),get_monster().distance,get_range()))
         {
            return false;
         }
         if(!param3 && get_abilityType() == 0 && get_player().get_lust() >= get_combatAbilities().getWhiteMagicLustCap())
         {
            return false;
         }
         if(!param3 && get_abilityType() == 1 && get_player().get_lust() < 50)
         {
            return false;
         }
         if(!param2 && get_player().get_fatigue() + get_cost() > get_player().maxFatigue() && (fatigueType != 1 || !get_player().hasPerk(PerkLib.BloodMage)))
         {
            return false;
         }
         if(param1 && used && oneUse)
         {
            return false;
         }
         if(param1 && currCooldown < cooldown && cooldown != 0 && get_modeSettings().cooldowns)
         {
            return false;
         }
         if(get_disabledWhen())
         {
            return false;
         }
         return true;
      }
   }
}

