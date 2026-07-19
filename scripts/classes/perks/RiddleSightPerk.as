package classes.perks
{
   import classes.CoC;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class RiddleSightPerk extends PerkType
   {
      
      public function RiddleSightPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Demon\'s Sight","Demon\'s Sight","The demon you encountered with Dolores has taught you how to see straight through your opponents.");
         boost("命中率",NumberFunc_Impl_.fromIntFun(accBonus),false);
      }
      
      public function accBonus() : int
      {
         return get_game().combat.combatRound * 2;
      }
   }
}

