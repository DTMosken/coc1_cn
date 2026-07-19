package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class TargetMarked extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TargetMarked(param1:int = 1, param2:Number = 15, param3:Number = 25, param4:Number = 1.5)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TargetMarked.TYPE,"");
         setDuration(param1);
         value1 = 30;
         value2 = 25;
         value3 = 1.75;
         boost("命中率",NumberFunc_Impl_.fromFloat(value1),false);
         boost("暴击率",NumberFunc_Impl_.fromFloat(value2),false);
         boost("物理伤害",NumberFunc_Impl_.fromFloat(value3),true);
      }
      
      override public function onAttach() : void
      {
         setUpdateString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "仍然保持着高度专注。");
         setRemoveString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "不再专注了。");
         set_tooltip("[b:专注:] 目标正专注于你，获得额外的 [b:" + value1 + "]% 命中率，[b:" + value2 + "]% 暴击率，以及 [b:" + (value3 - 1) * 100 + "]% 额外伤害，持续 [b:" + getDuration() + "] 回合。");
      }
   }
}

