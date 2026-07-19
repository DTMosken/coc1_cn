package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PurpleEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function PurpleEgg(param1:int = 0)
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
               _loc2_ = "PurplEg";
               _loc3_ = "Purple Egg";
               _loc4_ = "a purple and white mottled egg";
               _loc5_ = "一颗紫白相间的斑驳蛋。它的大小和鸡蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.PrpEg";
               _loc3_ = "L.Purple Egg";
               _loc4_ = "a large purple and white mottled egg";
               _loc5_ = "一颗巨大的紫白相间的斑驳蛋。它的大小和鸵鸟蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         outputText("你吞下蛋，暂时满足了你的饥饿感。[pg]");
         if(!large || get_player().hips.rating > 20)
         {
            outputText("你踉跄了一下，感觉你的[hips]变宽了，稍微改变了你的步态。");
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating + 1;
            get_player().refillHunger(20);
         }
         else
         {
            outputText("你的臀部向两侧扩张，变宽了好几英寸，你因此剧烈地摇晃着。当变形完成时，你感觉自己好像必须重新学习走路。");
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + (2 + Utils.rand(2));
            get_player().refillHunger(60);
         }
         if(Utils.rand(3) == 0)
         {
            if(large)
            {
               outputText(get_player().modThickness(80,8));
            }
            else
            {
               outputText(get_player().modThickness(80,3));
            }
         }
         return false;
      }
   }
}

