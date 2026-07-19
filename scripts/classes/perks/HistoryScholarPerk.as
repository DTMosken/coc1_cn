package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class HistoryScholarPerk extends PerkType
   {
      
      public function HistoryScholarPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Scholar","History: Scholar","Time spent focusing your mind makes spellcasting 20% less fatiguing.");
         boost("法术消耗",NumberFunc_Impl_.fromFloat(0.8),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Teacher";
         }
         return super.get_name();
      }
   }
}

