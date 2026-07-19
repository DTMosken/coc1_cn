package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BrownEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function BrownEgg(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         large = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         large = param1 == 1;
         switch(param1)
         {
            case 0:
               _loc2_ = "BrownEg";
               _loc3_ = "Brown Egg";
               _loc4_ = "a brown and white mottled egg";
               _loc5_ = "一颗棕白相间的斑驳蛋。它的大小和鸡蛋差不多，但直觉告诉你，它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.BrnEg";
               _loc3_ = "L.Brown Egg";
               _loc4_ = "a large brown and white mottled egg";
               _loc5_ = "一颗带有褐白斑点的大蛋。它在大小上和鸵鸟蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         outputText("你狼吞虎咽地吃下了这颗蛋，暂时缓解了饥饿。[pg]");
         if(!large)
         {
            outputText("你感觉到后部增加了一点重量，你的[butt]变得更丰满了。");
            var _temp_1:* = get_player().butt;
            _temp_1.rating = _temp_1.rating + 1;
            get_player().refillHunger(20);
         }
         else
         {
            outputText("你的[butt]晃动着，随着它变得更大，你几乎失去了平衡！");
            var _temp_2:* = get_player().butt;
            _temp_2.rating = _temp_2.rating + (2 + Utils.rand(3));
            get_player().refillHunger(60);
         }
         if(Utils.rand(3) == 0)
         {
            if(large)
            {
               outputText(get_player().modThickness(100,8));
            }
            else
            {
               outputText(get_player().modThickness(95,3));
            }
         }
         return false;
      }
   }
}

