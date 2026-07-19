package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PinkEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function PinkEgg(param1:int = 0)
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
               _loc2_ = "PinkEgg";
               _loc3_ = "Pink Egg";
               _loc4_ = "a pink and white mottled egg";
               _loc5_ = "一颗粉白相间的斑驳蛋。它的大小和鸡蛋差不多，但直觉告诉你，它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.PnkEg";
               _loc3_ = "L.Pink Egg";
               _loc4_ = "a large pink and white mottled egg";
               _loc5_ = "一颗巨大的粉白相间斑驳蛋。它的大小和鸵鸟蛋差不多，但直觉告诉你，它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         outputText("你吞下了蛋，暂时满足了你的饥饿感。[pg]");
         if(!large)
         {
            if(int(get_player().cocks.length) > 0)
            {
               get_player().killCocks(1);
               outputText("[pg]");
            }
            if(get_player().balls > 0)
            {
               if(get_player().ballSize > 15)
               {
                  var _temp_1:* = get_player();
                  _temp_1.ballSize = _temp_1.ballSize - 8;
                  outputText("你的阴囊慢慢缩小，稳定在一个小得多的尺寸。<b>你的[balls]小多了。</b>[pg]");
               }
               else
               {
                  get_player().balls = 0;
                  get_player().ballSize = 1;
                  outputText("你的阴囊慢慢缩小，最终完全消失！<b>你失去了你的蛋蛋！</b>[pg]");
               }
            }
            if(int(get_player().vaginas.length) > 0 && get_player().fertility < 40)
            {
               outputText("你感觉到身体深处，就在你的" + get_player().vaginaDescript(0) + "上方，有一种刺痛感，就好像你变得更加多产了。[pg]");
               var _temp_2:* = get_player();
               _temp_2.fertility = _temp_2.fertility + 5;
            }
            get_player().refillHunger(20);
         }
         else
         {
            if(int(get_player().cocks.length) > 0)
            {
               get_player().killCocks(-1);
               outputText("[pg]");
            }
            if(get_player().balls > 0)
            {
               get_player().balls = 0;
               get_player().ballSize = 1;
               outputText("你的阴囊慢慢缩小，最终完全消失！<b>你失去了你的蛋蛋！</b>[pg]");
            }
            if(int(get_player().vaginas.length) > 0 && get_player().fertility < 70)
            {
               outputText("你感到身体深处，就在你的" + get_player().vaginaDescript(0) + "上方，传来一阵强烈的刺痛感。本能告诉你，你的生育能力变得更强了。[pg]");
               var _temp_3:* = get_player();
               _temp_3.fertility = _temp_3.fertility + 10;
            }
            get_player().refillHunger(60);
         }
         if(Utils.rand(3) == 0)
         {
            if(large)
            {
               outputText(get_player().modFem(100,8));
            }
            else
            {
               outputText(get_player().modFem(95,3));
            }
         }
         return false;
      }
   }
}

