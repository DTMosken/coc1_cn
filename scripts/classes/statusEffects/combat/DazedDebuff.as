package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class DazedDebuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function DazedDebuff(param1:int = 1, param2:Number = -15, param3:Number = 0.8)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(DazedDebuff.TYPE,"");
         setDuration(param1);
         value1 = param2;
         value2 = param3;
         boost("命中率",NumberFunc_Impl_.fromFloat(value1),false);
         boost("物理伤害",NumberFunc_Impl_.fromFloat(value2),true);
      }
      
      override public function onAttach() : void
      {
         setUpdateString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "仍然处于眩晕状态。");
         setRemoveString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "不再眩晕了。");
         set_tooltip("[b:眩晕:] 目标处于眩晕状态，其攻击的准确度和力量受到影响。准确度[b:" + value1 + "]%，伤害降低[b:" + (value2 - 1) * 100 + "]%，持续[b:" + getDuration() + "]回合。");
      }
   }
}

