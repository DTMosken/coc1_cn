package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class TacticianPerk extends PerkType
   {
      
      public function TacticianPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Tactician","Tactician","[if (inte>=50) {Increases critical hit chance by up to 10% (Intelligence-based).|<b>You are too dumb to gain benefit from this perk.</b>}]","You choose the \'Tactician\' perk, increasing critical hit chance by up to 10% (Intelligence-based).");
         boost("暴击率",NumberFunc_Impl_.fromFloatFun(critBonus),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function critBonus() : Number
      {
         if(host.get_inte() >= 50)
         {
            return Math.max(Math.round(get_player().get_inte() / 10),10);
         }
         return 0;
      }
   }
}

