package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class HistoryAlchemistPerk extends PerkType
   {
      
      public function HistoryAlchemistPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Alchemist","History: Alchemist","Alchemical experience makes items more reactive to your body.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host is Player && host.wasElder())
         {
            return "History: Master Alchemist";
         }
         return super.get_name();
      }
   }
}

