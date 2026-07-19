package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class CombatSpeBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CombatSpeBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CombatSpeBuff.TYPE,"spe");
      }
      
      public function applyEffect(param1:Number) : Number
      {
         return Number(buffHost(DynStat.Spe(param1)).spe);
      }
   }
}

