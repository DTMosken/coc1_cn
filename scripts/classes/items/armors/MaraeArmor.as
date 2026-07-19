package classes.items.armors
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.items.Armor;
   import flash.Boot;
   
   public class MaraeArmor extends Armor
   {
      
      public function MaraeArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TB.Armr","TentacleArmor","tentacled bark armor","a suit of tentacled bark armor",35,1000,"A suit of armor crafted from the white bark of the corrupted Marae you defeated. It offers great protection, but comes with writhing tentacles still attached to the bark.","Heavy");
      }
      
      override public function useText() : void
      {
         outputText("你" + get_player().clothedOrNaked("先把自己脱个精光，然后") + "开始穿上这套护甲。");
         if(get_player().cor < 33)
         {
            outputText("一想到要穿上这套爬满触手的护甲，你就不禁打了个寒颤，但你还是照做了。");
         }
         if(get_player().cor >= 33 && get_player().cor < 66)
         {
            outputText("你对穿上这套爬满触手的护甲感到有些迟疑。");
         }
         if(get_player().cor >= 66)
         {
            outputText("你迫不及待地想要穿上这套爬满触手的护甲。");
         }
         outputText("[pg]首先，你费力地钻进胸甲里。");
         if(get_player().isBiped())
         {
            if(get_player().lowerBody.type == 0)
            {
               outputText("接着你把脚伸进靴子里。穿好靴子后，你继续穿下一件。");
            }
            else
            {
               outputText("接着你试着把脚伸进靴子里。你意识到这靴子是给正常脚型的人设计的。你不得不对靴子进行修改以适应你的脚，当你穿上靴子时，你的脚露在了外面。");
            }
         }
         outputText("接下来，你戴上加固的树皮护腕来保护你的手臂。[pg]");
         if(!get_player().isTaur())
         {
            outputText("最后但同样重要的是，你穿上丝绸缠腰布来遮挡你的腹股沟。你为此感谢拉塔祖尔，而且你知道你可以轻松地接触到你的");
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
                  outputText("你的丝绸缠腰布上顶出了一个大大的凸起。");
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  outputText("你的阳具太大了，丝绸缠腰布根本遮不住。你的" + get_player().cockDescriptShort(get_player().biggestCockIndex()) + "有一部分露了出来。");
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
                     outputText("你欣赏着自己若隐若现的阳具。");
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
            outputText("最后，你拿起一条丝绸缠腰布，但在打量了自己半人马的身体后停了下来。你根本没办法好好遮住你的生殖器！");
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
            outputText("你暂时把丝绸缠腰布收了起来。");
         }
         outputText("你穿戴整齐，准备出发了。");
         if(get_player().get_lust100() < 20)
         {
            outputText("[pg]你能感觉到胸甲里的触手滑行着，挑逗着你的[butt]。你" + (get_player().cor < 60 ? "惊讶地喘息" : "愉悦地呻吟") + "。");
            dynStats(DynStat.Lust(30));
         }
      }
      
      override public function get_supportsBulge() : Boolean
      {
         return true;
      }
      
      override public function get_def() : Number
      {
         return 15 + int(get_player().cor / 5);
      }
   }
}

