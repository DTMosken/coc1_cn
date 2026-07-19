package classes.items.weapons
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class WingedSpear extends Weapon
   {
      
      public function WingedSpear()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("WingSpr","Winged Spear","winged spear","a winged spear",["stab"],10,600,"A long spear. Right below the head\'s blade, two protrusions stick out to the sides, like tiny wings, from which the weapon gains its name.",["Spear"],0.45);
         boost("招架几率",NumberFunc_Impl_.fromInt(10),false);
         boost("武器暴击率",NumberFunc_Impl_.fromIntFun(getItWinged),false);
      }
      
      public function getItWinged() : int
      {
         if(get_monster().canFly())
         {
            return 10;
         }
         return 0;
      }
   }
}

