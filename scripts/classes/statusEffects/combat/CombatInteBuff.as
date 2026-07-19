package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class CombatInteBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CombatInteBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CombatInteBuff.TYPE,"inte");
      }
      
      public function applyEffect(param1:Number) : Number
      {
         return Number(buffHost(DynStat.Inte(param1)).inte);
      }
   }
}

