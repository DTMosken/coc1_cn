package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class HistorySlutPerk extends PerkType
   {
      
      public function HistorySlutPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Slut","History: Slut","Sexual experience has made you more able to handle large insertions and more resistant to stretching.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Libertine";
         }
         return super.get_name();
      }
   }
}

