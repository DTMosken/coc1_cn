package classes.items.shields
{
   import classes.items.Shield;
   import flash.Boot;
   
   public class WoodenShield extends Shield
   {
      
      public function WoodenShield()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Light");
         super("WoodShl","Wooden Shield","wooden shield","a wooden shield",6,10,"A crude wooden shield. It doesn\'t look very sturdy.");
      }
   }
}

