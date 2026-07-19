package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class SkinOil extends Consumable
   {
      
      public var _color:String;
      
      public function SkinOil(param1:String = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _color = param2.toLowerCase();
         var _loc3_:String = param2 + " Oil";
         var _loc4_:String = "a bottle of " + _color + " oil";
         var _loc5_:int = 6;
         var _loc6_:String = "一个装满光滑透明液体的小玻璃瓶。正面的标签上写着，\"" + Utils.cnName(param2) + "护肤油。\"";
         super(param1,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      override public function useItem() : Boolean
      {
         if(!get_player().hasUnderBody() && !get_player().wings.canOil())
         {
            oilSkin();
            return true;
         }
         if(get_player().hasUnderBody())
         {
            outputText("你腹部的皮肤与身体其他部位不同。");
         }
         outputText("你想把" + _color + "皮肤油涂在哪里？");
         menu();
         addButton(0,"身体",oilSkin);
         if(get_player().hasUnderBody())
         {
            addButton(1,"腹部",oilUnderBodySkin);
         }
         else
         {
            addButtonDisabled(1,"腹部","你没有特殊的腹部！");
         }
         if(get_player().wings.type == 0)
         {
            outputText("[pg]你没有翅膀。");
            addButtonDisabled(2,"翅膀","你没有翅膀。");
         }
         else if(get_player().wings.canOil())
         {
            outputText("[pg]你的翅膀有[wingColor]的[wingColorDesc]。");
            if(!get_player().wings.hasOilColor(_color))
            {
               addButton(2,"翅膀",oilWings).hint("将油脂涂抹在翅膀的" + get_player().wings.getColorDesc(1) + "上。");
            }
            else
            {
               addButtonDisabled(2,"翅膀","你翅膀的" + get_player().wings.getColorDesc(1) + "已经是" + _color + "的了！");
            }
         }
         else
         {
            outputText("[pg]你的翅膀不能涂油。");
            addButtonDisabled(2,"翅膀","你的翅膀不能涂油！");
         }
         if(get_player().wings.type == 0)
         {
            outputText("[pg]你没有翅膀。");
            addButtonDisabled(3,"翅膀 2","你没有翅膀。");
         }
         else if(get_player().wings.canOil2())
         {
            outputText("[pg]你的翅膀有[wingColor2]的[wingColor2Desc]。");
            if(!get_player().wings.hasOil2Color(_color))
            {
               addButton(3,"翅膀2",oil2Wings).hint("将油脂涂抹在翅膀的" + get_player().wings.getColorDesc(2) + "上。");
            }
            else
            {
               addButtonDisabled(3,"Wings 2","你翅膀的" + get_player().wings.getColorDesc(2) + "已经是" + _color + "色的了！");
            }
         }
         else
         {
            addButtonDisabled(3,"Wings 2","你的翅膀没有副色可以涂抹护肤油！");
         }
         addButton(4,"算了",oilCancel);
         return true;
      }
      
      public function oilWings() : void
      {
         clearOutput();
         outputText("你将油擦进[wings]的[wingColorDesc]中。");
         get_player().wings.applyOil(_color);
         outputText("你的翅膀现在有了[wingColor]的[wingColorDesc]。");
         get_inventory().itemGoNext();
      }
      
      public function oilUnderBodySkin() : void
      {
         if(get_player().underBody.skin.tone == _color)
         {
            outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在你的下腹部。涂完后，你感到焕然一新。");
            get_player().changeFatigue(-10);
         }
         else
         {
            if(!get_player().hasGooSkin())
            {
               get_player().underBody.skin.tone = _color;
            }
            switch(get_player().underBody.skin.type)
            {
               case 0:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在你的下腹部。甚至在你涂满[chest]之前，你的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你的下腹部拥有了" + _color + "的皮肤。");
                  break;
               case 1:
                  outputText("" + get_player().clothedOrNaked("脱下衣服后，你拿起油，","你拿起油，") + "开始将它按摩进你下腹部的皮肤，尽管你全身覆盖着皮毛。当你完成后……什么也没发生。然后你的皮肤开始感到刺痛，很快你拨开[chest]上的皮毛，露出了" + _color + "的皮肤。");
                  break;
               case 2:
               case 5:
               case 6:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在你的下腹部。甚至在你涂满[chest]之前，你长满鳞片的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你的下腹部拥有了" + _color + "的皮肤。");
                  break;
               case 3:
                  outputText("你拿起油，将里面的东西倒在皮肤上。透明的液体溶解了，留下你黏糊糊的皮肤没有任何变化。不过你确实感觉不那么渴了。");
                  get_player().slimeFeed();
                  break;
               default:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在你的下腹部。甚至在你涂满[chest]之前，你的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你的下腹部拥有了" + _color + "的皮肤。");
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function oilSkin() : void
      {
         if(get_player().skin.tone == _color)
         {
            outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在全身。涂完后，你感到焕然一新。");
            get_player().changeFatigue(-10);
         }
         else
         {
            if(!get_player().hasGooSkin())
            {
               get_player().skin.tone = _color;
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
            switch(get_player().skin.type)
            {
               case 0:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在全身。甚至在你涂满手臂和[chest]之前，你的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你拥有了" + _color + "的皮肤。");
                  break;
               case 1:
                  outputText("" + get_player().clothedOrNaked("脱下衣服后，你拿起油，","你拿起油，") + "开始将它按摩进你的皮肤，尽管你全身覆盖着皮毛。当你完成后……什么也没发生。然后你的皮肤开始感到刺痛，很快你拨开皮毛，露出了" + _color + "的皮肤。");
                  break;
               case 2:
               case 5:
               case 6:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在全身。甚至在你涂满手臂和[chest]之前，你长满鳞片的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你拥有了" + _color + "的皮肤。");
                  break;
               case 3:
                  outputText("你拿起油，将里面的东西倒在皮肤上。透明的液体溶解了，留下你黏糊糊的皮肤没有任何变化。不过你确实感觉不那么渴了。");
                  get_player().slimeFeed();
                  break;
               default:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在全身。甚至在你涂满手臂和[chest]之前，你的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤稍微变暗之后，它开始发生变化，直到你拥有了" + _color + "的皮肤。");
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function oilCancel() : void
      {
         clearOutput();
         outputText("你收起了护肤精油。[pg]");
         get_inventory().returnItemToInventory(this);
      }
      
      public function oil2Wings() : void
      {
         clearOutput();
         outputText("你将油擦进[wings]的[wingColor2Desc]中。");
         get_player().wings.applyOil2(_color);
         outputText("你的翅膀现在有了[wingColor2]的[wingColor2Desc]。");
         get_inventory().itemGoNext();
      }
   }
}

