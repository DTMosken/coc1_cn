package classes.perks
{
   import classes.MasteryLib;
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import flash.Boot;
   
   public class IronFists2Perk extends PerkType
   {
      
      public function IronFists2Perk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Iron Fists 2","Iron Fists 2","Further hardens your fists to increase attack rating by another 6, parry chance by 1, and armor penetration by 5%. Benefits are reduced for claws.","You choose the \'Iron Fists 2\' perk, further hardening your fists. This increases attack power by another 6, parry chance by 1, and armor penetration by 5%. Benefits are reduced for claws.");
         boost("武器伤害",NumberFunc_Impl_.fromIntFun(weaponBonus),false);
         boost("招架几率",NumberFunc_Impl_.fromIntFun(parryBonus),false);
         boost("护甲穿透",NumberFunc_Impl_.fromFloatFun(penBonus),false);
      }
      
      public function weaponBonus() : int
      {
         var _loc1_:Boolean = get_player().get_weapon() == get_weapons().G_KNUCKLE && get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5;
         if(host is Player && get_player().get_str() >= 65 && (get_player().get_weapon().isUnarmed() || _loc1_))
         {
            if(get_player().get_weapon().isBareFist())
            {
               return 6;
            }
            return 3;
         }
         return 0;
      }
      
      public function penBonus() : Number
      {
         if(get_player().get_weapon().isBareFist())
         {
            return 0.05;
         }
         return 0;
      }
      
      public function parryBonus() : int
      {
         if(get_player().get_weapon().isBareFist())
         {
            return 1;
         }
         return 0;
      }
   }
}

