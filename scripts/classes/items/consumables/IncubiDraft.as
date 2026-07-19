package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class IncubiDraft extends Consumable
   {
      
      public static var TAINTED:int = 0;
      
      public static var PURIFIED:int = 1;
      
      public var tainted:Boolean;
      
      public function IncubiDraft(param1:int = 0)
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
               _loc2_ = "IncubiD";
               _loc3_ = "Incubi Draft";
               _loc4_ = "an incubi draft";
               _loc5_ = "软木塞封口的烧瓶里晃动着一种看起来黏糊糊的灰白色液体，据说能赋予人梦魇般的力量。玻璃上蚀刻着一个长着巨大阴茎的人形生物的风格化图案。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "P.Draft";
               _loc3_ = "P.IncubiDraft";
               _loc4_ = "an untainted incubi draft";
               _loc5_ = "软木塞封口的烧瓶里晃动着看起来黏糊糊的灰白色液体，据说能赋予类似梦魇的力量。玻璃上蚀刻着一个长着巨大阴茎的人形生物的风格化图案。拉塔祖尔已经净化了它，去除了它的腐化特性。";
               _loc6_ = 20;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:String = "incubiDraft";
         if(!tainted)
         {
            _loc1_ += "-purified";
         }
         get_player().slimeFeed();
         var _loc3_:Number = 0;
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
         outputText("这药水黏滑又粘稠，");
         if(get_player().cor <= 33)
         {
            outputText("光是咽下它就让你觉得不干净。");
         }
         if(get_player().cor > 33 && get_player().cor <= 66)
         {
            outputText("让你想起某种你一时想不起来的东西。");
         }
         if(get_player().cor > 66)
         {
            outputText("在所有方面都美味得令人堕落。");
         }
         if(get_player().cor >= 90)
         {
            outputText("你确信这一定是梦魇精液蒸馏出来的。");
         }
         if(_loc5_ < 50)
         {
            if(int(get_player().cocks.length) == 1)
            {
               if(get_player().cocks[0].get_cockType() != CockTypesEnum.DEMON)
               {
                  outputText("[pg]你的[cock]变得惊人地坚硬。它变成了一种闪亮的、非人类的紫色，并开始痉挛，在开始生长时滴下滚烫的恶魔般的精液。");
               }
               else
               {
                  outputText("[pg]你的[cock]变得惊人地坚硬。它在开始生长时滴下滚烫的恶魔般的精液。");
               }
               if(Utils.rand(4) == 0)
               {
                  _loc2_ = int(get_player().increaseCock(0,3));
               }
               else
               {
                  _loc2_ = int(get_player().increaseCock(0,1));
               }
               if(_loc2_ < 0.5)
               {
                  outputText("它刚开始生长就几乎停了下来，只长长了一点点。");
               }
               if(_loc2_ >= 0.5 && _loc2_ < 1)
               {
                  outputText("它缓慢地生长，在大约长了半英寸后停了下来。");
               }
               if(_loc2_ >= 1 && _loc2_ <= 2)
               {
                  outputText("这种感觉令人难以置信，超过一英寸的阴茎肉长了出来。");
               }
               if(_loc2_ > 2)
               {
                  outputText("你微笑着，漫不经心地抚摸着你正在变长的[cock]，看着它又长出了几英寸。");
               }
               if(tainted)
               {
                  dynStats(DynStat.Inte(1),DynStat.Lib(2),DynStat.Sens(1),DynStat.Lust(5 + _loc2_ * 3),DynStat.Cor(1));
               }
               else
               {
                  dynStats(DynStat.Inte(1),DynStat.Lib(2),DynStat.Sens(1),DynStat.Lust(5 + _loc2_ * 3));
               }
               if(get_player().cocks[0].get_cockType() != CockTypesEnum.DEMON)
               {
                  outputText("随着变形完成，你的[cock]恢复了正常的颜色。");
               }
               else
               {
                  outputText("随着变形完成，你的[cock]以一种几乎是愉悦的方式跳动着，然后再次软了下来。");
               }
            }
            if(int(get_player().cocks.length) > 1)
            {
               _loc2_ = int(get_player().cocks.length);
               _loc3_ = 0;
               while(_loc2_ > 0)
               {
                  _loc2_--;
                  if(get_player().cocks[_loc2_].cockLength <= get_player().cocks[int(_loc3_)].cockLength)
                  {
                     _loc3_ = _loc2_;
                  }
               }
               if(Utils.rand(4) == 0)
               {
                  _loc4_ = get_player().increaseCock(int(_loc3_),3);
               }
               else
               {
                  _loc4_ = get_player().increaseCock(int(_loc3_),1);
               }
               if(tainted)
               {
                  dynStats(DynStat.Inte(1),DynStat.Lib(2),DynStat.Sens(1),DynStat.Lust(5 + _loc2_ * 3),DynStat.Cor(1));
               }
               else
               {
                  dynStats(DynStat.Inte(1),DynStat.Lib(2),DynStat.Sens(1),DynStat.Lust(5 + _loc2_ * 3));
               }
               if(get_player().cockTotal() == 2)
               {
                  outputText("[pg]你的两根[cocks]变得异常坚挺，肿胀并抽搐着，颜色变成了闪亮的非人紫色。它们痉挛着，沿着长度滴下浓稠的、像恶魔一样滚烫的预精，同时你最短的" + get_player().cockDescript(int(_loc3_)) + "开始生长。");
               }
               else
               {
                  outputText("[pg]你所有的[cocks]变得异常坚挺，肿胀并抽搐着，颜色变成了闪亮的非人紫色。它们痉挛着，沿着长度滴下浓稠的、像恶魔一样滚烫的预精，同时你最短的" + get_player().cockDescript(int(_loc3_)) + "开始生长。");
               }
               if(_loc4_ < 0.5)
               {
                  outputText("它刚开始生长就几乎停了下来，只长长了一点点。");
               }
               if(_loc4_ >= 0.5 && _loc4_ < 1)
               {
                  outputText("它缓慢地生长，在大约长了半英寸后停了下来。");
               }
               if(_loc4_ >= 1 && _loc4_ <= 2)
               {
                  outputText("这种感觉令人难以置信，超过一英寸的阴茎肉长了出来。");
               }
               if(_loc4_ > 2)
               {
                  outputText("你微笑着，漫不经心地抚摸着你正在变长的" + get_player().cockDescript(int(_loc3_)) + "，它又长出了几英寸。");
               }
               outputText("随着变形完成，你的[cocks]恢复了正常的颜色。");
            }
            if(int(get_player().cocks.length) == 0)
            {
               outputText("[pg]");
               get_mutations().growDemonCock(1);
               if(tainted)
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(3));
               }
               else
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
               }
            }
            if(Utils.rand(4) == 0 && !get_hyper())
            {
               get_player().shrinkTits();
            }
         }
         if(_loc5_ >= 50 && _loc5_ < 93)
         {
            if(int(get_player().cocks.length) > 1)
            {
               outputText("[pg]你的肉棒胀到了最大尺寸……并开始淫荡地生长。");
               _loc2_ = int(get_player().cocks.length);
               while(_loc2_ > 0)
               {
                  _loc2_--;
                  _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(3) + 2);
                  _loc4_ = get_player().cocks[_loc2_].thickenCock(1);
                  if(_loc4_ < 0.1)
                  {
                     get_player().cocks[_loc2_].thickenCock(0.05);
                  }
               }
               get_player().lengthChange(_loc3_,int(get_player().cocks.length));
               if(_loc4_ >= 1)
               {
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText("[pg]你的肉棒迅速变宽，粗度增加了一英寸甚至更多，让它感觉又肥又软。");
                  }
                  else
                  {
                     outputText("[pg]你的肉棒迅速变宽，肿胀起来，周长增加了一英寸甚至更多，感觉又粗又软。");
                  }
               }
               if(_loc4_ <= 0.5)
               {
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("[pg]你的肉棒感觉肿胀而沉重。你用力但温柔地捏了捏，证实了你的猜想。它们确实变粗了。");
                  }
                  else
                  {
                     outputText("[pg]你的肉棒感觉肿胀而沉重。你用力但温柔地捏了捏，证实了你的猜想。它确实变粗了。");
                  }
               }
               if(_loc4_ > 0.5 && _loc3_ < 1)
               {
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText("[pg]你的肉棒似乎肿胀了起来，感觉更重了。你低下头，看着它变粗变胖。");
                  }
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("[pg]你的肉棒似乎肿胀了起来，感觉更重了。你低下头，看着它们变粗变胖。");
                  }
               }
               if(tainted)
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(3));
               }
               else
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
               }
            }
            if(int(get_player().cocks.length) == 1)
            {
               outputText("[pg]你的肉棒充血恢复到正常大小，并开始生长……");
               _loc4_ = get_player().cocks[0].thickenCock(1);
               _loc3_ = get_player().increaseCock(0,Utils.rand(3) + 2);
               get_player().lengthChange(_loc3_,1);
               if(_loc4_ >= 1)
               {
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText("你的肉棒迅速变宽，粗度增加了一英寸甚至更多，感觉又肥又软。");
                  }
                  else
                  {
                     outputText("你的几根肉棒迅速变宽，粗度增加了一英寸甚至更多，感觉又肥又软。");
                  }
               }
               if(_loc4_ <= 0.5)
               {
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("你的几根肉棒感觉肿胀而沉重。你用力但温柔地捏了捏，证实了你的猜想。它们确实变粗了。");
                  }
                  else
                  {
                     outputText("你的肉棒感觉肿胀而沉重。你用力但温柔地捏了捏，证实了你的猜想。它确实变粗了。");
                  }
               }
               if(_loc4_ > 0.5 && _loc3_ < 1)
               {
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText("你的肉棒似乎肿胀了起来，感觉更重了。你低头看着它变得越来越粗壮。");
                  }
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("你的肉棒似乎肿胀了起来，感觉更重了。你低头看着它们变得越来越粗壮。");
                  }
               }
               if(tainted)
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(3));
               }
               else
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
               }
            }
            if(int(get_player().cocks.length) == 0)
            {
               outputText("[pg]");
               get_mutations().growDemonCock(1);
               if(tainted)
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(3));
               }
               else
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
               }
            }
            if(Utils.rand(2) == 0 && !get_hyper())
            {
               get_player().shrinkTits();
            }
         }
         if(_loc5_ >= 93)
         {
            if(get_player().cockTotal() < 10)
            {
               if(Utils.rand(10) < int(get_player().cor / 25))
               {
                  outputText("[pg]");
                  get_mutations().growDemonCock(Utils.rand(2) + 2);
                  if(tainted)
                  {
                     dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(5));
                  }
                  else
                  {
                     dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
                  }
               }
               else
               {
                  get_mutations().growDemonCock(1);
               }
               if(tainted)
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10),DynStat.Cor(3));
               }
               else
               {
                  dynStats(DynStat.Lib(3),DynStat.Sens(5),DynStat.Lust(10));
               }
            }
            if(!get_hyper())
            {
               get_player().shrinkTits();
               get_player().shrinkTits();
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
         if(Utils.rand(4) == 0 && tainted)
         {
            outputText(get_player().modFem(5,2));
         }
         if(Utils.rand(4) == 0 && tainted)
         {
            outputText(get_player().modThickness(30,2));
         }
         get_player().refillHunger(10);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

