package classes.scenes.places.bazaar
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.scenes.places.Bazaar;
   import flash.Boot;
   
   public class BazaarAbstractContent extends BaseContent
   {
      
      public function BazaarAbstractContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function get_bazaar() : Bazaar
      {
         return get_game().bazaar;
      }
   }
}

