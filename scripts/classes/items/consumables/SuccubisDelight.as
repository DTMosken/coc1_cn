package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   
   public class SuccubisDelight extends Consumable
   {
      
      public static var TAINTED:int = 0;
      
      public static var PURIFIED:int = 1;
      
      public var tainted:Boolean;
      
      public function SuccubisDelight(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tainted = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         tainted = param1 == 0;
         switch(param1)
         {
            case 0:
               _loc2_ = "SDelite";
               _loc3_ = "Succubi Del.";
               _loc4_ = "a bottle of \"Succubi\'s Delight\"";
               _loc5_ = "这种珍贵的液体通常是魅魔给打算长期玩弄的男人喝的。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "PSDelit";
               _loc3_ = "P.SuccubiDel.";
               _loc4_ = "an untainted bottle of \"Succubi\'s Delight\"";
               _loc5_ = "这种珍贵的液体通常是魅魔给打算长期玩弄的男人喝的。拉萨祖尔已经净化了它，去除了它的腐化特性。";
               _loc6_ = 20;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:Number = NaN;
         var _loc3_:* = null as Player;
         get_player().slimeFeed();
         var _loc2_:Number = 1;
         if(Utils.rand(4) == 0)
         {
            _loc2_ += Utils.rand(2) + 1;
         }
         get_mutations().initTransformation([2,2]);
         outputText("你拔开瓶塞，喝下这种奇怪的物质，努力咽下这浓稠的液体。");
         if(get_player().cor < 33)
         {
            outputText("这东西真恶心，你为什么要喝它？");
         }
         if(get_player().cor >= 66)
         {
            outputText("你舔了舔嘴唇，惊叹于它如此浓稠粘滑。");
         }
         if((get_player().cor < 50 || Utils.rand(2) != 0) && tainted)
         {
            outputText("[pg]这饮料让你觉得……很下流。");
            _loc1_ = 1;
            if(get_player().cor < 50)
            {
               _loc1_++;
            }
            if(get_player().cor < 40)
            {
               _loc1_++;
            }
            if(get_player().cor < 30)
            {
               _loc1_++;
            }
            if(get_player().cor >= 90)
            {
               _loc1_ = 0.5;
            }
            if(tainted)
            {
               dynStats(DynStat.Cor(_loc1_));
            }
            else
            {
               dynStats(DynStat.Cor(0));
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(1.5) == 0 && get_changes() < get_changeLimit() && get_player().balls > 0)
         {
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize + 1;
            if(get_player().ballSize > 10)
            {
               var _temp_2:* = get_player();
               _temp_2.ballSize = _temp_2.ballSize - 0.5;
            }
            if(get_player().ballSize <= 2)
            {
               outputText("[pg]一阵暖流穿过你的身体，你的腹股沟突然变得沉甸甸的。你停下来检查这些变化，你游移的手指发现你的" + get_player().simpleBallsDescript() + "变得比人类的还要大。");
            }
            if(get_player().ballSize > 2)
            {
               outputText("[pg]你的腹股沟突然感到一阵燥热，集中在你的[sack]上。你发现你的" + get_player().simpleBallsDescript() + "又变大了，连走路都变得困难。");
            }
            dynStats(DynStat.Lib(1),DynStat.Lust(3));
            set_changes(get_changes() + 1);
         }
         if(get_player().balls < 2 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().balls == 0)
            {
               get_player().balls = 2;
               outputText("[pg]难以置信的剧痛像镰刀一样划过你的胯部，让你痛得弯下了腰。你踉跄着，挣扎着拉开你的[armor]。在震惊中，你勉强看清了眼前的景象：<b>你长出蛋蛋了！</b>");
               get_player().ballSize = 1;
            }
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && int(get_player().cocks.length) > 0)
         {
            if(get_player().cumMultiplier < 6 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
            {
               _loc1_ = 3;
               if(get_player().hasPerk(PerkLib.MessyOrgasms))
               {
                  _loc1_ = 6;
               }
               if(_loc1_ < get_player().cumMultiplier + 0.4 * _loc2_)
               {
                  set_changes(get_changes() - 1);
               }
               else
               {
                  var _temp_3:* = get_player();
                  _temp_3.cumMultiplier = _temp_3.cumMultiplier + 0.4 * _loc2_;
                  if(get_player().balls == 0)
                  {
                     outputText("[pg]你感到体内一阵翻腾，似乎有什么东西发生了改变。");
                  }
                  if(get_player().balls > 0)
                  {
                     outputText("[pg]你感到你的[balls]一阵翻腾。很快就平息了，感觉它们变得更紧实了一些。");
                  }
                  if(_loc2_ > 1)
                  {
                     outputText("一点乳白色的先列腺液从你的[cocks]滴落，是被这种变化挤出来的。");
                  }
                  dynStats(DynStat.Lib(1));
               }
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() == 0)
         {
            outputText("[pg]你的腹股沟一阵刺痛，感觉就像很久没有高潮过一样。");
            _loc3_ = get_player();
            _loc3_.set_hoursSinceCum(_loc3_.get_hoursSinceCum() + 100);
         }
         if(get_player().balls > 0 && Utils.rand(3) == 0)
         {
            outputText(get_player().modFem(12,3));
         }
         get_player().refillHunger(10);
         return false;
      }
   }
}

