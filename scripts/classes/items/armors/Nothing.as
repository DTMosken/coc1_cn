package classes.items.armors
{
   import classes.items.Armor;
   import classes.items.Equippable;
   import flash.Boot;
   
   public final class Nothing extends Armor
   {
      
      public function Nothing()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("nothing","nothing","nothing","nothing",0,0,"nothing","Light");
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
   }
}

