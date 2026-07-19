package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class HistoryFortunePerk extends PerkType
   {
      
      public function HistoryFortunePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Fortune","History: Fortune","Your luck and skills at gathering currency allows you to get 15% more gems from victories.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Gambler";
         }
         return super.get_name();
      }
   }
}

