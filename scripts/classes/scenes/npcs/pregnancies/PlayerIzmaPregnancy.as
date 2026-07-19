package classes.scenes.npcs.pregnancies
{
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import flash.Boot;
   
   public class PlayerIzmaPregnancy implements VaginalPregnancy
   {
      
      public var output:GuiOutput;
      
      public function PlayerIzmaPregnancy(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         output = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,12,this);
      }
      
      public function vaginalBirth() : void
      {
         KGAMECLASS.kGAMECLASS.izmaScene.pcPopsOutASharkTot();
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Player = KGAMECLASS.kGAMECLASS.player;
         var _loc2_:Boolean = false;
         if(_loc1_.get_pregnancyIncubation() == 275)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               output.text("<b>你醒来时感到有些恶心。伊兹玛坚持要你待在床上，不听任何反驳，在你生病的状态下照顾你。当你终于感觉好些时，她扶你起来。[say:你知道，" + _loc1_.get_short() + "……我觉得你可能怀孕了。]伊兹玛说道，似乎对这个想法感到非常高兴。你不得不承认，你似乎确实长胖了一些……</b>[pg]");
            }
            else
            {
               output.text("<b>你醒来时感到腹胀，你的肚子看起来确实有些浮肿。但同时，你有一种奇怪的渴望……你真的很想吃点鱼。</b>[pg]");
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 250)
         {
            output.text("<b>你的肚子越来越明显地膨胀起来，还在蠕动。你可能怀孕了。</b>[pg]");
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 216)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               output.text("<b>你的肚子现在明显肿胀起来了，而且你总是觉得口渴。伊兹玛总是随时准备给你端水，甚至在你意识到自己口渴之前就预料到了。她现在总是面带微笑，似乎对自己非常满意。");
            }
            else
            {
               output.text("<b>毫无疑问，你怀孕了；你的肚子越来越大，而且不知为何，你总是觉得口渴。");
            }
            output.text("</b>");
            output.text("[pg]");
            if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17]);
            }
            else if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][0],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][1],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][2],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][3],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][4],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][5],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][6],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][7],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][8],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][9],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][10],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][11],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][12],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][13],[DynStat
               .Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][14],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][15],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][16],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][17],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][18],[DynStat.Spe(-1),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(2)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 180)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               output.text("<b>你怀孕的事实已经无法否认，而伊兹玛对你“美丽丰满的新身体”（用她的话说）简直是神魂颠倒。她总是找借口抚摸你隆起的肚子，并尽力哄你靠在她身上休息。然而，当你真的靠着她坐下时，她总是在你身下硬起来。</b>[pg]");
            }
            else
            {
               output.text("<b>你怀孕的事实已经无法否认。你的肚子隆起，偶尔还会因为里面正在成长的后代改变姿势而蠕动。</b>[pg]");
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 120)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               output.text("<b>你的肚子肿胀而沉重；你能感觉到里面的宝宝在踢腿和蠕动。伊兹玛现在似乎总是随叫随到，她绝不会让你自己去拿食物或捡起掉落的东西。[if (isnaked) {Y|她总是暗示你应该为了舒服而光着身子走动。虽然你不愿意这样做，但你}]发现自己梦想着沉入凉爽、干净的水中，并经常洗澡和游泳。无论你肚子里是什么，似乎总是喜欢这样；当你在水里时，它们会变得活跃得多。</b>[pg]");
            }
            else
            {
               output.text("<b>你的肚子肿胀而沉重；你能感觉到里面的宝宝在踢腿和蠕动。你发现自己梦想着沉入凉爽、干净的水中，并经常洗澡和游泳。无论你肚子里是什么，似乎总是喜欢这样；当你在水里时，它们会变得活跃得多。</b>[pg]");
            }
            if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 0)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats();
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 1)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 2)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 3)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 4)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 5)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 6)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 7)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 8)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 9)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 10)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 11)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 12)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 13)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 14)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 15)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 16)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 17)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 18)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17]);
            }
            else if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) == 19)
            {
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18]);
            }
            else
            {
               if(int([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               KGAMECLASS.kGAMECLASS.player.dynStats([DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][0],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][1],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][2],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][3],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][4],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][5],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][6],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][7],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][8],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][9],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][10],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][11],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][12],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][13],[DynStat
               .Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][14],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][15],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][16],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][17],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][18],[DynStat.Spe(-2),DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(4)][19]);
            }
            _loc2_ = true;
         }
         if(_loc1_.get_pregnancyIncubation() == 72)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               output.text("<b>你梦见了水，梦见了波浪下的生活，那里凉爽湿润，你是自由的。你现在尽可能多地在河里度过，你肚子里的宝宝不耐烦地踢腿和蠕动，渴望摆脱子宫的束缚，在更深的水域里游泳和玩耍。伊兹玛毫不掩饰她的喜悦，并告诉你，你很快就要生产了。</b>[pg]");
            }
            else
            {
               output.text("<b>你梦见了水，梦见了波浪下的生活，那里凉爽湿润，你是自由的。你现在尽可能多地在河里度过，你肚子里的宝宝不耐烦地踢腿和蠕动，渴望摆脱子宫的束缚，在更深的水域里游泳和玩耍。生产的时间可能很快就要到了。</b>[pg]");
            }
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
               output.text("<b>你意识到你的乳房感觉很饱满，偶尔还会分泌乳汁</b>。这一定是因为怀孕了。[pg]");
               _loc1_.boostLactation(1);
               _loc2_ = true;
            }
            if(_loc1_.biggestTitSize() == 2 && _loc1_.mostBreastsPerRow() > 1)
            {
               output.text("<b>你的乳房已经肿胀到了C罩杯，</b>这是为了迎接你即将到来的怀孕。[pg]");
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
         output.text("[pg]");
         return _loc2_;
      }
   }
}

