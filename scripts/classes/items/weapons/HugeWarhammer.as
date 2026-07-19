package classes.items.weapons
{
   import classes.items.Weapon;
   import classes.items.WeaponEffects;
   import flash.Boot;
   
   public class HugeWarhammer extends Weapon
   {
      
      public function HugeWarhammer()
      {
         var _g:WeaponEffects;
         if(Boot.skip_constructor)
         {
            return;
         }
         _g = Weapon.WEAPONEFFECTS;
         super("Warhamr","Warhammer","huge warhammer","a huge warhammer",["blow","smash"],15,1600,"A huge war-hammer made almost entirely of steel that only the strongest warriors could use. Requires 80 strength to use. Hitting someone with this might stun them.",["2H Blunt"],0.7,[function():void
         {
            _g.stun();
         }]);
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_str() >= 80)
         {
            return true;
         }
         outputText("你还不够强壮，无法使用这么重的武器！");
         return false;
      }
   }
}

