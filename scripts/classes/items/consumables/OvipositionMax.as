package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class OvipositionMax extends CustomOviElixir
   {
      
      public function OvipositionMax()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ovi Max","Ovi Max","an enhanced hexagonal crystal bottle tagged with an image of an egg",75,"This hexagonal crystal bottle is filled with a strange yellow fluid. A tag with a picture of a glowing egg is tied to the neck of the bottle, indicating it is somehow connected to egg-laying.");
         addTags("Fluid");
      }
      
      override public function randEggCount() : int
      {
         return Utils.rand(4) + 6;
      }
      
      override public function randBigEgg() : Boolean
      {
         return Utils.rand(2) == 0;
      }
      
      override public function doSpeedUp(param1:int) : int
      {
         return param1 - (int(param1 * 0.5 + 15));
      }
      
      override public function canSpeedUp() : Boolean
      {
         return get_player().get_pregnancyIncubation() > 20;
      }
   }
}

