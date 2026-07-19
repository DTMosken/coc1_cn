package classes.items.consumables
{
   import classes.Cock;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BlueEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function BlueEgg(param1:int = 0)
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
               _loc2_ = "BlueEgg";
               _loc3_ = "Blue Egg";
               _loc4_ = "a blue and white mottled egg";
               _loc5_ = "一颗蓝白斑驳的蛋。它在大小上和鸡蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.BluEg";
               _loc3_ = "L.Blue Egg";
               _loc4_ = "a large blue and white mottled egg";
               _loc5_ = "一颗巨大的蓝白斑驳的蛋。它在大小上和鸵鸟蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         outputText("你狼吞虎咽地吃下了这枚蛋，暂时缓解了饥饿。");
         if(!large)
         {
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("[pg]你的小穴因疼痛而紧缩，让你痛得弯下了腰。你把手伸下去检查，却感觉那条缝隙越来越小，直到完全消失，连同你的阴蒂也一起不见了！<b> 你的小穴消失了！</b>");
               get_player().setClitLength(0.5);
               get_player().removeVagina(0,1);
            }
            if(int(get_player().cocks.length) > 0)
            {
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("[pg]你的" + get_player().multiCockDescript() + "充血勃起到了最大尺寸……并开始淫靡地生长。");
                  _loc1_ = int(get_player().cocks.length);
                  while(_loc1_ > 0)
                  {
                     _loc1_--;
                     _loc2_ = get_player().increaseCock(_loc1_,Utils.rand(3) + 2);
                     _loc3_ = get_player().cocks[_loc1_].thickenCock(1);
                  }
                  get_player().lengthChange(_loc2_,int(get_player().cocks.length));
                  if(_loc3_ >= 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("[pg]你的[cocks]迅速变宽，周长肿胀了一英寸甚至更多，让它感觉又粗又软。");
                     }
                     else
                     {
                        outputText("[pg]你的[cocks]迅速变宽，周长肿胀了一英寸甚至更多，让它们感觉又粗又软。");
                     }
                  }
                  if(_loc3_ <= 0.5)
                  {
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("[pg]你的[cocks]感觉肿胀而沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它们确实变粗了。");
                     }
                     else
                     {
                        outputText("[pg]你的[cocks]感觉肿胀而沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它确实变粗了。");
                     }
                  }
                  if(_loc3_ > 0.5 && _loc2_ < 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("[pg]你的[cocks]似乎肿胀了起来，感觉更重了。你低下头，看着它随着变粗而变得更加肥大。");
                     }
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("[pg]你的[cocks]似乎肿胀了起来，感觉更重了。你低下头，看着它们变粗变胖。");
                     }
                  }
                  dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20));
               }
               if(int(get_player().cocks.length) == 1)
               {
                  outputText("[pg]你的[cocks]充血到了正常大小……然后开始生长……");
                  _loc3_ = get_player().cocks[0].thickenCock(1);
                  _loc2_ = get_player().increaseCock(0,Utils.rand(3) + 2);
                  get_player().lengthChange(_loc2_,1);
                  if(_loc3_ >= 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("你的[cocks]迅速变宽，周长肿胀了一英寸或更多，让它感觉又胖又软。");
                     }
                     else
                     {
                        outputText("你的[cocks]迅速变宽，周长肿胀了一英寸或更多，让它们感觉又胖又软。");
                     }
                  }
                  if(_loc3_ <= 0.5)
                  {
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("你的[cocks]感觉肿胀而沉重。你用坚定但温柔的力道捏了捏，证实了你的猜想。它们确实变粗了。");
                     }
                     else
                     {
                        outputText("你的[cocks]感觉肿胀沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它确实变粗了。");
                     }
                  }
                  if(_loc3_ > 0.5 && _loc2_ < 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("你的[cocks]似乎肿胀起来，感觉更重了。你低下头，看着它变粗变胖。");
                     }
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("你的[cocks]似乎肿胀起来，感觉更重了。你低下头，看着它们变粗变胖。");
                     }
                  }
                  dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20));
               }
            }
            get_player().refillHunger(20);
         }
         else
         {
            if(get_player().bRows() > 1 || get_player().butt.rating > 5 || get_player().hips.rating > 5 || get_player().hasVagina())
            {
               outputText("[pg]");
            }
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("你的小穴因疼痛而紧缩，让你痛得弯下了腰。你把手伸下去检查，却感觉那条缝隙越来越小，直到完全消失，连同你的阴蒂也一起不见了！[pg]");
               if(get_player().bRows() > 1 || get_player().butt.rating > 5 || get_player().hips.rating > 5)
               {
                  outputText("");
               }
               get_player().setClitLength(0.5);
               get_player().removeVagina(0,1);
            }
            if(get_player().bRows() > 1)
            {
               outputText("随着胸前多余重量的消失，你的背部放松了下来。<b>你最下面的" + get_player().breastDescript(int(get_player().bRows() - 1)) + "消失了。</b>");
               if(get_player().butt.rating > 5 || get_player().hips.rating > 5)
               {
                  outputText("");
               }
               get_player().removeBreastRow(int(get_player().bRows() - 1),1);
            }
            if(get_player().butt.rating > 5)
            {
               outputText("你感觉到你的[ass]变得更小更紧实，肌肉也变得紧致有型。");
               if(get_player().hips.rating > 5)
               {
                  outputText("");
               }
               var _temp_1:* = get_player().butt;
               _temp_1.rating = _temp_1.rating - 2;
            }
            if(get_player().hips.rating > 5)
            {
               outputText("你感觉到[hips]突然传来乳酸堆积的灼烧感，你意识到它们变瘦了一些，也变得更紧实了。");
               var _temp_2:* = get_player().hips;
               _temp_2.rating = _temp_2.rating - 2;
            }
            if(get_player().biggestTitSize() >= 1)
            {
               get_player().shrinkTits();
            }
            if(int(get_player().cocks.length) > 0)
            {
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("[pg]你的" + get_player().multiCockDescript() + "胀到了最大尺寸……并开始淫秽地生长。");
                  _loc1_ = int(get_player().cocks.length);
                  while(_loc1_ > 0)
                  {
                     _loc1_--;
                     _loc2_ = get_player().increaseCock(_loc1_,Utils.rand(3) + 5);
                     _loc3_ = get_player().cocks[_loc1_].thickenCock(1.5);
                  }
                  get_player().lengthChange(_loc2_,int(get_player().cocks.length));
                  if(_loc3_ >= 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("[pg]你的[cocks]迅速变宽，周长肿胀了一英寸甚至更多，让它感觉又粗又软。");
                     }
                     else
                     {
                        outputText("[pg]你的[cocks]迅速变宽，周长肿胀了一英寸甚至更多，让它们感觉又粗又软。");
                     }
                  }
                  if(_loc3_ <= 0.5)
                  {
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("[pg]你的[cocks]感觉肿胀而沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它们确实变粗了。");
                     }
                     else
                     {
                        outputText("[pg]你的[cocks]感觉肿胀而沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它确实变粗了。");
                     }
                  }
                  if(_loc3_ > 0.5 && _loc2_ < 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("[pg]你的[cocks]似乎肿胀了起来，感觉更重了。你低下头，看着它随着变粗而变得更加肥大。");
                     }
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("[pg]你的[cocks]似乎肿胀了起来，感觉更重了。你低下头，看着它们变粗变胖。");
                     }
                  }
                  dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20));
               }
               if(int(get_player().cocks.length) == 1)
               {
                  outputText("[pg]你的[cocks]充血恢复到了正常大小……然后开始变大……");
                  _loc3_ = get_player().cocks[0].thickenCock(1.5);
                  _loc2_ = get_player().increaseCock(0,Utils.rand(3) + 5);
                  get_player().lengthChange(_loc2_,1);
                  if(_loc3_ >= 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("你的[cocks]迅速变宽，周长肿胀了一英寸或更多，让它感觉又胖又软。");
                     }
                     else
                     {
                        outputText("你的[cocks]迅速变宽，周长肿胀了一英寸或更多，让它们感觉又胖又软。");
                     }
                  }
                  if(_loc3_ <= 0.5)
                  {
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("你的[cocks]感觉肿胀而沉重。你用坚定但温柔的力道捏了捏，证实了你的猜想。它们确实变粗了。");
                     }
                     else
                     {
                        outputText("你的[cocks]感觉肿胀沉重。你用力但又轻柔地捏了捏，证实了你的猜想。它确实变粗了。");
                     }
                  }
                  if(_loc3_ > 0.5 && _loc2_ < 1)
                  {
                     if(int(get_player().cocks.length) == 1)
                     {
                        outputText("你的[cocks]似乎肿胀起来，感觉更重了。你低下头，看着它变粗变胖。");
                     }
                     if(int(get_player().cocks.length) > 1)
                     {
                        outputText("你的[cocks]似乎肿胀起来，感觉更重了。你低下头，看着它们变粗变胖。");
                     }
                  }
                  dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(20));
               }
            }
            get_player().refillHunger(60);
         }
         if(Utils.rand(3) == 0)
         {
            if(large)
            {
               outputText(get_player().modFem(0,8));
            }
            else
            {
               outputText(get_player().modFem(5,3));
            }
         }
         return false;
      }
   }
}

