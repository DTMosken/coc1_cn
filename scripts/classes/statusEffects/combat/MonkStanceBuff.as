package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.MasteryLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class MonkStanceBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function MonkStanceBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(MonkStanceBuff.TYPE);
         boost("招架几率",NumberFunc_Impl_.fromIntFun(parryBonus),false);
         boost("闪避几率",NumberFunc_Impl_.fromInt(10),false);
         boost("命中率",NumberFunc_Impl_.fromIntFun(accBonus),false);
         boost("移动几率",NumberFunc_Impl_.fromIntFun(footwork),false);
      }
      
      public function parryBonus() : int
      {
         return 10 * get_host().masteryLevel(MasteryLib.Fist);
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:Boolean = false;
         var _loc3_:* = null as Player;
         var _loc2_:Player = get_playerHost();
         if(_loc2_ != null ? _loc2_.get_weapon().isBareFist() : null)
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
            StatusEffect.get_game().outputText("[pg-]由于装备的改变，你无法再维持你的架势。[pg-]");
            remove();
         }
      }
      
      public function footwork() : int
      {
         if(get_host().masteryLevel(MasteryLib.Fist) >= 5)
         {
            return 25;
         }
         return 0;
      }
      
      public function accBonus() : int
      {
         return 3 * get_host().masteryLevel(MasteryLib.Fist);
      }
   }
}

