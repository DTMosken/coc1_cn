package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class SuccubiMilk extends Consumable
   {
      
      public static var TAINTED:int = 0;
      
      public static var PURIFIED:int = 1;
      
      public var tainted:Boolean;
      
      public function SuccubiMilk(param1:int = 0)
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
               _loc2_ = "SucMilk";
               _loc3_ = "Succubi Milk";
               _loc4_ = "a bottle of Succubi milk";
               _loc5_ = "这个奶瓶里装满了来历不明的乳白色液体。" + " 瓶身上骄傲地贴着一个粉色的标签，上面写着：“魅魔乳液”。" + " 标签底部有一行小字：“<i>唤醒你内心的魅魔！</i>”";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "P.S.Mlk";
               _loc3_ = "P.SuccubiMilk";
               _loc4_ = "";
               _loc5_ = "这个奶瓶里装满了来历不明的乳白色液体。" + " 瓶身上骄傲地贴着一个粉色的标签，上面写着：“魅魔乳液”。" + " 标签底部有一行小字：“<i>唤醒你内心的魅魔！</i>”" + " 拉萨祖尔已经将其净化，去除了它的腐化特性。";
               _loc6_ = 20;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:String = "succubiMilk";
         if(!tainted)
         {
            _loc1_ += "-purified";
         }
         get_player().slimeFeed();
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = Utils.rand(100);
         if(get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            _loc5_ += 10;
         }
         if(get_player().isTFResistant())
         {
            _loc5_ -= 10;
         }
         if(get_player().cor < 35)
         {
            outputText("你不知道自己到底为什么会喝这种东西，但你不得不承认，这是你尝过的最美味的东西。");
         }
         if(get_player().cor >= 35 && get_player().cor < 70)
         {
            outputText("你贪婪地大口吞咽着，细细品味着这不可思议的味道。");
            if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
            {
               outputText("单是这味道就让你的" + get_player().vaginaDescript(0) + "感到");
               if(get_player().vaginas[0].vaginalWetness == 0)
               {
                  outputText("刺痛。");
               }
               if(get_player().vaginas[0].vaginalWetness == 1)
               {
                  outputText("湿润。");
               }
               if(get_player().vaginas[0].vaginalWetness == 2)
               {
                  outputText("泥泞不堪。");
               }
               if(get_player().vaginas[0].vaginalWetness == 3)
               {
                  outputText("湿透了，汁水四溢。");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("湿得滴水。");
               }
            }
            else if(get_player().hasCock())
            {
               outputText("你感觉到一阵强烈的兴奋，但这并没有影响到你的肉棒。");
            }
         }
         if(get_player().cor >= 70)
         {
            outputText("你把乳液倒进喉咙，尽可能快地大口吞咽。你还想要更多。");
            if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
            {
               outputText("你的" + get_player().vaginaDescript(0));
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("在高潮中颤抖，");
               }
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("在高潮中颤抖，");
               }
               if(get_player().vaginas[0].vaginalWetness == 0)
               {
                  outputText("变得有些黏糊糊的。");
               }
               if(get_player().vaginas[0].vaginalWetness == 1)
               {
                  outputText("让你的内衣变得黏糊糊的。");
               }
               if(get_player().vaginas[0].vaginalWetness == 2)
               {
                  outputText("被淫液弄湿了。");
               }
               if(get_player().vaginas[0].vaginalWetness == 3)
               {
                  outputText("把你的内衣弄得满是淫液。");
               }
               if(get_player().vaginas[0].vaginalWetness == 4)
               {
                  outputText("让淫液顺着你的腿流了下来。");
               }
               if(get_player().vaginas[0].vaginalWetness >= 5)
               {
                  outputText("把你的内衣喷得满是滑腻的淫液。");
               }
               get_player().orgasm("Vaginal");
            }
            else if(get_player().get_gender() != 0)
            {
               if(int(get_player().cocks.length) == 1)
               {
                  outputText("你感到一种奇怪的性快感，但你的" + get_player().multiCockDescript() + "并没有受到影响。");
               }
               else
               {
                  outputText("你感到一种奇怪的性快感，但你的" + get_player().multiCockDescript() + "并没有受到影响。");
               }
            }
         }
         if(tainted)
         {
            dynStats(DynStat.Spe(1),DynStat.Lust(3),DynStat.Cor(1));
         }
         else
         {
            dynStats(DynStat.Spe(1),DynStat.Lust(3));
         }
         if(_loc5_ <= 75)
         {
            _loc2_ = 1 + Utils.rand(3);
            if(int(get_player().breastRows.length) > 0)
            {
               if(get_player().breastRows[0].breastRating < 2 && Utils.rand(3) == 0)
               {
                  _loc2_++;
               }
               if(get_player().breastRows[0].breastRating < 5 && Utils.rand(4) == 0)
               {
                  _loc2_++;
               }
               if(get_player().breastRows[0].breastRating < 6 && Utils.rand(5) == 0)
               {
                  _loc2_++;
               }
            }
            outputText("[pg]");
            get_player().growTits(_loc2_,int(get_player().breastRows.length),true,3);
            if(int(get_player().breastRows.length) == 0)
            {
               outputText("一对完美的B罩杯乳房，连同小巧的乳头，在你的胸前成型了。");
               get_player().createBreastRow();
               get_player().breastRows[0].breasts = 2;
               get_player().breastRows[0].nipplesPerBreast = 1;
               get_player().breastRows[0].breastRating = 2;
               outputText("\n");
            }
            if(!get_hyper())
            {
               if(int(get_player().cocks.length) > 0)
               {
                  _loc2_ = 0;
                  _loc3_ = int(get_player().cocks.length);
                  _loc4_ = 0;
                  while(_loc3_ > 0)
                  {
                     _loc3_--;
                     if(get_player().cocks[_loc2_].cockLength <= get_player().cocks[_loc3_].cockLength)
                     {
                        _loc2_ = _loc3_;
                     }
                  }
                  if(get_player().cocks[_loc2_].cockLength < 6 && get_player().cocks[_loc2_].cockLength >= 2.9)
                  {
                     var _temp_1:* = get_player().cocks[_loc2_];
                     _temp_1.cockLength = _temp_1.cockLength - 0.5;
                     _loc4_ -= 0.5;
                     if(get_player().cocks[_loc2_].cockThickness * 6 > get_player().cocks[_loc2_].cockLength)
                     {
                        var _temp_2:* = get_player().cocks[_loc2_];
                        _temp_2.cockThickness = _temp_2.cockThickness - 0.2;
                     }
                     if(get_player().cocks[_loc2_].cockThickness * 8 > get_player().cocks[_loc2_].cockLength)
                     {
                        var _temp_3:* = get_player().cocks[_loc2_];
                        _temp_3.cockThickness = _temp_3.cockThickness - 0.2;
                     }
                     if(get_player().cocks[_loc2_].cockThickness < 0.5)
                     {
                        get_player().cocks[_loc2_].cockThickness = 0.5;
                     }
                  }
                  _loc4_ += get_player().increaseCock(_loc2_,(Utils.rand(3) + 1) * -1);
                  outputText("[pg]");
                  get_player().lengthChange(_loc4_,1);
                  if(get_player().cocks[_loc2_].cockLength < 2)
                  {
                     outputText("");
                     get_player().killCocks(1);
                  }
               }
            }
         }
         if(int(get_player().vaginas.length) == 0 && (Utils.rand(3) == 0 || _loc5_ > 75 && _loc5_ < 90))
         {
            get_player().createVagina();
            get_player().vaginas[0].vaginalLooseness = 0;
            get_player().vaginas[0].vaginalWetness = 1;
            get_player().vaginas[0].virgin = true;
            get_player().setClitLength(0.25);
            if(get_player().fertility <= 5)
            {
               get_player().fertility = 6;
            }
            outputText("[pg]你的胯下开始发痒，并垂直蔓延。你伸手往下摸，发现了一个开口。你长出了一个<b>新的" + get_player().vaginaDescript(0) + "</b>！");
         }
         else if(_loc5_ > 75 && _loc5_ < 90)
         {
            if(int(get_player().cocks.length) > 0 && !get_hyper())
            {
               outputText("[pg]");
               _loc2_ = 0;
               _loc3_ = int(get_player().cocks.length);
               while(_loc3_ > 0)
               {
                  _loc3_--;
                  if(get_player().cocks[_loc2_].cockLength <= get_player().cocks[_loc3_].cockLength)
                  {
                     _loc2_ = _loc3_;
                  }
               }
               if(get_player().cocks[_loc2_].cockLength < 6 && get_player().cocks[_loc2_].cockLength >= 2.9)
               {
                  var _temp_4:* = get_player().cocks[_loc2_];
                  _temp_4.cockLength = _temp_4.cockLength - 0.5;
               }
               _loc4_ = get_player().increaseCock(_loc2_,-1 * (Utils.rand(3) + 1));
               get_player().lengthChange(_loc4_,1);
               if(get_player().cocks[_loc2_].cockLength < 3)
               {
                  outputText("");
                  get_player().killCocks(1);
               }
            }
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("[pg]");
               if(get_player().vaginas[0].vaginalWetness == 5)
               {
                  if(int(get_player().vaginas.length) == 1)
                  {
                     outputText("你的" + get_player().vaginaDescript(0) + "在你自发高潮时，喷出液体顺着你的腿流下。");
                  }
                  else
                  {
                     outputText("你的" + get_player().vaginaDescript(0) + "在你自发高潮时，喷出液体顺着你的腿流下，在地上留下了一大滩浓稠的淫液。它很快就被泥土吸收了。");
                  }
                  get_player().orgasm("Vaginal");
                  if(tainted)
                  {
                     dynStats(DynStat.Cor(1));
                  }
               }
               if(get_player().vaginas[0].vaginalWetness == 4)
               {
                  if(int(get_player().vaginas.length) == 1)
                  {
                     outputText("你的小穴感觉又热又多汁，既兴奋又敏感。你无法抗拒，双手探入你的" + get_player().vaginaDescript(0) + "中。你很快就高潮了，液体喷得到处都是。<b>你现在是个潮吹者了</b>。");
                  }
                  if(int(get_player().vaginas.length) > 1)
                  {
                     outputText("你的小穴感觉又热又多汁，既兴奋又敏感。你无法抗拒，双手探入你的" + get_player().vaginaDescript(0) + "中。你夹紧手指颤抖着，大量的液体喷洒在你身上和地上。液体很快就消失在泥土中。");
                  }
                  get_player().orgasm("Vaginal");
                  if(tainted)
                  {
                     dynStats(DynStat.Cor(1));
                  }
               }
               if(get_player().vaginas[0].vaginalWetness == 3)
               {
                  if(int(get_player().vaginas.length) == 1)
                  {
                     outputText("你突然感觉到一股液体顺着你的腿流下来。你闻了闻，意识到那是你的淫液。你的" + get_player().vaginaDescript(0) + "现在不断地流出润滑液，顺着你的腿流下。");
                  }
                  if(int(get_player().vaginas.length) > 1)
                  {
                     outputText("你突然感觉到几股液体顺着你的腿流下来。你闻了闻，意识到那是你的淫液。它们似乎不断地流出润滑液，顺着你的腿流下。");
                  }
               }
               if(get_player().vaginas[0].vaginalWetness == 2)
               {
                  outputText("当你意识到你的阴唇变得多么湿润时，你因为兴奋而涨红了脸。当你稍微平静下来后，你意识到它们仍然很滑，随时准备好做爱，而且永远都会这样。");
               }
               if(get_player().vaginas[0].vaginalWetness == 1)
               {
                  if(int(get_player().vaginas.length) == 1)
                  {
                     outputText("一种强烈的兴奋感传遍全身，让你疯狂地自慰起来。事后你意识到你的" + get_player().vaginaDescript(0) + "感觉比平时湿润得多。");
                  }
                  else
                  {
                     outputText("一种强烈的兴奋感传遍全身，让你疯狂地自慰起来。事后你意识到你的" + get_player().vaginaDescript(0) + "比平时湿润得多。");
                  }
               }
               if(get_player().vaginas[0].vaginalWetness == 0)
               {
                  outputText("你感到胯下有一阵刺痛，但无法确定是什么原因。");
               }
               _loc2_ = int(get_player().vaginas.length);
               while(_loc2_ > 0)
               {
                  _loc2_--;
                  if(get_player().vaginas[_loc2_].vaginalWetness < 5)
                  {
                     var _temp_5:* = get_player().vaginas[_loc2_];
                     _temp_5.vaginalWetness = _temp_5.vaginalWetness + 1;
                  }
               }
            }
         }
         if(_loc5_ >= 90)
         {
            if(!tainted || get_player().skin.tone == "blue" || get_player().skin.tone == "purple" || get_player().skin.tone == "indigo" || get_player().skin.tone == "shiny black")
            {
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("[pg]你的心跳越来越快，热量涌向你的腹股沟。你感觉到你的阴蒂从包皮下探出头来，随着充血越来越多，它变得越来越大、越来越长。");
                  if(get_player().getClitLength() > 3 && !get_player().hasPerk(PerkLib.BigClit))
                  {
                     outputText("过了一会儿，它缩小了，恢复了正常勃起时的大小。你猜它不能再变大了。");
                  }
                  if(get_player().getClitLength() > 5 && get_player().hasPerk(PerkLib.BigClit))
                  {
                     outputText("最终它缩小回了正常（但仍然巨大）的大小。你猜它不能再变大了。");
                  }
                  if(get_player().hasPerk(PerkLib.BigClit) && get_player().getClitLength() < 6 || get_player().getClitLength() < 3)
                  {
                     _loc2_ = 2;
                     if(get_player().hasPerk(PerkLib.BigClit))
                     {
                        _loc2_ += 2;
                     }
                     get_player().changeClitLength((Utils.rand(4) + _loc2_) / 10);
                  }
                  dynStats(DynStat.Sens(3),DynStat.Lust(8));
               }
               else
               {
                  get_player().createVagina();
                  get_player().vaginas[0].vaginalLooseness = 0;
                  get_player().vaginas[0].vaginalWetness = 1;
                  get_player().vaginas[0].virgin = true;
                  get_player().setClitLength(0.25);
                  outputText("[pg]你的胯下开始发痒，并垂直蔓延。你伸手往下摸，发现了一个开口。你长出了一个<b>新的" + get_player().vaginaDescript(0) + "</b>！");
               }
            }
            else
            {
               _loc2_ = Utils.rand(10);
               if(_loc2_ == 0)
               {
                  get_player().skin.tone = "shiny black";
               }
               if(_loc2_ == 1 || _loc2_ == 2)
               {
                  get_player().skin.tone = "indigo";
               }
               if(_loc2_ == 3 || _loc2_ == 4 || _loc2_ == 5)
               {
                  get_player().skin.tone = "purple";
               }
               if(_loc2_ > 5)
               {
                  get_player().skin.tone = "blue";
               }
               outputText("[pg]一阵阵刺痛感在你的皮肤上蔓延，越来越强烈，<b>你的肤色慢慢改变，变暗成了[skintone]。</b>");
               get_player().arms.updateClaws(get_player().arms.claws.type);
               if(tainted)
               {
                  dynStats(DynStat.Cor(1));
               }
               else
               {
                  dynStats(DynStat.Cor(0));
               }
            }
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(Utils.rand(40) + get_player().cor / 3 > 35 && tainted)
         {
            get_mutations().demonChanges(_loc1_);
         }
         if(tainted)
         {
            outputText(get_player().modFem(100,2));
            if(Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(15,2));
            }
         }
         else
         {
            outputText(get_player().modFem(90,1));
            if(Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(20,2));
            }
         }
         get_player().refillHunger(20);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

