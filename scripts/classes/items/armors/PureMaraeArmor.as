package classes.items.armors
{
   import classes.CoC;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class PureMaraeArmor extends Armor
   {
      
      public function PureMaraeArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DB.Armr","Divine Armor","divine bark armor","a suit of divine bark armor",40,1100,"A suit of armor crafted from the white bark that was gifted to you by Marae. It offers great protection and calms the mind of anyone wearing it.","Heavy");
         boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.1),true);
      }
      
      override public function useText() : void
      {
         outputText("在穿上护甲之前，你先把自己脱了个精光。");
         outputText("[pg]首先，你费力地穿上了胸甲。");
         if(get_player().isBiped())
         {
            if(get_player().lowerBody.type == 0)
            {
               outputText("然后你把脚伸进靴子里。穿好靴子后，你开始穿下一件装备。");
            }
            else
            {
               outputText("然后你试图把脚伸进靴子里。你意识到这些靴子是为正常脚型的人设计的。你不得不对靴子进行修改以适应你的脚，当你穿上靴子时，你的脚露在了外面。");
            }
         }
         outputText("接下来，你戴上强化树皮护腕来保护双臂。[pg]");
         if(!get_player().isTaur())
         {
            outputText("最后，你穿上丝绸缠腰布遮住你的腹股沟。你感谢拉塔祖尔给了你这个，你知道你可以轻松地接触到你的");
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
               outputText("裆部");
            }
            outputText("如果你需要的话。");
            if(get_player().hasCock())
            {
               if(get_player().biggestCockArea() >= 40 && get_player().biggestCockArea() < 100)
               {
                  outputText("你的丝质缠腰布下顶起了一大块凸起。");
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  outputText("你的男根太大了，丝质缠腰布根本遮不住。你的一部分" + get_player().cockDescriptShort(get_player().biggestCockIndex()) + "露了出来。");
                  if(get_player().cor < 33)
                  {
                     outputText("你叹了口气。");
                  }
                  else if(get_player().cor >= 33 && get_player().cor < 66)
                  {
                     outputText("你微微脸红，不太确定自己的感受。");
                  }
                  else if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
                  {
                     outputText("你欣赏着自己那显眼的男子气概。");
                  }
               }
            }
            if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
            {
               outputText("你很想随时掀起你的遮阴布炫耀一番。");
            }
         }
         else
         {
            outputText("最后，你拿起一块丝绸遮阴布，但在打量自己的半人马身体时停了下来。你根本没办法好好遮住你的生殖器！");
            if(get_player().cor < 33)
            {
               outputText("你叹了口气。当个半人马真是不方便！");
            }
            else if(get_player().cor >= 33 && get_player().cor < 66)
            {
               outputText("你微微脸红，不太确定自己的感受。");
            }
            else if(get_player().cor >= 66 || get_game().ceraphScene.hasExhibition())
            {
               outputText("无论如何，你对现在的自己感到满意。");
            }
            outputText("你暂时将这条丝质缠腰布留在你的物品栏中。");
         }
         outputText("你穿戴整齐，准备出发。");
      }
      
      override public function get_supportsBulge() : Boolean
      {
         return true;
      }
      
      override public function get_def() : Number
      {
         return 40 - int(get_player().cor / 5);
      }
   }
}

