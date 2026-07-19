package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TimedStatusEffect extends CombatBuff
   {
      
      public var updateString:String;
      
      public var removeString:String;
      
      public var duration:int;
      
      public function TimedStatusEffect(param1:StatusEffectType = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:String = undefined)
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         removeString = "";
         updateString = "";
         duration = 1;
         super(param1,param2,param3,param4,param5);
      }
      
      public function setUpdateString(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         updateString = param1;
      }
      
      public function setRemoveString(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         removeString = param1;
      }
      
      public function setDuration(param1:int) : void
      {
         duration = param1;
      }
      
      override public function onCombatRound() : void
      {
         countdownTimer();
      }
      
      override public function onCombatEnd() : void
      {
         super.onCombatEnd();
         remove();
      }
      
      public function getDuration() : int
      {
         return duration;
      }
      
      public function countdownTimer() : void
      {
         duration -= 1;
         if(duration <= 0)
         {
            if(removeString != "")
            {
               StatusEffect.get_game().outputText("[pg-]" + removeString + "[pg-]");
            }
            remove();
         }
         else if(updateString != "")
         {
            StatusEffect.get_game().outputText("[pg-]" + updateString + "[pg-]");
         }
      }
   }
}

