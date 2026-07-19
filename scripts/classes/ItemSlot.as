package classes
{
   import classes.internals.Utils;
   import coc.view.ButtonData;
   import flash.Boot;
   
   public class ItemSlot
   {
      
      public var unlocked:Boolean;
      
      public var quantity:int;
      
      public var itype:ItemType;
      
      public var damage:int;
      
      public function ItemSlot()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         unlocked = false;
         damage = 0;
         itype = ItemType.NOTHING;
         quantity = 0;
      }
      
      public function set_unlocked(param1:Boolean) : Boolean
      {
         if(unlocked != param1)
         {
            emptySlot();
         }
         return unlocked = param1;
      }
      
      public function set_quantity(param1:int) : int
      {
         if(param1 > 0 && itype == null)
         {
            CoC_Settings.error("在没有物品的情况下设置了 ItemSlot.quantity；请改用 setItemAndQty！");
         }
         if(param1 == 0)
         {
            itype = ItemType.NOTHING;
         }
         return quantity = param1;
      }
      
      public function setItemAndQty(param1:ItemType, param2:int) : void
      {
         if(param1 == null)
         {
            param1 = ItemType.NOTHING;
         }
         if(param2 == 0 && param1 == ItemType.NOTHING)
         {
            emptySlot();
            return;
         }
         if(param2 < 0 || param2 == 0 && param1 != ItemType.NOTHING || param2 > 0 && param1 == ItemType.NOTHING)
         {
            CoC_Settings.error("不一致的 setItemAndQty 调用：" + param2 + "" + Std.string(param1));
            param2 = 0;
            param1 = ItemType.NOTHING;
         }
         set_quantity(param2);
         itype = param1;
      }
      
      public function removeOneItem() : void
      {
         if(quantity == 0)
         {
            CoC_Settings.error("试图从空槽位中移除物品！");
         }
         if(quantity > 0)
         {
            set_quantity(quantity - 1);
         }
         if(quantity == 0)
         {
            itype = ItemType.NOTHING;
         }
      }
      
      public function isEmpty() : Boolean
      {
         return quantity <= 0;
      }
      
      public function get_tooltipText() : String
      {
         var _loc1_:String = itype.get_tooltipText();
         if(itype.isDegradable())
         {
            _loc1_ += "\n耐久度：" + (itype.get_durability() - damage) + "/" + itype.get_durability();
         }
         return _loc1_;
      }
      
      public function get_tooltipHeader() : String
      {
         return itype.get_tooltipHeader();
      }
      
      public function get_invLabel() : String
      {
         var _loc1_:String = Utils.cnName(itype.get_shortName());
         if(itype.getMaxStackSize() > 1)
         {
            _loc1_ += " x" + quantity;
         }
         return _loc1_;
      }
      
      public function emptySlot() : void
      {
         set_quantity(0);
         itype = ItemType.NOTHING;
      }
      
      public function buttonData(param1:Function, param2:Boolean = true) : ButtonData
      {
         return new ButtonData(itype.get_shortName(),param1,itype.get_tooltipText(),itype.get_tooltipHeader(),param2);
      }
   }
}

