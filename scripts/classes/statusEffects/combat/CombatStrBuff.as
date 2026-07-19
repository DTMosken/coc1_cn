package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class CombatStrBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CombatStrBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CombatStrBuff.TYPE,"str");
      }
      
      public function applyEffect(param1:Number) : Number
      {
         return Number(buffHost(DynStat.Str(param1)).str);
      }
   }
}

