package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.scenes.combat.CombatAbility;
   import flash.Boot;
   
   public class ScorpionBlind extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ScorpionBlind()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ScorpionBlind.TYPE,"");
         boost("命中率",NumberFunc_Impl_.fromFloat(0.5),true);
      }
      
      override public function onAbilityUse(param1:CombatAbility) : Boolean
      {
         remove();
         if(param1.get_abilityType() != 7 && !param1.isSelf && Utils.randomChance(50))
         {
            StatusEffect.get_game().outputText("你正忙着把眼睛里的沙子弄出来，错失了做其他事情的机会。");
            StatusEffect.get_game().combat.startMonsterTurn();
            return false;
         }
         return true;
      }
   }
}

