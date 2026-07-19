package classes.items.consumables
{
   import flash.Boot;
   
   public class OvipositionElixir extends CustomOviElixir
   {
      
      public function OvipositionElixir()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("OviElix","Ovi Elixir","a hexagonal crystal bottle tagged with an image of an egg",30,"This hexagonal crystal bottle is filled with a strange green fluid. A tag with a picture of an egg is tied to the neck of the bottle, indicating it is somehow connected to egg-laying.");
         addTags("Fluid");
      }
   }
}

