package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class BrutalBlowsDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function BrutalBlowsDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(BrutalBlowsDebuff.TYPE,"str","spe");
         boost("护甲",NumberFunc_Impl_.fromFloatFun(getArmorDecrease),true);
      }
      
      override public function onAttach() : void
      {
         value1 = 0;
      }
      
      override public function get_tooltip() : String
      {
         return "[b:护甲破裂：]目标的护甲降低了[b:" + Math.round((1 - getArmorDecrease()) * 100) + "%]。";
      }
      
      public function getArmorDecrease() : Number
      {
         return Math.pow(0.75,value1);
      }
      
      public function applyEffect(param1:int) : void
      {
         value1 += param1;
      }
   }
}

