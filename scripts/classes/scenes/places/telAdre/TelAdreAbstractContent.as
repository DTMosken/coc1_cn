package classes.scenes.places.telAdre
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   
   public class TelAdreAbstractContent extends BaseContent
   {
      
      public function TelAdreAbstractContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function get_telAdre() : TelAdre
      {
         return get_game().telAdre;
      }
   }
}

