package classes.scenes.monsters.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerCockatricePregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerCockatricePregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,3,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.highMountains.cockatriceScene.cockatriceBirth();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 185)
         {
            output.text("<b>你的肚子咕咕叫，好像空了一样，尽管你不久前才吃过东西。也许是因为你做了那么多运动，你只需要多吃一点。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 160)
         {
            output.text("<b>你的肚子看起来有点胖");
            if(_loc1_.thickness > 60 && _loc1_.tone < 40)
            {
               output.text(" 甚至对你来说也是如此");
            }
            output.text("，也许你应该减少最近摄入的所有食物？</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 140)
         {
            output.text("<b>你的肚子明显变大了，而且无论你怎么做，只要一感到饿，你就忍不住想吃东西。你唯一能想到的解释就是，你在旅行中怀孕了。希望这不会给你的冒险带来不便。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 110)
         {
            output.text("<b>你的肚子变得又圆又大，也许和你记忆中家乡孕妇的肚子一样大。长辈们总是坚持每个人都要尽自己的一份力量，保持足够高的人口数量，以弥补每年失去一名勇者的损失。你给了自己一个小小的拥抱，从你被荷尔蒙扰乱的身体中涌起一阵幸福感。怀孕真是太棒了！</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你那巨大的孕肚不断阻碍着你的行动，但未出生的后代不断地蠕动和摇晃，让你很确定你不用再怀着它们多久了。一种母亲的自豪感在你的胸中涌起——你就是知道你会生下这么棒的宝宝。");
            if(_loc1_.cor < 50)
            {
               output.text(" 你打了个寒颤，摇了摇头，想知道自己为什么会想这些不寻常的事情。");
            }
            output.text("</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 85 || _loc1_.get_pregnancyIncubation() == 150)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了额外的乳汁而感到肿胀。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴母乳从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很胀，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>考虑到你即将怀孕。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于你怀孕期间的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
   }
}

