package classes.items.useables
{
   import classes.CoC;
   import classes.items.Useable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class AbyssalShard extends Useable
   {
      
      public function AbyssalShard(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
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
         super("A. Shard","Abyssal Shard","A pitch black crystal",0,"A crystal taken from the Necromancer\'s corpse. It is mostly pitch black, but you can spot some blinking dots in its interior, as if it was a night sky dotted with stars. It doesn\'t appear to have any real use, but, maybe?");
         invUseOnly = true;
      }
      
      override public function useItem() : Boolean
      {
         if(get_game().dungeons.manor.useCrystal())
         {
            doNext(get_inventory().callNext);
         }
         else
         {
            get_inventory().returnItemToInventory(this);
         }
         return true;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
   }
}

