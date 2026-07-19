package classes.items.undergarments
{
   import classes.items.Equippable;
   import classes.items.Undergarment;
   import flash.Boot;
   
   public class Nothing extends Undergarment
   {
      
      public function Nothing()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("nounder","nounder","nothing","nothing",-1,0,"nothing");
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
   }
}

