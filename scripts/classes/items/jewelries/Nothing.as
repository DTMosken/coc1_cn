package classes.items.jewelries
{
   import classes.items.Equippable;
   import classes.items.Jewelry;
   import flash.Boot;
   
   public class Nothing extends Jewelry
   {
      
      public function Nothing()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("nojewel","nojewel","nothing","nothing",0,0,0,"no jewelry","ring");
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
   }
}

