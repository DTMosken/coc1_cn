package classes.scenes.npcs.pregnancies
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.PregnancyUtils;
   import classes.internals.Utils;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerCorruptedWitchPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerCorruptedWitchPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,38,this);
      }
      
      public function vaginalBirth() : void
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         PregnancyUtils.createVaginaIfMissing(output,_loc1_);
         KGAMECLASS.kGAMECLASS.volcanicCrag.corruptedWitchScene.giveBirthToWitches();
         if(_loc1_.hips.rating < 10)
         {
            _temp_1.rating += 1;
            output.text("[pg]分娩后，你的" + Utils.cnName(_loc1_.get_armorName()) + "穿在你的" + _loc1_.hipDescript() + "上显得更紧身了。");
         }
         output.text("[pg]");
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 168)
         {
            output.text("<b>你发现自己的肚子变大了一点。也许你需要少吃点那些奇怪的食物了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 96)
         {
            output.text("<b>你隆起的肚子明显变大了。你大汗淋漓。不管你体内长的是什么，它都异常温暖。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 24)
         {
            output.text("<b>你的肚子已经大到了极限。你时不时地抚摸着它，渴望着将你的孩子带到这个世界上。[pg]</b>");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 168 || _loc1_.get_pregnancyIncubation() == 96)
         {
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() >= 1 && _loc1_.biggestLactation() < 2)
            {
               output.text("你的乳房因为积聚了多余的乳汁而感到肿胀。你希望这些乳汁足够应付即将到来的分娩。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() > 0 && _loc1_.biggestLactation() < 1)
            {
               output.text("随着你的身体为即将到来的分娩做准备，几滴乳汁从你的乳头溢出。[pg]");
               _loc1_.boostLactation(0.5);
            }
            if(_loc1_.biggestTitSize() >= 3 && _loc1_.mostBreastsPerRow() > 1 && _loc1_.biggestLactation() == 0)
            {
               output.text("<b>你发现自己的乳房感觉很胀，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经胀大到了C罩杯，</b>这显然是因为你怀孕了。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
            if(_loc1_.biggestTitSize() == 1 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经长到了B罩杯，</b>这可能是由于你怀孕期间的荷尔蒙变化所致。[pg]");
               _loc1_.growTits(1,1,false,3);
            }
         }
         return _loc2_;
      }
   }
}

