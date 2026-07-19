package classes.items.armors
{
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class CheerleaderOutfit extends Armor
   {
      
      public function CheerleaderOutfit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("ChrOtft","Cheer Outfit","pink cheerleader outfit","a pink cheerleader outfit with yellow pom-poms",0,300,"A cheerleader outfit with a pink-and-white top that leaves the wearer\'s midriff exposed. Notably, the skirt seems to be a bit on the shorter side, causing any active movement to reveal your panties, or lack thereof. Comes with a pair of pom-poms.","Light");
         boost("挑逗几率",NumberFunc_Impl_.fromIntFun(getTeaseBonus),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromIntFun(getTeaseBonus),false);
      }
      
      public function getTeaseBonus() : int
      {
         if(get_player().isNakedLower())
         {
            return 6;
         }
         return 4;
      }
   }
}

