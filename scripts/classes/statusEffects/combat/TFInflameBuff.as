package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class TFInflameBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFInflameBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFInflameBuff.TYPE,"");
         boost("攻击伤害",NumberFunc_Impl_.fromIntFun(attackBonus),false);
         boost("武器伤害",NumberFunc_Impl_.fromIntFun(weaponBonus),false);
      }
      
      public function weaponBonus() : int
      {
         return int(value2);
      }
      
      override public function onCombatRound() : void
      {
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-]覆盖在你身上的火焰让你的皮肤泛起阵阵灼痛。");
            StatusEffect.get_game().combat.monsterDamageType = "Fire";
         }
         get_host().takeDamage(StatusEffect.get_game().combat.combatAbilities.tfInflameCalc("self"),true);
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg]");
         }
      }
      
      public function attackBonus() : int
      {
         return int(value1);
      }
   }
}

