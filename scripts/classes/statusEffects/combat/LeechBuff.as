package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import classes.globalFlags.KGAMECLASS;
   import flash.Boot;
   
   public class LeechBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function LeechBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(LeechBuff.TYPE,"");
      }
      
      override public function onAttach() : void
      {
         setUpdateString("你的[weapon]仍然在每次攻击时汲取生命值。[pg]");
         setRemoveString("[b:环绕在你[weapon]上的咒语消散了。][pg]");
      }
      
      override public function get_tooltip() : String
      {
         return "[b:吸血：] 目标的下 [b:" + value1 + "] 次物理攻击将恢复相当于造成伤害 [b:" + (value2 * 100 - 100) + "%] 的生命值。";
      }
      
      override public function countdownTimer() : void
      {
         if(value1 <= 0)
         {
            if(removeString != "")
            {
               KGAMECLASS.kGAMECLASS.outputText(removeString + "[pg-]");
            }
            remove();
         }
         else if(updateString != "")
         {
            KGAMECLASS.kGAMECLASS.outputText(updateString + "[pg-]");
         }
      }
      
      public function applyEffect(param1:int) : void
      {
         value1 -= 1;
         var _loc2_:int = int(Math.round(param1 * value2 / 100));
         get_host().HPChange(_loc2_,false);
         KGAMECLASS.kGAMECLASS.outputText(" [b:(<font color=\"" + KGAMECLASS.kGAMECLASS.mainViewManager.colorHpPlus() + "\">" + _loc2_ + "</font>)]");
      }
   }
}

