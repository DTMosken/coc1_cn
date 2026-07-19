package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AngeredPugilist extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function AngeredPugilist(param1:int = 1, param2:Number = 15, param3:Number = 750, param4:Number = 1.5)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(AngeredPugilist.TYPE,"");
         setDuration(param1);
         value1 = param2;
         value2 = param3;
         value3 = param4;
         boost("命中率",NumberFunc_Impl_.fromFloat(value1),false);
         boost("最大生命值",NumberFunc_Impl_.fromFloat(value2),false);
         boost("物理伤害",NumberFunc_Impl_.fromFloat(value3),true);
      }
      
      override public function onAttach() : void
      {
         setUpdateString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "仍然处于愤怒状态。");
         setRemoveString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "不再愤怒了。");
         set_tooltip("[b:愤怒与亢奋：]目标处于愤怒状态，但仍保持冷静。[b:" + value1 + "]% 额外命中率，[b:" + value2 + "] 额外生命值，以及 [b:" + (value3 - 1) * 100 + "]% 额外伤害，持续 [b:" + getDuration() + "] 回合。");
      }
   }
}

