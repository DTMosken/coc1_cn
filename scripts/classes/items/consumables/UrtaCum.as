package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class UrtaCum extends Consumable
   {
      
      public static var ITEM_VALUE:int = 15;
      
      public function UrtaCum()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("UrtaCum","Urta\'s Cum","a sealed bottle of Urta\'s cum",15,"This bottle of Urta\'s cum looks thick and viscous. It looks quite unappetizing.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你拔开瓶塞，喝下了狐狸精液；味道好极了。乌尔塔产出的精液味道绝对一流！");
         dynStats(DynStat.Sens(1),DynStat.Lust(5 + get_player().cor / 5));
         get_player().HPChange(Math.round(get_player().maxHP() * 0.25),true);
         get_player().slimeFeed();
         get_player().refillHunger(25);
         get_player().orgasm("Lips",false);
         return false;
      }
   }
}

