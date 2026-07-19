package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.MasteryLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class BrawlerStanceBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function BrawlerStanceBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(BrawlerStanceBuff.TYPE);
         boost("攻击伤害",NumberFunc_Impl_.fromFloatFun(dmgBonus),true);
         boost("护甲穿透",NumberFunc_Impl_.fromFloatFun(penBonus),false);
      }
      
      public function penBonus() : Number
      {
         if(value1 > 0)
         {
            return -0.15;
         }
         return 0.03 * get_host().masteryLevel(MasteryLib.Fist);
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:Boolean = false;
         var _loc3_:* = null as Player;
         value1 = 0;
         var _loc2_:Player = get_playerHost();
         if(_loc2_ != null ? _loc2_.get_weapon().isBareFist() : null)
         {
            _loc3_ = get_playerHost();
            _loc1_ = (_loc3_ != null ? _loc3_.get_shield() : null) != ShieldLib.NOTHING;
         }
         else
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            StatusEffect.get_game().outputText("[pg-]由于装备的改变，你无法再保持你的姿态。[pg-]");
            remove();
         }
      }
      
      public function dmgBonus() : Number
      {
         if(value1 > 0)
         {
            return 0.85;
         }
         return 1 + 0.03 * get_host().masteryLevel(MasteryLib.Fist);
      }
   }
}

