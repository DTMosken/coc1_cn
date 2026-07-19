package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class HistoryReligiousPerk extends PerkType
   {
      
      public function HistoryReligiousPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Religious","History: Religious","Replaces masturbate with meditate when corruption less than or equal to 66. Reduces minimum libido slightly.");
         boost("最低性欲",NumberFunc_Impl_.fromInt(-2),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Monk";
         }
         return super.get_name();
      }
   }
}

