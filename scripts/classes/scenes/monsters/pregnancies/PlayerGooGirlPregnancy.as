package classes.scenes.monsters.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerGooGirlPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerGooGirlPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,16,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.lake.gooGirlScene.gooPregVagBirth();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            output.text("<b>你巨大的孕肚不断阻碍着你的行动，但肚子里装满史莱姆的不断蠕动和摇晃，却以它自己的方式让你感到安心。你迫不及待地想体验史莱姆从你的阴唇流出、喷涌而出的感觉，当你将新生命诞生到这个世界上时，它们会亲密地抚摸你。");
            if(_loc1_.cor < 50)
            {
               output.text(" 你打了个寒颤，摇了摇头，纳闷自己为什么会想这么奇怪的事情。");
            }
            output.text("</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 32 || _loc1_.get_pregnancyIncubation() == 64 || _loc1_.get_pregnancyIncubation() == 82 || _loc1_.get_pregnancyIncubation() == 16)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("几滴母乳从你的乳头溢出，你的身体正在为即将到来的分娩做准备。[pg]");
               _loc1_.boostLactation(0.5);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你意识到你的乳房感觉很胀，并且偶尔会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经胀大到了C罩杯，</b>因为你即将到来的孕期。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于你怀孕引起的荷尔蒙变化。[pg]");
               _loc1_.growTits(1,1,false,3);
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
   }
}

