package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class ConstrictedDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public var struggleStr:String;
      
      public var struggleFailStr:String;
      
      public var squeeze:Function;
      
      public var releaseStr:String;
      
      public var release:Function;
      
      public var duration:int;
      
      public function ConstrictedDebuff(param1:Function = undefined, param2:Function = undefined, param3:int = 1, param4:String = undefined, param5:String = undefined, param6:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(param6 == null)
         {
            param6 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         duration = 1;
         struggleFailStr = "";
         releaseStr = "";
         struggleStr = "";
         super(ConstrictedDebuff.TYPE,"");
         duration = param3;
         struggleStr = param4;
         releaseStr = param5;
         struggleFailStr = param6;
         squeeze = param1;
         release = param2;
      }
      
      public function struggle() : void
      {
         StatusEffect.get_game().outputText(struggleStr);
         if(duration <= 0)
         {
            StatusEffect.get_game().outputText(releaseStr);
            remove();
         }
         else
         {
            StatusEffect.get_game().outputText(struggleFailStr);
         }
         duration -= 1;
      }
   }
}

