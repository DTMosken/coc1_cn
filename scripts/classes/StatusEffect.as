package classes
{
   import classes._StatusEffect.DataStore;
   import classes.globalFlags.KGAMECLASS;
   import classes.scenes.combat.CombatAbility;
   import flash.Boot;
   
   public class StatusEffect implements BonusStatsInterface
   {
      
      public var value4:Number;
      
      public var value3:Number;
      
      public var value2:Number;
      
      public var value1:Number;
      
      public var dataStore:DataStore;
      
      public var bonusStats:BonusDerivedStats;
      
      public var _stype:StatusEffectType;
      
      public var _host:Creature;
      
      public function StatusEffect(param1:StatusEffectType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bonusStats = new BonusDerivedStats();
         dataStore = null;
         value4 = 0;
         value3 = 0;
         value2 = 0;
         value1 = 0;
         _stype = param1;
      }
      
      public static function register(param1:String, param2:Class, param3:int = 0) : StatusEffectType
      {
         return new StatusEffectType(param1,param2 != null ? param2 : StatusEffect,param3);
      }
      
      public static function get_game() : CoC
      {
         return KGAMECLASS.kGAMECLASS;
      }
      
      public function toString() : String
      {
         return "[" + Std.string(_stype) + "," + value1 + "," + value2 + "," + value3 + "," + value4 + "]";
      }
      
      public function sourceString() : String
      {
         return get_stype().get_id();
      }
      
      public function removedFromHostList(param1:Boolean) : void
      {
         if(param1)
         {
            onRemove();
         }
         _host = null;
      }
      
      public function remove() : void
      {
         if(_host == null)
         {
            return;
         }
         _host.removeStatusEffectInstance(this);
         _host = null;
      }
      
      public function onTurnEnd() : void
      {
      }
      
      public function onRemove() : void
      {
      }
      
      public function onPlayerTurnEnd() : void
      {
      }
      
      public function onCombatRound() : void
      {
      }
      
      public function onCombatEnd() : void
      {
      }
      
      public function onAttach() : void
      {
      }
      
      public function onAbilityUse(param1:CombatAbility) : Boolean
      {
         return true;
      }
      
      public function get_stype() : StatusEffectType
      {
         return _stype;
      }
      
      public function get_playerHost() : Player
      {
         return _host;
      }
      
      public function get_monsterHost() : Monster
      {
         return _host;
      }
      
      public function get_host() : Creature
      {
         return _host;
      }
      
      public function boost(param1:String, param2:Function, param3:Boolean = false) : void
      {
         bonusStats.boost(param1,param2,param3,sourceString());
      }
      
      public function attach(param1:Creature) : void
      {
         if(_host == param1)
         {
            return;
         }
         if(_host != null)
         {
            remove();
         }
         _host = param1;
         param1.addStatusEffect(this);
      }
      
      public function addedToHostList(param1:Creature, param2:Boolean) : void
      {
         _host = param1;
         if(param2)
         {
            onAttach();
         }
      }
   }
}

