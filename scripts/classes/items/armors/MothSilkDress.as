package classes.items.armors
{
   import classes.CoC;
   import classes.Monster;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class MothSilkDress extends Armor
   {
      
      public function MothSilkDress()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("MSDress","M.Silk Dress","moth-silk dress","a moth-silk dress",0,1000,"This flowing, pure-white dress was made from the silk of your daughter\'s cocoon. Its beauty and elegance give its wearer an air of unapproachable eminence, though for some reason, you can\'t help heat from rising to your face whenever you glance at it.\nSpecial: Dodge increases with enemy lust.","Light");
         _headerName = "Moth-Silk Dress";
         boost("挑逗几率",NumberFunc_Impl_.fromInt(7),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(7),false);
         boost("闪避几率",NumberFunc_Impl_.fromFloatFun(getDodgeBonus),false);
      }
      
      public function getDodgeBonus() : Number
      {
         if(get_game().get_inCombat())
         {
            return get_monster().get_lust100() / 5;
         }
         return 0;
      }
   }
}

