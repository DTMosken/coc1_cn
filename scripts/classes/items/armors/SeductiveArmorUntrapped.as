package classes.items.armors
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class SeductiveArmorUntrapped extends Armor
   {
      
      public function SeductiveArmorUntrapped()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SeductU","U.SeductArmor","untrapped seductive armor","a set of untrapped scandalously seductive armor",10,1,"A complete suit of scalemail shaped to hug tightly against every curve, it has a solid steel chest-plate with obscenely large nipples molded into it. The armor does nothing to cover the backside, exposing the wearer\'s cheeks to the world. This armor is not trapped.","Heavy");
         boost("挑逗几率",NumberFunc_Impl_.fromInt(5),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
      }
      
      override public function useText() : void
      {
         outputText("[pg]你松了一口气，发现这套盔甲并没有陷阱。");
      }
   }
}

