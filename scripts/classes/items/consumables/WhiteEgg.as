package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class WhiteEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function WhiteEgg(param1:int = 0)
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
               _loc2_ = "WhiteEg";
               _loc3_ = "White Egg";
               _loc4_ = "a milky-white egg";
               _loc5_ = "一颗乳白色的蛋。大小和鸡蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.WhtEg";
               _loc3_ = "L.White Egg";
               _loc4_ = "a large white egg";
               _loc5_ = "一颗巨大的白蛋。大小和鸵鸟蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Number = 0;
         outputText("你狼吞虎咽地吃下了蛋，暂时满足了你的饥饿感。");
         if(!large)
         {
            if(get_player().nippleLength < 3 && get_player().biggestTitSize() >= 1)
            {
               outputText("[pg]你的乳头充血肿胀，用力顶着[armor]的内侧。你突然意识到它们长长了将近四分之一英寸。");
               var _temp_1:* = get_player();
               _temp_1.nippleLength = _temp_1.nippleLength + 0.2;
               dynStats(DynStat.Lust(15));
            }
            get_player().refillHunger(20);
         }
         else
         {
            if(get_player().nippleLength < 3 && get_player().biggestTitSize() >= 1)
            {
               outputText("[pg]你的乳头充血肿胀，用力地顶着你的[armor]内侧。你突然意识到它们又长长了四分之一英寸多。");
               var _temp_2:* = get_player();
               _temp_2.nippleLength = _temp_2.nippleLength + (Utils.rand(2) + 3) / 10;
               dynStats(DynStat.Lust(15));
            }
            _loc1_ = int(get_player().breastRows.length);
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(!get_player().breastRows[_loc1_].fuckable && get_player().nippleLength >= 2)
               {
                  get_player().breastRows[_loc1_].fuckable = true;
                  _loc2_++;
               }
            }
            if(_loc2_ > 0)
            {
               outputText("[pg]你的[allbreasts]感到一阵温暖的刺痛，这股暖流慢慢游移到你的乳头，让它们充满了温热感。你喘息着呻吟，用手指揉捏着它们。当你的手指滑入乳头时，突然感觉到一股湿润的液体包裹住了手指。你震惊地抽出手指。<b>你现在拥有了可以操的乳头！</b>");
            }
            get_player().refillHunger(60);
         }
         return false;
      }
   }
}

