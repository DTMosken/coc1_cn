package classes.items.armors
{
   import classes.CoC;
   import classes.Player;
   import classes.items.Armor;
   import flash.Boot;
   
   public class BeeArmor extends Armor
   {
      
      public function BeeArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BeeArmr","Bee Armor","sexy black chitin armor-plating","a set of chitinous armor",18,200,"A suit of armor cleverly fashioned from giant bee chitin. It comes with a silken loincloth to protect your modesty.","Heavy");
      }
      
      override public function useText() : void
      {
         outputText("你" + get_player().clothedOrNaked("首先把自己脱个精光，然后") + "一件一件地穿上你的护甲。");
         outputText("[pg]首先，你费力地穿上胸甲。");
         if(get_player().isBiped())
         {
            if(get_player().lowerBody.type == 0)
            {
               outputText("接着你把脚伸进靴子里。穿好靴子后，你开始穿下一件装备。");
            }
            else
            {
               outputText("接着你试图把脚伸进靴子里。你意识到这双靴子是为正常脚型的人设计的。你不得不修改靴子以适应你的脚，当你穿上靴子时，你的脚露在外面。");
            }
         }
         outputText("接下来，你戴上甲壳护腕来保护你的手臂。[pg]");
         if(!get_player().isTaur())
         {
            outputText("最后但同样重要的是，你穿上丝绸缠腰布来遮盖你的腹股沟。你为此感谢拉塔祖尔，而且你知道你可以轻松地接触到你的");
            if(get_player().hasCock())
            {
               outputText(get_player().multiCockDescriptLight());
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("和");
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            if(!get_player().hasCock() && !get_player().hasVagina())
            {
               outputText("下体");
            }
            outputText("，如果你需要的话。");
            if(get_player().hasCock())
            {
               if(get_player().biggestCockArea() >= 40 && get_player().biggestCockArea() < 100)
               {
                  outputText("你的丝绸缠腰布上顶出了一个巨大的凸起。");
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  outputText("你的阳具太大了，丝绸缠腰布根本遮不住。你的" + get_player().cockDescriptShort(get_player().biggestCockIndex()) + "有一部分露在了外面。");
                  if(get_player().cor < 33)
                  {
                     outputText("你叹了口气。");
                  }
                  else if(get_player().cor >= 33 && get_player().cor < 66)
                  {
                     outputText("你微微脸红，不知道自己是什么感觉。");
                  }
                  else if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
                  {
                     outputText("你欣赏着自己那若隐若现的阳具。");
                  }
               }
            }
            if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
            {
               outputText("你真想随时掀起缠腰布炫耀一番。");
            }
         }
         else
         {
            outputText("最后，你拿起一条丝绸兜裆布，但在打量了自己半人马的身体后停了下来。你根本没办法好好遮住自己的生殖器！");
            if(get_player().cor < 33)
            {
               outputText("你叹了口气。当半人马真是不方便！");
            }
            else if(get_player().cor >= 33 && get_player().cor < 66)
            {
               outputText("你微微脸红，不知道自己是什么感觉。");
            }
            else if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
            {
               outputText("不管怎样，你对自己现在的样子很满意。");
            }
            outputText("你暂时把丝绸兜裆布收进了物品栏里。");
         }
         outputText("[pg]你欣赏着这套护甲的设计。难怪它看起来如此性感！[pg]");
      }
   }
}

