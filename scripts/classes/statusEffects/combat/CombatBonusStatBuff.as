package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes._BonusDerivedStats.BonusStat_Impl_;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class CombatBonusStatBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public var bonuses:IMap;
      
      public function CombatBonusStatBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bonuses = new StringMap();
         super(CombatBonusStatBuff.TYPE,"");
      }
      
      public function resetBonus(param1:String, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1 = BonusStat_Impl_.multiplicative(param1);
         }
         bonuses.remove(param1);
      }
      
      public function addBonus(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null as String;
         var _loc8_:* = null as IMap;
         var _loc9_:* = null as MultiValue;
         var _loc10_:* = null as String;
         if(param3)
         {
            param1 = BonusStat_Impl_.multiplicative(param1);
         }
         var _loc4_:StringMap = bonuses;
         var _loc5_:String = param1;
         if(_loc5_ in StringMap.reserved ? _loc4_.existsReserved(_loc5_) : _loc5_ in _loc4_.h)
         {
            _loc6_ = bonuses;
            _loc7_ = param1;
            (_loc7_ in StringMap.reserved ? _loc6_.getReserved(_loc7_) : _loc6_.h[_loc7_]).valueArray.push(param2);
         }
         else
         {
            _loc8_ = bonuses;
            _loc9_ = new MultiValue(param3,[param2]);
            _loc6_ = _loc8_;
            _loc7_ = param1;
            if(_loc7_ in StringMap.reserved)
            {
               _loc6_.setReserved(_loc7_,_loc9_);
            }
            else
            {
               _loc6_.h[_loc7_] = _loc9_;
            }
            _loc7_ = BonusStat_Impl_.additive(param1);
            _loc6_ = bonuses;
            _loc10_ = param1;
            boost(_loc7_,NumberFunc_Impl_.fromFloatFun((_loc10_ in StringMap.reserved ? _loc6_.getReserved(_loc10_) : _loc6_.h[_loc10_]).calcValue),param3);
         }
      }
   }
}

