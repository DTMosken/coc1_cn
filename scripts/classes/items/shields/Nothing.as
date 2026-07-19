package classes.items.shields
{
   import classes.items.Equippable;
   import classes.items.Shield;
   import flash.Boot;
   
   public class Nothing extends Shield
   {
      
      public function Nothing()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("noshild","noshield","nothing","nothing",0,0,"no shield","shield");
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
   }
}

