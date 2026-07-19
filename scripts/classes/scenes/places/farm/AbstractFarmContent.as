package classes.scenes.places.farm
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.scenes.places.Farm;
   import flash.Boot;
   
   public class AbstractFarmContent extends BaseContent
   {
      
      public function AbstractFarmContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function get_farm() : Farm
      {
         return get_game().farm;
      }
   }
}

