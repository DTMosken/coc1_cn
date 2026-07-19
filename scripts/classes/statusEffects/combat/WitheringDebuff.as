package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class WitheringDebuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function WitheringDebuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(WitheringDebuff.TYPE,"");
         setDuration(param1);
      }
      
      override public function onAttach() : void
      {
         setUpdateString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "仍然处于枯萎状态，受到治疗时会受到伤害。");
         setRemoveString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "不再处于枯萎状态，可以正常接受治疗了！");
         super.onAttach();
      }
   }
}

