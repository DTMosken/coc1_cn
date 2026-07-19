package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class HistoryHealerPerk extends PerkType
   {
      
      public function HistoryHealerPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Healer","History: Healer","Healing experience increases HP gains by 20%.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Master Healer";
         }
         return super.get_name();
      }
   }
}

