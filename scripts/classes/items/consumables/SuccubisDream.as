package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   
   public class SuccubisDream extends Consumable
   {
      
      public function SuccubisDream()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("S.Dream","SuccubiDream","a bottle of \'Succubus\'s Dream\'",6,"This precious fluid is often given to men a succubus intends to play with for a long time, though this batch has been enhanced by Lumi to have even greater potency.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         get_player().slimeFeed();
         var _loc1_:int = 0;
         var _loc2_:Number = 1;
         _loc2_ += Utils.rand(2) + 1;
         get_mutations().initTransformation([2,2]);
         outputText("你拔开瓶塞，喝下那种奇怪的物质，努力咽下粘稠的液体。");
         if(get_player().cor < 33)
         {
            outputText("这东西真恶心，你为什么要喝它？");
         }
         if(get_player().cor >= 66)
         {
            outputText("你舔了舔嘴唇，惊叹于它是如此的浓稠和粘滑。");
         }
         if(get_player().cor < 50 || Utils.rand(2) != 0)
         {
            outputText("[pg]这种饮料让你觉得……很脏。");
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
               _loc1_ = 0;
            }
            dynStats(DynStat.Cor(_loc1_ + 2));
            set_changes(get_changes() + 1);
         }
         if(get_player().balls < 4)
         {
            if(get_player().balls > 0)
            {
               get_player().balls = 4;
               outputText("[pg]一阵剧痛掠过你的胯部，让你痛得弯下了腰。你踉跄着，挣扎着拉开你的[armor]。在震惊中，你几乎无法相信眼前的景象：<b>你有四个蛋蛋了。</b>");
            }
            if(get_player().balls == 0)
            {
               get_player().balls = 2;
               outputText("[pg]难以置信的剧痛撕裂了你的胯部，让你痛得弯下了腰。你踉跄着，挣扎着拉开你的[armor]。在震惊中，你几乎不敢相信眼前的景象：<b>你长出蛋蛋了！</b>");
               get_player().ballSize = 1;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(1.5) == 0 && get_changes() < get_changeLimit() && get_player().balls > 0 && int(get_player().cocks.length) > 0)
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
               outputText("[pg]一阵暖意流遍全身，你的腹股沟突然感到一阵沉重。你停下来检查这些变化，游移的手指发现你的" + get_player().simpleBallsDescript() + "变得比人类的还要大了。");
            }
            if(get_player().ballSize > 2)
            {
               outputText("[pg]一阵突如其来的热流包裹了你的腹股沟，集中在你的[sack]上。你发现你的" + get_player().simpleBallsDescript() + "又变大了，这让你连走路都变得困难。");
            }
            dynStats(DynStat.Lib(1),DynStat.Lust(3));
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
                     outputText("[pg]你感到你的[balls]一阵翻腾。这种感觉很快就平息了，但它们摸起来似乎变得更紧实了。");
                  }
                  if(_loc2_ > 1)
                  {
                     outputText("一些乳白色的先列腺液从你的[cocks]中滴落，似乎是被这种变化挤压出来的。");
                  }
                  dynStats(DynStat.Lib(1));
               }
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() == 0)
         {
            outputText("[pg]你的胯部一阵酥麻，感觉就像是很久没有射过一样。");
            _loc3_ = get_player();
            _loc3_.set_hoursSinceCum(_loc3_.get_hoursSinceCum() + 100);
            set_changes(get_changes() + 1);
         }
         if(get_player().balls > 0 && Utils.rand(3) == 0)
         {
            outputText(get_player().modFem(12,5));
         }
         get_player().refillHunger(15);
         return false;
      }
   }
}

