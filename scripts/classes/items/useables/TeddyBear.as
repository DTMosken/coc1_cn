package classes.items.useables
{
   import classes.CoC;
   import classes.items.Useable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class TeddyBear extends Useable
   {
      
      public function TeddyBear()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TelBear","Teddy Bear","a cuddly stuffed bear",50,"A simple and cute teddy bear. They\'re a common luxury item for children and adults alike.");
         invUseOnly = true;
      }
      
      override public function useItem() : Boolean
      {
         var showNext:Boolean;
         var item:Useable;
         var _g:Inventory;
         outputText("一只简单可爱的泰迪熊。无论是对孩子还是成年人来说，它们都是常见的奢侈品。");
         menu();
         _g = get_inventory();
         item = this;
         showNext = false;
         addButton(0,"继续",function():void
         {
            _g.returnItemToInventory(item,showNext);
         });
         if(!get_game().get_inCombat())
         {
            addButton(1,"依偎",snuggle);
         }
         return true;
      }
      
      public function snuggle() : void
      {
         var showNext:Boolean;
         var item:Useable;
         var _g:Inventory;
         outputText("[pg]你把熊紧紧地抱在怀里，把脸贴在它的头顶上，把烦恼都挤走了。你满足地叹了口气，对着泰迪熊温柔地笑了笑，然后把它放了回去。");
         menu();
         _g = get_inventory();
         item = this;
         showNext = false;
         addButton(0,"继续",function():void
         {
            _g.returnItemToInventory(item,showNext);
         });
      }
   }
}

