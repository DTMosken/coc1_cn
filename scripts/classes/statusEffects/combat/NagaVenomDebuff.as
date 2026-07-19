package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class NagaVenomDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function NagaVenomDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(NagaVenomDebuff.TYPE,"spe");
      }
      
      override public function onCombatRound() : void
      {
         if(get_host().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-]你运用你的医学知识，成功清除了体内的娜迦毒液！[pg]");
            }
            remove();
            return;
         }
         var _loc1_:* = buffHost(DynStat.Spe(-2));
         if(Number(_loc1_.spe) == 0)
         {
            get_host().takeDamage(5);
         }
         get_host().takeDamage(2);
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-]你痛苦地皱起眉头，试图集中精神，娜迦的毒液仍在折磨着你。[pg]");
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:* = buffHost(DynStat.Spe(param1 ? -3 : -2));
         if(Number(_loc2_.spe) == 0)
         {
            get_host().takeDamage(5 + Utils.rand(5));
         }
         get_host().takeDamage(5 + Utils.rand(5));
      }
   }
}

