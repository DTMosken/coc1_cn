package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes.scenes.combat.CombatAbilities;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class TerraStarBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TerraStarBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TerraStarBuff.TYPE);
      }
      
      override public function onPlayerTurnEnd() : void
      {
         var _g:CombatAbilities;
         var _loc1_:* = null as CombatAbilities;
         if(!get_host().hasStatusEffect(StatusEffects.TFSupercharging))
         {
            if(value1 == 1)
            {
               value1 = 0;
            }
            else
            {
               _loc1_ = StatusEffect.get_game().combat.combatAbilities;
               _g = StatusEffect.get_game().combat.combatAbilities;
               _loc1_.randomMonster(function():void
               {
                  _g.tfTerraStarAttack();
               });
            }
         }
      }
   }
}

