package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class OnFireDebuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function OnFireDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(OnFireDebuff.TYPE,"");
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as String;
         if(value2 == 0)
         {
            _loc1_ = int(get_host().maxHP() * Utils.randBetween(4,8) / 100);
         }
         else
         {
            _loc1_ = int(value2 * Utils.randBetween(75,125) / 100);
         }
         _loc1_ *= get_host().get_fireRes();
         _loc1_ = int(StatusEffect.get_game().combat.doDamage(_loc1_));
         if(get_host() is Monster)
         {
            _loc2_ = get_monsterHost().get_plural() ? "" : "s";
            setUpdateString(get_monsterHost().get_Themonster() + "继续被吞噬" + get_monsterHost().pronoun2 + "的火焰燃烧。" + StatusEffect.get_game().combat.getDamageText(_loc1_) + "[pg]");
            setRemoveString("吞噬" + get_monsterHost().get_themonster() + "的火焰终于消退了。[pg]");
         }
         super.onCombatRound();
      }
      
      override public function onAttach() : void
      {
         setDuration(int(value1));
      }
   }
}

