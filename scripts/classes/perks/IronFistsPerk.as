package classes.perks
{
   import classes.MasteryLib;
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import flash.Boot;
   
   public class IronFistsPerk extends PerkType
   {
      
      public function IronFistsPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Iron Fists","Iron Fists","Hardens your fists to increase attack rating by 10 and parry chance by 3 while unarmed. Benefits are reduced for claws.","You choose the \'Iron Fists\' perk, hardening your fists. This increases attack power by 10 and parry chance by 3 while unarmed. Benefits are reduced for claws.");
         boost("武器伤害",NumberFunc_Impl_.fromIntFun(weaponBonus),false);
         boost("招架几率",NumberFunc_Impl_.fromIntFun(parryBonus),false);
      }
      
      public function weaponBonus() : int
      {
         var _loc1_:Boolean = get_player().get_weapon() == get_weapons().G_KNUCKLE && get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5;
         if(host is Player && get_player().get_str() >= 50 && (get_player().get_weapon().isUnarmed() || _loc1_))
         {
            if(get_player().get_weapon().isBareFist())
            {
               return 10;
            }
            return 5;
         }
         return 0;
      }
      
      public function parryBonus() : int
      {
         if(!get_player().get_weapon().isUnarmed())
         {
            return 0;
         }
         if(get_player().get_weapon().isBareFist())
         {
            return 3;
         }
         return 1;
      }
   }
}

