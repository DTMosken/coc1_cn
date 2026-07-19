package classes.perks
{
   import classes.PerkType;
   import flash.Boot;
   
   public class HistoryThiefPerk extends PerkType
   {
      
      public function HistoryThiefPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Thief","History: Thief","Your theft skills give you a greater chance of escaping and finding valuable items.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
   }
}

