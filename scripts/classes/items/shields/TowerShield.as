package classes.items.shields
{
   import classes.Player;
   import classes.items.Shield;
   import flash.Boot;
   
   public class TowerShield extends Shield
   {
      
      public function TowerShield()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TowerSh","Tower Shield","tower shield","a tower shield",16,500,"A towering metal shield. It looks heavy!");
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_str() >= 40)
         {
            return Boolean(super.canUse());
         }
         outputText("这面盾牌对你来说太重了，无法有效握持。也许你应该等变得更强壮一些再试。");
         return false;
      }
   }
}

