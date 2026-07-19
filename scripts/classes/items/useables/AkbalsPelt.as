package classes.items.useables
{
   import classes.items.Useable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class AkbalsPelt extends Useable
   {
      
      public function AkbalsPelt(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
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
         super("AkbPelt","Akbal\'s Pelt","a luxurious jaguar skin",1000,"A pelt of tawny fur with black rosettes, the head and skull still attached. Despite the soft and silky feel, it seems to be incredibly durable.");
         invUseOnly = true;
      }
      
      override public function useItem() : Boolean
      {
         outputText("当你抚摸着这块毛皮时，你思考着它的用途。它绝对足够坚韧，可以用来做盔甲，或者做成一块漂亮的地毯，为你的家增添一丝格调。你仍然能感觉到毛皮上散发出的恶魔魔法，考虑到它来自一只强大的上位恶魔，这并不奇怪。\n(现在先留着它吧，以后总会有办法用它做点什么的。)");
         get_inventory().returnItemToInventory(this);
         return true;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
   }
}

