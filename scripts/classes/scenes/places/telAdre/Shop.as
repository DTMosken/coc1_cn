package classes.scenes.places.telAdre
{
   import classes.ItemType;
   import classes.Player;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import flash.errors.IllegalOperationError;
   
   public class Shop extends TelAdreAbstractContent
   {
      
      public var sprite:Class;
      
      public function Shop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sprite = null;
         super();
      }
      
      public function noBuyOption(param1:ItemType = undefined, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "";
         }
         inside();
      }
      
      public function inside() : void
      {
         throw new IllegalOperationError("方法未实现！");
      }
      
      public function enter() : void
      {
         clearOutput();
         spriteSelect(sprite);
         inside();
      }
      
      public function debit(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - (int(param2 >= 0 ? param2 : int(param1.get_value()))));
         statScreenRefresh();
         if(param3 != "")
         {
            get_player().createKeyItem(param3,0,0,0,0);
            doNext(inside);
         }
         else
         {
            get_inventory().takeItem(param1,inside);
         }
      }
      
      public function confirmBuy(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         var keyItem2:String;
         var itype2:ItemType;
         var _g1:Shop;
         var keyItem1:String;
         var priceOverride1:int;
         var itype1:ItemType;
         var _g:Shop;
         if(param3 == null)
         {
            param3 = "";
         }
         if(get_player().get_gems() < param2 || param1 != null && get_player().get_gems() < param1.get_value())
         {
            outputText("[pg]你数了数你的宝石，意识到这超出了你的价格范围。");
            doNext(inside);
            return;
         }
         outputText("[pg]你要买吗？[pg]");
         _g = this;
         itype1 = param1;
         priceOverride1 = param2;
         keyItem1 = param3;
         _g1 = this;
         itype2 = param1;
         keyItem2 = param3;
         doYesNo(function():void
         {
            _g.debit(itype1,priceOverride1,keyItem1);
         },function():void
         {
            _g1.noBuyOption(itype2,keyItem2);
         });
      }
      
      public function addItemBuyButton(param1:ItemType) : void
      {
         var _g:Shop = this;
         var itype:ItemType = param1;
         var _loc2_:Function = function():void
         {
            _g.confirmBuy(itype);
         };
         addNextButton(param1.get_shortName(),_loc2_).hint(param1.get_tooltipText(),param1.get_tooltipHeader());
      }
   }
}

