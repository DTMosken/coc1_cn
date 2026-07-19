package classes.scenes.areas.lake
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.scenes.areas.Lake;
   import flash.Boot;
   
   public class AbstractLakeContent extends BaseContent
   {
      
      public function AbstractLakeContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function get_lake() : Lake
      {
         return get_game().lake;
      }
   }
}

