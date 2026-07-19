package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class LurkBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function LurkBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(LurkBuff.TYPE,"");
         boost("武器暴击率",NumberFunc_Impl_.fromIntFun(critBonus),false);
         boost("命中率",NumberFunc_Impl_.fromIntFun(accBonus),false);
         setDuration(param1);
      }
      
      public function critBonus() : int
      {
         if(value1 > 0)
         {
            return 15;
         }
         return 0;
      }
      
      public function accBonus() : int
      {
         if(value1 > 0)
         {
            return 15;
         }
         return 0;
      }
   }
}

