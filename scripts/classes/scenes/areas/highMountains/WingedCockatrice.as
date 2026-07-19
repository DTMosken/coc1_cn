package classes.scenes.areas.highMountains
{
   import flash.Boot;
   
   public class WingedCockatrice extends Cockatrice
   {
      
      public function WingedCockatrice()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         wings.type = 9;
         set_spe(get_spe() + 10);
         imageName = "cockatricewithwings";
      }
   }
}

