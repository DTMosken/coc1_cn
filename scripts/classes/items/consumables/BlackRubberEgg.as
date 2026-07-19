package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BlackRubberEgg extends Consumable
   {
      
      public static var SMALL:int = 0;
      
      public static var LARGE:int = 1;
      
      public var large:Boolean;
      
      public function BlackRubberEgg(param1:int = 0)
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
               _loc2_ = "BlackEg";
               _loc3_ = "Black Egg";
               _loc4_ = "a rubbery black egg";
               _loc5_ = "一颗黑色的橡胶质感的蛋。它的大小和鸡蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "L.BlkEg";
               _loc3_ = "L.Black Egg";
               _loc4_ = "a large rubbery black egg";
               _loc5_ = "一颗黑色的橡胶质感的大蛋。它的大小和鸵鸟蛋差不多，但直觉告诉你它不仅仅是食物。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         outputText("你吞下了这颗蛋，暂时缓解了饥饿。");
         if(!large)
         {
            if(get_player().skin.adj != "smooth" && get_player().skin.adj != "latex" && get_player().skin.adj != "rubber" || get_player().skin.desc != "skin")
            {
               outputText("[pg]你的[skindesc]传来一阵愉悦的刺痛感，");
               if(get_player().hasPlainSkin())
               {
                  outputText("瑕疵逐渐褪去，变成了完美无瑕的光滑肌肤。");
               }
               if(get_player().hasFur())
               {
                  outputText("成块地脱落，露出了下面光滑的肌肤。");
               }
               if(get_player().hasScales())
               {
                  outputText("开始掉落，在你周围堆成一堆，露出了下面光滑的肌肤。");
               }
               if(get_player().hasGooSkin())
               {
                  outputText("发生变化，变成了完美无瑕的光滑肌肤。");
               }
               get_player().skin.desc = "skin";
               get_player().skin.adj = "smooth";
               if(get_player().skin.tone == "rough gray")
               {
                  get_player().skin.tone = "gray";
               }
               get_player().skin.type = 0;
               get_player().underBody.restore();
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
            else if(get_player().hair.color.indexOf("rubbery") == -1 && get_player().hair.color.indexOf("latex-textured") != 0 && get_player().hair.length != 0)
            {
               if(get_player().skin.desc == "skin" && get_player().skin.adj == "rubber")
               {
                  outputText("[pg]你的头皮一阵发麻，你的[hair]变得浓密，发丝融合成了");
                  outputText("浓密的橡胶头发。");
                  get_player().hair.color = "rubbery " + get_player().hair.color;
                  dynStats(DynStat.Cor(2));
               }
               if(get_player().skin.desc == "skin" && get_player().skin.adj == "latex")
               {
                  outputText("[pg]你的头皮一阵发麻，你的[hair]变得浓密，发丝融合成了");
                  outputText("闪亮的胶乳头发。");
                  get_player().hair.color = "latex-textured " + get_player().hair.color;
                  dynStats(DynStat.Cor(2));
               }
            }
            get_player().refillHunger(20);
         }
         if(large)
         {
            if(get_player().skin.desc == "skin" && get_player().skin.adj == "smooth")
            {
               outputText("[pg]你那本就完美无瑕的光滑肌肤开始发麻，再次发生了变化。随着质地的微妙改变，它变得更加光亮。你摸了摸自己，倒吸一口凉气，意识到你的皮肤已经变成了");
               if(Utils.rand(2) == 0)
               {
                  get_player().skin.desc = "skin";
                  get_player().skin.adj = "latex";
                  outputText("一层纯粹的乳胶。");
               }
               else
               {
                  get_player().skin.desc = "skin";
                  get_player().skin.adj = "rubber";
                  outputText("一层敏感的橡胶。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,661,1);
               if(get_player().cor < 66)
               {
                  outputText("你觉得自己就像个怪物。");
               }
               else
               {
                  outputText("你觉得自己就像某种性感的[skindesc]情趣娃娃。");
               }
               dynStats(DynStat.Spe(-3),DynStat.Sens(8),DynStat.Lust(10),DynStat.Cor(2));
            }
            if(get_player().skin.adj != "smooth" && get_player().skin.adj != "latex" && get_player().skin.adj != "rubber" || get_player().skin.desc != "skin")
            {
               outputText("[pg]你的[skindesc]传来一阵愉悦的刺痛感，");
               if(get_player().hasPlainSkin())
               {
                  outputText("瑕疵逐渐褪去，变成了完美无瑕的光滑肌肤。");
               }
               if(get_player().hasFur())
               {
                  outputText("成块地脱落，露出了下面光滑的肌肤。");
               }
               if(get_player().hasScales())
               {
                  outputText("开始掉落，在你周围堆成一堆，露出了下面光滑的肌肤。");
               }
               if(get_player().hasGooSkin())
               {
                  outputText("发生变化，变成了完美无瑕的光滑肌肤。");
               }
               get_player().skin.desc = "skin";
               get_player().skin.adj = "smooth";
               if(get_player().skin.tone == "rough gray")
               {
                  get_player().skin.tone = "gray";
               }
               get_player().skin.type = 0;
               get_player().underBody.restore();
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
            else if(get_player().hair.color.indexOf("rubbery") == -1 && get_player().hair.color.indexOf("latex-textured") != 0 && get_player().hair.length != 0)
            {
               if(get_player().skin.adj == "rubber" && get_player().skin.desc == "skin")
               {
                  outputText("[pg]你的头皮一阵发麻，你的[hair]变得浓密，发丝融合成了");
                  outputText("浓密的橡胶头发。");
                  get_player().hair.color = "rubbery " + get_player().hair.color;
                  dynStats(DynStat.Cor(2));
               }
               if(get_player().skin.adj == "latex" && get_player().skin.desc == "skin")
               {
                  outputText("[pg]你的头皮一阵发麻，你的[hair]变得浓密，发丝融合成了");
                  outputText("闪亮的胶乳头发。");
                  get_player().hair.color = "latex-textured " + get_player().hair.color;
                  dynStats(DynStat.Cor(2));
               }
            }
            get_player().refillHunger(60);
         }
         return false;
      }
   }
}

