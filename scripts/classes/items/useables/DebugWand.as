package classes.items.useables
{
   import classes.CoC;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class DebugWand extends SimpleUseable
   {
      
      public function DebugWand()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DbgWand","Debug Wand","a wand of debugging",1000,"This mysterious wand has an entirely unknown origin but somehow you feel like a cheater when using it.","You raise the wand and a slab of stone emerges from the ground. The slab has fifteen buttons and a text panel.");
      }
      
      override public function useItem() : Boolean
      {
         get_inventory().returnItemToInventory(this);
         get_game().debugMenu.accessDebugMenu();
         return true;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
      
      override public function canUse() : Boolean
      {
         return true;
      }
   }
}

