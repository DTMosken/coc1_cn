package classes
{
   import classes.internals.Utils;
   import flash.Boot;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class PerkType extends BaseContent implements BonusStatsInterface
   {
      
      public static var init__:Boolean;
      
      public static var PERK_LIBRARY:IMap;
      
      public var requirements:Array;
      
      public var host:Creature;
      
      public var defaultValue4:Number;
      
      public var defaultValue3:Number;
      
      public var defaultValue2:Number;
      
      public var defaultValue1:Number;
      
      public var bonusStats:BonusDerivedStats;
      
      public var _name:String;
      
      public var _longDesc:String;
      
      public var _keepOnAscension:Boolean;
      
      public var _id:String;
      
      public var _enemyDesc:String;
      
      public var _desc:String;
      
      public function PerkType(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Boolean = false)
      {
         var _loc7_:* = null as StringMap;
         if(Boot.skip_constructor)
         {
            return;
         }
         bonusStats = new BonusDerivedStats();
         requirements = [];
         defaultValue4 = 0;
         defaultValue3 = 0;
         defaultValue2 = 0;
         defaultValue1 = 0;
         _keepOnAscension = false;
         _enemyDesc = "";
         super();
         _id = param1;
         _name = param2;
         _desc = param3;
         _longDesc = param4 != null && param4 != "" ? param4 : _desc;
         _keepOnAscension = param5;
         var _loc6_:StringMap = PerkType.PERK_LIBRARY;
         if((param1 in StringMap.reserved ? _loc6_.getReserved(param1) : _loc6_.h[param1]) != null)
         {
            _loc7_ = PerkType.PERK_LIBRARY;
            CoC_Settings.error("重复的特质 id " + param1 + "，旧的特质是 " + (param1 in StringMap.reserved ? _loc7_.getReserved(param1) : _loc7_.h[param1])._name);
         }
         _loc7_ = PerkType.PERK_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            _loc7_.setReserved(param1,this);
         }
         else
         {
            _loc7_.h[param1] = this;
         }
      }
      
      public static function lookupPerk(param1:String) : PerkType
      {
         var _loc2_:StringMap = PerkType.PERK_LIBRARY;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public static function getPerkLibrary() : IMap
      {
         return PerkType.PERK_LIBRARY;
      }
      
      public function toString() : String
      {
         return "\"" + _id + "\"";
      }
      
      public function sourceString() : String
      {
         return get_name();
      }
      
      public function set_enemyDesc(param1:String) : String
      {
         return _enemyDesc = param1;
      }
      
      public function setEnemyDesc(param1:String) : PerkType
      {
         set_enemyDesc(param1);
         return this;
      }
      
      public function requireTou(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.get_tou() >= value;
         },"体质" + value,RequirementType.Other("attr")));
         return this;
      }
      
      public function requireStr(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.get_str() >= value;
         },"力量" + value,RequirementType.Other("attr")));
         return this;
      }
      
      public function requireStatusEffect(param1:StatusEffectType, param2:String) : PerkType
      {
         var effect:StatusEffectType = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.hasStatusEffect(effect);
         },param2,RequirementType.Status(effect)));
         return this;
      }
      
      public function requireSpe(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.get_spe() >= value;
         },"速度" + value,RequirementType.Other("attr")));
         return this;
      }
      
      public function requirePerk(param1:PerkType) : PerkType
      {
         var perk:PerkType = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.hasPerk(perk);
         },Utils.cnName(perk.get_name()),RequirementType.Perk(perk)));
         return this;
      }
      
      public function requireNGPlus(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.newGamePlusMod() >= value;
         },"新游戏+" + value,RequirementType.Other("ng+")));
         return this;
      }
      
      public function requireMinLust(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.minLust() >= value;
         },"最低欲望" + value,RequirementType.Other("minlust")));
         return this;
      }
      
      public function requireMastery(param1:MasteryType, param2:int) : PerkType
      {
         var mastery:MasteryType = param1;
         var value:int = param2;
         var _loc3_:Array = requirements;
         var _loc4_:String = Utils.cnName(mastery.get_desc());
         _loc3_.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.masteryLevel(mastery) >= value;
         },"" + _loc4_ + " " + value,RequirementType.Other("mastery")));
         return this;
      }
      
      public function requireLibLessThan(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.lib < value;
         },"性欲 &lt; " + value,RequirementType.Other("attr-lt")));
         return this;
      }
      
      public function requireLib(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.lib >= value;
         },"性欲" + value,RequirementType.Other("attr")));
         return this;
      }
      
      public function requireLevel(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.level >= value;
         },"等级" + value,RequirementType.Other("level")));
         return this;
      }
      
      public function requireInt(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.get_inte() >= value;
         },"智力" + value,RequirementType.Other("attr")));
         return this;
      }
      
      public function requireHungerEnabled() : PerkType
      {
         var _gthis:PerkType = this;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return _gthis.get_game().get_survival();
         },"已启用饥饿",RequirementType.Other("hungerflag")));
         return this;
      }
      
      public function requireCustomFunction(param1:Function, param2:String, param3:String = undefined) : PerkType
      {
         if(param3 == null)
         {
            param3 = "custom";
         }
         requirements.push(new Requirement(param1,param2,RequirementType.Other(param3)));
         return this;
      }
      
      public function requireCor(param1:int) : PerkType
      {
         var value:int = param1;
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            return param1.isCorruptEnough(value);
         },"腐化 &gt; " + value,RequirementType.Other("attr-gt")));
         return this;
      }
      
      public function requireAnyPerk(... rest) : PerkType
      {
         var perks:Array;
         var _loc5_:* = null as PerkType;
         if(int(perks.length) == 0)
         {
            throw Exception.thrown("requireAnyPerk() 调用错误 - 不应为空");
         }
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = perks;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_++];
            _loc2_.push(_loc5_.allRequirementDesc());
         }
         requirements.push(new Requirement(function(param1:Player):Boolean
         {
            var _loc4_:* = null as PerkType;
            var _loc2_:int = 0;
            var _loc3_:Array = perks;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_++];
               if(param1.hasPerk(_loc4_))
               {
                  return true;
               }
            }
            return false;
         },_loc2_.join("或"),RequirementType.Anyperk(perks.copy())));
         return this;
      }
      
      public function onAttach() : void
      {
      }
      
      public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         if(_keepOnAscension)
         {
            return true;
         }
         if(isLevelPerk() && !param1)
         {
            return get_oldAscension();
         }
         return false;
      }
      
      public function isLevelPerk() : Boolean
      {
         return _longDesc != _desc;
      }
      
      public function get_name() : String
      {
         return _name;
      }
      
      public function get_longDesc() : String
      {
         return _longDesc;
      }
      
      public function get_id() : String
      {
         return _id;
      }
      
      public function get_enemyDesc() : String
      {
         return _enemyDesc;
      }
      
      public function getOwnValue(param1:int) : Number
      {
         switch(param1)
         {
            case 0:
               return host.perkv1(this);
            case 1:
               return host.perkv2(this);
            case 2:
               return host.perkv3(this);
            case 3:
               return host.perkv4(this);
            default:
               return 0;
         }
      }
      
      public function desc(param1:Perk = undefined) : String
      {
         return _desc;
      }
      
      public function boost(param1:String, param2:Function, param3:Boolean = false) : void
      {
         bonusStats.boost(param1,param2,param3,sourceString());
      }
      
      public function available(param1:Player) : Boolean
      {
         var _loc4_:* = null as Requirement;
         var _loc2_:int = 0;
         var _loc3_:Array = requirements;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!Boolean(_loc4_.fn(param1)))
            {
               return false;
            }
         }
         return true;
      }
      
      public function allRequirementDesc() : String
      {
         var _loc4_:* = null as Requirement;
         var _loc6_:* = null as String;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = requirements;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(_loc4_.text);
         }
         _loc3_ = [];
         _loc2_ = 0;
         var _loc5_:Array = _loc1_;
         while(_loc2_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc2_];
            _loc2_++;
            if(_loc6_.length > 0)
            {
               _loc3_.push(_loc6_);
            }
         }
         return _loc3_.join(", ");
      }
   }
}

