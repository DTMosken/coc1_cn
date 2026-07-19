package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class ClawStanceBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ClawStanceBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ClawStanceBuff.TYPE);
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:Boolean = false;
         var _loc3_:* = null as Player;
         var _loc2_:Player = get_playerHost();
         if(_loc2_ != null ? _loc2_.get_weapon().isBareClaw() : null)
         {
            _loc3_ = get_playerHost();
            _loc1_ = (_loc3_ != null ? _loc3_.get_shield() : null) != ShieldLib.NOTHING;
         }
         else
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            StatusEffect.get_game().outputText("[pg-]由于装备的改变，你无法再保持你的姿态。[pg-]");
            remove();
         }
      }
   }
}

