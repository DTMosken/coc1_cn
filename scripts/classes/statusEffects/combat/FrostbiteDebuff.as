package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class FrostbiteDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public var stacks:int;
      
      public function FrostbiteDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stacks = 0;
         super(FrostbiteDebuff.TYPE,"spe","tou","str","");
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:Number = 0;
         if(StatusEffect.get_game().get_difficulty() >= 1)
         {
            _loc1_ = 5 * stacks + Utils.randBetween(0,10);
         }
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-]你痛苦地皱起眉头，试图集中精神，但冻伤仍在折磨着你。");
            get_playerHost().takeDamage(_loc1_,true);
            StatusEffect.get_game().outputText("[pg]");
         }
         else
         {
            get_host().takeDamage(_loc1_);
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:* = buffHost(DynStat.Spe(-2),DynStat.Tou(-2),DynStat.Str(-2));
         ++stacks;
      }
   }
}

