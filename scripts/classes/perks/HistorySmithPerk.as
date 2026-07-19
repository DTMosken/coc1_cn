package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class HistorySmithPerk extends PerkType
   {
      
      public function HistorySmithPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Smith","History: Smith","Knowledge of armor and fitting increases armor effectiveness by roughly 10%.");
         boost("护甲",NumberFunc_Impl_.fromFloat(1.1),true);
         boost("护甲",NumberFunc_Impl_.fromInt(1),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Master Smith";
         }
         return super.get_name();
      }
   }
}

