package classes.items.useables
{
   import classes.CoC;
   import classes.items.Useable;
   import flash.Boot;
   
   public class GoldenStatue extends Useable
   {
      
      public function GoldenStatue(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GldStat","Golden Statue","a golden statue",600,"An intricate golden idol of an androgynous humanoid figure with nine long tails. It probably had some spiritual significance to its owner.");
         invUseOnly = true;
      }
      
      override public function useItem() : Boolean
      {
         get_game().forest.kitsuneScene.kitsuneStatue();
         return true;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
   }
}

