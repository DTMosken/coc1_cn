package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class AkbalSaliva extends Consumable
   {
      
      public function AkbalSaliva()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("AkbalSl","Akbal Saliva","a vial of Akbal\'s saliva",6,"This corked vial of Akbal\'s saliva is said to contain healing properties. ");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你拔下瓶塞，将唾液一饮而尽。");
         get_player().HPChange(get_player().maxHP() / 4,true);
         get_player().refillHunger(5);
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 5;
      }
   }
}

