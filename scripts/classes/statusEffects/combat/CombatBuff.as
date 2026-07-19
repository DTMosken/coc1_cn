package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.statusEffects.TemporaryBuff;
   import flash.Boot;
   
   public class CombatBuff extends TemporaryBuff
   {
      
      public var _tooltip:String;
      
      public function CombatBuff(param1:StatusEffectType = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:String = undefined)
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
         _tooltip = "";
         super(param1,param2,param3,param4,param5);
      }
      
      public function set_tooltip(param1:String) : String
      {
         return _tooltip = param1;
      }
      
      override public function onCombatEnd() : void
      {
         super.onCombatEnd();
         restore();
         remove();
      }
      
      public function get_tooltip() : String
      {
         return _tooltip;
      }
   }
}

