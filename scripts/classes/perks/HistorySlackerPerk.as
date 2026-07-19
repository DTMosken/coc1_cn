package classes.perks
{
   import classes.PerkType;
   import flash.Boot;
   
   public class HistorySlackerPerk extends PerkType
   {
      
      public function HistorySlackerPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Slacker","History: Slacker","Regenerate fatigue 20% faster.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
   }
}

