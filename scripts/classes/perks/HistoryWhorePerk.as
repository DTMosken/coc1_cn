package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class HistoryWhorePerk extends PerkType
   {
      
      public function HistoryWhorePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Whore","History: Whore","Seductive experience causes your tease attacks to be 15% more effective.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Brothel Owner";
         }
         return super.get_name();
      }
   }
}

